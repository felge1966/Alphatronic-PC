; z80dasm 1.1.5
; command line: z80dasm -a -l -t -z -g 0xf000 xx-2.bin

	org	0f000h

	nop			;f000	00 	. 
	nop			;f001	00 	. 
	nop			;f002	00 	. 
	nop			;f003	00 	. 
	nop			;f004	00 	. 
	nop			;f005	00 	. 
	nop			;f006	00 	. 
	nop			;f007	00 	. 
	nop			;f008	00 	. 
	nop			;f009	00 	. 
	nop			;f00a	00 	. 
	nop			;f00b	00 	. 
	nop			;f00c	00 	. 
	nop			;f00d	00 	. 
	nop			;f00e	00 	. 
	nop			;f00f	00 	. 
	call sub_f07eh		;f010	cd 7e f0 	. ~ . 
	call 0eb2ch		;f013	cd 2c eb 	. , . 
	call sub_f020h		;f016	cd 20 f0 	.   . 
	call sub_f02ch		;f019	cd 2c f0 	. , . 
	call sub_f06dh		;f01c	cd 6d f0 	. m . 
	ret			;f01f	c9 	. 
sub_f020h:
	in a,(010h)		;f020	db 10 	. . 
	bit 5,a		;f022	cb 6f 	. o 
	ret z			;f024	c8 	. 
	ld hl,(0e437h)		;f025	2a 37 e4 	* 7 . 
	ld (0e43ah),hl		;f028	22 3a e4 	" : . 
	ret			;f02b	c9 	. 
sub_f02ch:
	in a,(010h)		;f02c	db 10 	. . 
	and 01ch		;f02e	e6 1c 	. . 
	ret z			;f030	c8 	. 
	rra			;f031	1f 	. 
	rra			;f032	1f 	. 
	and 007h		;f033	e6 07 	. . 
	cp 001h		;f035	fe 01 	. . 
	call z,sub_f13ah		;f037	cc 3a f1 	. : . 
	cp 002h		;f03a	fe 02 	. . 
	call z,sub_f142h		;f03c	cc 42 f1 	. B . 
	cp 003h		;f03f	fe 03 	. . 
	call z,sub_f145h		;f041	cc 45 f1 	. E . 
	cp 004h		;f044	fe 04 	. . 
	call z,sub_f148h		;f046	cc 48 f1 	. H . 
	cp 005h		;f049	fe 05 	. . 
	call z,sub_f14bh		;f04b	cc 4b f1 	. K . 
	cp 006h		;f04e	fe 06 	. . 
	call z,sub_f14eh		;f050	cc 4e f1 	. N . 
	cp 007h		;f053	fe 07 	. . 
	call z,sub_f151h		;f055	cc 51 f1 	. Q . 
	ld de,000c0h		;f058	11 c0 00 	. . . 
	ld hl,lf800h		;f05b	21 00 f8 	! . . 
lf05eh:
	dec a			;f05e	3d 	= 
	jr z,lf064h		;f05f	28 03 	( . 
	add hl,de			;f061	19 	. 
	jr lf05eh		;f062	18 fa 	. . 
lf064h:
	ld de,0e4ddh		;f064	11 dd e4 	. . . 
	ld bc,000c0h		;f067	01 c0 00 	. . . 
	ldir		;f06a	ed b0 	. . 
	ret			;f06c	c9 	. 
sub_f06dh:
	in a,(010h)		;f06d	db 10 	. . 
	bit 6,a		;f06f	cb 77 	. w 
	ret z			;f071	c8 	. 
	ld hl,lfd40h		;f072	21 40 fd 	! @ . 
	ld de,0eecfh		;f075	11 cf ee 	. . . 
	ld bc,00024h		;f078	01 24 00 	. $ . 
	ldir		;f07b	ed b0 	. . 
	ret			;f07d	c9 	. 
sub_f07eh:
	ld a,016h		;f07e	3e 16 	> . 
	out (070h),a		;f080	d3 70 	. p 
	ld a,0efh		;f082	3e ef 	> . 
	out (071h),a		;f084	d3 71 	. q 
	ld a,0ffh		;f086	3e ff 	> . 
	out (071h),a		;f088	d3 71 	. q 
	ret			;f08a	c9 	. 
lf08bh:
	inc bc			;f08b	03 	. 
	rst 8			;f08c	cf 	. 
	inc e			;f08d	1c 	. 
	rlca			;f08e	07 	. 
	nop			;f08f	00 	. 
	ld b,(hl)			;f090	46 	F 
	nop			;f091	00 	. 
	nop			;f092	00 	. 
	nop			;f093	00 	. 
	ld bc,01001h		;f094	01 01 10 	. . . 
	ld (hl),0ffh		;f097	36 ff 	6 . 
sub_f099h:
	ld a,(ix+000h)		;f099	dd 7e 00 	. ~ . 
	inc ix		;f09c	dd 23 	. # 
sub_f09eh:
	push af			;f09e	f5 	. 
lf09fh:
	in a,(0f9h)		;f09f	db f9 	. . 
	bit 7,a		;f0a1	cb 7f 	.  
	jr z,lf09fh		;f0a3	28 fa 	( . 
	pop af			;f0a5	f1 	. 
	out (0f8h),a		;f0a6	d3 f8 	. . 
	ret			;f0a8	c9 	. 
lf0a9h:
	in a,(0f9h)		;f0a9	db f9 	. . 
	add a,040h		;f0ab	c6 40 	. @ 
	jr nc,lf0a9h		;f0ad	30 fa 	0 . 
	in a,(0f8h)		;f0af	db f8 	. . 
	ret			;f0b1	c9 	. 
lf0b2h:
	xor a			;f0b2	af 	. 
	out (0f0h),a		;f0b3	d3 f0 	. . 
	ld de,0c200h		;f0b5	11 00 c2 	. . . 
	ld a,e			;f0b8	7b 	{ 
	out (064h),a		;f0b9	d3 64 	. d 
	ld a,d			;f0bb	7a 	z 
	out (064h),a		;f0bc	d3 64 	. d 
	ld a,0ffh		;f0be	3e ff 	> . 
	out (0f0h),a		;f0c0	d3 f0 	. . 
	out (0f0h),a		;f0c2	d3 f0 	. . 
	out (065h),a		;f0c4	d3 65 	. e 
	ld a,040h		;f0c6	3e 40 	> @ 
	out (065h),a		;f0c8	d3 65 	. e 
	ld hl,09c40h		;f0ca	21 40 9c 	! @ . 
	call 0e67bh		;f0cd	cd 7b e6 	. { . 
	ld hl,09c40h		;f0d0	21 40 9c 	! @ . 
	call 0e67bh		;f0d3	cd 7b e6 	. { . 
	ld c,005h		;f0d6	0e 05 	. . 
	ld ix,lf08bh		;f0d8	dd 21 8b f0 	. ! . . 
lf0dch:
	call sub_f099h		;f0dc	cd 99 f0 	. . . 
	dec c			;f0df	0d 	. 
	jr nz,lf0dch		;f0e0	20 fa 	  . 
	call 0e3fdh		;f0e2	cd fd e3 	. . . 
lf0e5h:
	ld a,008h		;f0e5	3e 08 	> . 
	call sub_f09eh		;f0e7	cd 9e f0 	. . . 
	call lf0a9h		;f0ea	cd a9 f0 	. . . 
	cp 080h		;f0ed	fe 80 	. . 
	jr z,lf0e5h		;f0ef	28 f4 	( . 
	call lf0a9h		;f0f1	cd a9 f0 	. . . 
	ld a,044h		;f0f4	3e 44 	> D 
	out (068h),a		;f0f6	d3 68 	. h 
	ld c,009h		;f0f8	0e 09 	. . 
lf0fah:
	call sub_f099h		;f0fa	cd 99 f0 	. . . 
	dec c			;f0fd	0d 	. 
	jr nz,lf0fah		;f0fe	20 fa 	  . 
	call 0e3fdh		;f100	cd fd e3 	. . . 
	call lf0a9h		;f103	cd a9 f0 	. . . 
	and 0c0h		;f106	e6 c0 	. . 
	jr nz,lf0b2h		;f108	20 a8 	  . 
	ld c,006h		;f10a	0e 06 	. . 
lf10ch:
	call lf0a9h		;f10c	cd a9 f0 	. . . 
	dec c			;f10f	0d 	. 
	jr nz,lf10ch		;f110	20 fa 	  . 
	jp 0efa6h		;f112	c3 a6 ef 	. . . 
	ld hl,lfd64h		;f115	21 64 fd 	! d . 
	ld de,0e525h		;f118	11 25 e5 	. % . 
	ld bc,00018h		;f11b	01 18 00 	. . . 
	ldir		;f11e	ed b0 	. . 
	ld de,0e585h		;f120	11 85 e5 	. . . 
	ld bc,00018h		;f123	01 18 00 	. . . 
	ldir		;f126	ed b0 	. . 
	ld hl,lfd94h		;f128	21 94 fd 	! . . 
	ld de,0e867h		;f12b	11 67 e8 	. g . 
	ld c,008h		;f12e	0e 08 	. . 
lf130h:
	ld a,(hl)			;f130	7e 	~ 
	ld (de),a			;f131	12 	. 
	inc hl			;f132	23 	# 
	inc de			;f133	13 	. 
	inc de			;f134	13 	. 
	inc de			;f135	13 	. 
	dec c			;f136	0d 	. 
	jr nz,lf130h		;f137	20 f7 	  . 
	ret			;f139	c9 	. 
sub_f13ah:
	push af			;f13a	f5 	. 
	ld a,07eh		;f13b	3e 7e 	> ~ 
	ld (0e750h),a		;f13d	32 50 e7 	2 P . 
	pop af			;f140	f1 	. 
	ret			;f141	c9 	. 
sub_f142h:
	ret			;f142	c9 	. 
	nop			;f143	00 	. 
	nop			;f144	00 	. 
sub_f145h:
	ret			;f145	c9 	. 
	nop			;f146	00 	. 
	nop			;f147	00 	. 
sub_f148h:
	ret			;f148	c9 	. 
	nop			;f149	00 	. 
	nop			;f14a	00 	. 
sub_f14bh:
	ret			;f14b	c9 	. 
	nop			;f14c	00 	. 
	nop			;f14d	00 	. 
sub_f14eh:
	ret			;f14e	c9 	. 
	nop			;f14f	00 	. 
	nop			;f150	00 	. 
sub_f151h:
	ret			;f151	c9 	. 
	nop			;f152	00 	. 
	nop			;f153	00 	. 
	nop			;f154	00 	. 
	nop			;f155	00 	. 
	nop			;f156	00 	. 
	nop			;f157	00 	. 
	nop			;f158	00 	. 
	nop			;f159	00 	. 
	nop			;f15a	00 	. 
	nop			;f15b	00 	. 
	nop			;f15c	00 	. 
	nop			;f15d	00 	. 
	nop			;f15e	00 	. 
	nop			;f15f	00 	. 
	nop			;f160	00 	. 
	nop			;f161	00 	. 
	nop			;f162	00 	. 
	nop			;f163	00 	. 
	nop			;f164	00 	. 
	nop			;f165	00 	. 
	nop			;f166	00 	. 
	nop			;f167	00 	. 
	nop			;f168	00 	. 
	nop			;f169	00 	. 
	nop			;f16a	00 	. 
	nop			;f16b	00 	. 
	nop			;f16c	00 	. 
	nop			;f16d	00 	. 
	nop			;f16e	00 	. 
	nop			;f16f	00 	. 
	nop			;f170	00 	. 
	nop			;f171	00 	. 
	nop			;f172	00 	. 
	nop			;f173	00 	. 
	nop			;f174	00 	. 
	nop			;f175	00 	. 
	nop			;f176	00 	. 
	nop			;f177	00 	. 
	nop			;f178	00 	. 
	nop			;f179	00 	. 
	nop			;f17a	00 	. 
	nop			;f17b	00 	. 
	nop			;f17c	00 	. 
	nop			;f17d	00 	. 
	nop			;f17e	00 	. 
	nop			;f17f	00 	. 
	nop			;f180	00 	. 
	nop			;f181	00 	. 
	nop			;f182	00 	. 
	nop			;f183	00 	. 
	nop			;f184	00 	. 
	nop			;f185	00 	. 
	nop			;f186	00 	. 
	nop			;f187	00 	. 
	nop			;f188	00 	. 
	nop			;f189	00 	. 
	nop			;f18a	00 	. 
	nop			;f18b	00 	. 
	nop			;f18c	00 	. 
	nop			;f18d	00 	. 
	nop			;f18e	00 	. 
	nop			;f18f	00 	. 
	nop			;f190	00 	. 
	nop			;f191	00 	. 
	nop			;f192	00 	. 
	nop			;f193	00 	. 
	nop			;f194	00 	. 
	nop			;f195	00 	. 
	nop			;f196	00 	. 
	nop			;f197	00 	. 
	nop			;f198	00 	. 
	nop			;f199	00 	. 
	nop			;f19a	00 	. 
	nop			;f19b	00 	. 
	nop			;f19c	00 	. 
	nop			;f19d	00 	. 
	nop			;f19e	00 	. 
	nop			;f19f	00 	. 
	nop			;f1a0	00 	. 
	nop			;f1a1	00 	. 
	nop			;f1a2	00 	. 
	nop			;f1a3	00 	. 
	nop			;f1a4	00 	. 
	nop			;f1a5	00 	. 
	nop			;f1a6	00 	. 
	nop			;f1a7	00 	. 
	nop			;f1a8	00 	. 
	nop			;f1a9	00 	. 
	nop			;f1aa	00 	. 
	nop			;f1ab	00 	. 
	nop			;f1ac	00 	. 
	nop			;f1ad	00 	. 
	nop			;f1ae	00 	. 
	nop			;f1af	00 	. 
	nop			;f1b0	00 	. 
	nop			;f1b1	00 	. 
	nop			;f1b2	00 	. 
	nop			;f1b3	00 	. 
	nop			;f1b4	00 	. 
	nop			;f1b5	00 	. 
	nop			;f1b6	00 	. 
	nop			;f1b7	00 	. 
	nop			;f1b8	00 	. 
	nop			;f1b9	00 	. 
	nop			;f1ba	00 	. 
	nop			;f1bb	00 	. 
	nop			;f1bc	00 	. 
	nop			;f1bd	00 	. 
	nop			;f1be	00 	. 
	nop			;f1bf	00 	. 
	nop			;f1c0	00 	. 
	nop			;f1c1	00 	. 
	nop			;f1c2	00 	. 
	nop			;f1c3	00 	. 
	nop			;f1c4	00 	. 
	nop			;f1c5	00 	. 
	nop			;f1c6	00 	. 
	nop			;f1c7	00 	. 
	nop			;f1c8	00 	. 
	nop			;f1c9	00 	. 
	nop			;f1ca	00 	. 
	nop			;f1cb	00 	. 
	nop			;f1cc	00 	. 
	nop			;f1cd	00 	. 
	nop			;f1ce	00 	. 
	nop			;f1cf	00 	. 
	nop			;f1d0	00 	. 
	nop			;f1d1	00 	. 
	nop			;f1d2	00 	. 
	nop			;f1d3	00 	. 
	nop			;f1d4	00 	. 
	nop			;f1d5	00 	. 
	nop			;f1d6	00 	. 
	nop			;f1d7	00 	. 
	nop			;f1d8	00 	. 
	nop			;f1d9	00 	. 
	nop			;f1da	00 	. 
	nop			;f1db	00 	. 
	nop			;f1dc	00 	. 
	nop			;f1dd	00 	. 
	nop			;f1de	00 	. 
	nop			;f1df	00 	. 
	nop			;f1e0	00 	. 
	nop			;f1e1	00 	. 
	nop			;f1e2	00 	. 
	nop			;f1e3	00 	. 
	nop			;f1e4	00 	. 
	nop			;f1e5	00 	. 
	nop			;f1e6	00 	. 
	nop			;f1e7	00 	. 
	nop			;f1e8	00 	. 
	nop			;f1e9	00 	. 
	nop			;f1ea	00 	. 
	nop			;f1eb	00 	. 
	nop			;f1ec	00 	. 
	nop			;f1ed	00 	. 
	nop			;f1ee	00 	. 
	nop			;f1ef	00 	. 
	nop			;f1f0	00 	. 
	nop			;f1f1	00 	. 
	nop			;f1f2	00 	. 
	nop			;f1f3	00 	. 
	nop			;f1f4	00 	. 
	nop			;f1f5	00 	. 
	nop			;f1f6	00 	. 
	nop			;f1f7	00 	. 
	nop			;f1f8	00 	. 
	nop			;f1f9	00 	. 
	nop			;f1fa	00 	. 
	nop			;f1fb	00 	. 
	nop			;f1fc	00 	. 
	nop			;f1fd	00 	. 
	nop			;f1fe	00 	. 
	nop			;f1ff	00 	. 
	nop			;f200	00 	. 
	nop			;f201	00 	. 
	nop			;f202	00 	. 
	nop			;f203	00 	. 
	nop			;f204	00 	. 
	nop			;f205	00 	. 
	nop			;f206	00 	. 
	nop			;f207	00 	. 
	nop			;f208	00 	. 
	nop			;f209	00 	. 
	nop			;f20a	00 	. 
	nop			;f20b	00 	. 
	nop			;f20c	00 	. 
	nop			;f20d	00 	. 
	nop			;f20e	00 	. 
	nop			;f20f	00 	. 
	nop			;f210	00 	. 
	nop			;f211	00 	. 
	nop			;f212	00 	. 
	nop			;f213	00 	. 
	nop			;f214	00 	. 
	nop			;f215	00 	. 
	nop			;f216	00 	. 
	nop			;f217	00 	. 
	nop			;f218	00 	. 
	nop			;f219	00 	. 
	nop			;f21a	00 	. 
	nop			;f21b	00 	. 
	nop			;f21c	00 	. 
	nop			;f21d	00 	. 
	nop			;f21e	00 	. 
	nop			;f21f	00 	. 
	nop			;f220	00 	. 
	nop			;f221	00 	. 
	nop			;f222	00 	. 
	nop			;f223	00 	. 
	nop			;f224	00 	. 
	nop			;f225	00 	. 
	nop			;f226	00 	. 
	nop			;f227	00 	. 
	nop			;f228	00 	. 
	nop			;f229	00 	. 
	nop			;f22a	00 	. 
	nop			;f22b	00 	. 
	nop			;f22c	00 	. 
	nop			;f22d	00 	. 
	nop			;f22e	00 	. 
	nop			;f22f	00 	. 
	nop			;f230	00 	. 
	nop			;f231	00 	. 
	nop			;f232	00 	. 
	nop			;f233	00 	. 
	nop			;f234	00 	. 
	nop			;f235	00 	. 
	nop			;f236	00 	. 
	nop			;f237	00 	. 
	nop			;f238	00 	. 
	nop			;f239	00 	. 
	nop			;f23a	00 	. 
	nop			;f23b	00 	. 
	nop			;f23c	00 	. 
	nop			;f23d	00 	. 
	nop			;f23e	00 	. 
	nop			;f23f	00 	. 
	nop			;f240	00 	. 
	nop			;f241	00 	. 
	nop			;f242	00 	. 
	nop			;f243	00 	. 
	nop			;f244	00 	. 
	nop			;f245	00 	. 
	nop			;f246	00 	. 
	nop			;f247	00 	. 
	nop			;f248	00 	. 
	nop			;f249	00 	. 
	nop			;f24a	00 	. 
	nop			;f24b	00 	. 
	nop			;f24c	00 	. 
	nop			;f24d	00 	. 
	nop			;f24e	00 	. 
	nop			;f24f	00 	. 
	nop			;f250	00 	. 
	nop			;f251	00 	. 
	nop			;f252	00 	. 
	nop			;f253	00 	. 
	nop			;f254	00 	. 
	nop			;f255	00 	. 
	nop			;f256	00 	. 
	nop			;f257	00 	. 
	nop			;f258	00 	. 
	nop			;f259	00 	. 
	nop			;f25a	00 	. 
	nop			;f25b	00 	. 
	nop			;f25c	00 	. 
	nop			;f25d	00 	. 
	nop			;f25e	00 	. 
	nop			;f25f	00 	. 
	nop			;f260	00 	. 
	nop			;f261	00 	. 
	nop			;f262	00 	. 
	nop			;f263	00 	. 
	nop			;f264	00 	. 
	nop			;f265	00 	. 
	nop			;f266	00 	. 
	nop			;f267	00 	. 
	nop			;f268	00 	. 
	nop			;f269	00 	. 
	nop			;f26a	00 	. 
	nop			;f26b	00 	. 
	nop			;f26c	00 	. 
	nop			;f26d	00 	. 
	nop			;f26e	00 	. 
	nop			;f26f	00 	. 
	nop			;f270	00 	. 
	nop			;f271	00 	. 
	nop			;f272	00 	. 
	nop			;f273	00 	. 
	nop			;f274	00 	. 
	nop			;f275	00 	. 
	nop			;f276	00 	. 
	nop			;f277	00 	. 
	nop			;f278	00 	. 
	nop			;f279	00 	. 
	nop			;f27a	00 	. 
	nop			;f27b	00 	. 
	nop			;f27c	00 	. 
	nop			;f27d	00 	. 
	nop			;f27e	00 	. 
	nop			;f27f	00 	. 
	nop			;f280	00 	. 
	nop			;f281	00 	. 
	nop			;f282	00 	. 
	nop			;f283	00 	. 
	nop			;f284	00 	. 
	nop			;f285	00 	. 
	nop			;f286	00 	. 
	nop			;f287	00 	. 
	nop			;f288	00 	. 
	nop			;f289	00 	. 
	nop			;f28a	00 	. 
	nop			;f28b	00 	. 
	nop			;f28c	00 	. 
	nop			;f28d	00 	. 
	nop			;f28e	00 	. 
	nop			;f28f	00 	. 
	nop			;f290	00 	. 
	nop			;f291	00 	. 
	nop			;f292	00 	. 
	nop			;f293	00 	. 
	nop			;f294	00 	. 
	nop			;f295	00 	. 
	nop			;f296	00 	. 
	nop			;f297	00 	. 
	nop			;f298	00 	. 
	nop			;f299	00 	. 
	nop			;f29a	00 	. 
	nop			;f29b	00 	. 
	nop			;f29c	00 	. 
	nop			;f29d	00 	. 
	nop			;f29e	00 	. 
	nop			;f29f	00 	. 
	nop			;f2a0	00 	. 
	nop			;f2a1	00 	. 
	nop			;f2a2	00 	. 
	nop			;f2a3	00 	. 
	nop			;f2a4	00 	. 
	nop			;f2a5	00 	. 
	nop			;f2a6	00 	. 
	nop			;f2a7	00 	. 
	nop			;f2a8	00 	. 
	nop			;f2a9	00 	. 
	nop			;f2aa	00 	. 
	nop			;f2ab	00 	. 
	nop			;f2ac	00 	. 
	nop			;f2ad	00 	. 
	nop			;f2ae	00 	. 
	nop			;f2af	00 	. 
	nop			;f2b0	00 	. 
	nop			;f2b1	00 	. 
	nop			;f2b2	00 	. 
	nop			;f2b3	00 	. 
	nop			;f2b4	00 	. 
	nop			;f2b5	00 	. 
	nop			;f2b6	00 	. 
	nop			;f2b7	00 	. 
	nop			;f2b8	00 	. 
	nop			;f2b9	00 	. 
	nop			;f2ba	00 	. 
	nop			;f2bb	00 	. 
	nop			;f2bc	00 	. 
	nop			;f2bd	00 	. 
	nop			;f2be	00 	. 
	nop			;f2bf	00 	. 
	nop			;f2c0	00 	. 
	nop			;f2c1	00 	. 
	nop			;f2c2	00 	. 
	nop			;f2c3	00 	. 
	nop			;f2c4	00 	. 
	nop			;f2c5	00 	. 
	nop			;f2c6	00 	. 
	nop			;f2c7	00 	. 
	nop			;f2c8	00 	. 
	nop			;f2c9	00 	. 
	nop			;f2ca	00 	. 
	nop			;f2cb	00 	. 
	nop			;f2cc	00 	. 
	nop			;f2cd	00 	. 
	nop			;f2ce	00 	. 
	nop			;f2cf	00 	. 
	nop			;f2d0	00 	. 
	nop			;f2d1	00 	. 
	nop			;f2d2	00 	. 
	nop			;f2d3	00 	. 
	nop			;f2d4	00 	. 
	nop			;f2d5	00 	. 
	nop			;f2d6	00 	. 
	nop			;f2d7	00 	. 
	nop			;f2d8	00 	. 
	nop			;f2d9	00 	. 
	nop			;f2da	00 	. 
	nop			;f2db	00 	. 
	nop			;f2dc	00 	. 
	nop			;f2dd	00 	. 
	nop			;f2de	00 	. 
	nop			;f2df	00 	. 
	nop			;f2e0	00 	. 
	nop			;f2e1	00 	. 
	nop			;f2e2	00 	. 
	nop			;f2e3	00 	. 
	nop			;f2e4	00 	. 
	nop			;f2e5	00 	. 
	nop			;f2e6	00 	. 
	nop			;f2e7	00 	. 
	nop			;f2e8	00 	. 
	nop			;f2e9	00 	. 
	nop			;f2ea	00 	. 
	nop			;f2eb	00 	. 
	nop			;f2ec	00 	. 
	nop			;f2ed	00 	. 
	nop			;f2ee	00 	. 
	nop			;f2ef	00 	. 
	nop			;f2f0	00 	. 
	nop			;f2f1	00 	. 
	nop			;f2f2	00 	. 
	nop			;f2f3	00 	. 
	nop			;f2f4	00 	. 
	nop			;f2f5	00 	. 
	nop			;f2f6	00 	. 
	nop			;f2f7	00 	. 
	nop			;f2f8	00 	. 
	nop			;f2f9	00 	. 
	nop			;f2fa	00 	. 
	nop			;f2fb	00 	. 
	nop			;f2fc	00 	. 
	nop			;f2fd	00 	. 
	nop			;f2fe	00 	. 
	nop			;f2ff	00 	. 
	nop			;f300	00 	. 
	nop			;f301	00 	. 
	nop			;f302	00 	. 
	nop			;f303	00 	. 
	nop			;f304	00 	. 
	nop			;f305	00 	. 
	nop			;f306	00 	. 
	nop			;f307	00 	. 
	nop			;f308	00 	. 
	nop			;f309	00 	. 
	nop			;f30a	00 	. 
	nop			;f30b	00 	. 
	nop			;f30c	00 	. 
	nop			;f30d	00 	. 
	nop			;f30e	00 	. 
	nop			;f30f	00 	. 
	nop			;f310	00 	. 
	nop			;f311	00 	. 
	nop			;f312	00 	. 
	nop			;f313	00 	. 
	nop			;f314	00 	. 
	nop			;f315	00 	. 
	nop			;f316	00 	. 
	nop			;f317	00 	. 
	nop			;f318	00 	. 
	nop			;f319	00 	. 
	nop			;f31a	00 	. 
	nop			;f31b	00 	. 
	nop			;f31c	00 	. 
	nop			;f31d	00 	. 
	nop			;f31e	00 	. 
	nop			;f31f	00 	. 
	nop			;f320	00 	. 
	nop			;f321	00 	. 
	nop			;f322	00 	. 
	nop			;f323	00 	. 
	nop			;f324	00 	. 
	nop			;f325	00 	. 
	nop			;f326	00 	. 
	nop			;f327	00 	. 
	nop			;f328	00 	. 
	nop			;f329	00 	. 
	nop			;f32a	00 	. 
	nop			;f32b	00 	. 
	nop			;f32c	00 	. 
	nop			;f32d	00 	. 
	nop			;f32e	00 	. 
	nop			;f32f	00 	. 
	nop			;f330	00 	. 
	nop			;f331	00 	. 
	nop			;f332	00 	. 
	nop			;f333	00 	. 
	nop			;f334	00 	. 
	nop			;f335	00 	. 
	nop			;f336	00 	. 
	nop			;f337	00 	. 
	nop			;f338	00 	. 
	nop			;f339	00 	. 
	nop			;f33a	00 	. 
	nop			;f33b	00 	. 
	nop			;f33c	00 	. 
	nop			;f33d	00 	. 
	nop			;f33e	00 	. 
	nop			;f33f	00 	. 
	nop			;f340	00 	. 
	nop			;f341	00 	. 
	nop			;f342	00 	. 
	nop			;f343	00 	. 
	nop			;f344	00 	. 
	nop			;f345	00 	. 
	nop			;f346	00 	. 
	nop			;f347	00 	. 
	nop			;f348	00 	. 
	nop			;f349	00 	. 
	nop			;f34a	00 	. 
	nop			;f34b	00 	. 
	nop			;f34c	00 	. 
	nop			;f34d	00 	. 
	nop			;f34e	00 	. 
	nop			;f34f	00 	. 
	nop			;f350	00 	. 
	nop			;f351	00 	. 
	nop			;f352	00 	. 
	nop			;f353	00 	. 
	nop			;f354	00 	. 
	nop			;f355	00 	. 
	nop			;f356	00 	. 
	nop			;f357	00 	. 
	nop			;f358	00 	. 
	nop			;f359	00 	. 
	nop			;f35a	00 	. 
	nop			;f35b	00 	. 
	nop			;f35c	00 	. 
	nop			;f35d	00 	. 
	nop			;f35e	00 	. 
	nop			;f35f	00 	. 
	nop			;f360	00 	. 
	nop			;f361	00 	. 
	nop			;f362	00 	. 
	nop			;f363	00 	. 
	nop			;f364	00 	. 
	nop			;f365	00 	. 
	nop			;f366	00 	. 
	nop			;f367	00 	. 
	nop			;f368	00 	. 
	nop			;f369	00 	. 
	nop			;f36a	00 	. 
	nop			;f36b	00 	. 
	nop			;f36c	00 	. 
	nop			;f36d	00 	. 
	nop			;f36e	00 	. 
	nop			;f36f	00 	. 
	nop			;f370	00 	. 
	nop			;f371	00 	. 
	nop			;f372	00 	. 
	nop			;f373	00 	. 
	nop			;f374	00 	. 
	nop			;f375	00 	. 
	nop			;f376	00 	. 
	nop			;f377	00 	. 
	nop			;f378	00 	. 
	nop			;f379	00 	. 
	nop			;f37a	00 	. 
	nop			;f37b	00 	. 
	nop			;f37c	00 	. 
	nop			;f37d	00 	. 
	nop			;f37e	00 	. 
	nop			;f37f	00 	. 
	nop			;f380	00 	. 
	nop			;f381	00 	. 
	nop			;f382	00 	. 
	nop			;f383	00 	. 
	nop			;f384	00 	. 
	nop			;f385	00 	. 
	nop			;f386	00 	. 
	nop			;f387	00 	. 
	nop			;f388	00 	. 
	nop			;f389	00 	. 
	nop			;f38a	00 	. 
	nop			;f38b	00 	. 
	nop			;f38c	00 	. 
	nop			;f38d	00 	. 
	nop			;f38e	00 	. 
	nop			;f38f	00 	. 
	nop			;f390	00 	. 
	nop			;f391	00 	. 
	nop			;f392	00 	. 
	nop			;f393	00 	. 
	nop			;f394	00 	. 
	nop			;f395	00 	. 
	nop			;f396	00 	. 
	nop			;f397	00 	. 
	nop			;f398	00 	. 
	nop			;f399	00 	. 
	nop			;f39a	00 	. 
	nop			;f39b	00 	. 
	nop			;f39c	00 	. 
	nop			;f39d	00 	. 
	nop			;f39e	00 	. 
	nop			;f39f	00 	. 
	nop			;f3a0	00 	. 
	nop			;f3a1	00 	. 
	nop			;f3a2	00 	. 
	nop			;f3a3	00 	. 
	nop			;f3a4	00 	. 
	nop			;f3a5	00 	. 
	nop			;f3a6	00 	. 
	nop			;f3a7	00 	. 
	nop			;f3a8	00 	. 
	nop			;f3a9	00 	. 
	nop			;f3aa	00 	. 
	nop			;f3ab	00 	. 
	nop			;f3ac	00 	. 
	nop			;f3ad	00 	. 
	nop			;f3ae	00 	. 
	nop			;f3af	00 	. 
	nop			;f3b0	00 	. 
	nop			;f3b1	00 	. 
	nop			;f3b2	00 	. 
	nop			;f3b3	00 	. 
	nop			;f3b4	00 	. 
	nop			;f3b5	00 	. 
	nop			;f3b6	00 	. 
	nop			;f3b7	00 	. 
	nop			;f3b8	00 	. 
	nop			;f3b9	00 	. 
	nop			;f3ba	00 	. 
	nop			;f3bb	00 	. 
	nop			;f3bc	00 	. 
	nop			;f3bd	00 	. 
	nop			;f3be	00 	. 
	nop			;f3bf	00 	. 
	nop			;f3c0	00 	. 
	nop			;f3c1	00 	. 
	nop			;f3c2	00 	. 
	nop			;f3c3	00 	. 
	nop			;f3c4	00 	. 
	nop			;f3c5	00 	. 
	nop			;f3c6	00 	. 
	nop			;f3c7	00 	. 
	nop			;f3c8	00 	. 
	nop			;f3c9	00 	. 
	nop			;f3ca	00 	. 
	nop			;f3cb	00 	. 
	nop			;f3cc	00 	. 
	nop			;f3cd	00 	. 
	nop			;f3ce	00 	. 
	nop			;f3cf	00 	. 
	nop			;f3d0	00 	. 
	nop			;f3d1	00 	. 
	nop			;f3d2	00 	. 
	nop			;f3d3	00 	. 
	nop			;f3d4	00 	. 
	nop			;f3d5	00 	. 
	nop			;f3d6	00 	. 
	nop			;f3d7	00 	. 
	nop			;f3d8	00 	. 
	nop			;f3d9	00 	. 
	nop			;f3da	00 	. 
	nop			;f3db	00 	. 
	nop			;f3dc	00 	. 
	nop			;f3dd	00 	. 
	nop			;f3de	00 	. 
	nop			;f3df	00 	. 
	nop			;f3e0	00 	. 
	nop			;f3e1	00 	. 
	nop			;f3e2	00 	. 
	nop			;f3e3	00 	. 
	nop			;f3e4	00 	. 
	nop			;f3e5	00 	. 
	nop			;f3e6	00 	. 
	nop			;f3e7	00 	. 
	nop			;f3e8	00 	. 
	nop			;f3e9	00 	. 
	nop			;f3ea	00 	. 
	nop			;f3eb	00 	. 
	nop			;f3ec	00 	. 
	nop			;f3ed	00 	. 
	nop			;f3ee	00 	. 
	nop			;f3ef	00 	. 
	nop			;f3f0	00 	. 
	nop			;f3f1	00 	. 
	nop			;f3f2	00 	. 
	nop			;f3f3	00 	. 
	nop			;f3f4	00 	. 
	nop			;f3f5	00 	. 
	nop			;f3f6	00 	. 
	nop			;f3f7	00 	. 
	nop			;f3f8	00 	. 
	nop			;f3f9	00 	. 
	nop			;f3fa	00 	. 
	nop			;f3fb	00 	. 
	nop			;f3fc	00 	. 
	nop			;f3fd	00 	. 
	nop			;f3fe	00 	. 
	nop			;f3ff	00 	. 
	nop			;f400	00 	. 
	nop			;f401	00 	. 
	nop			;f402	00 	. 
	nop			;f403	00 	. 
	nop			;f404	00 	. 
	nop			;f405	00 	. 
	nop			;f406	00 	. 
	nop			;f407	00 	. 
	nop			;f408	00 	. 
	nop			;f409	00 	. 
	nop			;f40a	00 	. 
	nop			;f40b	00 	. 
	nop			;f40c	00 	. 
	nop			;f40d	00 	. 
	nop			;f40e	00 	. 
	nop			;f40f	00 	. 
	nop			;f410	00 	. 
	nop			;f411	00 	. 
	nop			;f412	00 	. 
	nop			;f413	00 	. 
	nop			;f414	00 	. 
	nop			;f415	00 	. 
	nop			;f416	00 	. 
	nop			;f417	00 	. 
	nop			;f418	00 	. 
	nop			;f419	00 	. 
	nop			;f41a	00 	. 
	nop			;f41b	00 	. 
	nop			;f41c	00 	. 
	nop			;f41d	00 	. 
	nop			;f41e	00 	. 
	nop			;f41f	00 	. 
	nop			;f420	00 	. 
	nop			;f421	00 	. 
	nop			;f422	00 	. 
	nop			;f423	00 	. 
	nop			;f424	00 	. 
	nop			;f425	00 	. 
	nop			;f426	00 	. 
	nop			;f427	00 	. 
	nop			;f428	00 	. 
	nop			;f429	00 	. 
	nop			;f42a	00 	. 
	nop			;f42b	00 	. 
	nop			;f42c	00 	. 
	nop			;f42d	00 	. 
	nop			;f42e	00 	. 
	nop			;f42f	00 	. 
	nop			;f430	00 	. 
	nop			;f431	00 	. 
	nop			;f432	00 	. 
	nop			;f433	00 	. 
	nop			;f434	00 	. 
	nop			;f435	00 	. 
	nop			;f436	00 	. 
	nop			;f437	00 	. 
	nop			;f438	00 	. 
	nop			;f439	00 	. 
	nop			;f43a	00 	. 
	nop			;f43b	00 	. 
	nop			;f43c	00 	. 
	nop			;f43d	00 	. 
	nop			;f43e	00 	. 
	nop			;f43f	00 	. 
	nop			;f440	00 	. 
	nop			;f441	00 	. 
	nop			;f442	00 	. 
	nop			;f443	00 	. 
	nop			;f444	00 	. 
	nop			;f445	00 	. 
	nop			;f446	00 	. 
	nop			;f447	00 	. 
	nop			;f448	00 	. 
	nop			;f449	00 	. 
	nop			;f44a	00 	. 
	nop			;f44b	00 	. 
	nop			;f44c	00 	. 
	nop			;f44d	00 	. 
	nop			;f44e	00 	. 
	nop			;f44f	00 	. 
	nop			;f450	00 	. 
	nop			;f451	00 	. 
	nop			;f452	00 	. 
	nop			;f453	00 	. 
	nop			;f454	00 	. 
	nop			;f455	00 	. 
	nop			;f456	00 	. 
	nop			;f457	00 	. 
	nop			;f458	00 	. 
	nop			;f459	00 	. 
	nop			;f45a	00 	. 
	nop			;f45b	00 	. 
	nop			;f45c	00 	. 
	nop			;f45d	00 	. 
	nop			;f45e	00 	. 
	nop			;f45f	00 	. 
	nop			;f460	00 	. 
	nop			;f461	00 	. 
	nop			;f462	00 	. 
	nop			;f463	00 	. 
	nop			;f464	00 	. 
	nop			;f465	00 	. 
	nop			;f466	00 	. 
	nop			;f467	00 	. 
	nop			;f468	00 	. 
	nop			;f469	00 	. 
	nop			;f46a	00 	. 
	nop			;f46b	00 	. 
	nop			;f46c	00 	. 
	nop			;f46d	00 	. 
	nop			;f46e	00 	. 
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
	nop			;f47a	00 	. 
	nop			;f47b	00 	. 
	nop			;f47c	00 	. 
	nop			;f47d	00 	. 
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
	nop			;f4d3	00 	. 
	nop			;f4d4	00 	. 
	nop			;f4d5	00 	. 
	nop			;f4d6	00 	. 
	nop			;f4d7	00 	. 
	nop			;f4d8	00 	. 
	nop			;f4d9	00 	. 
	nop			;f4da	00 	. 
	nop			;f4db	00 	. 
	nop			;f4dc	00 	. 
	nop			;f4dd	00 	. 
	nop			;f4de	00 	. 
	nop			;f4df	00 	. 
	nop			;f4e0	00 	. 
	nop			;f4e1	00 	. 
	nop			;f4e2	00 	. 
	nop			;f4e3	00 	. 
	nop			;f4e4	00 	. 
	nop			;f4e5	00 	. 
	nop			;f4e6	00 	. 
	nop			;f4e7	00 	. 
	nop			;f4e8	00 	. 
	nop			;f4e9	00 	. 
	nop			;f4ea	00 	. 
	nop			;f4eb	00 	. 
	nop			;f4ec	00 	. 
	nop			;f4ed	00 	. 
	nop			;f4ee	00 	. 
	nop			;f4ef	00 	. 
	nop			;f4f0	00 	. 
	nop			;f4f1	00 	. 
	nop			;f4f2	00 	. 
	nop			;f4f3	00 	. 
	nop			;f4f4	00 	. 
	nop			;f4f5	00 	. 
	nop			;f4f6	00 	. 
	nop			;f4f7	00 	. 
	nop			;f4f8	00 	. 
	nop			;f4f9	00 	. 
	nop			;f4fa	00 	. 
	nop			;f4fb	00 	. 
	nop			;f4fc	00 	. 
	nop			;f4fd	00 	. 
	nop			;f4fe	00 	. 
	nop			;f4ff	00 	. 
	nop			;f500	00 	. 
	nop			;f501	00 	. 
	nop			;f502	00 	. 
	nop			;f503	00 	. 
	nop			;f504	00 	. 
	nop			;f505	00 	. 
	nop			;f506	00 	. 
	nop			;f507	00 	. 
	nop			;f508	00 	. 
	nop			;f509	00 	. 
	nop			;f50a	00 	. 
	nop			;f50b	00 	. 
	nop			;f50c	00 	. 
	nop			;f50d	00 	. 
	nop			;f50e	00 	. 
	nop			;f50f	00 	. 
	nop			;f510	00 	. 
	nop			;f511	00 	. 
	nop			;f512	00 	. 
	nop			;f513	00 	. 
	nop			;f514	00 	. 
	nop			;f515	00 	. 
	nop			;f516	00 	. 
	nop			;f517	00 	. 
	nop			;f518	00 	. 
	nop			;f519	00 	. 
	nop			;f51a	00 	. 
	nop			;f51b	00 	. 
	nop			;f51c	00 	. 
	nop			;f51d	00 	. 
	nop			;f51e	00 	. 
	nop			;f51f	00 	. 
	nop			;f520	00 	. 
	nop			;f521	00 	. 
	nop			;f522	00 	. 
	nop			;f523	00 	. 
	nop			;f524	00 	. 
	nop			;f525	00 	. 
	nop			;f526	00 	. 
	nop			;f527	00 	. 
	nop			;f528	00 	. 
	nop			;f529	00 	. 
	nop			;f52a	00 	. 
	nop			;f52b	00 	. 
	nop			;f52c	00 	. 
	nop			;f52d	00 	. 
	nop			;f52e	00 	. 
	nop			;f52f	00 	. 
	nop			;f530	00 	. 
	nop			;f531	00 	. 
	nop			;f532	00 	. 
	nop			;f533	00 	. 
	nop			;f534	00 	. 
	nop			;f535	00 	. 
	nop			;f536	00 	. 
	nop			;f537	00 	. 
	nop			;f538	00 	. 
	nop			;f539	00 	. 
	nop			;f53a	00 	. 
	nop			;f53b	00 	. 
	nop			;f53c	00 	. 
	nop			;f53d	00 	. 
	nop			;f53e	00 	. 
	nop			;f53f	00 	. 
	nop			;f540	00 	. 
	nop			;f541	00 	. 
	nop			;f542	00 	. 
	nop			;f543	00 	. 
	nop			;f544	00 	. 
	nop			;f545	00 	. 
	nop			;f546	00 	. 
	nop			;f547	00 	. 
	nop			;f548	00 	. 
	nop			;f549	00 	. 
	nop			;f54a	00 	. 
	nop			;f54b	00 	. 
	nop			;f54c	00 	. 
	nop			;f54d	00 	. 
	nop			;f54e	00 	. 
	nop			;f54f	00 	. 
	nop			;f550	00 	. 
	nop			;f551	00 	. 
	nop			;f552	00 	. 
	nop			;f553	00 	. 
	nop			;f554	00 	. 
	nop			;f555	00 	. 
	nop			;f556	00 	. 
	nop			;f557	00 	. 
	nop			;f558	00 	. 
	nop			;f559	00 	. 
	nop			;f55a	00 	. 
	nop			;f55b	00 	. 
	nop			;f55c	00 	. 
	nop			;f55d	00 	. 
	nop			;f55e	00 	. 
	nop			;f55f	00 	. 
	nop			;f560	00 	. 
	nop			;f561	00 	. 
	nop			;f562	00 	. 
	nop			;f563	00 	. 
	nop			;f564	00 	. 
	nop			;f565	00 	. 
	nop			;f566	00 	. 
	nop			;f567	00 	. 
	nop			;f568	00 	. 
	nop			;f569	00 	. 
	nop			;f56a	00 	. 
	nop			;f56b	00 	. 
	nop			;f56c	00 	. 
	nop			;f56d	00 	. 
	nop			;f56e	00 	. 
	nop			;f56f	00 	. 
	nop			;f570	00 	. 
	nop			;f571	00 	. 
	nop			;f572	00 	. 
	nop			;f573	00 	. 
	nop			;f574	00 	. 
	nop			;f575	00 	. 
	nop			;f576	00 	. 
	nop			;f577	00 	. 
	nop			;f578	00 	. 
	nop			;f579	00 	. 
	nop			;f57a	00 	. 
	nop			;f57b	00 	. 
	nop			;f57c	00 	. 
	nop			;f57d	00 	. 
	nop			;f57e	00 	. 
	nop			;f57f	00 	. 
	nop			;f580	00 	. 
	nop			;f581	00 	. 
	nop			;f582	00 	. 
	nop			;f583	00 	. 
	nop			;f584	00 	. 
	nop			;f585	00 	. 
	nop			;f586	00 	. 
	nop			;f587	00 	. 
	nop			;f588	00 	. 
	nop			;f589	00 	. 
	nop			;f58a	00 	. 
	nop			;f58b	00 	. 
	nop			;f58c	00 	. 
	nop			;f58d	00 	. 
	nop			;f58e	00 	. 
	nop			;f58f	00 	. 
	nop			;f590	00 	. 
	nop			;f591	00 	. 
	nop			;f592	00 	. 
	nop			;f593	00 	. 
	nop			;f594	00 	. 
	nop			;f595	00 	. 
	nop			;f596	00 	. 
	nop			;f597	00 	. 
	nop			;f598	00 	. 
	nop			;f599	00 	. 
	nop			;f59a	00 	. 
	nop			;f59b	00 	. 
	nop			;f59c	00 	. 
	nop			;f59d	00 	. 
	nop			;f59e	00 	. 
	nop			;f59f	00 	. 
	nop			;f5a0	00 	. 
	nop			;f5a1	00 	. 
	nop			;f5a2	00 	. 
	nop			;f5a3	00 	. 
	nop			;f5a4	00 	. 
	nop			;f5a5	00 	. 
	nop			;f5a6	00 	. 
	nop			;f5a7	00 	. 
	nop			;f5a8	00 	. 
	nop			;f5a9	00 	. 
	nop			;f5aa	00 	. 
	nop			;f5ab	00 	. 
	nop			;f5ac	00 	. 
	nop			;f5ad	00 	. 
	nop			;f5ae	00 	. 
	nop			;f5af	00 	. 
	nop			;f5b0	00 	. 
	nop			;f5b1	00 	. 
	nop			;f5b2	00 	. 
	nop			;f5b3	00 	. 
	nop			;f5b4	00 	. 
	nop			;f5b5	00 	. 
	nop			;f5b6	00 	. 
	nop			;f5b7	00 	. 
	nop			;f5b8	00 	. 
	nop			;f5b9	00 	. 
	nop			;f5ba	00 	. 
	nop			;f5bb	00 	. 
	nop			;f5bc	00 	. 
	nop			;f5bd	00 	. 
	nop			;f5be	00 	. 
	nop			;f5bf	00 	. 
	nop			;f5c0	00 	. 
	nop			;f5c1	00 	. 
	nop			;f5c2	00 	. 
	nop			;f5c3	00 	. 
	nop			;f5c4	00 	. 
	nop			;f5c5	00 	. 
	nop			;f5c6	00 	. 
	nop			;f5c7	00 	. 
	nop			;f5c8	00 	. 
	nop			;f5c9	00 	. 
	nop			;f5ca	00 	. 
	nop			;f5cb	00 	. 
	nop			;f5cc	00 	. 
	nop			;f5cd	00 	. 
	nop			;f5ce	00 	. 
	nop			;f5cf	00 	. 
	nop			;f5d0	00 	. 
	nop			;f5d1	00 	. 
	nop			;f5d2	00 	. 
	nop			;f5d3	00 	. 
	nop			;f5d4	00 	. 
	nop			;f5d5	00 	. 
	nop			;f5d6	00 	. 
	nop			;f5d7	00 	. 
	nop			;f5d8	00 	. 
	nop			;f5d9	00 	. 
	nop			;f5da	00 	. 
	nop			;f5db	00 	. 
	nop			;f5dc	00 	. 
	nop			;f5dd	00 	. 
	nop			;f5de	00 	. 
	nop			;f5df	00 	. 
	nop			;f5e0	00 	. 
	nop			;f5e1	00 	. 
	nop			;f5e2	00 	. 
	nop			;f5e3	00 	. 
	nop			;f5e4	00 	. 
	nop			;f5e5	00 	. 
	nop			;f5e6	00 	. 
	nop			;f5e7	00 	. 
	nop			;f5e8	00 	. 
	nop			;f5e9	00 	. 
	nop			;f5ea	00 	. 
	nop			;f5eb	00 	. 
	nop			;f5ec	00 	. 
	nop			;f5ed	00 	. 
	nop			;f5ee	00 	. 
	nop			;f5ef	00 	. 
	nop			;f5f0	00 	. 
	nop			;f5f1	00 	. 
	nop			;f5f2	00 	. 
	nop			;f5f3	00 	. 
	nop			;f5f4	00 	. 
	nop			;f5f5	00 	. 
	nop			;f5f6	00 	. 
	nop			;f5f7	00 	. 
	nop			;f5f8	00 	. 
	nop			;f5f9	00 	. 
	nop			;f5fa	00 	. 
	nop			;f5fb	00 	. 
	nop			;f5fc	00 	. 
	nop			;f5fd	00 	. 
	nop			;f5fe	00 	. 
	nop			;f5ff	00 	. 
	nop			;f600	00 	. 
	nop			;f601	00 	. 
	nop			;f602	00 	. 
	nop			;f603	00 	. 
	nop			;f604	00 	. 
	nop			;f605	00 	. 
	nop			;f606	00 	. 
	nop			;f607	00 	. 
	nop			;f608	00 	. 
	nop			;f609	00 	. 
	nop			;f60a	00 	. 
	nop			;f60b	00 	. 
	nop			;f60c	00 	. 
	nop			;f60d	00 	. 
	nop			;f60e	00 	. 
	nop			;f60f	00 	. 
	nop			;f610	00 	. 
	nop			;f611	00 	. 
	nop			;f612	00 	. 
	nop			;f613	00 	. 
	nop			;f614	00 	. 
	nop			;f615	00 	. 
	nop			;f616	00 	. 
	nop			;f617	00 	. 
	nop			;f618	00 	. 
	nop			;f619	00 	. 
	nop			;f61a	00 	. 
	nop			;f61b	00 	. 
	nop			;f61c	00 	. 
	nop			;f61d	00 	. 
	nop			;f61e	00 	. 
	nop			;f61f	00 	. 
	nop			;f620	00 	. 
	nop			;f621	00 	. 
	nop			;f622	00 	. 
	nop			;f623	00 	. 
	nop			;f624	00 	. 
	nop			;f625	00 	. 
	nop			;f626	00 	. 
	nop			;f627	00 	. 
	nop			;f628	00 	. 
	nop			;f629	00 	. 
	nop			;f62a	00 	. 
	nop			;f62b	00 	. 
	nop			;f62c	00 	. 
	nop			;f62d	00 	. 
	nop			;f62e	00 	. 
	nop			;f62f	00 	. 
	nop			;f630	00 	. 
	nop			;f631	00 	. 
	nop			;f632	00 	. 
	nop			;f633	00 	. 
	nop			;f634	00 	. 
	nop			;f635	00 	. 
	nop			;f636	00 	. 
	nop			;f637	00 	. 
	nop			;f638	00 	. 
	nop			;f639	00 	. 
	nop			;f63a	00 	. 
	nop			;f63b	00 	. 
	nop			;f63c	00 	. 
	nop			;f63d	00 	. 
	nop			;f63e	00 	. 
	nop			;f63f	00 	. 
	nop			;f640	00 	. 
	nop			;f641	00 	. 
	nop			;f642	00 	. 
	nop			;f643	00 	. 
	nop			;f644	00 	. 
	nop			;f645	00 	. 
	nop			;f646	00 	. 
	nop			;f647	00 	. 
	nop			;f648	00 	. 
	nop			;f649	00 	. 
	nop			;f64a	00 	. 
	nop			;f64b	00 	. 
	nop			;f64c	00 	. 
	nop			;f64d	00 	. 
	nop			;f64e	00 	. 
	nop			;f64f	00 	. 
	nop			;f650	00 	. 
	nop			;f651	00 	. 
	nop			;f652	00 	. 
	nop			;f653	00 	. 
	nop			;f654	00 	. 
	nop			;f655	00 	. 
	nop			;f656	00 	. 
	nop			;f657	00 	. 
	nop			;f658	00 	. 
	nop			;f659	00 	. 
	nop			;f65a	00 	. 
	nop			;f65b	00 	. 
	nop			;f65c	00 	. 
	nop			;f65d	00 	. 
	nop			;f65e	00 	. 
	nop			;f65f	00 	. 
	nop			;f660	00 	. 
	nop			;f661	00 	. 
	nop			;f662	00 	. 
	nop			;f663	00 	. 
	nop			;f664	00 	. 
	nop			;f665	00 	. 
	nop			;f666	00 	. 
	nop			;f667	00 	. 
	nop			;f668	00 	. 
	nop			;f669	00 	. 
	nop			;f66a	00 	. 
	nop			;f66b	00 	. 
	nop			;f66c	00 	. 
	nop			;f66d	00 	. 
	nop			;f66e	00 	. 
	nop			;f66f	00 	. 
	nop			;f670	00 	. 
	nop			;f671	00 	. 
	nop			;f672	00 	. 
	nop			;f673	00 	. 
	nop			;f674	00 	. 
	nop			;f675	00 	. 
	nop			;f676	00 	. 
	nop			;f677	00 	. 
	nop			;f678	00 	. 
	nop			;f679	00 	. 
	nop			;f67a	00 	. 
	nop			;f67b	00 	. 
	nop			;f67c	00 	. 
	nop			;f67d	00 	. 
	nop			;f67e	00 	. 
	nop			;f67f	00 	. 
	nop			;f680	00 	. 
	nop			;f681	00 	. 
	nop			;f682	00 	. 
	nop			;f683	00 	. 
	nop			;f684	00 	. 
	nop			;f685	00 	. 
	nop			;f686	00 	. 
	nop			;f687	00 	. 
	nop			;f688	00 	. 
	nop			;f689	00 	. 
	nop			;f68a	00 	. 
	nop			;f68b	00 	. 
	nop			;f68c	00 	. 
	nop			;f68d	00 	. 
	nop			;f68e	00 	. 
	nop			;f68f	00 	. 
	nop			;f690	00 	. 
	nop			;f691	00 	. 
	nop			;f692	00 	. 
	nop			;f693	00 	. 
	nop			;f694	00 	. 
	nop			;f695	00 	. 
	nop			;f696	00 	. 
	nop			;f697	00 	. 
	nop			;f698	00 	. 
	nop			;f699	00 	. 
	nop			;f69a	00 	. 
	nop			;f69b	00 	. 
	nop			;f69c	00 	. 
	nop			;f69d	00 	. 
	nop			;f69e	00 	. 
	nop			;f69f	00 	. 
	nop			;f6a0	00 	. 
	nop			;f6a1	00 	. 
	nop			;f6a2	00 	. 
	nop			;f6a3	00 	. 
	nop			;f6a4	00 	. 
	nop			;f6a5	00 	. 
	nop			;f6a6	00 	. 
	nop			;f6a7	00 	. 
	nop			;f6a8	00 	. 
	nop			;f6a9	00 	. 
	nop			;f6aa	00 	. 
	nop			;f6ab	00 	. 
	nop			;f6ac	00 	. 
	nop			;f6ad	00 	. 
	nop			;f6ae	00 	. 
	nop			;f6af	00 	. 
	nop			;f6b0	00 	. 
	nop			;f6b1	00 	. 
	nop			;f6b2	00 	. 
	nop			;f6b3	00 	. 
	nop			;f6b4	00 	. 
	nop			;f6b5	00 	. 
	nop			;f6b6	00 	. 
	nop			;f6b7	00 	. 
	nop			;f6b8	00 	. 
	nop			;f6b9	00 	. 
	nop			;f6ba	00 	. 
	nop			;f6bb	00 	. 
	nop			;f6bc	00 	. 
	nop			;f6bd	00 	. 
	nop			;f6be	00 	. 
	nop			;f6bf	00 	. 
	nop			;f6c0	00 	. 
	nop			;f6c1	00 	. 
	nop			;f6c2	00 	. 
	nop			;f6c3	00 	. 
	nop			;f6c4	00 	. 
	nop			;f6c5	00 	. 
	nop			;f6c6	00 	. 
	nop			;f6c7	00 	. 
	nop			;f6c8	00 	. 
	nop			;f6c9	00 	. 
	nop			;f6ca	00 	. 
	nop			;f6cb	00 	. 
	nop			;f6cc	00 	. 
	nop			;f6cd	00 	. 
	nop			;f6ce	00 	. 
	nop			;f6cf	00 	. 
	nop			;f6d0	00 	. 
	nop			;f6d1	00 	. 
	nop			;f6d2	00 	. 
	nop			;f6d3	00 	. 
	nop			;f6d4	00 	. 
	nop			;f6d5	00 	. 
	nop			;f6d6	00 	. 
	nop			;f6d7	00 	. 
	nop			;f6d8	00 	. 
	nop			;f6d9	00 	. 
	nop			;f6da	00 	. 
	nop			;f6db	00 	. 
	nop			;f6dc	00 	. 
	nop			;f6dd	00 	. 
	nop			;f6de	00 	. 
	nop			;f6df	00 	. 
	nop			;f6e0	00 	. 
	nop			;f6e1	00 	. 
	nop			;f6e2	00 	. 
	nop			;f6e3	00 	. 
	nop			;f6e4	00 	. 
	nop			;f6e5	00 	. 
	nop			;f6e6	00 	. 
	nop			;f6e7	00 	. 
	nop			;f6e8	00 	. 
	nop			;f6e9	00 	. 
	nop			;f6ea	00 	. 
	nop			;f6eb	00 	. 
	nop			;f6ec	00 	. 
	nop			;f6ed	00 	. 
	nop			;f6ee	00 	. 
	nop			;f6ef	00 	. 
	nop			;f6f0	00 	. 
	nop			;f6f1	00 	. 
	nop			;f6f2	00 	. 
	nop			;f6f3	00 	. 
	nop			;f6f4	00 	. 
	nop			;f6f5	00 	. 
	nop			;f6f6	00 	. 
	nop			;f6f7	00 	. 
	nop			;f6f8	00 	. 
	nop			;f6f9	00 	. 
	nop			;f6fa	00 	. 
	nop			;f6fb	00 	. 
	nop			;f6fc	00 	. 
	nop			;f6fd	00 	. 
	nop			;f6fe	00 	. 
	nop			;f6ff	00 	. 
	nop			;f700	00 	. 
	nop			;f701	00 	. 
	nop			;f702	00 	. 
	nop			;f703	00 	. 
	nop			;f704	00 	. 
	nop			;f705	00 	. 
	nop			;f706	00 	. 
	nop			;f707	00 	. 
	nop			;f708	00 	. 
	nop			;f709	00 	. 
	nop			;f70a	00 	. 
	nop			;f70b	00 	. 
	nop			;f70c	00 	. 
	nop			;f70d	00 	. 
	nop			;f70e	00 	. 
	nop			;f70f	00 	. 
	nop			;f710	00 	. 
	nop			;f711	00 	. 
	nop			;f712	00 	. 
	nop			;f713	00 	. 
	nop			;f714	00 	. 
	nop			;f715	00 	. 
	nop			;f716	00 	. 
	nop			;f717	00 	. 
	nop			;f718	00 	. 
	nop			;f719	00 	. 
	nop			;f71a	00 	. 
	nop			;f71b	00 	. 
	nop			;f71c	00 	. 
	nop			;f71d	00 	. 
	nop			;f71e	00 	. 
	nop			;f71f	00 	. 
	nop			;f720	00 	. 
	nop			;f721	00 	. 
	nop			;f722	00 	. 
	nop			;f723	00 	. 
	nop			;f724	00 	. 
	nop			;f725	00 	. 
	nop			;f726	00 	. 
	nop			;f727	00 	. 
	nop			;f728	00 	. 
	nop			;f729	00 	. 
	nop			;f72a	00 	. 
	nop			;f72b	00 	. 
	nop			;f72c	00 	. 
	nop			;f72d	00 	. 
	nop			;f72e	00 	. 
	nop			;f72f	00 	. 
	nop			;f730	00 	. 
	nop			;f731	00 	. 
	nop			;f732	00 	. 
	nop			;f733	00 	. 
	nop			;f734	00 	. 
	nop			;f735	00 	. 
	nop			;f736	00 	. 
	nop			;f737	00 	. 
	nop			;f738	00 	. 
	nop			;f739	00 	. 
	nop			;f73a	00 	. 
	nop			;f73b	00 	. 
	nop			;f73c	00 	. 
	nop			;f73d	00 	. 
	nop			;f73e	00 	. 
	nop			;f73f	00 	. 
	nop			;f740	00 	. 
	nop			;f741	00 	. 
	nop			;f742	00 	. 
	nop			;f743	00 	. 
	nop			;f744	00 	. 
	nop			;f745	00 	. 
	nop			;f746	00 	. 
	nop			;f747	00 	. 
	nop			;f748	00 	. 
	nop			;f749	00 	. 
	nop			;f74a	00 	. 
	nop			;f74b	00 	. 
	nop			;f74c	00 	. 
	nop			;f74d	00 	. 
	nop			;f74e	00 	. 
	nop			;f74f	00 	. 
	nop			;f750	00 	. 
	nop			;f751	00 	. 
	nop			;f752	00 	. 
	nop			;f753	00 	. 
	nop			;f754	00 	. 
	nop			;f755	00 	. 
	nop			;f756	00 	. 
	nop			;f757	00 	. 
	nop			;f758	00 	. 
	nop			;f759	00 	. 
	nop			;f75a	00 	. 
	nop			;f75b	00 	. 
	nop			;f75c	00 	. 
	nop			;f75d	00 	. 
	nop			;f75e	00 	. 
	nop			;f75f	00 	. 
	nop			;f760	00 	. 
	nop			;f761	00 	. 
	nop			;f762	00 	. 
	nop			;f763	00 	. 
	nop			;f764	00 	. 
	nop			;f765	00 	. 
	nop			;f766	00 	. 
	nop			;f767	00 	. 
	nop			;f768	00 	. 
	nop			;f769	00 	. 
	nop			;f76a	00 	. 
	nop			;f76b	00 	. 
	nop			;f76c	00 	. 
	nop			;f76d	00 	. 
	nop			;f76e	00 	. 
	nop			;f76f	00 	. 
	nop			;f770	00 	. 
	nop			;f771	00 	. 
	nop			;f772	00 	. 
	nop			;f773	00 	. 
	nop			;f774	00 	. 
	nop			;f775	00 	. 
	nop			;f776	00 	. 
	nop			;f777	00 	. 
	nop			;f778	00 	. 
	nop			;f779	00 	. 
	nop			;f77a	00 	. 
	nop			;f77b	00 	. 
	nop			;f77c	00 	. 
	nop			;f77d	00 	. 
	nop			;f77e	00 	. 
	nop			;f77f	00 	. 
	nop			;f780	00 	. 
	nop			;f781	00 	. 
	nop			;f782	00 	. 
	nop			;f783	00 	. 
	nop			;f784	00 	. 
	nop			;f785	00 	. 
	nop			;f786	00 	. 
	nop			;f787	00 	. 
	nop			;f788	00 	. 
	nop			;f789	00 	. 
	nop			;f78a	00 	. 
	nop			;f78b	00 	. 
	nop			;f78c	00 	. 
	nop			;f78d	00 	. 
	nop			;f78e	00 	. 
	nop			;f78f	00 	. 
	nop			;f790	00 	. 
	nop			;f791	00 	. 
	nop			;f792	00 	. 
	nop			;f793	00 	. 
	nop			;f794	00 	. 
	nop			;f795	00 	. 
	nop			;f796	00 	. 
	nop			;f797	00 	. 
	nop			;f798	00 	. 
	nop			;f799	00 	. 
	nop			;f79a	00 	. 
	nop			;f79b	00 	. 
	nop			;f79c	00 	. 
	nop			;f79d	00 	. 
	nop			;f79e	00 	. 
	nop			;f79f	00 	. 
	nop			;f7a0	00 	. 
	nop			;f7a1	00 	. 
	nop			;f7a2	00 	. 
	nop			;f7a3	00 	. 
	nop			;f7a4	00 	. 
	nop			;f7a5	00 	. 
	nop			;f7a6	00 	. 
	nop			;f7a7	00 	. 
	nop			;f7a8	00 	. 
	nop			;f7a9	00 	. 
	nop			;f7aa	00 	. 
	nop			;f7ab	00 	. 
	nop			;f7ac	00 	. 
	nop			;f7ad	00 	. 
	nop			;f7ae	00 	. 
	nop			;f7af	00 	. 
	nop			;f7b0	00 	. 
	nop			;f7b1	00 	. 
	nop			;f7b2	00 	. 
	nop			;f7b3	00 	. 
	nop			;f7b4	00 	. 
	nop			;f7b5	00 	. 
	nop			;f7b6	00 	. 
	nop			;f7b7	00 	. 
	nop			;f7b8	00 	. 
	nop			;f7b9	00 	. 
	nop			;f7ba	00 	. 
	nop			;f7bb	00 	. 
	nop			;f7bc	00 	. 
	nop			;f7bd	00 	. 
	nop			;f7be	00 	. 
	nop			;f7bf	00 	. 
	nop			;f7c0	00 	. 
	nop			;f7c1	00 	. 
	nop			;f7c2	00 	. 
	nop			;f7c3	00 	. 
	nop			;f7c4	00 	. 
	nop			;f7c5	00 	. 
	nop			;f7c6	00 	. 
	nop			;f7c7	00 	. 
	nop			;f7c8	00 	. 
	nop			;f7c9	00 	. 
	nop			;f7ca	00 	. 
	nop			;f7cb	00 	. 
	nop			;f7cc	00 	. 
	nop			;f7cd	00 	. 
	nop			;f7ce	00 	. 
	nop			;f7cf	00 	. 
	nop			;f7d0	00 	. 
	nop			;f7d1	00 	. 
	nop			;f7d2	00 	. 
	nop			;f7d3	00 	. 
	nop			;f7d4	00 	. 
	nop			;f7d5	00 	. 
	nop			;f7d6	00 	. 
	nop			;f7d7	00 	. 
	nop			;f7d8	00 	. 
	nop			;f7d9	00 	. 
	nop			;f7da	00 	. 
	nop			;f7db	00 	. 
	nop			;f7dc	00 	. 
	nop			;f7dd	00 	. 
	nop			;f7de	00 	. 
	nop			;f7df	00 	. 
	nop			;f7e0	00 	. 
	nop			;f7e1	00 	. 
	nop			;f7e2	00 	. 
	nop			;f7e3	00 	. 
	nop			;f7e4	00 	. 
	nop			;f7e5	00 	. 
	nop			;f7e6	00 	. 
	nop			;f7e7	00 	. 
	nop			;f7e8	00 	. 
	nop			;f7e9	00 	. 
	nop			;f7ea	00 	. 
	nop			;f7eb	00 	. 
	nop			;f7ec	00 	. 
	nop			;f7ed	00 	. 
	nop			;f7ee	00 	. 
	nop			;f7ef	00 	. 
	nop			;f7f0	00 	. 
	nop			;f7f1	00 	. 
	nop			;f7f2	00 	. 
	nop			;f7f3	00 	. 
	nop			;f7f4	00 	. 
	nop			;f7f5	00 	. 
	nop			;f7f6	00 	. 
	nop			;f7f7	00 	. 
	nop			;f7f8	00 	. 
	nop			;f7f9	00 	. 
	nop			;f7fa	00 	. 
	nop			;f7fb	00 	. 
	nop			;f7fc	00 	. 
	nop			;f7fd	00 	. 
	nop			;f7fe	00 	. 
	nop			;f7ff	00 	. 
lf800h:
	jr nc,51		;f800	30 31 	0 1 
	ld (03433h),a		;f802	32 33 34 	2 3 4 
	dec (hl)			;f805	35 	5 
	ld (hl),037h		;f806	36 37 	6 7 
	jr c,59		;f808	38 39 	8 9 
	ld l,0ffh		;f80a	2e ff 	. . 
	dec hl			;f80c	2b 	+ 
	dec l			;f80d	2d 	- 
	dec a			;f80e	3d 	= 
	rst 38h			;f80f	ff 	. 
	rst 38h			;f810	ff 	. 
	ld h,c			;f811	61 	a 
	ld h,d			;f812	62 	b 
	ld h,e			;f813	63 	c 
	ld h,h			;f814	64 	d 
	ld h,l			;f815	65 	e 
	ld h,(hl)			;f816	66 	f 
	ld h,a			;f817	67 	g 
	ld l,b			;f818	68 	h 
	ld l,c			;f819	69 	i 
	ld l,d			;f81a	6a 	j 
	ld l,e			;f81b	6b 	k 
	ld l,h			;f81c	6c 	l 
	ld l,l			;f81d	6d 	m 
	ld l,(hl)			;f81e	6e 	n 
	ld l,a			;f81f	6f 	o 
	ld (hl),b			;f820	70 	p 
	ld (hl),c			;f821	71 	q 
	ld (hl),d			;f822	72 	r 
	ld (hl),e			;f823	73 	s 
	ld (hl),h			;f824	74 	t 
	ld (hl),l			;f825	75 	u 
	halt			;f826	76 	v 
	ld (hl),a			;f827	77 	w 
	ld a,b			;f828	78 	x 
	ld a,d			;f829	7a 	z 
	ld a,c			;f82a	79 	y 
	rst 38h			;f82b	ff 	. 
	rst 38h			;f82c	ff 	. 
	rst 38h			;f82d	ff 	. 
	rst 38h			;f82e	ff 	. 
	rst 38h			;f82f	ff 	. 
	jr nc,lf863h		;f830	30 31 	0 1 
	ld (03433h),a		;f832	32 33 34 	2 3 4 
	dec (hl)			;f835	35 	5 
	ld (hl),037h		;f836	36 37 	6 7 
	jr c,lf873h		;f838	38 39 	8 9 
	ld a,(hl)			;f83a	7e 	~ 
	daa			;f83b	27 	' 
	ld a,l			;f83c	7d 	} 
	dec hl			;f83d	2b 	+ 
	inc hl			;f83e	23 	# 
	ld a,e			;f83f	7b 	{ 
	rst 38h			;f840	ff 	. 
	rst 38h			;f841	ff 	. 
	jr nz,lf880h		;f842	20 3c 	  < 
	inc l			;f844	2c 	, 
	ld l,02dh		;f845	2e 2d 	. - 
	ld a,h			;f847	7c 	| 
	rra			;f848	1f 	. 
	inc e			;f849	1c 	. 
	dec e			;f84a	1d 	. 
	ld e,09bh		;f84b	1e 9b 	. . 
	rst 38h			;f84d	ff 	. 
	ld a,a			;f84e	7f 	 
	dec de			;f84f	1b 	. 
	rst 38h			;f850	ff 	. 
	ld a,a			;f851	7f 	 
	rst 38h			;f852	ff 	. 
	add hl,bc			;f853	09 	. 
	dec c			;f854	0d 	. 
	rst 18h			;f855	df 	. 
	dec bc			;f856	0b 	. 
	inc bc			;f857	03 	. 
	rst 38h			;f858	ff 	. 
	rst 38h			;f859	ff 	. 
	add a,(hl)			;f85a	86 	. 
	add a,l			;f85b	85 	. 
	add a,h			;f85c	84 	. 
	add a,e			;f85d	83 	. 
	add a,d			;f85e	82 	. 
	add a,c			;f85f	81 	. 
	call po,0ebe2h		;f860	e4 e2 eb 	. . . 
lf863h:
	ex (sp),hl			;f863	e3 	. 
	ret pe			;f864	e8 	. 
	and 0e9h		;f865	e6 e9 	. . 
	ret po			;f867	e0 	. 
	jp pe,0e5e1h		;f868	ea e1 e5 	. . . 
	rst 38h			;f86b	ff 	. 
	ld hl,(0e72fh)		;f86c	2a 2f e7 	* / . 
	rst 38h			;f86f	ff 	. 
	rst 38h			;f870	ff 	. 
	ld b,c			;f871	41 	A 
	ld b,d			;f872	42 	B 
lf873h:
	ld b,e			;f873	43 	C 
	ld b,h			;f874	44 	D 
	ld b,l			;f875	45 	E 
	ld b,(hl)			;f876	46 	F 
	ld b,a			;f877	47 	G 
	ld c,b			;f878	48 	H 
	ld c,c			;f879	49 	I 
	ld c,d			;f87a	4a 	J 
	ld c,e			;f87b	4b 	K 
	ld c,h			;f87c	4c 	L 
	ld c,l			;f87d	4d 	M 
	ld c,(hl)			;f87e	4e 	N 
	ld c,a			;f87f	4f 	O 
lf880h:
	ld d,b			;f880	50 	P 
	ld d,c			;f881	51 	Q 
	ld d,d			;f882	52 	R 
	ld d,e			;f883	53 	S 
	ld d,h			;f884	54 	T 
	ld d,l			;f885	55 	U 
	ld d,(hl)			;f886	56 	V 
	ld d,a			;f887	57 	W 
	ld e,b			;f888	58 	X 
	ld e,d			;f889	5a 	Z 
	ld e,c			;f88a	59 	Y 
	rst 38h			;f88b	ff 	. 
	rst 38h			;f88c	ff 	. 
	rst 38h			;f88d	ff 	. 
	rst 38h			;f88e	ff 	. 
	rst 38h			;f88f	ff 	. 
	dec a			;f890	3d 	= 
	ld hl,04022h		;f891	21 22 40 	! " @ 
	inc h			;f894	24 	$ 
	dec h			;f895	25 	% 
	ld h,02fh		;f896	26 2f 	& / 
	jr z,43		;f898	28 29 	( ) 
	ccf			;f89a	3f 	? 
	ld h,b			;f89b	60 	` 
	ld e,l			;f89c	5d 	] 
	ld hl,(05b5eh)		;f89d	2a 5e 5b 	* ^ [ 
	rst 38h			;f8a0	ff 	. 
	rst 38h			;f8a1	ff 	. 
	jr nz,lf8e2h		;f8a2	20 3e 	  > 
	dec sp			;f8a4	3b 	; 
	ld a,(05c5fh)		;f8a5	3a 5f 5c 	: _ \ 
	call pe,0eeefh		;f8a8	ec ef ee 	. . . 
	defb 0edh;next byte illegal after ed		;f8ab	ed 	. 
	sbc a,e			;f8ac	9b 	. 
	rst 38h			;f8ad	ff 	. 
	ld a,a			;f8ae	7f 	 
	dec de			;f8af	1b 	. 
	rst 38h			;f8b0	ff 	. 
	ld (de),a			;f8b1	12 	. 
	rst 38h			;f8b2	ff 	. 
	add hl,bc			;f8b3	09 	. 
	dec c			;f8b4	0d 	. 
	rst 18h			;f8b5	df 	. 
	inc c			;f8b6	0c 	. 
	inc bc			;f8b7	03 	. 
	rst 38h			;f8b8	ff 	. 
	rst 38h			;f8b9	ff 	. 
	adc a,h			;f8ba	8c 	. 
	adc a,e			;f8bb	8b 	. 
	adc a,d			;f8bc	8a 	. 
	adc a,c			;f8bd	89 	. 
	adc a,b			;f8be	88 	. 
	add a,a			;f8bf	87 	. 
	jr nc,51		;f8c0	30 31 	0 1 
	ld (03433h),a		;f8c2	32 33 34 	2 3 4 
	dec (hl)			;f8c5	35 	5 
	ld (hl),037h		;f8c6	36 37 	6 7 
	jr c,59		;f8c8	38 39 	8 9 
	ld l,0ffh		;f8ca	2e ff 	. . 
	dec hl			;f8cc	2b 	+ 
	dec l			;f8cd	2d 	- 
	dec a			;f8ce	3d 	= 
	rst 38h			;f8cf	ff 	. 
	rst 38h			;f8d0	ff 	. 
	ld h,c			;f8d1	61 	a 
	ld h,d			;f8d2	62 	b 
	ld h,e			;f8d3	63 	c 
	ld h,h			;f8d4	64 	d 
	ld h,l			;f8d5	65 	e 
	ld h,(hl)			;f8d6	66 	f 
	ld h,a			;f8d7	67 	g 
	ld l,b			;f8d8	68 	h 
	ld l,c			;f8d9	69 	i 
	ld l,d			;f8da	6a 	j 
	ld l,e			;f8db	6b 	k 
	ld l,h			;f8dc	6c 	l 
	ld l,l			;f8dd	6d 	m 
	ld l,(hl)			;f8de	6e 	n 
	ld l,a			;f8df	6f 	o 
	ld (hl),b			;f8e0	70 	p 
	ld (hl),c			;f8e1	71 	q 
lf8e2h:
	ld (hl),d			;f8e2	72 	r 
	ld (hl),e			;f8e3	73 	s 
	ld (hl),h			;f8e4	74 	t 
	ld (hl),l			;f8e5	75 	u 
	halt			;f8e6	76 	v 
	ld (hl),a			;f8e7	77 	w 
	ld e,b			;f8e8	58 	X 
	ld e,c			;f8e9	59 	Y 
	ld e,d			;f8ea	5a 	Z 
	rst 38h			;f8eb	ff 	. 
	rst 38h			;f8ec	ff 	. 
	rst 38h			;f8ed	ff 	. 
	rst 38h			;f8ee	ff 	. 
	rst 38h			;f8ef	ff 	. 
	jr nc,lf923h		;f8f0	30 31 	0 1 
	ld (03433h),a		;f8f2	32 33 34 	2 3 4 
	dec (hl)			;f8f5	35 	5 
	ld (hl),037h		;f8f6	36 37 	6 7 
	jr c,lf933h		;f8f8	38 39 	8 9 
	dec l			;f8fa	2d 	- 
	ld e,(hl)			;f8fb	5e 	^ 
	ld b,b			;f8fc	40 	@ 
	ld e,e			;f8fd	5b 	[ 
	ld e,l			;f8fe	5d 	] 
	ld a,(lffffh)		;f8ff	3a ff ff 	: . . 
	jr nz,94		;f902	20 5c 	  \ 
	inc l			;f904	2c 	, 
	ld l,02fh		;f905	2e 2f 	. / 
	dec sp			;f907	3b 	; 
	rra			;f908	1f 	. 
	inc e			;f909	1c 	. 
	dec e			;f90a	1d 	. 
	ld e,09bh		;f90b	1e 9b 	. . 
	rst 38h			;f90d	ff 	. 
	ld a,a			;f90e	7f 	 
	dec de			;f90f	1b 	. 
	rst 38h			;f910	ff 	. 
	ld a,a			;f911	7f 	 
	rst 38h			;f912	ff 	. 
	add hl,bc			;f913	09 	. 
	dec c			;f914	0d 	. 
	rst 18h			;f915	df 	. 
	dec bc			;f916	0b 	. 
	inc bc			;f917	03 	. 
	rst 38h			;f918	ff 	. 
	rst 38h			;f919	ff 	. 
	add a,(hl)			;f91a	86 	. 
	add a,l			;f91b	85 	. 
	add a,h			;f91c	84 	. 
	add a,e			;f91d	83 	. 
	add a,d			;f91e	82 	. 
	add a,c			;f91f	81 	. 
	call po,0ebe2h		;f920	e4 e2 eb 	. . . 
lf923h:
	ex (sp),hl			;f923	e3 	. 
	ret pe			;f924	e8 	. 
	and 0e9h		;f925	e6 e9 	. . 
	ret po			;f927	e0 	. 
	jp pe,0e5e1h		;f928	ea e1 e5 	. . . 
	rst 38h			;f92b	ff 	. 
	ld hl,(0e72fh)		;f92c	2a 2f e7 	* / . 
	rst 38h			;f92f	ff 	. 
	rst 38h			;f930	ff 	. 
	ld b,c			;f931	41 	A 
	ld b,d			;f932	42 	B 
lf933h:
	ld b,e			;f933	43 	C 
	ld b,h			;f934	44 	D 
	ld b,l			;f935	45 	E 
	ld b,(hl)			;f936	46 	F 
	ld b,a			;f937	47 	G 
	ld c,b			;f938	48 	H 
	ld c,c			;f939	49 	I 
	ld c,d			;f93a	4a 	J 
	ld c,e			;f93b	4b 	K 
	ld c,h			;f93c	4c 	L 
	ld c,l			;f93d	4d 	M 
	ld c,(hl)			;f93e	4e 	N 
	ld c,a			;f93f	4f 	O 
	ld d,b			;f940	50 	P 
	ld d,c			;f941	51 	Q 
	ld d,d			;f942	52 	R 
	ld d,e			;f943	53 	S 
	ld d,h			;f944	54 	T 
	ld d,l			;f945	55 	U 
	ld d,(hl)			;f946	56 	V 
	ld d,a			;f947	57 	W 
	ld e,b			;f948	58 	X 
	ld e,c			;f949	59 	Y 
	ld e,d			;f94a	5a 	Z 
	rst 38h			;f94b	ff 	. 
	rst 38h			;f94c	ff 	. 
	rst 38h			;f94d	ff 	. 
	rst 38h			;f94e	ff 	. 
	rst 38h			;f94f	ff 	. 
	ld e,a			;f950	5f 	_ 
	ld hl,02322h		;f951	21 22 23 	! " # 
	inc h			;f954	24 	$ 
	dec h			;f955	25 	% 
	ld h,027h		;f956	26 27 	& ' 
	jr z,43		;f958	28 29 	( ) 
	dec a			;f95a	3d 	= 
	ld a,(hl)			;f95b	7e 	~ 
	ld h,b			;f95c	60 	` 
	ld a,e			;f95d	7b 	{ 
	ld a,l			;f95e	7d 	} 
	ld hl,(lffffh)		;f95f	2a ff ff 	* . . 
	jr nz,lf9e0h		;f962	20 7c 	  | 
	inc a			;f964	3c 	< 
	ld a,03fh		;f965	3e 3f 	> ? 
	dec hl			;f967	2b 	+ 
	call pe,0eeefh		;f968	ec ef ee 	. . . 
	defb 0edh;next byte illegal after ed		;f96b	ed 	. 
	sbc a,e			;f96c	9b 	. 
	rst 38h			;f96d	ff 	. 
	ld a,a			;f96e	7f 	 
	dec de			;f96f	1b 	. 
	rst 38h			;f970	ff 	. 
	ld (de),a			;f971	12 	. 
	rst 38h			;f972	ff 	. 
	add hl,bc			;f973	09 	. 
	dec c			;f974	0d 	. 
	rst 18h			;f975	df 	. 
	inc c			;f976	0c 	. 
	inc bc			;f977	03 	. 
	rst 38h			;f978	ff 	. 
	rst 38h			;f979	ff 	. 
	adc a,h			;f97a	8c 	. 
	adc a,e			;f97b	8b 	. 
	adc a,d			;f97c	8a 	. 
	adc a,c			;f97d	89 	. 
	adc a,b			;f97e	88 	. 
	add a,a			;f97f	87 	. 
	jr nc,51		;f980	30 31 	0 1 
	ld (03433h),a		;f982	32 33 34 	2 3 4 
	dec (hl)			;f985	35 	5 
	ld (hl),037h		;f986	36 37 	6 7 
	jr c,59		;f988	38 39 	8 9 
	ld l,0ffh		;f98a	2e ff 	. . 
	dec hl			;f98c	2b 	+ 
	dec l			;f98d	2d 	- 
	dec a			;f98e	3d 	= 
	rst 38h			;f98f	ff 	. 
	rst 38h			;f990	ff 	. 
	ld (hl),c			;f991	71 	q 
	ld h,d			;f992	62 	b 
	ld h,e			;f993	63 	c 
	ld h,h			;f994	64 	d 
	ld h,l			;f995	65 	e 
	ld h,(hl)			;f996	66 	f 
	ld h,a			;f997	67 	g 
	ld l,b			;f998	68 	h 
	ld l,c			;f999	69 	i 
	ld l,d			;f99a	6a 	j 
	ld l,e			;f99b	6b 	k 
	ld l,h			;f99c	6c 	l 
	inc l			;f99d	2c 	, 
	ld l,(hl)			;f99e	6e 	n 
	ld l,a			;f99f	6f 	o 
	ld (hl),b			;f9a0	70 	p 
	ld h,c			;f9a1	61 	a 
	ld (hl),d			;f9a2	72 	r 
	ld (hl),e			;f9a3	73 	s 
	ld (hl),h			;f9a4	74 	t 
	ld (hl),l			;f9a5	75 	u 
	halt			;f9a6	76 	v 
	ld a,d			;f9a7	7a 	z 
	ld a,b			;f9a8	78 	x 
	ld a,c			;f9a9	79 	y 
	ld (hl),a			;f9aa	77 	w 
	rst 38h			;f9ab	ff 	. 
	rst 38h			;f9ac	ff 	. 
	rst 38h			;f9ad	ff 	. 
	rst 38h			;f9ae	ff 	. 
	rst 38h			;f9af	ff 	. 
	jr nc,lf9e3h		;f9b0	30 31 	0 1 
	ld (03433h),a		;f9b2	32 33 34 	2 3 4 
	dec (hl)			;f9b5	35 	5 
	ld (hl),037h		;f9b6	36 37 	6 7 
	jr c,lf9f3h		;f9b8	38 39 	8 9 
	inc h			;f9ba	24 	$ 
	ld hl,0265eh		;f9bb	21 5e 26 	! ^ & 
	inc hl			;f9be	23 	# 
	ld a,h			;f9bf	7c 	| 
	rst 38h			;f9c0	ff 	. 
	rst 38h			;f9c1	ff 	. 
	jr nz,lfa00h		;f9c2	20 3c 	  < 
	ld l,02fh		;f9c4	2e 2f 	. / 
	dec a			;f9c6	3d 	= 
	ld l,l			;f9c7	6d 	m 
	rra			;f9c8	1f 	. 
	inc e			;f9c9	1c 	. 
	dec e			;f9ca	1d 	. 
	ld e,09bh		;f9cb	1e 9b 	. . 
	rst 38h			;f9cd	ff 	. 
	ld a,a			;f9ce	7f 	 
	dec de			;f9cf	1b 	. 
	rst 38h			;f9d0	ff 	. 
	ld a,a			;f9d1	7f 	 
	rst 38h			;f9d2	ff 	. 
	add hl,bc			;f9d3	09 	. 
	dec c			;f9d4	0d 	. 
	rst 18h			;f9d5	df 	. 
	dec bc			;f9d6	0b 	. 
	inc bc			;f9d7	03 	. 
	rst 38h			;f9d8	ff 	. 
	rst 38h			;f9d9	ff 	. 
	add a,(hl)			;f9da	86 	. 
	add a,l			;f9db	85 	. 
	add a,h			;f9dc	84 	. 
	add a,e			;f9dd	83 	. 
	add a,d			;f9de	82 	. 
	add a,c			;f9df	81 	. 
lf9e0h:
	call po,0ebe2h		;f9e0	e4 e2 eb 	. . . 
lf9e3h:
	ex (sp),hl			;f9e3	e3 	. 
	ret pe			;f9e4	e8 	. 
	and 0e9h		;f9e5	e6 e9 	. . 
	ret po			;f9e7	e0 	. 
	jp pe,0e5e1h		;f9e8	ea e1 e5 	. . . 
	rst 38h			;f9eb	ff 	. 
	ld hl,(0e72fh)		;f9ec	2a 2f e7 	* / . 
	rst 38h			;f9ef	ff 	. 
	rst 38h			;f9f0	ff 	. 
	ld d,c			;f9f1	51 	Q 
	ld b,d			;f9f2	42 	B 
lf9f3h:
	ld b,e			;f9f3	43 	C 
	ld b,h			;f9f4	44 	D 
	ld b,l			;f9f5	45 	E 
	ld b,(hl)			;f9f6	46 	F 
	ld b,a			;f9f7	47 	G 
	ld c,b			;f9f8	48 	H 
	ld c,c			;f9f9	49 	I 
	ld c,d			;f9fa	4a 	J 
	ld c,e			;f9fb	4b 	K 
	ld c,h			;f9fc	4c 	L 
	dec sp			;f9fd	3b 	; 
	ld c,(hl)			;f9fe	4e 	N 
	ld c,a			;f9ff	4f 	O 
lfa00h:
	ld d,b			;fa00	50 	P 
	ld b,c			;fa01	41 	A 
	ld d,d			;fa02	52 	R 
	ld d,e			;fa03	53 	S 
	ld d,h			;fa04	54 	T 
	ld d,l			;fa05	55 	U 
	ld d,(hl)			;fa06	56 	V 
	ld e,d			;fa07	5a 	Z 
	ld e,b			;fa08	58 	X 
	ld e,c			;fa09	59 	Y 
	ld d,a			;fa0a	57 	W 
	rst 38h			;fa0b	ff 	. 
	rst 38h			;fa0c	ff 	. 
	rst 38h			;fa0d	ff 	. 
	rst 38h			;fa0e	ff 	. 
	rst 38h			;fa0f	ff 	. 
	ld b,b			;fa10	40 	@ 
	ld hl,(0227bh)		;fa11	2a 7b 22 	* { " 
	daa			;fa14	27 	' 
	jr z,47		;fa15	28 2d 	( - 
	ld a,l			;fa17	7d 	} 
	ld e,a			;fa18	5f 	_ 
	ld e,h			;fa19	5c 	\ 
	add hl,hl			;fa1a	29 	) 
	ld e,l			;fa1b	5d 	] 
	ld a,(hl)			;fa1c	7e 	~ 
	ld h,b			;fa1d	60 	` 
	dec hl			;fa1e	2b 	+ 
	dec h			;fa1f	25 	% 
	rst 38h			;fa20	ff 	. 
	rst 38h			;fa21	ff 	. 
	jr nz,lfa62h		;fa22	20 3e 	  > 
	ld a,(05b3fh)		;fa24	3a 3f 5b 	: ? [ 
	ld c,l			;fa27	4d 	M 
	call pe,0eeefh		;fa28	ec ef ee 	. . . 
	defb 0edh;next byte illegal after ed		;fa2b	ed 	. 
	sbc a,e			;fa2c	9b 	. 
	rst 38h			;fa2d	ff 	. 
	ld a,a			;fa2e	7f 	 
	dec de			;fa2f	1b 	. 
	rst 38h			;fa30	ff 	. 
	ld (de),a			;fa31	12 	. 
	rst 38h			;fa32	ff 	. 
	add hl,bc			;fa33	09 	. 
	dec c			;fa34	0d 	. 
	rst 18h			;fa35	df 	. 
	inc c			;fa36	0c 	. 
	inc bc			;fa37	03 	. 
	rst 38h			;fa38	ff 	. 
	rst 38h			;fa39	ff 	. 
	adc a,h			;fa3a	8c 	. 
	adc a,e			;fa3b	8b 	. 
	adc a,d			;fa3c	8a 	. 
	adc a,c			;fa3d	89 	. 
	adc a,b			;fa3e	88 	. 
	add a,a			;fa3f	87 	. 
	jr nc,51		;fa40	30 31 	0 1 
	ld (03433h),a		;fa42	32 33 34 	2 3 4 
	dec (hl)			;fa45	35 	5 
	ld (hl),037h		;fa46	36 37 	6 7 
	jr c,59		;fa48	38 39 	8 9 
	ld l,0ffh		;fa4a	2e ff 	. . 
	dec hl			;fa4c	2b 	+ 
	dec l			;fa4d	2d 	- 
	dec a			;fa4e	3d 	= 
	rst 38h			;fa4f	ff 	. 
	rst 38h			;fa50	ff 	. 
	ld h,c			;fa51	61 	a 
	ld h,d			;fa52	62 	b 
	ld h,e			;fa53	63 	c 
	ld h,h			;fa54	64 	d 
	ld h,l			;fa55	65 	e 
	ld h,(hl)			;fa56	66 	f 
	ld h,a			;fa57	67 	g 
	ld l,b			;fa58	68 	h 
	ld l,c			;fa59	69 	i 
	ld l,d			;fa5a	6a 	j 
	ld l,e			;fa5b	6b 	k 
	ld l,h			;fa5c	6c 	l 
	ld l,l			;fa5d	6d 	m 
	ld l,(hl)			;fa5e	6e 	n 
	ld l,a			;fa5f	6f 	o 
	ld (hl),b			;fa60	70 	p 
	ld (hl),c			;fa61	71 	q 
lfa62h:
	ld (hl),d			;fa62	72 	r 
	ld (hl),e			;fa63	73 	s 
	ld (hl),h			;fa64	74 	t 
	ld (hl),l			;fa65	75 	u 
	halt			;fa66	76 	v 
	ld (hl),a			;fa67	77 	w 
	ld a,b			;fa68	78 	x 
	ld a,c			;fa69	79 	y 
	ld a,d			;fa6a	7a 	z 
	rst 38h			;fa6b	ff 	. 
	rst 38h			;fa6c	ff 	. 
	rst 38h			;fa6d	ff 	. 
	rst 38h			;fa6e	ff 	. 
	rst 38h			;fa6f	ff 	. 
	jr nc,lfaa3h		;fa70	30 31 	0 1 
	ld (03433h),a		;fa72	32 33 34 	2 3 4 
	dec (hl)			;fa75	35 	5 
	ld (hl),037h		;fa76	36 37 	6 7 
	jr c,lfab3h		;fa78	38 39 	8 9 
	dec l			;fa7a	2d 	- 
	ld e,(hl)			;fa7b	5e 	^ 
	ld b,b			;fa7c	40 	@ 
	ld e,e			;fa7d	5b 	[ 
	ld e,l			;fa7e	5d 	] 
	ld a,(lffffh)		;fa7f	3a ff ff 	: . . 
	jr nz,lfac0h		;fa82	20 3c 	  < 
	inc l			;fa84	2c 	, 
	ld l,02fh		;fa85	2e 2f 	. / 
	dec sp			;fa87	3b 	; 
	rra			;fa88	1f 	. 
	inc e			;fa89	1c 	. 
	dec e			;fa8a	1d 	. 
	ld e,09bh		;fa8b	1e 9b 	. . 
	rst 38h			;fa8d	ff 	. 
	ld a,a			;fa8e	7f 	 
	dec de			;fa8f	1b 	. 
	rst 38h			;fa90	ff 	. 
	ld a,a			;fa91	7f 	 
	rst 38h			;fa92	ff 	. 
	add hl,bc			;fa93	09 	. 
	dec c			;fa94	0d 	. 
	rst 18h			;fa95	df 	. 
	dec bc			;fa96	0b 	. 
	inc bc			;fa97	03 	. 
	rst 38h			;fa98	ff 	. 
	rst 38h			;fa99	ff 	. 
	add a,(hl)			;fa9a	86 	. 
	add a,l			;fa9b	85 	. 
	add a,h			;fa9c	84 	. 
	add a,e			;fa9d	83 	. 
	add a,d			;fa9e	82 	. 
	add a,c			;fa9f	81 	. 
	call po,0ebe2h		;faa0	e4 e2 eb 	. . . 
lfaa3h:
	ex (sp),hl			;faa3	e3 	. 
	ret pe			;faa4	e8 	. 
	and 0e9h		;faa5	e6 e9 	. . 
	ret po			;faa7	e0 	. 
	jp pe,0e5e1h		;faa8	ea e1 e5 	. . . 
	rst 38h			;faab	ff 	. 
	ld hl,(0e72fh)		;faac	2a 2f e7 	* / . 
	rst 38h			;faaf	ff 	. 
	rst 38h			;fab0	ff 	. 
	ld b,c			;fab1	41 	A 
	ld b,d			;fab2	42 	B 
lfab3h:
	ld b,e			;fab3	43 	C 
	ld b,h			;fab4	44 	D 
	ld b,l			;fab5	45 	E 
	ld b,(hl)			;fab6	46 	F 
	ld b,a			;fab7	47 	G 
	ld c,b			;fab8	48 	H 
	ld c,c			;fab9	49 	I 
	ld c,d			;faba	4a 	J 
	ld c,e			;fabb	4b 	K 
	ld c,h			;fabc	4c 	L 
	ld c,l			;fabd	4d 	M 
	ld c,(hl)			;fabe	4e 	N 
	ld c,a			;fabf	4f 	O 
lfac0h:
	ld d,b			;fac0	50 	P 
	ld d,c			;fac1	51 	Q 
	ld d,d			;fac2	52 	R 
	ld d,e			;fac3	53 	S 
	ld d,h			;fac4	54 	T 
	ld d,l			;fac5	55 	U 
	ld d,(hl)			;fac6	56 	V 
	ld d,a			;fac7	57 	W 
	ld e,b			;fac8	58 	X 
	ld e,c			;fac9	59 	Y 
	ld e,d			;faca	5a 	Z 
	rst 38h			;facb	ff 	. 
	rst 38h			;facc	ff 	. 
	rst 38h			;facd	ff 	. 
	rst 38h			;face	ff 	. 
	rst 38h			;facf	ff 	. 
	dec a			;fad0	3d 	= 
	ld hl,02322h		;fad1	21 22 23 	! " # 
	inc h			;fad4	24 	$ 
	dec h			;fad5	25 	% 
	ld h,027h		;fad6	26 27 	& ' 
	jr z,43		;fad8	28 29 	( ) 
	ld e,a			;fada	5f 	_ 
	ld a,(hl)			;fadb	7e 	~ 
	ld h,b			;fadc	60 	` 
	ld a,e			;fadd	7b 	{ 
	ld a,l			;fade	7d 	} 
	ld hl,(lffffh)		;fadf	2a ff ff 	* . . 
	jr nz,lfb22h		;fae2	20 3e 	  > 
	ld e,h			;fae4	5c 	\ 
	ld a,h			;fae5	7c 	| 
	ccf			;fae6	3f 	? 
	dec hl			;fae7	2b 	+ 
	call pe,0eeefh		;fae8	ec ef ee 	. . . 
	defb 0edh;next byte illegal after ed		;faeb	ed 	. 
	sbc a,e			;faec	9b 	. 
	rst 38h			;faed	ff 	. 
	ld a,a			;faee	7f 	 
	dec de			;faef	1b 	. 
	rst 38h			;faf0	ff 	. 
	ld (de),a			;faf1	12 	. 
	rst 38h			;faf2	ff 	. 
	add hl,bc			;faf3	09 	. 
	dec c			;faf4	0d 	. 
	rst 18h			;faf5	df 	. 
	inc c			;faf6	0c 	. 
	inc bc			;faf7	03 	. 
	rst 38h			;faf8	ff 	. 
	rst 38h			;faf9	ff 	. 
	adc a,h			;fafa	8c 	. 
	adc a,e			;fafb	8b 	. 
	adc a,d			;fafc	8a 	. 
	adc a,c			;fafd	89 	. 
	adc a,b			;fafe	88 	. 
	add a,a			;faff	87 	. 
	jr nc,51		;fb00	30 31 	0 1 
	ld (03433h),a		;fb02	32 33 34 	2 3 4 
	dec (hl)			;fb05	35 	5 
	ld (hl),037h		;fb06	36 37 	6 7 
	jr c,59		;fb08	38 39 	8 9 
	ld l,0ffh		;fb0a	2e ff 	. . 
	dec hl			;fb0c	2b 	+ 
	dec l			;fb0d	2d 	- 
	dec a			;fb0e	3d 	= 
	rst 38h			;fb0f	ff 	. 
	rst 38h			;fb10	ff 	. 
	ld h,c			;fb11	61 	a 
	ld h,d			;fb12	62 	b 
	ld h,e			;fb13	63 	c 
	ld h,h			;fb14	64 	d 
	ld h,l			;fb15	65 	e 
	ld h,(hl)			;fb16	66 	f 
	ld h,a			;fb17	67 	g 
	ld l,b			;fb18	68 	h 
	ld l,c			;fb19	69 	i 
	ld l,d			;fb1a	6a 	j 
	ld l,e			;fb1b	6b 	k 
	ld l,h			;fb1c	6c 	l 
	inc l			;fb1d	2c 	, 
	ld l,(hl)			;fb1e	6e 	n 
	ld l,a			;fb1f	6f 	o 
	ld (hl),b			;fb20	70 	p 
	ld (hl),c			;fb21	71 	q 
lfb22h:
	ld (hl),d			;fb22	72 	r 
	ld (hl),e			;fb23	73 	s 
	ld (hl),h			;fb24	74 	t 
	ld (hl),l			;fb25	75 	u 
	halt			;fb26	76 	v 
	ld a,d			;fb27	7a 	z 
	ld a,b			;fb28	78 	x 
	ld a,c			;fb29	79 	y 
	ld (hl),a			;fb2a	77 	w 
	rst 38h			;fb2b	ff 	. 
	rst 38h			;fb2c	ff 	. 
	rst 38h			;fb2d	ff 	. 
	rst 38h			;fb2e	ff 	. 
	rst 38h			;fb2f	ff 	. 
	jr nc,lfb63h		;fb30	30 31 	0 1 
	ld (03433h),a		;fb32	32 33 34 	2 3 4 
	dec (hl)			;fb35	35 	5 
	ld (hl),037h		;fb36	36 37 	6 7 
	jr c,lfb73h		;fb38	38 39 	8 9 
	inc h			;fb3a	24 	$ 
	ld e,(hl)			;fb3b	5e 	^ 
	ld a,(hl)			;fb3c	7e 	~ 
	ld h,023h		;fb3d	26 23 	& # 
	ld a,h			;fb3f	7c 	| 
	rst 38h			;fb40	ff 	. 
	rst 38h			;fb41	ff 	. 
	jr nz,lfb80h		;fb42	20 3c 	  < 
	ld l,02fh		;fb44	2e 2f 	. / 
	ld e,e			;fb46	5b 	[ 
	ld l,l			;fb47	6d 	m 
	rra			;fb48	1f 	. 
	inc e			;fb49	1c 	. 
	dec e			;fb4a	1d 	. 
	ld e,09bh		;fb4b	1e 9b 	. . 
	rst 38h			;fb4d	ff 	. 
	ld a,a			;fb4e	7f 	 
	dec de			;fb4f	1b 	. 
	rst 38h			;fb50	ff 	. 
	ld a,a			;fb51	7f 	 
	rst 38h			;fb52	ff 	. 
	add hl,bc			;fb53	09 	. 
	dec c			;fb54	0d 	. 
	rst 18h			;fb55	df 	. 
	dec bc			;fb56	0b 	. 
	inc bc			;fb57	03 	. 
	rst 38h			;fb58	ff 	. 
	rst 38h			;fb59	ff 	. 
	add a,(hl)			;fb5a	86 	. 
	add a,l			;fb5b	85 	. 
	add a,h			;fb5c	84 	. 
	add a,e			;fb5d	83 	. 
	add a,d			;fb5e	82 	. 
	add a,c			;fb5f	81 	. 
	call po,0ebe2h		;fb60	e4 e2 eb 	. . . 
lfb63h:
	ex (sp),hl			;fb63	e3 	. 
	ret pe			;fb64	e8 	. 
	and 0e9h		;fb65	e6 e9 	. . 
	ret po			;fb67	e0 	. 
	jp pe,0e5e1h		;fb68	ea e1 e5 	. . . 
	rst 38h			;fb6b	ff 	. 
	ld hl,(0e72fh)		;fb6c	2a 2f e7 	* / . 
	rst 38h			;fb6f	ff 	. 
	rst 38h			;fb70	ff 	. 
	ld b,c			;fb71	41 	A 
	ld b,d			;fb72	42 	B 
lfb73h:
	ld b,e			;fb73	43 	C 
	ld b,h			;fb74	44 	D 
	ld b,l			;fb75	45 	E 
	ld b,(hl)			;fb76	46 	F 
	ld b,a			;fb77	47 	G 
	ld c,b			;fb78	48 	H 
	ld c,c			;fb79	49 	I 
	ld c,d			;fb7a	4a 	J 
	ld c,e			;fb7b	4b 	K 
	ld c,h			;fb7c	4c 	L 
	dec sp			;fb7d	3b 	; 
	ld c,(hl)			;fb7e	4e 	N 
	ld c,a			;fb7f	4f 	O 
lfb80h:
	ld d,b			;fb80	50 	P 
	ld d,c			;fb81	51 	Q 
	ld d,d			;fb82	52 	R 
	ld d,e			;fb83	53 	S 
	ld d,h			;fb84	54 	T 
	ld d,l			;fb85	55 	U 
	ld d,(hl)			;fb86	56 	V 
	ld e,d			;fb87	5a 	Z 
	ld e,b			;fb88	58 	X 
	ld e,c			;fb89	59 	Y 
	ld d,a			;fb8a	57 	W 
	rst 38h			;fb8b	ff 	. 
	rst 38h			;fb8c	ff 	. 
	rst 38h			;fb8d	ff 	. 
	rst 38h			;fb8e	ff 	. 
	rst 38h			;fb8f	ff 	. 
	ld b,b			;fb90	40 	@ 
	ld hl,(0227bh)		;fb91	2a 7b 22 	* { " 
	daa			;fb94	27 	' 
	jr z,47		;fb95	28 2d 	( - 
	ld a,l			;fb97	7d 	} 
	ld e,a			;fb98	5f 	_ 
	ld e,h			;fb99	5c 	\ 
	add hl,hl			;fb9a	29 	) 
	ld e,l			;fb9b	5d 	] 
	dec a			;fb9c	3d 	= 
	ld h,b			;fb9d	60 	` 
	dec hl			;fb9e	2b 	+ 
	dec h			;fb9f	25 	% 
	rst 38h			;fba0	ff 	. 
	rst 38h			;fba1	ff 	. 
	jr nz,lfbe2h		;fba2	20 3e 	  > 
	ld a,(0213fh)		;fba4	3a 3f 21 	: ? ! 
	ld c,l			;fba7	4d 	M 
	call pe,0eeefh		;fba8	ec ef ee 	. . . 
	defb 0edh;next byte illegal after ed		;fbab	ed 	. 
	sbc a,e			;fbac	9b 	. 
	rst 38h			;fbad	ff 	. 
	ld a,a			;fbae	7f 	 
	dec de			;fbaf	1b 	. 
	rst 38h			;fbb0	ff 	. 
	ld (de),a			;fbb1	12 	. 
	rst 38h			;fbb2	ff 	. 
	add hl,bc			;fbb3	09 	. 
	dec c			;fbb4	0d 	. 
	rst 18h			;fbb5	df 	. 
	inc c			;fbb6	0c 	. 
	inc bc			;fbb7	03 	. 
	rst 38h			;fbb8	ff 	. 
	rst 38h			;fbb9	ff 	. 
	adc a,h			;fbba	8c 	. 
	adc a,e			;fbbb	8b 	. 
	adc a,d			;fbbc	8a 	. 
	adc a,c			;fbbd	89 	. 
	adc a,b			;fbbe	88 	. 
	add a,a			;fbbf	87 	. 
	jr nc,51		;fbc0	30 31 	0 1 
	ld (03433h),a		;fbc2	32 33 34 	2 3 4 
	dec (hl)			;fbc5	35 	5 
	ld (hl),037h		;fbc6	36 37 	6 7 
	jr c,59		;fbc8	38 39 	8 9 
	ld l,0ffh		;fbca	2e ff 	. . 
	dec hl			;fbcc	2b 	+ 
	dec l			;fbcd	2d 	- 
	dec a			;fbce	3d 	= 
	rst 38h			;fbcf	ff 	. 
	rst 38h			;fbd0	ff 	. 
	ld h,c			;fbd1	61 	a 
	ld h,d			;fbd2	62 	b 
	ld h,e			;fbd3	63 	c 
	ld h,h			;fbd4	64 	d 
	ld h,l			;fbd5	65 	e 
	ld h,(hl)			;fbd6	66 	f 
	ld h,a			;fbd7	67 	g 
	ld l,b			;fbd8	68 	h 
	ld l,c			;fbd9	69 	i 
	ld l,d			;fbda	6a 	j 
	ld l,e			;fbdb	6b 	k 
	ld l,h			;fbdc	6c 	l 
	ld l,l			;fbdd	6d 	m 
	ld l,(hl)			;fbde	6e 	n 
	ld l,a			;fbdf	6f 	o 
	ld (hl),b			;fbe0	70 	p 
	ld (hl),c			;fbe1	71 	q 
lfbe2h:
	ld (hl),d			;fbe2	72 	r 
	ld (hl),e			;fbe3	73 	s 
	ld (hl),h			;fbe4	74 	t 
	ld (hl),l			;fbe5	75 	u 
	halt			;fbe6	76 	v 
	ld (hl),a			;fbe7	77 	w 
	ld a,b			;fbe8	78 	x 
	ld a,c			;fbe9	79 	y 
	ld a,d			;fbea	7a 	z 
	rst 38h			;fbeb	ff 	. 
	rst 38h			;fbec	ff 	. 
	rst 38h			;fbed	ff 	. 
	rst 38h			;fbee	ff 	. 
	rst 38h			;fbef	ff 	. 
	jr nc,lfc23h		;fbf0	30 31 	0 1 
	ld (03433h),a		;fbf2	32 33 34 	2 3 4 
	dec (hl)			;fbf5	35 	5 
	ld (hl),037h		;fbf6	36 37 	6 7 
	jr c,lfc33h		;fbf8	38 39 	8 9 
	dec l			;fbfa	2d 	- 
	ld e,(hl)			;fbfb	5e 	^ 
	ld b,b			;fbfc	40 	@ 
	ld e,e			;fbfd	5b 	[ 
	ld e,l			;fbfe	5d 	] 
	ld a,(lffffh)		;fbff	3a ff ff 	: . . 
	jr nz,94		;fc02	20 5c 	  \ 
	inc l			;fc04	2c 	, 
	ld l,02fh		;fc05	2e 2f 	. / 
	dec sp			;fc07	3b 	; 
	rra			;fc08	1f 	. 
	inc e			;fc09	1c 	. 
	dec e			;fc0a	1d 	. 
	ld e,09bh		;fc0b	1e 9b 	. . 
	rst 38h			;fc0d	ff 	. 
	ld a,a			;fc0e	7f 	 
	dec de			;fc0f	1b 	. 
	rst 38h			;fc10	ff 	. 
	ld a,a			;fc11	7f 	 
	rst 38h			;fc12	ff 	. 
	add hl,bc			;fc13	09 	. 
	dec c			;fc14	0d 	. 
	rst 18h			;fc15	df 	. 
	dec bc			;fc16	0b 	. 
	inc bc			;fc17	03 	. 
	rst 38h			;fc18	ff 	. 
	rst 38h			;fc19	ff 	. 
	add a,(hl)			;fc1a	86 	. 
	add a,l			;fc1b	85 	. 
	add a,h			;fc1c	84 	. 
	add a,e			;fc1d	83 	. 
	add a,d			;fc1e	82 	. 
	add a,c			;fc1f	81 	. 
	call po,0ebe2h		;fc20	e4 e2 eb 	. . . 
lfc23h:
	ex (sp),hl			;fc23	e3 	. 
	ret pe			;fc24	e8 	. 
	and 0e9h		;fc25	e6 e9 	. . 
	ret po			;fc27	e0 	. 
	jp pe,0e5e1h		;fc28	ea e1 e5 	. . . 
	rst 38h			;fc2b	ff 	. 
	ld hl,(0e72fh)		;fc2c	2a 2f e7 	* / . 
	rst 38h			;fc2f	ff 	. 
	rst 38h			;fc30	ff 	. 
	ld b,c			;fc31	41 	A 
	ld b,d			;fc32	42 	B 
lfc33h:
	ld b,e			;fc33	43 	C 
	ld b,h			;fc34	44 	D 
	ld b,l			;fc35	45 	E 
	ld b,(hl)			;fc36	46 	F 
	ld b,a			;fc37	47 	G 
	ld c,b			;fc38	48 	H 
	ld c,c			;fc39	49 	I 
	ld c,d			;fc3a	4a 	J 
	ld c,e			;fc3b	4b 	K 
	ld c,h			;fc3c	4c 	L 
	ld c,l			;fc3d	4d 	M 
	ld c,(hl)			;fc3e	4e 	N 
	ld c,a			;fc3f	4f 	O 
	ld d,b			;fc40	50 	P 
	ld d,c			;fc41	51 	Q 
	ld d,d			;fc42	52 	R 
	ld d,e			;fc43	53 	S 
	ld d,h			;fc44	54 	T 
	ld d,l			;fc45	55 	U 
	ld d,(hl)			;fc46	56 	V 
	ld d,a			;fc47	57 	W 
	ld e,b			;fc48	58 	X 
	ld e,c			;fc49	59 	Y 
	ld e,d			;fc4a	5a 	Z 
	rst 38h			;fc4b	ff 	. 
	rst 38h			;fc4c	ff 	. 
	rst 38h			;fc4d	ff 	. 
	rst 38h			;fc4e	ff 	. 
	rst 38h			;fc4f	ff 	. 
	ld e,a			;fc50	5f 	_ 
	ld hl,02322h		;fc51	21 22 23 	! " # 
	inc h			;fc54	24 	$ 
	dec h			;fc55	25 	% 
	ld h,027h		;fc56	26 27 	& ' 
	jr z,43		;fc58	28 29 	( ) 
	dec a			;fc5a	3d 	= 
	ld a,(hl)			;fc5b	7e 	~ 
	ld h,b			;fc5c	60 	` 
	ld a,e			;fc5d	7b 	{ 
	ld a,l			;fc5e	7d 	} 
	ld hl,(lffffh)		;fc5f	2a ff ff 	* . . 
	jr nz,lfce0h		;fc62	20 7c 	  | 
	inc a			;fc64	3c 	< 
	ld a,03fh		;fc65	3e 3f 	> ? 
	dec hl			;fc67	2b 	+ 
	call pe,0eeefh		;fc68	ec ef ee 	. . . 
	defb 0edh;next byte illegal after ed		;fc6b	ed 	. 
	sbc a,e			;fc6c	9b 	. 
	rst 38h			;fc6d	ff 	. 
	ld a,a			;fc6e	7f 	 
	dec de			;fc6f	1b 	. 
	rst 38h			;fc70	ff 	. 
	ld (de),a			;fc71	12 	. 
	rst 38h			;fc72	ff 	. 
	add hl,bc			;fc73	09 	. 
	dec c			;fc74	0d 	. 
	rst 18h			;fc75	df 	. 
	inc c			;fc76	0c 	. 
	inc bc			;fc77	03 	. 
	rst 38h			;fc78	ff 	. 
	rst 38h			;fc79	ff 	. 
	adc a,h			;fc7a	8c 	. 
	adc a,e			;fc7b	8b 	. 
	adc a,d			;fc7c	8a 	. 
	adc a,c			;fc7d	89 	. 
	adc a,b			;fc7e	88 	. 
	add a,a			;fc7f	87 	. 
	jr nc,51		;fc80	30 31 	0 1 
	ld (03433h),a		;fc82	32 33 34 	2 3 4 
	dec (hl)			;fc85	35 	5 
	ld (hl),037h		;fc86	36 37 	6 7 
	jr c,59		;fc88	38 39 	8 9 
	ld l,0ffh		;fc8a	2e ff 	. . 
	dec hl			;fc8c	2b 	+ 
	dec l			;fc8d	2d 	- 
	dec a			;fc8e	3d 	= 
	rst 38h			;fc8f	ff 	. 
	rst 38h			;fc90	ff 	. 
	ld h,c			;fc91	61 	a 
	ld h,d			;fc92	62 	b 
	ld h,e			;fc93	63 	c 
	ld h,h			;fc94	64 	d 
	ld h,l			;fc95	65 	e 
	ld h,(hl)			;fc96	66 	f 
	ld h,a			;fc97	67 	g 
	ld l,b			;fc98	68 	h 
	ld l,c			;fc99	69 	i 
	ld l,d			;fc9a	6a 	j 
	ld l,e			;fc9b	6b 	k 
	ld l,h			;fc9c	6c 	l 
	ld l,l			;fc9d	6d 	m 
	ld l,(hl)			;fc9e	6e 	n 
	ld l,a			;fc9f	6f 	o 
	ld (hl),b			;fca0	70 	p 
	ld (hl),c			;fca1	71 	q 
	ld (hl),d			;fca2	72 	r 
	ld (hl),e			;fca3	73 	s 
	ld (hl),h			;fca4	74 	t 
	ld (hl),l			;fca5	75 	u 
	halt			;fca6	76 	v 
	ld (hl),a			;fca7	77 	w 
	ld a,b			;fca8	78 	x 
	ld a,c			;fca9	79 	y 
	ld a,d			;fcaa	7a 	z 
	rst 38h			;fcab	ff 	. 
	rst 38h			;fcac	ff 	. 
	rst 38h			;fcad	ff 	. 
	rst 38h			;fcae	ff 	. 
	rst 38h			;fcaf	ff 	. 
	jr nc,lfce3h		;fcb0	30 31 	0 1 
	ld (03433h),a		;fcb2	32 33 34 	2 3 4 
	dec (hl)			;fcb5	35 	5 
	ld (hl),037h		;fcb6	36 37 	6 7 
	jr c,lfcf3h		;fcb8	38 39 	8 9 
	dec l			;fcba	2d 	- 
	ld e,(hl)			;fcbb	5e 	^ 
	ld b,b			;fcbc	40 	@ 
	ld e,e			;fcbd	5b 	[ 
	ld e,l			;fcbe	5d 	] 
	ld a,(lffffh)		;fcbf	3a ff ff 	: . . 
	jr nz,94		;fcc2	20 5c 	  \ 
	inc l			;fcc4	2c 	, 
	ld l,02fh		;fcc5	2e 2f 	. / 
	dec sp			;fcc7	3b 	; 
	rra			;fcc8	1f 	. 
	inc e			;fcc9	1c 	. 
	dec e			;fcca	1d 	. 
	ld e,09bh		;fccb	1e 9b 	. . 
	rst 38h			;fccd	ff 	. 
	ld a,a			;fcce	7f 	 
	dec de			;fccf	1b 	. 
	rst 38h			;fcd0	ff 	. 
	ld a,a			;fcd1	7f 	 
	rst 38h			;fcd2	ff 	. 
	add hl,bc			;fcd3	09 	. 
	dec c			;fcd4	0d 	. 
	rst 18h			;fcd5	df 	. 
	dec bc			;fcd6	0b 	. 
	inc bc			;fcd7	03 	. 
	rst 38h			;fcd8	ff 	. 
	rst 38h			;fcd9	ff 	. 
	add a,(hl)			;fcda	86 	. 
	add a,l			;fcdb	85 	. 
	add a,h			;fcdc	84 	. 
	add a,e			;fcdd	83 	. 
	add a,d			;fcde	82 	. 
	add a,c			;fcdf	81 	. 
lfce0h:
	call po,0ebe2h		;fce0	e4 e2 eb 	. . . 
lfce3h:
	ex (sp),hl			;fce3	e3 	. 
	ret pe			;fce4	e8 	. 
	and 0e9h		;fce5	e6 e9 	. . 
	ret po			;fce7	e0 	. 
	jp pe,0e5e1h		;fce8	ea e1 e5 	. . . 
	rst 38h			;fceb	ff 	. 
	ld hl,(0e72fh)		;fcec	2a 2f e7 	* / . 
	rst 38h			;fcef	ff 	. 
	rst 38h			;fcf0	ff 	. 
	ld b,c			;fcf1	41 	A 
	ld b,d			;fcf2	42 	B 
lfcf3h:
	ld b,e			;fcf3	43 	C 
	ld b,h			;fcf4	44 	D 
	ld b,l			;fcf5	45 	E 
	ld b,(hl)			;fcf6	46 	F 
	ld b,a			;fcf7	47 	G 
	ld c,b			;fcf8	48 	H 
	ld c,c			;fcf9	49 	I 
	ld c,d			;fcfa	4a 	J 
	ld c,e			;fcfb	4b 	K 
	ld c,h			;fcfc	4c 	L 
	ld c,l			;fcfd	4d 	M 
	ld c,(hl)			;fcfe	4e 	N 
	ld c,a			;fcff	4f 	O 
	ld d,b			;fd00	50 	P 
	ld d,c			;fd01	51 	Q 
	ld d,d			;fd02	52 	R 
	ld d,e			;fd03	53 	S 
	ld d,h			;fd04	54 	T 
	ld d,l			;fd05	55 	U 
	ld d,(hl)			;fd06	56 	V 
	ld d,a			;fd07	57 	W 
	ld e,b			;fd08	58 	X 
	ld e,c			;fd09	59 	Y 
	ld e,d			;fd0a	5a 	Z 
	rst 38h			;fd0b	ff 	. 
	rst 38h			;fd0c	ff 	. 
	rst 38h			;fd0d	ff 	. 
	rst 38h			;fd0e	ff 	. 
	rst 38h			;fd0f	ff 	. 
	ld e,a			;fd10	5f 	_ 
	ld hl,02322h		;fd11	21 22 23 	! " # 
	inc h			;fd14	24 	$ 
	dec h			;fd15	25 	% 
	ld h,027h		;fd16	26 27 	& ' 
	jr z,43		;fd18	28 29 	( ) 
	dec a			;fd1a	3d 	= 
	ld a,(hl)			;fd1b	7e 	~ 
	ld h,b			;fd1c	60 	` 
	ld a,e			;fd1d	7b 	{ 
	ld a,l			;fd1e	7d 	} 
	ld hl,(lffffh)		;fd1f	2a ff ff 	* . . 
	jr nz,lfda0h		;fd22	20 7c 	  | 
	inc a			;fd24	3c 	< 
	ld a,03fh		;fd25	3e 3f 	> ? 
	dec hl			;fd27	2b 	+ 
	call pe,0eeefh		;fd28	ec ef ee 	. . . 
	defb 0edh;next byte illegal after ed		;fd2b	ed 	. 
	sbc a,e			;fd2c	9b 	. 
	rst 38h			;fd2d	ff 	. 
	ld a,a			;fd2e	7f 	 
	dec de			;fd2f	1b 	. 
	rst 38h			;fd30	ff 	. 
	ld (de),a			;fd31	12 	. 
	rst 38h			;fd32	ff 	. 
	add hl,bc			;fd33	09 	. 
	dec c			;fd34	0d 	. 
	rst 18h			;fd35	df 	. 
	inc c			;fd36	0c 	. 
	inc bc			;fd37	03 	. 
	rst 38h			;fd38	ff 	. 
	rst 38h			;fd39	ff 	. 
	adc a,h			;fd3a	8c 	. 
	adc a,e			;fd3b	8b 	. 
	adc a,d			;fd3c	8a 	. 
	adc a,c			;fd3d	89 	. 
	adc a,b			;fd3e	88 	. 
	add a,a			;fd3f	87 	. 
lfd40h:
	jr c,lfd6ah		;fd40	38 28 	8 ( 
	ld l,055h		;fd42	2e 55 	. U 
	jr nz,lfd4ch		;fd44	20 06 	  . 
	jr lfd64h		;fd46	18 1c 	. . 
	nop			;fd48	00 	. 
	rlca			;fd49	07 	. 
	ld b,a			;fd4a	47 	G 
	rlca			;fd4b	07 	. 
lfd4ch:
	nop			;fd4c	00 	. 
	nop			;fd4d	00 	. 
	nop			;fd4e	00 	. 
	nop			;fd4f	00 	. 
	nop			;fd50	00 	. 
	nop			;fd51	00 	. 
	ld a,(hl)			;fd52	7e 	~ 
	ld d,b			;fd53	50 	P 
	ld e,a			;fd54	5f 	_ 
	ld e,h			;fd55	5c 	\ 
	dec e			;fd56	1d 	. 
	ld bc,01a18h		;fd57	01 18 1a 	. . . 
	nop			;fd5a	00 	. 
	ex af,af'			;fd5b	08 	. 
	ld c,b			;fd5c	48 	H 
	ex af,af'			;fd5d	08 	. 
	nop			;fd5e	00 	. 
	nop			;fd5f	00 	. 
	nop			;fd60	00 	. 
	nop			;fd61	00 	. 
	nop			;fd62	00 	. 
	nop			;fd63	00 	. 
lfd64h:
	adc a,e			;fd64	8b 	. 
	add a,d			;fd65	82 	. 
	ex af,af'			;fd66	08 	. 
	adc a,c			;fd67	89 	. 
	add a,h			;fd68	84 	. 
	rst 38h			;fd69	ff 	. 
lfd6ah:
	ld a,a			;fd6a	7f 	 
	dec de			;fd6b	1b 	. 
	rst 38h			;fd6c	ff 	. 
	sub (hl)			;fd6d	96 	. 
	rst 38h			;fd6e	ff 	. 
	add hl,bc			;fd6f	09 	. 
	dec c			;fd70	0d 	. 
	rst 18h			;fd71	df 	. 
	adc a,a			;fd72	8f 	. 
	inc bc			;fd73	03 	. 
	rst 38h			;fd74	ff 	. 
	rst 38h			;fd75	ff 	. 
	adc a,h			;fd76	8c 	. 
	adc a,d			;fd77	8a 	. 
	adc a,b			;fd78	88 	. 
	add a,a			;fd79	87 	. 
	add a,(hl)			;fd7a	86 	. 
	add a,l			;fd7b	85 	. 
	call pe,0eeefh		;fd7c	ec ef ee 	. . . 
	defb 0edh;next byte illegal after ed		;fd7f	ed 	. 
	add a,h			;fd80	84 	. 
	rst 38h			;fd81	ff 	. 
	ld a,a			;fd82	7f 	 
	dec de			;fd83	1b 	. 
	rst 38h			;fd84	ff 	. 
	sub l			;fd85	95 	. 
	rst 38h			;fd86	ff 	. 
	add hl,bc			;fd87	09 	. 
	dec c			;fd88	0d 	. 
	rst 18h			;fd89	df 	. 
	inc c			;fd8a	0c 	. 
	inc bc			;fd8b	03 	. 
	rst 38h			;fd8c	ff 	. 
	rst 38h			;fd8d	ff 	. 
	add a,b			;fd8e	80 	. 
	sub h			;fd8f	94 	. 
	sub e			;fd90	93 	. 
	sub d			;fd91	92 	. 
	sub c			;fd92	91 	. 
	sub b			;fd93	90 	. 
lfd94h:
	sub l			;fd94	95 	. 
	add a,d			;fd95	82 	. 
	ex af,af'			;fd96	08 	. 
	adc a,c			;fd97	89 	. 
	adc a,e			;fd98	8b 	. 
	sub (hl)			;fd99	96 	. 
	inc e			;fd9a	1c 	. 
	ld (de),a			;fd9b	12 	. 
	nop			;fd9c	00 	. 
	nop			;fd9d	00 	. 
	nop			;fd9e	00 	. 
	nop			;fd9f	00 	. 
lfda0h:
	nop			;fda0	00 	. 
	nop			;fda1	00 	. 
	nop			;fda2	00 	. 
	nop			;fda3	00 	. 
	nop			;fda4	00 	. 
	nop			;fda5	00 	. 
	nop			;fda6	00 	. 
	nop			;fda7	00 	. 
	nop			;fda8	00 	. 
	nop			;fda9	00 	. 
	nop			;fdaa	00 	. 
	nop			;fdab	00 	. 
	nop			;fdac	00 	. 
	nop			;fdad	00 	. 
	nop			;fdae	00 	. 
	nop			;fdaf	00 	. 
	nop			;fdb0	00 	. 
	nop			;fdb1	00 	. 
	nop			;fdb2	00 	. 
	nop			;fdb3	00 	. 
	nop			;fdb4	00 	. 
	nop			;fdb5	00 	. 
	nop			;fdb6	00 	. 
	nop			;fdb7	00 	. 
	nop			;fdb8	00 	. 
	nop			;fdb9	00 	. 
	nop			;fdba	00 	. 
	nop			;fdbb	00 	. 
	nop			;fdbc	00 	. 
	nop			;fdbd	00 	. 
	nop			;fdbe	00 	. 
	nop			;fdbf	00 	. 
	nop			;fdc0	00 	. 
	nop			;fdc1	00 	. 
	nop			;fdc2	00 	. 
	nop			;fdc3	00 	. 
	nop			;fdc4	00 	. 
	nop			;fdc5	00 	. 
	nop			;fdc6	00 	. 
	nop			;fdc7	00 	. 
	nop			;fdc8	00 	. 
	nop			;fdc9	00 	. 
	nop			;fdca	00 	. 
	nop			;fdcb	00 	. 
	nop			;fdcc	00 	. 
	nop			;fdcd	00 	. 
	nop			;fdce	00 	. 
	nop			;fdcf	00 	. 
	nop			;fdd0	00 	. 
	nop			;fdd1	00 	. 
	nop			;fdd2	00 	. 
	nop			;fdd3	00 	. 
	nop			;fdd4	00 	. 
	nop			;fdd5	00 	. 
	nop			;fdd6	00 	. 
	nop			;fdd7	00 	. 
	nop			;fdd8	00 	. 
	nop			;fdd9	00 	. 
	nop			;fdda	00 	. 
	nop			;fddb	00 	. 
	nop			;fddc	00 	. 
	nop			;fddd	00 	. 
	nop			;fdde	00 	. 
	nop			;fddf	00 	. 
	nop			;fde0	00 	. 
	nop			;fde1	00 	. 
	nop			;fde2	00 	. 
	nop			;fde3	00 	. 
	nop			;fde4	00 	. 
	nop			;fde5	00 	. 
	nop			;fde6	00 	. 
	nop			;fde7	00 	. 
	nop			;fde8	00 	. 
	nop			;fde9	00 	. 
	nop			;fdea	00 	. 
	nop			;fdeb	00 	. 
	nop			;fdec	00 	. 
	nop			;fded	00 	. 
	nop			;fdee	00 	. 
	nop			;fdef	00 	. 
	nop			;fdf0	00 	. 
	nop			;fdf1	00 	. 
	nop			;fdf2	00 	. 
	nop			;fdf3	00 	. 
	nop			;fdf4	00 	. 
	nop			;fdf5	00 	. 
	nop			;fdf6	00 	. 
	nop			;fdf7	00 	. 
	nop			;fdf8	00 	. 
	nop			;fdf9	00 	. 
	nop			;fdfa	00 	. 
	nop			;fdfb	00 	. 
	nop			;fdfc	00 	. 
	nop			;fdfd	00 	. 
	nop			;fdfe	00 	. 
	nop			;fdff	00 	. 
	nop			;fe00	00 	. 
	nop			;fe01	00 	. 
	nop			;fe02	00 	. 
	nop			;fe03	00 	. 
	nop			;fe04	00 	. 
	nop			;fe05	00 	. 
	nop			;fe06	00 	. 
	nop			;fe07	00 	. 
	nop			;fe08	00 	. 
	nop			;fe09	00 	. 
	nop			;fe0a	00 	. 
	nop			;fe0b	00 	. 
	nop			;fe0c	00 	. 
	nop			;fe0d	00 	. 
	nop			;fe0e	00 	. 
	nop			;fe0f	00 	. 
	nop			;fe10	00 	. 
	nop			;fe11	00 	. 
	nop			;fe12	00 	. 
	nop			;fe13	00 	. 
	nop			;fe14	00 	. 
	nop			;fe15	00 	. 
	nop			;fe16	00 	. 
	nop			;fe17	00 	. 
	nop			;fe18	00 	. 
	nop			;fe19	00 	. 
	nop			;fe1a	00 	. 
	nop			;fe1b	00 	. 
	nop			;fe1c	00 	. 
	nop			;fe1d	00 	. 
	nop			;fe1e	00 	. 
	nop			;fe1f	00 	. 
	nop			;fe20	00 	. 
	nop			;fe21	00 	. 
	nop			;fe22	00 	. 
	nop			;fe23	00 	. 
	nop			;fe24	00 	. 
	nop			;fe25	00 	. 
	nop			;fe26	00 	. 
	nop			;fe27	00 	. 
	nop			;fe28	00 	. 
	nop			;fe29	00 	. 
	nop			;fe2a	00 	. 
	nop			;fe2b	00 	. 
	nop			;fe2c	00 	. 
	nop			;fe2d	00 	. 
	nop			;fe2e	00 	. 
	nop			;fe2f	00 	. 
	nop			;fe30	00 	. 
	nop			;fe31	00 	. 
	nop			;fe32	00 	. 
	nop			;fe33	00 	. 
	nop			;fe34	00 	. 
	nop			;fe35	00 	. 
	nop			;fe36	00 	. 
	nop			;fe37	00 	. 
	nop			;fe38	00 	. 
	nop			;fe39	00 	. 
	nop			;fe3a	00 	. 
	nop			;fe3b	00 	. 
	nop			;fe3c	00 	. 
	nop			;fe3d	00 	. 
	nop			;fe3e	00 	. 
	nop			;fe3f	00 	. 
	nop			;fe40	00 	. 
	nop			;fe41	00 	. 
	nop			;fe42	00 	. 
	nop			;fe43	00 	. 
	nop			;fe44	00 	. 
	nop			;fe45	00 	. 
	nop			;fe46	00 	. 
	nop			;fe47	00 	. 
	nop			;fe48	00 	. 
	nop			;fe49	00 	. 
	nop			;fe4a	00 	. 
	nop			;fe4b	00 	. 
	nop			;fe4c	00 	. 
	nop			;fe4d	00 	. 
	nop			;fe4e	00 	. 
	nop			;fe4f	00 	. 
	nop			;fe50	00 	. 
	nop			;fe51	00 	. 
	nop			;fe52	00 	. 
	nop			;fe53	00 	. 
	nop			;fe54	00 	. 
	nop			;fe55	00 	. 
	nop			;fe56	00 	. 
	nop			;fe57	00 	. 
	nop			;fe58	00 	. 
	nop			;fe59	00 	. 
	nop			;fe5a	00 	. 
	nop			;fe5b	00 	. 
	nop			;fe5c	00 	. 
	nop			;fe5d	00 	. 
	nop			;fe5e	00 	. 
	nop			;fe5f	00 	. 
	nop			;fe60	00 	. 
	nop			;fe61	00 	. 
	nop			;fe62	00 	. 
	nop			;fe63	00 	. 
	nop			;fe64	00 	. 
	nop			;fe65	00 	. 
	nop			;fe66	00 	. 
	nop			;fe67	00 	. 
	nop			;fe68	00 	. 
	nop			;fe69	00 	. 
	nop			;fe6a	00 	. 
	nop			;fe6b	00 	. 
	nop			;fe6c	00 	. 
	nop			;fe6d	00 	. 
	nop			;fe6e	00 	. 
	nop			;fe6f	00 	. 
	nop			;fe70	00 	. 
	nop			;fe71	00 	. 
	nop			;fe72	00 	. 
	nop			;fe73	00 	. 
	nop			;fe74	00 	. 
	nop			;fe75	00 	. 
	nop			;fe76	00 	. 
	nop			;fe77	00 	. 
	nop			;fe78	00 	. 
	nop			;fe79	00 	. 
	nop			;fe7a	00 	. 
	nop			;fe7b	00 	. 
	nop			;fe7c	00 	. 
	nop			;fe7d	00 	. 
	nop			;fe7e	00 	. 
	nop			;fe7f	00 	. 
	nop			;fe80	00 	. 
	nop			;fe81	00 	. 
	nop			;fe82	00 	. 
	nop			;fe83	00 	. 
	nop			;fe84	00 	. 
	nop			;fe85	00 	. 
	nop			;fe86	00 	. 
	nop			;fe87	00 	. 
	nop			;fe88	00 	. 
	nop			;fe89	00 	. 
	nop			;fe8a	00 	. 
	nop			;fe8b	00 	. 
	nop			;fe8c	00 	. 
	nop			;fe8d	00 	. 
	nop			;fe8e	00 	. 
	nop			;fe8f	00 	. 
	nop			;fe90	00 	. 
	nop			;fe91	00 	. 
	nop			;fe92	00 	. 
	nop			;fe93	00 	. 
	nop			;fe94	00 	. 
	nop			;fe95	00 	. 
	nop			;fe96	00 	. 
	nop			;fe97	00 	. 
	nop			;fe98	00 	. 
	nop			;fe99	00 	. 
	nop			;fe9a	00 	. 
	nop			;fe9b	00 	. 
	nop			;fe9c	00 	. 
	nop			;fe9d	00 	. 
	nop			;fe9e	00 	. 
	nop			;fe9f	00 	. 
	nop			;fea0	00 	. 
	nop			;fea1	00 	. 
	nop			;fea2	00 	. 
	nop			;fea3	00 	. 
	nop			;fea4	00 	. 
	nop			;fea5	00 	. 
	nop			;fea6	00 	. 
	nop			;fea7	00 	. 
	nop			;fea8	00 	. 
	nop			;fea9	00 	. 
	nop			;feaa	00 	. 
	nop			;feab	00 	. 
	nop			;feac	00 	. 
	nop			;fead	00 	. 
	nop			;feae	00 	. 
	nop			;feaf	00 	. 
	nop			;feb0	00 	. 
	nop			;feb1	00 	. 
	nop			;feb2	00 	. 
	nop			;feb3	00 	. 
	nop			;feb4	00 	. 
	nop			;feb5	00 	. 
	nop			;feb6	00 	. 
	nop			;feb7	00 	. 
	nop			;feb8	00 	. 
	nop			;feb9	00 	. 
	nop			;feba	00 	. 
	nop			;febb	00 	. 
	nop			;febc	00 	. 
	nop			;febd	00 	. 
	nop			;febe	00 	. 
	nop			;febf	00 	. 
	nop			;fec0	00 	. 
	nop			;fec1	00 	. 
	nop			;fec2	00 	. 
	nop			;fec3	00 	. 
	nop			;fec4	00 	. 
	nop			;fec5	00 	. 
	nop			;fec6	00 	. 
	nop			;fec7	00 	. 
	nop			;fec8	00 	. 
	nop			;fec9	00 	. 
	nop			;feca	00 	. 
	nop			;fecb	00 	. 
	nop			;fecc	00 	. 
	nop			;fecd	00 	. 
	nop			;fece	00 	. 
	nop			;fecf	00 	. 
	nop			;fed0	00 	. 
	nop			;fed1	00 	. 
	nop			;fed2	00 	. 
	nop			;fed3	00 	. 
	nop			;fed4	00 	. 
	nop			;fed5	00 	. 
	nop			;fed6	00 	. 
	nop			;fed7	00 	. 
	nop			;fed8	00 	. 
	nop			;fed9	00 	. 
	nop			;feda	00 	. 
	nop			;fedb	00 	. 
	nop			;fedc	00 	. 
	nop			;fedd	00 	. 
	nop			;fede	00 	. 
	nop			;fedf	00 	. 
	nop			;fee0	00 	. 
	nop			;fee1	00 	. 
	nop			;fee2	00 	. 
	nop			;fee3	00 	. 
	nop			;fee4	00 	. 
	nop			;fee5	00 	. 
	nop			;fee6	00 	. 
	nop			;fee7	00 	. 
	nop			;fee8	00 	. 
	nop			;fee9	00 	. 
	nop			;feea	00 	. 
	nop			;feeb	00 	. 
	nop			;feec	00 	. 
	nop			;feed	00 	. 
	nop			;feee	00 	. 
	nop			;feef	00 	. 
	nop			;fef0	00 	. 
	nop			;fef1	00 	. 
	nop			;fef2	00 	. 
	nop			;fef3	00 	. 
	nop			;fef4	00 	. 
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
	nop			;ff00	00 	. 
	nop			;ff01	00 	. 
	nop			;ff02	00 	. 
	nop			;ff03	00 	. 
	nop			;ff04	00 	. 
	nop			;ff05	00 	. 
	nop			;ff06	00 	. 
	nop			;ff07	00 	. 
	nop			;ff08	00 	. 
	nop			;ff09	00 	. 
	nop			;ff0a	00 	. 
	nop			;ff0b	00 	. 
	nop			;ff0c	00 	. 
	nop			;ff0d	00 	. 
	nop			;ff0e	00 	. 
	nop			;ff0f	00 	. 
	nop			;ff10	00 	. 
	nop			;ff11	00 	. 
	nop			;ff12	00 	. 
	nop			;ff13	00 	. 
	nop			;ff14	00 	. 
	nop			;ff15	00 	. 
	nop			;ff16	00 	. 
	nop			;ff17	00 	. 
	nop			;ff18	00 	. 
	nop			;ff19	00 	. 
	nop			;ff1a	00 	. 
	nop			;ff1b	00 	. 
	nop			;ff1c	00 	. 
	nop			;ff1d	00 	. 
	nop			;ff1e	00 	. 
	nop			;ff1f	00 	. 
	nop			;ff20	00 	. 
	nop			;ff21	00 	. 
	nop			;ff22	00 	. 
	nop			;ff23	00 	. 
	nop			;ff24	00 	. 
	nop			;ff25	00 	. 
	nop			;ff26	00 	. 
	nop			;ff27	00 	. 
	nop			;ff28	00 	. 
	nop			;ff29	00 	. 
	nop			;ff2a	00 	. 
	nop			;ff2b	00 	. 
	nop			;ff2c	00 	. 
	nop			;ff2d	00 	. 
	nop			;ff2e	00 	. 
	nop			;ff2f	00 	. 
	nop			;ff30	00 	. 
	nop			;ff31	00 	. 
	nop			;ff32	00 	. 
	nop			;ff33	00 	. 
	nop			;ff34	00 	. 
	nop			;ff35	00 	. 
	nop			;ff36	00 	. 
	nop			;ff37	00 	. 
	nop			;ff38	00 	. 
	nop			;ff39	00 	. 
	nop			;ff3a	00 	. 
	nop			;ff3b	00 	. 
	nop			;ff3c	00 	. 
	nop			;ff3d	00 	. 
	nop			;ff3e	00 	. 
	nop			;ff3f	00 	. 
	nop			;ff40	00 	. 
	nop			;ff41	00 	. 
	nop			;ff42	00 	. 
	nop			;ff43	00 	. 
	nop			;ff44	00 	. 
	nop			;ff45	00 	. 
	nop			;ff46	00 	. 
	nop			;ff47	00 	. 
	nop			;ff48	00 	. 
	nop			;ff49	00 	. 
	nop			;ff4a	00 	. 
	nop			;ff4b	00 	. 
	nop			;ff4c	00 	. 
	nop			;ff4d	00 	. 
	nop			;ff4e	00 	. 
	nop			;ff4f	00 	. 
	nop			;ff50	00 	. 
	nop			;ff51	00 	. 
	nop			;ff52	00 	. 
	nop			;ff53	00 	. 
	nop			;ff54	00 	. 
	nop			;ff55	00 	. 
	nop			;ff56	00 	. 
	nop			;ff57	00 	. 
	nop			;ff58	00 	. 
	nop			;ff59	00 	. 
	nop			;ff5a	00 	. 
	nop			;ff5b	00 	. 
	nop			;ff5c	00 	. 
	nop			;ff5d	00 	. 
	nop			;ff5e	00 	. 
	nop			;ff5f	00 	. 
	nop			;ff60	00 	. 
	nop			;ff61	00 	. 
	nop			;ff62	00 	. 
	nop			;ff63	00 	. 
	nop			;ff64	00 	. 
	nop			;ff65	00 	. 
	nop			;ff66	00 	. 
	nop			;ff67	00 	. 
	nop			;ff68	00 	. 
	nop			;ff69	00 	. 
	nop			;ff6a	00 	. 
	nop			;ff6b	00 	. 
	nop			;ff6c	00 	. 
	nop			;ff6d	00 	. 
	nop			;ff6e	00 	. 
	nop			;ff6f	00 	. 
	nop			;ff70	00 	. 
	nop			;ff71	00 	. 
	nop			;ff72	00 	. 
	nop			;ff73	00 	. 
	nop			;ff74	00 	. 
	nop			;ff75	00 	. 
	nop			;ff76	00 	. 
	nop			;ff77	00 	. 
	nop			;ff78	00 	. 
	nop			;ff79	00 	. 
	nop			;ff7a	00 	. 
	nop			;ff7b	00 	. 
	nop			;ff7c	00 	. 
	nop			;ff7d	00 	. 
	nop			;ff7e	00 	. 
	nop			;ff7f	00 	. 
	nop			;ff80	00 	. 
	nop			;ff81	00 	. 
	nop			;ff82	00 	. 
	nop			;ff83	00 	. 
	nop			;ff84	00 	. 
	nop			;ff85	00 	. 
	nop			;ff86	00 	. 
	nop			;ff87	00 	. 
	nop			;ff88	00 	. 
	nop			;ff89	00 	. 
	nop			;ff8a	00 	. 
	nop			;ff8b	00 	. 
	nop			;ff8c	00 	. 
	nop			;ff8d	00 	. 
	nop			;ff8e	00 	. 
	nop			;ff8f	00 	. 
	nop			;ff90	00 	. 
	nop			;ff91	00 	. 
	nop			;ff92	00 	. 
	nop			;ff93	00 	. 
	nop			;ff94	00 	. 
	nop			;ff95	00 	. 
	nop			;ff96	00 	. 
	nop			;ff97	00 	. 
	nop			;ff98	00 	. 
	nop			;ff99	00 	. 
	nop			;ff9a	00 	. 
	nop			;ff9b	00 	. 
	nop			;ff9c	00 	. 
	nop			;ff9d	00 	. 
	nop			;ff9e	00 	. 
	nop			;ff9f	00 	. 
	nop			;ffa0	00 	. 
	nop			;ffa1	00 	. 
	nop			;ffa2	00 	. 
	nop			;ffa3	00 	. 
	nop			;ffa4	00 	. 
	nop			;ffa5	00 	. 
	nop			;ffa6	00 	. 
	nop			;ffa7	00 	. 
	nop			;ffa8	00 	. 
	nop			;ffa9	00 	. 
	nop			;ffaa	00 	. 
	nop			;ffab	00 	. 
	nop			;ffac	00 	. 
	nop			;ffad	00 	. 
	nop			;ffae	00 	. 
	nop			;ffaf	00 	. 
	nop			;ffb0	00 	. 
	nop			;ffb1	00 	. 
	nop			;ffb2	00 	. 
	nop			;ffb3	00 	. 
	nop			;ffb4	00 	. 
	nop			;ffb5	00 	. 
	nop			;ffb6	00 	. 
	nop			;ffb7	00 	. 
	nop			;ffb8	00 	. 
	nop			;ffb9	00 	. 
	nop			;ffba	00 	. 
	nop			;ffbb	00 	. 
	nop			;ffbc	00 	. 
	nop			;ffbd	00 	. 
	nop			;ffbe	00 	. 
	nop			;ffbf	00 	. 
	nop			;ffc0	00 	. 
	nop			;ffc1	00 	. 
	nop			;ffc2	00 	. 
	nop			;ffc3	00 	. 
	nop			;ffc4	00 	. 
	nop			;ffc5	00 	. 
	nop			;ffc6	00 	. 
	nop			;ffc7	00 	. 
	nop			;ffc8	00 	. 
	nop			;ffc9	00 	. 
	nop			;ffca	00 	. 
	nop			;ffcb	00 	. 
	nop			;ffcc	00 	. 
	nop			;ffcd	00 	. 
	nop			;ffce	00 	. 
	nop			;ffcf	00 	. 
	nop			;ffd0	00 	. 
	nop			;ffd1	00 	. 
	nop			;ffd2	00 	. 
	nop			;ffd3	00 	. 
	nop			;ffd4	00 	. 
	nop			;ffd5	00 	. 
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
	nop			;fff0	00 	. 
	nop			;fff1	00 	. 
	nop			;fff2	00 	. 
	nop			;fff3	00 	. 
	nop			;fff4	00 	. 
	nop			;fff5	00 	. 
	nop			;fff6	00 	. 
	nop			;fff7	00 	. 
	nop			;fff8	00 	. 
	nop			;fff9	00 	. 
	nop			;fffa	00 	. 
	nop			;fffb	00 	. 
	nop			;fffc	00 	. 
	nop			;fffd	00 	. 
	nop			;fffe	00 	. 
lffffh:
	nop			;ffff	00 	. 

	end
