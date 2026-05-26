;
;
; CP/M 2.2 - CP/M Installer for TA Alphatronic PC with PATA/IDE interface
; by Jukka Savolainen, 2026-04
;
; Includes code for disk read/write written originally by Donn Stewart
;
; This program is intended to be loaded and run from the serial monitor of the TA Alphatronic PC.
;
;

			INCLUDE "ta-alpha.inc"

cpm: 		equ CPM_BASE		;CP/M loaded at this address in memory
cpmend:		equ BIOS_BASE - 1	;end address of CP/M image in memory

; CBIOS functions in memory
cbios		equ	CPM_COLD			;CP/M cold start entry in RAM
conout:		equ	(cbios + 0Ch)		;print a character
seldsk:		equ	(cbios + 1Bh)		;pass disk no. in c
settrk:		equ	(cbios + 1Eh)		;pass track in reg C
setsec:		equ	(cbios + 21h)		;pass sector in reg c
setdma:		equ	(cbios + 24h)		;pass address in bc
write:		equ	(cbios + 2Ah)		;write one CP/M sector to disk

; Serial monitor entry point
monitor_warm_start:	equ	BOOT_RAM + 3	;Return to RAM monitor

; ------------------------------------------------------------
; Main code starts here. Called from serial monitor.
; - Copies CP/M system from RAM to disk
; - Copies bootloader to track 0 sector 0
; -------------------------------------------------------------

            ORG 02000h
            
            ld (savestack), sp
            ld sp, stack

            ; Print title message
            ld hl, msg_title
            call write_string

            ; Copy the CCP/BDOS and CBIOS code to the right place in memory
            ld hl, msg_cpmcopy
            call write_string
            call cpmcopy

            ; Format the disk
            ld hl, msg_format
            call write_string
            call cpmformat

            ; Write the bootloader to track 0 sector 0
            ld hl, msg_putboot
            call write_string
            call putboot

            ; Write the CP/M system to track 0 sector 1 onwards
            ld hl, msg_putsys
            call write_string
            call putsys

            ; Copy PCGET.COM to memory at 0100h
            ld hl, msg_pcget
            call write_string
            call pcgetcopy

            ; Done, return to monitor
            ld hl, msg_done
            call write_string

            ld sp, (savestack)
            
            jp monitor_warm_start

; local variables
savestack:  dw  0000h
disk:       db	00h
sector:		db	00h
track:		db	00h
address:	dw	0000h

msg_title:	    defm	0dh,0ah,0dh,0ah,'TA Alphatronic PC - CP/M 2.2 Installer',0dh,0ah,0dh,0ah,0
msg_cpmcopy:    defm	'  Copying CP/M to memory...',0
msg_format:	    defm	'Done.',0dh,0ah,'  Formatting disks...',0
msg_putboot:    defm	'Done.',0dh,0ah,'  Writing bootloader to disk A:...',0
msg_putsys:	    defm	'Done.',0dh,0ah,'  Writing CP/M system to disk A:...',0
msg_pcget:	    defm	'Done.',0dh,0ah,'  Copying PCGET.COM to memory (0100h)...',0
msg_done:	    defm	'Done.',0dh,0ah,'  Returning to monitor...',0dh,0ah,0

; -------------------------------------------------------------
; WRITE_CHAR: Writes a single character directly to the serial port
; - Call with char to send in A register. Uses B register
; -------------------------------------------------------------

write_char:	ld	b,a						;store char
write_char_loop: in	a,(uart_ctrl_port)	;check if OK to send
			and	001h					;check TxRDY bit
			jp 	z,write_char_loop		;loop if not set
			ld 	a,b						;get char back
			out (uart_data_port),a		;send to output
			ret							;returns with char in a

; -------------------------------------------------------------
; WRITE_STRING: Writes a zero-terminated string to serial output
; - Pass address of string in HL register
; - No error checking
; -------------------------------------------------------------

write_string: in a,(uart_ctrl_port)		;read status
			and 001h					;check TxRDY bit
			jp 	z,write_string			;loop if not set
			ld 	a,(hl)					;get char from string
			and a						;check if 0
			ret z						;yes, finished
			out (uart_data_port),a		;no, write char to output
			inc hl						;next char in string
			jp 	write_string			;start over

; -------------------------------------------------------------
; CPMCOPY: Copies CP/M system to the right place in memory
; -------------------------------------------------------------

cpm_size:	equ cpmcode_end - cpmcode_start
cbios_size: equ cbioscode_end - cbioscode_start

cpmcopy:	ld	hl, cpmcode_start		;source address of CCP/BDOS image in memory
            ld	de, CPM_BASE		    ;destination address to copy to
            ld	bc, cpm_size		    ;number of bytes to copy
            ldir					    ;copy block of memory

            ld	hl, cbioscode_start		;source address of CBIOS image in memory
            ld	de, CBIOS_BASE		    ;destination address to copy to
            ld	bc, cbios_size		    ;number of bytes to copy
            ldir					    ;copy block of memory
    
            ret

; -------------------------------------------------------------
; PCGETCOPY: Copies PCGET.COM to the right place in memory
; -------------------------------------------------------------

pcget_size:	equ pcgetcode_end - pcgetcode_start

pcgetcopy:	ld	hl, pcgetcode_start		;source address of PCGET.COM in memory
            ld	de, 0100h		        ;destination address to copy to
            ld	bc, pcget_size		    ;number of bytes to copy
            ldir                        ;copy block of memory
            					    
            ret

; -------------------------------------------------------------
; CPMFORMAT: Formats the CP/M disk
; - Creates 4 disks; A: B: C: and D:
; - Disks have 63 sectors per track, 255 tracks, for a total of 16,065 sectors per disk
; - Writes E5h to all sectors of tracks 1, 2 and 3 to mark as empty
; - Uses CBIOS calls in memory 
; -------------------------------------------------------------
n_disks:	equ 4
n_sectors:	equ 63
n_tracks:	equ 3
char_count:	db	00h
directory_sector:

        db 0E5h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,00h,00h,00h,00h
		db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

		db 0E5h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,00h,00h,00h,00h
		db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

		db 0E5h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,00h,00h,00h,00h
		db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

		db 0E5h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,00h,00h,00h,00h
		db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h 

cpmformat:
		ld	a,00h		;starting disk
		ld	(disk),a
disk_loop:	ld	c,a		;CP/M disk a
		call	seldsk
		ld	a,1		;starting track (offset = 1)
		ld	(track),a
track_loop:	ld	a,0		;starting sector
		ld	(sector),a
		ld	hl,directory_sector	;address of data to write
		ld	(address),hl
		ld	a,(track)
		ld	c,a		;CP/M track
		call	settrk
sector_loop:	ld	a,(sector)
		ld	c,a		;CP/M sector
		call	setsec
		ld	bc,(address)	;memory location
		call	setdma
		call	write
		ld	a,(sector)
		cp	n_sectors
		jp	z,next_track
		inc	a
		ld	(sector),a
		jp	sector_loop
next_track:	ld	a,(track)
		cp	n_tracks
		jp	z,next_disk
		inc	a
		ld	(track),a
		ld	a,2eh		;period character
		call	write_char
		ld	a,(char_count)
		inc	a
		cp	80
		jp	z,skip_1
		ld	(char_count),a
		jp	track_loop
skip_1:	ld	a,0
		ld	(char_count),a
		ld	a,0dh
		call	write_char
		ld	a,0ah
		call	write_char
		jp	track_loop
next_disk:	ld	a,(disk)
		inc	a
		cp	n_disks
		jp	z,fmt_done
		ld	(disk),a
		jp	disk_loop
        
fmt_done:
        ret

; -------------------------------------------------------------
; PUTBOOT: Copies bootloader to track 0 sector 0
; - Writes track 0, sector 0 (reserved for cpm loader)
; - Bootloader image is assumed to be loaded at address 'osloader' in memory
; - Uses CBIOS calls in memory
; -------------------------------------------------------------
putboot:
    	;Write track 0, sector 0 from address 'osloader' in memory

		ld	c,00h			;CP/M disk A:
		call	seldsk
		ld	c,0				;CP/M boot track
		call	settrk
		ld	c,0				;CP/M boot sector
		call	setsec
		ld	bc,osloader		;memory location
		call	setdma
		call	write

        ret


; -------------------------------------------------------------
; PUTSYS: Copies CP/M system from RAM to disk
; - Writes track 0, sectors 1 to 59 (sector 0 is reserved for cpm loader)
; - CP/M image is assumed to be loaded at address 'cpm' in memory
; - Uses CBIOS calls in memory
; -------------------------------------------------------------

cpmsectors:    equ (CBIOS_BASE + cbios_size - CPM_BASE + 1) / 128 	;number of sectors to write

putsys:
		ld	c,00h		;CP/M disk a
		call	seldsk
;Write track 0, sectors 1 to 50
		ld	a,1		;starting sector
		ld	(sector),a
		ld	hl,cpm	;memory address to start
		ld	(address),hl
		ld	c,0		;CP/M track
		call	settrk
wr_trk_0_loop:	ld	a,(sector)
		ld	c,a		;CP/M sector
		call	setsec
		ld	bc,(address)	;memory location
		call	setdma
		call	write
		ld	a,(sector)
		cp	cpmsectors
		jp	z,put_done
		inc	a
		ld	(sector),a
		ld	hl,(address)
		ld	de,128
		add	hl,de
		ld	(address),hl
		jp	wr_trk_0_loop
put_done:
        ret

        ds 128
stack:  equ $-1        

; -------------------------------------------------------------
; CP/M loader: Binary image of CP/M bootloader, to be written to track 0 sector 0
; -------------------------------------------------------------

osloader:    
        INCBIN "../binaries/cpmloader.bin"
osloader_end:
        ds 128 - (osloader_end - osloader), 00h ;pad to 128 bytes

; -------------------------------------------------------------
; CP/M system image: Binary image of CP/M system
; -------------------------------------------------------------
cpmcode_start:    
        INCBIN "../binaries/cpm22.bin"
cpmcode_end:

; -------------------------------------------------------------
; CBIOS code: Binary image of CBIOS
; -------------------------------------------------------------
cbioscode_start:    
        INCBIN "../binaries/z80-cbios-alpha.bin"
cbioscode_end:		

; -------------------------------------------------------------
; PCGET code: Binary image of PCGET.COM
; -------------------------------------------------------------
pcgetcode_start:    
        INCBIN "../binaries/pcget.bin"
pcgetcode_end:

        end
