;
; Modified from Donn Stewart's orginal code by Jukka Savolainen, 2026-02
;
; Z80 CP/M 2.2 cold boot code for TA Alphatronics PC version 1.0
;
; 
; First byte must be a JP instruction as it is used by the Alphatronic built-in boot ROM
; to check whether the ROM is installed. Once verified, it jumps to 0A000H.
;
; The ROM bootstrap code here copies the CP/M loader image from ROM to RAM and then jumps to it.
; Once the CP/M has been loaded into RAM, the CP/M cold boot routine is called.
;
; The CP/M loader image is stored in this ROM immediately after the bootstrap code. 
;
; The code uses bit 0 of IN 10H to check the existence of disks. However, it is the same
; method as used with the TA Alphatronics native floppy controller. If you have a floppy 
; controller installed, this code tries to boot, but fails as it supports only PATA/IDE disks.

;----------------------------------------------------------
; CP/M Loader Program
; 
; Retrieves CP/M image from disk and loads it in memory starting at 'cpmstart' 
; Reads track 0, and 'cpmsectors' sectors, starting from sector 1 (sector 0 has this code)
;----------------------------------------------------------

; TA Alphatronic PC specific definitions
			INCLUDE "ta-alpha.inc"
cpmloader:	equ 0800H				;address where CP/M loader image is stored in RAM
cpmstart:	equ	CPM_BASE			;CP/M RAM start address in TA Alphatronic PC memory map
cpmend:		equ (BIOS_BASE - 1)		;CP/M RAM end address in TA Alphatronic PC memory map
cpmcold:    equ	CPM_COLD			;CP/M cold start entry in RAM
cpmsize:	equ (cpmend - cpmstart) ;size of CP/M image in bytes
cpmsectors:	equ ((cpmsize + 1)/ 128);number of 128-byte sectors in CP/M image

;
; the boot ROM code is still around in RAM, so we'll reuse some subroutines
; and memory locations to save space here
;
bootloader: equ BOOT_RAM			;address where the ROM bootloader code is stored in RAM
disk_read:	equ (bootloader+003h)
delay_2s:	equ (bootloader+006h)
prmsg:		equ (bootloader+009h)
sector:		equ (bootloader+00Ch)
track:		equ (bootloader+00Eh)
dmaad:		equ (bootloader+010h)
diskno:     equ (bootloader+012h)

;----------------------------------------------------------
; Intialization
;----------------------------------------------------------
		ORG cpmloader			;loader program starts here in RAM

		jp	start				;disk boot ROM checks that the first byte is c3h
		dw	cpmloader			;address where disk boot ROM loads this code to
		defm	"CP/M 2.2 b1",0	;disk boot ROM displays this label to the user

start:	ld sp,stack				;own stack, outside of bootloader code area

;----------------------------------------------------------
; Load CP/M from disk to memory
;----------------------------------------------------------

		;Read track 0, sectors 1 to 50 from disk 0
        ld  a,0				;disk 0
        ld  (diskno),a
		ld	bc,1			;starting sector -- sector 0 has cpm_loader (this code)
		ld	(sector),bc
		ld	hl,cpmstart		;memory address to place image
		ld	(dmaad),hl
		ld	bc,0			;CP/M track
		ld	(track),bc
rd_trk_0_loop:
        call disk_read
		jp	z,rd_ok
		ld	c,'?'
		call bios_conout	;print error character if disk read fails
		jp	rd_trk_0_loop	;try reading the same sector again until successful
rd_ok:	ld	c,'.'
		call bios_conout	;print dot to show progress of loading CP/M
		ld	bc,(sector)		;get the current sector number
		ld	a,c				;we need only the lower byte
		cp	cpmsectors		;have we read all sectors for CP/M image?
		jp	z,done			;yes, we are done
		inc	bc				;otherwise, next sector
		ld	(sector),bc
		ld	hl,(dmaad)		;bump the DMA address for the next sector read
		ld	de,128
		add	hl,de
		ld	(dmaad),hl
		jp	rd_trk_0_loop

done:	jp	cpmcold		;CP/M has been loaded to memory so jump to CP/M cold start entry
stack:		equ	$+32

		end