; TA Alphatronic PC specific definitions
bios_const:			equ	0E40Ch		;BIOS kb status
bios_conin:			equ	0E40Fh		;BIOS kb conin
bios_conout:		equ	0E412h		;BIOS crt conout
ta_ctrl_port1:		equ	010h		;TA Alphatronic PC control port 1
ta_ctrl_port2:		equ	020h		;TA Alphatronic PC control port 2
ta_ctrl_stat1:		equ	0e468h		;status of port 10H used by the original boot code
ta_ctrl_stat2:		equ	0e469h		;status of port 20H used by the original boot code
uart_data_port:		equ	040h		;UART data port
uart_ctrl_port:		equ	041h		;UART control port

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

; Useful memory map definitions for TA Alphatronic PC

BAS_ROM_S:          equ	02000h		            ;BASIC ROM chip size
EXT_ROM_S:		    equ	02000h		            ;ROM Pack chip size

BAS_ROM_1:          equ	00000h		            ;BASIC ROM 1 start address when ROM mode is enabled
BAS_ROM_2:          equ	02000h		            ;BASIC ROM 2 start address when ROM mode is enabled
BAS_ROM_3:          equ	04000h		            ;BASIC ROM 3 start address when ROM mode is enabled

BOOT_RAM:           equ 09000h		            ;RAM address that the OS boot loader uses to load code from ROM to RAM

EXT_ROM_1:		    equ	0A000h		            ;ROM Pack 1 start address when ROM mode is enabled
EXT_ROM_2:          equ	0B000h		            ;ROM Pack 2 start address when ROM mode is enabled
CPM_BASE:           equ 0C400h		            ;CP/M CCP/BDOS RAM address
CBIOS_BASE:         equ 0DA00h		            ;CBIOS RAM address 
CPM_COLD:           equ CBIOS_BASE		        ;CP/M cold start entry point in RAM
BIOS_BASE:          equ 0E400h		            ;TA internal monitor/BIOS RAM address
VID_MEM:            equ 0F000h		            ;video RAM address

FST_FRE_MEM:        equ	BAS_ROM_3 + BAS_ROM_S   ;first free RAM address when ROM mode is enabled
LST_FRE_MEM:        equ	EXT_ROM_1 - 1           ;last free RAM address when ROM mode is enabled
