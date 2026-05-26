;
; Serial monitor code and disk routines modified from Donn Stewart's orginal code
; by Jukka Savolainen
;

;
; Z80 PATA/IDE Disk Boot ROM for TA Alphatronics PC version 1.0
; by Jukka Savolainen, April 2026
;
; To be used in the ROM Pack 1 slot, which is mapped at 0A000H
; 
; The ROM bootstrap code here copies the boot loader image from ROM to RAM and then jumps to it.
;
; The boot loader image is stored in this ROM immediately after the bootstrap code. 
;
; The code uses bit 0 of IN 10H to check the existence of disks. However, it is the same
; method as used with the TA Alphatronics native floppy controller. If you have a floppy 
; controller installed, this code tries to boot, but fails as it supports only PATA/IDE disks.
;
; NOTE: The system will be in all-RAM mode once this boot code is executed
;
; The first bytes of the boot sector is expected to be:
; 	JP xxxxH		| the first byte must be 0C3h
; 	xxxx			| address where the boot sector code wants to get loaded to
; 	xxxxxx...0		| a null-terminated string to be displayed to the user

; TA Alphatronic PC specific definitions

			INCLUDE "ta-alpha.inc"

ROM_START:	equ EXT_ROM_1				;ROM_1 start address in TA Alphatronic PC memory map (ROM_2 = 0C000H)
RAM_START:	equ BOOT_RAM				;start address in RAM in TA Alphatronic PC memory map
BOOT_SIZE:	equ (BOOT_END - RAM_START)	;size of OS boot loader image 
MONI_ROM:	equ (BOOT_ROM + BOOT_SIZE)	;monitor code start address in ROM, immediately after the boot loader image
MONI_SIZE:	equ (MONI_END - RAM_START)	;size of monitor code
BOOT_STACK:	equ	(RAM_START + 0FFFH)		;stack placed at the end of the used RAM block


;------------------------------------------
; Copy the boot loader or monitor to RAM
;------------------------------------------

			ORG	ROM_START
			jp	BOOT_MODE				;first 3 bytes in ROM must be a jump

BOOT_MODE:	ld	sp,BOOT_STACK
			call rom_delay_2s
			ld	hl,msg_boot
			call rom_prmsg
			call bios_conin				;read the key
			cp	1Bh						;was it <ESC>?
			jp	z,MON_LOAD				;yes - boot to monitor
										;no - boot to OS loader		
ROM_LOAD:	; Copy bootloader code from ROM to RAM
			ld	hl,msg_erase
			call rom_prmsg
			ld	hl,BOOT_ROM
			ld	de,RAM_START
			ld	bc,BOOT_SIZE
			ldir
			jp	RAM_START

MON_LOAD:	; Copy monitor code from ROM to RAM
			ld	hl,msg_sermon
			call rom_prmsg
			ld	hl,MONI_ROM
			ld	de,RAM_START
			ld	bc,MONI_SIZE
			ldir
			jp	RAM_START

rom_prmsg:
		ld	a,(hl)
		and	a				;check for null terminator
		ret	z				;yes, return
		ld	c,a
		call	bios_conout	;output character
		inc	hl
		jp	rom_prmsg

rom_delay_2s:
		push	bc
		push	af
		ld	b,60		;outer loop count
rom_delay_outer:
		ld	c,80		;inner loop count
rom_delay_inner:
		ld	a,100		;innermost countdown
rom_delay_count:
		dec	a
		jr	nz,rom_delay_count
		dec	c
		jr	nz,rom_delay_inner
		djnz	rom_delay_outer
		pop	af
		pop	bc
		ret

msg_boot:	defm	1bh,53h,31h		;switch to 80-column mode in TA Alphatronic PC
			defm	"IDE Disk OS Boot Loader ROM v.1.0 for TA Alphatronic PC",0dh,0ah
			defm	"Press <ESC> for serial monitor or any other key to continue",0
msg_erase:	defm	0dh,1bh,41h,1bh,46h,0	;erase the current line
msg_sermon:	defm	0dh,0ah,0dh,0ah,"Jumping to serial monitor. Connect serial terminal to continue.",0dh,0ah
			defm	"Use the monitor commands to reboot or press reset button when done.",0dh,0ah
			defm	"The serial port has been initialized to 9600-N-8-1. Use null-modem cable.",0dh,0ah,0
BOOT_ROM:	; must be in ROM address space


;============================================================================================================
; OS Boot Loader Code
;============================================================================================================

;----------------------------------------------------------
; Disk Boot Loader Program
; 
; Retrieves OS boot code from disk and loads it into memory
; to the address specified in the boot sector, then jumps to it for cold start 
; Reads track 0, sector 0
;----------------------------------------------------------

;----------------------------------------------------------
; Setting up the scene
;----------------------------------------------------------
		ORG RAM_START			;loader program starts here in RAM

		jp start

		;jump table in case the OS loader wants to use the subroutines here
		;to save space in the loader as it has to fit in 128 bytes, assuming
		;the current disk configuration (boot code in track 0, sector 0) is used
		jp read
		jp delay_2s	
		jp prmsg

		;parameters for the disk_read calls, accessible from the OS loader code
sector:		dw	0000h
track:		dw	0000h
dmaad:		dw	0000h
diskno:     db	00h

;----------------------------------------------------------
; Main code starts here
;----------------------------------------------------------

start:	ld sp,stack				;local stack

		;initialize TA Alphatronic PC hardware to prepare for loading OS boot code from disk

		call delay_2s			;this seems to make the boot process more reliable

    	ld a,(ta_ctrl_stat1)	;read system flag
		set 7,a             	;set bit 7 to switch to all-RAM mode
        out	(ta_ctrl_port1),a	;set the new configuration to control port
        ld	(ta_ctrl_stat1),a   ;store updated system flag

;----------------------------------------------------------
; Intialize the serial port to the more usual 9600-N-8-1
; instead of the native setting of 9600-E-7-2. This could
; be left for the OS and/or applications to worry about,
; but it is more convenient to have it set up already now
;----------------------------------------------------------

		ld hl,msg_init
		call prmsg				;print message about serial port initialization

		INCLUDE "uartinit.inc"	;initialize the serial port

		ld	hl,msg_done
		call prmsg				;print message about serial port initialization done

;----------------------------------------------------------
; Check for presence of disk controller. Note that the
; TA Alphatronic PC built-in floppy controller uses the same
; method for notifying for disk presence, so if you have a floppy
; controller installed, this code will try to boot but fails
; as it supports only PATA/IDE disks.
;----------------------------------------------------------

		in	a,(ta_ctrl_port1)	;read system flags
		bit	0,a					;check bit 0 to see if disk is present	
		jp	z,no_dsk			;if no disk, jump to message and infinite loop


;----------------------------------------------------------
; Let the user decide which disk to boot from
;----------------------------------------------------------
		ld	hl,msg_drive
		call prmsg				;print message to ask for the boot drive

disk_sel:
		call bios_conin			;get drive selection from user
		cp	0dh					;check if user pressed <enter>
		jp	nz,disk_chk			;nope - process the input character
		ld	a,'A'				;yes - default to drive A
disk_chk:
		and	11011111b			;map lowercase to uppercase
		cp	'A'
		jp	c,disk_sel			;ignore non-letter keys
		cp	'Z'+1
		jp	nc,disk_sel			;ignore non-letter keys
		ld	c,a					;valid drive letter in A-Z
		push af					;save drive letter for later use
		call bios_conout		;echo selected drive in uppercase
		pop	af					;restore drive letter
		sub	'A'					;drive index in A: A=0, B=1, ...
		ld	(diskno),a			;store drive index for disk read calls

		ld	hl,msg_osb
		call prmsg				;print message about reading OS boot code from disk

;----------------------------------------------------------
; Proceed to load disk OS boot code from track 0, sector 0 to memory
;----------------------------------------------------------
		; diskno is already set from the drive selection above
		ld	bc,0				
		ld	(sector),bc			;starting sector 0
		ld	(track),bc			;starting track 0
		ld	hl,tmpbuf			;memory address to place image
		ld	(dmaad),hl
rd_trk_0_loop:
        call read
		jp	z,rd_ok
		ld	c,'?'
		call bios_conout	;print error character if disk read fails
		jp	rd_trk_0_loop	;try reading the same sector again until successful
rd_ok:	ld	c,'.'
		call bios_conout	;print dot to show progress
		ld	hl,msg_done
		call prmsg			;print message about OS loader loading done

;----------------------------------------------------------
; Check that the boot sector is valid and display the label from the boot sector
;----------------------------------------------------------

		ld	hl,tmpbuf		;address where the boot sector code is now in memory
		ld	a,(hl)			;check that the first byte is a JP instruction
		cp	0C3h
		jp	nz,no_bot		;if not, assume no boot sector and jump to message and infinite loop

		ld	hl,msg_label
		call prmsg			;print the message about the boot sector
		ld	hl,tmpbuf		;address where the boot sector code is now in memory
		inc	hl
		inc	hl
		inc	hl				
		ld	e,(hl)			;get the address where the boot sector code wants to be loaded to
		inc	hl
		ld	d,(hl)			;address is now in DE
		inc	hl				;points now to the null-terminated string to be displayed to the user
		call prmsg			;print the OS label
		ld	hl,msg_crlf
		call prmsg			;print CRLF after the label

;----------------------------------------------------------
; copy the boot sector code from the temporary buffer to the address specified in the boot sector
;----------------------------------------------------------	
		ld	hl,tmpbuf		;source address of boot sector code
		push de				;DE is already set to the destination address from the boot sector, save it
		ld	bc,128			;size of boot sector code to copy in bytes
		ldir
done:	
		ld	hl,msg_jump
		call prmsg			;print message about jumping to OS boot code
		call delay_2s		;brief pause before handing control to OS loader
		call delay_2s		;brief pause before handing control to OS loader
		pop	hl				;get the destination address that was in DE back to HL for the jump
		jp	(hl)			;OS loader has been loaded to memory so jump there for cold start

no_dsk:	ld	hl,msg_no_dsk
		call prmsg
		halt				;repeat nop until interrupt

no_bot:	ld	hl,msg_no_bot
		call prmsg
		halt				;repeat nop until interrupt

;----------------------------------------------------------
; Approximate 2 second busy-wait delay (calibrate if needed)
; Preserves BC and AF across the call
; Adjust loop counts for different CPU speeds
;----------------------------------------------------------
delay_2s:
		push	bc
		push	af
		ld	b,60		;outer loop count
delay_outer:
		ld	c,80		;inner loop count
delay_inner:
		ld	a,100		;innermost countdown
delay_count:
		dec	a
		jr	nz,delay_count
		dec	c
		jr	nz,delay_inner
		djnz	delay_outer
		pop	af
		pop	bc
		ret

;----------------------------------------------------------
; Subroutine to print a null-terminated string
; Expects HL to point to the string, and uses BIOS conout to print characters
;----------------------------------------------------------

prmsg:	ld	a,(hl)
		and	a				;check for null terminator
		ret	z				;yes, return
		ld	c,a
		call	bios_conout	;output character
		inc	hl
		jp	prmsg

;----------------------------------------------------------
;	DISK I/O SUBROUTINES
;----------------------------------------------------------
;
			INCLUDE "ta-alpha-ide-disk-io-8M.inc"			

msg_init:	defm	"Initializing serial port to 9600-N-8-1 ...",0
msg_drive:	defm	"Select the boot drive (<ENTER> for default): A",08h,0
msg_osb:	defm	0dh,0ah,"Reading OS loader from boot sector ",0
msg_label:	defm	0dh,0ah,"Boot sector label: ",0
msg_jump:	defm	"Jumping to OS boot code ",0dh,0ah,0dh,0ah,0
msg_done:	defm	" done",0dh,0ah,0
msg_no_dsk:	defm	0dh,0ah,"IDE/PATA controller not present - system halted.",0dh,0ah,0
msg_no_bot:	defm	0dh,0ah,"OS loader not found or invalid - system halted.",0dh,0ah,0
msg_crlf:	defm	0dh,0ah,0
hstbuf: 	ds 512	;buffer to hold raw sector read from disk
tmpbuf:		ds 512	;temporary buffer for disk read operations
			ds 32	;local stack space
stack:		equ $-1
BOOT_END:	equ	$



;============================================================================================================
; Serial Monitor Code
;============================================================================================================

;
; RAM serial monitor program for TA Alphatronic PC with IDE expansion
; February 2026, Jukka Savolainen
; 
; Written to be used in the ROM card slot as ROM_1 and using the Alpha's own boot sequence.

; Adapted from the original ROM monitor by Donn Stewart.
; - changed memory and port mapping for TA Alphatronic PC
; - modified the disk read/write subroutines to use the same lba calculation method as in CBIOS
; - modified the initialization code by adding a visual indicator (LED on front panel)
; - replaced some of the serial port code with code from TA Almanach '85/86 terminal program
; - converted some of the directly coded port addresses to equates for easier modification


			ORG	RAM_START
begin_code:							;for calculating size of monitor code	
			jp 	monitor_cold_start	; 09000h
			jp	monitor_warm_start	; 09003h				

;
;Subroutine to initialize serial port UART
;Needs to be called only once after computer comes out of reset.
;If called while port is active will cause port to fail.
;16x = 9600 baud

initialize_port:
			
			INCLUDE "uartinit.inc"		;initialize the serial port
			ret
;
;Puts a single char (byte value) on serial output
;Call with char to send in A register. Uses B register
write_char:	ld	b,a						;store char
write_char_loop: in	a,(uart_ctrl_port)	;check if OK to send
			and	001h					;check TxRDY bit
			jp 	z,write_char_loop		;loop if not set
			ld 	a,b						;get char back
			out (uart_data_port),a		;send to output
			ret							;returns with char in a
;
;Subroutine to write a zero-terminated string to serial output
;Pass address of string in HL register
;No error checking
write_string: in a,(uart_ctrl_port)		;read status
			and 001h					;check TxRDY bit
			jp 	z,write_string			;loop if not set
			ld 	a,(hl)					;get char from string
			and a						;check if 0
			ret z						;yes, finished
			out (uart_data_port),a		;no, write char to output
			inc hl						;next char in string
			jp 	write_string			;start over
;
;Binary loader. Receive a binary file, place in memory.
;Address of load passed in HL, length of load (= file length) in BC
bload:		in 	a,(uart_ctrl_port)		;get status
			and 002h					;check RxRDY bit
			jp 	z,bload					;not ready, loop
			in	a,(uart_data_port)
			ld	(hl),a
			inc	hl
			dec	bc						;byte counter
			ld	a,b						;need to test BC this way because
			or	c						;dec rp instruction does not change flags
			jp	nz,bload
			ret
;
;Binary dump to port. Send a stream of binary data from memory to serial output
;Address of dump passed in HL, length of dump in BC
bdump:		in 	a,(uart_ctrl_port)		;get status
			and 	001h				;check TxRDY bit
			jp 	z,bdump					;not ready, loop
			ld	a,(hl)
			out	(uart_data_port),a
			inc	hl
			dec	bc
			ld	a,b						;need to test this way because
			or	c						;dec rp instruction does not change flags
			jp	nz,bdump
			ret
;
;Subroutine to get a string from serial input, place in buffer.
;Buffer address passed in HL reg.
;Uses A,BC,DE,HL registers (including calls to other subroutines).
;Line entry ends by hitting return key. Return char not included in string (replaced by zero).
;Backspace editing OK. No error checking.
;
get_line:	ld	c,000h					;line position
			ld	a,h						;put original buffer address in de
			ld	d,a						;after this don't need to preserve hl
			ld	a,l						;subroutines called don't use de
			ld	e,a
get_line_next_char:	in a,(uart_ctrl_port)	;get status
			and 002h					;check RxRDY bit
			jp 	z,get_line_next_char	;not ready, loop
			in 	a,(uart_data_port)		;get char
			cp	00dh					;check if return
			ret	z						;yes, normal exit
			cp	07fh					;check if backspace (VT102 keys)
			jp	z,get_line_backspace	;yes, jump to backspace routine
			cp	008h					;check if backspace (ANSI keys)
			jp	z,get_line_backspace	;yes, jump to backspace
			call	write_char			;put char on screen
			ld	(de),a					;store char in buffer
			inc	de						;point to next space in buffer
			inc	c						;inc counter
			ld	a,000h
			ld	(de),a					;leaves a zero-terminated string in buffer
			jp	get_line_next_char
get_line_backspace:	ld a,c				;check current position in line
			cp	000h					;at beginning of line?
			jp	z,get_line_next_char	;yes, ignore backspace, get next char
			dec	de						;no, erase char from buffer
			dec	c						;back up one
			ld	a,000h					;put a zero in buffer where the last char was
			ld	(de),a
			ld	hl,erase_char_string	;ANSI sequence to delete one char from line
			call	write_string		;transmits sequence to backspace and erase char
			jp	get_line_next_char	

;Creates a two-char hex string from the byte value passed in register A
;Location to place string passed in HL
;String is zero-terminated, stored in 3 locations starting at HL
;Also uses registers b,d, and e
byte_to_hex_string:	ld	b,a			;store original byte
			srl	a					;shift right 4 times, putting
			srl	a					;high nybble in low-nybble spot
			srl	a					;and zeros in high-nybble spot
			srl	a
			ld	d,000h				;prepare for 16-bit addition
			ld	e,a					;de contains offset
			push	hl				;temporarily store string target address
			ld	hl,hex_char_table	;use char table to get high-nybble character
			add	hl,de				;add offset to start of table
			ld	a,(hl)				;get char
			pop	hl					;get string target address
			ld	(hl),a				;store first char of string
			inc	hl					;point to next string target address
			ld	a,b					;get original byte back from reg b
			and	00fh				;mask off high-nybble
			ld	e,a					;d still has 000h, now de has offset
			push	hl				;temp store string target address
			ld	hl,hex_char_table	;start of table
			add	hl,de				;add offset
			ld	a,(hl)				;get char
			pop	hl					;get string target address
			ld	(hl),a				;store second char of string
			inc	hl					;point to third location
			ld	a,000h				;zero to terminate string
			ld	(hl),a				;store the zero
			ret						;done
;
;Converts a single ASCII hex char to a nybble value
;Pass char in reg A. Letter numerals must be upper case.
;Return nybble value in low-order reg A with zeros in high-order nybble if no error.
;Return 0ffh in reg A if error (char not a valid hex numeral).
;Also uses b, c, and hl registers.
hex_char_to_nybble:	ld	hl,hex_char_table
			ld	b,00fh				;no. of valid characters in table - 1.
			ld	c,000h				;will be nybble value
hex_to_nybble_loop:	cp	(hl)		;character match here?
			jp	z,hex_to_nybble_ok	;match found, exit
			dec	b					;no match, check if at end of table
			jp	m,hex_to_nybble_err	;table limit exceded, exit with error
			inc	c					;still inside table, continue search
			inc	hl
			jp	hex_to_nybble_loop
hex_to_nybble_ok:	ld	a,c			;put nybble value in a
			ret
hex_to_nybble_err:	ld	a,0ffh		;error value
			ret
;
;Converts a hex character pair to a byte value
;Called with location of high-order char in HL
;If no error carry flag clear, returns with byte value in register A, and
;HL pointing to next mem location after char pair.
;If error (non-hex char) carry flag set, HL pointing to invalid char
hex_to_byte:		ld	a,(hl)			;location of character pair
			push	hl				;store hl (hex_char_to_nybble uses it)
			call	hex_char_to_nybble
			pop	hl					;returns with nybble value in a reg, or 0ffh if error
			cp	0ffh				;non-hex character?
			jp	z,hex_to_byte_err	;yes, exit with error
			sla	a					;no, move low order nybble to high side
			sla	a
			sla	a
			sla	a
			ld	d,a					;store high-nybble
			inc	hl					;get next character of the pair
			ld	a,(hl)
			push	hl				;store hl
			call	hex_char_to_nybble
			pop	hl
			cp	0ffh				;non-hex character?
			jp	z,hex_to_byte_err	;yes, exit with error
			or	d					;no, combine with high-nybble
			inc	hl					;point to next memory location after char pair
			scf
			ccf						;no-error exit (carry = 0)
			ret
hex_to_byte_err:	scf				;error, carry flag set
			ret
hex_char_table:		defm	"0123456789ABCDEF"	;ASCII hex table
;
;Subroutine to get a two-byte address from serial input.
;Returns with address value in HL
;Uses locations in RAM for buffer and variables
address_entry:		ld	hl,buffer		;location for entered string
			call	get_line			;returns with address string in buffer
			ld	hl,buffer				;location of stored address entry string
			call	hex_to_byte			;will get high-order byte first
			jp	c, address_entry_error	;if error, jump
			ld	(current_location+1),a	;store high-order byte, little-endian
			ld	hl,buffer+2				;point to low-order hex char pair
			call	hex_to_byte			;get low-order byte
			jp	c, address_entry_error	;jump if error
			ld	(current_location),a	;store low-order byte in lower memory
			ld	hl,(current_location)	;put memory address in hl
			ret
address_entry_error:	ld	hl,address_error_msg
			call	write_string
			jp	address_entry
;
;Subroutine to get a decimal string, return a word value
;Calls decimal_string_to_word subroutine
decimal_entry:		ld	hl,buffer
			call	get_line			;returns with DE pointing to terminating zero
			ld	hl,buffer
			call	decimal_string_to_word
			ret	nc						;no error, return with word in hl
			ld	hl,decimal_error_msg	;error, try again
			call	write_string
			jp	decimal_entry
;
;Subroutine to convert a decimal string to a word value
;Call with address of string in HL, pointer to end of string in DE
;Carry flag set if error (non-decimal char)
;Carry flag clear, word value in HL if no error.
decimal_string_to_word:	ld	b,d
			ld	c,e						;use BC as string pointer
			ld	(current_location),hl	;store addr. of start of buffer in RAM word variable
			ld	hl,000h					;starting value zero
			ld	(current_value),hl
			ld	hl,decimal_place_value	;pointer to values
			ld	(value_pointer),hl
decimal_next_char:	dec	bc				;next char in string (moving right to left)
			ld	hl,(current_location)	;check if at end of decimal string
			scf							;get ready to subtract de from buffer addr.
			ccf							;set carry to zero (clear)
			sbc	hl,bc					;keep going if bc > or = hl (buffer address)
			jp	c,decimal_continue		;borrow means bc > hl
			jp	z,decimal_continue		;z means bc = hl
			ld	hl,(current_value)		;return if de < buffer address (no borrow)
			scf							;get value back from RAM variable
			ccf
			ret							;return with carry clear, value in hl
decimal_continue:	ld	a,(bc)			;next char in string (right to left)
			sub	030h					;ASCII value of zero char
			jp	m,decimal_error			;error if char value less than 030h
			cp	00ah					;error if byte value > or = 10 decimal
			jp	p,decimal_error			;a reg now has value of decimal numeral
			ld	hl,(value_pointer)		;get value to add an put in de
			ld	e,(hl)					;little-endian (low byte in low memory)
			inc	hl
			ld	d,(hl)
			inc	hl						;hl now points to next value
			ld	(value_pointer),hl
			ld	hl,(current_value)		;get back current value
decimal_add:		dec	a				;add loop to increase total value
			jp	m,decimal_add_done		;end of multiplication
			add	hl,de
			jp	decimal_add
decimal_add_done:	ld	(current_value),hl
			jp	decimal_next_char
decimal_error:		scf
			ret
			jp	decimal_add
decimal_place_value:	defw	1,10,100,1000,10000
;
;Memory dump
;Displays a 256-byte block of memory in 16-byte rows.
;Called with address of start of block in HL
memory_dump:		ld	(current_location),hl	;store address of block to be displayed
			ld	a,000h
			ld	(byte_count),a			;initialize byte count
			ld	(line_count),a			;initialize line count
			jp	dump_new_line
dump_next_byte:		ld	hl,(current_location)	;get byte address from storage,
			ld	a,(hl)					;get byte to be converted to string
			inc	hl						;increment address and
			ld	(current_location),hl	;store back
			ld	hl,buffer				;location to store string
			call	byte_to_hex_string	;convert
			ld	hl,buffer				;display string
			call	write_string
			ld	a,(byte_count)			;next byte
			inc	a
			jp	z,dump_done				;stop when 256 bytes displayed
			ld	(byte_count),a			;not finished yet, store
			ld	a,(line_count)			;end of line (16 characters)?
			cp	00fh					;yes, start new line
			jp	z,dump_new_line
			inc	a						;no, increment line count
			ld	(line_count),a
			ld	a,020h					;print space
			call	write_char
			jp	dump_next_byte			;continue
dump_new_line:		ld	a,000h			;reset line count to zero
			ld	(line_count),a			
			call	write_newline
			ld	hl,(current_location)	;location of start of line
			ld	a,h						;high byte of address
			ld	hl, buffer
			call	byte_to_hex_string	;convert
			ld	hl,buffer
			call	write_string		;write high byte
			ld	hl,(current_location)
			ld	a,l						;low byte of address
			ld	hl, buffer
			call	byte_to_hex_string	;convert
			ld	hl,buffer
			call	write_string		;write low byte
			ld	a,020h					;space
			call	write_char
			jp	dump_next_byte			;now write 16 bytes
dump_done:		ld	a,000h
			ld	hl,buffer
			ld	(hl),a					;clear buffer of last string
			call	write_newline
			ret
;
;Memory load
;Loads RAM memory with bytes entered as hex characters
;Called with address to start loading in HL
;Displays entered data in 16-byte rows.
memory_load:		ld	(current_location),hl
			ld	hl,data_entry_msg
			call	write_string
			jp	load_new_line
load_next_char:		call	get_char
			cp	00dh					;return?
			jp	z,load_done				;yes, quit
			ld	(buffer),a
			call	get_char
			cp	00dh					;return?
			jp	z,load_done				;yes, quit
			ld	(buffer+1),a
			ld	hl,buffer
			call	hex_to_byte
			jp	c,load_data_entry_error	;non-hex character
			ld	hl,(current_location)	;get byte address from storage,
			ld	(hl),a					;store byte
			inc	hl						;increment address and
			ld	(current_location),hl	;store back
			ld	a,(buffer)
			call	write_char
			ld	a,(buffer+1)
			call	write_char
			ld	a,(line_count)			;end of line (16 characters)?
			cp	00fh					;yes, start new line
			jp	z,load_new_line
			inc	a						;no, increment line count
			ld	(line_count),a
			ld	a,020h					;print space
			call	write_char
			jp	load_next_char			;continue
load_new_line:		ld	a,000h			;reset line count to zero
			ld	(line_count),a
			call	write_newline
			jp	load_next_char			;continue
load_data_entry_error:	call	write_newline
			ld	hl,data_error_msg
			call	write_string
			ret
load_done:		call	write_newline
			ret
;
;Get one ASCII character from the serial port.
;Returns with char in A reg. No error checking.
get_char:	in 	a,(uart_ctrl_port)		;get status
			and 002h					;check RxRDY bit
			jp 	z,get_char				;not ready, loop
			in 	a,(uart_data_port)		;get char
			ret
;
;Subroutine to start a new line
write_newline: ld a,00dh				;ASCII carriage return character
			call write_char
			ld	a,00ah					;new line (line feed) character
			call write_char
			ret
;
;Subroutine to read one disk sector (256 bytes)
;Address to place data passed in HL
;LBA bits 0 to 7 passed in C, bits 8 to 15 passed in B
;LBA bits 16 to 23 passed in E
;
;
disk_read:
rd_status_loop_1:in	a,(pata_stat)		;check status
			and	80h						;check BSY bit
			jp	nz,rd_status_loop_1		;loop until not busy
rd_status_loop_2:	in	a,(pata_stat)	;check	status
			and	40h						;check DRDY bit
			jp	z,rd_status_loop_2		;loop until ready
			ld	a,01h					;number of sectors = 1
			out	(pata_secco),a			;sector count register
			ld	a,c						;CP/M sector (0 to 63, 6 bits)
			out	(pata_lba0),a			;lba bits 0 - 7
			ld	a,b
			out	(pata_lba1),a			;lba bits 8 - 15
			ld	a,e
			out	(pata_lba2),a			;lba bits 16 - 23
			ld	a,11100000b				;LBA mode, select drive 0
			out	(pata_lba3),a			;drive/head register
			ld	a,20h					;Read sector command
			out	(pata_cmd),a
rd_wait_for_DRQ_set:in	a,(pata_stat)	;read status
			and	08h						;DRQ bit
			jp	z,rd_wait_for_DRQ_set	;loop until bit set
rd_wait_for_BSY_clear:	in	a,(pata_stat)
			and	80h
			jp	nz,rd_wait_for_BSY_clear
			in	a,(pata_stat)			;clear INTRQ
read_loop:	in	a,(pata_data)			;get data
			ld	(hl),a
			inc	hl
			in	a,(pata_stat)			;check status
			and	08h						;DRQ bit
			jp	nz,read_loop			;loop until cleared
			ret
;
;Subroutine to write one disk sector (256 bytes)
;Address of data to write to disk passed in HL
;LBA bits 0 to 7 passed in C, bits 8 to 15 passed in B
;LBA bits 16 to 23 passed in E
;
;Modified to match the code used in CBIOS for TA Alphatronic PC i.e 2M disks
;

disk_write:
wr_status_loop_1:in	a,(pata_stat)		;check status
			and	80h						;check BSY bit
			jp	nz,wr_status_loop_1		;loop until not busy
wr_status_loop_2:	in a,(pata_stat)	;check	status
			and	40h						;check DRDY bit
			jp	z,wr_status_loop_2		;loop until ready
			ld	a,01h					;number of sectors = 1
			out	(pata_secco),a			;sector count register
			ld	a,c						;CP/M sector (0 to 63, 6 bits)
			out	(pata_lba0),a			;lba bits 0 - 7
			ld	a,b
			out	(pata_lba1),a			;lba bits 8 - 15
			ld	a,e
			out	(pata_lba2),a			;lba bits 16 - 23
			ld	a,11100000b				;LBA mode, select drive 0
			out	(pata_lba3),a			;drive/head register
			ld	a,30h					;Write sector command
			out	(pata_cmd),a
wr_wait_for_DRQ_set:	in a,(pata_stat)		;read status
			and	08h		;DRQ bit
			jp	z,wr_wait_for_DRQ_set	;loop until bit set			
write_loop:	ld	a,(hl)
			out	(pata_data),a		;write data
			inc	hl
			in	a,(pata_stat)		;read status
			and	08h		;check DRQ bit
			jp	nz,write_loop	;write until bit cleared
wr_wait_for_BSY_clear:	in a,(pata_stat)
			and	80h
			jp	nz,wr_wait_for_BSY_clear
			in	a,(pata_stat)		;clear INTRQ
			ret
;
;Strings used in subroutines
length_entry_string:	defm	"Enter length of file to load (decimal): ",0
dump_entry_string:	defm	"Enter no. of bytes to dump (decimal): ",0
LBA_entry_string:	defm	"Enter LBA (decimal, 0 to 65535): ",0
erase_char_string:	defm	008h,01bh,"[K",000h	;ANSI sequence for backspace, erase to end of line.
address_entry_msg:	defm	"Enter 4-digit hex address (use upper-case A through F): ",0
address_error_msg:	defm	"\r\nError: invalid hex character, try again: ",0
data_entry_msg:		defm	"Enter hex bytes, hit return when finished.\r\n",0
data_error_msg:		defm	"Error: invalid hex byte.\r\n",0
decimal_error_msg:	defm	"\r\nError: invalid decimal number, try again: ",0
;
;Simple monitor program for CPUville Z80 computer with serial interface.
monitor_cold_start:	
			ld	sp,monitor_stack
			call	initalize_host
			call	initialize_port
			ld	hl,monitor_message
			call	write_string
monitor_warm_start:	call	write_newline	;routine program return here to avoid re-initialization of port
			ld	a,03eh						;cursor symbol
			call	write_char
			ld	hl,buffer
			call	get_line				;get monitor input string (command)
			call	write_newline
			call	parse					;interprets command, returns with address to jump to in HL
			jp	(hl)
;
;Parses an input line stored in buffer for available commands as described in parse table.
;Returns with address of jump to action for the command in HL
parse:		ld	bc,parse_table				;bc is pointer to parse_table
parse_start:ld	a,(bc)						;get pointer to match string from parse table
			ld	e,a
			inc	bc
			ld	a,(bc)			
			ld	d,a							;de will is pointer to strings for matching
			ld	a,(de)						;get first char from match string
			or	000h						;zero?
			jp	z,parser_exit				;yes, exit no_match
			ld	hl,buffer					;no, parse input string 
match_loop:		cp	(hl)					;compare buffer char with match string char
			jp	nz,no_match					;no match, go to next match string
			or	000h						;end of strings (zero)?
			jp	z,parser_exit				;yes, matching string found
			inc	de							;match so far, point to next char in match string
			ld	a,(de)						;get next character from match string
			inc	hl							;and point to next char in input string
			jp	match_loop					;check for match
no_match:		inc	bc						;skip over jump target to
			inc	bc
			inc	bc							;get address of next matching string
			jp	parse_start
parser_exit:		inc	bc					;skip to address of jump for match
			ld	a,(bc)
			ld	l,a
			inc	bc
			ld	a,(bc)
			ld	h,a							;returns with jump address in hl
			ret
;
;Actions to be taken on match
;
;Memory dump program
;Input 4-digit hexadecimal address
;Calls memory_dump subroutine
dump_jump:	ld	hl,dump_message				;Display greeting
			call	write_string
			ld	hl,address_entry_msg		;get ready to get address
			call	write_string
			call	address_entry			;returns with address in HL
			call	write_newline
			call	memory_dump
			jp	monitor_warm_start
;
;Hex loader, displays formatted input
load_jump:	ld	hl,load_message				;Display greeting
			call	write_string			;get address to load
			ld	hl,address_entry_msg		;get ready to get address
			call	write_string
			call	address_entry
			call	write_newline
			call	memory_load
			jp	monitor_warm_start
;
;Jump and run do the same thing: get an address and jump to it.
run_jump:	ld	hl,run_message				;Display greeting
			call	write_string
			ld	hl,address_entry_msg		;get ready to get address
			call	write_string
			call	address_entry
			jp	(hl)
;
;Help and ? do the same thing, display the available commands
help_jump:	ld	hl,help_message
			call	write_string
			ld	bc,parse_table				;table with pointers to command strings
help_loop:	ld	a,(bc)						;displays the strings for matching commands,
			ld	l,a							;getting the string addresses from the
			inc	bc							;parse table
			ld	a,(bc)						;pass address of string to hl through a reg
			ld	h,a
			ld	a,(hl)						;hl now points to start of match string
			or	000h						;exit if no_match string
			jp	z,help_done
			push	bc						;write_char uses b register
			ld	a,020h						;space char
			call	write_char
			pop	bc
			call	write_string			;writes match string
			inc	bc							;pass over jump address in table
			inc	bc
			inc	bc
			jp	help_loop
help_done:	jp	monitor_warm_start
;
;Binary file load. Need both address to load and length of file
bload_jump:	ld	hl,bload_message
			call	write_string
			ld	hl,address_entry_msg
			call	write_string
			call	address_entry
			call	write_newline
			push	hl
			ld	hl,length_entry_string
			call	write_string
			call	decimal_entry
			ld	b,h
			ld	c,l
			ld	hl,bload_ready_message
			call	write_string
			pop	hl
			call	bload
			jp	monitor_warm_start
;
;Binary memory dump. Need address of start of dump and no. bytes
bdump_jump:	ld	hl,bdump_message
			call	write_string
			ld	hl,address_entry_msg
			call	write_string
			call	address_entry
			call	write_newline
			push	hl
			ld	hl,dump_entry_string
			call	write_string
			call	decimal_entry
			ld	b,h
			ld	c,l
			ld	hl,bdump_ready_message
			call	write_string
			call	get_char
			pop	hl
			call	bdump
			jp	monitor_warm_start
;Disk read. Need memory address to place data, LBA of sector to read
diskrd_jump:ld	hl,diskrd_message
			call	write_string
			ld	hl,address_entry_msg
			call	write_string
			call	address_entry
			call	write_newline
			push	hl
			ld	hl,LBA_entry_string
			call	write_string
			call	decimal_entry


			ld	b,h
			ld	c,l
			ld	e,00h
			pop	hl
			call	disk_read
			jp	monitor_warm_start
diskwr_jump:ld	hl,diskwr_message
			call	write_string
			ld	hl,address_entry_msg
			call	write_string
			call	address_entry
			call	write_newline
			push	hl
			ld	hl,LBA_entry_string
			call	write_string
			call	decimal_entry
			ld	b,h
			ld	c,l
			ld	e,00h
			pop	hl
			call	disk_write
			jp	monitor_warm_start
cpm_jump:	ld	hl,0800h
			ld	bc,0000h
			ld	e,00h
			call	disk_read
			jp	0800h
;Prints message for no match to entered command
no_match_jump:		ld	hl,no_match_message
			call	write_string
			ld	hl, buffer
			call	write_string
			jp	monitor_warm_start

initalize_host:
			ld	a, (ta_ctrl_stat2)	;read current status of the control register
			set	4,a					;turn graphics led on for debugging
			out (ta_ctrl_port2),a	;execute the change
			ld (ta_ctrl_stat2),a	;store the new status
			
			ld	a, (ta_ctrl_stat1)	;read current status of the control register
			set	7,a					;switch to all RAM mode
			out	(ta_ctrl_port1),a	;execute the change
			ld	(ta_ctrl_stat1),a	;store the new status

			ret
;
;Monitor data structures:
;
monitor_message: 		defm	"\r\nROM ver. 8.a for TA Alphatronics\r\n",0
no_match_message:		defm	"? ",0
help_message:			defm	"Commands implemented:\r\n",0
dump_message:			defm	"Displays a 256-byte block of memory.\r\n",0
load_message:			defm	"Enter hex bytes starting at memory location.\r\n",0
run_message:			defm	"Will jump to (execute) program at address entered.\r\n",0
bload_message:			defm	"Loads a binary file into memory.\r\n",0
bload_ready_message:	defm	"\n\rReady to receive, start transfer.",0
bdump_message:			defm	"Dumps binary data from memory to serial port.\r\n",0
bdump_ready_message:	defm	"\n\rReady to send, hit any key to start.",0
diskrd_message:			defm	"Reads one sector from disk to memory.\r\n",0
diskwr_message:			defm	"Writes one sector from memory to disk.\r\n",0
diskfmt_message:		defm	"Formats PATA disk for CP/M.\r\n",0
;Strings for matching:
dump_string:			defm	"dump",0
load_string:			defm	"load",0
jump_string:			defm	"jump",0
run_string:				defm	"run",0
question_string:		defm	"?",0
help_string:			defm	"help",0
bload_string:			defm	"bload",0
bdump_string:			defm	"bdump",0
diskrd_string:			defm	"diskrd",0
diskwr_string:			defm	"diskwr",0
cpm_string:				defm	"cpm",0
no_match_string:		defm	0,0
;Table for matching strings to jumps
parse_table:		defw	dump_string,dump_jump,load_string,load_jump
			defw	jump_string,run_jump,run_string,run_jump
			defw	question_string,help_jump,help_string,help_jump
			defw	bload_string,bload_jump,bdump_string,bdump_jump
			defw	diskrd_string,diskrd_jump,diskwr_string,diskwr_jump
			defw	cpm_string,cpm_jump
			defw	no_match_string,no_match_jump

;The subroutines for the serial port use these variables in RAM:
current_location:	dw	0000h		;word variable in RAM
line_count:			db	00h			;byte variable in RAM
byte_count:			db	00h			;byte variable in RAM
value_pointer:		dw	0000h		;word variable in RAM
current_value:		dw	0000h		;word variable in RAM
buffer:				ds	256, 00h	;buffer in RAM
					ds	128, 00h	;stack in RAM
monitor_stack:		db	00h

MONI_END:	equ $					;monitor code ends here in ROM
			end