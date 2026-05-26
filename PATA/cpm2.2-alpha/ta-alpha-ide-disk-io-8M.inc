
;
; PATA/IDE read and write functions for TA Alphatronic PC with PATA/IDE controller
; Jukka Savolainen, 2026-05
;
; These functions are used by the CBIOS, setup utility, boot ROM etc
;
; NOTE: It doesn't compile standalone as it's designed to be INCLUDEd
;
; Uses only 128 bytes of the device sector, and discards the rest, to simplify the code.
; Therefore the host buffer is only 128 bytes and not the real sector size.
; The code, however, keeps separate host buffer and DMA address, to make it easier
; to change the implementation later to support the actual sector size of the disk if needed.
; The logic works regardless of the actual sector size on the disk, as long as it is at least 128 bytes.
;
; LBA only, so behaviour of older CHS-based disks is undefined.
;
;   LBA2     LBA1     LBA0
;   DDDDDDDD TTTTTTTT SSSSSSS
;
;   D=disk number, T=track number, S=sector number
;
;   The 8-bit disk number is used as-is for LBA2, so the code supports up to 256 disks, but the actual number of
;   disks supported depends on the CBIOS code and PATA/IDE controller and how it maps disks to LBA.
;

; Definitions for PATA/IDE port addresses
; Base address applies only to TA Alphatronic PC using the external PATA/IDE expansion card by Jukka Savolainen

pata:				equ	080h		;pata/ide port base address
pata_data:			equ pata + 00h	;DATA REGISTER(R/W)
pata_err:			equ pata + 01h	;ERROR REGISTER (R)
pata_feat:			equ pata + 01h	;FEATURES REGISTER (W)
pata_secco:			equ pata + 02h	;SECTOR COUNT (R/W)
pata_lba0:			equ pata + 03h	;LBA BITS 0-7 (R/W, LBA MODE)
pata_lba1:			equ pata + 04h	;LBA BITS 8-15 (R/W, LBA MODE)
pata_lba2:			equ pata + 05h	;LBA BITS 16-23 (R/W, LBA MODE)
pata_lba3:			equ pata + 06h	;LBA BITS 24-27 (R/W, LBA MODE)
pata_stat:			equ pata + 07h	;STATUS REGISTER (R)
pata_cmd:			equ pata + 07h	;COMMAND REGISTER (W)

PATA_CMD_READ		equ 20h		;read sector command
PATA_CMD_WRITE		equ 30h		;write sector command
PATA_CMD_IDENTIFY	equ 90h		;identify drive command
PATA_BIT_BSY		equ 80h		;BSY bit in status register
PATA_BIT_DRDY		equ 40h		;DRDY bit in status register
PATA_BIT_DRQ		equ 08h		;DRQ bit in status register
PATA_BIT_ERR        equ 01h		;ERR bit in status register

SEC_NOR				equ 0		;normal sector
SEC_DIR				equ 1		;directory sector
SEC_FST				equ 2		;first sector of a file

; -------------------------------------------
; Read one sector from IDE/PATA disk.
; Return a 00h in register a if the operation completes properly, and 01h if an error occurs during the read.
; Disk number in 'diskno'
; Track number in 'track'
; Sector number in 'sector'
; Dma address in 'dmaad' (0-65535)
; --------------------------------------------

read:
ide_read:
			call ide_wait_for_BSY_clr		;wait for BSY to be clear before starting the operation
			call ide_wait_for_DRDY_set	    ;wait for DRDY to be set, indicating the drive is ready to accept commands

			ld	a,1						    ;number of sectors = 1
			out	(pata_secco),a			    ;sector count register

			call ide_lba_mapping			;map sector, track, and disk number to LBA and set the appropriate registers

			ld	a,PATA_CMD_READ			    ;read sector command
			out	(pata_cmd),a

			call ide_wait_for_DRQ_set		;wait for DRQ to be set, indicating data is ready to be read
			call ide_wait_for_BSY_clr		;wait for BSY to be clear
			in	a,(pata_stat)			    ;clear INTRQ by reading status

			ld	hl,hstbuf				    ;buffer to place disk sector read from disk
			ld	b,128					    ;size of CP/M sector, read only 128 bytes to optimize memory usage and discard the rest	
			ld	c,pata_data			    	;data port
			inir							;read 'b' bytes from port 'c' to memory at 'hl'					

			call ide_consume_data			;consume any remaining data until DRQ is clear

			ld	hl,hstbuf				    ;host buffer
			ld	de,(dmaad)				    ;memory location to place data read from disk
			ld	bc,128					    ;size of CP/M sector
			ldir

			in	a,(pata_stat)			    ;get status
			and	PATA_BIT_ERR			    ;error bit
			ret		

; -------------------------------------------
; Write one CP/M sector to disk.
; Return a 00h in register a if the operation completes properly, and 0lh if an error occurs during the read or write
; Disk number in 'diskno'
; Track number in 'track'
; Sector number in 'sector'
; Dma address in 'dmaad' (0-65535)
; -------------------------------------------

write:
ide_write:
            ld	hl,(dmaad)				    ;memory location of data to write
			ld	de,hstbuf				    ;host buffer
			ld	bc,128					    ;size of CP/M sector
			ldir

            call ide_wait_for_BSY_clr	    ;wait for BSY to be clear before starting the operation
            call ide_wait_for_DRDY_set	    ;wait for DRDY to be set, indicating the drive is ready to accept commands

            ld	a,1					        ;number of sectors = 1
            out	(pata_secco),a			    ;sector count register

            call ide_lba_mapping			;map sector, track, and disk number to LBA and set the appropriate registers

            ld	a,PATA_CMD_WRITE		    ;write sector command
            out	(pata_cmd),a

            call ide_wait_for_DRQ_set		;wait for DRQ to be set

            ld	hl,hstbuf				    ;host buffer containing data to write
            ld	b,128					    ;size of CP/M sector
			ld	c,pata_data			    	;data port
			otir							;write 'b' bytes from memory at 'hl' to port 'c'

            call ide_produce_data			;produce data until DRQ is clear

            call ide_wait_for_BSY_clr		;wait for BSY to be clear

            in	a,(pata_stat)			    ;get status
            and PATA_BIT_ERR			    ;error bit
            ret

; ----------------------------------------------------------
; PATA/IDE disk helper subroutines
; ----------------------------------------------------------

ide_consume_data:
			in	a,(pata_data)			;read data to consume it
			in	a,(pata_stat)			;read status
			and	PATA_BIT_DRQ			;check DRQ bit	
			jp	nz,ide_consume_data		;loop until DRQ is clear, indicating all data has been consumed
			ret

ide_produce_data:
			xor	a						;write data doesn't matter, just need to produce DRQ
            out	(pata_data),a			;write data to produce DRQ
			in	a,(pata_stat)			;read status
			and	PATA_BIT_DRQ			;check DRQ bit
			jp	nz,ide_produce_data		;loop until DRQ is clear, indicating data has been produced and is ready to be consumed by the drive
            ret

ide_wait_for_DRDY_set:
			in	a,(pata_stat)			;check status
			and	PATA_BIT_DRDY			;check DRDY bit
			jp	z,ide_wait_for_DRDY_set ;loop until DRDY is set
			ret

ide_wait_for_DRQ_set:
			in	a,(pata_stat)			;read status
			and	PATA_BIT_DRQ			;DRQ bit
			jp	z,ide_wait_for_DRQ_set	;loop until DRQ is set
			ret

ide_wait_for_DRQ_clr:
        	in   a,(pata_stat)			;read status
        	and  PATA_BIT_DRQ			;DRQ bit
        	jp   nz,ide_wait_for_DRQ_clr;loop until DRQ is clear
        	ret

ide_wait_for_BSY_clr:
			in	a,(pata_stat)			;read status
			and	PATA_BIT_BSY			;BSY bit
			jp	nz,ide_wait_for_BSY_clr ;loop until BSY is clear
			ret


; ---------------------------------------------------------
; lba_mapping:
;   Input:
;       (sector) = 16-bit sector number, but use only low byte, as we have 128 sectors/track
;       (track)  = 16-bit track number as we have 512 tracks/disk)
;       (diskno) = disk number (0–255)
;
;   Output:
;       pata_lba0 = sector + (track bit 0 << 7)
;       pata_lba1 = track bits 1–8
;       pata_lba2 = disk number
; ---------------------------------------------------------

ide_lba_mapping:
	push	hl
	push	de
	push	bc

	; construct LBA0 from sector and track bit 0 and save it to register E
    ld   a,(sector)
    ld   e,a                ; LBA0 bits 0–6 = sector
    ld   hl,(track)
    bit  0,l                ; test track bit 0
    jr   z,ide_lba_bit_not_set
    set  7,e                ; set LBA0 bit 7 if track bit 0 = 1
ide_lba_bit_not_set:
	; construct LBA1 from track bits 1–9 and save it to register L
	srl	h					; shift high byte right, bit0 goes to carry
	rr	l					; rotate low byte right, carry goes to bit 7 of low byte
  
	; write the LBA values to the appropriate registers
    ld   a,e				; E has LBA0
    out  (pata_lba0),a

	ld	a,l					; L has LBA1
    out  (pata_lba1),a

    ld   a,(diskno)			; disk number is used as-is for LBA2
    out  (pata_lba2),a

	ld	a,11100000b			; LBA mode, select host drive 0
	out	(pata_lba3),a		; drive/head register

	pop	bc
	pop	de
	pop	hl
    ret