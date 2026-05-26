;   CP/M 2.2 CBIOS for TA Alphatronic PC 8-bit computer
;	version 1, February 2026 by Jukka Savolainen
;   Adapted from Donn Stewart's code, see below:
;	--------------------------------------------------------
;		CP/M CBIOS for CPUville 8-bit computers
;		version 3, June 2019 by Donn Stewart
;		Modified from skeletal cbios for first level of CP/M 2.0 alteration
;		64-sector tracks, numbering starting at zero (sectors 0 to 63)
;		Block size 2048
;		Disk size 2 mb, DSM 1023, yields 256 tracks (0 to 255)
;		4 disks
;		Made more efficient use of disk by OR-ing CP/M disk, track, sector values
;		to create logical block address (LBA) for IDE disk
;		Added greeting message to cold boot
;
ccp:	equ	0C400h		;base of ccp in TA Alphatronic PC memory map
bdos:	equ	0CC06h		;bdos entry in TA Alphatronic PC memory map
cbios:	equ	0DA00h		;base of bios in TA Alphatronic PC memory map
cdisk:	equ	0004h		;address of current disk number 0=a,... l5=p
iobyte:	equ	0003h		;intel i/o byte
disks:	equ	04h			;number of disks in the system

; TA Alphatronic PC port addresses
uart_data_port:		equ	040h	;UART data port
uart_ctrl_port:		equ	041h	;UART control port
sys10_port:			equ	010h	;system status port 10h

; TA Alphatronic PC BIOS variable addresses
sys10_stat:			equ	0e468h	;system status byte for port 10h
kbd_table_lookup:	equ	0e4ddh	;keyboard lookup table
kbd_clear_key_map:	equ	(kbd_table_lookup + 86)	;mapping for "clear" key on TA Alphatronic PC keyboard

; TA Alphatronic BIOS subroutines
bios_jump_table		equ	0E400h
bios_monitor:		equ	0E400h	; BIOS monitor
bios_uart_rx_rdy:	equ 0E403h	; BIOS serial rx ready
bios_uart_rd_byte:	equ 0E406h	; BIOS read from serial port
bios_uart_wr_byte:	equ 0E409h	; BIOS write to serial port 
bios_const:			equ	0E40Ch	; BIOS kb console status
bios_conin:			equ	0E40Fh	; BIOS kb conin
bios_conout:		equ	0E412h	; BIOS crt conout
bios_uart_tx_rdy:	equ	0E433h	; BIOS serial transmit ready
bios_lpt_wr_byte	equ	0E439h	; BIOS write to LPT:
bios_lpt_status		equ	0E445h	; BIOS LPT: status

;
	org	cbios		;origin of this program
nsects:	equ	($-ccp)/128	;warm start sector count
;
;	jump vector for individual subroutines
;
	JP	boot	;cold start
wboote:
	JP	wboot	;warm start
	JP	const	;console status
	JP	conin	;console character in
	JP	conout	;console character out
	JP	lstout	;list character out
	JP	punout	;punch character out
	JP	rdrin	;reader character in
	JP	home	;move head to home position
	JP	seldsk	;select disk
	JP	settrk	;set track number
	JP	setsec	;set sector number
	JP	setdma	;set dma address
	JP	read	;read disk
	JP	write	;write disk
	JP	lstst	;return list status
	JP	sectran	;sector translate
;
;	Data tables for disks
;	Four disks, 26 sectors/track, disk size = number of 1024 byte blocks
;	Number of directory entries (32-bytes each) set to 127 per 500 blocks
;	Allocation map bits = number of blocks needed to contain directory entries
;	No translations -- translation maps commented out
;
;	disk Parameter header for disk 00
dpbase:	defw	0000h, 0000h
	defw	0000h, 0000h
	defw	dirbf, dpblk
	defw	chk00, all00
;	disk parameter header for disk 01
	defw	0000h, 0000h
	defw	0000h, 0000h
	defw	dirbf, dpblk
	defw	chk01, all01
;	disk parameter header for disk 02
	defw	0000h, 0000h
	defw	0000h, 0000h
	defw	dirbf, dpblk
	defw	chk02, all02
;	disk parameter header for disk 03
	defw	0000h, 0000h
	defw	0000h, 0000h
	defw	dirbf, dpblk
	defw	chk03, all03
;
;	sector translate vector
;Since no translation will comment out
;trans:	defm	 1,  7, 13, 19	;sectors  1,  2,  3,  4
;	defm	25,  5, 11, 17	;sectors  5,  6,  7,  6
;	defm	23,  3,  9, 15	;sectors  9, 10, 11, 12
;	defm	21,  2,  8, 14	;sectors 13, 14, 15, 16
;	defm	20, 26,  6, 12	;sectors 17, 18, 19, 20
;	defm	18, 24,  4, 10	;sectors 21, 22, 23, 24
;	defm	16, 22		;sectors 25, 26
;
dpblk:	;disk parameter block for all disks.
	defw	64		;sectors per track
	defm	4		;block shift factor
	defm	15		;block mask - with block shift, sets block size to 1024
	defm	0		;null mask
	defw	1023	;disk size-1 = number of blocks in a disk - 1
	defw	256		;directory max = no. directory entries/disk, arbitrary
	defm	240		;alloc 0 -- need 4 bits (blocks) for 256 directory entries -- 
	defm	0		;alloc 1 -- no. bits = (directory max x 32)/block size	
	defw	0		;check size -- no checking, so zero
	defw	1		;track offset -- first track for system
;
;	end of fixed tables
;
;	Greeting message for cold boot
greet:
	defm	1bh, 45h, 0dh, 0ah ;clear screen escape sequence
	defm	"CP/M 2.2 for TA Alphatronic PC 56K",0dh,0ah
	defm	"CBIOS v.1.0 with PATA/IDE and iobyte support by JS",0dh,0ah
	defm	0dh, 0ah, 0	

;	individual subroutines to perform each function
boot:	;entry point from CP/M loader
	;CP/M loader has loaded BDOS, CCP and CBIOS
	;print greeting and perform parameter initialization
	ld	a,08h			;backspace key code
	ld	(kbd_clear_key_map),a	;set the 'clear' key as the 'backspace' key
	in	a,(sys10_port)	;read system status port to get dip switch settings
	bit	5,a			;printer: 0 = parallel port, 1 = serial port
	jp	z,lstlpr
	ld	a,01h		;LST: = TTY: | CON: = CRT: | others = TTY:
	jp	setiob
lstlpr:
	ld	a,81h		;LST: = LPR: | CON: = CRT: | others = TTY:
setiob:
	ld	(iobyte),a	;set the iobyte
	ld	hl,greet	;address of greeting message
	call	prmsg	;print message subroutine
	xor a			;zero in the accum
	ld	(cdisk),a	;select disk zero
	jp	gocpm		;initialize and go to cp/m
;
wboot:	;load BDOS and CCP only -- CBIOS should still be there...
	ld	a,08h			;backspace key code
	ld	(kbd_clear_key_map),a	;set the 'clear' key as the 'backspace' key
	LD	sp, 80h		;use space below buffer for stack
	LD 	c, 0		;select disk 0
	call	seldsk
	call	home	;go to track 00
	LD 	b, nsects	;b counts * of sectors to load
	LD 	c, 0		;c has the current track number
	LD 	d, 1		;d has the next sector to read
;	note that we begin by reading track 0, sector 1 since sector 0
;	contains the cold start loader, which is skipped in a warm start
	LD	HL, ccp		;base of cp/m (initial load point)
load1:	;load	one more sector
	PUSH	BC		;save sector count, current track
	PUSH	DE		;save next sector to read
	PUSH	HL		;save dma address
	LD 	c, d		;get sector address to register C
	call	setsec		;set sector address from register C
	pop	BC		;recall dma address to b, C
	PUSH	BC		;replace on stack for later recall
	call	setdma		;set dma address from b, C
;
;	drive set to 0, track set, sector set, dma address set
	call	read
	CP	00h		;any errors?
	JP	NZ,wboot	;retry the entire boot if an error occurs
;
;	no error, move to next sector
	pop	HL		;recall dma address
	LD	DE, 128		;dma=dma+128
	ADD	HL,DE		;new dma address is in h, l
	pop	DE		;recall sector address
	pop	BC		;recall number of sectors remaining, and current trk
	DEC	b		;sectors=sectors-1
	JP	Z,gocpm		;transfer to cp/m if all have been loaded
;
;	more	sectors remain to load, check for track change
	INC	d
	LD 	a,d		;sector=64?, if so, change tracks
	CP	64
	JP	C,load1		;carry generated if sector<64
;
;	end of	current track,	go to next track
	LD 	d,0		;begin with first sector of next track
	INC	c		;track=track+1
;
;	save	register state, and change tracks
	PUSH	BC
	PUSH	DE
	PUSH	HL
	call	settrk		;track address set from register c
	pop	HL
	pop	DE
	pop	BC
	JP	load1		;for another sector
;
;	end of	load operation, set parameters and go to cp/m
gocpm:
	LD 	a, 0c3h		;c3 is a jmp instruction
	LD	(0),A		;for jmp to wboot
	LD	HL, wboote	;wboot entry point
	LD	(1),HL		;set address field for jmp at 0
;
	LD	(5),A		;for jmp to bdos
	LD	HL, bdos	;bdos entry point
	LD	(6),HL		;address field of Jump at 5 to bdos
;
	LD	BC, 80h		;default dma address is 80h
	call	setdma
;
	ei			;enable the interrupt system
	LD	A,(cdisk)	;get current disk number
	cp	disks		;see if valid disk number
	jp	c,diskok	;disk valid, go to ccp
	ld	a,0		;invalid disk, change to disk 0
diskok:	LD 	c, a		;send to the ccp
	JP	ccp		;go to cp/m for further processing
;
;
;	simple i/o handlers (must be filled in by user)
;	in each case, the entry point is provided, with space reserved
;	to insert your own code
;

;	IOBYTE bit assignments for TA Alphatronic PC
;
;	iobyte		      00   01   10   11     at boot
;	----------------------------------------------------
;	000000XX | CON: = TTY: CRT: BAT: UC1: |	CRT:
;	0000XX00 | RDR: = TTY: PTR: UR1: UR2: |	TTY:	
;	00XX0000 | PUN: = TTY: PTP: UP1: UP2: |	TTY:
;	XX000000 | LST: = TTY: CRT: LPT: UL1: |	TTY/LPT: based on dip switches
;
;	Note:	BAT: means CONOUT=PUNCH and CONIN=READER
;				 however, as in this implementation PUN: and RDR: are both mapped to TTY:,
;				 the double redirection is not implemented
;			UR2: is the cassette tape in
;			UP2: is the cassette tape out - note that the hardware sends the same signal
;				 also to the serial port and that can't be prevented in software
;			UXX: are implemented as serial port i.e the same as TTY:
;				 This may change if I add another serial port in the system bus
;			
TCONST:
	DEFW	tty_status		; TTY: CONSOLE INPUT STATUS
	DEFW	crt_status		; CRT: CONSOLE INPUT STATUS
	DEFW	tty_status		; BAT: CONSOLE INPUT STATUS
	DEFW	tty_status		; UC1: CONSOLE INPUT STATUS
TCONIN:
	DEFW	tty_read		; TTY: CONSOLE INPUT DATA
	DEFW	crt_read		; CRT: CONSOLE INPUT DATA
	DEFW	tty_read		; BAT: CONSOLE INPUT DATA
	DEFW	tty_read		; UC1: CONSOLE INPUT DATA
TCONOT:
	DEFW	tty_write		; TTY: CONSOLE OUTPUT DATA
	DEFW	crt_write		; CRT: CONSOLE OUTPUT DATA
	DEFW	tty_write		; BAT: CONSOLE OUTPUT DATA
	DEFW	tty_write		; UC1: CONSOLE OUTPUT DATA
TLISTST:
	DEFW	tty_status		; TTY: LIST OUTPUT STATUS
	DEFW	crt_status		; CRT: LIST OUTPUT STATUS
	DEFW	lpt_status		; LPT: LIST OUTPUT STATUS
	DEFW	tty_status		; UL1: LIST OUTPUT STATUS
TLISTOT:
	DEFW	tty_write		; TTY: LIST OUTPUT DATA
	DEFW	crt_write		; CRT: LIST OUTPUT DATA
	DEFW	lpt_write		; LPT: LIST OUTPUT DATA
	DEFW	tty_write		; UL1: LIST OUTPUT DATA
TREADER:
	DEFW	tty_read		; TTY: READER INPUT DATA
	DEFW	tty_read_z		; PTR: READER INPUT DATA
	DEFW	tty_read_z		; UR1: READER INPUT DATA
	DEFW	cas_read		; UR2: READER INPUT DATA	(CAS: is TTY:, but we have to change UART settings)
TRDRST:
	DEFW	tty_status		; TTY: READER INPUT STATUS
	DEFW	tty_status		; PTR: READER INPUT STATUS
	DEFW	tty_status		; UR1: READER INPUT STATUS
	DEFW	cas_status		; UR2: READER INPUT STATUS	(CAS: is TTY:, but we have to change UART settings)
TPUNCH:
	DEFW	tty_write		; TTY: PUNCH OUTPUT DATA
	DEFW	tty_write		; PTP: PUNCH OUTPUT DATA
	DEFW	tty_write		; UP1: PUNCH OUTPUT DATA
	DEFW	cas_write		; UP2: PUNCH OUTPUT DATA	(CAS: is TTY:, but we have to change UART settings)

;
;	I/O BYTE ROUTER
;
const:
	XOR	A			; SHIFT I/O BYTE 0 BITS RIGHT
	LD	HL,TCONST	; POINTER TO CONSOLE STATUS TABLE
	JP	IOVECTR		; GOTO ROUTINE
conin:
	XOR	A			; SHIFT I/O BYTE 0 BITS RIGHT
	LD	HL,TCONIN	; POINTER TO CONSOLE INPUT TABLE
	JP	IOVECTR		; GOTO ROUTINE
conout:
	XOR	A			; SHIFT I/O BYTE 0 BITS RIGHT
	LD	HL,TCONOT	; POINTER TO CONSOLE OUTPUT TABLE
	JP	IOVECTR		; GOTO ROUTINE
rdrin:
	LD	A,1			; SHIFT I/O BYTE 2 BITS RIGHT
	LD	HL,TREADER	; POINTER TO READER INPUT TABLE
	JP	IOVECTR		; GOTO ROUTINE
punout:
	LD	A,2			; SHIFT I/O BYTE 4 BITS RIGHT
	LD	HL,TPUNCH	; POINTER TO PUNCH OUTPUT TABLE
	JP	IOVECTR		; GOTO ROUTINE
lstst:
	LD	A,3			; SHIFT I/O BYTE 6 BITS RIGHT
	LD	HL,TLISTST	; POINTER TO LIST STATUS TABLE
	JP	IOVECTR		; GOTO ROUTINE
lstout:
	LD	A,3			; SHIFT I/O BYTE 6 BITS RIGHT
	LD	HL,TLISTOT	; POINTER TO LIST OUTPUT TABLE
	JP	IOVECTR		; GOTO ROUTINE
; 
; CALCULATE I/O BYTE JUMP
;
IOVECTR:
	LD	B,A			; PUT BITS TO ROTATE RIGHT INTO B
	OR	A			; CHECK TO SEE IT ROTATION WAS 0
	LD	A,(iobyte)	; GET I/O BYTE
	JR	Z,I20		; IF ROTATION IS 0, DON'T ROTATE
I10:
	RRA				; ROTATE RIGHT
	RRA				;  TWICE
	DJNZ	I10		; B TIMES
I20:
	AND	03h		; REMOVE EXTRANEOUS BITS
	RLA				; TIMES 2
	LD	D,0			; ZERO D
	LD	E,A			; OFFSET INTO E
CALVC1:
	ADD	HL,DE		; ADD IT TO THE TABLE BASE ADDRESS
	LD	E,(HL)		; GET LOW BYTE
	INC	HL			; INCREMENT
	LD	D,(HL)		; GET HIGH BYTE
	EX	DE,HL		; PUT VECTOR INTO HL
	JP	(HL)		; JUMP TO IT

;
; TA Alphatronic PC BIOS subroutines for console and printer I/O
;
crt_status:	;console status, return 0ffh if character ready, 00h if not
	call	bios_const
	ret

crt_read:	;console character into register a
	call	bios_conin
	ret

crt_write:	;console character from register c
	call	bios_conout
	ret

tty_status:	;console status, return 0ffh if character ready, 00h if not
	call uart_set_tty
	; continue to tty_status_do to get status for TTY:
tty_status_do:
	call bios_uart_rx_rdy
	ret

tty_read:	;console character into register a, wait if not ready
	call uart_set_tty
	jp	tty_read_do
tty_read_z:	;console character into register a, dont't wait if not ready
	call bios_uart_rx_rdy
	ret z
	;continue to tty_read_do if character ready
tty_read_do:
	call bios_uart_rd_byte
	ret

tty_write:	;console character from register c
	call uart_set_tty
	; continue to tty_write_do to write character for TTY:
tty_write_do:	;console character from register c
	call bios_uart_wr_byte
	ld	a, c	;character to register a
	ret

lpt_status:	;list status, return 0ffh if character ready, 00h if not
	call bios_lpt_status
	ret

lpt_write:	;list character from register c
	call bios_lpt_wr_byte
	ld	a, c	;character to register a
	ret

cas_status:	
	call uart_set_cas	;set UART mode for cassette reading
	jp tty_status

cas_read:	;cassette byte into register a
	call uart_set_cas	;set UART mode for cassette reading
	jp	tty_read_do

cas_write: ;save character from register c to cassette
	call uart_set_cas	;set UART mode for cassette reading
	jp	tty_write_do

uart_set_cas:	; set UART mode for cassette reading/writing
	ld	a,(sys10_stat)	;read the bios status byte
	bit	2,a				;check if already in cassette mode
	ret	z				;already in cassette mode, return
	; change from TTY mode to cassette mode
	res	2,a				;clear flag to indicate cassette mode, CMT_RS232_SELECT=0
	set	3,a				;set flag to enable reading, CMT_MOTOR_START=1
 	ld	(sys10_stat),a	;save the change to system status byte
	out	(sys10_port),a	;activate the change by writing new value to system port 	
	; change UART to 2400-E-8-2 mode for cassette operation (speed is hardwired)
	ld	a,0feh			;divide by 16, 8-bit chars, even parity, 2 stop bits
	jp	uart_set

uart_set_tty:	; set UART mode for TTY: reading/writing
	ld	a,(sys10_stat)	;read the bios status byte
	bit	2,a				;check if in TTY: mode
	ret	nz				;already in TTY mode, return
	; change from cassette mode to TTY mode
	set	2,a				;set flag to indicate TTY mode, CMT_RS232_SELECT=1
	res	3,a				;clear flag to disable reading, CMT_MOTOR_START=0	
 	ld	(sys10_stat),a	;save the change to system status byte
	out	(sys10_port),a	;activate the change by writing new value to system port 	
	; change UART to 9600-N-8-1 mode for TTY: operation
	ld	a,04eh			;divide by 16, 8-bit chars, no parity, 1 stop bit
uart_set:
	push af				;save the mode byte	
	in	a, (uart_data_port)	;UART reset sequence starts
	ld	a, 00h
	out	(uart_ctrl_port),a
	nop
	nop
	nop
	out (uart_ctrl_port),a
	nop
	nop
	nop
	out (uart_ctrl_port),a
	nop
	nop
	nop
	nop	
	ld	a,040h
	out (uart_ctrl_port),a	;UART reset sequence complete
	nop
	nop
	nop
	nop
 	pop	af					;restore the mode byte
	out	(uart_ctrl_port),a	;set the mode for the UART
	nop
	nop
	nop
	nop
    ld	a,037h				;enable rx, tx, error reset, rts low, dtr low
    out	(uart_ctrl_port),a
	ret

;
;
;	i/o drivers for the disk follow
;	for now, we will simply store the parameters away for use
;	in the read and write	subroutines
;
home:	;move to the track 00	position of current drive
;	translate this call into a settrk call with Parameter 00
	LD     c, 0		;select track 0
	call   settrk
	ret			;we will move to 00 on first read/write
;
seldsk:	;select disk given by register c
	LD	HL, 0000h	;error return code
	LD 	a, c
	LD	(diskno),A
	CP	disks		;must be between 0 and 3
	RET	NC		;no carry if 4, 5,...
;	disk number is in the proper range
;	defs	10		;space for disk select -- not needed for modern hard disk
;	compute proper disk Parameter header address
	LD	A,(diskno)
	LD 	l, a		;l=disk number 0, 1, 2, 3
	LD 	h, 0		;high order zero
	ADD	HL,HL		;*2
	ADD	HL,HL		;*4
	ADD	HL,HL		;*8
	ADD	HL,HL		;*16 (size of each header)
	LD	DE, dpbase
	ADD	HL,DE		;hl=,dpbase (diskno*16) Note typo here in original source.
	ret
;
settrk:	;set track given by register c
	LD 	a, c
	LD	(track),A
	ret
;
setsec:	;set sector given by register c
	LD 	a, c
	LD	(sector),A
	ret
;
;
sectran:
	;translate the sector given by bc using the
	;translate table given by de
	EX	DE,HL		;hl=.trans
	ADD	HL,BC		;hl=.trans (sector)
	ret			;debug no translation
	LD 	l, (hl)		;l=trans (sector)
	LD 	h, 0		;hl=trans (sector)
	ret			;with value in hl
;
setdma:	;set	dma address given by registers b and c
	LD 	l, c		;low order address
	LD 	h, b		;high order address
	LD	(dmaad),HL	;save the address
	ret
;
;	Subroutine to print greeting message
;	Address of zero-terminated string passed in HL
prmsg:	ld	a,0			;check if at end of string
	ld	c,(hl)
	or	c
	ret	z			;yes, return
	push	hl
	call	conout			;no, output character
	pop	hl
	inc	hl
	jp	prmsg
;
;	Definitions for PATA/IDE port addresses
;	Base address applies only to TA Alphatronic PC using the external PATA/IDE expansion card by Jukka Savolainen
;
pata:		equ	080h			; pata/ide port base address
pata_data:	equ pata + 00h		; DATA REGISTER(R/W)
pata_err:	equ pata + 01h		; ERROR REGISTER (R)
pata_feat:	equ pata + 01h		; FEATURES REGISTER (W)
pata_secco:	equ pata + 02h		; SECTOR COUNT (R/W)
pata_lba0:	equ pata + 03h		; LBA BITS 0-7 (R/W, LBA MODE)
pata_lba1:	equ pata + 04h		; LBA BITS 8-15 (R/W, LBA MODE)
pata_lba2:	equ pata + 05h		; LBA BITS 16-23 (R/W, LBA MODE)
pata_lba3:	equ pata + 06h		; LBA BITS 24-27 (R/W, LBA MODE)
pata_stat:	equ pata + 07h		; STATUS REGISTER (R)
pata_cmd:	equ pata + 07h		; COMMAND REGISTER (W)


read:
;Read one CP/M sector from disk.
;Return a 00h in register a if the operation completes properly, and 01h if an error occurs during the read.
;Disk number in 'diskno'
;Track number in 'track'
;Sector number in 'sector'
;Dma address in 'dmaad' (0-65535)
;

			ld	hl,hstbuf		;buffer to place disk sector (256 bytes)
rd_status_loop_1:	in	a,(pata_stat)	;check status
			and	80h						;check BSY bit
			jp	nz,rd_status_loop_1		;loop until not busy
rd_status_loop_2:	in	a,(pata_stat)	;check	status
			and	40h						;check DRDY bit
			jp	z,rd_status_loop_2		;loop until ready
			ld	a,01h					;number of sectors = 1
			out	(pata_secco),a			;sector count register
			ld	a,(sector)				;CP/M sector (0 to 63, 6 bits)
			sla	a						;make room for diskno (0 to 3, 2 bits)
			sla	a
			ld	b,a
			ld	a,(diskno)				;CP/M disk (0 to 3)
			add	b						;diskno and sector now in one byte
			out	(pata_lba0),a			;lba bits 0 - 7
			ld	a,(track)				;CP/M track (0 to 255, 8 bits)
			out	(pata_lba1),a			;lba bits 8 - 15
			ld	a,0						;upper bits zero
			out	(pata_lba2),a			;lba bits 16 - 23
			ld	a,11100000b				;LBA mode, select host drive 0
			out	(pata_lba3),a			;drive/head register
			ld	a,20h					;Read sector command
			out	(pata_cmd),a
rd_wait_for_DRQ_set:	in	a,(pata_stat);read status
			and	08h						;DRQ bit
			jp	z,rd_wait_for_DRQ_set	;loop until bit set
rd_wait_for_BSY_clear:	in	a,(pata_stat);read status
			and	80h
			jp	nz,rd_wait_for_BSY_clear
			in	a,(pata_stat)			;clear INTRQ
read_loop:	in	a,(pata_data)			;get data
			ld	(hl),a
			inc	hl
			in	a,(pata_stat)			;check status
			and	08h						;DRQ bit
			jp	nz,read_loop			;loop until clear
			ld	hl,(dmaad)				;memory location to place data read from disk
			ld	de,hstbuf				;host buffer
			ld	b,128					;size of CP/M sector
rd_sector_loop:		ld	a,(de)			;get byte from host buffer
			ld	(hl),a					;put in memory
			inc	hl
			inc	de
			djnz	rd_sector_loop		;put 128 bytes into memory
			in	a,(pata_stat)			;get status
			and	01h						;error bit
			ret

write:
;Write one CP/M sector to disk.
;Return a 00h in register a if the operation completes properly, and 0lh if an error occurs during the read or write
;Disk number in 'diskno'
;Track number in 'track'
;Sector number in 'sector'
;Dma address in 'dmaad' (0-65535)
			ld	hl,(dmaad)				;memory location of data to write
			ld	de,hstbuf				;host buffer
			ld	b,128					;size of CP/M sector
wr_sector_loop:		ld	a,(hl)			;get byte from memory
			ld	(de),a					;put in host buffer
			inc	hl
			inc	de
			djnz	wr_sector_loop		;put 128 bytes in host buffer
			ld	hl,hstbuf				;location of data to write to disk
wr_status_loop_1:	in	a,(pata_stat)	;check status
			and	80h						;check BSY bit
			jp	nz,wr_status_loop_1		;loop until not busy
wr_status_loop_2:	in	a,(pata_stat)	;check	status
			and	40h						;check DRDY bit
			jp	z,wr_status_loop_2		;loop until ready
			ld	a,01h					;number of sectors = 1
			out	(pata_secco),a			;sector count register
			ld	a,(sector)				;CP/M sector (0 to 63, 6 bits)
			sla	a						;make room for diskno
			sla	a
			ld	b,a
			ld	a,(diskno)				;CP/M disk (0 to 3, two bits)
			add	b						;diskno and sector in one byte
			out	(pata_lba0),a			;lba bits 0 - 7
			ld	a,(track)				;CP/M track (0 to 255, 8 bits)
			out	(pata_lba1),a			;lba bits 8 - 15
			ld	a,0						;upper bits zero
			out	(pata_lba2),a			;lba bits 16 - 23
			ld	a,11100000b				;LBA mode, select drive 0
			out	(pata_lba3),a			;drive/head register
			ld	a,30h					;Write sector command
			out	(pata_cmd),a
wr_wait_for_DRQ_set:	in	a,(pata_stat);read status
			and	08h						;DRQ bit
			jp	z,wr_wait_for_DRQ_set	;loop until bit set			
write_loop:		ld	a,(hl)
			out	(pata_data),a			;write data
			inc	hl
			in	a,(pata_stat)			;read status
			and	08h						;check DRQ bit
			jp	nz,write_loop			;write until bit cleared
wr_wait_for_BSY_clear:	in	a,(pata_stat);read status
			and	80h
			jp	nz,wr_wait_for_BSY_clear
			in	a,(pata_stat)			;clear INTRQ
			and	01h						;check for error
			ret

					
;
;	the remainder of the cbios is reserved uninitialized
;	data area, and does not need to be a Part of the
;	system	memory image (the space must be available,
;	however, between"begdat" and"enddat").
;
track:	defs	2		;two bytes for expansion
sector:	defs	2		;two bytes for expansion
dmaad:	defs	2		;direct memory address
diskno:	defs	1		;disk number 0-15
;
;	scratch ram area for bdos use
begdat:	equ	$	 	;beginning of data area
dirbf:	defs	128	 	;scratch directory area
;Allocation scratch areas, size of each must be (DSM/8)+1
all00:	defs	128	 	;allocation vector 0
all01:	defs	128	 	;allocation vector 1
all02:	defs	128	 	;allocation vector 2
all03:	defs	128	 	;allocation vector 3
;Could probably remove these chk areas, but just made size small
chk00:	defs	1		;check vector 0
chk01:	defs	1		;check vector 1
chk02:	defs	1	 	;check vector 2
chk03:	defs	1	 	;check vector 3
;
enddat:	equ	$	 	;end of data area
datsiz:	equ	$-begdat;	;size of data area
hstbuf: ds	256		;buffer for host disk sector

		end
