; Modified from original code by Jukka Savolainen, 2026-01
; for TA Alphatronic PC

;Formats four CP/M disks
;Updated June 2019 to match improved z80_cbios3
;Writes E5h to 64 sectors on tracks 1 to 255 of each disk (track 0 for system).
;Uses calls to cbios, in memory at DA00h

			INCLUDE "ta-alpha.inc"
cbios		equ	CPM_COLD			;CP/M cold start entry in RAM
conout:		equ	(cbios + 0Ch)		;print a character
seldsk:		equ	(cbios + 1Bh)		;pass disk no. in c
settrk:		equ	(cbios + 1Eh)		;pass track in reg C
setsec:		equ	(cbios + 21h)		;pass sector in reg c
setdma:		equ	(cbios + 24h)		;pass address in bc
write:		equ	(cbios + 2Ah)		;write one CP/M sector to disk
monitor_warm_start:	equ	BOOT_RAM + 3 ;assumes that this code is called from monitor
n_sectors:	equ 63
n_tracks:	equ 255

		org	0800h

		ld	sp,format_stack
		ld	hl,format_string
		call	prmsg
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
		ld	c,a
		call	conout
		ld	a,(char_count)
		inc	a
		cp	80
		jp	z,skip_1
		ld	(char_count),a
		jp	track_loop
skip_1:		ld	a,0
		ld	(char_count),a
		ld	a,0dh
		ld	c,a
		call	conout
		ld	a,0ah
		ld	c,a
		call	conout
		jp	track_loop
next_disk:	ld	a,(disk)
		inc	a
		cp	4
		jp	z,done
		ld	(disk),a
		jp	disk_loop
done:	jp	monitor_warm_start

prmsg:	ld	a,0			;check if at end of string
		ld	c,(hl)
		or	c
		ret	z			;yes, return
		call	conout	;no, output character
		inc	hl
		jp	prmsg

disk:		db	00h
sector:		db	00h
track:		db	00h
address:	dw	0000h
format_string:	defm	0dh,0ah,'Formatting...',0dh,0ah,0
char_count:	db	00h
directory_sector:
		ds	128,0e5h	;byte for empty directory
		ds	32			;stack space
format_stack:
		end
	

