; Modified from: Putsys3 by Donn Stewart, June 2019 
; This version for Donn's z80_cbios3, with improved disk read and write routines
; ----------------------------------------------------------
; Putboot by Jukka Savolainen, 2026-02
; Saves the CP/M disk boot code from memory to disk track 0, sector 0 
;
; Load and run from RAM monitor
; Uses calls to cbios, in memory at DA00h

			INCLUDE "ta-alpha.inc"
osloader:	equ 07000H		;RAM address where the CP/M loader has been loaded to using 'bload' command in RAM monitor
monitor:	equ BOOT_RAM	;RAM address where the RAM monitor has been loaded by the boot ROM

; CBIOS functions in memory
seldsk:		equ	0da1bh		;pass disk no. in c
setdma:		equ	0da24h		;pass address in bc
settrk:		equ	0da1eh		;pass track in reg C
setsec:		equ	0da21h		;pass sector in reg c
write:		equ	0da2ah		;write one CP/M sector to disk
monitor_warm_start:	equ	(monitor + 03h)	;Return to RAM monitor

		org	0800h

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
done:	jp	monitor_warm_start
		end


