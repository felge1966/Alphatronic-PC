; z80dasm 1.1.5
; command line: z80dasm -a -l -t -z -g 0xf000 xx-1.bin

; During boot, this code is mapped to 0x0f000 - 0x0ffff
; At address 0x00000, there is a jump to 0x0fff0
;
; 0e468h i.e 0f468h stores port 010h byte
; 0e469h i.e 0f469h stores port 020h byte


	org	0f000h

lf000h:
	ld hl,0e469h		;f000	21 69 e4 	! i . 
	set 3,(hl)		;f003	cb de 	. . 
	ld a,(hl)			;f005	7e 	~ 
	out (020h),a		;f006	d3 20 	.   
	call 0e59dh		;f008	cd 9d e5 	. . . 
	ld hl,0e468h		;f00b	21 68 e4 	! h . 
	set 6,(hl)		;f00e	cb f6 	. . 

called_from_boot_to_ram_enty_f010h:
; during boot hl=0e469h and (0e469h)=0
set_rom_pack_enable_f010h:
	ld hl,0e468h		;f010	21 68 e4 	! h . 
	set 6,(hl)		;f013	cb f6 	. . 
	ld a,(hl)			;f015	7e 	~ 
	out (010h),a		;f016	d3 10 	. .
sub_f010h:
	ld a,(hl)			;f010	7e 	~ 
	out (010h),a		;f011	d3 10 	. . 

check_rom1_f013h:
	ld a,(0a000h)		;f013	3a 00 a0 	: . . 
	cp 0c3h		;f016	fe c3 	. . 
	jp z,0a000h		;f018	ca 00 a0 	. . . 

check_rom2_f01bh:
	ld a,(0c000h)		;f01b	3a 00 c0 	: . . 
	cp 0c3h		;f01e	fe c3 	. . 
	jp z,0c000h		;f020	ca 00 c0 	. . . 

set_rom_pack_disable_f023h:
	ld hl,0e468h		;f023	21 68 e4 	! h . 
	res 6,(hl)		;f026	cb b6 	. . 
	ld a,(hl)			;f028	7e 	~ 
	out (010h),a		;f029	d3 10 	. . 
check_floppy_f02bh:
; bit0=0 --> no floppy
; bit0=1 --> floppy present
; jump to 0ff98h if floppy is found
	in a,(010h)		;f02b	db 10 	. . 
	bit 0,a		;f02d	cb 47 	. G 
	jp nz,0ef98h		;f02f	c2 98 ef 	. . . 
	
;000008h in BASIC_1 has 07eh
	ld a,(00008h)		;f032	3a 08 00 	: . . 
	cp 07eh		;f035	fe 7e 	. ~ 
	jr z,lf045h		;f037	28 0c 	( . 

; so it wasn't the expected memory content
	ld hl,0e468h		;f039	21 68 e4 	! h . 
	set 7,(hl)		;f03c	cb fe 	. . 
	ld a,(hl)			;f03e	7e 	~ 
	ld (hl),a			;f03f	77 	w 
	out (010h),a		;f040	d3 10 	. . 
	jp 0e060h		;f042	c3 60 e0 	. ` . 

lf045h:
	call 0ef74h		;f045	cd 74 ef 	. t . 
	jp 0003bh		;f048	c3 3b 00 	. ; . 
	nop			;f04b	00 	. 
	nop			;f04c	00 	. 
	nop			;f04d	00 	. 
	nop			;f04e	00 	. 
	nop			;f04f	00 	. 
	nop			;f050	00 	. 
	nop			;f051	00 	. 
	nop			;f052	00 	. 
	nop			;f053	00 	. 
	nop			;f054	00 	. 
	nop			;f055	00 	. 
	nop			;f056	00 	. 
	nop			;f057	00 	. 
	nop			;f058	00 	. 
	nop			;f059	00 	. 
	nop			;f05a	00 	. 
	nop			;f05b	00 	. 
	nop			;f05c	00 	. 
	nop			;f05d	00 	. 
	nop			;f05e	00 	. 
	nop			;f05f	00 	. 
	ld (0e4c6h),sp		;f060	ed 73 c6 e4 	. s . . 
	ld sp,lf000h		;f064	31 00 f0 	1 . . 
	call 0ef8ch		;f067	cd 8c ef 	. . . 
	ld hl,0e2e9h		;f06a	21 e9 e2 	! . . 
lf06dh:
	call 0ef6ah		;f06d	cd 6a ef 	. j . 
	call 0ef53h		;f070	cd 53 ef 	. S . 
	cp 00dh		;f073	fe 0d 	. . 
	jr z,lf07fh		;f075	28 08 	( . 
	call 0e3c3h		;f077	cd c3 e3 	. . . 
	ld hl,0e30ch		;f07a	21 0c e3 	! . . 
	jr lf06dh		;f07d	18 ee 	. . 
lf07fh:
	ld hl,(0e49ch)		;f07f	2a 9c e4 	* . . 
	ld a,h			;f082	7c 	| 
	or l			;f083	b5 	. 
	jr nz,lf089h		;f084	20 03 	  . 
	ld hl,lffffh		;f086	21 ff ff 	! . . 
lf089h:
	ld (0e4a4h),hl		;f089	22 a4 e4 	" . . 
	ld hl,0e08ch		;f08c	21 8c e0 	! . . 
	push hl			;f08f	e5 	. 
	call 0e3c3h		;f090	cd c3 e3 	. . . 
	ld c,02ah		;f093	0e 2a 	. * 
	call 0e3d5h		;f095	cd d5 e3 	. . . 
	call 0e3f2h		;f098	cd f2 e3 	. . . 
	cp 01bh		;f09b	fe 1b 	. . 
	ret z			;f09d	c8 	. 
	and 05fh		;f09e	e6 5f 	. _ 
	cp 045h		;f0a0	fe 45 	. E 
	jp z,0e270h		;f0a2	ca 70 e2 	. p . 
	cp 050h		;f0a5	fe 50 	. P 
	jp z,0e257h		;f0a7	ca 57 e2 	. W . 
	cp 04dh		;f0aa	fe 4d 	. M 
	jp z,0e0f2h		;f0ac	ca f2 e0 	. . . 
	cp 044h		;f0af	fe 44 	. D 
	jp z,0e178h		;f0b1	ca 78 e1 	. x . 
	cp 047h		;f0b4	fe 47 	. G 
	jp z,0e1c9h		;f0b6	ca c9 e1 	. . . 
	cp 052h		;f0b9	fe 52 	. R 
	jp z,0e21dh		;f0bb	ca 1d e2 	. . . 
	cp 043h		;f0be	fe 43 	. C 
	ret nz			;f0c0	c0 	. 
	call 0e3cdh		;f0c1	cd cd e3 	. . . 
	call 0ef53h		;f0c4	cd 53 ef 	. S . 
	cp 00dh		;f0c7	fe 0d 	. . 
	ret nz			;f0c9	c0 	. 
	ld hl,(0e49ch)		;f0ca	2a 9c e4 	* . . 
lf0cdh:
	call 0e2dch		;f0cd	cd dc e2 	. . . 
lf0d0h:
	push hl			;f0d0	e5 	. 
	call 0e3abh		;f0d1	cd ab e3 	. . . 
	call 0e3e0h		;f0d4	cd e0 e3 	. . . 
	pop hl			;f0d7	e1 	. 
	jr c,lf0e3h		;f0d8	38 09 	8 . 
	ld (hl),a			;f0da	77 	w 
lf0dbh:
	inc hl			;f0db	23 	# 
	ld a,l			;f0dc	7d 	} 
	and 007h		;f0dd	e6 07 	. . 
	jr nz,lf0d0h		;f0df	20 ef 	  . 
	jr lf0cdh		;f0e1	18 ea 	. . 
lf0e3h:
	cp 020h		;f0e3	fe 20 	.   
	jr nz,lf0ech		;f0e5	20 05 	  . 
	call 0e3cdh		;f0e7	cd cd e3 	. . . 
	jr lf0dbh		;f0ea	18 ef 	. . 
lf0ech:
	cp 02dh		;f0ec	fe 2d 	. - 
	ret nz			;f0ee	c0 	. 
	dec hl			;f0ef	2b 	+ 
	jr lf0cdh		;f0f0	18 db 	. . 
	call 0e3cdh		;f0f2	cd cd e3 	. . . 
	call 0ef53h		;f0f5	cd 53 ef 	. S . 
	cp 02ch		;f0f8	fe 2c 	. , 
	ret nz			;f0fa	c0 	. 
	ld hl,(0e49ch)		;f0fb	2a 9c e4 	* . . 
	ld (0e49eh),hl		;f0fe	22 9e e4 	" . . 
	call 0ef53h		;f101	cd 53 ef 	. S . 
	cp 02ch		;f104	fe 2c 	. , 
	ret nz			;f106	c0 	. 
	ld hl,(0e49eh)		;f107	2a 9e e4 	* . . 
	ex de,hl			;f10a	eb 	. 
	ld hl,(0e49ch)		;f10b	2a 9c e4 	* . . 
	ld (0e4a0h),hl		;f10e	22 a0 e4 	" . . 
	or a			;f111	b7 	. 
	sbc hl,de		;f112	ed 52 	. R 
	ret c			;f114	d8 	. 
lf115h:
	inc hl			;f115	23 	# 
	ld (0e4a2h),hl		;f116	22 a2 e4 	" . . 
	call 0ef53h		;f119	cd 53 ef 	. S . 
	cp 00dh		;f11c	fe 0d 	. . 
	ret nz			;f11e	c0 	. 
	ld hl,(0e4a2h)		;f11f	2a a2 e4 	* . . 
	dec hl			;f122	2b 	+ 
	ex de,hl			;f123	eb 	. 
	ld hl,(0e49ch)		;f124	2a 9c e4 	* . . 
	or a			;f127	b7 	. 
	adc hl,de		;f128	ed 5a 	. Z 
	jr c,lf16ch		;f12a	38 40 	8 @ 
	ex de,hl			;f12c	eb 	. 
	ld hl,(0e4a4h)		;f12d	2a a4 e4 	* . . 
	sbc hl,de		;f130	ed 52 	. R 
	jr c,lf16ch		;f132	38 38 	8 8 
	push de			;f134	d5 	. 
	ld hl,(0e49eh)		;f135	2a 9e e4 	* . . 
	ex de,hl			;f138	eb 	. 
	ld hl,(0e49ch)		;f139	2a 9c e4 	* . . 
	or a			;f13c	b7 	. 
	sbc hl,de		;f13d	ed 52 	. R 
	jr c,lf15eh		;f13f	38 1d 	8 . 
	pop de			;f141	d1 	. 
	ld a,h			;f142	7c 	| 
	or l			;f143	b5 	. 
	jr z,lf157h		;f144	28 11 	( . 
	ld hl,(0e4a2h)		;f146	2a a2 e4 	* . . 
	push hl			;f149	e5 	. 
	pop bc			;f14a	c1 	. 
	ld hl,(0e4a0h)		;f14b	2a a0 e4 	* . . 
lf14eh:
	ld a,(hl)			;f14e	7e 	~ 
	ld (de),a			;f14f	12 	. 
	dec hl			;f150	2b 	+ 
	dec de			;f151	1b 	. 
	dec bc			;f152	0b 	. 
	ld a,b			;f153	78 	x 
	or c			;f154	b1 	. 
	jr nz,lf14eh		;f155	20 f7 	  . 
lf157h:
	ld hl,0e31ah		;f157	21 1a e3 	! . . 
	call 0ef6ah		;f15a	cd 6a ef 	. j . 
	ret			;f15d	c9 	. 
lf15eh:
	ld hl,(0e4a2h)		;f15e	2a a2 e4 	* . . 
	push hl			;f161	e5 	. 
	pop bc			;f162	c1 	. 
	ld hl,(0e49ch)		;f163	2a 9c e4 	* . . 
	ex de,hl			;f166	eb 	. 
	ldir		;f167	ed b0 	. . 
	pop de			;f169	d1 	. 
	jr lf157h		;f16a	18 eb 	. . 
lf16ch:
	ld hl,0e328h		;f16c	21 28 e3 	! ( . 
	call 0ef6ah		;f16f	cd 6a ef 	. j . 
	ld hl,0e30ch		;f172	21 0c e3 	! . . 
	jp 0e06dh		;f175	c3 6d e0 	. m . 
	call 0e3cdh		;f178	cd cd e3 	. . . 
	call 0ef53h		;f17b	cd 53 ef 	. S . 
	cp 02ch		;f17e	fe 2c 	. , 
	ret nz			;f180	c0 	. 
	ld hl,(0e49ch)		;f181	2a 9c e4 	* . . 
	ld (0e49eh),hl		;f184	22 9e e4 	" . . 
	call 0ef53h		;f187	cd 53 ef 	. S . 
	cp 00dh		;f18a	fe 0d 	. . 
	ret nz			;f18c	c0 	. 
	ld hl,(0e49eh)		;f18d	2a 9e e4 	* . . 
	ex de,hl			;f190	eb 	. 
	ld hl,(0e49ch)		;f191	2a 9c e4 	* . . 
	or a			;f194	b7 	. 
	sbc hl,de		;f195	ed 52 	. R 
	ret c			;f197	d8 	. 
	inc hl			;f198	23 	# 
	push hl			;f199	e5 	. 
	ex de,hl			;f19a	eb 	. 
	pop bc			;f19b	c1 	. 
lf19ch:
	push bc			;f19c	c5 	. 
	push hl			;f19d	e5 	. 
	call 0e2dch		;f19e	cd dc e2 	. . . 
	call 0e2d0h		;f1a1	cd d0 e2 	. . . 
	pop hl			;f1a4	e1 	. 
	pop bc			;f1a5	c1 	. 
	ld de,0e4a6h		;f1a6	11 a6 e4 	. . . 
lf1a9h:
	call 0e38dh		;f1a9	cd 8d e3 	. . . 
	ld a,(hl)			;f1ac	7e 	~ 
	ld (de),a			;f1ad	12 	. 
	dec bc			;f1ae	0b 	. 
	ld a,b			;f1af	78 	x 
	or c			;f1b0	b1 	. 
	inc hl			;f1b1	23 	# 
	inc de			;f1b2	13 	. 
	jp z,0e282h		;f1b3	ca 82 e2 	. . . 
	ld a,(0e462h)		;f1b6	3a 62 e4 	: b . 
	xor 00fh		;f1b9	ee 0f 	. . 
	and 00fh		;f1bb	e6 0f 	. . 
	push bc			;f1bd	c5 	. 
	ld b,a			;f1be	47 	G 
	ld a,l			;f1bf	7d 	} 
	and b			;f1c0	a0 	. 
	pop bc			;f1c1	c1 	. 
	jr nz,lf1a9h		;f1c2	20 e5 	  . 
	call 0e282h		;f1c4	cd 82 e2 	. . . 
	jr lf19ch		;f1c7	18 d3 	. . 
	call 0e3cdh		;f1c9	cd cd e3 	. . . 
	call 0ef53h		;f1cc	cd 53 ef 	. S . 
	cp 00dh		;f1cf	fe 0d 	. . 
	ret nz			;f1d1	c0 	. 
	ld hl,00038h		;f1d2	21 38 00 	! 8 . 
	ex de,hl			;f1d5	eb 	. 
	ld hl,0e1e7h		;f1d6	21 e7 e1 	! . . 
	ld bc,00003h		;f1d9	01 03 00 	. . . 
	ldir		;f1dc	ed b0 	. . 
	ld hl,0e1e6h		;f1de	21 e6 e1 	! . . 
	push hl			;f1e1	e5 	. 
	ld hl,(0e49ch)		;f1e2	2a 9c e4 	* . . 
	jp (hl)			;f1e5	e9 	. 
	ret			;f1e6	c9 	. 
	jp 0e1eah		;f1e7	c3 ea e1 	. . . 
	ld (0e4bdh),hl		;f1ea	22 bd e4 	" . . 
	pop hl			;f1ed	e1 	. 
	ld (0e4b7h),hl		;f1ee	22 b7 e4 	" . . 
	push af			;f1f1	f5 	. 
	pop hl			;f1f2	e1 	. 
	ld (0e4bfh),hl		;f1f3	22 bf e4 	" . . 
	ld (0e4b9h),bc		;f1f6	ed 43 b9 e4 	. C . . 
	ld (0e4bbh),de		;f1fa	ed 53 bb e4 	. S . . 
	ld a,i		;f1fe	ed 57 	. W 
	ld (0e4c1h),a		;f200	32 c1 e4 	2 . . 
	ld (0e4c2h),ix		;f203	dd 22 c2 e4 	. " . . 
	ld (0e4c4h),iy		;f207	fd 22 c4 e4 	. " . . 
	ld hl,0e353h		;f20b	21 53 e3 	! S . 
	call 0ef6ah		;f20e	cd 6a ef 	. j . 
	ld hl,(0e4b7h)		;f211	2a b7 e4 	* . . 
	call 0e393h		;f214	cd 93 e3 	. . . 
	ld sp,lf000h		;f217	31 00 f0 	1 . . 
	jp 0e08ch		;f21a	c3 8c e0 	. . . 
	ld hl,0e360h		;f21d	21 60 e3 	! ` . 
	call 0ef6ah		;f220	cd 6a ef 	. j . 
	ld hl,(0e4b7h)		;f223	2a b7 e4 	* . . 
	call 0e393h		;f226	cd 93 e3 	. . . 
	ld hl,0e4b9h		;f229	21 b9 e4 	! . . 
	ld c,004h		;f22c	0e 04 	. . 
lf22eh:
	push bc			;f22e	c5 	. 
	inc hl			;f22f	23 	# 
	push hl			;f230	e5 	. 
	call 0e38dh		;f231	cd 8d e3 	. . . 
	pop hl			;f234	e1 	. 
	dec hl			;f235	2b 	+ 
	push hl			;f236	e5 	. 
	call 0e38dh		;f237	cd 8d e3 	. . . 
	pop hl			;f23a	e1 	. 
	inc hl			;f23b	23 	# 
	inc hl			;f23c	23 	# 
	pop bc			;f23d	c1 	. 
	dec c			;f23e	0d 	. 
	jr nz,lf22eh		;f23f	20 ed 	  . 
	call 0e38dh		;f241	cd 8d e3 	. . . 
	call 0e3cdh		;f244	cd cd e3 	. . . 
	ld hl,(0e4c2h)		;f247	2a c2 e4 	* . . 
	call 0e393h		;f24a	cd 93 e3 	. . . 
	call 0e3cdh		;f24d	cd cd e3 	. . . 
	ld hl,(0e4c4h)		;f250	2a c4 e4 	* . . 
	call 0e393h		;f253	cd 93 e3 	. . . 
	ret			;f256	c9 	. 
	ld a,(0e4b6h)		;f257	3a b6 e4 	: . . 
	or a			;f25a	b7 	. 
	jr z,lf269h		;f25b	28 0c 	( . 
	ld a,000h		;f25d	3e 00 	> . 
	ld hl,0e338h		;f25f	21 38 e3 	! 8 . 
lf262h:
	ld (0e4b6h),a		;f262	32 b6 e4 	2 . . 
	call 0ef6ah		;f265	cd 6a ef 	. j . 
	ret			;f268	c9 	. 
lf269h:
	ld a,001h		;f269	3e 01 	> . 
	ld hl,0e346h		;f26b	21 46 e3 	! F . 
	jr lf262h		;f26e	18 f2 	. . 
	ld a,(00008h)		;f270	3a 08 00 	: . . 
	cp 07eh		;f273	fe 7e 	. ~ 
	jr nz,lf27dh		;f275	20 06 	  . 
	call 0ef74h		;f277	cd 74 ef 	. t . 
	ld a,00ch		;f27a	3e 0c 	> . 
	rst 18h			;f27c	df 	. 
lf27dh:
	ld sp,(0e4c6h)		;f27d	ed 7b c6 e4 	. { . . 
	ret			;f281	c9 	. 
	push hl			;f282	e5 	. 
	push bc			;f283	c5 	. 
	ld a,(0e462h)		;f284	3a 62 e4 	: b . 
	and 018h		;f287	e6 18 	. . 
	ld c,a			;f289	4f 	O 
	ld b,000h		;f28a	06 00 	. . 
	ld hl,0e4a6h		;f28c	21 a6 e4 	! . . 
	or a			;f28f	b7 	. 
	adc hl,bc		;f290	ed 4a 	. J 
	or a			;f292	b7 	. 
	sbc hl,de		;f293	ed 52 	. R 
	ld a,l			;f295	7d 	} 
	or a			;f296	b7 	. 
	jr z,lf2a7h		;f297	28 0e 	( . 
lf299h:
	push hl			;f299	e5 	. 
	call 0e3cdh		;f29a	cd cd e3 	. . . 
	call 0e3cdh		;f29d	cd cd e3 	. . . 
	call 0e3cdh		;f2a0	cd cd e3 	. . . 
	pop hl			;f2a3	e1 	. 
	dec l			;f2a4	2d 	- 
	jr nz,lf299h		;f2a5	20 f2 	  . 
lf2a7h:
	call 0e3cdh		;f2a7	cd cd e3 	. . . 
	call 0e3cdh		;f2aa	cd cd e3 	. . . 
	ld a,(0e462h)		;f2ad	3a 62 e4 	: b . 
	and 018h		;f2b0	e6 18 	. . 
	ld b,a			;f2b2	47 	G 
	ld hl,0e4a6h		;f2b3	21 a6 e4 	! . . 
lf2b6h:
	push hl			;f2b6	e5 	. 
	push bc			;f2b7	c5 	. 
	ld a,(hl)			;f2b8	7e 	~ 
	cp 020h		;f2b9	fe 20 	.   
	jr c,lf2c1h		;f2bb	38 04 	8 . 
	cp 07fh		;f2bd	fe 7f 	.  
	jr c,lf2c3h		;f2bf	38 02 	8 . 
lf2c1h:
	ld a,02eh		;f2c1	3e 2e 	> . 
lf2c3h:
	ld c,a			;f2c3	4f 	O 
	call 0e3d5h		;f2c4	cd d5 e3 	. . . 
	pop bc			;f2c7	c1 	. 
	pop hl			;f2c8	e1 	. 
	inc hl			;f2c9	23 	# 
	dec b			;f2ca	05 	. 
	jr nz,lf2b6h		;f2cb	20 e9 	  . 
	pop bc			;f2cd	c1 	. 
	pop hl			;f2ce	e1 	. 
	ret			;f2cf	c9 	. 
	ld hl,0e4a6h		;f2d0	21 a6 e4 	! . . 
	ld b,010h		;f2d3	06 10 	. . 
lf2d5h:
	ld (hl),000h		;f2d5	36 00 	6 . 
	inc hl			;f2d7	23 	# 
	dec b			;f2d8	05 	. 
	jr nz,lf2d5h		;f2d9	20 fa 	  . 
	ret			;f2db	c9 	. 
	call 0e3c3h		;f2dc	cd c3 e3 	. . . 
	call 0e393h		;f2df	cd 93 e3 	. . . 
	ret			;f2e2	c9 	. 
	call 0e3f2h		;f2e3	cd f2 e3 	. . . 
	cp 02ch		;f2e6	fe 2c 	. , 
	ret			;f2e8	c9 	. 
	inc c			;f2e9	0c 	. 
	ld hl,(04d20h)		;f2ea	2a 20 4d 	*   M 
	ld c,a			;f2ed	4f 	O 
	ld c,(hl)			;f2ee	4e 	N 
	ld c,c			;f2ef	49 	I 
	ld d,h			;f2f0	54 	T 
	ld c,a			;f2f1	4f 	O 
	ld d,d			;f2f2	52 	R 
	jr nz,lf31fh		;f2f3	20 2a 	  * 
	jr nz,lf31fh		;f2f5	20 28 	  ( 
	ld d,(hl)			;f2f7	56 	V 
	ld l,020h		;f2f8	2e 20 	.   
	ld sp,0322eh		;f2fa	31 2e 32 	1 . 2 
	add hl,hl			;f2fd	29 	) 
	jr nz,lf34ah		;f2fe	20 4a 	  J 
	ld (hl),l			;f300	75 	u 
	ld l,(hl)			;f301	6e 	n 
	ld h,l			;f302	65 	e 
	jr nz,lf336h		;f303	20 31 	  1 
	add hl,sp			;f305	39 	9 
	jr c,lf33bh		;f306	38 33 	8 3 
	dec c			;f308	0d 	. 
	ld a,(bc)			;f309	0a 	. 
	dec c			;f30a	0d 	. 
	ld a,(bc)			;f30b	0a 	. 
	ld c,l			;f30c	4d 	M 
	ld h,l			;f30d	65 	e 
	ld l,l			;f30e	6d 	m 
	ld l,a			;f30f	6f 	o 
	ld (hl),d			;f310	72 	r 
	ld a,c			;f311	79 	y 
	jr nz,lf355h		;f312	20 41 	  A 
	ld (hl),d			;f314	72 	r 
	ld h,l			;f315	65 	e 
	ld h,c			;f316	61 	a 
	jr nz,lf358h		;f317	20 3f 	  ? 
	nop			;f319	00 	. 
	dec c			;f31a	0d 	. 
	ld a,(bc)			;f31b	0a 	. 
	ld b,e			;f31c	43 	C 
	ld l,a			;f31d	6f 	o 
	ld l,l			;f31e	6d 	m 
lf31fh:
	ld (hl),b			;f31f	70 	p 
	ld l,h			;f320	6c 	l 
	ld h,l			;f321	65 	e 
	ld (hl),h			;f322	74 	t 
	ld h,l			;f323	65 	e 
	ld h,h			;f324	64 	d 
	dec c			;f325	0d 	. 
	ld a,(bc)			;f326	0a 	. 
	nop			;f327	00 	. 
	dec c			;f328	0d 	. 
	ld a,(bc)			;f329	0a 	. 
	ld b,c			;f32a	41 	A 
	ld (hl),d			;f32b	72 	r 
	ld h,l			;f32c	65 	e 
	ld h,c			;f32d	61 	a 
	jr nz,81		;f32e	20 4f 	  O 
	halt			;f330	76 	v 
	ld h,l			;f331	65 	e 
	ld (hl),d			;f332	72 	r 
	jr nz,lf356h		;f333	20 21 	  ! 
	dec c			;f335	0d 	. 
lf336h:
	ld a,(bc)			;f336	0a 	. 
	nop			;f337	00 	. 
	dec c			;f338	0d 	. 
	ld a,(bc)			;f339	0a 	. 
	ld d,b			;f33a	50 	P 
lf33bh:
	ld (hl),d			;f33b	72 	r 
	ld l,c			;f33c	69 	i 
	ld l,(hl)			;f33d	6e 	n 
	ld (hl),h			;f33e	74 	t 
	jr nz,lf390h		;f33f	20 4f 	  O 
	ld b,(hl)			;f341	46 	F 
	ld b,(hl)			;f342	46 	F 
	dec c			;f343	0d 	. 
	ld a,(bc)			;f344	0a 	. 
	nop			;f345	00 	. 
	dec c			;f346	0d 	. 
	ld a,(bc)			;f347	0a 	. 
	ld d,b			;f348	50 	P 
	ld (hl),d			;f349	72 	r 
lf34ah:
	ld l,c			;f34a	69 	i 
	ld l,(hl)			;f34b	6e 	n 
	ld (hl),h			;f34c	74 	t 
	jr nz,lf39eh		;f34d	20 4f 	  O 
	ld c,(hl)			;f34f	4e 	N 
	dec c			;f350	0d 	. 
	ld a,(bc)			;f351	0a 	. 
	nop			;f352	00 	. 
	dec c			;f353	0d 	. 
	ld a,(bc)			;f354	0a 	. 
lf355h:
	ld b,d			;f355	42 	B 
lf356h:
	ld (hl),d			;f356	72 	r 
	ld h,l			;f357	65 	e 
lf358h:
	ld h,c			;f358	61 	a 
	ld l,e			;f359	6b 	k 
	jr nz,99		;f35a	20 61 	  a 
	ld (hl),h			;f35c	74 	t 
	jr nz,37		;f35d	20 23 	  # 
	nop			;f35f	00 	. 
	dec c			;f360	0d 	. 
	ld a,(bc)			;f361	0a 	. 
	jr nz,lf3b4h		;f362	20 50 	  P 
	ld b,e			;f364	43 	C 
	jr nz,lf387h		;f365	20 20 	    
	jr nz,lf3abh		;f367	20 42 	  B 
	jr nz,lf38bh		;f369	20 20 	    
	ld b,e			;f36b	43 	C 
	jr nz,34		;f36c	20 20 	    
	ld b,h			;f36e	44 	D 
	jr nz,lf391h		;f36f	20 20 	    
	ld b,l			;f371	45 	E 
	jr nz,lf394h		;f372	20 20 	    
	ld c,b			;f374	48 	H 
	jr nz,lf397h		;f375	20 20 	    
	ld c,h			;f377	4c 	L 
	jr nz,34		;f378	20 20 	    
	ld b,c			;f37a	41 	A 
	jr nz,lf39dh		;f37b	20 20 	    
	ld b,(hl)			;f37d	46 	F 
	jr nz,lf3a0h		;f37e	20 20 	    
	ld c,c			;f380	49 	I 
	jr nz,34		;f381	20 20 	    
	ld c,c			;f383	49 	I 
	ld e,b			;f384	58 	X 
	jr nz,34		;f385	20 20 	    
lf387h:
	jr nz,75		;f387	20 49 	  I 
	ld e,c			;f389	59 	Y 
	dec c			;f38a	0d 	. 
lf38bh:
	ld a,(bc)			;f38b	0a 	. 
	nop			;f38c	00 	. 
	call 0e3cdh		;f38d	cd cd e3 	. . . 
lf390h:
	ld a,(hl)			;f390	7e 	~ 
lf391h:
	jr lf398h		;f391	18 05 	. . 
	ld a,h			;f393	7c 	| 
lf394h:
	call 0e39ch		;f394	cd 9c e3 	. . . 
lf397h:
	ld a,l			;f397	7d 	} 
lf398h:
	call 0e39ch		;f398	cd 9c e3 	. . . 
	ret			;f39b	c9 	. 
	push bc			;f39c	c5 	. 
lf39dh:
	push af			;f39d	f5 	. 
lf39eh:
	rrca			;f39e	0f 	. 
	rrca			;f39f	0f 	. 
lf3a0h:
	rrca			;f3a0	0f 	. 
	rrca			;f3a1	0f 	. 
	call 0e3b2h		;f3a2	cd b2 e3 	. . . 
	pop af			;f3a5	f1 	. 
	call 0e3b2h		;f3a6	cd b2 e3 	. . . 
	pop bc			;f3a9	c1 	. 
	ret			;f3aa	c9 	. 
lf3abh:
	call 0e38dh		;f3ab	cd 8d e3 	. . . 
	ld c,02dh		;f3ae	0e 2d 	. - 
	jr lf3bbh		;f3b0	18 09 	. . 
	and 00fh		;f3b2	e6 0f 	. . 
lf3b4h:
	cp 00ah		;f3b4	fe 0a 	. . 
	jr nc,lf3bfh		;f3b6	30 07 	0 . 
	add a,030h		;f3b8	c6 30 	. 0 
lf3bah:
	ld c,a			;f3ba	4f 	O 
lf3bbh:
	call 0e3d5h		;f3bb	cd d5 e3 	. . . 
	ret			;f3be	c9 	. 
lf3bfh:
	add a,037h		;f3bf	c6 37 	. 7 
	jr lf3bah		;f3c1	18 f7 	. . 
	push bc			;f3c3	c5 	. 
	ld c,00dh		;f3c4	0e 0d 	. . 
	call 0e3d5h		;f3c6	cd d5 e3 	. . . 
	ld c,00ah		;f3c9	0e 0a 	. . 
	jr lf3d0h		;f3cb	18 03 	. . 
	push bc			;f3cd	c5 	. 
	ld c,020h		;f3ce	0e 20 	.   
lf3d0h:
	call 0e3d5h		;f3d0	cd d5 e3 	. . . 
	pop bc			;f3d3	c1 	. 
	ret			;f3d4	c9 	. 
	call 0e7ach		;f3d5	cd ac e7 	. . . 
	ld a,(0e4b6h)		;f3d8	3a b6 e4 	: . . 
	or a			;f3db	b7 	. 
	call nz,0e439h		;f3dc	c4 39 e4 	. 9 . 
	ret			;f3df	c9 	. 
	call 0ef34h		;f3e0	cd 34 ef 	. 4 . 
	ret c			;f3e3	d8 	. 
	rlca			;f3e4	07 	. 
	rlca			;f3e5	07 	. 
	rlca			;f3e6	07 	. 
	rlca			;f3e7	07 	. 
	ld b,a			;f3e8	47 	G 
	call 0ef34h		;f3e9	cd 34 ef 	. 4 . 
	ret c			;f3ec	d8 	. 
	add a,b			;f3ed	80 	. 
	ld (0e49ch),a		;f3ee	32 9c e4 	2 . . 
	ret			;f3f1	c9 	. 
	call 0e762h		;f3f2	cd 62 e7 	. b . 
	push af			;f3f5	f5 	. 
	ld c,a			;f3f6	4f 	O 
	call 0e3d5h		;f3f7	cd d5 e3 	. . . 
	pop af			;f3fa	f1 	. 
	ret			;f3fb	c9 	. 
	nop			;f3fc	00 	. 
	jp 0ef91h		;f3fd	c3 91 ef 	. . . 
	jp 0e060h		;f400	c3 60 e0 	. ` . 
	jp 0eb10h		;f403	c3 10 eb 	. . . 
	jp 0eaf6h		;f406	c3 f6 ea 	. . . 
	jp 0eaech		;f409	c3 ec ea 	. . . 
	jp 0e5b1h		;f40c	c3 b1 e5 	. . . 
	jp 0e762h		;f40f	c3 62 e7 	. b . 
	jp 0e7ach		;f412	c3 ac e7 	. . . 
	jp 0e5b1h		;f415	c3 b1 e5 	. . . 
	jp 0e762h		;f418	c3 62 e7 	. b . 
	jp 0e7ach		;f41b	c3 ac e7 	. . . 
	jp 0e5b1h		;f41e	c3 b1 e5 	. . . 
	jp 0e762h		;f421	c3 62 e7 	. b . 
	jp 0e7ach		;f424	c3 ac e7 	. . . 
	jp 0e762h		;f427	c3 62 e7 	. b . 
	jp 0eaf6h		;f42a	c3 f6 ea 	. . . 
	jp 0eaf6h		;f42d	c3 f6 ea 	. . . 
	jp 0e7ach		;f430	c3 ac e7 	. . . 
	jp 0eae3h		;f433	c3 e3 ea 	. . . 
	jp 0eaech		;f436	c3 ec ea 	. . . 
	jp 0eac2h		;f439	c3 c2 ea 	. . . 
	jp 0eac2h		;f43c	c3 c2 ea 	. . . 
	ld a,0ffh		;f43f	3e ff 	> . 
	ret			;f441	c9 	. 
	nop			;f442	00 	. 
	xor a			;f443	af 	. 
	ret			;f444	c9 	. 
	jp 0eab5h		;f445	c3 b5 ea 	. . . 
	nop			;f448	00 	. 
	xor a			;f449	af 	. 
	ret			;f44a	c9 	. 
	jp 0e59dh		;f44b	c3 9d e5 	. . . 
	jp 0e5a3h		;f44e	c3 a3 e5 	. . . 
	jp 0e67bh		;f451	c3 7b e6 	. { . 
	jp 0ea9eh		;f454	c3 9e ea 	. . . 
	jp 0ea96h		;f457	c3 96 ea 	. . . 
	jp 0e1eah		;f45a	c3 ea e1 	. . . 
	jp lf115h		;f45d	c3 15 f1 	. . . 
	jr lf47ah		;f460	18 18 	. . 
	ld d,b			;f462	50 	P 
	nop			;f463	00 	. 
	jr lf47eh		;f464	18 18 	. . 
	jr nc,lf46fh		;f466	30 07 	0 . 

; Data section
	; these bytes are used for storing the port 010h and 020h
	; config/status register values
	DB			;f468	00 	. 
	DB			;f469	00 	. 

	dec b			;f46a	05 	. 
	nop			;f46b	00 	. 
	push de			;f46c	d5 	. 
	nop			;f46d	00 	. 
	nop			;f46e	00 	. 
lf46fh:
	nop			;f46f	00 	. 
	nop			;f470	00 	. 
	nop			;f471	00 	. 
	nop			;f472	00 	. 
	nop			;f473	00 	. 
	nop			;f474	00 	. 
	nop			;f475	00 	. 
	nop			;f476	00 	. 
	nop			;f477	00 	. 
	nop			;f478	00 	. 
	nop			;f479	00 	. 
lf47ah:
	nop			;f47a	00 	. 
	nop			;f47b	00 	. 
	nop			;f47c	00 	. 
	nop			;f47d	00 	. 
lf47eh:
	nop			;f47e	00 	. 
	nop			;f47f	00 	. 
	nop			;f480	00 	. 
	nop			;f481	00 	. 
	nop			;f482	00 	. 
	nop			;f483	00 	. 
	nop			;f484	00 	. 
	nop			;f485	00 	. 
	nop			;f486	00 	. 
	nop			;f487	00 	. 
	nop			;f488	00 	. 
	nop			;f489	00 	. 
	nop			;f48a	00 	. 
	nop			;f48b	00 	. 
	nop			;f48c	00 	. 
	nop			;f48d	00 	. 
	nop			;f48e	00 	. 
	nop			;f48f	00 	. 
	nop			;f490	00 	. 
	nop			;f491	00 	. 
	nop			;f492	00 	. 
	nop			;f493	00 	. 
	nop			;f494	00 	. 
	nop			;f495	00 	. 
	nop			;f496	00 	. 
	nop			;f497	00 	. 
	nop			;f498	00 	. 
	nop			;f499	00 	. 
	nop			;f49a	00 	. 
	nop			;f49b	00 	. 
	nop			;f49c	00 	. 
	nop			;f49d	00 	. 
	nop			;f49e	00 	. 
	nop			;f49f	00 	. 
	nop			;f4a0	00 	. 
	nop			;f4a1	00 	. 
	nop			;f4a2	00 	. 
	nop			;f4a3	00 	. 
	nop			;f4a4	00 	. 
	nop			;f4a5	00 	. 
	nop			;f4a6	00 	. 
	nop			;f4a7	00 	. 
	nop			;f4a8	00 	. 
	nop			;f4a9	00 	. 
	nop			;f4aa	00 	. 
	nop			;f4ab	00 	. 
	nop			;f4ac	00 	. 
	nop			;f4ad	00 	. 
	nop			;f4ae	00 	. 
	nop			;f4af	00 	. 
	nop			;f4b0	00 	. 
	nop			;f4b1	00 	. 
	nop			;f4b2	00 	. 
	nop			;f4b3	00 	. 
	nop			;f4b4	00 	. 
	nop			;f4b5	00 	. 
	nop			;f4b6	00 	. 
	nop			;f4b7	00 	. 
	nop			;f4b8	00 	. 
	nop			;f4b9	00 	. 
	nop			;f4ba	00 	. 
	nop			;f4bb	00 	. 
	nop			;f4bc	00 	. 
	nop			;f4bd	00 	. 
	nop			;f4be	00 	. 
	nop			;f4bf	00 	. 
	nop			;f4c0	00 	. 
	nop			;f4c1	00 	. 
	nop			;f4c2	00 	. 
	nop			;f4c3	00 	. 
	nop			;f4c4	00 	. 
	nop			;f4c5	00 	. 
	nop			;f4c6	00 	. 
	nop			;f4c7	00 	. 
	nop			;f4c8	00 	. 
	nop			;f4c9	00 	. 
	nop			;f4ca	00 	. 
	nop			;f4cb	00 	. 
	nop			;f4cc	00 	. 
	nop			;f4cd	00 	. 
	nop			;f4ce	00 	. 
	nop			;f4cf	00 	. 
	nop			;f4d0	00 	. 
	nop			;f4d1	00 	. 
	nop			;f4d2	00 	. 
	add a,b			;f4d3	80 	. 
	jp 0ea09h		;f4d4	c3 09 ea 	. . . 
	jp 0ea16h		;f4d7	c3 16 ea 	. . . 
	jp 0ea27h		;f4da	c3 27 ea 	. ' . 
	jr nc,51		;f4dd	30 31 	0 1 
	ld (03433h),a		;f4df	32 33 34 	2 3 4 
	dec (hl)			;f4e2	35 	5 
	ld (hl),037h		;f4e3	36 37 	6 7 
	jr c,59		;f4e5	38 39 	8 9 
	ld l,0ffh		;f4e7	2e ff 	. . 
	dec hl			;f4e9	2b 	+ 
	dec l			;f4ea	2d 	- 
	dec a			;f4eb	3d 	= 
	rst 38h			;f4ec	ff 	. 
	rst 38h			;f4ed	ff 	. 
	ld h,c			;f4ee	61 	a 
	ld h,d			;f4ef	62 	b 
	ld h,e			;f4f0	63 	c 
	ld h,h			;f4f1	64 	d 
	ld h,l			;f4f2	65 	e 
	ld h,(hl)			;f4f3	66 	f 
	ld h,a			;f4f4	67 	g 
	ld l,b			;f4f5	68 	h 
	ld l,c			;f4f6	69 	i 
	ld l,d			;f4f7	6a 	j 
	ld l,e			;f4f8	6b 	k 
	ld l,h			;f4f9	6c 	l 
	ld l,l			;f4fa	6d 	m 
	ld l,(hl)			;f4fb	6e 	n 
	ld l,a			;f4fc	6f 	o 
	ld (hl),b			;f4fd	70 	p 
	ld (hl),c			;f4fe	71 	q 
	ld (hl),d			;f4ff	72 	r 
	ld (hl),e			;f500	73 	s 
	ld (hl),h			;f501	74 	t 
	ld (hl),l			;f502	75 	u 
	halt			;f503	76 	v 
	ld (hl),a			;f504	77 	w 
	ld a,b			;f505	78 	x 
	ld a,c			;f506	79 	y 
	ld a,d			;f507	7a 	z 
	rst 38h			;f508	ff 	. 
	rst 38h			;f509	ff 	. 
	rst 38h			;f50a	ff 	. 
	rst 38h			;f50b	ff 	. 
	rst 38h			;f50c	ff 	. 
	jr nc,lf540h		;f50d	30 31 	0 1 
	ld (03433h),a		;f50f	32 33 34 	2 3 4 
	dec (hl)			;f512	35 	5 
	ld (hl),037h		;f513	36 37 	6 7 
	jr c,lf550h		;f515	38 39 	8 9 
	dec l			;f517	2d 	- 
	ld e,(hl)			;f518	5e 	^ 
	ld b,b			;f519	40 	@ 
	ld e,e			;f51a	5b 	[ 
	ld e,l			;f51b	5d 	] 
	ld a,(lffffh)		;f51c	3a ff ff 	: . . 
	jr nz,94		;f51f	20 5c 	  \ 
	inc l			;f521	2c 	, 
	ld l,02fh		;f522	2e 2f 	. / 
	dec sp			;f524	3b 	; 
	rra			;f525	1f 	. 
	inc e			;f526	1c 	. 
	dec e			;f527	1d 	. 
	ld e,09bh		;f528	1e 9b 	. . 
	rst 38h			;f52a	ff 	. 
	ld a,a			;f52b	7f 	 
	dec de			;f52c	1b 	. 
	rst 38h			;f52d	ff 	. 
	ld a,a			;f52e	7f 	 
	rst 38h			;f52f	ff 	. 
	add hl,bc			;f530	09 	. 
	dec c			;f531	0d 	. 
	rst 18h			;f532	df 	. 
	dec bc			;f533	0b 	. 
	inc bc			;f534	03 	. 
	rst 38h			;f535	ff 	. 
	rst 38h			;f536	ff 	. 
	add a,(hl)			;f537	86 	. 
	add a,l			;f538	85 	. 
	add a,h			;f539	84 	. 
	add a,e			;f53a	83 	. 
	add a,d			;f53b	82 	. 
	add a,c			;f53c	81 	. 
	call po,0ebe2h		;f53d	e4 e2 eb 	. . . 
lf540h:
	ex (sp),hl			;f540	e3 	. 
	ret pe			;f541	e8 	. 
	and 0e9h		;f542	e6 e9 	. . 
	ret po			;f544	e0 	. 
	jp pe,0e5e1h		;f545	ea e1 e5 	. . . 
	rst 38h			;f548	ff 	. 
	ld hl,(0e72fh)		;f549	2a 2f e7 	* / . 
	rst 38h			;f54c	ff 	. 
	rst 38h			;f54d	ff 	. 
	ld b,c			;f54e	41 	A 
	ld b,d			;f54f	42 	B 
lf550h:
	ld b,e			;f550	43 	C 
	ld b,h			;f551	44 	D 
	ld b,l			;f552	45 	E 
	ld b,(hl)			;f553	46 	F 
	ld b,a			;f554	47 	G 
	ld c,b			;f555	48 	H 
	ld c,c			;f556	49 	I 
	ld c,d			;f557	4a 	J 
	ld c,e			;f558	4b 	K 
	ld c,h			;f559	4c 	L 
	ld c,l			;f55a	4d 	M 
	ld c,(hl)			;f55b	4e 	N 
	ld c,a			;f55c	4f 	O 
	ld d,b			;f55d	50 	P 
	ld d,c			;f55e	51 	Q 
	ld d,d			;f55f	52 	R 
	ld d,e			;f560	53 	S 
	ld d,h			;f561	54 	T 
	ld d,l			;f562	55 	U 
	ld d,(hl)			;f563	56 	V 
	ld d,a			;f564	57 	W 
	ld e,b			;f565	58 	X 
	ld e,c			;f566	59 	Y 
	ld e,d			;f567	5a 	Z 
	rst 38h			;f568	ff 	. 
	rst 38h			;f569	ff 	. 
	rst 38h			;f56a	ff 	. 
	rst 38h			;f56b	ff 	. 
	rst 38h			;f56c	ff 	. 
	ld e,a			;f56d	5f 	_ 
	ld hl,02322h		;f56e	21 22 23 	! " # 
	inc h			;f571	24 	$ 
	dec h			;f572	25 	% 
	ld h,027h		;f573	26 27 	& ' 
	jr z,lf5a0h		;f575	28 29 	( ) 
	dec a			;f577	3d 	= 
	ld a,(hl)			;f578	7e 	~ 
	ld h,b			;f579	60 	` 
	ld a,e			;f57a	7b 	{ 
	ld a,l			;f57b	7d 	} 
	ld hl,(lffffh)		;f57c	2a ff ff 	* . . 
	jr nz,126		;f57f	20 7c 	  | 
	inc a			;f581	3c 	< 
	ld a,03fh		;f582	3e 3f 	> ? 
	dec hl			;f584	2b 	+ 
	call pe,0eeefh		;f585	ec ef ee 	. . . 
	defb 0edh;next byte illegal after ed		;f588	ed 	. 
	sbc a,e			;f589	9b 	. 
	rst 38h			;f58a	ff 	. 
	ld a,a			;f58b	7f 	 
	dec de			;f58c	1b 	. 
	rst 38h			;f58d	ff 	. 
	ld (de),a			;f58e	12 	. 
	rst 38h			;f58f	ff 	. 
	add hl,bc			;f590	09 	. 
	dec c			;f591	0d 	. 
	rst 18h			;f592	df 	. 
	inc c			;f593	0c 	. 
	inc bc			;f594	03 	. 
	rst 38h			;f595	ff 	. 
	rst 38h			;f596	ff 	. 
	adc a,h			;f597	8c 	. 
	adc a,e			;f598	8b 	. 
	adc a,d			;f599	8a 	. 
	adc a,c			;f59a	89 	. 
	adc a,b			;f59b	88 	. 
	add a,a			;f59c	87 	. 
	call 0ea7eh		;f59d	cd 7e ea 	. ~ . 
lf5a0h:
	call 0ee78h		;f5a0	cd 78 ee 	. x . 
	ld hl,0e471h		;f5a3	21 71 e4 	! q . 
	ld de,0e472h		;f5a6	11 72 e4 	. r . 
	ld bc,00060h		;f5a9	01 60 00 	. ` . 
	ld (hl),000h		;f5ac	36 00 	6 . 
	ldir		;f5ae	ed b0 	. . 
	ret			;f5b0	c9 	. 
	push hl			;f5b1	e5 	. 
	push de			;f5b2	d5 	. 
	push bc			;f5b3	c5 	. 
	ld a,(0e48ah)		;f5b4	3a 8a e4 	: . . 
	cp 080h		;f5b7	fe 80 	. . 
	jr z,lf5e1h		;f5b9	28 26 	( & 
	cp 088h		;f5bb	fe 88 	. . 
	jr z,lf5e1h		;f5bd	28 22 	( " 
	ld hl,0e47eh		;f5bf	21 7e e4 	! ~ . 
	call 0e66eh		;f5c2	cd 6e e6 	. n . 
	ld hl,0e47eh		;f5c5	21 7e e4 	! ~ . 
	ld b,00ch		;f5c8	06 0c 	. . 
lf5cah:
	ld a,(hl)			;f5ca	7e 	~ 
	or a			;f5cb	b7 	. 
	jr nz,lf5d5h		;f5cc	20 07 	  . 
	dec b			;f5ce	05 	. 
	jp z,0e647h		;f5cf	ca 47 e6 	. G . 
	inc hl			;f5d2	23 	# 
	jr lf5cah		;f5d3	18 f5 	. . 
lf5d5h:
	call 0e5e7h		;f5d5	cd e7 e5 	. . . 
	ld a,(0e48ah)		;f5d8	3a 8a e4 	: . . 
	cp 080h		;f5db	fe 80 	. . 
	ld a,000h		;f5dd	3e 00 	> . 
	jr nz,lf5e3h		;f5df	20 02 	  . 
lf5e1h:
	ld a,0ffh		;f5e1	3e ff 	> . 
lf5e3h:
	pop bc			;f5e3	c1 	. 
	pop de			;f5e4	d1 	. 
	pop hl			;f5e5	e1 	. 
	ret			;f5e6	c9 	. 
	push hl			;f5e7	e5 	. 
	push de			;f5e8	d5 	. 
	push bc			;f5e9	c5 	. 
	ld hl,005dch		;f5ea	21 dc 05 	! . . 
	call 0e67bh		;f5ed	cd 7b e6 	. { . 
	ld hl,0e472h		;f5f0	21 72 e4 	! r . 
	call 0e66eh		;f5f3	cd 6e e6 	. n . 
	ld hl,0e472h		;f5f6	21 72 e4 	! r . 
	ld de,0e47eh		;f5f9	11 7e e4 	. ~ . 
	ld b,00ch		;f5fc	06 0c 	. . 
lf5feh:
	ld a,(de)			;f5fe	1a 	. 
	cp (hl)			;f5ff	be 	. 
	jr nz,lf656h		;f600	20 54 	  T 
	dec b			;f602	05 	. 
	jr z,lf609h		;f603	28 04 	( . 
	inc hl			;f605	23 	# 
	inc de			;f606	13 	. 
	jr lf5feh		;f607	18 f5 	. . 
lf609h:
	call 0e682h		;f609	cd 82 e6 	. . . 
	ld a,(0e48ah)		;f60c	3a 8a e4 	: . . 
	cp 080h		;f60f	fe 80 	. . 
	jr nz,lf64bh		;f611	20 38 	  8 
	call 0e72ch		;f613	cd 2c e7 	. , . 
	ld a,(0e46fh)		;f616	3a 6f e4 	: o . 
	bit 7,a		;f619	cb 7f 	.  
	jr nz,lf64fh		;f61b	20 32 	  2 
	ld a,(0e48fh)		;f61d	3a 8f e4 	: . . 
	cp 0ffh		;f620	fe ff 	. . 
	jr z,lf64fh		;f622	28 2b 	( + 
	or a			;f624	b7 	. 
	jr z,lf64fh		;f625	28 28 	( ( 
	call 0e71ah		;f627	cd 1a e7 	. . . 
	ld a,(0e498h)		;f62a	3a 98 e4 	: . . 
	cp b			;f62d	b8 	. 
	jr nz,lf65fh		;f62e	20 2f 	  / 
	ld a,(0e471h)		;f630	3a 71 e4 	: q . 
	or a			;f633	b7 	. 
	jr nz,lf641h		;f634	20 0b 	  . 
	ld hl,00bb8h		;f636	21 b8 0b 	! . . 
	call 0e67bh		;f639	cd 7b e6 	. { . 
	jr lf664h		;f63c	18 26 	. & 
	xor a			;f63e	af 	. 
	jr lf653h		;f63f	18 12 	. . 
lf641h:
	dec a			;f641	3d 	= 
	ld (0e471h),a		;f642	32 71 e4 	2 q . 
	jr lf656h		;f645	18 0f 	. . 
	xor a			;f647	af 	. 
	ld (0e4c9h),a		;f648	32 c9 e4 	2 . . 
lf64bh:
	xor a			;f64b	af 	. 
	ld (0e48bh),a		;f64c	32 8b e4 	2 . . 
lf64fh:
	xor a			;f64f	af 	. 
	ld (0e498h),a		;f650	32 98 e4 	2 . . 
lf653h:
	ld (0e471h),a		;f653	32 71 e4 	2 q . 
lf656h:
	xor a			;f656	af 	. 
	ld (0e48ah),a		;f657	32 8a e4 	2 . . 
	ld (0e48fh),a		;f65a	32 8f e4 	2 . . 
	jr lf66ah		;f65d	18 0b 	. . 
lf65fh:
	ld a,020h		;f65f	3e 20 	>   
	ld (0e471h),a		;f661	32 71 e4 	2 q . 
lf664h:
	ld a,(0e48fh)		;f664	3a 8f e4 	: . . 
	ld (0e498h),a		;f667	32 98 e4 	2 . . 
lf66ah:
	pop bc			;f66a	c1 	. 
	pop de			;f66b	d1 	. 
	pop hl			;f66c	e1 	. 
	ret			;f66d	c9 	. 
	ld c,020h		;f66e	0e 20 	.   
	ld b,00ch		;f670	06 0c 	. . 
lf672h:
	in a,(c)		;f672	ed 78 	. x 
	ld (hl),a			;f674	77 	w 
	inc hl			;f675	23 	# 
	inc c			;f676	0c 	. 
	dec b			;f677	05 	. 
	jr nz,lf672h		;f678	20 f8 	  . 
	ret			;f67a	c9 	. 
lf67bh:
	nop			;f67b	00 	. 
	dec hl			;f67c	2b 	+ 
	ld a,h			;f67d	7c 	| 
	or l			;f67e	b5 	. 
	jr nz,lf67bh		;f67f	20 fa 	  . 
	ret			;f681	c9 	. 
	ld ix,0e47eh		;f682	dd 21 7e e4 	. ! ~ . 
	xor a			;f686	af 	. 
	ld c,a			;f687	4f 	O 
	ld e,a			;f688	5f 	_ 
	ld (0e48ah),a		;f689	32 8a e4 	2 . . 
lf68ch:
	ld a,(ix+000h)		;f68c	dd 7e 00 	. ~ . 
	or a			;f68f	b7 	. 
	jr nz,lf69dh		;f690	20 0b 	  . 
	ld a,c			;f692	79 	y 
	add a,008h		;f693	c6 08 	. . 
	ld c,a			;f695	4f 	O 
lf696h:
	cp 060h		;f696	fe 60 	. ` 
	ret z			;f698	c8 	. 
	inc ix		;f699	dd 23 	. # 
	jr lf68ch		;f69b	18 ef 	. . 
lf69dh:
	ld d,008h		;f69d	16 08 	. . 
	ld h,a			;f69f	67 	g 
lf6a0h:
	inc c			;f6a0	0c 	. 
	ld a,h			;f6a1	7c 	| 
	or a			;f6a2	b7 	. 
	srl a		;f6a3	cb 3f 	. ? 
	ld h,a			;f6a5	67 	g 
	jr c,lf6aeh		;f6a6	38 06 	8 . 
lf6a8h:
	dec d			;f6a8	15 	. 
	jr nz,lf6a0h		;f6a9	20 f5 	  . 
	ld a,c			;f6ab	79 	y 
	jr lf696h		;f6ac	18 e8 	. . 
lf6aeh:
	ld a,c			;f6ae	79 	y 
	cp 04fh		;f6af	fe 4f 	. O 
	jr z,lf6d4h		;f6b1	28 21 	( ! 
	cp 053h		;f6b3	fe 53 	. S 
	jr z,lf6e2h		;f6b5	28 2b 	( + 
	cp 04eh		;f6b7	fe 4e 	. N 
	jr z,lf6ech		;f6b9	28 31 	( 1 
	cp 04dh		;f6bb	fe 4d 	. M 
	jr z,lf6f6h		;f6bd	28 37 	( 7 
	cp 056h		;f6bf	fe 56 	. V 
	jr z,lf6ffh		;f6c1	28 3c 	( < 
lf6c3h:
	ld a,e			;f6c3	7b 	{ 
	or a			;f6c4	b7 	. 
	jr nz,lf6a8h		;f6c5	20 e1 	  . 
	ld e,001h		;f6c7	1e 01 	. . 
	ld a,c			;f6c9	79 	y 
	ld (0e48eh),a		;f6ca	32 8e e4 	2 . . 
	ld a,080h		;f6cd	3e 80 	> . 
	ld (0e48ah),a		;f6cf	32 8a e4 	2 . . 
	jr lf6a8h		;f6d2	18 d4 	. . 
lf6d4h:
	ld a,(0e46ah)		;f6d4	3a 6a e4 	: j . 
	bit 2,a		;f6d7	cb 57 	. W 
	jr z,lf6c3h		;f6d9	28 e8 	( . 
	ld a,(0e48bh)		;f6db	3a 8b e4 	: . . 
	set 2,a		;f6de	cb d7 	. . 
	jr lf6e7h		;f6e0	18 05 	. . 
lf6e2h:
	ld a,(0e48bh)		;f6e2	3a 8b e4 	: . . 
	set 0,a		;f6e5	cb c7 	. . 
lf6e7h:
	ld (0e48bh),a		;f6e7	32 8b e4 	2 . . 
	jr lf6a8h		;f6ea	18 bc 	. . 
lf6ech:
	call 0e70fh		;f6ec	cd 0f e7 	. . . 
	jr nz,lf6a8h		;f6ef	20 b7 	  . 
	call 0e8bfh		;f6f1	cd bf e8 	. . . 
	jr lf6a8h		;f6f4	18 b2 	. . 
lf6f6h:
	ld a,(0e46ah)		;f6f6	3a 6a e4 	: j . 
	bit 3,a		;f6f9	cb 5f 	. _ 
	jr nz,lf6c3h		;f6fb	20 c6 	  . 
	jr lf6a8h		;f6fd	18 a9 	. . 
lf6ffh:
	call 0e70fh		;f6ff	cd 0f e7 	. . . 
	jr nz,lf6a8h		;f702	20 a4 	  . 
	call 0e8a6h		;f704	cd a6 e8 	. . . 
	ld a,(0e4d0h)		;f707	3a d0 e4 	: . . 
	or a			;f70a	b7 	. 
	jr z,lf6c3h		;f70b	28 b6 	( . 
	jr lf6a8h		;f70d	18 99 	. . 
	ld a,(0e4c9h)		;f70f	3a c9 e4 	: . . 
	or a			;f712	b7 	. 
	ret nz			;f713	c0 	. 
	ld a,001h		;f714	3e 01 	> . 
	ld (0e4c9h),a		;f716	32 c9 e4 	2 . . 
	ret			;f719	c9 	. 
	ld a,(0e48bh)		;f71a	3a 8b e4 	: . . 
	bit 2,a		;f71d	cb 57 	. W 
	push hl			;f71f	e5 	. 
	ld hl,0e48fh		;f720	21 8f e4 	! . . 
	jr z,lf729h		;f723	28 04 	( . 
	res 6,(hl)		;f725	cb b6 	. . 
	res 5,(hl)		;f727	cb ae 	. . 
lf729h:
	ld b,(hl)			;f729	46 	F 
	pop hl			;f72a	e1 	. 
	ret			;f72b	c9 	. 
	ld a,(0e48bh)		;f72c	3a 8b e4 	: . . 
	and 001h		;f72f	e6 01 	. . 
	ld hl,0e4ddh		;f731	21 dd e4 	! . . 
	jr z,lf739h		;f734	28 03 	( . 
	ld hl,0e53dh		;f736	21 3d e5 	! = . 
lf739h:
	ld d,000h		;f739	16 00 	. . 
	ld a,(0e48eh)		;f73b	3a 8e e4 	: . . 
	ld e,a			;f73e	5f 	_ 
	add hl,de			;f73f	19 	. 
	dec hl			;f740	2b 	+ 
	ld a,(hl)			;f741	7e 	~ 
	ld (0e48fh),a		;f742	32 8f e4 	2 . . 
	ld a,(0e46fh)		;f745	3a 6f e4 	: o . 
	bit 0,a		;f748	cb 47 	. G 
	ret z			;f74a	c8 	. 
	ld a,(hl)			;f74b	7e 	~ 
	cp 061h		;f74c	fe 61 	. a 
	ret c			;f74e	d8 	. 
	cp 07bh		;f74f	fe 7b 	. { 
	ret nc			;f751	d0 	. 
	and 05fh		;f752	e6 5f 	. _ 
	ld (0e48fh),a		;f754	32 8f e4 	2 . . 
	ret			;f757	c9 	. 
	push hl			;f758	e5 	. 
	ld hl,0e46fh		;f759	21 6f e4 	! o . 
	res 7,(hl)		;f75c	cb be 	. . 
	pop hl			;f75e	e1 	. 
	jp 0ea9eh		;f75f	c3 9e ea 	. . . 
	push hl			;f762	e5 	. 
	push de			;f763	d5 	. 
	push bc			;f764	c5 	. 
lf765h:
	ld a,(0e48ah)		;f765	3a 8a e4 	: . . 
	cp 080h		;f768	fe 80 	. . 
	jr z,lf77ah		;f76a	28 0e 	( . 
	cp 088h		;f76c	fe 88 	. . 
	ld a,000h		;f76e	3e 00 	> . 
	ld (0e48ah),a		;f770	32 8a e4 	2 . . 
	jr z,lf7a2h		;f773	28 2d 	( - 
	call 0e5b1h		;f775	cd b1 e5 	. . . 
	jr lf765h		;f778	18 eb 	. . 
lf77ah:
	xor a			;f77a	af 	. 
	ld (0e48ah),a		;f77b	32 8a e4 	2 . . 
	ld a,(0e48fh)		;f77e	3a 8f e4 	: . . 
	and 07fh		;f781	e6 7f 	.  
	cp 020h		;f783	fe 20 	.   
	jr c,lf794h		;f785	38 0d 	8 . 
	ld a,(0e4d0h)		;f787	3a d0 e4 	: . . 
	or a			;f78a	b7 	. 
	jr z,lf794h		;f78b	28 07 	( . 
	ld a,(0e46fh)		;f78d	3a 6f e4 	: o . 
	bit 2,a		;f790	cb 57 	. W 
	jr nz,lf799h		;f792	20 05 	  . 
lf794h:
	ld a,(0e48fh)		;f794	3a 8f e4 	: . . 
	jr lf7a8h		;f797	18 0f 	. . 
lf799h:
	ld a,088h		;f799	3e 88 	> . 
	ld (0e48ah),a		;f79b	32 8a e4 	2 . . 
	ld a,0dfh		;f79e	3e df 	> . 
	jr lf7a8h		;f7a0	18 06 	. . 
lf7a2h:
	ld a,(0e48fh)		;f7a2	3a 8f e4 	: . . 
	call 0e828h		;f7a5	cd 28 e8 	. ( . 
lf7a8h:
	pop bc			;f7a8	c1 	. 
	pop de			;f7a9	d1 	. 
	pop hl			;f7aa	e1 	. 
	ret			;f7ab	c9 	. 
	push hl			;f7ac	e5 	. 
	push de			;f7ad	d5 	. 
	push bc			;f7ae	c5 	. 
	ld a,c			;f7af	79 	y 
	ld (0e466h),a		;f7b0	32 66 e4 	2 f . 
	ld a,(0e48ch)		;f7b3	3a 8c e4 	: . . 
	or a			;f7b6	b7 	. 
	jr nz,lf823h		;f7b7	20 6a 	  j 
	ld a,(0e4d0h)		;f7b9	3a d0 e4 	: . . 
	or a			;f7bc	b7 	. 
	jr z,lf7efh		;f7bd	28 30 	( 0 
	ld a,(0e4c8h)		;f7bf	3a c8 e4 	: . . 
	or a			;f7c2	b7 	. 
	ld a,(0e466h)		;f7c3	3a 66 e4 	: f . 
	jr nz,lf7d8h		;f7c6	20 10 	  . 
	cp 0dfh		;f7c8	fe df 	. . 
	jr z,lf817h		;f7ca	28 4b 	( K 
lf7cch:
	and 07fh		;f7cc	e6 7f 	.  
	jr z,lf7dfh		;f7ce	28 0f 	( . 
	cp 07fh		;f7d0	fe 7f 	.  
	jr z,lf81eh		;f7d2	28 4a 	( J 
	cp 020h		;f7d4	fe 20 	.   
	jr c,lf81eh		;f7d6	38 46 	8 F 
lf7d8h:
	xor a			;f7d8	af 	. 
	ld (0e4c8h),a		;f7d9	32 c8 e4 	2 . . 
lf7dch:
	call 0e8ech		;f7dc	cd ec e8 	. . . 
lf7dfh:
	pop bc			;f7df	c1 	. 
	pop de			;f7e0	d1 	. 
	ld a,(0e4cbh)		;f7e1	3a cb e4 	: . . 
	or a			;f7e4	b7 	. 
	jr nz,lf80dh		;f7e5	20 26 	  & 
lf7e7h:
	ld a,(0e466h)		;f7e7	3a 66 e4 	: f . 
	ld (0e46ch),a		;f7ea	32 6c e4 	2 l . 
	pop hl			;f7ed	e1 	. 
	ret			;f7ee	c9 	. 
lf7efh:
	ld a,(0e466h)		;f7ef	3a 66 e4 	: f . 
	ld b,a			;f7f2	47 	G 
	cp 0dfh		;f7f3	fe df 	. . 
	jr z,lf808h		;f7f5	28 11 	( . 
	ld a,(0e4c8h)		;f7f7	3a c8 e4 	: . . 
	or a			;f7fa	b7 	. 
	ld a,b			;f7fb	78 	x 
	jr z,lf7cch		;f7fc	28 ce 	( . 
	call 0e828h		;f7fe	cd 28 e8 	. ( . 
	ld (0e466h),a		;f801	32 66 e4 	2 f . 
	jr c,lf81eh		;f804	38 18 	8 . 
	jr lf7dch		;f806	18 d4 	. . 
lf808h:
	call 0e8d6h		;f808	cd d6 e8 	. . . 
	jr lf7dfh		;f80b	18 d2 	. . 
lf80dh:
	ld hl,(0e4cch)		;f80d	2a cc e4 	* . . 
	ex de,hl			;f810	eb 	. 
	xor a			;f811	af 	. 
	ld (0e4cbh),a		;f812	32 cb e4 	2 . . 
	jr lf7e7h		;f815	18 d0 	. . 
lf817h:
	ld a,001h		;f817	3e 01 	> . 
	ld (0e4c8h),a		;f819	32 c8 e4 	2 . . 
	jr lf7dfh		;f81c	18 c1 	. . 
lf81eh:
	call 0e83fh		;f81e	cd 3f e8 	. ? . 
	jr lf7dfh		;f821	18 bc 	. . 
lf823h:
	call 0ebe3h		;f823	cd e3 eb 	. . . 
	jr lf7dfh		;f826	18 b7 	. . 
	cp 020h		;f828	fe 20 	.   
	ret c			;f82a	d8 	. 
	cp 060h		;f82b	fe 60 	. ` 
	jr c,lf835h		;f82d	38 06 	8 . 
	cp 080h		;f82f	fe 80 	. . 
	ret nc			;f831	d0 	. 
	or 080h		;f832	f6 80 	. . 
	ret			;f834	c9 	. 
lf835h:
	cp 040h		;f835	fe 40 	. @ 
	jr c,lf83ch		;f837	38 03 	8 . 
	xor 0c0h		;f839	ee c0 	. . 
	ret			;f83b	c9 	. 
lf83ch:
	xor 020h		;f83c	ee 20 	.   
	ret			;f83e	c9 	. 
	ld a,(0e466h)		;f83f	3a 66 e4 	: f . 
	cp 01bh		;f842	fe 1b 	. . 
	jr nz,lf84ch		;f844	20 06 	  . 
	ld a,001h		;f846	3e 01 	> . 
	ld (0e48ch),a		;f848	32 8c e4 	2 . . 
	ret			;f84b	c9 	. 
lf84ch:
	ld c,a			;f84c	4f 	O 
	ld hl,0e855h		;f84d	21 55 e8 	! U . 
	call 0ec1fh		;f850	cd 1f ec 	. . . 
	ret z			;f853	c8 	. 
	jp (hl)			;f854	e9 	. 
	inc bc			;f855	03 	. 
	sub c			;f856	91 	. 
	ret pe			;f857	e8 	. 
	rlca			;f858	07 	. 
	ld a,(hl)			;f859	7e 	~ 
	jp pe,07408h		;f85a	ea 08 74 	. . t 
	jp pe,0800ah		;f85d	ea 0a 80 	. . . 
	ret pe			;f860	e8 	. 
	inc c			;f861	0c 	. 
	ret pe			;f862	e8 	. 
	jp (hl)			;f863	e9 	. 
	dec c			;f864	0d 	. 
	add hl,bc			;f865	09 	. 
	jp (hl)			;f866	e9 	. 
	ld (de),a			;f867	12 	. 
	sub h			;f868	94 	. 
	ret pe			;f869	e8 	. 
	inc e			;f86a	1c 	. 
	ld d,b			;f86b	50 	P 
	jp pe,0351dh		;f86c	ea 1d 35 	. . 5 
	jp pe,0441eh		;f86f	ea 1e 44 	. . D 
	jp pe,05f1fh		;f872	ea 1f 5f 	. . _ 
	jp pe,0977fh		;f875	ea 7f 97 	.  . 
	ret pe			;f878	e8 	. 
	sbc a,c			;f879	99 	. 
	and b			;f87a	a0 	. 
	ret pe			;f87b	e8 	. 
	sbc a,d			;f87c	9a 	. 
	sbc a,d			;f87d	9a 	. 
	ret pe			;f87e	e8 	. 
	nop			;f87f	00 	. 
	ld a,(0e46ch)		;f880	3a 6c e4 	: l . 
	cp 00dh		;f883	fe 0d 	. . 
	ret z			;f885	c8 	. 
	ld a,(0e46eh)		;f886	3a 6e e4 	: n . 
	or 080h		;f889	f6 80 	. . 
	ld (0e4cah),a		;f88b	32 ca e4 	2 . . 
	jp 0e909h		;f88e	c3 09 e9 	. . . 
	ret			;f891	c9 	. 
	nop			;f892	00 	. 
	nop			;f893	00 	. 
	ret			;f894	c9 	. 
	nop			;f895	00 	. 
	nop			;f896	00 	. 
	ret			;f897	c9 	. 
	nop			;f898	00 	. 
	nop			;f899	00 	. 
	ld hl,0e467h		;f89a	21 67 e4 	! g . 
	res 7,(hl)		;f89d	cb be 	. . 
	ret			;f89f	c9 	. 
	ld hl,0e467h		;f8a0	21 67 e4 	! g . 
	set 7,(hl)		;f8a3	cb fe 	. . 
	ret			;f8a5	c9 	. 
	ld a,(0e46fh)		;f8a6	3a 6f e4 	: o . 
	xor 004h		;f8a9	ee 04 	. . 
	ld (0e46fh),a		;f8ab	32 6f e4 	2 o . 
	bit 2,a		;f8ae	cb 57 	. W 
	ld hl,0e469h		;f8b0	21 69 e4 	! i . 
	jr z,lf8bbh		;f8b3	28 06 	( . 
	set 4,(hl)		;f8b5	cb e6 	. . 
lf8b7h:
	ld a,(hl)			;f8b7	7e 	~ 
	out (020h),a		;f8b8	d3 20 	.   
	ret			;f8ba	c9 	. 
lf8bbh:
	res 4,(hl)		;f8bb	cb a6 	. . 
	jr lf8b7h		;f8bd	18 f8 	. . 
	ld a,(0e46fh)		;f8bf	3a 6f e4 	: o . 
	xor 001h		;f8c2	ee 01 	. . 
	ld (0e46fh),a		;f8c4	32 6f e4 	2 o . 
	bit 0,a		;f8c7	cb 47 	. G 
	ld hl,0e469h		;f8c9	21 69 e4 	! i . 
	jr z,lf8d2h		;f8cc	28 04 	( . 
	set 5,(hl)		;f8ce	cb ee 	. . 
	jr lf8b7h		;f8d0	18 e5 	. . 
lf8d2h:
	res 5,(hl)		;f8d2	cb ae 	. . 
	jr lf8b7h		;f8d4	18 e1 	. . 
	ld a,(0e4c8h)		;f8d6	3a c8 e4 	: . . 
	xor 001h		;f8d9	ee 01 	. . 
	ld (0e4c8h),a		;f8db	32 c8 e4 	2 . . 
	ld a,(0e46fh)		;f8de	3a 6f e4 	: o . 
	jr z,lf8e8h		;f8e1	28 05 	( . 
	set 2,a		;f8e3	cb d7 	. . 
lf8e5h:
	jp 0e8abh		;f8e5	c3 ab e8 	. . . 
lf8e8h:
	res 2,a		;f8e8	cb 97 	. . 
	jr lf8e5h		;f8ea	18 f9 	. . 
	call 0e9b7h		;f8ec	cd b7 e9 	. . . 
	ld a,(0e466h)		;f8ef	3a 66 e4 	: f . 
	call 0ea27h		;f8f2	cd 27 ea 	. ' . 
	ld (hl),b			;f8f5	70 	p 
	ld a,(0e467h)		;f8f6	3a 67 e4 	: g . 
	ld (de),a			;f8f9	12 	. 
	ld a,(0e46eh)		;f8fa	3a 6e e4 	: n . 
	inc a			;f8fd	3c 	< 
	ld (0e46eh),a		;f8fe	32 6e e4 	2 n . 
	ld b,a			;f901	47 	G 
	ld a,(0e462h)		;f902	3a 62 e4 	: b . 
	dec a			;f905	3d 	= 
	cp b			;f906	b8 	. 
	jr nc,lf931h		;f907	30 28 	0 ( 
	ld a,(0e46dh)		;f909	3a 6d e4 	: m . 
	inc a			;f90c	3c 	< 
	ld (0e46dh),a		;f90d	32 6d e4 	2 m . 
	ld b,a			;f910	47 	G 
	ld a,(0e465h)		;f911	3a 65 e4 	: e . 
	cp b			;f914	b8 	. 
	jr z,lf94ah		;f915	28 33 	( 3 
	ld a,(0e460h)		;f917	3a 60 e4 	: ` . 
	cp b			;f91a	b8 	. 
	jr z,lf963h		;f91b	28 46 	( F 
	call c,0e9ffh		;f91d	dc ff e9 	. . . 
	jr lf925h		;f920	18 03 	. . 
lf922h:
	call 0edcfh		;f922	cd cf ed 	. . . 
lf925h:
	ld a,(0e4cah)		;f925	3a ca e4 	: . . 
	bit 7,a		;f928	cb 7f 	.  
	jr z,lf947h		;f92a	28 1b 	( . 
	and 00fh		;f92c	e6 0f 	. . 
lf92eh:
	ld (0e46eh),a		;f92e	32 6e e4 	2 n . 
lf931h:
	call 0e9cch		;f931	cd cc e9 	. . . 
	ld a,00eh		;f934	3e 0e 	> . 
	out (050h),a		;f936	d3 50 	. P 
	ld a,h			;f938	7c 	| 
	out (051h),a		;f939	d3 51 	. Q 
	ld a,00fh		;f93b	3e 0f 	> . 
	out (050h),a		;f93d	d3 50 	. P 
	ld a,l			;f93f	7d 	} 
	out (051h),a		;f940	d3 51 	. Q 
	xor a			;f942	af 	. 
	ld (0e4cah),a		;f943	32 ca e4 	2 . . 
	ret			;f946	c9 	. 
lf947h:
	xor a			;f947	af 	. 
	jr lf92eh		;f948	18 e4 	. . 
lf94ah:
	ld a,(0e463h)		;f94a	3a 63 e4 	: c . 
	call 0e98ch		;f94d	cd 8c e9 	. . . 
	jr z,lf925h		;f950	28 d3 	( . 
	ld a,(0e464h)		;f952	3a 64 e4 	: d . 
	cp 001h		;f955	fe 01 	. . 
	call nz,0e999h		;f957	c4 99 e9 	. . . 
	ld a,(0e465h)		;f95a	3a 65 e4 	: e . 
lf95dh:
	dec a			;f95d	3d 	= 
	ld (0e46dh),a		;f95e	32 6d e4 	2 m . 
	jr lf922h		;f961	18 bf 	. . 
lf963h:
	ld a,(0e465h)		;f963	3a 65 e4 	: e . 
	call 0e98ch		;f966	cd 8c e9 	. . . 
	jr z,lf925h		;f969	28 ba 	( . 
	ld a,(0e465h)		;f96b	3a 65 e4 	: e . 
	ld b,a			;f96e	47 	G 
	ld a,(0e460h)		;f96f	3a 60 e4 	: ` . 
	sub b			;f972	90 	. 
	cp 001h		;f973	fe 01 	. . 
	call nz,0e999h		;f975	c4 99 e9 	. . . 
	ld a,(0e460h)		;f978	3a 60 e4 	: ` . 
	jr lf95dh		;f97b	18 e0 	. . 
	ex de,hl			;f97d	eb 	. 
	ld a,(0e462h)		;f97e	3a 62 e4 	: b . 
	ld l,a			;f981	6f 	o 
	ld h,000h		;f982	26 00 	& . 
	add hl,de			;f984	19 	. 
	ld bc,(0e494h)		;f985	ed 4b 94 e4 	. K . . 
	ldir		;f989	ed b0 	. . 
	ret			;f98b	c9 	. 
	ld (0e46dh),a		;f98c	32 6d e4 	2 m . 
	xor a			;f98f	af 	. 
	ld (0e46eh),a		;f990	32 6e e4 	2 n . 
	ld a,(0e46ah)		;f993	3a 6a e4 	: j . 
	and 001h		;f996	e6 01 	. . 
	ret			;f998	c9 	. 
	dec a			;f999	3d 	= 
	ld hl,00000h		;f99a	21 00 00 	! . . 
	ld d,000h		;f99d	16 00 	. . 
	call 0e9deh		;f99f	cd de e9 	. . . 
	ld (0e494h),hl		;f9a2	22 94 e4 	" . . 
	call 0e9b7h		;f9a5	cd b7 e9 	. . . 
	push de			;f9a8	d5 	. 
	call 0ea09h		;f9a9	cd 09 ea 	. . . 
	call 0e97dh		;f9ac	cd 7d e9 	. } . 
	pop hl			;f9af	e1 	. 
	call 0e97dh		;f9b0	cd 7d e9 	. } . 
	call 0ea16h		;f9b3	cd 16 ea 	. . . 
	ret			;f9b6	c9 	. 
	call 0e9cch		;f9b7	cd cc e9 	. . . 
	ld de,lf000h		;f9ba	11 00 f0 	. . . 
	add hl,de			;f9bd	19 	. 
	ld (0e490h),hl		;f9be	22 90 e4 	" . . 
	push hl			;f9c1	e5 	. 
	ld de,00800h		;f9c2	11 00 08 	. . . 
	add hl,de			;f9c5	19 	. 
	ld (0e492h),hl		;f9c6	22 92 e4 	" . . 
	ex de,hl			;f9c9	eb 	. 
	pop hl			;f9ca	e1 	. 
	ret			;f9cb	c9 	. 
	ld hl,00000h		;f9cc	21 00 00 	! . . 
	ld d,000h		;f9cf	16 00 	. . 
	ld a,(0e46dh)		;f9d1	3a 6d e4 	: m . 
	or a			;f9d4	b7 	. 
	call nz,0e9deh		;f9d5	c4 de e9 	. . . 
	ld a,(0e46eh)		;f9d8	3a 6e e4 	: n . 
	ld e,a			;f9db	5f 	_ 
	add hl,de			;f9dc	19 	. 
	ret			;f9dd	c9 	. 
	ld b,a			;f9de	47 	G 
	ld a,(0e462h)		;f9df	3a 62 e4 	: b . 
	ld e,a			;f9e2	5f 	_ 
lf9e3h:
	add hl,de			;f9e3	19 	. 
	dec b			;f9e4	05 	. 
	jr nz,lf9e3h		;f9e5	20 fc 	  . 
	ret			;f9e7	c9 	. 
	ld a,007h		;f9e8	3e 07 	> . 
	ld (0e467h),a		;f9ea	32 67 e4 	2 g . 
	ld (0f800h),a		;f9ed	32 00 f8 	2 . . 
	ld hl,lf000h		;f9f0	21 00 f0 	! . . 
	ld c,019h		;f9f3	0e 19 	. . 
	call 0ea09h		;f9f5	cd 09 ea 	. . . 
	xor a			;f9f8	af 	. 
	call 0eda3h		;f9f9	cd a3 ed 	. . . 
	call 0ea16h		;f9fc	cd 16 ea 	. . . 
	xor a			;f9ff	af 	. 
	ld (0e46dh),a		;fa00	32 6d e4 	2 m . 
	ld (0e46eh),a		;fa03	32 6e e4 	2 n . 
	jp 0e931h		;fa06	c3 31 e9 	. 1 . 
lfa09h:
	in a,(030h)		;fa09	db 30 	. 0 
	bit 1,a		;fa0b	cb 4f 	. O 
	jr z,lfa09h		;fa0d	28 fa 	( . 

called_from_boot_to_ram_entry_fa0fh:
	; during boot the (0e468h) is 00h
	ld a,(0e468h)		;fa0f	3a 68 e4 	: h . 
	; bit1=1 means "display inhibit"
	set 1,a		;fa12	cb cf 	. . 
	jr lfa21h		;fa14	18 0b 	. . 
loop_to_wait_until_vsync return_period_lfa16h:
	in a,(030h)		;fa16	db 30 	. 0 
	bit 1,a		;fa18	cb 4f 	. O 
	jr z,lfa16h		;fa1a	28 fa 	( . 

; then clear "graphic board available" flag
	ld a,(0e468h)		;fa1c	3a 68 e4 	: h . 
	res 1,a		;fa1f	cb 8f 	. . 
lfa21h:
	; write to system flags port
	ld (0e468h),a		;fa21	32 68 e4 	2 h . 
	out (010h),a		;fa24	d3 10 	. . 
	ret			;fa26	c9 	. 
	ld b,a			;fa27	47 	G 
lfa28h:
	in a,(010h)		;fa28	db 10 	. . 
	bit 7,a		;fa2a	cb 7f 	.  
	jr nz,lfa28h		;fa2c	20 fa 	  . 
lfa2eh:
	in a,(010h)		;fa2e	db 10 	. . 
	bit 7,a		;fa30	cb 7f 	.  
	jr z,lfa2eh		;fa32	28 fa 	( . 
	ret			;fa34	c9 	. 
lfa35h:
	ld a,(0e46eh)		;fa35	3a 6e e4 	: n . 
	dec a			;fa38	3d 	= 
	cp 0ffh		;fa39	fe ff 	. . 
	jr nz,lfa6fh		;fa3b	20 32 	  2 
	ld a,(0e462h)		;fa3d	3a 62 e4 	: b . 
	dec a			;fa40	3d 	= 
	ld (0e46eh),a		;fa41	32 6e e4 	2 n . 
	ld a,(0e46dh)		;fa44	3a 6d e4 	: m . 
	dec a			;fa47	3d 	= 
	cp 0ffh		;fa48	fe ff 	. . 
	jr nz,lfa69h		;fa4a	20 1d 	  . 
	ld a,017h		;fa4c	3e 17 	> . 
	jr lfa69h		;fa4e	18 19 	. . 
	ld a,(0e462h)		;fa50	3a 62 e4 	: b . 
	ld b,a			;fa53	47 	G 
	ld a,(0e46eh)		;fa54	3a 6e e4 	: n . 
	inc a			;fa57	3c 	< 
	cp b			;fa58	b8 	. 
	jr c,lfa6fh		;fa59	38 14 	8 . 
	xor a			;fa5b	af 	. 
	ld (0e46eh),a		;fa5c	32 6e e4 	2 n . 
	ld b,018h		;fa5f	06 18 	. . 
	ld a,(0e46dh)		;fa61	3a 6d e4 	: m . 
	inc a			;fa64	3c 	< 
	cp b			;fa65	b8 	. 
	jr c,lfa69h		;fa66	38 01 	8 . 
	xor a			;fa68	af 	. 
lfa69h:
	ld (0e46dh),a		;fa69	32 6d e4 	2 m . 
lfa6ch:
	jp 0e931h		;fa6c	c3 31 e9 	. 1 . 
lfa6fh:
	ld (0e46eh),a		;fa6f	32 6e e4 	2 n . 
	jr lfa6ch		;fa72	18 f8 	. . 
	call 0e9b7h		;fa74	cd b7 e9 	. . . 
	call 0ea28h		;fa77	cd 28 ea 	. ( . 
	ld (hl),020h		;fa7a	36 20 	6   
	jr lfa35h		;fa7c	18 b7 	. . 
	push hl			;fa7e	e5 	. 
	ld hl,0e468h		;fa7f	21 68 e4 	! h . 
	set 4,(hl)		;fa82	cb e6 	. . 
	ld a,(hl)			;fa84	7e 	~ 
	out (010h),a		;fa85	d3 10 	. . 
	push hl			;fa87	e5 	. 
	ld hl,(0e4d2h)		;fa88	2a d2 e4 	* . . 
	call 0e67bh		;fa8b	cd 7b e6 	. { . 
	pop hl			;fa8e	e1 	. 
lfa8fh:
	res 4,(hl)		;fa8f	cb a6 	. . 
lfa91h:
	ld a,(hl)			;fa91	7e 	~ 
	out (010h),a		;fa92	d3 10 	. . 
	pop hl			;fa94	e1 	. 
	ret			;fa95	c9 	. 
	push hl			;fa96	e5 	. 
	ld hl,0e468h		;fa97	21 68 e4 	! h . 
	set 4,(hl)		;fa9a	cb e6 	. . 
	jr lfa91h		;fa9c	18 f3 	. . 
	push hl			;fa9e	e5 	. 
	ld hl,0e468h		;fa9f	21 68 e4 	! h . 
	jr lfa8fh		;faa2	18 eb 	. . 
	in a,(02ah)		;faa4	db 2a 	. * 
	or a			;faa6	b7 	. 
	bit 7,a		;faa7	cb 7f 	.  
	ret z			;faa9	c8 	. 
	ld a,(0e4d0h)		;faaa	3a d0 e4 	: . . 
	or a			;faad	b7 	. 
	jp z,00000h		;faae	ca 00 00 	. . . 
	ld e,018h		;fab1	1e 18 	. . 
	scf			;fab3	37 	7 
	ret			;fab4	c9 	. 
	call 0eaa4h		;fab5	cd a4 ea 	. . . 
	in a,(030h)		;fab8	db 30 	. 0 
	bit 3,a		;faba	cb 5f 	. _ 
	ld a,000h		;fabc	3e 00 	> . 
	ret z			;fabe	c8 	. 
	ld a,0ffh		;fabf	3e ff 	> . 
	ret			;fac1	c9 	. 
lfac2h:
	call 0e445h		;fac2	cd 45 e4 	. E . 
	ret c			;fac5	d8 	. 
	jr nz,lfac2h		;fac6	20 fa 	  . 
	ld a,c			;fac8	79 	y 
	out (030h),a		;fac9	d3 30 	. 0 
	ld a,(0e469h)		;facb	3a 69 e4 	: i . 
	set 2,a		;face	cb d7 	. . 
	out (020h),a		;fad0	d3 20 	.   
	res 2,a		;fad2	cb 97 	. . 
	out (020h),a		;fad4	d3 20 	.   
lfad6h:
	in a,(030h)		;fad6	db 30 	. 0 
	bit 2,a		;fad8	cb 57 	. W 
	jr nz,lfaddh		;fada	20 01 	  . 
	ret			;fadc	c9 	. 
lfaddh:
	call 0eaa4h		;fadd	cd a4 ea 	. . . 
	ret c			;fae0	d8 	. 
	jr lfad6h		;fae1	18 f3 	. . 
lfae3h:
	in a,(041h)		;fae3	db 41 	. A 
	call 0eb08h		;fae5	cd 08 eb 	. . . 
	jr z,lfae3h		;fae8	28 f9 	( . 
	jr lfaf2h		;faea	18 06 	. . 
lfaech:
	call 0eaffh		;faec	cd ff ea 	. . . 
	ret c			;faef	d8 	. 
	jr z,lfaech		;faf0	28 fa 	( . 
lfaf2h:
	ld a,c			;faf2	79 	y 
	out (040h),a		;faf3	d3 40 	. @ 
	ret			;faf5	c9 	. 
lfaf6h:
	call 0eb10h		;faf6	cd 10 eb 	. . . 
	ret c			;faf9	d8 	. 
	jr z,lfaf6h		;fafa	28 fa 	( . 
	in a,(040h)		;fafc	db 40 	. @ 
	ret			;fafe	c9 	. 
	call 0eaa4h		;faff	cd a4 ea 	. . . 
	in a,(041h)		;fb02	db 41 	. A 
	bit 7,a		;fb04	cb 7f 	.  
	jr z,lfb0dh		;fb06	28 05 	( . 
	bit 0,a		;fb08	cb 47 	. G 
	ld a,0ffh		;fb0a	3e ff 	> . 
	ret nz			;fb0c	c0 	. 
lfb0dh:
	ld a,000h		;fb0d	3e 00 	> . 
	ret			;fb0f	c9 	. 
	call 0eaa4h		;fb10	cd a4 ea 	. . . 
	in a,(041h)		;fb13	db 41 	. A 
	bit 1,a		;fb15	cb 4f 	. O 
	ld a,000h		;fb17	3e 00 	> . 
	ret z			;fb19	c8 	. 
	ld a,0ffh		;fb1a	3e ff 	> . 
	ret			;fb1c	c9 	. 
	ld a,0feh		;fb1d	3e fe 	> . 
	out (041h),a		;fb1f	d3 41 	. A 
	ld a,037h		;fb21	3e 37 	> 7 
	out (041h),a		;fb23	d3 41 	. A 
	ld a,(0e468h)		;fb25	3a 68 e4 	: h . 
	res 2,a		;fb28	cb 97 	. . 
	jr lfb39h		;fb2a	18 0d 	. . 
	ld a,0fah		;fb2c	3e fa 	> . 
	out (041h),a		;fb2e	d3 41 	. A 
	ld a,037h		;fb30	3e 37 	> 7 
	out (041h),a		;fb32	d3 41 	. A 
	ld a,(0e468h)		;fb34	3a 68 e4 	: h . 
	set 2,a		;fb37	cb d7 	. . 
lfb39h:
	out (010h),a		;fb39	d3 10 	. . 
	ld (0e468h),a		;fb3b	32 68 e4 	2 h . 
	ret			;fb3e	c9 	. 
	ld a,(0e468h)		;fb3f	3a 68 e4 	: h . 
	set 3,a		;fb42	cb df 	. . 
lfb44h:
	out (010h),a		;fb44	d3 10 	. . 
	ld (0e468h),a		;fb46	32 68 e4 	2 h . 
	ret			;fb49	c9 	. 
	ld a,(0e468h)		;fb4a	3a 68 e4 	: h . 
	res 3,a		;fb4d	cb 9f 	. . 
	jr lfb44h		;fb4f	18 f3 	. . 
	add hl,bc			;fb51	09 	. 
	pop de			;fb52	d1 	. 
	call pe,0130ch		;fb53	ec 0c 13 	. . . 
	call pe,01310h		;fb56	ec 10 13 	. . . 
	call pe,sub_ff11h		;fb59	ec 11 ff 	. . . 
	jp (hl)			;fb5c	e9 	. 
	ld (de),a			;fb5d	12 	. 
	sub c			;fb5e	91 	. 
	call pe,08d13h		;fb5f	ec 13 8d 	. . . 
	call pe,01316h		;fb62	ec 16 13 	. . . 
	call pe,0a617h		;fb65	ec 17 a6 	. . . 
	call pe,06a18h		;fb68	ec 18 6a 	. . j 
	defb 0edh;next byte illegal after ed		;fb6b	ed 	. 
	add hl,de			;fb6c	19 	. 
	sbc a,c			;fb6d	99 	. 
	defb 0edh;next byte illegal after ed		;fb6e	ed 	. 
	ld a,(de)			;fb6f	1a 	. 
	ld d,b			;fb70	50 	P 
	jp pe,0881ch		;fb71	ea 1c 88 	. . . 
	defb 0edh;next byte illegal after ed		;fb74	ed 	. 
	dec e			;fb75	1d 	. 
	inc de			;fb76	13 	. 
	call pe,01831h		;fb77	ec 31 18 	. 1 . 
	call pe,04441h		;fb7a	ec 41 44 	. A D 
	jp pe,05f42h		;fb7d	ea 42 5f 	. B _ 
	jp pe,05043h		;fb80	ea 43 50 	. C P 
	jp pe,03544h		;fb83	ea 44 35 	. D 5 
	jp pe,0e845h		;fb86	ea 45 e8 	. E . 
	jp (hl)			;fb89	e9 	. 
	ld b,(hl)			;fb8a	46 	F 
	rst 8			;fb8b	cf 	. 
	ld i,a		;fb8c	ed 47 	. G 
	inc de			;fb8e	13 	. 
	call pe,0ff48h		;fb8f	ec 48 ff 	. H . 
	jp (hl)			;fb92	e9 	. 
	ld c,c			;fb93	49 	I 
	inc de			;fb94	13 	. 
	call pe,0dd4ah		;fb95	ec 4a dd 	. J . 
	ld bc,(0ed99h)		;fb98	ed 4b 99 ed 	. K . . 
	ld d,e			;fb9c	53 	S 
	inc de			;fb9d	13 	. 
	call pe,01354h		;fb9e	ec 54 13 	. T . 
	call pe,01355h		;fba1	ec 55 13 	. U . 
	call pe,01356h		;fba4	ec 56 13 	. V . 
	call pe,01359h		;fba7	ec 59 13 	. Y . 
	call pe,00c00h		;fbaa	ec 00 0c 	. . . 
	pop hl			;fbad	e1 	. 
	call pe,02a10h		;fbae	ec 10 2a 	. . * 
	xor 016h		;fbb1	ee 16 	. . 
	dec (hl)			;fbb3	35 	5 
	defb 0edh;next byte illegal after ed		;fbb4	ed 	. 
	dec e			;fbb5	1d 	. 
	ld e,a			;fbb6	5f 	_ 
	xor 047h		;fbb7	ee 47 	. G 
	rst 20h			;fbb9	e7 	. 
	out (c),c		;fbba	ed 49 	. I 
	call m,053edh		;fbbc	fc ed 53 	. . S 
	ld (hl),l			;fbbf	75 	u 
	xor 054h		;fbc0	ee 54 	. T 
	inc (hl)			;fbc2	34 	4 
	call pe,03455h		;fbc3	ec 55 34 	. U 4 
	call pe,06a56h		;fbc6	ec 56 6a 	. V j 
	call pe,01b59h		;fbc9	ec 59 1b 	. Y . 
	defb 0edh;next byte illegal after ed		;fbcc	ed 	. 
	sub (hl)			;fbcd	96 	. 
	ld h,l			;fbce	65 	e 
	defb 0edh;next byte illegal after ed		;fbcf	ed 	. 
	sbc a,l			;fbd0	9d 	. 
	ld l,b			;fbd1	68 	h 
	xor 0b1h		;fbd2	ee b1 	. . 
	defb 0edh;next byte illegal after ed		;fbd4	ed 	. 
	call pe,00eb2h		;fbd5	ec b2 0e 	. . . 
	defb 0edh;next byte illegal after ed		;fbd8	ed 	. 
	call nc,0ec3dh		;fbd9	d4 3d ec 	. = . 
	push de			;fbdc	d5 	. 
	dec a			;fbdd	3d 	= 
	call pe,042d9h		;fbde	ec d9 42 	. . B 
	defb 0edh;next byte illegal after ed		;fbe1	ed 	. 
	nop			;fbe2	00 	. 
	cp 001h		;fbe3	fe 01 	. . 
	jp nz,0ec03h		;fbe5	c2 03 ec 	. . . 
	xor a			;fbe8	af 	. 
	ld (0e48ch),a		;fbe9	32 8c e4 	2 . . 
	ld (0e4cbh),a		;fbec	32 cb e4 	2 . . 
	ld a,c			;fbef	79 	y 
	cp 061h		;fbf0	fe 61 	. a 
	jr c,lfbfbh		;fbf2	38 07 	8 . 
	cp 07bh		;fbf4	fe 7b 	. { 
	jr nc,lfbfbh		;fbf6	30 03 	0 . 
	and 05fh		;fbf8	e6 5f 	. _ 
	ld c,a			;fbfa	4f 	O 
lfbfbh:
	ld hl,0eb51h		;fbfb	21 51 eb 	! Q . 
	call 0ec1fh		;fbfe	cd 1f ec 	. . . 
	ret z			;fc01	c8 	. 
	jp (hl)			;fc02	e9 	. 
	ld c,a			;fc03	4f 	O 
	xor a			;fc04	af 	. 
	ld (0e48ch),a		;fc05	32 8c e4 	2 . . 
	ld hl,0ebach		;fc08	21 ac eb 	! . . 
	call 0ec1fh		;fc0b	cd 1f ec 	. . . 
	ret z			;fc0e	c8 	. 
	jp (hl)			;fc0f	e9 	. 
	xor a			;fc10	af 	. 
	jr lfc14h		;fc11	18 01 	. . 
	ld a,c			;fc13	79 	y 
lfc14h:
	ld (0e48ch),a		;fc14	32 8c e4 	2 . . 
	ret			;fc17	c9 	. 
lfc18h:
	ld a,c			;fc18	79 	y 
	or 080h		;fc19	f6 80 	. . 
	ld (0e48ch),a		;fc1b	32 8c e4 	2 . . 
	ret			;fc1e	c9 	. 
lfc1fh:
	ld a,(hl)			;fc1f	7e 	~ 
	or a			;fc20	b7 	. 
	ret z			;fc21	c8 	. 
	cp c			;fc22	b9 	. 
	jr z,lfc2ah		;fc23	28 05 	( . 
	inc hl			;fc25	23 	# 
	inc hl			;fc26	23 	# 
	inc hl			;fc27	23 	# 
	jr lfc1fh		;fc28	18 f5 	. . 
lfc2ah:
	push de			;fc2a	d5 	. 
	inc hl			;fc2b	23 	# 
	ld e,(hl)			;fc2c	5e 	^ 
	inc hl			;fc2d	23 	# 
	ld d,(hl)			;fc2e	56 	V 
	ex de,hl			;fc2f	eb 	. 
	pop de			;fc30	d1 	. 
	ld a,c			;fc31	79 	y 
	or a			;fc32	b7 	. 
	ret			;fc33	c9 	. 
	call 0ec83h		;fc34	cd 83 ec 	. . . 
	ret c			;fc37	d8 	. 
	ld (0e499h),a		;fc38	32 99 e4 	2 . . 
	jr lfc18h		;fc3b	18 db 	. . 
	call 0ec83h		;fc3d	cd 83 ec 	. . . 
	ret c			;fc40	d8 	. 
	ld b,a			;fc41	47 	G 
	ld a,(0e46ah)		;fc42	3a 6a e4 	: j . 
	bit 6,a		;fc45	cb 77 	. w 
	ld a,(0e499h)		;fc47	3a 99 e4 	: . . 
	jr nz,lfc4eh		;fc4a	20 02 	  . 
	cp b			;fc4c	b8 	. 
	ret z			;fc4d	c8 	. 
lfc4eh:
	push af			;fc4e	f5 	. 
	ld a,b			;fc4f	78 	x 
	rlca			;fc50	07 	. 
	rlca			;fc51	07 	. 
	rlca			;fc52	07 	. 
	ld b,a			;fc53	47 	G 
	pop af			;fc54	f1 	. 
	or b			;fc55	b0 	. 
	ld b,a			;fc56	47 	G 
	ld a,(0e467h)		;fc57	3a 67 e4 	: g . 
	and 0c0h		;fc5a	e6 c0 	. . 
	or b			;fc5c	b0 	. 
	ld (0e467h),a		;fc5d	32 67 e4 	2 g . 
	ld a,c			;fc60	79 	y 
	cp 0d4h		;fc61	fe d4 	. . 
	ret nz			;fc63	c0 	. 
	ld a,(0e467h)		;fc64	3a 67 e4 	: g . 
	jp 0e9edh		;fc67	c3 ed e9 	. . . 
	ld hl,0e467h		;fc6a	21 67 e4 	! g . 
	ld a,(0e466h)		;fc6d	3a 66 e4 	: f . 
	cp 030h		;fc70	fe 30 	. 0 
	ret c			;fc72	d8 	. 
	cp 034h		;fc73	fe 34 	. 4 
	ret nc			;fc75	d0 	. 
	rrc a		;fc76	cb 0f 	. . 
	rrc a		;fc78	cb 0f 	. . 
	and 0c0h		;fc7a	e6 c0 	. . 
	ld b,a			;fc7c	47 	G 
	ld a,(hl)			;fc7d	7e 	~ 
	and 03fh		;fc7e	e6 3f 	. ? 
	or b			;fc80	b0 	. 
	ld (hl),a			;fc81	77 	w 
	ret			;fc82	c9 	. 
	ld a,(0e466h)		;fc83	3a 66 e4 	: f . 
	sub 030h		;fc86	d6 30 	. 0 
	ret c			;fc88	d8 	. 
	cp 008h		;fc89	fe 08 	. . 
	ccf			;fc8b	3f 	? 
	ret			;fc8c	c9 	. 
	ld b,040h		;fc8d	06 40 	. @ 
	jr lfc93h		;fc8f	18 02 	. . 
	ld b,020h		;fc91	06 20 	.   
lfc93h:
	ld a,(0e470h)		;fc93	3a 70 e4 	: p . 
	and 01fh		;fc96	e6 1f 	. . 
	or b			;fc98	b0 	. 
	ld (0e470h),a		;fc99	32 70 e4 	2 p . 
	ld b,00ah		;fc9c	06 0a 	. . 
	ld c,050h		;fc9e	0e 50 	. P 
	out (c),b		;fca0	ed 41 	. A 
	inc c			;fca2	0c 	. 
	out (c),a		;fca3	ed 79 	. y 
	ret			;fca5	c9 	. 
	ld a,001h		;fca6	3e 01 	> . 
	ld (0e4cbh),a		;fca8	32 cb e4 	2 . . 
	ld c,050h		;fcab	0e 50 	. P 
	ld a,00eh		;fcad	3e 0e 	> . 
	out (c),a		;fcaf	ed 79 	. y 
	inc c			;fcb1	0c 	. 
	in h,(c)		;fcb2	ed 60 	. ` 
	inc a			;fcb4	3c 	< 
	dec c			;fcb5	0d 	. 
	out (c),a		;fcb6	ed 79 	. y 
	inc c			;fcb8	0c 	. 
	in l,(c)		;fcb9	ed 68 	. h 
	ld a,(0e462h)		;fcbb	3a 62 e4 	: b . 
	ld e,a			;fcbe	5f 	_ 
	ld d,000h		;fcbf	16 00 	. . 
	ld c,000h		;fcc1	0e 00 	. . 
lfcc3h:
	or a			;fcc3	b7 	. 
	sbc hl,de		;fcc4	ed 52 	. R 
	jr c,lfccbh		;fcc6	38 03 	8 . 
	inc c			;fcc8	0c 	. 
	jr lfcc3h		;fcc9	18 f8 	. . 
lfccbh:
	add hl,de			;fccb	19 	. 
	ld h,c			;fccc	61 	a 
	ld (0e4cch),hl		;fccd	22 cc e4 	" . . 
	ret			;fcd0	c9 	. 
	ld hl,0e4ddh		;fcd1	21 dd e4 	! . . 
	ld c,0c0h		;fcd4	0e c0 	. . 
lfcd6h:
	ld a,(de)			;fcd6	1a 	. 
	ld b,a			;fcd7	47 	G 
	ld a,(hl)			;fcd8	7e 	~ 
	ld (de),a			;fcd9	12 	. 
	ld (hl),b			;fcda	70 	p 
	inc de			;fcdb	13 	. 
	inc hl			;fcdc	23 	# 
	dec c			;fcdd	0d 	. 
	jr nz,lfcd6h		;fcde	20 f6 	  . 
	ret			;fce0	c9 	. 
	ld a,(0e466h)		;fce1	3a 66 e4 	: f . 
	ld (0e46ah),a		;fce4	32 6a e4 	2 j . 
	bit 7,a		;fce7	cb 7f 	.  
	ret nz			;fce9	c0 	. 
	jp 0e9e8h		;fcea	c3 e8 e9 	. . . 
	ld a,c			;fced	79 	y 
	ld (0e48ch),a		;fcee	32 8c e4 	2 . . 
lfcf1h:
	ld a,(0e466h)		;fcf1	3a 66 e4 	: f . 
	cp 01bh		;fcf4	fe 1b 	. . 
	jr z,lfd07h		;fcf6	28 0f 	( . 
	cp 060h		;fcf8	fe 60 	. ` 
	ret nc			;fcfa	d0 	. 
	call 0e828h		;fcfb	cd 28 e8 	. ( . 
	jp c,0e81eh		;fcfe	da 1e e8 	. . . 
	ld (0e466h),a		;fd01	32 66 e4 	2 f . 
	jp 0e8ech		;fd04	c3 ec e8 	. . . 
lfd07h:
	ld a,032h		;fd07	3e 32 	> 2 
	ld (0e48ch),a		;fd09	32 8c e4 	2 . . 
	ret			;fd0c	c9 	. 
	ret			;fd0d	c9 	. 
	ld a,(0e466h)		;fd0e	3a 66 e4 	: f . 
	cp 032h		;fd11	fe 32 	. 2 
	ret z			;fd13	c8 	. 
	ld a,0b1h		;fd14	3e b1 	> . 
	ld (0e48ch),a		;fd16	32 8c e4 	2 . . 
	jr lfcf1h		;fd19	18 d6 	. . 
	ld a,(0e466h)		;fd1b	3a 66 e4 	: f . 
	cp 020h		;fd1e	fe 20 	.   
	jr c,lfd2eh		;fd20	38 0c 	8 . 
	cp 038h		;fd22	fe 38 	. 8 
	jr nc,lfd31h		;fd24	30 0b 	0 . 
	sub 020h		;fd26	d6 20 	.   
lfd28h:
	ld (0e496h),a		;fd28	32 96 e4 	2 . . 
	jp 0ec18h		;fd2b	c3 18 ec 	. . . 
lfd2eh:
	xor a			;fd2e	af 	. 
	jr lfd28h		;fd2f	18 f7 	. . 
lfd31h:
	ld a,017h		;fd31	3e 17 	> . 
	jr lfd28h		;fd33	18 f3 	. . 
	ld a,(0e466h)		;fd35	3a 66 e4 	: f . 
	or a			;fd38	b7 	. 
	jr z,lfd28h		;fd39	28 ed 	( . 
	cp 019h		;fd3b	fe 19 	. . 
	jr nc,lfd31h		;fd3d	30 f2 	0 . 
	dec a			;fd3f	3d 	= 
	jr lfd28h		;fd40	18 e6 	. . 
	ld a,(0e466h)		;fd42	3a 66 e4 	: f . 
	sub 020h		;fd45	d6 20 	.   
	jr c,lfd5eh		;fd47	38 15 	8 . 
lfd49h:
	push af			;fd49	f5 	. 
	ld a,(0e462h)		;fd4a	3a 62 e4 	: b . 
	ld b,a			;fd4d	47 	G 
	pop af			;fd4e	f1 	. 
	cp b			;fd4f	b8 	. 
	jr nc,lfd61h		;fd50	30 0f 	0 . 
lfd52h:
	ld (0e46eh),a		;fd52	32 6e e4 	2 n . 
	ld a,(0e496h)		;fd55	3a 96 e4 	: . . 
	ld (0e46dh),a		;fd58	32 6d e4 	2 m . 
	jp 0e931h		;fd5b	c3 31 e9 	. 1 . 
lfd5eh:
	xor a			;fd5e	af 	. 
	jr lfd52h		;fd5f	18 f1 	. . 
lfd61h:
	ld a,b			;fd61	78 	x 
	dec a			;fd62	3d 	= 
	jr lfd52h		;fd63	18 ed 	. . 
	ld a,(0e466h)		;fd65	3a 66 e4 	: f . 
	jr lfd49h		;fd68	18 df 	. . 
	push de			;fd6a	d5 	. 
	call 0e9b7h		;fd6b	cd b7 e9 	. . . 
	pop de			;fd6e	d1 	. 
	call 0ea28h		;fd6f	cd 28 ea 	. ( . 
	ld (hl),e			;fd72	73 	s 
lfd73h:
	ld a,(0e46dh)		;fd73	3a 6d e4 	: m . 
	cp 017h		;fd76	fe 17 	. . 
	jp nz,0e8fah		;fd78	c2 fa e8 	. . . 
	ld a,(0e462h)		;fd7b	3a 62 e4 	: b . 
	dec a			;fd7e	3d 	= 
	ld b,a			;fd7f	47 	G 
	ld a,(0e46eh)		;fd80	3a 6e e4 	: n . 
	cp b			;fd83	b8 	. 
	jp nz,0e8fah		;fd84	c2 fa e8 	. . . 
	ret			;fd87	c9 	. 
	ld a,001h		;fd88	3e 01 	> . 
	ld (0e4cbh),a		;fd8a	32 cb e4 	2 . . 
	call 0e9b7h		;fd8d	cd b7 e9 	. . . 
	call 0ea28h		;fd90	cd 28 ea 	. ( . 
	ld a,(hl)			;fd93	7e 	~ 
	ld (0e4cch),a		;fd94	32 cc e4 	2 . . 
	jr lfd73h		;fd97	18 da 	. . 
	ld c,001h		;fd99	0e 01 	. . 
lfd9bh:
	ld a,(0e46eh)		;fd9b	3a 6e e4 	: n . 
lfd9eh:
	push af			;fd9e	f5 	. 
	call 0e9b7h		;fd9f	cd b7 e9 	. . . 
	pop af			;fda2	f1 	. 
	push af			;fda3	f5 	. 
	ld a,(0e462h)		;fda4	3a 62 e4 	: b . 
	dec a			;fda7	3d 	= 
	ld b,a			;fda8	47 	G 
	ld e,020h		;fda9	1e 20 	.   
	pop af			;fdab	f1 	. 
	push af			;fdac	f5 	. 
	push bc			;fdad	c5 	. 
	push hl			;fdae	e5 	. 
	call 0edbah		;fdaf	cd ba ed 	. . . 
	pop hl			;fdb2	e1 	. 
	ld de,00800h		;fdb3	11 00 08 	. . . 
	add hl,de			;fdb6	19 	. 
	ld e,(hl)			;fdb7	5e 	^ 
	pop bc			;fdb8	c1 	. 
	pop af			;fdb9	f1 	. 
lfdbah:
	push af			;fdba	f5 	. 
	push bc			;fdbb	c5 	. 
	call 0ea27h		;fdbc	cd 27 ea 	. ' . 
	pop bc			;fdbf	c1 	. 
	pop af			;fdc0	f1 	. 
	ld (hl),e			;fdc1	73 	s 
	cp b			;fdc2	b8 	. 
	jr z,lfdc9h		;fdc3	28 04 	( . 
	inc hl			;fdc5	23 	# 
	inc a			;fdc6	3c 	< 
	jr lfdbah		;fdc7	18 f1 	. . 
lfdc9h:
	dec c			;fdc9	0d 	. 
	ret z			;fdca	c8 	. 
	xor a			;fdcb	af 	. 
	inc hl			;fdcc	23 	# 
	jr lfdbah		;fdcd	18 eb 	. . 
	ld a,(0e46eh)		;fdcf	3a 6e e4 	: n . 
	ld e,a			;fdd2	5f 	_ 
	ld d,000h		;fdd3	16 00 	. . 
	or a			;fdd5	b7 	. 
	sbc hl,de		;fdd6	ed 52 	. R 
	xor a			;fdd8	af 	. 
	ld c,001h		;fdd9	0e 01 	. . 
	jr lfd9eh		;fddb	18 c1 	. . 
	ld a,(0e46dh)		;fddd	3a 6d e4 	: m . 
	ld b,a			;fde0	47 	G 
	ld a,018h		;fde1	3e 18 	> . 
	sub b			;fde3	90 	. 
	ld c,a			;fde4	4f 	O 
	jr lfd9bh		;fde5	18 b4 	. . 
	call 0ee11h		;fde7	cd 11 ee 	. . . 
	ret c			;fdea	d8 	. 
lfdebh:
	inc hl			;fdeb	23 	# 
	call 0ea28h		;fdec	cd 28 ea 	. ( . 
	ld a,(hl)			;fdef	7e 	~ 
	dec hl			;fdf0	2b 	+ 
	ld (hl),a			;fdf1	77 	w 
	inc hl			;fdf2	23 	# 
	dec c			;fdf3	0d 	. 
	jr nz,lfdebh		;fdf4	20 f5 	  . 
lfdf6h:
	call 0ea28h		;fdf6	cd 28 ea 	. ( . 
	ld (hl),020h		;fdf9	36 20 	6   
	ret			;fdfb	c9 	. 
	call 0ee11h		;fdfc	cd 11 ee 	. . . 
	ret c			;fdff	d8 	. 
	ld e,a			;fe00	5f 	_ 
	ld d,000h		;fe01	16 00 	. . 
	add hl,de			;fe03	19 	. 
lfe04h:
	dec hl			;fe04	2b 	+ 
	call 0ea28h		;fe05	cd 28 ea 	. ( . 
	ld a,(hl)			;fe08	7e 	~ 
	inc hl			;fe09	23 	# 
	ld (hl),a			;fe0a	77 	w 
	dec hl			;fe0b	2b 	+ 
	dec c			;fe0c	0d 	. 
	jr nz,lfe04h		;fe0d	20 f5 	  . 
	jr lfdf6h		;fe0f	18 e5 	. . 
	call 0e9b7h		;fe11	cd b7 e9 	. . . 
	ld a,(0e46eh)		;fe14	3a 6e e4 	: n . 
	ld c,a			;fe17	4f 	O 
	ld a,(0e462h)		;fe18	3a 62 e4 	: b . 
	ld b,a			;fe1b	47 	G 
	ld a,(0e466h)		;fe1c	3a 66 e4 	: f . 
	cp b			;fe1f	b8 	. 
	jr nc,lfe28h		;fe20	30 06 	0 . 
	sub c			;fe22	91 	. 
	jr z,lfe28h		;fe23	28 03 	( . 
	ret c			;fe25	d8 	. 
	ld c,a			;fe26	4f 	O 
	ret			;fe27	c9 	. 
lfe28h:
	scf			;fe28	37 	7 
	ret			;fe29	c9 	. 
	call 0e9b7h		;fe2a	cd b7 e9 	. . . 
	ld e,020h		;fe2d	1e 20 	.   
	ld a,(0e466h)		;fe2f	3a 66 e4 	: f . 
lfe32h:
	or a			;fe32	b7 	. 
	ret z			;fe33	c8 	. 
	ld c,a			;fe34	4f 	O 
	ld a,(0e462h)		;fe35	3a 62 e4 	: b . 
	ld b,a			;fe38	47 	G 
	ld a,(0e46eh)		;fe39	3a 6e e4 	: n . 
lfe3ch:
	call 0ea28h		;fe3c	cd 28 ea 	. ( . 
	ld (hl),e			;fe3f	73 	s 
	inc hl			;fe40	23 	# 
	inc a			;fe41	3c 	< 
	cp b			;fe42	b8 	. 
	jr z,lfe4ch		;fe43	28 07 	( . 
lfe45h:
	dec c			;fe45	0d 	. 
	jr nz,lfe3ch		;fe46	20 f4 	  . 
lfe48h:
	ld (0e46eh),a		;fe48	32 6e e4 	2 n . 
	ret			;fe4b	c9 	. 
lfe4ch:
	ld d,018h		;fe4c	16 18 	. . 
	ld a,(0e46dh)		;fe4e	3a 6d e4 	: m . 
	inc a			;fe51	3c 	< 
	cp d			;fe52	ba 	. 
	jr z,lfe5bh		;fe53	28 06 	( . 
	ld (0e46dh),a		;fe55	32 6d e4 	2 m . 
	xor a			;fe58	af 	. 
	jr lfe45h		;fe59	18 ea 	. . 
lfe5bh:
	ld a,b			;fe5b	78 	x 
	dec a			;fe5c	3d 	= 
	jr lfe48h		;fe5d	18 e9 	. . 
	ld a,(0e466h)		;fe5f	3a 66 e4 	: f . 
	ld (0e4ceh),a		;fe62	32 ce e4 	2 . . 
	jp 0ec18h		;fe65	c3 18 ec 	. . . 
	call 0e9b7h		;fe68	cd b7 e9 	. . . 
	ld a,(0e466h)		;fe6b	3a 66 e4 	: f . 
	ld e,a			;fe6e	5f 	_ 
	ld a,(0e4ceh)		;fe6f	3a ce e4 	: . . 
	ld c,a			;fe72	4f 	O 
	jr lfe32h		;fe73	18 bd 	. . 
	call 0ea0fh		;fe75	cd 0f ea 	. . . 
	ld hl,0e468h		;fe78	21 68 e4 	! h . 
	ld a,(0e466h)		;fe7b	3a 66 e4 	: f . 
	cp 030h		;fe7e	fe 30 	. 0 
	jr z,lfe88h		;fe80	28 06 	( . 
	cp 031h		;fe82	fe 31 	. 1 
	jr z,lfe90h		;fe84	28 0a 	( . 
	jr lfec9h		;fe86	18 41 	. A 
lfe88h:
	res 0,(hl)		;fe88	cb 86 	. . 
	ld ix,0eecfh		;fe8a	dd 21 cf ee 	. ! . . 
	jr lfe96h		;fe8e	18 06 	. . 
lfe90h:
	set 0,(hl)		;fe90	cb c6 	. . 
	ld ix,0eee1h		;fe92	dd 21 e1 ee 	. ! . . 
lfe96h:
	ld a,(ix+001h)		;fe96	dd 7e 01 	. ~ . 
	ld (0e462h),a		;fe99	32 62 e4 	2 b . 
	ld a,(ix+006h)		;fe9c	dd 7e 06 	. ~ . 
	ld (0e461h),a		;fe9f	32 61 e4 	2 a . 
	ld (0e460h),a		;fea2	32 60 e4 	2 ` . 
	ld (0e464h),a		;fea5	32 64 e4 	2 d . 
	ld (0e465h),a		;fea8	32 65 e4 	2 e . 
	ld a,(ix+00ah)		;feab	dd 7e 0a 	. ~ . 
	ld (0e470h),a		;feae	32 70 e4 	2 p . 
	ld b,010h		;feb1	06 10 	. . 
	ld c,000h		;feb3	0e 00 	. . 
lfeb5h:
	ld a,c			;feb5	79 	y 
	out (050h),a		;feb6	d3 50 	. P 
	ld a,(ix+000h)		;feb8	dd 7e 00 	. ~ . 
	out (051h),a		;febb	d3 51 	. Q 
	inc c			;febd	0c 	. 
	inc ix		;febe	dd 23 	. # 
	djnz lfeb5h		;fec0	10 f3 	. . 
	xor a			;fec2	af 	. 
	ld (0e463h),a		;fec3	32 63 e4 	2 c . 
	call 0e9e8h		;fec6	cd e8 e9 	. . . 
lfec9h:
	call 0ea1ch		;fec9	cd 1c ea 	. . . 
	jp 0ec10h		;fecc	c3 10 ec 	. . . 
	ld b,(hl)			;fecf	46 	F 
	jr z,lff06h		;fed0	28 34 	( 4 
	ld d,(hl)			;fed2	56 	V 
	ld e,002h		;fed3	1e 02 	. . 
	jr lfef2h		;fed5	18 1b 	. . 
	nop			;fed7	00 	. 
	add hl,bc			;fed8	09 	. 
	ld c,c			;fed9	49 	I 
	add hl,bc			;feda	09 	. 
	nop			;fedb	00 	. 
	nop			;fedc	00 	. 
	nop			;fedd	00 	. 
	nop			;fede	00 	. 
	nop			;fedf	00 	. 
	nop			;fee0	00 	. 
	ld a,(hl)			;fee1	7e 	~ 
	ld d,b			;fee2	50 	P 
	ld e,a			;fee3	5f 	_ 
	ld e,h			;fee4	5c 	\ 
	ld e,004h		;fee5	1e 04 	. . 
	jr lff04h		;fee7	18 1b 	. . 
	nop			;fee9	00 	. 
	add hl,bc			;feea	09 	. 
	ld c,c			;feeb	49 	I 
	add hl,bc			;feec	09 	. 
	nop			;feed	00 	. 
	nop			;feee	00 	. 
	nop			;feef	00 	. 
	nop			;fef0	00 	. 
	nop			;fef1	00 	. 
lfef2h:
	nop			;fef2	00 	. 
	and 000h		;fef3	e6 00 	. . 
	nop			;fef5	00 	. 
	nop			;fef6	00 	. 
	nop			;fef7	00 	. 
	nop			;fef8	00 	. 
	nop			;fef9	00 	. 
	nop			;fefa	00 	. 
	nop			;fefb	00 	. 
	nop			;fefc	00 	. 
	nop			;fefd	00 	. 
	nop			;fefe	00 	. 
	nop			;feff	00 	. 
	ret			;ff00	c9 	. 
	ex de,hl			;ff01	eb 	. 
	nop			;ff02	00 	. 
	nop			;ff03	00 	. 
lff04h:
	ret			;ff04	c9 	. 
	pop de			;ff05	d1 	. 
lff06h:
	nop			;ff06	00 	. 
	nop			;ff07	00 	. 
	ret			;ff08	c9 	. 
	pop hl			;ff09	e1 	. 
	nop			;ff0a	00 	. 
	nop			;ff0b	00 	. 
	ret			;ff0c	c9 	. 
	inc hl			;ff0d	23 	# 
	nop			;ff0e	00 	. 
	nop			;ff0f	00 	. 
	ret			;ff10	c9 	. 
sub_ff11h:
	call nz,00000h		;ff11	c4 00 00 	. . . 
	ret			;ff14	c9 	. 
	pop de			;ff15	d1 	. 
	nop			;ff16	00 	. 
	nop			;ff17	00 	. 
	ret			;ff18	c9 	. 
	sub 000h		;ff19	d6 00 	. . 
	nop			;ff1b	00 	. 
	ret			;ff1c	c9 	. 
	dec sp			;ff1d	3b 	; 
	nop			;ff1e	00 	. 
	nop			;ff1f	00 	. 
	ld b,(hl)			;ff20	46 	F 
	ld d,0e9h		;ff21	16 e9 	. . 
	ld b,b			;ff23	40 	@ 
	inc e			;ff24	1c 	. 
	jp (hl)			;ff25	e9 	. 
	jp nz,0e962h		;ff26	c2 62 e9 	. b . 
	nop			;ff29	00 	. 
	inc sp			;ff2a	33 	3 
	ld d,0e9h		;ff2b	16 e9 	. . 
	ld b,(hl)			;ff2d	46 	F 
	inc e			;ff2e	1c 	. 
	jp (hl)			;ff2f	e9 	. 
	cp a			;ff30	bf 	. 
	ld h,d			;ff31	62 	b 
	jp (hl)			;ff32	e9 	. 
	nop			;ff33	00 	. 
	call 0e3f2h		;ff34	cd f2 e3 	. . . 
	cp 030h		;ff37	fe 30 	. 0 
	jr c,lff51h		;ff39	38 16 	8 . 
	cp 03ah		;ff3b	fe 3a 	. : 
	jr c,lff4dh		;ff3d	38 0e 	8 . 
	and 05fh		;ff3f	e6 5f 	. _ 
	cp 041h		;ff41	fe 41 	. A 
	jr c,lff51h		;ff43	38 0c 	8 . 
	cp 047h		;ff45	fe 47 	. G 
	jr nc,lff51h		;ff47	30 08 	0 . 
	sub 037h		;ff49	d6 37 	. 7 
lff4bh:
	and a			;ff4b	a7 	. 
	ret			;ff4c	c9 	. 
lff4dh:
	sub 030h		;ff4d	d6 30 	. 0 
	jr lff4bh		;ff4f	18 fa 	. . 
lff51h:
	scf			;ff51	37 	7 
	ret			;ff52	c9 	. 
	push hl			;ff53	e5 	. 
	ld hl,0e49dh		;ff54	21 9d e4 	! . . 
	xor a			;ff57	af 	. 
	ld (hl),a			;ff58	77 	w 
	dec hl			;ff59	2b 	+ 
	ld (hl),a			;ff5a	77 	w 
lff5bh:
	call 0ef34h		;ff5b	cd 34 ef 	. 4 . 
	jr c,lff68h		;ff5e	38 08 	8 . 
	rld		;ff60	ed 6f 	. o 
	inc hl			;ff62	23 	# 
	rld		;ff63	ed 6f 	. o 
	dec hl			;ff65	2b 	+ 
	jr lff5bh		;ff66	18 f3 	. . 
lff68h:
	pop hl			;ff68	e1 	. 
	ret			;ff69	c9 	. 
lff6ah:
	ld a,(hl)			;ff6a	7e 	~ 
	or a			;ff6b	b7 	. 
	ret z			;ff6c	c8 	. 
	ld c,a			;ff6d	4f 	O 
	call 0e3d5h		;ff6e	cd d5 e3 	. . . 
	inc hl			;ff71	23 	# 
	jr lff6ah		;ff72	18 f6 	. . 
	ld a,001h		;ff74	3e 01 	> . 
	ld (0e4d0h),a		;ff76	32 d0 e4 	2 . . 
	ld a,(0e4d0h)		;ff79	3a d0 e4 	: . . 
	or a			;ff7c	b7 	. 
	ret z			;ff7d	c8 	. 
	ld hl,0ef20h		;ff7e	21 20 ef 	!   . 
lff81h:
	ld a,(hl)			;ff81	7e 	~ 
	or a			;ff82	b7 	. 
	ret z			;ff83	c8 	. 
	inc hl			;ff84	23 	# 
	ld e,(hl)			;ff85	5e 	^ 
	inc hl			;ff86	23 	# 
	ld d,(hl)			;ff87	56 	V 
	ld (de),a			;ff88	12 	. 
	inc hl			;ff89	23 	# 
	jr lff81h		;ff8a	18 f5 	. . 
	ld hl,0ef2ah		;ff8c	21 2a ef 	! * . 
	jr lff81h		;ff8f	18 f0 	. . 
lff91h:
	in a,(0f0h)		;ff91	db f0 	. . 
	bit 6,a		;ff93	cb 77 	. w 
	jr nz,lff91h		;ff95	20 fa 	  . 
	ret			;ff97	c9 	. 
	
called_when_floppy_is_present_ff98h:	
	call 0ea0fh		;ff98	cd 0f ea 	. . . 
	; select monitor rom
	ld hl,0e469h		;ff9b	21 69 e4 	! i . 
	res 3,(hl)		;ff9e	cb 9e 	. . 
	ld a,(hl)			;ffa0	7e 	~ 
	out (020h),a		;ffa1	d3 20 	.   
	
	jp 0f0b2h		;ffa3	c3 b2 f0 	. . . 
	ld hl,0e469h		;ffa6	21 69 e4 	! i . 
	set 3,(hl)		;ffa9	cb de 	. . 
	ld a,(hl)			;ffab	7e 	~ 
	out (020h),a		;ffac	d3 20 	.   
	ld hl,0e468h		;ffae	21 68 e4 	! h . 
	set 7,(hl)		;ffb1	cb fe 	. . 
	ld a,(hl)			;ffb3	7e 	~ 
	out (010h),a		;ffb4	d3 10 	. . 
	ld a,(0c200h)		;ffb6	3a 00 c2 	: . . 
	cp 016h		;ffb9	fe 16 	. . 
	call z,0ef74h		;ffbb	cc 74 ef 	. t . 
	jp 0c200h		;ffbe	c3 00 c2 	. . . 

boot_to_ram_entry_ffc1h:
	ld sp,lf000h		;ffc1	31 00 f0 	1 . .

	; sets "display inhibit" 
	call 0ea0fh		;ffc4	cd 0f ea 	. . . 
 
	; sets "monitor rom address" as "upper 4k bytes"
	ld hl,0e469h		;ffc7	21 69 e4 	! i . 
	set 6,(hl)		;ffca	cb f6 	. . 
	ld a,(hl)			;ffcc	7e 	~ 
	out (020h),a		;ffcd	d3 20 	.   

	call sub_f010h		;ffcf	cd 10 f0 	. . . 
	jp 0e000h		;ffd2	c3 00 e0 	. . . 
	ld (hl),h			;ffd5	74 	t 
	nop			;ffd6	00 	. 
	nop			;ffd7	00 	. 
	nop			;ffd8	00 	. 
	nop			;ffd9	00 	. 
	nop			;ffda	00 	. 
	nop			;ffdb	00 	. 
	nop			;ffdc	00 	. 
	nop			;ffdd	00 	. 
	nop			;ffde	00 	. 
	nop			;ffdf	00 	. 
	nop			;ffe0	00 	. 
	nop			;ffe1	00 	. 
	nop			;ffe2	00 	. 
	nop			;ffe3	00 	. 
	nop			;ffe4	00 	. 
	nop			;ffe5	00 	. 
	nop			;ffe6	00 	. 
	nop			;ffe7	00 	. 
	nop			;ffe8	00 	. 
	nop			;ffe9	00 	. 
	nop			;ffea	00 	. 
	nop			;ffeb	00 	. 
	nop			;ffec	00 	. 
	nop			;ffed	00 	. 
	nop			;ffee	00 	. 
	nop			;ffef	00 	. 

; Copies the 4k monitor code from ROM 0xf000h to RAM address 0x0e00h and jumps to it.
; The jump address below is 0x0efc1h which is the entry point of the monitor code
; and is in this file at address 0x0ffc1h.
boot_fff0h:
	ld de,0e000h		;fff0	11 00 e0 	. . . 
	ld hl,lf000h		;fff3	21 00 f0 	! . . 
	ld bc,00ffeh		;fff6	01 fe 0f 	. . . 
	ldir		;fff9	ed b0 	. . 
	jp 0efc1h		;fffb	c3 c1 ef 	. . . 
	nop			;fffe	00 	. 
lffffh:
	nop			;ffff	00 	. 

	end
