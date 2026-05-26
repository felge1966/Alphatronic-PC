; z80dasm 1.1.5
; command line: z80dasm -a -l -t -z -g 0x0000 1_b4-3_ic1058.bin

	org	00000h

l0000h:
	jp 0fff0h		;0000	c3 f0 ff 	. . . 
	ld sp,hl			;0003	f9 	. 
l0004h:
	scf			;0004	37 	7 
	jp l09ach		;0005	c3 ac 09 	. . . 
l0008h:
	ld a,(hl)			;0008	7e 	~ 
	ex (sp),hl			;0009	e3 	. 
l000ah:
	cp (hl)			;000a	be 	. 
	inc hl			;000b	23 	# 
	ex (sp),hl			;000c	e3 	. 
	jp nz,l0992h		;000d	c2 92 09 	. . . 
	inc hl			;0010	23 	# 
	ld a,(hl)			;0011	7e 	~ 
	cp 03ah		;0012	fe 3a 	. : 
	ret nc			;0014	d0 	. 
	jp l0feah		;0015	c3 ea 0f 	. . . 
l0018h:
	push af			;0018	f5 	. 
	call 0db79h		;0019	cd 79 db 	. y . 
	jp 0516dh		;001c	c3 6d 51 	. m Q 
	nop			;001f	00 	. 
	ld a,h			;0020	7c 	| 
	sub d			;0021	92 	. 
	ret nz			;0022	c0 	. 
	ld a,l			;0023	7d 	} 
	sub e			;0024	93 	. 
	ret			;0025	c9 	. 
	nop			;0026	00 	. 
	nop			;0027	00 	. 
	ld a,(0d477h)		;0028	3a 77 d4 	: w . 
	or a			;002b	b7 	. 
	jp nz,036d6h		;002c	c2 d6 36 	. . 6 
	ret			;002f	c9 	. 
	ld a,(0d2c5h)		;0030	3a c5 d2 	: . . 
	cp 008h		;0033	fe 08 	. . 
	jp l1990h		;0035	c3 90 19 	. . . 
	jp 0e45ah		;0038	c3 5a e4 	. Z . 
l003bh:
	ld de,l08e4h		;003b	11 e4 08 	. . . 
	ld b,05ah		;003e	06 5a 	. Z 
	ld hl,0d000h		;0040	21 00 d0 	! . . 
l0043h:
	ld a,(de)			;0043	1a 	. 
	ld (hl),a			;0044	77 	w 
	inc hl			;0045	23 	# 
	inc de			;0046	13 	. 
	djnz l0043h		;0047	10 fa 	. . 
	ld sp,hl			;0049	f9 	. 
	ld hl,0da00h		;004a	21 00 da 	! . . 
	ld de,0da01h		;004d	11 01 da 	. . . 
	ld bc,l0227h		;0050	01 27 02 	. ' . 
	ld (hl),000h		;0053	36 00 	6 . 
	ldir		;0055	ed b0 	. . 
	ld hl,0560dh		;0057	21 0d 56 	! . V 
	ld de,0da00h		;005a	11 00 da 	. . . 
	ld bc,000efh		;005d	01 ef 00 	. . . 
	ldir		;0060	ed b0 	. . 
	ld hl,0d080h		;0062	21 80 d0 	! . . 
	ld (hl),03ah		;0065	36 3a 	6 : 
	ld hl,0d342h		;0067	21 42 d3 	! B . 
	ld (0d3aah),hl		;006a	22 aa d3 	" . . 
	ld hl,0d2a4h		;006d	21 a4 d2 	! . . 
	ld (0d04fh),hl		;0070	22 4f d0 	" O . 
	ld hl,0db10h		;0073	21 10 db 	! . . 
	ld b,032h		;0076	06 32 	. 2 
l0078h:
	ld (hl),0c9h		;0078	36 c9 	6 . 
	inc hl			;007a	23 	# 
	inc hl			;007b	23 	# 
	inc hl			;007c	23 	# 
	djnz l0078h		;007d	10 f9 	. . 
	ld b,02bh		;007f	06 2b 	. + 
	ld de,0242eh		;0081	11 2e 24 	. . $ 
l0084h:
	ld (hl),0c3h		;0084	36 c3 	6 . 
	inc hl			;0086	23 	# 
	ld (hl),e			;0087	73 	s 
	inc hl			;0088	23 	# 
	ld (hl),d			;0089	72 	r 
	inc hl			;008a	23 	# 
	djnz l0084h		;008b	10 f7 	. . 
sub_008dh:
	di			;008d	f3 	. 
	call 04317h		;008e	cd 17 43 	. . C 
	call 05268h		;0091	cd 68 52 	. h R 
	ld (0d2c2h),a		;0094	32 c2 d2 	2 . . 
	ld (0d510h),a		;0097	32 10 d5 	2 . . 
	xor a			;009a	af 	. 
	ld (0d430h),a		;009b	32 30 d4 	2 0 . 
	ld (0d431h),a		;009e	32 31 d4 	2 1 . 
	ld (0d436h),a		;00a1	32 36 d4 	2 6 . 
	ld hl,06000h		;00a4	21 00 60 	! . ` 
	ld (hl),000h		;00a7	36 00 	6 . 
	inc hl			;00a9	23 	# 
	ld (0d053h),hl		;00aa	22 53 d0 	" S . 
	ld hl,0cfffh		;00ad	21 ff cf 	! . . 
	ex de,hl			;00b0	eb 	. 
	ld hl,(0d053h)		;00b1	2a 53 d0 	* S . 
	ld a,e			;00b4	7b 	{ 
	sub l			;00b5	95 	. 
	ld l,a			;00b6	6f 	o 
	ld a,d			;00b7	7a 	z 
	sbc a,h			;00b8	9c 	. 
	ld h,a			;00b9	67 	g 
	jp c,04270h		;00ba	da 70 42 	. p B 
	ld b,003h		;00bd	06 03 	. . 
l00bfh:
	or a			;00bf	b7 	. 
	ld a,h			;00c0	7c 	| 
	rra			;00c1	1f 	. 
	ld h,a			;00c2	67 	g 
	ld a,l			;00c3	7d 	} 
	rra			;00c4	1f 	. 
	ld l,a			;00c5	6f 	o 
	djnz l00bfh		;00c6	10 f7 	. . 
	ld a,h			;00c8	7c 	| 
	cp 002h		;00c9	fe 02 	. . 
	jr c,l00d0h		;00cb	38 03 	8 . 
	ld hl,00200h		;00cd	21 00 02 	! . . 
l00d0h:
	ld a,e			;00d0	7b 	{ 
	sub l			;00d1	95 	. 
	ld l,a			;00d2	6f 	o 
l00d3h:
	ld a,d			;00d3	7a 	z 
	sbc a,h			;00d4	9c 	. 
	ld h,a			;00d5	67 	g 
	jp c,04270h		;00d6	da 70 42 	. p B 
	ld (0d2d4h),hl		;00d9	22 d4 d2 	" . . 
	ex de,hl			;00dc	eb 	. 
	ld (0d04fh),hl		;00dd	22 4f d0 	" O . 
	ld (0d2f9h),hl		;00e0	22 f9 d2 	" . . 
	ld sp,hl			;00e3	f9 	. 
	ld (0d30fh),hl		;00e4	22 0f d3 	" . . 
	ld hl,(0d053h)		;00e7	2a 53 d0 	* S . 
	ex de,hl			;00ea	eb 	. 
	call 04281h		;00eb	cd 81 42 	. . B 
	call 042a4h		;00ee	cd a4 42 	. . B 
	ld hl,(0d053h)		;00f1	2a 53 d0 	* S . 
	ex de,hl			;00f4	eb 	. 
	ld hl,(0d2d4h)		;00f5	2a d4 d2 	* . . 
l00f8h:
	ld a,l			;00f8	7d 	} 
	sub e			;00f9	93 	. 
	ld l,a			;00fa	6f 	o 
	ld a,h			;00fb	7c 	| 
	sbc a,d			;00fc	9a 	. 
	ld h,a			;00fd	67 	g 
	dec hl			;00fe	2b 	+ 
	dec hl			;00ff	2b 	+ 
	push hl			;0100	e5 	. 
	ld hl,l012bh		;0101	21 2b 01 	! + . 
	call 02b1ah		;0104	cd 1a 2b 	. . + 
	pop hl			;0107	e1 	. 
	call 03cfah		;0108	cd fa 3c 	. . < 
	ld hl,l011dh		;010b	21 1d 01 	! . . 
	call 02b1ah		;010e	cd 1a 2b 	. . + 
	ld sp,0d1c5h		;0111	31 c5 d1 	1 . . 
	call 04317h		;0114	cd 17 43 	. . C 
	call 022b1h		;0117	cd b1 22 	. . " 
	jp l0a4bh		;011a	c3 4b 0a 	. K . 
l011dh:
	jr nz,l0161h		;011d	20 42 	  B 
	ld a,c			;011f	79 	y 
	ld (hl),h			;0120	74 	t 
	ld h,l			;0121	65 	e 
	ld (hl),e			;0122	73 	s 
	jr nz,l018bh		;0123	20 66 	  f 
	ld (hl),d			;0125	72 	r 
	ld h,l			;0126	65 	e 
	ld h,l			;0127	65 	e 
	dec c			;0128	0d 	. 
	ld a,(bc)			;0129	0a 	. 
	nop			;012a	00 	. 
l012bh:
	ld c,l			;012b	4d 	M 
	ld l,c			;012c	69 	i 
	ld h,e			;012d	63 	c 
	ld (hl),d			;012e	72 	r 
	ld l,a			;012f	6f 	o 
	ld (hl),e			;0130	73 	s 
	ld l,a			;0131	6f 	o 
	ld h,(hl)			;0132	66 	f 
	ld (hl),h			;0133	74 	t 
	jr nz,l0188h		;0134	20 52 	  R 
	ld c,a			;0136	4f 	O 
	ld c,l			;0137	4d 	M 
	jr nz,l017ch		;0138	20 42 	  B 
	ld b,c			;013a	41 	A 
l013bh:
	ld d,e			;013b	53 	S 
	ld c,c			;013c	49 	I 
	ld b,e			;013d	43 	C 
l013eh:
	jr nz,l0196h		;013e	20 56 	  V 
l0140h:
	ld h,l			;0140	65 	e 
	ld (hl),d			;0141	72 	r 
	jr nz,l0179h		;0142	20 35 	  5 
	ld l,031h		;0144	2e 31 	. 1 
	ld sp,00a0dh		;0146	31 0d 0a 	1 . . 
	ld b,e			;0149	43 	C 
	ld l,a			;014a	6f 	o 
	ld (hl),b			;014b	70 	p 
	ld a,c			;014c	79 	y 
	ld (hl),d			;014d	72 	r 
	ld l,c			;014e	69 	i 
	ld h,a			;014f	67 	g 
	ld l,b			;0150	68 	h 
	ld (hl),h			;0151	74 	t 
	jr nz,l017ch		;0152	20 28 	  ( 
	ld b,e			;0154	43 	C 
	add hl,hl			;0155	29 	) 
	jr nz,51		;0156	20 31 	  1 
	add hl,sp			;0158	39 	9 
	jr c,l018eh		;0159	38 33 	8 3 
	jr nz,l01bfh		;015b	20 62 	  b 
	ld a,c			;015d	79 	y 
	jr nz,79		;015e	20 4d 	  M 
	ld l,c			;0160	69 	i 
l0161h:
	ld h,e			;0161	63 	c 
	ld (hl),d			;0162	72 	r 
	ld l,a			;0163	6f 	o 
	ld (hl),e			;0164	73 	s 
	ld l,a			;0165	6f 	o 
	ld h,(hl)			;0166	66 	f 
l0167h:
	ld (hl),h			;0167	74 	t 
l0168h:
	dec c			;0168	0d 	. 
	ld a,(bc)			;0169	0a 	. 
	nop			;016a	00 	. 
	ld c,l			;016b	4d 	M 
l016ch:
	ld h,l			;016c	65 	e 
	ld l,l			;016d	6d 	m 
	ld l,a			;016e	6f 	o 
	ld (hl),d			;016f	72 	r 
	ld a,c			;0170	79 	y 
l0171h:
	jr nz,117		;0171	20 73 	  s 
	ld l,c			;0173	69 	i 
	ld a,d			;0174	7a 	z 
	ld h,l			;0175	65 	e 
l0176h:
	nop			;0176	00 	. 
l0177h:
	ld l,(hl)			;0177	6e 	n 
	ld b,e			;0178	43 	C 
l0179h:
	ld a,l			;0179	7d 	} 
	ld c,0c5h		;017a	0e c5 	. . 
l017ch:
	ld b,h			;017c	44 	D 
	sbc a,a			;017d	9f 	. 
	ld de,l14e4h		;017e	11 e4 14 	. . . 
	xor h			;0181	ac 	. 
	ld c,h			;0182	4c 	L 
	and (hl)			;0183	a6 	. 
	dec d			;0184	15 	. 
	call nz,04511h		;0185	c4 11 45 	. . E 
l0188h:
	ld de,l111ah		;0188	11 1a 11 	. . . 
l018bh:
	di			;018b	f3 	. 
	ld (de),a			;018c	12 	. 
	ld d,b			;018d	50 	P 
l018eh:
	ld b,e			;018e	43 	C 
	ld l,011h		;018f	2e 11 	. . 
	ld a,(hl)			;0191	7e 	~ 
	ld de,sub_119fh+2		;0192	11 a1 11 	. . . 
	ld l,d			;0195	6a 	j 
l0196h:
	ld b,e			;0196	43 	C 
	inc sp			;0197	33 	3 
	inc de			;0198	13 	. 
	ld c,e			;0199	4b 	K 
	ld b,h			;019a	44 	D 
	ld h,h			;019b	64 	d 
	inc e			;019c	1c 	. 
	and e			;019d	a3 	. 
	ld b,d			;019e	42 	B 
	jr z,l01b3h		;019f	28 12 	( . 
	ld b,01ch		;01a1	06 1c 	. . 
	ld b,c			;01a3	41 	A 
	ld a,(de)			;01a4	1a 	. 
	call c,0b51eh		;01a5	dc 1e b5 	. . . 
	ld b,e			;01a8	43 	C 
	sbc a,b			;01a9	98 	. 
	jr z,-75		;01aa	28 b3 	( . 
	jr z,l01aeh		;01ac	28 00 	( . 
l01aeh:
	inc e			;01ae	1c 	. 
	dec hl			;01af	2b 	+ 
	inc de			;01b0	13 	. 
	ld e,a			;01b1	5f 	_ 
	inc e			;01b2	1c 	. 
l01b3h:
	inc a			;01b3	3c 	< 
	ld h,00ah		;01b4	26 0a 	& . 
	daa			;01b6	27 	' 
	and c			;01b7	a1 	. 
	ld de,043c9h		;01b8	11 c9 43 	. . C 
	jp z,0cf43h		;01bb	ca 43 cf 	. C . 
	ld b,e			;01be	43 	C 
l01bfh:
	ex af,af'			;01bf	08 	. 
	ld b,h			;01c0	44 	D 
	ld h,04ah		;01c1	26 4a 	& J 
	cp b			;01c3	b8 	. 
	ld (de),a			;01c4	12 	. 
	ld l,e			;01c5	6b 	k 
	ld (de),a			;01c6	12 	. 
	sbc a,e			;01c7	9b 	. 
	ld e,0c3h		;01c8	1e c3 	. . 
	ld (de),a			;01ca	12 	. 
	rra			;01cb	1f 	. 
	rra			;01cc	1f 	. 
	sub h			;01cd	94 	. 
	djnz l0167h		;01ce	10 97 	. . 
	djnz l016ch		;01d0	10 9a 	. . 
	djnz l0171h		;01d2	10 9d 	. . 
	djnz l0248h		;01d4	10 72 	. r 
	inc d			;01d6	14 	. 
	defb 0fdh,054h	;ld d,iyh		;01d7	fd 54 	. T 
	inc e			;01d9	1c 	. 
	ld d,l			;01da	55 	U 
	adc a,c			;01db	89 	. 
	ld d,l			;01dc	55 	U 
	ld h,a			;01dd	67 	g 
	jr z,l0168h		;01de	28 88 	( . 
	jr z,l01e2h		;01e0	28 00 	( . 
l01e2h:
	nop			;01e2	00 	. 
	inc h			;01e3	24 	$ 
	call c,sub_119fh		;01e4	dc 9f 11 	. . . 
	xor c			;01e7	a9 	. 
	in a,(044h)		;01e8	db 44 	. D 
	jr nz,l0176h		;01ea	20 8a 	  . 
	jr nz,-55		;01ec	20 c7 	  . 
l01eeh:
	in a,(015h)		;01ee	db 15 	. . 
	call c,0dbcdh		;01f0	dc cd db 	. . . 
	jp po,l18dbh		;01f3	e2 db 18 	. . . 
	call c,0dc21h		;01f6	dc 21 dc 	. ! . 
	xor a			;01f9	af 	. 
	in a,(0f1h)		;01fa	db f1 	. . 
	in a,(000h)		;01fc	db 00 	. . 
	call c,0dbd0h		;01fe	dc d0 db 	. . . 
	inc c			;0201	0c 	. 
	call c,0dbebh		;0202	dc eb db 	. . . 
	defb 0fdh,0dbh,01bh	;illegal sequence		;0205	fd db 1b 	. . . 
	call c,0dc1eh		;0208	dc 1e dc 	. . . 
	xor 0dbh		;020b	ee db 	. . 
	ld l,053h		;020d	2e 53 	. S 
	ld hl,(0b753h)		;020f	2a 53 b7 	* S . 
	ld h,06ch		;0212	26 6c 	& l 
	daa			;0214	27 	' 
	jp (hl)			;0215	e9 	. 
	ld h,0b2h		;0216	26 b2 	& . 
	daa			;0218	27 	' 
l0219h:
	djnz l0248h		;0219	10 2d 	. - 
	ld b,b			;021b	40 	@ 
	dec l			;021c	2d 	- 
	ld c,c			;021d	49 	I 
l021eh:
	dec l			;021e	2d 	- 
	ei			;021f	fb 	. 
	ld (hl),02dh		;0220	36 2d 	6 - 
	add hl,sp			;0222	39 	9 
	and 036h		;0223	e6 36 	. 6 
	ld c,h			;0225	4c 	L 
	inc sp			;0226	33 	3 
l0227h:
	ld (0fb34h),a		;0227	32 34 fb 	2 4 . 
	ld sp,032c1h		;022a	31 c1 32 	1 . 2 
	sub l			;022d	95 	. 
	inc sp			;022e	33 	3 
	jp po,04a31h		;022f	e2 31 4a 	. 1 J 
	ld (03263h),a		;0232	32 63 32 	2 c 2 
	sub h			;0235	94 	. 
	ld l,0ebh		;0236	2e eb 	. . 
	dec de			;0238	1b 	. 
	rst 28h			;0239	ef 	. 
	add hl,de			;023a	19 	. 
	xor (hl)			;023b	ae 	. 
	inc l			;023c	2c 	, 
	sub l			;023d	95 	. 
	ld hl,(02d6ah)		;023e	2a 6a 2d 	* j - 
	cp d			;0241	ba 	. 
	inc l			;0242	2c 	, 
	jp z,0d52ch		;0243	ca 2c d5 	. , . 
	ld e,0f7h		;0246	1e f7 	. . 
l0248h:
	inc l			;0248	2c 	, 
	adc a,e			;0249	8b 	. 
	ld hl,(02a90h)		;024a	2a 90 2a 	* . * 
	jp pe,0ea19h		;024d	ea 19 ea 	. . . 
	scf			;0250	37 	7 
	ld (de),a			;0251	12 	. 
	jr c,l01eeh		;0252	38 9a 	8 . 
	jr c,l0274h		;0254	38 1e 	8 . 
	add hl,sp			;0256	39 	9 
	cp b			;0257	b8 	. 
	in a,(0bbh)		;0258	db bb 	. . 
	in a,(0b5h)		;025a	db b5 	. . 
	in a,(0c1h)		;025c	db c1 	. . 
	in a,(0cah)		;025e	db ca 	. . 
	in a,(0f4h)		;0260	db f4 	. . 
	in a,(0f7h)		;0262	db f7 	. . 
	in a,(0dfh)		;0264	db df 	. . 
	in a,(006h)		;0266	db 06 	. . 
	call c,0dc09h		;0268	dc 09 dc 	. . . 
	inc bc			;026b	03 	. 
	call c,sub_02a1h		;026c	dc a1 02 	. . . 
	or a			;026f	b7 	. 
	ld (bc),a			;0270	02 	. 
	cp h			;0271	bc 	. 
	ld (bc),a			;0272	02 	. 
	dec d			;0273	15 	. 
l0274h:
	inc bc			;0274	03 	. 
	ld c,h			;0275	4c 	L 
	inc bc			;0276	03 	. 
	ld (hl),c			;0277	71 	q 
	inc bc			;0278	03 	. 
	adc a,e			;0279	8b 	. 
	inc bc			;027a	03 	. 
	sbc a,l			;027b	9d 	. 
	inc bc			;027c	03 	. 
	and d			;027d	a2 	. 
	inc bc			;027e	03 	. 
	cp (hl)			;027f	be 	. 
	inc bc			;0280	03 	. 
	cp a			;0281	bf 	. 
	inc bc			;0282	03 	. 
	rst 0			;0283	c7 	. 
	inc bc			;0284	03 	. 
	rlca			;0285	07 	. 
	inc b			;0286	04 	. 
	inc hl			;0287	23 	# 
	inc b			;0288	04 	. 
	ld (04804h),a		;0289	32 04 48 	2 . H 
	inc b			;028c	04 	. 
	ld l,e			;028d	6b 	k 
	inc b			;028e	04 	. 
	ld l,h			;028f	6c 	l 
	inc b			;0290	04 	. 
	and l			;0291	a5 	. 
	inc b			;0292	04 	. 
	rst 10h			;0293	d7 	. 
	inc b			;0294	04 	. 
	xor 004h		;0295	ee 04 	. . 
	rst 30h			;0297	f7 	. 
	inc b			;0298	04 	. 
	ld bc,l1905h		;0299	01 05 19 	. . . 
	dec b			;029c	05 	. 
	dec e			;029d	1d 	. 
	dec b			;029e	05 	. 
	ld e,005h		;029f	1e 05 	. . 
sub_02a1h:
	ld d,l			;02a1	55 	U 
	ld d,h			;02a2	54 	T 
	rst 8			;02a3	cf 	. 
	xor d			;02a4	aa 	. 
	ld c,(hl)			;02a5	4e 	N 
	call nz,042f6h		;02a6	c4 f6 42 	. . B 
	out (006h),a		;02a9	d3 06 	. . 
	ld d,h			;02ab	54 	T 
	adc a,00eh		;02ac	ce 0e 	. . 
	ld d,e			;02ae	53 	S 
	jp 05415h		;02af	c3 15 54 	. . T 
	ld d,h			;02b2	54 	T 
	ld d,d			;02b3	52 	R 
	and h			;02b4	a4 	. 
	ex (sp),hl			;02b5	e3 	. 
	nop			;02b6	00 	. 
	ld b,l			;02b7	45 	E 
	ld b,l			;02b8	45 	E 
	ret nc			;02b9	d0 	. 
	or h			;02ba	b4 	. 
	nop			;02bb	00 	. 
	ld c,a			;02bc	4f 	O 
	ld c,h			;02bd	4c 	L 
	ld c,a			;02be	4f 	O 
	jp nc,04fceh		;02bf	d2 ce 4f 	. . O 
	ld c,(hl)			;02c2	4e 	N 
	ld d,e			;02c3	53 	S 
	ld c,a			;02c4	4f 	O 
	ld c,h			;02c5	4c 	L 
	push bc			;02c6	c5 	. 
	pop de			;02c7	d1 	. 
	ld c,h			;02c8	4c 	L 
	ld c,a			;02c9	4f 	O 
	ld d,e			;02ca	53 	S 
	push bc			;02cb	c5 	. 
	jp nz,04e4fh		;02cc	c2 4f 4e 	. O N 
	call nc,04c99h		;02cf	d4 99 4c 	. . L 
	ld b,l			;02d2	45 	E 
	ld b,c			;02d3	41 	A 
	jp nc,04c92h		;02d4	d2 92 4c 	. . L 
	ld c,a			;02d7	4f 	O 
	ld b,c			;02d8	41 	A 
	call nz,0539bh		;02d9	c4 9b 53 	. . S 
	ld b,c			;02dc	41 	A 
	ld d,(hl)			;02dd	56 	V 
	push bc			;02de	c5 	. 
	sbc a,d			;02df	9a 	. 
	ld d,e			;02e0	53 	S 
	ld d,d			;02e1	52 	R 
	ld c,h			;02e2	4c 	L 
	ld c,c			;02e3	49 	I 
	adc a,0e2h		;02e4	ce e2 	. . 
	ld c,c			;02e6	49 	I 
	ld c,(hl)			;02e7	4e 	N 
	call nc,0531ch		;02e8	d4 1c 53 	. . S 
	ld c,(hl)			;02eb	4e 	N 
	rst 0			;02ec	c7 	. 
	dec e			;02ed	1d 	. 
	ld b,h			;02ee	44 	D 
	ld b,d			;02ef	42 	B 
	call z,0561eh		;02f0	cc 1e 56 	. . V 
	ret			;02f3	c9 	. 
	jr nz,l034ch		;02f4	20 56 	  V 
	out (021h),a		;02f6	d3 21 	. ! 
	ld d,(hl)			;02f8	56 	V 
	call nz,04f22h		;02f9	c4 22 4f 	. " O 
	out (00ch),a		;02fc	d3 0c 	. . 
	ld c,b			;02fe	48 	H 
	ld d,d			;02ff	52 	R 
	and h			;0300	a4 	. 
	ld d,041h		;0301	16 41 	. A 
	ld c,h			;0303	4c 	L 
	call z,04fb3h		;0304	cc b3 4f 	. . O 
	ld c,l			;0307	4d 	M 
	ld c,l			;0308	4d 	M 
	ld c,a			;0309	4f 	O 
	adc a,0b8h		;030a	ce b8 	. . 
	ld c,b			;030c	48 	H 
	ld b,c			;030d	41 	A 
	ld c,c			;030e	49 	I 
	adc a,0b9h		;030f	ce b9 	. . 
	ld c,h			;0311	4c 	L 
	out (0d0h),a		;0312	d3 d0 	. . 
	nop			;0314	00 	. 
	ld b,l			;0315	45 	E 
	ld c,h			;0316	4c 	L 
	ld b,l			;0317	45 	E 
	ld d,h			;0318	54 	T 
	push bc			;0319	c5 	. 
	xor c			;031a	a9 	. 
	ld b,c			;031b	41 	A 
	ld d,h			;031c	54 	T 
	pop bc			;031d	c1 	. 
	add a,h			;031e	84 	. 
	ld c,c			;031f	49 	I 
	call 04586h		;0320	cd 86 45 	. . E 
	ld b,(hl)			;0323	46 	F 
	ld d,e			;0324	53 	S 
	ld d,h			;0325	54 	T 
	jp nc,045ach		;0326	d2 ac 45 	. . E 
	ld b,(hl)			;0329	46 	F 
	ld c,c			;032a	49 	I 
	ld c,(hl)			;032b	4e 	N 
	call nc,045adh		;032c	d4 ad 45 	. . E 
	ld b,(hl)			;032f	46 	F 
	ld d,e			;0330	53 	S 
	ld c,(hl)			;0331	4e 	N 
	rst 0			;0332	c7 	. 
	xor (hl)			;0333	ae 	. 
	ld b,l			;0334	45 	E 
	ld b,(hl)			;0335	46 	F 
	ld b,h			;0336	44 	D 
	ld b,d			;0337	42 	B 
	call z,053afh		;0338	cc af 53 	. . S 
	ld c,e			;033b	4b 	K 
	ld c,a			;033c	4f 	O 
	and h			;033d	a4 	. 
	cp h			;033e	bc 	. 
	ld b,l			;033f	45 	E 
	add a,097h		;0340	c6 97 	. . 
	ld d,e			;0342	53 	S 
	ld c,e			;0343	4b 	K 
	ld c,c			;0344	49 	I 
	and h			;0345	a4 	. 
	call po,04b53h		;0346	e4 53 4b 	. S K 
	add a,023h		;0349	c6 23 	. # 
	nop			;034b	00 	. 
l034ch:
	ld c,h			;034c	4c 	L 
	ld d,e			;034d	53 	S 
	push bc			;034e	c5 	. 
	and c			;034f	a1 	. 
	ld c,(hl)			;0350	4e 	N 
	call nz,05281h		;0351	c4 81 52 	. . R 
	ld b,c			;0354	41 	A 
	ld d,e			;0355	53 	S 
	push bc			;0356	c5 	. 
	and l			;0357	a5 	. 
	ld b,h			;0358	44 	D 
	ld c,c			;0359	49 	I 
	call nc,052a6h		;035a	d4 a6 52 	. . R 
	ld d,d			;035d	52 	R 
	ld c,a			;035e	4f 	O 
	jp nc,052a7h		;035f	d2 a7 52 	. . R 
	call z,052dbh		;0362	cc db 52 	. . R 
	jp nc,058dch		;0365	d2 dc 58 	. . X 
	ret nc			;0368	d0 	. 
	dec bc			;0369	0b 	. 
	ld c,a			;036a	4f 	O 
	add a,024h		;036b	c6 24 	. $ 
	ld d,c			;036d	51 	Q 
	sub 0f9h		;036e	d6 f9 	. . 
	nop			;0370	00 	. 
	ld c,a			;0371	4f 	O 
	jp nc,04982h		;0372	d2 82 49 	. . I 
	ld b,l			;0375	45 	E 
	ld c,h			;0376	4c 	L 
	call nz,049beh		;0377	c4 be 49 	. . I 
	ld c,h			;037a	4c 	L 
	ld b,l			;037b	45 	E 
	out (0c5h),a		;037c	d3 c5 	. . 
	adc a,0d8h		;037e	ce d8 	. . 
	ld d,d			;0380	52 	R 
	push bc			;0381	c5 	. 
	rrca			;0382	0f 	. 
	ld c,c			;0383	49 	I 
	ret c			;0384	d8 	. 
	rra			;0385	1f 	. 
	ld d,b			;0386	50 	P 
	ld c,a			;0387	4f 	O 
	out (027h),a		;0388	d3 27 	. ' 
	nop			;038a	00 	. 
	ld c,a			;038b	4f 	O 
	ld d,h			;038c	54 	T 
	rst 8			;038d	cf 	. 
	adc a,c			;038e	89 	. 
	ld c,a			;038f	4f 	O 
	jr nz,86		;0390	20 54 	  T 
	rst 8			;0392	cf 	. 
	adc a,c			;0393	89 	. 
	ld c,a			;0394	4f 	O 
	ld d,e			;0395	53 	S 
	ld d,l			;0396	55 	U 
	jp nz,0458dh		;0397	c2 8d 45 	. . E 
	call nc,l00bfh		;039a	d4 bf 00 	. . . 
	ld b,l			;039d	45 	E 
	ld e,b			;039e	58 	X 
	and h			;039f	a4 	. 
	ld a,(de)			;03a0	1a 	. 
	nop			;03a1	00 	. 
	ld c,(hl)			;03a2	4e 	N 
	ld d,b			;03a3	50 	P 
	ld d,l			;03a4	55 	U 
	call nc,0c685h		;03a5	d4 85 c6 	. . . 
	adc a,e			;03a8	8b 	. 
	ld c,(hl)			;03a9	4e 	N 
	ld d,e			;03aa	53 	S 
	ld d,h			;03ab	54 	T 
	jp nc,04edfh		;03ac	d2 df 4e 	. . N 
	call nc,04e05h		;03af	d4 05 4e 	. . N 
	ret nc			;03b2	d0 	. 
	djnz l0402h		;03b3	10 4d 	. M 
	ret nc			;03b5	d0 	. 
	jp m,04b4eh		;03b6	fa 4e 4b 	. N K 
	ld b,l			;03b9	45 	E 
	ld e,c			;03ba	59 	Y 
	and h			;03bb	a4 	. 
	and 000h		;03bc	e6 00 	. . 
	nop			;03be	00 	. 
	ld c,c			;03bf	49 	I 
	ld c,h			;03c0	4c 	L 
	call z,045c7h		;03c1	cc c7 45 	. . E 
	exx			;03c4	d9 	. 
	sbc a,a			;03c5	9f 	. 
	nop			;03c6	00 	. 
	ld c,a			;03c7	4f 	O 
	ld b,e			;03c8	43 	C 
	ld b,c			;03c9	41 	A 
	ld d,h			;03ca	54 	T 
	push bc			;03cb	c5 	. 
	rst 8			;03cc	cf 	. 
	ld d,b			;03cd	50 	P 
	ld d,d			;03ce	52 	R 
	ld c,c			;03cf	49 	I 
	ld c,(hl)			;03d0	4e 	N 
	call nc,04c9dh		;03d1	d4 9d 4c 	. . L 
	ld c,c			;03d4	49 	I 
	ld d,e			;03d5	53 	S 
	call nc,0509eh		;03d6	d4 9e 50 	. . P 
	ld c,a			;03d9	4f 	O 
	out (01bh),a		;03da	d3 1b 	. . 
	ld b,l			;03dc	45 	E 
	call nc,04988h		;03dd	d4 88 49 	. . I 
	ld c,(hl)			;03e0	4e 	N 
	push bc			;03e1	c5 	. 
	or b			;03e2	b0 	. 
	ld c,a			;03e3	4f 	O 
	ld b,c			;03e4	41 	A 
	call nz,053c3h		;03e5	c4 c3 53 	. . S 
	ld b,l			;03e8	45 	E 
	call nc,049c8h		;03e9	d4 c8 49 	. . I 
	ld d,e			;03ec	53 	S 
	call nc,04693h		;03ed	d4 93 46 	. . F 
	ld c,c			;03f0	49 	I 
	ld c,h			;03f1	4c 	L 
	ld b,l			;03f2	45 	E 
	out (0cbh),a		;03f3	d3 cb 	. . 
	ld c,a			;03f5	4f 	O 
	rst 0			;03f6	c7 	. 
	ld a,(bc)			;03f7	0a 	. 
	ld c,a			;03f8	4f 	O 
	jp 04525h		;03f9	c3 25 45 	. % E 
	adc a,012h		;03fc	ce 12 	. . 
	ld b,l			;03fe	45 	E 
	ld b,(hl)			;03ff	46 	F 
	ld d,h			;0400	54 	T 
	and h			;0401	a4 	. 
l0402h:
	ld bc,0c64fh		;0402	01 4f c6 	. O . 
	ld h,000h		;0405	26 00 	& . 
	ld b,l			;0407	45 	E 
	ld d,d			;0408	52 	R 
	ld b,a			;0409	47 	G 
	push bc			;040a	c5 	. 
	call nz,0c44fh		;040b	c4 4f c4 	. O . 
	ei			;040e	fb 	. 
	ld c,e			;040f	4b 	K 
	ld c,c			;0410	49 	I 
	and h			;0411	a4 	. 
	jr z,77		;0412	28 4b 	( K 
	ld d,e			;0414	53 	S 
	and h			;0415	a4 	. 
	add hl,hl			;0416	29 	) 
	ld c,e			;0417	4b 	K 
	ld b,h			;0418	44 	D 
	and h			;0419	a4 	. 
	ld hl,(04449h)		;041a	2a 49 44 	* I D 
	and h			;041d	a4 	. 
l041eh:
	inc bc			;041e	03 	. 
	ld c,a			;041f	4f 	O 
	adc a,0b5h		;0420	ce b5 	. . 
	nop			;0422	00 	. 
	ld b,l			;0423	45 	E 
	ld e,b			;0424	58 	X 
	call nc,04183h		;0425	d4 83 41 	. . A 
	ld c,l			;0428	4d 	M 
	push bc			;0429	c5 	. 
	add a,045h		;042a	c6 45 	. E 
	rst 10h			;042c	d7 	. 
	sub h			;042d	94 	. 
	ld c,a			;042e	4f 	O 
	call nc,000dah		;042f	d4 da 00 	. . . 
	ld d,b			;0432	50 	P 
	ld b,l			;0433	45 	E 
	adc a,0bdh		;0434	ce bd 	. . 
	ld d,l			;0436	55 	U 
	call nc,0ce9ch		;0437	d4 9c ce 	. . . 
	sub l			;043a	95 	. 
	jp nc,043f7h		;043b	d2 f7 43 	. . C 
	ld d,h			;043e	54 	T 
	and h			;043f	a4 	. 
	add hl,de			;0440	19 	. 
	ld d,b			;0441	50 	P 
	ld d,h			;0442	54 	T 
	ld c,c			;0443	49 	I 
	ld c,a			;0444	4f 	O 
	adc a,0bah		;0445	ce ba 	. . 
	nop			;0447	00 	. 
	ld d,d			;0448	52 	R 
	ld c,c			;0449	49 	I 
	ld c,(hl)			;044a	4e 	N 
	call nc,05591h		;044b	d4 91 55 	. . U 
	call nc,04fc0h		;044e	d4 c0 4f 	. . O 
	ld c,e			;0451	4b 	K 
	push bc			;0452	c5 	. 
	sbc a,b			;0453	98 	. 
	ld c,a			;0454	4f 	O 
	out (011h),a		;0455	d3 11 	. . 
	ld b,l			;0457	45 	E 
	ld b,l			;0458	45 	E 
	rl a		;0459	cb 17 	. . 
	ld d,e			;045b	53 	S 
	ld b,l			;045c	45 	E 
	call nc,052cch		;045d	d4 cc 52 	. . R 
	ld b,l			;0460	45 	E 
	ld d,e			;0461	53 	S 
	ld b,l			;0462	45 	E 
	call nc,04fcdh		;0463	d4 cd 4f 	. . O 
	ld c,c			;0466	49 	I 
	ld c,(hl)			;0467	4e 	N 
	call nc,000e5h		;0468	d4 e5 00 	. . . 
	nop			;046b	00 	. 
	ld b,l			;046c	45 	E 
	ld d,h			;046d	54 	T 
	ld d,l			;046e	55 	U 
	ld d,d			;046f	52 	R 
	adc a,08eh		;0470	ce 8e 	. . 
	ld b,l			;0472	45 	E 
	ld b,c			;0473	41 	A 
	call nz,05587h		;0474	c4 87 55 	. . U 
	adc a,08ah		;0477	ce 8a 	. . 
	ld b,l			;0479	45 	E 
	ld d,e			;047a	53 	S 
	ld d,h			;047b	54 	T 
	ld c,a			;047c	4f 	O 
	ld d,d			;047d	52 	R 
	push bc			;047e	c5 	. 
	adc a,h			;047f	8c 	. 
	ld b,l			;0480	45 	E 
	call 0458fh		;0481	cd 8f 45 	. . E 
	ld d,e			;0484	53 	S 
	ld d,l			;0485	55 	U 
	ld c,l			;0486	4d 	M 
	push bc			;0487	c5 	. 
	xor b			;0488	a8 	. 
	ld d,e			;0489	53 	S 
	ld b,l			;048a	45 	E 
	call nc,049c9h		;048b	d4 c9 49 	. . I 
	ld b,a			;048e	47 	G 
	ld c,b			;048f	48 	H 
	ld d,h			;0490	54 	T 
	and h			;0491	a4 	. 
	ld (bc),a			;0492	02 	. 
	ld c,(hl)			;0493	4e 	N 
	call nz,04508h		;0494	c4 08 45 	. . E 
	ld c,(hl)			;0497	4e 	N 
	ld d,l			;0498	55 	U 
	call 041abh		;0499	cd ab 41 	. . A 
	ld c,(hl)			;049c	4e 	N 
	ld b,h			;049d	44 	D 
	ld c,a			;049e	4f 	O 
	ld c,l			;049f	4d 	M 
	ld c,c			;04a0	49 	I 
	ld e,d			;04a1	5a 	Z 
	push bc			;04a2	c5 	. 
	cp e			;04a3	bb 	. 
	nop			;04a4	00 	. 
	ld d,h			;04a5	54 	T 
	ld c,a			;04a6	4f 	O 
	ret nc			;04a7	d0 	. 
	sub b			;04a8	90 	. 
	ld d,a			;04a9	57 	W 
	ld b,c			;04aa	41 	A 
	ret nc			;04ab	d0 	. 
	and h			;04ac	a4 	. 
	ld b,l			;04ad	45 	E 
	call nc,041c1h		;04ae	d4 c1 41 	. . A 
	ld d,(hl)			;04b1	56 	V 
	push bc			;04b2	c5 	. 
	jp z,04350h		;04b3	ca 50 43 	. P C 
	xor b			;04b6	a8 	. 
	exx			;04b7	d9 	. 
	ld d,h			;04b8	54 	T 
	ld b,l			;04b9	45 	E 
	ret nc			;04ba	d0 	. 
	sub 047h		;04bb	d6 47 	. G 
	adc a,004h		;04bd	ce 04 	. . 
	ld d,c			;04bf	51 	Q 
	jp nc,04907h		;04c0	d2 07 49 	. . I 
	adc a,009h		;04c3	ce 09 	. . 
	ld d,h			;04c5	54 	T 
	ld d,d			;04c6	52 	R 
	and h			;04c7	a4 	. 
	inc de			;04c8	13 	. 
	ld d,h			;04c9	54 	T 
	ld d,d			;04ca	52 	R 
	ld c,c			;04cb	49 	I 
	ld c,(hl)			;04cc	4e 	N 
	ld b,a			;04cd	47 	G 
	and h			;04ce	a4 	. 
	defb 0ddh,050h,041h	;illegal sequence		;04cf	dd 50 41 	. P A 
	ld b,e			;04d2	43 	C 
	ld b,l			;04d3	45 	E 
	and h			;04d4	a4 	. 
	jr l04d7h		;04d5	18 00 	. . 
l04d7h:
	ld c,b			;04d7	48 	H 
	ld b,l			;04d8	45 	E 
	adc a,0d4h		;04d9	ce d4 	. . 
	ld d,d			;04db	52 	R 
	ld c,a			;04dc	4f 	O 
	adc a,0a2h		;04dd	ce a2 	. . 
	ld d,d			;04df	52 	R 
	ld c,a			;04e0	4f 	O 
	ld b,(hl)			;04e1	46 	F 
	add a,0a3h		;04e2	c6 a3 	. . 
	ld b,c			;04e4	41 	A 
	ld b,d			;04e5	42 	B 
	xor b			;04e6	a8 	. 
	push de			;04e7	d5 	. 
	rst 8			;04e8	cf 	. 
	out (041h),a		;04e9	d3 41 	. A 
	adc a,00dh		;04eb	ce 0d 	. . 
	nop			;04ed	00 	. 
	ld d,e			;04ee	53 	S 
	ld c,c			;04ef	49 	I 
	ld c,(hl)			;04f0	4e 	N 
	rst 0			;04f1	c7 	. 
	sbc a,053h		;04f2	de 53 	. S 
	jp nc,000d7h		;04f4	d2 d7 00 	. . . 
	ld b,c			;04f7	41 	A 
	call z,04114h		;04f8	cc 14 41 	. . A 
	ld d,d			;04fb	52 	R 
	ld d,b			;04fc	50 	P 
	ld d,h			;04fd	54 	T 
	jp nc,000e1h		;04fe	d2 e1 00 	. . . 
l0501h:
	ld c,c			;0501	49 	I 
	ld b,h			;0502	44 	D 
	ld d,h			;0503	54 	T 
	ret z			;0504	c8 	. 
	and b			;0505	a0 	. 
	ld b,c			;0506	41 	A 
	ld c,c			;0507	49 	I 
	call nc,04896h		;0508	d4 96 48 	. . H 
	ld c,c			;050b	49 	I 
	ld c,h			;050c	4c 	L 
	push bc			;050d	c5 	. 
	or c			;050e	b1 	. 
	ld b,l			;050f	45 	E 
	ld c,(hl)			;0510	4e 	N 
	call nz,052b2h		;0511	c4 b2 52 	. . R 
	ld c,c			;0514	49 	I 
	ld d,h			;0515	54 	T 
	push bc			;0516	c5 	. 
	or a			;0517	b7 	. 
	nop			;0518	00 	. 
	ld c,a			;0519	4f 	O 
	jp nc,l00f8h		;051a	d2 f8 00 	. . . 
	nop			;051d	00 	. 
l051eh:
	nop			;051e	00 	. 
l051fh:
	xor e			;051f	ab 	. 
	pop af			;0520	f1 	. 
	xor l			;0521	ad 	. 
	jp p,0f3aah		;0522	f2 aa f3 	. . . 
	xor a			;0525	af 	. 
	call p,0f5deh		;0526	f4 de f5 	. . . 
	call c,0a7fch		;0529	dc fc a7 	. . . 
	ret po			;052c	e0 	. 
	cp (hl)			;052d	be 	. 
	xor 0bdh		;052e	ee bd 	. . 
l0530h:
	rst 28h			;0530	ef 	. 
	cp h			;0531	bc 	. 
	ret p			;0532	f0 	. 
	nop			;0533	00 	. 
l0534h:
	ld a,c			;0534	79 	y 
	ld a,c			;0535	79 	y 
	ld a,h			;0536	7c 	| 
	ld a,h			;0537	7c 	| 
	ld a,a			;0538	7f 	 
	ld d,b			;0539	50 	P 
	ld b,(hl)			;053a	46 	F 
	inc a			;053b	3c 	< 
	ld (07a28h),a		;053c	32 28 7a 	2 ( z 
	ld a,e			;053f	7b 	{ 
l0540h:
	sbc a,d			;0540	9a 	. 
	jr c,l0543h		;0541	38 00 	8 . 
l0543h:
	nop			;0543	00 	. 
	jp pe,0b837h		;0544	ea 37 b8 	. 7 . 
	jr c,20		;0547	38 12 	8 . 
	jr c,l0501h		;0549	38 b6 	8 . 
	ld l,0a8h		;054b	2e a8 	. . 
	ld l,024h		;054d	2e 24 	. $ 
	jr nc,l0530h		;054f	30 df 	0 . 
	jr nc,l0530h		;0551	30 dd 	0 . 
	ld b,b			;0553	40 	@ 
	ex (sp),hl			;0554	e3 	. 
	scf			;0555	37 	7 
l0556h:
	inc l			;0556	2c 	, 
	dec sp			;0557	3b 	; 
	dec (hl)			;0558	35 	5 
	dec sp			;0559	3b 	; 
	ld a,(0453bh)		;055a	3a 3b 45 	: ; E 
	dec sp			;055d	3b 	; 
	adc a,040h		;055e	ce 40 	. @ 
	add a,l			;0560	85 	. 
	scf			;0561	37 	7 
l0562h:
	ret nc			;0562	d0 	. 
	add hl,sp			;0563	39 	9 
	push bc			;0564	c5 	. 
	add hl,sp			;0565	39 	9 
	pop af			;0566	f1 	. 
	add hl,sp			;0567	39 	9 
	sbc a,l			;0568	9d 	. 
	rla			;0569	17 	. 
	ld c,a			;056a	4f 	O 
	ld b,c			;056b	41 	A 
	xor a			;056c	af 	. 
	scf			;056d	37 	7 
l056eh:
	nop			;056e	00 	. 
	ld c,(hl)			;056f	4e 	N 
	ld b,l			;0570	45 	E 
	ld e,b			;0571	58 	X 
	ld d,h			;0572	54 	T 
	jr nz,l05ech		;0573	20 77 	  w 
	ld l,c			;0575	69 	i 
	ld (hl),h			;0576	74 	t 
	ld l,b			;0577	68 	h 
	ld l,a			;0578	6f 	o 
	ld (hl),l			;0579	75 	u 
	ld (hl),h			;057a	74 	t 
	jr nz,l05c3h		;057b	20 46 	  F 
	ld c,a			;057d	4f 	O 
	ld d,d			;057e	52 	R 
	nop			;057f	00 	. 
	ld d,e			;0580	53 	S 
	ld a,c			;0581	79 	y 
	ld l,(hl)			;0582	6e 	n 
	ld (hl),h			;0583	74 	t 
	ld h,c			;0584	61 	a 
	ld a,b			;0585	78 	x 
	jr nz,l05edh		;0586	20 65 	  e 
	ld (hl),d			;0588	72 	r 
	ld (hl),d			;0589	72 	r 
	ld l,a			;058a	6f 	o 
	ld (hl),d			;058b	72 	r 
	nop			;058c	00 	. 
	ld d,d			;058d	52 	R 
	ld b,l			;058e	45 	E 
	ld d,h			;058f	54 	T 
	ld d,l			;0590	55 	U 
	ld d,d			;0591	52 	R 
	ld c,(hl)			;0592	4e 	N 
	jr nz,l060ch		;0593	20 77 	  w 
	ld l,c			;0595	69 	i 
	ld (hl),h			;0596	74 	t 
	ld l,b			;0597	68 	h 
	ld l,a			;0598	6f 	o 
	ld (hl),l			;0599	75 	u 
	ld (hl),h			;059a	74 	t 
	jr nz,l05e4h		;059b	20 47 	  G 
	ld c,a			;059d	4f 	O 
	ld d,e			;059e	53 	S 
	ld d,l			;059f	55 	U 
	ld b,d			;05a0	42 	B 
	nop			;05a1	00 	. 
	ld c,a			;05a2	4f 	O 
	ld (hl),l			;05a3	75 	u 
	ld (hl),h			;05a4	74 	t 
	jr nz,l0616h		;05a5	20 6f 	  o 
	ld h,(hl)			;05a7	66 	f 
	jr nz,l05eeh		;05a8	20 44 	  D 
	ld b,c			;05aa	41 	A 
	ld d,h			;05ab	54 	T 
	ld b,c			;05ac	41 	A 
	nop			;05ad	00 	. 
	ld c,c			;05ae	49 	I 
	ld l,h			;05af	6c 	l 
	ld l,h			;05b0	6c 	l 
	ld h,l			;05b1	65 	e 
	ld h,a			;05b2	67 	g 
	ld h,c			;05b3	61 	a 
	ld l,h			;05b4	6c 	l 
	jr nz,l061dh		;05b5	20 66 	  f 
	ld (hl),l			;05b7	75 	u 
	ld l,(hl)			;05b8	6e 	n 
	ld h,e			;05b9	63 	c 
	ld (hl),h			;05ba	74 	t 
	ld l,c			;05bb	69 	i 
	ld l,a			;05bc	6f 	o 
	ld l,(hl)			;05bd	6e 	n 
	jr nz,l0623h		;05be	20 63 	  c 
	ld h,c			;05c0	61 	a 
	ld l,h			;05c1	6c 	l 
	ld l,h			;05c2	6c 	l 
l05c3h:
	nop			;05c3	00 	. 
l05c4h:
	ld c,a			;05c4	4f 	O 
	halt			;05c5	76 	v 
	ld h,l			;05c6	65 	e 
	ld (hl),d			;05c7	72 	r 
	ld h,(hl)			;05c8	66 	f 
	ld l,h			;05c9	6c 	l 
	ld l,a			;05ca	6f 	o 
	ld (hl),a			;05cb	77 	w 
	nop			;05cc	00 	. 
	ld c,a			;05cd	4f 	O 
	ld (hl),l			;05ce	75 	u 
	ld (hl),h			;05cf	74 	t 
	jr nz,l0641h		;05d0	20 6f 	  o 
	ld h,(hl)			;05d2	66 	f 
	jr nz,111		;05d3	20 6d 	  m 
	ld h,l			;05d5	65 	e 
	ld l,l			;05d6	6d 	m 
	ld l,a			;05d7	6f 	o 
	ld (hl),d			;05d8	72 	r 
	ld a,c			;05d9	79 	y 
	nop			;05da	00 	. 
	ld d,l			;05db	55 	U 
	ld l,(hl)			;05dc	6e 	n 
	ld h,h			;05dd	64 	d 
	ld h,l			;05de	65 	e 
	ld h,(hl)			;05df	66 	f 
	ld l,c			;05e0	69 	i 
	ld l,(hl)			;05e1	6e 	n 
	ld h,l			;05e2	65 	e 
	ld h,h			;05e3	64 	d 
l05e4h:
	jr nz,110		;05e4	20 6c 	  l 
	ld l,c			;05e6	69 	i 
	ld l,(hl)			;05e7	6e 	n 
	ld h,l			;05e8	65 	e 
	jr nz,112		;05e9	20 6e 	  n 
	ld (hl),l			;05eb	75 	u 
l05ech:
	ld l,l			;05ec	6d 	m 
l05edh:
	ld h,d			;05ed	62 	b 
l05eeh:
	ld h,l			;05ee	65 	e 
	ld (hl),d			;05ef	72 	r 
	nop			;05f0	00 	. 
	ld d,e			;05f1	53 	S 
	ld (hl),l			;05f2	75 	u 
	ld h,d			;05f3	62 	b 
	ld (hl),e			;05f4	73 	s 
	ld h,e			;05f5	63 	c 
	ld (hl),d			;05f6	72 	r 
	ld l,c			;05f7	69 	i 
	ld (hl),b			;05f8	70 	p 
	ld (hl),h			;05f9	74 	t 
	jr nz,l066bh		;05fa	20 6f 	  o 
	ld (hl),l			;05fc	75 	u 
	ld (hl),h			;05fd	74 	t 
	jr nz,l066fh		;05fe	20 6f 	  o 
	ld h,(hl)			;0600	66 	f 
	jr nz,l0675h		;0601	20 72 	  r 
	ld h,c			;0603	61 	a 
	ld l,(hl)			;0604	6e 	n 
	ld h,a			;0605	67 	g 
	ld h,l			;0606	65 	e 
	nop			;0607	00 	. 
	ld b,h			;0608	44 	D 
	ld (hl),l			;0609	75 	u 
	ld (hl),b			;060a	70 	p 
	ld l,h			;060b	6c 	l 
l060ch:
	ld l,c			;060c	69 	i 
	ld h,e			;060d	63 	c 
	ld h,c			;060e	61 	a 
	ld (hl),h			;060f	74 	t 
	ld h,l			;0610	65 	e 
	jr nz,l0657h		;0611	20 44 	  D 
	ld h,l			;0613	65 	e 
	ld h,(hl)			;0614	66 	f 
	ld l,c			;0615	69 	i 
l0616h:
	ld l,(hl)			;0616	6e 	n 
	ld l,c			;0617	69 	i 
	ld (hl),h			;0618	74 	t 
	ld l,c			;0619	69 	i 
	ld l,a			;061a	6f 	o 
	ld l,(hl)			;061b	6e 	n 
	nop			;061c	00 	. 
l061dh:
	ld b,h			;061d	44 	D 
l061eh:
	ld l,c			;061e	69 	i 
	halt			;061f	76 	v 
	ld l,c			;0620	69 	i 
	ld (hl),e			;0621	73 	s 
	ld l,c			;0622	69 	i 
l0623h:
	ld l,a			;0623	6f 	o 
	ld l,(hl)			;0624	6e 	n 
	jr nz,l0689h		;0625	20 62 	  b 
	ld a,c			;0627	79 	y 
	jr nz,l06a4h		;0628	20 7a 	  z 
	ld h,l			;062a	65 	e 
	ld (hl),d			;062b	72 	r 
	ld l,a			;062c	6f 	o 
	nop			;062d	00 	. 
	ld c,c			;062e	49 	I 
	ld l,h			;062f	6c 	l 
	ld l,h			;0630	6c 	l 
	ld h,l			;0631	65 	e 
	ld h,a			;0632	67 	g 
	ld h,c			;0633	61 	a 
	ld l,h			;0634	6c 	l 
	jr nz,l069bh		;0635	20 64 	  d 
	ld l,c			;0637	69 	i 
	ld (hl),d			;0638	72 	r 
	ld h,l			;0639	65 	e 
	ld h,e			;063a	63 	c 
	ld (hl),h			;063b	74 	t 
	nop			;063c	00 	. 
	ld d,h			;063d	54 	T 
	ld a,c			;063e	79 	y 
	ld (hl),b			;063f	70 	p 
	ld h,l			;0640	65 	e 
l0641h:
	jr nz,l06b0h		;0641	20 6d 	  m 
	ld l,c			;0643	69 	i 
	ld (hl),e			;0644	73 	s 
	ld l,l			;0645	6d 	m 
	ld h,c			;0646	61 	a 
	ld (hl),h			;0647	74 	t 
	ld h,e			;0648	63 	c 
	ld l,b			;0649	68 	h 
	nop			;064a	00 	. 
	ld c,a			;064b	4f 	O 
	ld (hl),l			;064c	75 	u 
	ld (hl),h			;064d	74 	t 
	jr nz,l06bfh		;064e	20 6f 	  o 
	ld h,(hl)			;0650	66 	f 
	jr nz,l06c6h		;0651	20 73 	  s 
	ld (hl),h			;0653	74 	t 
	ld (hl),d			;0654	72 	r 
	ld l,c			;0655	69 	i 
	ld l,(hl)			;0656	6e 	n 
l0657h:
	ld h,a			;0657	67 	g 
	jr nz,l06cdh		;0658	20 73 	  s 
	ld (hl),b			;065a	70 	p 
	ld h,c			;065b	61 	a 
	ld h,e			;065c	63 	c 
	ld h,l			;065d	65 	e 
	nop			;065e	00 	. 
	ld d,e			;065f	53 	S 
	ld (hl),h			;0660	74 	t 
	ld (hl),d			;0661	72 	r 
	ld l,c			;0662	69 	i 
	ld l,(hl)			;0663	6e 	n 
	ld h,a			;0664	67 	g 
	jr nz,l06dbh		;0665	20 74 	  t 
	ld l,a			;0667	6f 	o 
	ld l,a			;0668	6f 	o 
	jr nz,l06d7h		;0669	20 6c 	  l 
l066bh:
	ld l,a			;066b	6f 	o 
	ld l,(hl)			;066c	6e 	n 
	ld h,a			;066d	67 	g 
	nop			;066e	00 	. 
l066fh:
	ld d,e			;066f	53 	S 
	ld (hl),h			;0670	74 	t 
	ld (hl),d			;0671	72 	r 
	ld l,c			;0672	69 	i 
	ld l,(hl)			;0673	6e 	n 
	ld h,a			;0674	67 	g 
l0675h:
	jr nz,l06ddh		;0675	20 66 	  f 
	ld l,a			;0677	6f 	o 
	ld (hl),d			;0678	72 	r 
	ld l,l			;0679	6d 	m 
	ld (hl),l			;067a	75 	u 
	ld l,h			;067b	6c 	l 
	ld h,c			;067c	61 	a 
	jr nz,l06f3h		;067d	20 74 	  t 
	ld l,a			;067f	6f 	o 
	ld l,a			;0680	6f 	o 
	jr nz,l06e6h		;0681	20 63 	  c 
	ld l,a			;0683	6f 	o 
	ld l,l			;0684	6d 	m 
	ld (hl),b			;0685	70 	p 
	ld l,h			;0686	6c 	l 
	ld h,l			;0687	65 	e 
	ld a,b			;0688	78 	x 
l0689h:
	nop			;0689	00 	. 
	ld b,e			;068a	43 	C 
	ld h,c			;068b	61 	a 
	ld l,(hl)			;068c	6e 	n 
	daa			;068d	27 	' 
	ld (hl),h			;068e	74 	t 
	jr nz,l06f4h		;068f	20 63 	  c 
	ld l,a			;0691	6f 	o 
	ld l,(hl)			;0692	6e 	n 
	ld (hl),h			;0693	74 	t 
	ld l,c			;0694	69 	i 
	ld l,(hl)			;0695	6e 	n 
	ld (hl),l			;0696	75 	u 
	ld h,l			;0697	65 	e 
	nop			;0698	00 	. 
	ld d,l			;0699	55 	U 
	ld l,(hl)			;069a	6e 	n 
l069bh:
	ld h,h			;069b	64 	d 
	ld h,l			;069c	65 	e 
	ld h,(hl)			;069d	66 	f 
	ld l,c			;069e	69 	i 
	ld l,(hl)			;069f	6e 	n 
	ld h,l			;06a0	65 	e 
	ld h,h			;06a1	64 	d 
	jr nz,l0719h		;06a2	20 75 	  u 
l06a4h:
	ld (hl),e			;06a4	73 	s 
	ld h,l			;06a5	65 	e 
	ld (hl),d			;06a6	72 	r 
	jr nz,l070fh		;06a7	20 66 	  f 
	ld (hl),l			;06a9	75 	u 
	ld l,(hl)			;06aa	6e 	n 
	ld h,e			;06ab	63 	c 
	ld (hl),h			;06ac	74 	t 
	ld l,c			;06ad	69 	i 
	ld l,a			;06ae	6f 	o 
	ld l,(hl)			;06af	6e 	n 
l06b0h:
	nop			;06b0	00 	. 
	ld c,(hl)			;06b1	4e 	N 
	ld l,a			;06b2	6f 	o 
	jr nz,l0707h		;06b3	20 52 	  R 
	ld b,l			;06b5	45 	E 
	ld d,e			;06b6	53 	S 
	ld d,l			;06b7	55 	U 
	ld c,l			;06b8	4d 	M 
	ld b,l			;06b9	45 	E 
	nop			;06ba	00 	. 
	ld d,d			;06bb	52 	R 
	ld b,l			;06bc	45 	E 
	ld d,e			;06bd	53 	S 
	ld d,l			;06be	55 	U 
l06bfh:
	ld c,l			;06bf	4d 	M 
	ld b,l			;06c0	45 	E 
	jr nz,l073ah		;06c1	20 77 	  w 
	ld l,c			;06c3	69 	i 
	ld (hl),h			;06c4	74 	t 
	ld l,b			;06c5	68 	h 
l06c6h:
	ld l,a			;06c6	6f 	o 
	ld (hl),l			;06c7	75 	u 
	ld (hl),h			;06c8	74 	t 
	jr nz,l0730h		;06c9	20 65 	  e 
	ld (hl),d			;06cb	72 	r 
	ld (hl),d			;06cc	72 	r 
l06cdh:
	ld l,a			;06cd	6f 	o 
	ld (hl),d			;06ce	72 	r 
	nop			;06cf	00 	. 
	ld d,l			;06d0	55 	U 
	ld l,(hl)			;06d1	6e 	n 
	ld (hl),b			;06d2	70 	p 
	ld (hl),d			;06d3	72 	r 
	ld l,c			;06d4	69 	i 
	ld l,(hl)			;06d5	6e 	n 
	ld (hl),h			;06d6	74 	t 
l06d7h:
	ld h,c			;06d7	61 	a 
	ld h,d			;06d8	62 	b 
	ld l,h			;06d9	6c 	l 
	ld h,l			;06da	65 	e 
l06dbh:
	jr nz,l0742h		;06db	20 65 	  e 
l06ddh:
	ld (hl),d			;06dd	72 	r 
	ld (hl),d			;06de	72 	r 
	ld l,a			;06df	6f 	o 
	ld (hl),d			;06e0	72 	r 
	nop			;06e1	00 	. 
	ld c,l			;06e2	4d 	M 
	ld l,c			;06e3	69 	i 
	ld (hl),e			;06e4	73 	s 
	ld (hl),e			;06e5	73 	s 
l06e6h:
	ld l,c			;06e6	69 	i 
	ld l,(hl)			;06e7	6e 	n 
	ld h,a			;06e8	67 	g 
	jr nz,l075ah		;06e9	20 6f 	  o 
	ld (hl),b			;06eb	70 	p 
	ld h,l			;06ec	65 	e 
	ld (hl),d			;06ed	72 	r 
	ld h,c			;06ee	61 	a 
	ld l,(hl)			;06ef	6e 	n 
	ld h,h			;06f0	64 	d 
	nop			;06f1	00 	. 
	ld c,h			;06f2	4c 	L 
l06f3h:
	ld l,c			;06f3	69 	i 
l06f4h:
	ld l,(hl)			;06f4	6e 	n 
	ld h,l			;06f5	65 	e 
	jr nz,l075ah		;06f6	20 62 	  b 
	ld (hl),l			;06f8	75 	u 
	ld h,(hl)			;06f9	66 	f 
	ld h,(hl)			;06fa	66 	f 
	ld h,l			;06fb	65 	e 
	ld (hl),d			;06fc	72 	r 
	jr nz,l076eh		;06fd	20 6f 	  o 
	halt			;06ff	76 	v 
	ld h,l			;0700	65 	e 
	ld (hl),d			;0701	72 	r 
	ld h,(hl)			;0702	66 	f 
	ld l,h			;0703	6c 	l 
	ld l,a			;0704	6f 	o 
	ld (hl),a			;0705	77 	w 
	nop			;0706	00 	. 
l0707h:
	ld b,h			;0707	44 	D 
	ld h,l			;0708	65 	e 
	halt			;0709	76 	v 
	ld l,c			;070a	69 	i 
	ld h,e			;070b	63 	c 
	ld h,l			;070c	65 	e 
	jr nz,l0758h		;070d	20 49 	  I 
l070fh:
	cpl			;070f	2f 	/ 
	ld c,a			;0710	4f 	O 
	jr nz,l0778h		;0711	20 65 	  e 
	ld (hl),d			;0713	72 	r 
	ld (hl),d			;0714	72 	r 
	ld l,a			;0715	6f 	o 
	ld (hl),d			;0716	72 	r 
	nop			;0717	00 	. 
	ccf			;0718	3f 	? 
l0719h:
	nop			;0719	00 	. 
	ccf			;071a	3f 	? 
	nop			;071b	00 	. 
	ld b,(hl)			;071c	46 	F 
	ld c,a			;071d	4f 	O 
	ld d,d			;071e	52 	R 
	jr nz,l0778h		;071f	20 57 	  W 
	ld l,c			;0721	69 	i 
	ld (hl),h			;0722	74 	t 
	ld l,b			;0723	68 	h 
	ld l,a			;0724	6f 	o 
	ld (hl),l			;0725	75 	u 
	ld (hl),h			;0726	74 	t 
	jr nz,l0777h		;0727	20 4e 	  N 
	ld b,l			;0729	45 	E 
	ld e,b			;072a	58 	X 
	ld d,h			;072b	54 	T 
	nop			;072c	00 	. 
	ccf			;072d	3f 	? 
	nop			;072e	00 	. 
	ccf			;072f	3f 	? 
l0730h:
	nop			;0730	00 	. 
	ld d,a			;0731	57 	W 
	ld c,b			;0732	48 	H 
	ld c,c			;0733	49 	I 
	ld c,h			;0734	4c 	L 
	ld b,l			;0735	45 	E 
	jr nz,121		;0736	20 77 	  w 
	ld l,c			;0738	69 	i 
	ld (hl),h			;0739	74 	t 
l073ah:
	ld l,b			;073a	68 	h 
	ld l,a			;073b	6f 	o 
	ld (hl),l			;073c	75 	u 
	ld (hl),h			;073d	74 	t 
	jr nz,l0797h		;073e	20 57 	  W 
	ld b,l			;0740	45 	E 
	ld c,(hl)			;0741	4e 	N 
l0742h:
	ld b,h			;0742	44 	D 
	nop			;0743	00 	. 
	ld d,a			;0744	57 	W 
	ld b,l			;0745	45 	E 
	ld c,(hl)			;0746	4e 	N 
	ld b,h			;0747	44 	D 
	jr nz,l07c1h		;0748	20 77 	  w 
	ld l,c			;074a	69 	i 
	ld (hl),h			;074b	74 	t 
	ld l,b			;074c	68 	h 
	ld l,a			;074d	6f 	o 
	ld (hl),l			;074e	75 	u 
	ld (hl),h			;074f	74 	t 
	jr nz,l07a9h		;0750	20 57 	  W 
	ld c,b			;0752	48 	H 
	ld c,c			;0753	49 	I 
	ld c,h			;0754	4c 	L 
	ld b,l			;0755	45 	E 
	nop			;0756	00 	. 
	ld b,(hl)			;0757	46 	F 
l0758h:
	ld c,c			;0758	49 	I 
	ld b,l			;0759	45 	E 
l075ah:
	ld c,h			;075a	4c 	L 
	ld b,h			;075b	44 	D 
	jr nz,l07cdh		;075c	20 6f 	  o 
	halt			;075e	76 	v 
	ld h,l			;075f	65 	e 
	ld (hl),d			;0760	72 	r 
	ld h,(hl)			;0761	66 	f 
	ld l,h			;0762	6c 	l 
	ld l,a			;0763	6f 	o 
	ld (hl),a			;0764	77 	w 
	nop			;0765	00 	. 
	ld c,c			;0766	49 	I 
	ld l,(hl)			;0767	6e 	n 
	ld (hl),h			;0768	74 	t 
	ld h,l			;0769	65 	e 
	ld (hl),d			;076a	72 	r 
	ld l,(hl)			;076b	6e 	n 
	ld h,c			;076c	61 	a 
	ld l,h			;076d	6c 	l 
l076eh:
	jr nz,l07d5h		;076e	20 65 	  e 
	ld (hl),d			;0770	72 	r 
	ld (hl),d			;0771	72 	r 
	ld l,a			;0772	6f 	o 
	ld (hl),d			;0773	72 	r 
	nop			;0774	00 	. 
	ld b,d			;0775	42 	B 
	ld h,c			;0776	61 	a 
l0777h:
	ld h,h			;0777	64 	d 
l0778h:
	jr nz,l07e0h		;0778	20 66 	  f 
	ld l,c			;077a	69 	i 
	ld l,h			;077b	6c 	l 
	ld h,l			;077c	65 	e 
	jr nz,l07edh		;077d	20 6e 	  n 
	ld (hl),l			;077f	75 	u 
	ld l,l			;0780	6d 	m 
	ld h,d			;0781	62 	b 
	ld h,l			;0782	65 	e 
	ld (hl),d			;0783	72 	r 
	nop			;0784	00 	. 
	ld b,(hl)			;0785	46 	F 
	ld l,c			;0786	69 	i 
	ld l,h			;0787	6c 	l 
	ld h,l			;0788	65 	e 
	jr nz,l07f9h		;0789	20 6e 	  n 
	ld l,a			;078b	6f 	o 
	ld (hl),h			;078c	74 	t 
	jr nz,l07f5h		;078d	20 66 	  f 
	ld l,a			;078f	6f 	o 
	ld (hl),l			;0790	75 	u 
	ld l,(hl)			;0791	6e 	n 
	ld h,h			;0792	64 	d 
	nop			;0793	00 	. 
	ld b,(hl)			;0794	46 	F 
	ld l,c			;0795	69 	i 
	ld l,h			;0796	6c 	l 
l0797h:
	ld h,l			;0797	65 	e 
	jr nz,l07fbh		;0798	20 61 	  a 
	ld l,h			;079a	6c 	l 
	ld (hl),d			;079b	72 	r 
	ld h,l			;079c	65 	e 
	ld h,c			;079d	61 	a 
	ld h,h			;079e	64 	d 
	ld a,c			;079f	79 	y 
	jr nz,l0811h		;07a0	20 6f 	  o 
	ld (hl),b			;07a2	70 	p 
	ld h,l			;07a3	65 	e 
	ld l,(hl)			;07a4	6e 	n 
	nop			;07a5	00 	. 
	ld b,h			;07a6	44 	D 
	ld l,c			;07a7	69 	i 
	ld (hl),e			;07a8	73 	s 
l07a9h:
	ld l,e			;07a9	6b 	k 
	jr nz,l081ah		;07aa	20 6e 	  n 
	ld l,a			;07ac	6f 	o 
	ld (hl),h			;07ad	74 	t 
	jr nz,l081dh		;07ae	20 6d 	  m 
	ld l,a			;07b0	6f 	o 
	ld (hl),l			;07b1	75 	u 
	ld l,(hl)			;07b2	6e 	n 
	ld (hl),h			;07b3	74 	t 
	ld h,l			;07b4	65 	e 
	ld h,h			;07b5	64 	d 
	nop			;07b6	00 	. 
	ld b,h			;07b7	44 	D 
	ld l,c			;07b8	69 	i 
	ld (hl),e			;07b9	73 	s 
	ld l,e			;07ba	6b 	k 
	jr nz,75		;07bb	20 49 	  I 
	cpl			;07bd	2f 	/ 
	ld c,a			;07be	4f 	O 
	jr nz,l0826h		;07bf	20 65 	  e 
l07c1h:
	ld (hl),d			;07c1	72 	r 
	ld (hl),d			;07c2	72 	r 
	ld l,a			;07c3	6f 	o 
	ld (hl),d			;07c4	72 	r 
	nop			;07c5	00 	. 
	ld b,(hl)			;07c6	46 	F 
	ld l,c			;07c7	69 	i 
	ld l,h			;07c8	6c 	l 
	ld h,l			;07c9	65 	e 
	jr nz,l082dh		;07ca	20 61 	  a 
	ld l,h			;07cc	6c 	l 
l07cdh:
	ld (hl),d			;07cd	72 	r 
	ld h,l			;07ce	65 	e 
	ld h,c			;07cf	61 	a 
	ld h,h			;07d0	64 	d 
	ld a,c			;07d1	79 	y 
	jr nz,l0839h		;07d2	20 65 	  e 
	ld a,b			;07d4	78 	x 
l07d5h:
	ld l,c			;07d5	69 	i 
	ld (hl),e			;07d6	73 	s 
	ld (hl),h			;07d7	74 	t 
	ld (hl),e			;07d8	73 	s 
	nop			;07d9	00 	. 
	ccf			;07da	3f 	? 
	nop			;07db	00 	. 
	ld b,h			;07dc	44 	D 
	ld l,c			;07dd	69 	i 
	ld (hl),e			;07de	73 	s 
	ld l,e			;07df	6b 	k 
l07e0h:
	jr nz,l0843h		;07e0	20 61 	  a 
	ld l,h			;07e2	6c 	l 
	ld (hl),d			;07e3	72 	r 
	ld h,l			;07e4	65 	e 
	ld h,c			;07e5	61 	a 
	ld h,h			;07e6	64 	d 
	ld a,c			;07e7	79 	y 
	jr nz,l0857h		;07e8	20 6d 	  m 
	ld l,a			;07ea	6f 	o 
	ld (hl),l			;07eb	75 	u 
	ld l,(hl)			;07ec	6e 	n 
l07edh:
	ld (hl),h			;07ed	74 	t 
	ld h,l			;07ee	65 	e 
	ld h,h			;07ef	64 	d 
	nop			;07f0	00 	. 
	ld b,h			;07f1	44 	D 
	ld l,c			;07f2	69 	i 
	ld (hl),e			;07f3	73 	s 
	ld l,e			;07f4	6b 	k 
l07f5h:
	jr nz,l085dh		;07f5	20 66 	  f 
	ld (hl),l			;07f7	75 	u 
	ld l,h			;07f8	6c 	l 
l07f9h:
	ld l,h			;07f9	6c 	l 
	nop			;07fa	00 	. 
l07fbh:
	ld c,c			;07fb	49 	I 
	ld l,(hl)			;07fc	6e 	n 
	ld (hl),b			;07fd	70 	p 
	ld (hl),l			;07fe	75 	u 
	ld (hl),h			;07ff	74 	t 
	jr nz,l0872h		;0800	20 70 	  p 
	ld h,c			;0802	61 	a 
	ld (hl),e			;0803	73 	s 
	ld (hl),h			;0804	74 	t 
	jr nz,l086ch		;0805	20 65 	  e 
	ld l,(hl)			;0807	6e 	n 
	ld h,h			;0808	64 	d 
	nop			;0809	00 	. 
	ld b,d			;080a	42 	B 
	ld h,c			;080b	61 	a 
	ld h,h			;080c	64 	d 
	jr nz,l0875h		;080d	20 66 	  f 
	ld l,c			;080f	69 	i 
	ld l,h			;0810	6c 	l 
l0811h:
	ld h,l			;0811	65 	e 
	jr nz,l0882h		;0812	20 6e 	  n 
	ld h,c			;0814	61 	a 
	ld l,l			;0815	6d 	m 
	ld h,l			;0816	65 	e 
	nop			;0817	00 	. 
	ld b,h			;0818	44 	D 
	ld l,c			;0819	69 	i 
l081ah:
	ld (hl),d			;081a	72 	r 
	ld h,l			;081b	65 	e 
	ld h,e			;081c	63 	c 
l081dh:
	ld (hl),h			;081d	74 	t 
l081eh:
	jr nz,l0893h		;081e	20 73 	  s 
	ld (hl),h			;0820	74 	t 
	ld h,c			;0821	61 	a 
	ld (hl),h			;0822	74 	t 
	ld h,l			;0823	65 	e 
	ld l,l			;0824	6d 	m 
	ld h,l			;0825	65 	e 
l0826h:
	ld l,(hl)			;0826	6e 	n 
	ld (hl),h			;0827	74 	t 
	jr nz,l0893h		;0828	20 69 	  i 
	ld l,(hl)			;082a	6e 	n 
	jr nz,l0893h		;082b	20 66 	  f 
l082dh:
	ld l,c			;082d	69 	i 
	ld l,h			;082e	6c 	l 
	ld h,l			;082f	65 	e 
	nop			;0830	00 	. 
	ld b,d			;0831	42 	B 
	ld h,c			;0832	61 	a 
	ld h,h			;0833	64 	d 
	jr nz,l0897h		;0834	20 61 	  a 
	ld l,h			;0836	6c 	l 
	ld l,h			;0837	6c 	l 
	ld l,a			;0838	6f 	o 
l0839h:
	ld h,e			;0839	63 	c 
	ld h,c			;083a	61 	a 
	ld (hl),h			;083b	74 	t 
	ld l,c			;083c	69 	i 
	ld l,a			;083d	6f 	o 
	ld l,(hl)			;083e	6e 	n 
	jr nz,l08b5h		;083f	20 74 	  t 
	ld h,c			;0841	61 	a 
	ld h,d			;0842	62 	b 
l0843h:
	ld l,h			;0843	6c 	l 
	ld h,l			;0844	65 	e 
	nop			;0845	00 	. 
	ld b,d			;0846	42 	B 
	ld h,c			;0847	61 	a 
	ld h,h			;0848	64 	d 
	jr nz,102		;0849	20 64 	  d 
	ld (hl),d			;084b	72 	r 
	ld l,c			;084c	69 	i 
	halt			;084d	76 	v 
	ld h,l			;084e	65 	e 
	jr nz,l08bfh		;084f	20 6e 	  n 
	ld (hl),l			;0851	75 	u 
	ld l,l			;0852	6d 	m 
	ld h,d			;0853	62 	b 
	ld h,l			;0854	65 	e 
	ld (hl),d			;0855	72 	r 
	nop			;0856	00 	. 
l0857h:
	ld b,d			;0857	42 	B 
	ld h,c			;0858	61 	a 
	ld h,h			;0859	64 	d 
	jr nz,l08d0h		;085a	20 74 	  t 
	ld (hl),d			;085c	72 	r 
l085dh:
	ld h,c			;085d	61 	a 
	ld h,e			;085e	63 	c 
	ld l,e			;085f	6b 	k 
	cpl			;0860	2f 	/ 
	ld (hl),e			;0861	73 	s 
	ld h,l			;0862	65 	e 
	ld h,e			;0863	63 	c 
	ld (hl),h			;0864	74 	t 
	ld l,a			;0865	6f 	o 
	ld (hl),d			;0866	72 	r 
	nop			;0867	00 	. 
	ld b,h			;0868	44 	D 
	ld h,l			;0869	65 	e 
	ld l,h			;086a	6c 	l 
	ld h,l			;086b	65 	e 
l086ch:
	ld (hl),h			;086c	74 	t 
	ld h,l			;086d	65 	e 
	ld h,h			;086e	64 	d 
	jr nz,l08e3h		;086f	20 72 	  r 
	ld h,l			;0871	65 	e 
l0872h:
	ld h,e			;0872	63 	c 
	ld l,a			;0873	6f 	o 
	ld (hl),d			;0874	72 	r 
l0875h:
	ld h,h			;0875	64 	d 
	nop			;0876	00 	. 
	ld d,d			;0877	52 	R 
	ld h,l			;0878	65 	e 
	ld l,(hl)			;0879	6e 	n 
	ld h,c			;087a	61 	a 
	ld l,l			;087b	6d 	m 
	ld h,l			;087c	65 	e 
	jr nz,l08e0h		;087d	20 61 	  a 
	ld h,e			;087f	63 	c 
	ld (hl),d			;0880	72 	r 
	ld l,a			;0881	6f 	o 
l0882h:
	ld (hl),e			;0882	73 	s 
	ld (hl),e			;0883	73 	s 
	jr nz,102		;0884	20 64 	  d 
	ld l,c			;0886	69 	i 
	ld (hl),e			;0887	73 	s 
	ld l,e			;0888	6b 	k 
	ld (hl),e			;0889	73 	s 
	nop			;088a	00 	. 
	ld d,e			;088b	53 	S 
	ld h,l			;088c	65 	e 
	ld (hl),c			;088d	71 	q 
	ld (hl),l			;088e	75 	u 
	ld h,l			;088f	65 	e 
	ld l,(hl)			;0890	6e 	n 
	ld (hl),h			;0891	74 	t 
	ld l,c			;0892	69 	i 
l0893h:
	ld h,c			;0893	61 	a 
	ld l,h			;0894	6c 	l 
	jr nz,l08f8h		;0895	20 61 	  a 
l0897h:
	ld h,(hl)			;0897	66 	f 
	ld (hl),h			;0898	74 	t 
	ld h,l			;0899	65 	e 
	ld (hl),d			;089a	72 	r 
	jr nz,l08edh		;089b	20 50 	  P 
	ld d,l			;089d	55 	U 
	ld d,h			;089e	54 	T 
	nop			;089f	00 	. 
	ld d,e			;08a0	53 	S 
	ld h,l			;08a1	65 	e 
	ld (hl),c			;08a2	71 	q 
	ld (hl),l			;08a3	75 	u 
	ld h,l			;08a4	65 	e 
	ld l,(hl)			;08a5	6e 	n 
	ld (hl),h			;08a6	74 	t 
	ld l,c			;08a7	69 	i 
	ld h,c			;08a8	61 	a 
	ld l,h			;08a9	6c 	l 
	jr nz,l08f5h		;08aa	20 49 	  I 
	cpl			;08ac	2f 	/ 
	ld c,a			;08ad	4f 	O 
	jr nz,l091fh		;08ae	20 6f 	  o 
	ld l,(hl)			;08b0	6e 	n 
	ld l,h			;08b1	6c 	l 
	ld a,c			;08b2	79 	y 
	nop			;08b3	00 	. 
	ld b,(hl)			;08b4	46 	F 
l08b5h:
	ld l,c			;08b5	69 	i 
	ld l,h			;08b6	6c 	l 
	ld h,l			;08b7	65 	e 
	jr nz,112		;08b8	20 6e 	  n 
	ld l,a			;08ba	6f 	o 
	ld (hl),h			;08bb	74 	t 
	jr nz,l090dh		;08bc	20 4f 	  O 
	ld d,b			;08be	50 	P 
l08bfh:
	ld b,l			;08bf	45 	E 
	ld c,(hl)			;08c0	4e 	N 
	nop			;08c1	00 	. 
	ld b,(hl)			;08c2	46 	F 
	ld l,c			;08c3	69 	i 
	ld l,h			;08c4	6c 	l 
	ld h,l			;08c5	65 	e 
	jr nz,121		;08c6	20 77 	  w 
	ld (hl),d			;08c8	72 	r 
	ld l,c			;08c9	69 	i 
	ld (hl),h			;08ca	74 	t 
	ld h,l			;08cb	65 	e 
	jr nz,l093eh		;08cc	20 70 	  p 
	ld (hl),d			;08ce	72 	r 
	ld l,a			;08cf	6f 	o 
l08d0h:
	ld (hl),h			;08d0	74 	t 
	ld h,l			;08d1	65 	e 
	ld h,e			;08d2	63 	c 
	ld (hl),h			;08d3	74 	t 
	ld h,l			;08d4	65 	e 
	ld h,h			;08d5	64 	d 
	nop			;08d6	00 	. 
	ld b,h			;08d7	44 	D 
	ld l,c			;08d8	69 	i 
	ld (hl),e			;08d9	73 	s 
	ld l,e			;08da	6b 	k 
	jr nz,113		;08db	20 6f 	  o 
	ld h,(hl)			;08dd	66 	f 
	ld h,(hl)			;08de	66 	f 
	ld l,h			;08df	6c 	l 
l08e0h:
	ld l,c			;08e0	69 	i 
	ld l,(hl)			;08e1	6e 	n 
	ld h,l			;08e2	65 	e 
l08e3h:
	nop			;08e3	00 	. 
l08e4h:
	nop			;08e4	00 	. 
	rlca			;08e5	07 	. 
	nop			;08e6	00 	. 
	jr 3		;08e7	18 01 	. . 
	ld bc,l00d3h		;08e9	01 d3 00 	. . . 
	ret			;08ec	c9 	. 
l08edh:
	nop			;08ed	00 	. 
	nop			;08ee	00 	. 
	nop			;08ef	00 	. 
	dec (hl)			;08f0	35 	5 
	ld c,d			;08f1	4a 	J 
	jp z,03999h		;08f2	ca 99 39 	. . 9 
l08f5h:
	inc e			;08f5	1c 	. 
	halt			;08f6	76 	v 
	sbc a,b			;08f7	98 	. 
l08f8h:
	ld (0b395h),hl		;08f8	22 95 b3 	" . . 
	sbc a,b			;08fb	98 	. 
	ld a,(bc)			;08fc	0a 	. 
	defb 0ddh,047h,098h	;illegal sequence		;08fd	dd 47 98 	. G . 
	ld d,e			;0900	53 	S 
	pop de			;0901	d1 	. 
	sbc a,c			;0902	99 	. 
	sbc a,c			;0903	99 	. 
	ld a,(bc)			;0904	0a 	. 
	ld a,(de)			;0905	1a 	. 
	sbc a,a			;0906	9f 	. 
	sbc a,b			;0907	98 	. 
	ld h,l			;0908	65 	e 
	cp h			;0909	bc 	. 
	call 0d698h		;090a	cd 98 d6 	. . . 
l090dh:
	ld (hl),a			;090d	77 	w 
	ld a,098h		;090e	3e 98 	> . 
	ld a,(l0000h)		;0910	3a 00 00 	: . . 
	nop			;0913	00 	. 
	nop			;0914	00 	. 
	sub 010h		;0915	d6 10 	. . 
	sub 010h		;0917	d6 10 	. . 
	sub 010h		;0919	d6 10 	. . 
	sub 010h		;091b	d6 10 	. . 
	sub 010h		;091d	d6 10 	. . 
l091fh:
	sub 010h		;091f	d6 10 	. . 
	sub 010h		;0921	d6 10 	. . 
	sub 010h		;0923	d6 10 	. . 
	sub 010h		;0925	d6 10 	. . 
	sub 010h		;0927	d6 10 	. . 
	nop			;0929	00 	. 
	nop			;092a	00 	. 
	nop			;092b	00 	. 
	nop			;092c	00 	. 
	nop			;092d	00 	. 
	xor 0ffh		;092e	ee ff 	. . 
	jr z,l0940h		;0930	28 0e 	( . 
	nop			;0932	00 	. 
	ld (hl),h			;0933	74 	t 
	push de			;0934	d5 	. 
	cp 0ffh		;0935	fe ff 	. . 
	ld de,0c4d5h		;0937	11 d5 c4 	. . . 
	dec b			;093a	05 	. 
	jr nz,l09a6h		;093b	20 69 	  i 
	ld l,(hl)			;093d	6e 	n 
l093eh:
	jr nz,l0940h		;093e	20 00 	  . 
l0940h:
	ld c,a			;0940	4f 	O 
	ld l,e			;0941	6b 	k 
	dec c			;0942	0d 	. 
	ld a,(bc)			;0943	0a 	. 
	nop			;0944	00 	. 
	ld b,d			;0945	42 	B 
	ld (hl),d			;0946	72 	r 
	ld h,l			;0947	65 	e 
	ld h,c			;0948	61 	a 
	ld l,e			;0949	6b 	k 
	nop			;094a	00 	. 
sub_094bh:
	ld hl,l0004h		;094b	21 04 00 	! . . 
	add hl,sp			;094e	39 	9 
l094fh:
	ld a,(hl)			;094f	7e 	~ 
	inc hl			;0950	23 	# 
	cp 0b1h		;0951	fe b1 	. . 
	jr nz,l095bh		;0953	20 06 	  . 
	ld bc,00006h		;0955	01 06 00 	. . . 
	add hl,bc			;0958	09 	. 
	jr l094fh		;0959	18 f4 	. . 
l095bh:
	cp 082h		;095b	fe 82 	. . 
	ret nz			;095d	c0 	. 
	ld c,(hl)			;095e	4e 	N 
	inc hl			;095f	23 	# 
	ld b,(hl)			;0960	46 	F 
	inc hl			;0961	23 	# 
	push hl			;0962	e5 	. 
	ld h,b			;0963	60 	` 
	ld l,c			;0964	69 	i 
	ld a,d			;0965	7a 	z 
	or e			;0966	b3 	. 
	ex de,hl			;0967	eb 	. 
	jr z,l096ch		;0968	28 02 	( . 
	ex de,hl			;096a	eb 	. 
	rst 20h			;096b	e7 	. 
l096ch:
	ld bc,l0018h		;096c	01 18 00 	. . . 
	pop hl			;096f	e1 	. 
	ret z			;0970	c8 	. 
	add hl,bc			;0971	09 	. 
	jr l094fh		;0972	18 db 	. . 
l0974h:
	call 0db7fh		;0974	cd 7f db 	.  . 
	ld hl,(0d051h)		;0977	2a 51 d0 	* Q . 
	ld a,h			;097a	7c 	| 
	and l			;097b	a5 	. 
	inc a			;097c	3c 	< 
	jr z,l0987h		;097d	28 08 	( . 
	ld a,(0d319h)		;097f	3a 19 d3 	: . . 
	or a			;0982	b7 	. 
	ld e,013h		;0983	1e 13 	. . 
	jr nz,l09ach		;0985	20 25 	  % 
l0987h:
	jp 04385h		;0987	c3 85 43 	. . C 
	jr l09ach		;098a	18 20 	.   
l098ch:
	ld hl,(0d301h)		;098c	2a 01 d3 	* . . 
	ld (0d051h),hl		;098f	22 51 d0 	" Q . 
l0992h:
	ld e,002h		;0992	1e 02 	. . 
	ld bc,l0b1eh		;0994	01 1e 0b 	. . . 
	ld bc,l011dh+1		;0997	01 1e 01 	. . . 
	ld bc,l0a1eh		;099a	01 1e 0a 	. . . 
	ld bc,l121eh		;099d	01 1e 12 	. . . 
	ld bc,l141eh		;09a0	01 1e 14 	. . . 
	ld bc,l061eh		;09a3	01 1e 06 	. . . 
l09a6h:
	ld bc,l161eh		;09a6	01 1e 16 	. . . 
	ld bc,l0d1eh		;09a9	01 1e 0d 	. . . 
l09ach:
	xor a			;09ac	af 	. 
	ld (0d506h),a		;09ad	32 06 d5 	2 . . 
	ld hl,(0d051h)		;09b0	2a 51 d0 	* Q . 
	ld (0d311h),hl		;09b3	22 11 d3 	" . . 
	xor a			;09b6	af 	. 
	ld (0d430h),a		;09b7	32 30 d4 	2 0 . 
	ld (0d436h),a		;09ba	32 36 d4 	2 6 . 
	ld a,h			;09bd	7c 	| 
	and l			;09be	a5 	. 
	inc a			;09bf	3c 	< 
	jr z,l09c5h		;09c0	28 03 	( . 
	ld (0d313h),hl		;09c2	22 13 d3 	" . . 
l09c5h:
	ld bc,l09ceh		;09c5	01 ce 09 	. . . 
	ld hl,(0d30fh)		;09c8	2a 0f d3 	* . . 
	jp 04322h		;09cb	c3 22 43 	. " C 
l09ceh:
	pop bc			;09ce	c1 	. 
	ld a,e			;09cf	7b 	{ 
	ld c,e			;09d0	4b 	K 
	ld (0d046h),a		;09d1	32 46 d0 	2 F . 
	ld hl,(0d30dh)		;09d4	2a 0d d3 	* . . 
	ld (0d315h),hl		;09d7	22 15 d3 	" . . 
	ex de,hl			;09da	eb 	. 
	ld hl,(0d311h)		;09db	2a 11 d3 	* . . 
	ld a,h			;09de	7c 	| 
	and l			;09df	a5 	. 
	inc a			;09e0	3c 	< 
	jr z,l09eah		;09e1	28 07 	( . 
	ld (0d31ch),hl		;09e3	22 1c d3 	" . . 
	ex de,hl			;09e6	eb 	. 
	ld (0d31eh),hl		;09e7	22 1e d3 	" . . 
l09eah:
	ld hl,(0d317h)		;09ea	2a 17 d3 	* . . 
	ld a,h			;09ed	7c 	| 
	or l			;09ee	b5 	. 
	ex de,hl			;09ef	eb 	. 
	ld hl,0d319h		;09f0	21 19 d3 	! . . 
	jr z,l09fdh		;09f3	28 08 	( . 
	and (hl)			;09f5	a6 	. 
	jr nz,l09fdh		;09f6	20 05 	  . 
	dec (hl)			;09f8	35 	5 
	ex de,hl			;09f9	eb 	. 
	jp l0fa4h		;09fa	c3 a4 0f 	. . . 
l09fdh:
	xor a			;09fd	af 	. 
	ld (hl),a			;09fe	77 	w 
	ld e,c			;09ff	59 	Y 
	call 05257h		;0a00	cd 57 52 	. W R 
	ld hl,l056eh		;0a03	21 6e 05 	! n . 
	call 0db2eh		;0a06	cd 2e db 	. . . 
	ld a,e			;0a09	7b 	{ 
	cp 04ah		;0a0a	fe 4a 	. J 
	jr nc,l0a16h		;0a0c	30 08 	0 . 
	cp 032h		;0a0e	fe 32 	. 2 
	jr nc,l0a18h		;0a10	30 06 	0 . 
	cp 020h		;0a12	fe 20 	.   
	jr c,l0a1bh		;0a14	38 05 	8 . 
l0a16h:
	ld a,027h		;0a16	3e 27 	> ' 
l0a18h:
	sub 012h		;0a18	d6 12 	. . 
	ld e,a			;0a1a	5f 	_ 
l0a1bh:
	call sub_119fh+2		;0a1b	cd a1 11 	. . . 
l0a1eh:
	inc hl			;0a1e	23 	# 
	dec e			;0a1f	1d 	. 
	jr nz,l0a1bh		;0a20	20 f9 	  . 
	push hl			;0a22	e5 	. 
	ld hl,(0d311h)		;0a23	2a 11 d3 	* . . 
	ex (sp),hl			;0a26	e3 	. 
	call 0db2bh		;0a27	cd 2b db 	. + . 
	ld a,(hl)			;0a2a	7e 	~ 
	cp 03fh		;0a2b	fe 3f 	. ? 
	jr nz,l0a35h		;0a2d	20 06 	  . 
	pop hl			;0a2f	e1 	. 
	ld hl,l056eh		;0a30	21 6e 05 	! n . 
	jr l0a16h		;0a33	18 e1 	. . 
l0a35h:
	call 02b1ah		;0a35	cd 1a 2b 	. . + 
	pop hl			;0a38	e1 	. 
	ld de,0fffeh		;0a39	11 fe ff 	. . . 
	rst 20h			;0a3c	e7 	. 
	jp z,l003bh		;0a3d	ca 3b 00 	. ; . 
	ld a,h			;0a40	7c 	| 
	and l			;0a41	a5 	. 
	inc a			;0a42	3c 	< 
	call nz,03cf2h		;0a43	c4 f2 3c 	. . < 
	ld a,0ffh		;0a46	3e ff 	> . 
	rst 18h			;0a48	df 	. 
	ld a,0c1h		;0a49	3e c1 	> . 
l0a4bh:
	call 051c3h		;0a4b	cd c3 51 	. . Q 
	call 0dba3h		;0a4e	cd a3 db 	. . . 
	call 0db8bh		;0a51	cd 8b db 	. . . 
	call 05257h		;0a54	cd 57 52 	. W R 
	ld hl,l0940h		;0a57	21 40 09 	! @ . 
	call 02b1ah		;0a5a	cd 1a 2b 	. . + 
	ld a,(0d046h)		;0a5d	3a 46 d0 	: F . 
	sub 002h		;0a60	d6 02 	. . 
	call z,04a0fh		;0a62	cc 0f 4a 	. . J 
l0a65h:
	call 0db67h		;0a65	cd 67 db 	. g . 
	ld hl,0ffffh		;0a68	21 ff ff 	! . . 
	ld (0d051h),hl		;0a6b	22 51 d0 	" Q . 
	ld hl,0d02ch		;0a6e	21 2c d0 	! , . 
	ld (0d30dh),hl		;0a71	22 0d d3 	" . . 
	ld a,(0d308h)		;0a74	3a 08 d3 	: . . 
	or a			;0a77	b7 	. 
	jr z,l0a90h		;0a78	28 16 	( . 
	ld hl,(0d309h)		;0a7a	2a 09 d3 	* . . 
	push hl			;0a7d	e5 	. 
	call 03cfah		;0a7e	cd fa 3c 	. . < 
	pop de			;0a81	d1 	. 
	push de			;0a82	d5 	. 
	call sub_0bcch		;0a83	cd cc 0b 	. . . 
	ld a,02ah		;0a86	3e 2a 	> * 
	jr c,l0a8ch		;0a88	38 02 	8 . 
	ld a,020h		;0a8a	3e 20 	>   
l0a8ch:
	rst 18h			;0a8c	df 	. 
	ld (0d308h),a		;0a8d	32 08 d3 	2 . . 
l0a90h:
	call 04639h		;0a90	cd 39 46 	. 9 F 
	jr nc,l0a9ch		;0a93	30 07 	0 . 
	xor a			;0a95	af 	. 
	ld (0d308h),a		;0a96	32 08 d3 	2 . . 
	jp l0a65h		;0a99	c3 65 0a 	. e . 
l0a9ch:
	rst 10h			;0a9c	d7 	. 
	inc a			;0a9d	3c 	< 
	dec a			;0a9e	3d 	= 
	jr z,l0a65h		;0a9f	28 c4 	( . 
	push af			;0aa1	f5 	. 
	call sub_10e5h		;0aa2	cd e5 10 	. . . 
	call sub_0e6dh		;0aa5	cd 6d 0e 	. m . 
	ld a,(0d308h)		;0aa8	3a 08 d3 	: . . 
	or a			;0aab	b7 	. 
	jr z,l0ab6h		;0aac	28 08 	( . 
	cp 02ah		;0aae	fe 2a 	. * 
	jr nz,l0ab6h		;0ab0	20 04 	  . 
	cp (hl)			;0ab2	be 	. 
	call z,0374ah		;0ab3	cc 4a 37 	. J 7 
l0ab6h:
	ld a,d			;0ab6	7a 	z 
	or e			;0ab7	b3 	. 
	jp z,l0ac1h		;0ab8	ca c1 0a 	. . . 
	ld a,(hl)			;0abb	7e 	~ 
	cp 020h		;0abc	fe 20 	.   
	call z,0374ah		;0abe	cc 4a 37 	. J 7 
l0ac1h:
	push de			;0ac1	d5 	. 
	call sub_0be9h		;0ac2	cd e9 0b 	. . . 
	pop de			;0ac5	d1 	. 
	pop af			;0ac6	f1 	. 
	ld (0d30dh),hl		;0ac7	22 0d d3 	" . . 
	call 0db22h		;0aca	cd 22 db 	. " . 
	jr c,l0ad6h		;0acd	38 07 	8 . 
	xor a			;0acf	af 	. 
	ld (0d308h),a		;0ad0	32 08 d3 	2 . . 
	jp 02892h		;0ad3	c3 92 28 	. . ( 
l0ad6h:
	push de			;0ad6	d5 	. 
	push bc			;0ad7	c5 	. 
	rst 10h			;0ad8	d7 	. 
	or a			;0ad9	b7 	. 
	push af			;0ada	f5 	. 
	ld (0d313h),de		;0adb	ed 53 13 d3 	. S . . 
	ld hl,(0d30bh)		;0adf	2a 0b d3 	* . . 
	add hl,de			;0ae2	19 	. 
	jr c,l0af2h		;0ae3	38 0d 	8 . 
	push de			;0ae5	d5 	. 
	ld de,0fffah		;0ae6	11 fa ff 	. . . 
	rst 20h			;0ae9	e7 	. 
	pop de			;0aea	d1 	. 
	jr nc,l0af2h		;0aeb	30 05 	0 . 
	ld (0d309h),hl		;0aed	22 09 d3 	" . . 
	jr l0af6h		;0af0	18 04 	. . 
l0af2h:
	xor a			;0af2	af 	. 
	ld (0d308h),a		;0af3	32 08 d3 	2 . . 
l0af6h:
	call sub_0bcch		;0af6	cd cc 0b 	. . . 
	jr c,l0b0eh		;0af9	38 13 	8 . 
	pop af			;0afb	f1 	. 
	push af			;0afc	f5 	. 
	jp nz,l0b0bh		;0afd	c2 0b 0b 	. . . 
	ld a,(0d308h)		;0b00	3a 08 d3 	: . . 
	or a			;0b03	b7 	. 
	jp z,l1179h		;0b04	ca 79 11 	. y . 
	push bc			;0b07	c5 	. 
	jp l0b6eh		;0b08	c3 6e 0b 	. n . 
l0b0bh:
	or a			;0b0b	b7 	. 
	jr l0b1fh		;0b0c	18 11 	. . 
l0b0eh:
	pop af			;0b0e	f1 	. 
	push af			;0b0f	f5 	. 
	jp nz,l0b1eh		;0b10	c2 1e 0b 	. . . 
	ld a,(0d308h)		;0b13	3a 08 d3 	: . . 
	or a			;0b16	b7 	. 
	jp z,l0b1eh		;0b17	ca 1e 0b 	. . . 
	push bc			;0b1a	c5 	. 
	jp l0b6eh		;0b1b	c3 6e 0b 	. n . 
l0b1eh:
	scf			;0b1e	37 	7 
l0b1fh:
	push bc			;0b1f	c5 	. 
	push af			;0b20	f5 	. 
	push hl			;0b21	e5 	. 
	call 0203ch		;0b22	cd 3c 20 	. <   
	pop hl			;0b25	e1 	. 
	pop af			;0b26	f1 	. 
	pop bc			;0b27	c1 	. 
	push bc			;0b28	c5 	. 
	call c,sub_1ebeh		;0b29	dc be 1e 	. . . 
	pop de			;0b2c	d1 	. 
	pop af			;0b2d	f1 	. 
	push de			;0b2e	d5 	. 
	jr z,l0b6eh		;0b2f	28 3d 	( = 
	pop de			;0b31	d1 	. 
	ld a,(0d436h)		;0b32	3a 36 d4 	: 6 . 
	or a			;0b35	b7 	. 
	jr nz,l0b3eh		;0b36	20 06 	  . 
	ld hl,(0d2d4h)		;0b38	2a d4 d2 	* . . 
	ld (0d2f9h),hl		;0b3b	22 f9 d2 	" . . 
l0b3eh:
	ld hl,l0000h		;0b3e	21 00 00 	! . . 
	ld (0d317h),hl		;0b41	22 17 d3 	" . . 
	ld hl,(0d320h)		;0b44	2a 20 d3 	*   . 
	ex (sp),hl			;0b47	e3 	. 
	pop bc			;0b48	c1 	. 
	push hl			;0b49	e5 	. 
	add hl,bc			;0b4a	09 	. 
	push hl			;0b4b	e5 	. 
	call 0424dh		;0b4c	cd 4d 42 	. M B 
	pop hl			;0b4f	e1 	. 
	ld (0d320h),hl		;0b50	22 20 d3 	"   . 
	ex de,hl			;0b53	eb 	. 
	ld (hl),h			;0b54	74 	t 
	pop bc			;0b55	c1 	. 
	pop de			;0b56	d1 	. 
	push hl			;0b57	e5 	. 
	inc hl			;0b58	23 	# 
	inc hl			;0b59	23 	# 
	ld (hl),e			;0b5a	73 	s 
	inc hl			;0b5b	23 	# 
	ld (hl),d			;0b5c	72 	r 
	inc hl			;0b5d	23 	# 
	ld de,0d081h		;0b5e	11 81 d0 	. . . 
	dec bc			;0b61	0b 	. 
	dec bc			;0b62	0b 	. 
	dec bc			;0b63	0b 	. 
	dec bc			;0b64	0b 	. 
l0b65h:
	ld a,(de)			;0b65	1a 	. 
	ld (hl),a			;0b66	77 	w 
	inc hl			;0b67	23 	# 
	inc de			;0b68	13 	. 
	dec bc			;0b69	0b 	. 
	ld a,c			;0b6a	79 	y 
	or b			;0b6b	b0 	. 
	jr nz,l0b65h		;0b6c	20 f7 	  . 
l0b6eh:
	call 0db3ah		;0b6e	cd 3a db 	. : . 
	pop de			;0b71	d1 	. 
	call sub_0b8eh		;0b72	cd 8e 0b 	. . . 
	ld hl,(0d4ebh)		;0b75	2a eb d4 	* . . 
	ld (0d31ah),hl		;0b78	22 1a d3 	" . . 
	call 042b7h		;0b7b	cd b7 42 	. . B 
	call 0db34h		;0b7e	cd 34 db 	. 4 . 
	ld hl,(0d31ah)		;0b81	2a 1a d3 	* . . 
	ld (0d4ebh),hl		;0b84	22 eb d4 	" . . 
	jp l0a65h		;0b87	c3 65 0a 	. e . 
	ld hl,(0d053h)		;0b8a	2a 53 d0 	* S . 
	ex de,hl			;0b8d	eb 	. 
sub_0b8eh:
	ld h,d			;0b8e	62 	b 
	ld l,e			;0b8f	6b 	k 
	ld a,(hl)			;0b90	7e 	~ 
	inc hl			;0b91	23 	# 
	or (hl)			;0b92	b6 	. 
	ret z			;0b93	c8 	. 
	inc hl			;0b94	23 	# 
	inc hl			;0b95	23 	# 
l0b96h:
	inc hl			;0b96	23 	# 
	ld a,(hl)			;0b97	7e 	~ 
l0b98h:
	or a			;0b98	b7 	. 
	jr z,l0ba9h		;0b99	28 0e 	( . 
	cp 020h		;0b9b	fe 20 	.   
	jr nc,l0b96h		;0b9d	30 f7 	0 . 
	cp 00bh		;0b9f	fe 0b 	. . 
	jr c,l0b96h		;0ba1	38 f3 	8 . 
	call sub_0fe6h		;0ba3	cd e6 0f 	. . . 
	rst 10h			;0ba6	d7 	. 
	jr l0b98h		;0ba7	18 ef 	. . 
l0ba9h:
	inc hl			;0ba9	23 	# 
	ex de,hl			;0baa	eb 	. 
	ld (hl),e			;0bab	73 	s 
	inc hl			;0bac	23 	# 
	ld (hl),d			;0bad	72 	r 
	jr sub_0b8eh		;0bae	18 de 	. . 
sub_0bb0h:
	ld de,l0000h		;0bb0	11 00 00 	. . . 
	push de			;0bb3	d5 	. 
	jr z,11		;0bb4	28 09 	( . 
	pop de			;0bb6	d1 	. 
	call sub_10dbh		;0bb7	cd db 10 	. . . 
	push de			;0bba	d5 	. 
	jr z,l0bc8h		;0bbb	28 0b 	( . 
	rst 8			;0bbd	cf 	. 
	jp p,0fa11h		;0bbe	f2 11 fa 	. . . 
	rst 38h			;0bc1	ff 	. 
	call nz,sub_10dbh		;0bc2	c4 db 10 	. . . 
	jp nz,l0992h		;0bc5	c2 92 09 	. . . 
l0bc8h:
	ex de,hl			;0bc8	eb 	. 
	pop de			;0bc9	d1 	. 
sub_0bcah:
	ex (sp),hl			;0bca	e3 	. 
	push hl			;0bcb	e5 	. 
sub_0bcch:
	ld hl,(0d053h)		;0bcc	2a 53 d0 	* S . 
l0bcfh:
	ld b,h			;0bcf	44 	D 
	ld c,l			;0bd0	4d 	M 
	ld a,(hl)			;0bd1	7e 	~ 
	inc hl			;0bd2	23 	# 
	or (hl)			;0bd3	b6 	. 
	dec hl			;0bd4	2b 	+ 
	ret z			;0bd5	c8 	. 
	inc hl			;0bd6	23 	# 
	inc hl			;0bd7	23 	# 
	ld a,(hl)			;0bd8	7e 	~ 
	inc hl			;0bd9	23 	# 
	ld h,(hl)			;0bda	66 	f 
	ld l,a			;0bdb	6f 	o 
	rst 20h			;0bdc	e7 	. 
	ld h,b			;0bdd	60 	` 
	ld l,c			;0bde	69 	i 
	ld a,(hl)			;0bdf	7e 	~ 
	inc hl			;0be0	23 	# 
	ld h,(hl)			;0be1	66 	f 
	ld l,a			;0be2	6f 	o 
	ccf			;0be3	3f 	? 
	ret z			;0be4	c8 	. 
	ccf			;0be5	3f 	? 
	ret nc			;0be6	d0 	. 
	jr l0bcfh		;0be7	18 e6 	. . 
sub_0be9h:
	xor a			;0be9	af 	. 
	ld (0d2c7h),a		;0bea	32 c7 d2 	2 . . 
	ld (0d2c6h),a		;0bed	32 c6 d2 	2 . . 
	call 0db1ch		;0bf0	cd 1c db 	. . . 
	ld bc,l013bh		;0bf3	01 3b 01 	. ; . 
	ld de,0d081h		;0bf6	11 81 d0 	. . . 
l0bf9h:
	ld a,(hl)			;0bf9	7e 	~ 
	or a			;0bfa	b7 	. 
	jr nz,l0c10h		;0bfb	20 13 	  . 
l0bfdh:
	ld hl,l0140h		;0bfd	21 40 01 	! @ . 
	ld a,l			;0c00	7d 	} 
	sub c			;0c01	91 	. 
	ld c,a			;0c02	4f 	O 
	ld a,h			;0c03	7c 	| 
	sbc a,b			;0c04	98 	. 
	ld b,a			;0c05	47 	G 
	ld hl,0d080h		;0c06	21 80 d0 	! . . 
	xor a			;0c09	af 	. 
	ld (de),a			;0c0a	12 	. 
	inc de			;0c0b	13 	. 
	ld (de),a			;0c0c	12 	. 
	inc de			;0c0d	13 	. 
	ld (de),a			;0c0e	12 	. 
	ret			;0c0f	c9 	. 
l0c10h:
	cp 022h		;0c10	fe 22 	. " 
	jp z,l0c45h		;0c12	ca 45 0c 	. E . 
	cp 020h		;0c15	fe 20 	.   
	jr z,l0c20h		;0c17	28 07 	( . 
	ld a,(0d2c6h)		;0c19	3a c6 d2 	: . . 
	or a			;0c1c	b7 	. 
	ld a,(hl)			;0c1d	7e 	~ 
	jr z,l0c4dh		;0c1e	28 2d 	( - 
l0c20h:
	inc hl			;0c20	23 	# 
	push af			;0c21	f5 	. 
	call sub_0e1fh		;0c22	cd 1f 0e 	. . . 
	pop af			;0c25	f1 	. 
	sub 03ah		;0c26	d6 3a 	. : 
	jr z,l0c30h		;0c28	28 06 	( . 
	cp 04ah		;0c2a	fe 4a 	. J 
	jr nz,l0c36h		;0c2c	20 08 	  . 
	ld a,001h		;0c2e	3e 01 	> . 
l0c30h:
	ld (0d2c6h),a		;0c30	32 c6 d2 	2 . . 
	ld (0d2c7h),a		;0c33	32 c7 d2 	2 . . 
l0c36h:
	sub 055h		;0c36	d6 55 	. U 
	jr nz,l0bf9h		;0c38	20 bf 	  . 
	push af			;0c3a	f5 	. 
l0c3bh:
	ld a,(hl)			;0c3b	7e 	~ 
	or a			;0c3c	b7 	. 
	ex (sp),hl			;0c3d	e3 	. 
	ld a,h			;0c3e	7c 	| 
	pop hl			;0c3f	e1 	. 
	jr z,l0bfdh		;0c40	28 bb 	( . 
	cp (hl)			;0c42	be 	. 
	jr z,l0c20h		;0c43	28 db 	( . 
l0c45h:
	push af			;0c45	f5 	. 
	ld a,(hl)			;0c46	7e 	~ 
l0c47h:
	inc hl			;0c47	23 	# 
	call sub_0e1fh		;0c48	cd 1f 0e 	. . . 
	jr l0c3bh		;0c4b	18 ee 	. . 
l0c4dh:
	inc hl			;0c4d	23 	# 
	or a			;0c4e	b7 	. 
	jp m,l0bf9h		;0c4f	fa f9 0b 	. . . 
	dec hl			;0c52	2b 	+ 
	cp 03fh		;0c53	fe 3f 	. ? 
	ld a,091h		;0c55	3e 91 	> . 
	push de			;0c57	d5 	. 
	push bc			;0c58	c5 	. 
	jp z,l0d15h		;0c59	ca 15 0d 	. . . 
	ld de,l051fh		;0c5c	11 1f 05 	. . . 
	call sub_1876h		;0c5f	cd 76 18 	. v . 
	call 04441h		;0c62	cd 41 44 	. A D 
	jp c,l0d67h		;0c65	da 67 0d 	. g . 
	push hl			;0c68	e5 	. 
	ld de,l0c98h		;0c69	11 98 0c 	. . . 
	call sub_0c8bh		;0c6c	cd 8b 0c 	. . . 
	jr nz,l0ca2h		;0c6f	20 31 	  1 
	rst 10h			;0c71	d7 	. 
	ld de,l0c9ch		;0c72	11 9c 0c 	. . . 
	call sub_0c8bh		;0c75	cd 8b 0c 	. . . 
	ld a,089h		;0c78	3e 89 	> . 
	jp z,l0c87h		;0c7a	ca 87 0c 	. . . 
	ld de,l0c9fh		;0c7d	11 9f 0c 	. . . 
	call sub_0c8bh		;0c80	cd 8b 0c 	. . . 
	jr nz,l0ca2h		;0c83	20 1d 	  . 
	ld a,08dh		;0c85	3e 8d 	> . 
l0c87h:
	pop bc			;0c87	c1 	. 
	jp l0d15h		;0c88	c3 15 0d 	. . . 
sub_0c8bh:
	ld a,(de)			;0c8b	1a 	. 
	or a			;0c8c	b7 	. 
	ret z			;0c8d	c8 	. 
	ld c,a			;0c8e	4f 	O 
	call sub_1876h		;0c8f	cd 76 18 	. v . 
	cp c			;0c92	b9 	. 
	ret nz			;0c93	c0 	. 
	inc hl			;0c94	23 	# 
	inc de			;0c95	13 	. 
	jr sub_0c8bh		;0c96	18 f3 	. . 
l0c98h:
	ld b,a			;0c98	47 	G 
	ld c,a			;0c99	4f 	O 
	jr nz,l0c9ch		;0c9a	20 00 	  . 
l0c9ch:
	ld d,h			;0c9c	54 	T 
	ld c,a			;0c9d	4f 	O 
	nop			;0c9e	00 	. 
l0c9fh:
	ld d,l			;0c9f	55 	U 
	ld b,d			;0ca0	42 	B 
	nop			;0ca1	00 	. 
l0ca2h:
	pop hl			;0ca2	e1 	. 
	call sub_1876h		;0ca3	cd 76 18 	. v . 
	push hl			;0ca6	e5 	. 
	call 0db1fh		;0ca7	cd 1f db 	. . . 
	ld hl,0026dh		;0caa	21 6d 02 	! m . 
	sub 041h		;0cad	d6 41 	. A 
	add a,a			;0caf	87 	. 
	ld c,a			;0cb0	4f 	O 
	ld b,000h		;0cb1	06 00 	. . 
	add hl,bc			;0cb3	09 	. 
	ld e,(hl)			;0cb4	5e 	^ 
	inc hl			;0cb5	23 	# 
	ld d,(hl)			;0cb6	56 	V 
	pop hl			;0cb7	e1 	. 
	inc hl			;0cb8	23 	# 
l0cb9h:
	push hl			;0cb9	e5 	. 
l0cbah:
	call sub_1876h		;0cba	cd 76 18 	. v . 
	ld c,a			;0cbd	4f 	O 
	ld a,(de)			;0cbe	1a 	. 
	and 07fh		;0cbf	e6 7f 	.  
	jp z,l0e2ah		;0cc1	ca 2a 0e 	. * . 
	inc hl			;0cc4	23 	# 
	cp c			;0cc5	b9 	. 
	jr nz,l0d09h		;0cc6	20 41 	  A 
	ld a,(de)			;0cc8	1a 	. 
	inc de			;0cc9	13 	. 
	or a			;0cca	b7 	. 
	jp p,l0cbah		;0ccb	f2 ba 0c 	. . . 
	ld a,c			;0cce	79 	y 
	cp 028h		;0ccf	fe 28 	. ( 
	jr z,l0cebh		;0cd1	28 18 	( . 
	ld a,(de)			;0cd3	1a 	. 
	cp 0d8h		;0cd4	fe d8 	. . 
	jr z,l0cebh		;0cd6	28 13 	( . 
	cp 0d7h		;0cd8	fe d7 	. . 
	jr z,l0cebh		;0cda	28 0f 	( . 
	call sub_1876h		;0cdc	cd 76 18 	. v . 
	cp 02eh		;0cdf	fe 2e 	. . 
	jr z,l0ce6h		;0ce1	28 03 	( . 
	call sub_1e0fh		;0ce3	cd 0f 1e 	. . . 
l0ce6h:
	ld a,000h		;0ce6	3e 00 	> . 
	jp nc,l0e2ah		;0ce8	d2 2a 0e 	. * . 
l0cebh:
	pop af			;0ceb	f1 	. 
	ld a,(de)			;0cec	1a 	. 
	call 0db5eh		;0ced	cd 5e db 	. ^ . 
	or a			;0cf0	b7 	. 
	jp m,l0d14h		;0cf1	fa 14 0d 	. . . 
	pop bc			;0cf4	c1 	. 
	pop de			;0cf5	d1 	. 
	or 080h		;0cf6	f6 80 	. . 
	push af			;0cf8	f5 	. 
	ld a,0ffh		;0cf9	3e ff 	> . 
	call sub_0e1fh		;0cfb	cd 1f 0e 	. . . 
	xor a			;0cfe	af 	. 
	ld (0d2c7h),a		;0cff	32 c7 d2 	2 . . 
	pop af			;0d02	f1 	. 
	call sub_0e1fh		;0d03	cd 1f 0e 	. . . 
	jp l0bf9h		;0d06	c3 f9 0b 	. . . 
l0d09h:
	pop hl			;0d09	e1 	. 
l0d0ah:
	ld a,(de)			;0d0a	1a 	. 
	inc de			;0d0b	13 	. 
	or a			;0d0c	b7 	. 
	jp p,l0d0ah		;0d0d	f2 0a 0d 	. . . 
	inc de			;0d10	13 	. 
	jp l0cb9h		;0d11	c3 b9 0c 	. . . 
l0d14h:
	dec hl			;0d14	2b 	+ 
l0d15h:
	push af			;0d15	f5 	. 
	call 0db70h		;0d16	cd 70 db 	. p . 
	ld de,l0d27h		;0d19	11 27 0d 	. ' . 
	ld c,a			;0d1c	4f 	O 
l0d1dh:
	ld a,(de)			;0d1d	1a 	. 
l0d1eh:
	or a			;0d1e	b7 	. 
	jr z,l0d36h		;0d1f	28 15 	( . 
	inc de			;0d21	13 	. 
	cp c			;0d22	b9 	. 
	jr nz,l0d1dh		;0d23	20 f8 	  . 
	jr 19		;0d25	18 11 	. . 
l0d27h:
	adc a,h			;0d27	8c 	. 
	xor d			;0d28	aa 	. 
	xor e			;0d29	ab 	. 
	xor c			;0d2a	a9 	. 
	and (hl)			;0d2b	a6 	. 
	xor b			;0d2c	a8 	. 
	in a,(0a1h)		;0d2d	db a1 	. . 
	adc a,d			;0d2f	8a 	. 
	sub e			;0d30	93 	. 
	sbc a,(hl)			;0d31	9e 	. 
	adc a,c			;0d32	89 	. 
	call nc,sub_008dh		;0d33	d4 8d 00 	. . . 
l0d36h:
	xor a			;0d36	af 	. 
	jp nz,l013eh		;0d37	c2 3e 01 	. > . 
l0d3ah:
	ld (0d2c7h),a		;0d3a	32 c7 d2 	2 . . 
	pop af			;0d3d	f1 	. 
	pop bc			;0d3e	c1 	. 
	pop de			;0d3f	d1 	. 
	cp 0a1h		;0d40	fe a1 	. . 
	push af			;0d42	f5 	. 
	call z,sub_0e1dh		;0d43	cc 1d 0e 	. . . 
	pop af			;0d46	f1 	. 
	cp 0b1h		;0d47	fe b1 	. . 
	jr nz,l0d50h		;0d49	20 05 	  . 
	call sub_0e1fh		;0d4b	cd 1f 0e 	. . . 
	ld a,0f1h		;0d4e	3e f1 	> . 
l0d50h:
	cp 0e0h		;0d50	fe e0 	. . 
	jp nz,l0dfeh		;0d52	c2 fe 0d 	. . . 
	push af			;0d55	f5 	. 
	call sub_0e1dh		;0d56	cd 1d 0e 	. . . 
	ld a,08fh		;0d59	3e 8f 	> . 
	call sub_0e1fh		;0d5b	cd 1f 0e 	. . . 
	pop af			;0d5e	f1 	. 
	push hl			;0d5f	e5 	. 
	ld hl,l0000h		;0d60	21 00 00 	! . . 
	ex (sp),hl			;0d63	e3 	. 
	jp l0c47h		;0d64	c3 47 0c 	. G . 
l0d67h:
	ld a,(hl)			;0d67	7e 	~ 
	cp 02eh		;0d68	fe 2e 	. . 
	jr z,l0d76h		;0d6a	28 0a 	( . 
	cp 03ah		;0d6c	fe 3a 	. : 
	jp nc,l0dech		;0d6e	d2 ec 0d 	. . . 
	cp 030h		;0d71	fe 30 	. 0 
	jp c,l0dech		;0d73	da ec 0d 	. . . 
l0d76h:
	ld a,(0d2c7h)		;0d76	3a c7 d2 	: . . 
	or a			;0d79	b7 	. 
	ld a,(hl)			;0d7a	7e 	~ 
	pop bc			;0d7b	c1 	. 
	pop de			;0d7c	d1 	. 
	jp m,l0c20h		;0d7d	fa 20 0c 	.   . 
	jr z,l0da1h		;0d80	28 1f 	( . 
	cp 02eh		;0d82	fe 2e 	. . 
	jp z,l0c20h		;0d84	ca 20 0c 	.   . 
	ld a,00eh		;0d87	3e 0e 	> . 
	call sub_0e1fh		;0d89	cd 1f 0e 	. . . 
	push de			;0d8c	d5 	. 
	call sub_10e5h		;0d8d	cd e5 10 	. . . 
	call sub_0e6dh		;0d90	cd 6d 0e 	. m . 
l0d93h:
	ex (sp),hl			;0d93	e3 	. 
	ex de,hl			;0d94	eb 	. 
l0d95h:
	ld a,l			;0d95	7d 	} 
	call sub_0e1fh		;0d96	cd 1f 0e 	. . . 
	ld a,h			;0d99	7c 	| 
l0d9ah:
	pop hl			;0d9a	e1 	. 
	call sub_0e1fh		;0d9b	cd 1f 0e 	. . . 
	jp l0bf9h		;0d9e	c3 f9 0b 	. . . 
l0da1h:
	push de			;0da1	d5 	. 
	push bc			;0da2	c5 	. 
	ld a,(hl)			;0da3	7e 	~ 
	call 03b77h		;0da4	cd 77 3b 	. w ; 
	call sub_0e6dh		;0da7	cd 6d 0e 	. m . 
	pop bc			;0daa	c1 	. 
	pop de			;0dab	d1 	. 
	push hl			;0dac	e5 	. 
	ld a,(0d2c5h)		;0dad	3a c5 d2 	: . . 
	cp 002h		;0db0	fe 02 	. . 
	jr nz,l0dc9h		;0db2	20 15 	  . 
	ld hl,(0d479h)		;0db4	2a 79 d4 	* y . 
	ld a,h			;0db7	7c 	| 
	or a			;0db8	b7 	. 
	ld a,002h		;0db9	3e 02 	> . 
	jr nz,l0dc9h		;0dbb	20 0c 	  . 
	ld a,l			;0dbd	7d 	} 
	ld h,l			;0dbe	65 	e 
	ld l,00fh		;0dbf	2e 0f 	. . 
	cp 00ah		;0dc1	fe 0a 	. . 
	jr nc,l0d95h		;0dc3	30 d0 	0 . 
	add a,011h		;0dc5	c6 11 	. . 
	jr l0d9ah		;0dc7	18 d1 	. . 
l0dc9h:
	push af			;0dc9	f5 	. 
	rrca			;0dca	0f 	. 
	add a,01bh		;0dcb	c6 1b 	. . 
	call sub_0e1fh		;0dcd	cd 1f 0e 	. . . 
	ld hl,0d477h		;0dd0	21 77 d4 	! w . 
	ld a,(0d2c5h)		;0dd3	3a c5 d2 	: . . 
	cp 002h		;0dd6	fe 02 	. . 
	jr nz,l0dddh		;0dd8	20 03 	  . 
	ld hl,0d479h		;0dda	21 79 d4 	! y . 
l0dddh:
	pop af			;0ddd	f1 	. 
l0ddeh:
	push af			;0dde	f5 	. 
	ld a,(hl)			;0ddf	7e 	~ 
	call sub_0e1fh		;0de0	cd 1f 0e 	. . . 
	pop af			;0de3	f1 	. 
	inc hl			;0de4	23 	# 
	dec a			;0de5	3d 	= 
	jr nz,l0ddeh		;0de6	20 f6 	  . 
	pop hl			;0de8	e1 	. 
	jp l0bf9h		;0de9	c3 f9 0b 	. . . 
l0dech:
	ld de,l051eh		;0dec	11 1e 05 	. . . 
l0defh:
	inc de			;0def	13 	. 
	ld a,(de)			;0df0	1a 	. 
	and 07fh		;0df1	e6 7f 	.  
	jp z,l0e53h		;0df3	ca 53 0e 	. S . 
	inc de			;0df6	13 	. 
	cp (hl)			;0df7	be 	. 
	ld a,(de)			;0df8	1a 	. 
	jr nz,l0defh		;0df9	20 f4 	  . 
	jp l0e62h		;0dfb	c3 62 0e 	. b . 
l0dfeh:
	cp 026h		;0dfe	fe 26 	. & 
	jp nz,l0c20h		;0e00	c2 20 0c 	.   . 
	push hl			;0e03	e5 	. 
	rst 10h			;0e04	d7 	. 
	pop hl			;0e05	e1 	. 
	call sub_1877h		;0e06	cd 77 18 	. w . 
	cp 048h		;0e09	fe 48 	. H 
	ld a,00bh		;0e0b	3e 0b 	> . 
	jr nz,l0e11h		;0e0d	20 02 	  . 
	ld a,00ch		;0e0f	3e 0c 	> . 
l0e11h:
	call sub_0e1fh		;0e11	cd 1f 0e 	. . . 
	push de			;0e14	d5 	. 
	push bc			;0e15	c5 	. 
	call sub_1885h		;0e16	cd 85 18 	. . . 
	pop bc			;0e19	c1 	. 
	jp l0d93h		;0e1a	c3 93 0d 	. . . 
sub_0e1dh:
	ld a,03ah		;0e1d	3e 3a 	> : 
sub_0e1fh:
	ld (de),a			;0e1f	12 	. 
	inc de			;0e20	13 	. 
	dec bc			;0e21	0b 	. 
	ld a,c			;0e22	79 	y 
	or b			;0e23	b0 	. 
	ret nz			;0e24	c0 	. 
	ld e,017h		;0e25	1e 17 	. . 
	jp l09ach		;0e27	c3 ac 09 	. . . 
l0e2ah:
	call 0db6dh		;0e2a	cd 6d db 	. m . 
	pop hl			;0e2d	e1 	. 
	dec hl			;0e2e	2b 	+ 
	dec a			;0e2f	3d 	= 
	ld (0d2c7h),a		;0e30	32 c7 d2 	2 . . 
	pop bc			;0e33	c1 	. 
	pop de			;0e34	d1 	. 
	call sub_1876h		;0e35	cd 76 18 	. v . 
l0e38h:
	call sub_0e1fh		;0e38	cd 1f 0e 	. . . 
	inc hl			;0e3b	23 	# 
	call sub_1876h		;0e3c	cd 76 18 	. v . 
	call 04441h		;0e3f	cd 41 44 	. A D 
	jr nc,l0e38h		;0e42	30 f4 	0 . 
	cp 03ah		;0e44	fe 3a 	. : 
	jr nc,l0e50h		;0e46	30 08 	0 . 
	cp 030h		;0e48	fe 30 	. 0 
	jr nc,l0e38h		;0e4a	30 ec 	0 . 
	cp 02eh		;0e4c	fe 2e 	. . 
	jr z,l0e38h		;0e4e	28 e8 	( . 
l0e50h:
	jp l0bf9h		;0e50	c3 f9 0b 	. . . 
l0e53h:
	ld a,(hl)			;0e53	7e 	~ 
	cp 020h		;0e54	fe 20 	.   
	jr nc,l0e62h		;0e56	30 0a 	0 . 
	cp 009h		;0e58	fe 09 	. . 
	jr z,l0e62h		;0e5a	28 06 	( . 
	cp 00ah		;0e5c	fe 0a 	. . 
	jr z,l0e62h		;0e5e	28 02 	( . 
	ld a,020h		;0e60	3e 20 	>   
l0e62h:
	push af			;0e62	f5 	. 
	ld a,(0d2c7h)		;0e63	3a c7 d2 	: . . 
	inc a			;0e66	3c 	< 
	jr z,l0e6ah		;0e67	28 01 	( . 
	dec a			;0e69	3d 	= 
l0e6ah:
	jp l0d3ah		;0e6a	c3 3a 0d 	. : . 
sub_0e6dh:
	dec hl			;0e6d	2b 	+ 
	ld a,(hl)			;0e6e	7e 	~ 
	cp 020h		;0e6f	fe 20 	.   
	jr z,sub_0e6dh		;0e71	28 fa 	( . 
	cp 009h		;0e73	fe 09 	. . 
	jr z,sub_0e6dh		;0e75	28 f6 	( . 
	cp 00ah		;0e77	fe 0a 	. . 
	jr z,sub_0e6dh		;0e79	28 f2 	( . 
	inc hl			;0e7b	23 	# 
	ret			;0e7c	c9 	. 
	ld a,064h		;0e7d	3e 64 	> d 
	ld (0d303h),a		;0e7f	32 03 d3 	2 . . 
	call 04cb1h		;0e82	cd b1 4c 	. . L 
	rst 8			;0e85	cf 	. 
	rst 28h			;0e86	ef 	. 
	push de			;0e87	d5 	. 
	ld (0d305h),de		;0e88	ed 53 05 d3 	. S . . 
	ld a,(0d2c5h)		;0e8c	3a c5 d2 	: . . 
	push af			;0e8f	f5 	. 
	call sub_1645h		;0e90	cd 45 16 	. E . 
	pop af			;0e93	f1 	. 
	push hl			;0e94	e5 	. 
	call sub_1ba5h		;0e95	cd a5 1b 	. . . 
	ld hl,0d41eh		;0e98	21 1e d4 	! . . 
	call 03774h		;0e9b	cd 74 37 	. t 7 
	pop hl			;0e9e	e1 	. 
	pop de			;0e9f	d1 	. 
	pop bc			;0ea0	c1 	. 
	push hl			;0ea1	e5 	. 
	call sub_119fh		;0ea2	cd 9f 11 	. . . 
	ld (0d2ffh),hl		;0ea5	22 ff d2 	" . . 
	ld hl,l0000h+2		;0ea8	21 02 00 	! . . 
	add hl,sp			;0eab	39 	9 
l0each:
	call l094fh		;0eac	cd 4f 09 	. O . 
	jr nz,25		;0eaf	20 17 	  . 
	add hl,bc			;0eb1	09 	. 
	push de			;0eb2	d5 	. 
	dec hl			;0eb3	2b 	+ 
	ld d,(hl)			;0eb4	56 	V 
	dec hl			;0eb5	2b 	+ 
	ld e,(hl)			;0eb6	5e 	^ 
	inc hl			;0eb7	23 	# 
	inc hl			;0eb8	23 	# 
	push hl			;0eb9	e5 	. 
	ld hl,(0d2ffh)		;0eba	2a ff d2 	* . . 
	rst 20h			;0ebd	e7 	. 
	pop hl			;0ebe	e1 	. 
	pop de			;0ebf	d1 	. 
	jr nz,l0each		;0ec0	20 ea 	  . 
	pop de			;0ec2	d1 	. 
	ld sp,hl			;0ec3	f9 	. 
	ld (0d30fh),hl		;0ec4	22 0f d3 	" . . 
	ld c,0d1h		;0ec7	0e d1 	. . 
	ex de,hl			;0ec9	eb 	. 
	ld c,00ch		;0eca	0e 0c 	. . 
	call 0425bh		;0ecc	cd 5b 42 	. [ B 
	push hl			;0ecf	e5 	. 
	ld hl,(0d2ffh)		;0ed0	2a ff d2 	* . . 
	ex (sp),hl			;0ed3	e3 	. 
	push hl			;0ed4	e5 	. 
	ld hl,(0d051h)		;0ed5	2a 51 d0 	* Q . 
	ex (sp),hl			;0ed8	e3 	. 
	rst 8			;0ed9	cf 	. 
	out (0f7h),a		;0eda	d3 f7 	. . 
	jp z,009aah		;0edc	ca aa 09 	. . . 
	push af			;0edf	f5 	. 
	call sub_1645h		;0ee0	cd 45 16 	. E . 
	pop af			;0ee3	f1 	. 
	push hl			;0ee4	e5 	. 
	jr nc,l0effh		;0ee5	30 18 	0 . 
	jp p,l0f34h		;0ee7	f2 34 0f 	. 4 . 
	call 037eah		;0eea	cd ea 37 	. . 7 
	ex (sp),hl			;0eed	e3 	. 
	ld de,l0000h+1		;0eee	11 01 00 	. . . 
	ld a,(hl)			;0ef1	7e 	~ 
	cp 0d6h		;0ef2	fe d6 	. . 
	call z,sub_1c20h		;0ef4	cc 20 1c 	.   . 
	push de			;0ef7	d5 	. 
	push hl			;0ef8	e5 	. 
	ex de,hl			;0ef9	eb 	. 
	call 0370fh		;0efa	cd 0f 37 	. . 7 
	jr l0f58h		;0efd	18 59 	. Y 
l0effh:
	call 0389ah		;0eff	cd 9a 38 	. . 8 
	pop de			;0f02	d1 	. 
	ld hl,0fff8h		;0f03	21 f8 ff 	! . . 
	add hl,sp			;0f06	39 	9 
	ld sp,hl			;0f07	f9 	. 
	push de			;0f08	d5 	. 
	call 03774h		;0f09	cd 74 37 	. t 7 
	pop hl			;0f0c	e1 	. 
	ld a,(hl)			;0f0d	7e 	~ 
	cp 0d6h		;0f0e	fe d6 	. . 
	ld de,0357bh		;0f10	11 7b 35 	. { 5 
	ld a,001h		;0f13	3e 01 	> . 
	jr nz,l0f24h		;0f15	20 0d 	  . 
	rst 10h			;0f17	d7 	. 
	call sub_1645h		;0f18	cd 45 16 	. E . 
	push hl			;0f1b	e5 	. 
	call 0389ah		;0f1c	cd 9a 38 	. . 8 
	rst 28h			;0f1f	ef 	. 
	ld de,0d477h		;0f20	11 77 d4 	. w . 
	pop hl			;0f23	e1 	. 
l0f24h:
	ld b,h			;0f24	44 	D 
	ld c,l			;0f25	4d 	M 
	ld hl,0fff8h		;0f26	21 f8 ff 	! . . 
	add hl,sp			;0f29	39 	9 
	ld sp,hl			;0f2a	f9 	. 
	push af			;0f2b	f5 	. 
	push bc			;0f2c	c5 	. 
	call 03757h		;0f2d	cd 57 37 	. W 7 
	pop hl			;0f30	e1 	. 
	pop af			;0f31	f1 	. 
	jr l0f5fh		;0f32	18 2b 	. + 
l0f34h:
	call 03812h		;0f34	cd 12 38 	. . 8 
	call 03730h		;0f37	cd 30 37 	. 0 7 
	pop hl			;0f3a	e1 	. 
	push bc			;0f3b	c5 	. 
	push de			;0f3c	d5 	. 
	ld bc,l1041h		;0f3d	01 41 10 	. A . 
	ld de,l0000h		;0f40	11 00 00 	. . . 
	call 0db97h		;0f43	cd 97 db 	. . . 
	ld a,(hl)			;0f46	7e 	~ 
	cp 0d6h		;0f47	fe d6 	. . 
	ld a,001h		;0f49	3e 01 	> . 
	jr nz,l0f59h		;0f4b	20 0c 	  . 
	call sub_1646h		;0f4d	cd 46 16 	. F . 
	push hl			;0f50	e5 	. 
	call 03812h		;0f51	cd 12 38 	. . 8 
	call 03730h		;0f54	cd 30 37 	. 0 7 
	rst 28h			;0f57	ef 	. 
l0f58h:
	pop hl			;0f58	e1 	. 
l0f59h:
	push de			;0f59	d5 	. 
	push bc			;0f5a	c5 	. 
	push bc			;0f5b	c5 	. 
	push bc			;0f5c	c5 	. 
	push bc			;0f5d	c5 	. 
	push bc			;0f5e	c5 	. 
l0f5fh:
	or a			;0f5f	b7 	. 
	jr nz,l0f64h		;0f60	20 02 	  . 
	ld a,002h		;0f62	3e 02 	> . 
l0f64h:
	ld c,a			;0f64	4f 	O 
	rst 30h			;0f65	f7 	. 
	ld b,a			;0f66	47 	G 
	push bc			;0f67	c5 	. 
	dec hl			;0f68	2b 	+ 
	rst 10h			;0f69	d7 	. 
	jp nz,l0992h		;0f6a	c2 92 09 	. . . 
	call 020deh		;0f6d	cd de 20 	. .   
	rst 10h			;0f70	d7 	. 
	push hl			;0f71	e5 	. 
	push hl			;0f72	e5 	. 
	ld hl,(0d426h)		;0f73	2a 26 d4 	* & . 
	ld (0d051h),hl		;0f76	22 51 d0 	" Q . 
	ld hl,(0d305h)		;0f79	2a 05 d3 	* . . 
	ex (sp),hl			;0f7c	e3 	. 
	ld b,082h		;0f7d	06 82 	. . 
	push bc			;0f7f	c5 	. 
	inc sp			;0f80	33 	3 
	push af			;0f81	f5 	. 
	push af			;0f82	f5 	. 
	jp 044c7h		;0f83	c3 c7 44 	. . D 
	ld b,082h		;0f86	06 82 	. . 
	push bc			;0f88	c5 	. 
	inc sp			;0f89	33 	3 
l0f8ah:
	call 0db6ah		;0f8a	cd 6a db 	. j . 
	call 021efh		;0f8d	cd ef 21 	. . ! 
	call nz,05290h		;0f90	c4 90 52 	. . R 
	ld (0d30dh),hl		;0f93	22 0d d3 	" . . 
	ld (0d30fh),sp		;0f96	ed 73 0f d3 	. s . . 
	ld a,(hl)			;0f9a	7e 	~ 
	cp 03ah		;0f9b	fe 3a 	. : 
	jr z,l0fc4h		;0f9d	28 25 	( % 
	or a			;0f9f	b7 	. 
	jp nz,l0992h		;0fa0	c2 92 09 	. . . 
	inc hl			;0fa3	23 	# 
l0fa4h:
	ld a,(hl)			;0fa4	7e 	~ 
	inc hl			;0fa5	23 	# 
	or (hl)			;0fa6	b6 	. 
	jp z,l0974h		;0fa7	ca 74 09 	. t . 
	inc hl			;0faa	23 	# 
	ld e,(hl)			;0fab	5e 	^ 
	inc hl			;0fac	23 	# 
	ld d,(hl)			;0fad	56 	V 
	ex de,hl			;0fae	eb 	. 
	ld (0d051h),hl		;0faf	22 51 d0 	" Q . 
	ld a,(0d441h)		;0fb2	3a 41 d4 	: A . 
	or a			;0fb5	b7 	. 
	jr z,l0fc3h		;0fb6	28 0b 	( . 
	push de			;0fb8	d5 	. 
	ld a,05bh		;0fb9	3e 5b 	> [ 
	rst 18h			;0fbb	df 	. 
	call 03cfah		;0fbc	cd fa 3c 	. . < 
	ld a,05dh		;0fbf	3e 5d 	> ] 
	rst 18h			;0fc1	df 	. 
	pop de			;0fc2	d1 	. 
l0fc3h:
	ex de,hl			;0fc3	eb 	. 
l0fc4h:
	rst 10h			;0fc4	d7 	. 
	ld de,l0f8ah		;0fc5	11 8a 0f 	. . . 
	push de			;0fc8	d5 	. 
	ret z			;0fc9	c8 	. 
l0fcah:
	call 0db4ch		;0fca	cd 4c db 	. L . 
	sub 081h		;0fcd	d6 81 	. . 
	jp c,l11c4h		;0fcf	da c4 11 	. . . 
	cp 051h		;0fd2	fe 51 	. Q 
	jp nc,l1bd8h		;0fd4	d2 d8 1b 	. . . 
	rlca			;0fd7	07 	. 
	ld c,a			;0fd8	4f 	O 
	ld b,000h		;0fd9	06 00 	. . 
	ex de,hl			;0fdb	eb 	. 
	ld hl,l0177h		;0fdc	21 77 01 	! w . 
	add hl,bc			;0fdf	09 	. 
	ld c,(hl)			;0fe0	4e 	N 
	inc hl			;0fe1	23 	# 
	ld b,(hl)			;0fe2	46 	F 
	push bc			;0fe3	c5 	. 
	ex de,hl			;0fe4	eb 	. 
l0fe5h:
	inc hl			;0fe5	23 	# 
sub_0fe6h:
	ld a,(hl)			;0fe6	7e 	~ 
	cp 03ah		;0fe7	fe 3a 	. : 
	ret nc			;0fe9	d0 	. 
l0feah:
	cp 020h		;0fea	fe 20 	.   
	jr z,l0fe5h		;0fec	28 f7 	( . 
	jr nc,l105ch		;0fee	30 6c 	0 l 
	or a			;0ff0	b7 	. 
	ret z			;0ff1	c8 	. 
	cp 00bh		;0ff2	fe 0b 	. . 
	jr c,l1057h		;0ff4	38 61 	8 a 
	cp 01eh		;0ff6	fe 1e 	. . 
	jr nz,l0fffh		;0ff8	20 05 	  . 
	ld a,(0d2cah)		;0ffa	3a ca d2 	: . . 
	or a			;0ffd	b7 	. 
	ret			;0ffe	c9 	. 
l0fffh:
	cp 010h		;0fff	fe 10 	. . 
	jr z,l1037h		;1001	28 34 	( 4 
	push af			;1003	f5 	. 
	inc hl			;1004	23 	# 
	ld (0d2cah),a		;1005	32 ca d2 	2 . . 
	sub 01ch		;1008	d6 1c 	. . 
	jr nc,l103ch		;100a	30 30 	0 0 
	sub 0f5h		;100c	d6 f5 	. . 
	jr nc,l1016h		;100e	30 06 	0 . 
	cp 0feh		;1010	fe fe 	. . 
	jr nz,l102ah		;1012	20 16 	  . 
	ld a,(hl)			;1014	7e 	~ 
	inc hl			;1015	23 	# 
l1016h:
	ld (0d2c8h),hl		;1016	22 c8 d2 	" . . 
	ld h,000h		;1019	26 00 	& . 
l101bh:
	ld l,a			;101b	6f 	o 
	ld (0d2cch),hl		;101c	22 cc d2 	" . . 
	ld a,002h		;101f	3e 02 	> . 
	ld (0d2cbh),a		;1021	32 cb d2 	2 . . 
	ld hl,l1062h		;1024	21 62 10 	! b . 
	pop af			;1027	f1 	. 
	or a			;1028	b7 	. 
	ret			;1029	c9 	. 
l102ah:
	ld a,(hl)			;102a	7e 	~ 
	inc hl			;102b	23 	# 
	inc hl			;102c	23 	# 
	ld (0d2c8h),hl		;102d	22 c8 d2 	" . . 
	dec hl			;1030	2b 	+ 
	ld h,(hl)			;1031	66 	f 
	jr l101bh		;1032	18 e7 	. . 
l1034h:
	call sub_1064h		;1034	cd 64 10 	. d . 
l1037h:
	ld hl,(0d2c8h)		;1037	2a c8 d2 	* . . 
	jr sub_0fe6h		;103a	18 aa 	. . 
l103ch:
	inc a			;103c	3c 	< 
	rlca			;103d	07 	. 
	ld (0d2cbh),a		;103e	32 cb d2 	2 . . 
l1041h:
	push de			;1041	d5 	. 
	push bc			;1042	c5 	. 
	ld de,0d2cch		;1043	11 cc d2 	. . . 
	ex de,hl			;1046	eb 	. 
	ld b,a			;1047	47 	G 
	call 0375bh		;1048	cd 5b 37 	. [ 7 
	ex de,hl			;104b	eb 	. 
	pop bc			;104c	c1 	. 
	pop de			;104d	d1 	. 
	ld (0d2c8h),hl		;104e	22 c8 d2 	" . . 
	pop af			;1051	f1 	. 
	ld hl,l1062h		;1052	21 62 10 	! b . 
	or a			;1055	b7 	. 
	ret			;1056	c9 	. 
l1057h:
	cp 009h		;1057	fe 09 	. . 
	jp nc,l0fe5h		;1059	d2 e5 0f 	. . . 
l105ch:
	cp 030h		;105c	fe 30 	. 0 
	ccf			;105e	3f 	? 
	inc a			;105f	3c 	< 
	dec a			;1060	3d 	= 
	ret			;1061	c9 	. 
l1062h:
	ld e,010h		;1062	1e 10 	. . 
sub_1064h:
	ld a,(0d2cah)		;1064	3a ca d2 	: . . 
	cp 00fh		;1067	fe 0f 	. . 
	jr nc,l107eh		;1069	30 13 	0 . 
	cp 00dh		;106b	fe 0d 	. . 
	jr c,l107eh		;106d	38 0f 	8 . 
	ld hl,(0d2cch)		;106f	2a cc d2 	* . . 
	jr nz,l107bh		;1072	20 07 	  . 
	inc hl			;1074	23 	# 
	inc hl			;1075	23 	# 
	inc hl			;1076	23 	# 
	ld e,(hl)			;1077	5e 	^ 
	inc hl			;1078	23 	# 
	ld d,(hl)			;1079	56 	V 
	ex de,hl			;107a	eb 	. 
l107bh:
	jp 03a9dh		;107b	c3 9d 3a 	. . : 
l107eh:
	ld a,(0d2cbh)		;107e	3a cb d2 	: . . 
	ld (0d2c5h),a		;1081	32 c5 d2 	2 . . 
	cp 002h		;1084	fe 02 	. . 
	jr nz,l108eh		;1086	20 06 	  . 
	ld hl,(0d2cch)		;1088	2a cc d2 	* . . 
	ld (0d479h),hl		;108b	22 79 d4 	" y . 
l108eh:
	ld hl,0d2cch		;108e	21 cc d2 	! . . 
	jp 0376ch		;1091	c3 6c 37 	. l 7 
	ld e,003h		;1094	1e 03 	. . 
	ld bc,l021eh		;1096	01 1e 02 	. . . 
	ld bc,l041eh		;1099	01 1e 04 	. . . 
	ld bc,l081eh		;109c	01 1e 08 	. . . 
l109fh:
	call 04440h		;109f	cd 40 44 	. @ D 
	ld bc,l0992h		;10a2	01 92 09 	. . . 
	push bc			;10a5	c5 	. 
	ret c			;10a6	d8 	. 
	sub 041h		;10a7	d6 41 	. A 
	ld c,a			;10a9	4f 	O 
	ld b,a			;10aa	47 	G 
	rst 10h			;10ab	d7 	. 
	cp 0f2h		;10ac	fe f2 	. . 
	jr nz,l10b9h		;10ae	20 09 	  . 
	rst 10h			;10b0	d7 	. 
	call 04440h		;10b1	cd 40 44 	. @ D 
	ret c			;10b4	d8 	. 
	sub 041h		;10b5	d6 41 	. A 
	ld b,a			;10b7	47 	G 
	rst 10h			;10b8	d7 	. 
l10b9h:
	ld a,b			;10b9	78 	x 
	sub c			;10ba	91 	. 
	ret c			;10bb	d8 	. 
	inc a			;10bc	3c 	< 
	ex (sp),hl			;10bd	e3 	. 
	ld hl,0d328h		;10be	21 28 d3 	! ( . 
	ld b,000h		;10c1	06 00 	. . 
	add hl,bc			;10c3	09 	. 
l10c4h:
	ld (hl),e			;10c4	73 	s 
	inc hl			;10c5	23 	# 
	dec a			;10c6	3d 	= 
	jr nz,l10c4h		;10c7	20 fb 	  . 
	pop hl			;10c9	e1 	. 
	ld a,(hl)			;10ca	7e 	~ 
	cp 02ch		;10cb	fe 2c 	. , 
	ret nz			;10cd	c0 	. 
	rst 10h			;10ce	d7 	. 
	jr l109fh		;10cf	18 ce 	. . 
	rst 10h			;10d1	d7 	. 
	call sub_1c21h		;10d2	cd 21 1c 	. ! . 
	ret p			;10d5	f0 	. 
l10d6h:
	ld e,005h		;10d6	1e 05 	. . 
	jp l09ach		;10d8	c3 ac 09 	. . . 
sub_10dbh:
	ld a,(hl)			;10db	7e 	~ 
	cp 02eh		;10dc	fe 2e 	. . 
	ld de,(0d313h)		;10de	ed 5b 13 d3 	. [ . . 
	jp z,l0fe5h		;10e2	ca e5 0f 	. . . 
sub_10e5h:
	dec hl			;10e5	2b 	+ 
sub_10e6h:
	rst 10h			;10e6	d7 	. 
	cp 00eh		;10e7	fe 0e 	. . 
	jr z,l10edh		;10e9	28 02 	( . 
	cp 00dh		;10eb	fe 0d 	. . 
l10edh:
	ld de,(0d2cch)		;10ed	ed 5b cc d2 	. [ . . 
	jp z,l0fe5h		;10f1	ca e5 0f 	. . . 
	xor a			;10f4	af 	. 
	ld (0d2cah),a		;10f5	32 ca d2 	2 . . 
	ld de,l0000h		;10f8	11 00 00 	. . . 
	dec hl			;10fb	2b 	+ 
l10fch:
	rst 10h			;10fc	d7 	. 
	ret nc			;10fd	d0 	. 
	push hl			;10fe	e5 	. 
	push af			;10ff	f5 	. 
	ld hl,l1997h+1		;1100	21 98 19 	! . . 
	rst 20h			;1103	e7 	. 
	jr c,l1117h		;1104	38 11 	8 . 
	ld h,d			;1106	62 	b 
	ld l,e			;1107	6b 	k 
	add hl,de			;1108	19 	. 
	add hl,hl			;1109	29 	) 
	add hl,de			;110a	19 	. 
	add hl,hl			;110b	29 	) 
	pop af			;110c	f1 	. 
	sub 030h		;110d	d6 30 	. 0 
	ld e,a			;110f	5f 	_ 
	ld d,000h		;1110	16 00 	. . 
	add hl,de			;1112	19 	. 
	ex de,hl			;1113	eb 	. 
	pop hl			;1114	e1 	. 
	jr l10fch		;1115	18 e5 	. . 
l1117h:
	pop af			;1117	f1 	. 
	pop hl			;1118	e1 	. 
	ret			;1119	c9 	. 
l111ah:
	jp z,042b7h		;111a	ca b7 42 	. . B 
	cp 00eh		;111d	fe 0e 	. . 
	jr z,l1126h		;111f	28 05 	( . 
	cp 00dh		;1121	fe 0d 	. . 
	jp nz,0dbfah		;1123	c2 fa db 	. . . 
l1126h:
	call 042beh		;1126	cd be 42 	. . B 
	ld bc,l0f8ah		;1129	01 8a 0f 	. . . 
	jr l1144h		;112c	18 16 	. . 
	ld c,003h		;112e	0e 03 	. . 
	call 0425bh		;1130	cd 5b 42 	. [ B 
	call sub_10e5h		;1133	cd e5 10 	. . . 
	pop bc			;1136	c1 	. 
	push hl			;1137	e5 	. 
	push hl			;1138	e5 	. 
	ld hl,(0d051h)		;1139	2a 51 d0 	* Q . 
	ex (sp),hl			;113c	e3 	. 
	ld a,08dh		;113d	3e 8d 	> . 
	push af			;113f	f5 	. 
	inc sp			;1140	33 	3 
	push bc			;1141	c5 	. 
	jr l1148h		;1142	18 04 	. . 
l1144h:
	push bc			;1144	c5 	. 
l1145h:
	call sub_10e5h		;1145	cd e5 10 	. . . 
l1148h:
	ld a,(0d2cah)		;1148	3a ca d2 	: . . 
	cp 00dh		;114b	fe 0d 	. . 
	ex de,hl			;114d	eb 	. 
	ret z			;114e	c8 	. 
	cp 00eh		;114f	fe 0e 	. . 
	jp nz,l0992h		;1151	c2 92 09 	. . . 
	ex de,hl			;1154	eb 	. 
	push hl			;1155	e5 	. 
	ld hl,(0d2c8h)		;1156	2a c8 d2 	* . . 
	ex (sp),hl			;1159	e3 	. 
	call sub_119fh+2		;115a	cd a1 11 	. . . 
	inc hl			;115d	23 	# 
	push hl			;115e	e5 	. 
	ld hl,(0d051h)		;115f	2a 51 d0 	* Q . 
	rst 20h			;1162	e7 	. 
	pop hl			;1163	e1 	. 
	call c,l0bcfh		;1164	dc cf 0b 	. . . 
	call nc,sub_0bcch		;1167	d4 cc 0b 	. . . 
	jr nc,l1179h		;116a	30 0d 	0 . 
	dec bc			;116c	0b 	. 
	ld a,00dh		;116d	3e 0d 	> . 
	ld (0d307h),a		;116f	32 07 d3 	2 . . 
	pop hl			;1172	e1 	. 
	call 02033h		;1173	cd 33 20 	. 3   
	ld h,b			;1176	60 	` 
	ld l,c			;1177	69 	i 
	ret			;1178	c9 	. 
l1179h:
	ld e,008h		;1179	1e 08 	. . 
	jp l09ach		;117b	c3 ac 09 	. . . 
	call 0db8eh		;117e	cd 8e db 	. . . 
	ret nz			;1181	c0 	. 
	ld d,0ffh		;1182	16 ff 	. . 
	call sub_094bh		;1184	cd 4b 09 	. K . 
	cp 08dh		;1187	fe 8d 	. . 
	jr z,l118ch		;1189	28 01 	( . 
	dec hl			;118b	2b 	+ 
l118ch:
	ld sp,hl			;118c	f9 	. 
	ld (0d30fh),hl		;118d	22 0f d3 	" . . 
	ld e,003h		;1190	1e 03 	. . 
	jp nz,l09ach		;1192	c2 ac 09 	. . . 
	pop hl			;1195	e1 	. 
	ld (0d051h),hl		;1196	22 51 d0 	" Q . 
	ld hl,l0f8ah		;1199	21 8a 0f 	! . . 
	ex (sp),hl			;119c	e3 	. 
	ld a,0e1h		;119d	3e e1 	> . 
sub_119fh:
	ld bc,l0e38h+2		;119f	01 3a 0e 	. : . 
	nop			;11a2	00 	. 
	ld b,000h		;11a3	06 00 	. . 
l11a5h:
	ld a,c			;11a5	79 	y 
	ld c,b			;11a6	48 	H 
	ld b,a			;11a7	47 	G 
l11a8h:
	dec hl			;11a8	2b 	+ 
l11a9h:
	rst 10h			;11a9	d7 	. 
	or a			;11aa	b7 	. 
	ret z			;11ab	c8 	. 
	cp b			;11ac	b8 	. 
	ret z			;11ad	c8 	. 
	inc hl			;11ae	23 	# 
	cp 022h		;11af	fe 22 	. " 
	jr z,l11a5h		;11b1	28 f2 	( . 
	inc a			;11b3	3c 	< 
	jr z,l11a9h		;11b4	28 f3 	( . 
	sub 08ch		;11b6	d6 8c 	. . 
	jr nz,l11a8h		;11b8	20 ee 	  . 
	cp b			;11ba	b8 	. 
	adc a,d			;11bb	8a 	. 
	ld d,a			;11bc	57 	W 
	jr l11a8h		;11bd	18 e9 	. . 
	pop af			;11bf	f1 	. 
	add a,003h		;11c0	c6 03 	. . 
	jr l11d6h		;11c2	18 12 	. . 
l11c4h:
	call 04cb1h		;11c4	cd b1 4c 	. . L 
	rst 8			;11c7	cf 	. 
	rst 28h			;11c8	ef 	. 
	ld (0d305h),de		;11c9	ed 53 05 d3 	. S . . 
	push de			;11cd	d5 	. 
	ld a,(0d2c5h)		;11ce	3a c5 d2 	: . . 
	push af			;11d1	f5 	. 
	call sub_1645h		;11d2	cd 45 16 	. E . 
	pop af			;11d5	f1 	. 
l11d6h:
	ex (sp),hl			;11d6	e3 	. 
l11d7h:
	ld b,a			;11d7	47 	G 
	ld a,(0d2c5h)		;11d8	3a c5 d2 	: . . 
	cp b			;11db	b8 	. 
	ld a,b			;11dc	78 	x 
	jr z,l11e5h		;11dd	28 06 	( . 
	call sub_1ba5h		;11df	cd a5 1b 	. . . 
l11e2h:
	ld a,(0d2c5h)		;11e2	3a c5 d2 	: . . 
l11e5h:
	ld de,0d477h		;11e5	11 77 d4 	. w . 
	cp 002h		;11e8	fe 02 	. . 
	jr nz,l11efh		;11ea	20 03 	  . 
	ld de,0d479h		;11ec	11 79 d4 	. y . 
l11efh:
	push hl			;11ef	e5 	. 
	cp 003h		;11f0	fe 03 	. . 
	jr nz,l1222h		;11f2	20 2e 	  . 
	ld hl,(0d479h)		;11f4	2a 79 d4 	* y . 
	push hl			;11f7	e5 	. 
	inc hl			;11f8	23 	# 
	ld e,(hl)			;11f9	5e 	^ 
	inc hl			;11fa	23 	# 
	ld d,(hl)			;11fb	56 	V 
	ld hl,0d080h		;11fc	21 80 d0 	! . . 
	rst 20h			;11ff	e7 	. 
	jr c,22		;1200	38 14 	8 . 
	ld hl,(0d324h)		;1202	2a 24 d3 	* $ . 
	rst 20h			;1205	e7 	. 
	pop de			;1206	d1 	. 
	jr nc,l121eh		;1207	30 15 	0 . 
	ld hl,0d2f5h		;1209	21 f5 d2 	! . . 
	rst 20h			;120c	e7 	. 
	jr c,l1215h		;120d	38 06 	8 . 
	ld hl,0d2d7h		;120f	21 d7 d2 	! . . 
	rst 20h			;1212	e7 	. 
	jr c,l121eh		;1213	38 09 	8 . 
l1215h:
	ld a,0d1h		;1215	3e d1 	> . 
	call 02c9dh		;1217	cd 9d 2c 	. . , 
	ex de,hl			;121a	eb 	. 
	call 02aa2h		;121b	cd a2 2a 	. . * 
l121eh:
	call 02c9dh		;121e	cd 9d 2c 	. . , 
	ex (sp),hl			;1221	e3 	. 
l1222h:
	call 03757h		;1222	cd 57 37 	. W 7 
	pop de			;1225	d1 	. 
	pop hl			;1226	e1 	. 
	ret			;1227	c9 	. 
	cp 0a7h		;1228	fe a7 	. . 
	jr nz,l1251h		;122a	20 25 	  % 
	rst 10h			;122c	d7 	. 
	rst 8			;122d	cf 	. 
	adc a,c			;122e	89 	. 
	call sub_10e5h		;122f	cd e5 10 	. . . 
	ld a,d			;1232	7a 	z 
	or e			;1233	b3 	. 
	jr z,l123fh		;1234	28 09 	( . 
	call sub_0bcah		;1236	cd ca 0b 	. . . 
	ld d,b			;1239	50 	P 
	ld e,c			;123a	59 	Y 
	pop hl			;123b	e1 	. 
	jp nc,l1179h		;123c	d2 79 11 	. y . 
l123fh:
	ld (0d317h),de		;123f	ed 53 17 d3 	. S . . 
	ret c			;1243	d8 	. 
	ld a,(0d319h)		;1244	3a 19 d3 	: . . 
	or a			;1247	b7 	. 
	ld a,e			;1248	7b 	{ 
	ret z			;1249	c8 	. 
	ld a,(0d046h)		;124a	3a 46 d0 	: F . 
	ld e,a			;124d	5f 	_ 
	jp l09c5h		;124e	c3 c5 09 	. . . 
l1251h:
	call sub_1c2eh		;1251	cd 2e 1c 	. . . 
	ld a,(hl)			;1254	7e 	~ 
	ld b,a			;1255	47 	G 
	cp 08dh		;1256	fe 8d 	. . 
	jr z,l125dh		;1258	28 03 	( . 
	rst 8			;125a	cf 	. 
	adc a,c			;125b	89 	. 
	dec hl			;125c	2b 	+ 
l125dh:
	ld c,e			;125d	4b 	K 
l125eh:
	dec c			;125e	0d 	. 
	ld a,b			;125f	78 	x 
	jp z,l0fcah		;1260	ca ca 0f 	. . . 
	call sub_10e6h		;1263	cd e6 10 	. . . 
	cp 02ch		;1266	fe 2c 	. , 
	ret nz			;1268	c0 	. 
	jr l125eh		;1269	18 f3 	. . 
	ld a,(0d319h)		;126b	3a 19 d3 	: . . 
	or a			;126e	b7 	. 
	jr nz,l127ah		;126f	20 09 	  . 
	ld (0d317h),a		;1271	32 17 d3 	2 . . 
	ld (0d318h),a		;1274	32 18 d3 	2 . . 
	jp 009a1h		;1277	c3 a1 09 	. . . 
l127ah:
	inc a			;127a	3c 	< 
	ld (0d046h),a		;127b	32 46 d0 	2 F . 
	ld a,(hl)			;127e	7e 	~ 
	cp 083h		;127f	fe 83 	. . 
	jr z,l1293h		;1281	28 10 	( . 
	call sub_10e5h		;1283	cd e5 10 	. . . 
	ret nz			;1286	c0 	. 
	ld a,d			;1287	7a 	z 
	or e			;1288	b3 	. 
	jr z,l1297h		;1289	28 0c 	( . 
	call l1148h		;128b	cd 48 11 	. H . 
	xor a			;128e	af 	. 
	ld (0d319h),a		;128f	32 19 d3 	2 . . 
	ret			;1292	c9 	. 
l1293h:
	rst 10h			;1293	d7 	. 
	ret nz			;1294	c0 	. 
	jr l129ch		;1295	18 05 	. . 
l1297h:
	xor a			;1297	af 	. 
	ld (0d319h),a		;1298	32 19 d3 	2 . . 
	inc a			;129b	3c 	< 
l129ch:
	ld hl,(0d315h)		;129c	2a 15 d3 	* . . 
	ex de,hl			;129f	eb 	. 
	ld hl,(0d311h)		;12a0	2a 11 d3 	* . . 
	ld (0d051h),hl		;12a3	22 51 d0 	" Q . 
	ex de,hl			;12a6	eb 	. 
	ret nz			;12a7	c0 	. 
	ld a,(hl)			;12a8	7e 	~ 
	or a			;12a9	b7 	. 
	jr nz,l12b0h		;12aa	20 04 	  . 
	inc hl			;12ac	23 	# 
	inc hl			;12ad	23 	# 
	inc hl			;12ae	23 	# 
	inc hl			;12af	23 	# 
l12b0h:
	inc hl			;12b0	23 	# 
	xor a			;12b1	af 	. 
	ld (0d319h),a		;12b2	32 19 d3 	2 . . 
	jp sub_119fh		;12b5	c3 9f 11 	. . . 
	call sub_1c2eh		;12b8	cd 2e 1c 	. . . 
	ret nz			;12bb	c0 	. 
	or a			;12bc	b7 	. 
	jp z,l10d6h		;12bd	ca d6 10 	. . . 
	jp l09ach		;12c0	c3 ac 09 	. . . 
	ld de,l000ah		;12c3	11 0a 00 	. . . 
	push de			;12c6	d5 	. 
	jr z,l12dfh		;12c7	28 16 	( . 
	call sub_10dbh		;12c9	cd db 10 	. . . 
	ex de,hl			;12cc	eb 	. 
	ex (sp),hl			;12cd	e3 	. 
	jr z,l12e0h		;12ce	28 10 	( . 
	ex de,hl			;12d0	eb 	. 
	rst 8			;12d1	cf 	. 
	inc l			;12d2	2c 	, 
	ld de,(0d30bh)		;12d3	ed 5b 0b d3 	. [ . . 
	jr z,l12dfh		;12d7	28 06 	( . 
	call sub_10e5h		;12d9	cd e5 10 	. . . 
	jp nz,l0992h		;12dc	c2 92 09 	. . . 
l12dfh:
	ex de,hl			;12df	eb 	. 
l12e0h:
	ld a,h			;12e0	7c 	| 
	or l			;12e1	b5 	. 
	jp z,l10d6h		;12e2	ca d6 10 	. . . 
	ld (0d30bh),hl		;12e5	22 0b d3 	" . . 
	ld (0d308h),a		;12e8	32 08 d3 	2 . . 
	pop hl			;12eb	e1 	. 
	ld (0d309h),hl		;12ec	22 09 d3 	" . . 
	pop bc			;12ef	c1 	. 
	jp l0a65h		;12f0	c3 65 0a 	. e . 
	call sub_1645h		;12f3	cd 45 16 	. E . 
	ld a,(hl)			;12f6	7e 	~ 
	cp 02ch		;12f7	fe 2c 	. , 
	call z,l0fe5h		;12f9	cc e5 0f 	. . . 
	cp 089h		;12fc	fe 89 	. . 
	jr z,5		;12fe	28 03 	( . 
	rst 8			;1300	cf 	. 
	call nc,0e52bh		;1301	d4 2b e5 	. + . 
	call 03705h		;1304	cd 05 37 	. . 7 
	pop hl			;1307	e1 	. 
	jr z,l131ah		;1308	28 10 	( . 
l130ah:
	rst 10h			;130a	d7 	. 
	ret z			;130b	c8 	. 
	cp 00eh		;130c	fe 0e 	. . 
	jp z,l1145h		;130e	ca 45 11 	. E . 
	cp 00dh		;1311	fe 0d 	. . 
	jp nz,l0fcah		;1313	c2 ca 0f 	. . . 
	ld hl,(0d2cch)		;1316	2a cc d2 	* . . 
	ret			;1319	c9 	. 
l131ah:
	ld d,001h		;131a	16 01 	. . 
l131ch:
	call sub_119fh		;131c	cd 9f 11 	. . . 
	or a			;131f	b7 	. 
	ret z			;1320	c8 	. 
	rst 10h			;1321	d7 	. 
	cp 0a1h		;1322	fe a1 	. . 
	jr nz,l131ch		;1324	20 f6 	  . 
	dec d			;1326	15 	. 
	jr nz,l131ch		;1327	20 f3 	  . 
	jr l130ah		;1329	18 df 	. . 
	ld a,001h		;132b	3e 01 	> . 
	ld (0d049h),a		;132d	32 49 d0 	2 I . 
	jp l1338h		;1330	c3 38 13 	. 8 . 
	ld c,002h		;1333	0e 02 	. . 
	call 02428h		;1335	cd 28 24 	. ( $ 
l1338h:
	dec hl			;1338	2b 	+ 
	rst 10h			;1339	d7 	. 
	call z,05268h		;133a	cc 68 52 	. h R 
l133dh:
	jp z,l1463h		;133d	ca 63 14 	. c . 
	cp 0deh		;1340	fe de 	. . 
	jp z,04fbch		;1342	ca bc 4f 	. . O 
	cp 0d5h		;1345	fe d5 	. . 
	jp z,l13f2h		;1347	ca f2 13 	. . . 
	cp 0d9h		;134a	fe d9 	. . 
	jp z,l13f2h		;134c	ca f2 13 	. . . 
	push hl			;134f	e5 	. 
	cp 02ch		;1350	fe 2c 	. , 
	jr z,l13b5h		;1352	28 61 	( a 
	cp 03bh		;1354	fe 3b 	. ; 
	jp z,l145eh		;1356	ca 5e 14 	. ^ . 
	pop bc			;1359	c1 	. 
	call sub_1645h		;135a	cd 45 16 	. E . 
	push hl			;135d	e5 	. 
	rst 30h			;135e	f7 	. 
	jr z,l136dh		;135f	28 0c 	( . 
	call 03d0dh		;1361	cd 0d 3d 	. . = 
	call 02ac6h		;1364	cd c6 2a 	. . * 
	ld (hl),020h		;1367	36 20 	6   
	ld hl,(0d479h)		;1369	2a 79 d4 	* y . 
	inc (hl)			;136c	34 	4 
l136dh:
	call 0db82h		;136d	cd 82 db 	. . . 
	call 045a0h		;1370	cd a0 45 	. . E 
	jr nz,l13aeh		;1373	20 39 	  9 
	ld hl,(0d479h)		;1375	2a 79 d4 	* y . 
	ld a,(0d049h)		;1378	3a 49 d0 	: I . 
	or a			;137b	b7 	. 
	jr z,l1393h		;137c	28 15 	( . 
	ld a,(0d04bh)		;137e	3a 4b d0 	: K . 
	ld b,a			;1381	47 	G 
	inc a			;1382	3c 	< 
	jr z,l13aeh		;1383	28 29 	( ) 
	ld a,(0d048h)		;1385	3a 48 d0 	: H . 
	or a			;1388	b7 	. 
	jr z,l13aeh		;1389	28 23 	( # 
	add a,(hl)			;138b	86 	. 
	ccf			;138c	3f 	? 
	jr nc,l13a6h		;138d	30 17 	0 . 
	dec a			;138f	3d 	= 
	cp b			;1390	b8 	. 
	jr l13a6h		;1391	18 13 	. . 
l1393h:
	ld a,(0d04ch)		;1393	3a 4c d0 	: L . 
	ld b,a			;1396	47 	G 
	inc a			;1397	3c 	< 
	jr z,l13aeh		;1398	28 14 	( . 
	ld a,(0d2c3h)		;139a	3a c3 d2 	: . . 
	or a			;139d	b7 	. 
	jr z,l13aeh		;139e	28 0e 	( . 
	add a,(hl)			;13a0	86 	. 
	ccf			;13a1	3f 	? 
	jr nc,l13a6h		;13a2	30 02 	0 . 
	dec a			;13a4	3d 	= 
	cp b			;13a5	b8 	. 
l13a6h:
	jr c,l13aeh		;13a6	38 06 	8 . 
	call z,05271h		;13a8	cc 71 52 	. q R 
	call nz,05268h		;13ab	c4 68 52 	. h R 
l13aeh:
	call 02b1dh		;13ae	cd 1d 2b 	. . + 
	pop hl			;13b1	e1 	. 
	jp l1338h		;13b2	c3 38 13 	. 8 . 
l13b5h:
	call 0db16h		;13b5	cd 16 db 	. . . 
	ld bc,l0008h		;13b8	01 08 00 	. . . 
	ld hl,(0d4ebh)		;13bb	2a eb d4 	* . . 
	add hl,bc			;13be	09 	. 
	call 045a0h		;13bf	cd a0 45 	. . E 
	ld a,(hl)			;13c2	7e 	~ 
	jr nz,l13ebh		;13c3	20 26 	  & 
	ld a,(0d049h)		;13c5	3a 49 d0 	: I . 
	or a			;13c8	b7 	. 
	jr z,l13d9h		;13c9	28 0e 	( . 
	ld a,(0d04ah)		;13cb	3a 4a d0 	: J . 
	ld b,a			;13ce	47 	G 
	inc a			;13cf	3c 	< 
	ld a,(0d048h)		;13d0	3a 48 d0 	: H . 
	jr z,l13ebh		;13d3	28 16 	( . 
	cp b			;13d5	b8 	. 
	jp l13e5h		;13d6	c3 e5 13 	. . . 
l13d9h:
	ld a,(0d04dh)		;13d9	3a 4d d0 	: M . 
	ld b,a			;13dc	47 	G 
	ld a,(0d2c3h)		;13dd	3a c3 d2 	: . . 
	cp 0ffh		;13e0	fe ff 	. . 
	jr z,l13ebh		;13e2	28 07 	( . 
	cp b			;13e4	b8 	. 
l13e5h:
	call nc,05268h		;13e5	d4 68 52 	. h R 
	jp nc,l145eh		;13e8	d2 5e 14 	. ^ . 
l13ebh:
	sub 00eh		;13eb	d6 0e 	. . 
	jr nc,l13ebh		;13ed	30 fc 	0 . 
	cpl			;13ef	2f 	/ 
	jr l1457h		;13f0	18 65 	. e 
l13f2h:
	push af			;13f2	f5 	. 
	rst 10h			;13f3	d7 	. 
	call sub_1c21h		;13f4	cd 21 1c 	. ! . 
	pop af			;13f7	f1 	. 
	push af			;13f8	f5 	. 
	cp 0d9h		;13f9	fe d9 	. . 
	jr z,l13feh		;13fb	28 01 	( . 
	dec de			;13fd	1b 	. 
l13feh:
	ld a,d			;13fe	7a 	z 
	or a			;13ff	b7 	. 
	jp p,l1406h		;1400	f2 06 14 	. . . 
	ld de,l0000h		;1403	11 00 00 	. . . 
l1406h:
	push hl			;1406	e5 	. 
	call 045a0h		;1407	cd a0 45 	. . E 
	jr nz,l1422h		;140a	20 16 	  . 
	ld a,(0d049h)		;140c	3a 49 d0 	: I . 
	or a			;140f	b7 	. 
	ld a,(0d04bh)		;1410	3a 4b d0 	: K . 
	jr nz,l1418h		;1413	20 03 	  . 
	ld a,(0d04ch)		;1415	3a 4c d0 	: L . 
l1418h:
	ld l,a			;1418	6f 	o 
	inc a			;1419	3c 	< 
	jr z,l1422h		;141a	28 06 	( . 
	ld h,000h		;141c	26 00 	& . 
l141eh:
	call 03aa1h		;141e	cd a1 3a 	. . : 
	ex de,hl			;1421	eb 	. 
l1422h:
	pop hl			;1422	e1 	. 
	rst 8			;1423	cf 	. 
	add hl,hl			;1424	29 	) 
	dec hl			;1425	2b 	+ 
	pop af			;1426	f1 	. 
	sub 0d9h		;1427	d6 d9 	. . 
	push hl			;1429	e5 	. 
	jr z,l1448h		;142a	28 1c 	( . 
	ld bc,l0008h		;142c	01 08 00 	. . . 
	ld hl,(0d4ebh)		;142f	2a eb d4 	* . . 
	add hl,bc			;1432	09 	. 
	call 045a0h		;1433	cd a0 45 	. . E 
	ld a,(hl)			;1436	7e 	~ 
	jr nz,l1448h		;1437	20 0f 	  . 
	ld a,(0d049h)		;1439	3a 49 d0 	: I . 
	or a			;143c	b7 	. 
	jp z,l1445h		;143d	ca 45 14 	. E . 
	ld a,(0d048h)		;1440	3a 48 d0 	: H . 
	jr l1448h		;1443	18 03 	. . 
l1445h:
	ld a,(0d2c3h)		;1445	3a c3 d2 	: . . 
l1448h:
	cpl			;1448	2f 	/ 
	add a,e			;1449	83 	. 
	jr c,l1457h		;144a	38 0b 	8 . 
	inc a			;144c	3c 	< 
	jr z,l145eh		;144d	28 0f 	( . 
	call 05268h		;144f	cd 68 52 	. h R 
	ld a,e			;1452	7b 	{ 
	dec a			;1453	3d 	= 
	jp m,l145eh		;1454	fa 5e 14 	. ^ . 
l1457h:
	inc a			;1457	3c 	< 
	ld b,a			;1458	47 	G 
	ld a,020h		;1459	3e 20 	>   
l145bh:
	rst 18h			;145b	df 	. 
	djnz l145bh		;145c	10 fd 	. . 
l145eh:
	pop hl			;145e	e1 	. 
	rst 10h			;145f	d7 	. 
	jp l133dh		;1460	c3 3d 13 	. = . 
l1463h:
	call 0db3dh		;1463	cd 3d db 	. = . 
	xor a			;1466	af 	. 
	ld (0d049h),a		;1467	32 49 d0 	2 I . 
	push hl			;146a	e5 	. 
	ld h,a			;146b	67 	g 
	ld l,a			;146c	6f 	o 
	ld (0d4ebh),hl		;146d	22 eb d4 	" . . 
	pop hl			;1470	e1 	. 
	ret			;1471	c9 	. 
	cp 085h		;1472	fe 85 	. . 
	jp nz,053e8h		;1474	c2 e8 53 	. . S 
	rst 8			;1477	cf 	. 
	add a,l			;1478	85 	. 
	cp 023h		;1479	fe 23 	. # 
	jp z,0dbbeh		;147b	ca be db 	. . . 
	call 04718h		;147e	cd 18 47 	. . G 
	call sub_14efh		;1481	cd ef 14 	. . . 
	call 04cb1h		;1484	cd b1 4c 	. . L 
	call 038b8h		;1487	cd b8 38 	. . 8 
	push de			;148a	d5 	. 
	push hl			;148b	e5 	. 
	call 04659h		;148c	cd 59 46 	. Y F 
	pop de			;148f	d1 	. 
	pop bc			;1490	c1 	. 
	jp c,04382h		;1491	da 82 43 	. . C 
	push bc			;1494	c5 	. 
	push de			;1495	d5 	. 
	ld b,000h		;1496	06 00 	. . 
	call 02ac9h		;1498	cd c9 2a 	. . * 
	pop hl			;149b	e1 	. 
	ld a,003h		;149c	3e 03 	> . 
	jp l11d6h		;149e	c3 d6 11 	. . . 
l14a1h:
	ccf			;14a1	3f 	? 
	ld d,d			;14a2	52 	R 
	ld h,l			;14a3	65 	e 
	ld h,h			;14a4	64 	d 
	ld l,a			;14a5	6f 	o 
	jr nz,l150eh		;14a6	20 66 	  f 
	ld (hl),d			;14a8	72 	r 
	ld l,a			;14a9	6f 	o 
	ld l,l			;14aa	6d 	m 
	jr nz,l1520h		;14ab	20 73 	  s 
	ld (hl),h			;14ad	74 	t 
	ld h,c			;14ae	61 	a 
	ld (hl),d			;14af	72 	r 
	ld (hl),h			;14b0	74 	t 
	dec c			;14b1	0d 	. 
	ld a,(bc)			;14b2	0a 	. 
	nop			;14b3	00 	. 
l14b4h:
	inc hl			;14b4	23 	# 
	ld a,(hl)			;14b5	7e 	~ 
	or a			;14b6	b7 	. 
	jp z,l0992h		;14b7	ca 92 09 	. . . 
	cp 022h		;14ba	fe 22 	. " 
	jr nz,l14b4h		;14bc	20 f6 	  . 
	jp l1548h		;14be	c3 48 15 	. H . 
l14c1h:
	pop hl			;14c1	e1 	. 
	pop hl			;14c2	e1 	. 
	jr l14cfh		;14c3	18 0a 	. . 
l14c5h:
	call 0db9dh		;14c5	cd 9d db 	. . . 
	ld a,(0d304h)		;14c8	3a 04 d3 	: . . 
	or a			;14cb	b7 	. 
	jp nz,l098ch		;14cc	c2 8c 09 	. . . 
l14cfh:
	pop bc			;14cf	c1 	. 
	ld hl,l14a1h		;14d0	21 a1 14 	! . . 
	call 02b1ah		;14d3	cd 1a 2b 	. . + 
	ld hl,(0d30dh)		;14d6	2a 0d d3 	* . . 
	ret			;14d9	c9 	. 
l14dah:
	call 0dbd6h		;14da	cd d6 db 	. . . 
	push hl			;14dd	e5 	. 
	ld hl,0d1bfh		;14de	21 bf d1 	! . . 
	jp l15a2h		;14e1	c3 a2 15 	. . . 
l14e4h:
	cp 023h		;14e4	fe 23 	. # 
	jr z,l14dah		;14e6	28 f2 	( . 
	call 04718h		;14e8	cd 18 47 	. . G 
	ld bc,l1510h		;14eb	01 10 15 	. . . 
	push bc			;14ee	c5 	. 
sub_14efh:
	cp 022h		;14ef	fe 22 	. " 
	ld a,000h		;14f1	3e 00 	> . 
	ld a,0ffh		;14f3	3e ff 	> . 
	ld (0d42dh),a		;14f5	32 2d d4 	2 - . 
	ret nz			;14f8	c0 	. 
	call 02ac7h		;14f9	cd c7 2a 	. . * 
	ld a,(hl)			;14fc	7e 	~ 
	cp 02ch		;14fd	fe 2c 	. , 
	jr nz,l1508h		;14ff	20 07 	  . 
	xor a			;1501	af 	. 
	ld (0d42dh),a		;1502	32 2d d4 	2 - . 
	rst 10h			;1505	d7 	. 
	jr l150ah		;1506	18 02 	. . 
l1508h:
	rst 8			;1508	cf 	. 
	dec sp			;1509	3b 	; 
l150ah:
	push hl			;150a	e5 	. 
	call 02b1dh		;150b	cd 1d 2b 	. . + 
l150eh:
	pop hl			;150e	e1 	. 
	ret			;150f	c9 	. 
l1510h:
	push hl			;1510	e5 	. 
	ld a,(0d42dh)		;1511	3a 2d d4 	: - . 
	or a			;1514	b7 	. 
	jr z,l151dh		;1515	28 06 	( . 
	ld a,03fh		;1517	3e 3f 	> ? 
	rst 18h			;1519	df 	. 
	ld a,020h		;151a	3e 20 	>   
	rst 18h			;151c	df 	. 
l151dh:
	call 04659h		;151d	cd 59 46 	. Y F 
l1520h:
	pop bc			;1520	c1 	. 
	jp c,04382h		;1521	da 82 43 	. . C 
	push bc			;1524	c5 	. 
	xor a			;1525	af 	. 
	ld (0d304h),a		;1526	32 04 d3 	2 . . 
	ld (hl),02ch		;1529	36 2c 	6 , 
	ex de,hl			;152b	eb 	. 
	pop hl			;152c	e1 	. 
	push hl			;152d	e5 	. 
	push de			;152e	d5 	. 
	push de			;152f	d5 	. 
	dec hl			;1530	2b 	+ 
l1531h:
	ld a,080h		;1531	3e 80 	> . 
	ld (0d303h),a		;1533	32 03 d3 	2 . . 
	rst 10h			;1536	d7 	. 
	call 04d9fh		;1537	cd 9f 4d 	. . M 
	ld a,(hl)			;153a	7e 	~ 
	dec hl			;153b	2b 	+ 
	cp 05bh		;153c	fe 5b 	. [ 
	jr z,l1544h		;153e	28 04 	( . 
	cp 028h		;1540	fe 28 	. ( 
	jr nz,l1563h		;1542	20 1f 	  . 
l1544h:
	inc hl			;1544	23 	# 
	ld b,000h		;1545	06 00 	. . 
l1547h:
	inc b			;1547	04 	. 
l1548h:
	rst 10h			;1548	d7 	. 
	jp z,l0992h		;1549	ca 92 09 	. . . 
	cp 022h		;154c	fe 22 	. " 
	jp z,l14b4h		;154e	ca b4 14 	. . . 
	cp 028h		;1551	fe 28 	. ( 
	jr z,l1547h		;1553	28 f2 	( . 
	cp 05bh		;1555	fe 5b 	. [ 
	jr z,l1548h		;1557	28 ef 	( . 
	cp 05dh		;1559	fe 5d 	. ] 
	jr z,l1561h		;155b	28 04 	( . 
	cp 029h		;155d	fe 29 	. ) 
	jr nz,l1548h		;155f	20 e7 	  . 
l1561h:
	djnz l1548h		;1561	10 e5 	. . 
l1563h:
	rst 10h			;1563	d7 	. 
	jr z,l156bh		;1564	28 05 	( . 
	cp 02ch		;1566	fe 2c 	. , 
	jp nz,l0992h		;1568	c2 92 09 	. . . 
l156bh:
	ex (sp),hl			;156b	e3 	. 
	ld a,(hl)			;156c	7e 	~ 
	cp 02ch		;156d	fe 2c 	. , 
	jp nz,l14c1h		;156f	c2 c1 14 	. . . 
	ld a,001h		;1572	3e 01 	> . 
	ld (0d443h),a		;1574	32 43 d4 	2 C . 
	ld (0d444h),a		;1577	32 44 d4 	2 D . 
	call l15c4h+1		;157a	cd c5 15 	. . . 
	ld a,(0d444h)		;157d	3a 44 d4 	: D . 
	dec a			;1580	3d 	= 
	ld (0d444h),a		;1581	32 44 d4 	2 D . 
	ld a,(0d443h)		;1584	3a 43 d4 	: C . 
	dec a			;1587	3d 	= 
	jp nz,l14c1h		;1588	c2 c1 14 	. . . 
	push hl			;158b	e5 	. 
	rst 30h			;158c	f7 	. 
	call z,02c82h		;158d	cc 82 2c 	. . , 
	pop hl			;1590	e1 	. 
	dec hl			;1591	2b 	+ 
	rst 10h			;1592	d7 	. 
	ex (sp),hl			;1593	e3 	. 
	ld a,(hl)			;1594	7e 	~ 
	cp 02ch		;1595	fe 2c 	. , 
	jp z,l1531h		;1597	ca 31 15 	. 1 . 
	pop hl			;159a	e1 	. 
	dec hl			;159b	2b 	+ 
	rst 10h			;159c	d7 	. 
	or a			;159d	b7 	. 
	pop hl			;159e	e1 	. 
	jp nz,l14cfh		;159f	c2 cf 14 	. . . 
l15a2h:
	ld (hl),02ch		;15a2	36 2c 	6 , 
	jr 7		;15a4	18 05 	. . 
	push hl			;15a6	e5 	. 
	ld hl,(0d326h)		;15a7	2a 26 d3 	* & . 
	or 0afh		;15aa	f6 af 	. . 
	ld (0d304h),a		;15ac	32 04 d3 	2 . . 
	ex (sp),hl			;15af	e3 	. 
	ld bc,02ccfh		;15b0	01 cf 2c 	. . , 
	call 04cb1h		;15b3	cd b1 4c 	. . L 
	ex (sp),hl			;15b6	e3 	. 
	push de			;15b7	d5 	. 
	ld a,(hl)			;15b8	7e 	~ 
	cp 02ch		;15b9	fe 2c 	. , 
	jr z,l15c4h		;15bb	28 07 	( . 
	ld a,(0d304h)		;15bd	3a 04 d3 	: . . 
	or a			;15c0	b7 	. 
	jp nz,l1621h		;15c1	c2 21 16 	. ! . 
l15c4h:
	or 0afh		;15c4	f6 af 	. . 
	ld (0d41ah),a		;15c6	32 1a d4 	2 . . 
	call 045a0h		;15c9	cd a0 45 	. . E 
	jp nz,0dbd3h		;15cc	c2 d3 db 	. . . 
	rst 30h			;15cf	f7 	. 
	push af			;15d0	f5 	. 
	jr nz,l15fch		;15d1	20 29 	  ) 
	rst 10h			;15d3	d7 	. 
	ld d,a			;15d4	57 	W 
	ld b,a			;15d5	47 	G 
	cp 022h		;15d6	fe 22 	. " 
	jr z,l15e6h		;15d8	28 0c 	( . 
	ld a,(0d304h)		;15da	3a 04 d3 	: . . 
	or a			;15dd	b7 	. 
	ld d,a			;15de	57 	W 
	jr z,l15e3h		;15df	28 02 	( . 
	ld d,03ah		;15e1	16 3a 	. : 
l15e3h:
	ld b,02ch		;15e3	06 2c 	. , 
	dec hl			;15e5	2b 	+ 
l15e6h:
	call 02acah		;15e6	cd ca 2a 	. . * 
l15e9h:
	pop af			;15e9	f1 	. 
	add a,003h		;15ea	c6 03 	. . 
	ld c,a			;15ec	4f 	O 
	ld a,(0d41ah)		;15ed	3a 1a d4 	: . . 
	or a			;15f0	b7 	. 
	ret z			;15f1	c8 	. 
	ld a,c			;15f2	79 	y 
	ex de,hl			;15f3	eb 	. 
	ld hl,l1604h		;15f4	21 04 16 	! . . 
	ex (sp),hl			;15f7	e3 	. 
	push de			;15f8	d5 	. 
	jp l11d7h		;15f9	c3 d7 11 	. . . 
l15fch:
	rst 10h			;15fc	d7 	. 
	ld bc,l15e9h		;15fd	01 e9 15 	. . . 
	push bc			;1600	c5 	. 
	jp 03b77h		;1601	c3 77 3b 	. w ; 
l1604h:
	dec hl			;1604	2b 	+ 
	rst 10h			;1605	d7 	. 
	jr z,l160dh		;1606	28 05 	( . 
	cp 02ch		;1608	fe 2c 	. , 
	jp nz,l14c5h		;160a	c2 c5 14 	. . . 
l160dh:
	ex (sp),hl			;160d	e3 	. 
	dec hl			;160e	2b 	+ 
	rst 10h			;160f	d7 	. 
	jp nz,015b1h		;1610	c2 b1 15 	. . . 
	pop de			;1613	d1 	. 
	ld a,(0d304h)		;1614	3a 04 d3 	: . . 
	or a			;1617	b7 	. 
	ex de,hl			;1618	eb 	. 
	jp nz,04365h		;1619	c2 65 43 	. e C 
	push de			;161c	d5 	. 
	pop hl			;161d	e1 	. 
l161eh:
	jp l1463h		;161e	c3 63 14 	. c . 
l1621h:
	call sub_119fh		;1621	cd 9f 11 	. . . 
	or a			;1624	b7 	. 
	jr nz,l1638h		;1625	20 11 	  . 
	inc hl			;1627	23 	# 
	ld a,(hl)			;1628	7e 	~ 
	inc hl			;1629	23 	# 
	or (hl)			;162a	b6 	. 
	ld e,004h		;162b	1e 04 	. . 
	jp z,l09ach		;162d	ca ac 09 	. . . 
	inc hl			;1630	23 	# 
	ld e,(hl)			;1631	5e 	^ 
	inc hl			;1632	23 	# 
	ld d,(hl)			;1633	56 	V 
	ld (0d301h),de		;1634	ed 53 01 d3 	. S . . 
l1638h:
	rst 10h			;1638	d7 	. 
	cp 084h		;1639	fe 84 	. . 
	jr nz,l1621h		;163b	20 e4 	  . 
	jp l15c4h		;163d	c3 c4 15 	. . . 
sub_1640h:
	rst 8			;1640	cf 	. 
	rst 28h			;1641	ef 	. 
	ld bc,028cfh		;1642	01 cf 28 	. . ( 
sub_1645h:
	dec hl			;1645	2b 	+ 
sub_1646h:
	ld d,000h		;1646	16 00 	. . 
l1648h:
	push de			;1648	d5 	. 
	ld c,001h		;1649	0e 01 	. . 
	call 0425bh		;164b	cd 5b 42 	. [ B 
	call 0db46h		;164e	cd 46 db 	. F . 
	call sub_17ach		;1651	cd ac 17 	. . . 
	xor a			;1654	af 	. 
	ld (0d442h),a		;1655	32 42 d4 	2 B . 
	ld (0d31ah),hl		;1658	22 1a d3 	" . . 
l165bh:
	ld hl,(0d31ah)		;165b	2a 1a d3 	* . . 
	pop bc			;165e	c1 	. 
	ld a,(hl)			;165f	7e 	~ 
	ld (0d2fbh),hl		;1660	22 fb d2 	" . . 
	cp 0eeh		;1663	fe ee 	. . 
	ret c			;1665	d8 	. 
	cp 0f1h		;1666	fe f1 	. . 
	jr c,l16c9h		;1668	38 5f 	8 _ 
	sub 0f1h		;166a	d6 f1 	. . 
	ld e,a			;166c	5f 	_ 
	jr nz,l1678h		;166d	20 09 	  . 
	ld a,(0d2c5h)		;166f	3a c5 d2 	: . . 
	cp 003h		;1672	fe 03 	. . 
	ld a,e			;1674	7b 	{ 
	jp z,02c36h		;1675	ca 36 2c 	. 6 , 
l1678h:
	cp 00ch		;1678	fe 0c 	. . 
	ret nc			;167a	d0 	. 
	ld hl,l0534h		;167b	21 34 05 	! 4 . 
	ld d,000h		;167e	16 00 	. . 
	add hl,de			;1680	19 	. 
	ld a,b			;1681	78 	x 
	ld d,(hl)			;1682	56 	V 
	cp d			;1683	ba 	. 
	ret nc			;1684	d0 	. 
	push bc			;1685	c5 	. 
	ld bc,l165bh		;1686	01 5b 16 	. [ . 
	push bc			;1689	c5 	. 
	ld a,d			;168a	7a 	z 
	call 0db73h		;168b	cd 73 db 	. s . 
	cp 051h		;168e	fe 51 	. Q 
	jr c,l16e2h		;1690	38 50 	8 P 
	and 0feh		;1692	e6 fe 	. . 
	cp 07ah		;1694	fe 7a 	. z 
	jr z,l16e2h		;1696	28 4a 	( J 
l1698h:
	ld hl,0d479h		;1698	21 79 d4 	! y . 
	ld a,(0d2c5h)		;169b	3a c5 d2 	: . . 
	sub 003h		;169e	d6 03 	. . 
	jp z,009aah		;16a0	ca aa 09 	. . . 
	or a			;16a3	b7 	. 
	ld hl,(0d479h)		;16a4	2a 79 d4 	* y . 
	push hl			;16a7	e5 	. 
	jp m,l16bah		;16a8	fa ba 16 	. . . 
	ld hl,(0d477h)		;16ab	2a 77 d4 	* w . 
	push hl			;16ae	e5 	. 
	jp po,l16bah		;16af	e2 ba 16 	. . . 
	ld hl,(0d47dh)		;16b2	2a 7d d4 	* } . 
	push hl			;16b5	e5 	. 
	ld hl,(0d47bh)		;16b6	2a 7b d4 	* { . 
	push hl			;16b9	e5 	. 
l16bah:
	add a,003h		;16ba	c6 03 	. . 
	ld c,e			;16bc	4b 	K 
	ld b,a			;16bd	47 	G 
	push bc			;16be	c5 	. 
	ld bc,l1707h		;16bf	01 07 17 	. . . 
l16c2h:
	push bc			;16c2	c5 	. 
	ld hl,(0d2fbh)		;16c3	2a fb d2 	* . . 
	jp l1648h		;16c6	c3 48 16 	. H . 
l16c9h:
	ld d,000h		;16c9	16 00 	. . 
l16cbh:
	sub 0eeh		;16cb	d6 ee 	. . 
	jr c,l16edh		;16cd	38 1e 	8 . 
	cp 003h		;16cf	fe 03 	. . 
	jr nc,l16edh		;16d1	30 1a 	0 . 
	cp 001h		;16d3	fe 01 	. . 
	rla			;16d5	17 	. 
	xor d			;16d6	aa 	. 
	cp d			;16d7	ba 	. 
	ld d,a			;16d8	57 	W 
	jp c,l0992h		;16d9	da 92 09 	. . . 
	ld (0d2fbh),hl		;16dc	22 fb d2 	" . . 
	rst 10h			;16df	d7 	. 
	jr l16cbh		;16e0	18 e9 	. . 
l16e2h:
	push de			;16e2	d5 	. 
	call 037eah		;16e3	cd ea 37 	. . 7 
	pop de			;16e6	d1 	. 
	push hl			;16e7	e5 	. 
	ld bc,l199bh		;16e8	01 9b 19 	. . . 
	jr l16c2h		;16eb	18 d5 	. . 
l16edh:
	ld a,b			;16ed	78 	x 
	cp 064h		;16ee	fe 64 	. d 
	ret nc			;16f0	d0 	. 
	push bc			;16f1	c5 	. 
	push de			;16f2	d5 	. 
	ld de,06405h		;16f3	11 05 64 	. . d 
	ld hl,l196fh		;16f6	21 6f 19 	! o . 
	push hl			;16f9	e5 	. 
	rst 30h			;16fa	f7 	. 
	jp nz,l1698h		;16fb	c2 98 16 	. . . 
	ld hl,(0d479h)		;16fe	2a 79 d4 	* y . 
	push hl			;1701	e5 	. 
	ld bc,02a5eh		;1702	01 5e 2a 	. ^ * 
	jr l16c2h		;1705	18 bb 	. . 
l1707h:
	pop bc			;1707	c1 	. 
	ld a,c			;1708	79 	y 
	ld (0d2c6h),a		;1709	32 c6 d2 	2 . . 
	ld a,(0d2c5h)		;170c	3a c5 d2 	: . . 
	cp b			;170f	b8 	. 
	jr nz,l171dh		;1710	20 0b 	  . 
	cp 002h		;1712	fe 02 	. . 
	jr z,l1735h		;1714	28 1f 	( . 
	cp 004h		;1716	fe 04 	. . 
	jp z,l1782h		;1718	ca 82 17 	. . . 
	jr nc,l1748h		;171b	30 2b 	0 + 
l171dh:
	ld d,a			;171d	57 	W 
	ld a,b			;171e	78 	x 
	cp 008h		;171f	fe 08 	. . 
	jr z,l1745h		;1721	28 22 	( " 
	ld a,d			;1723	7a 	z 
	cp 008h		;1724	fe 08 	. . 
	jr z,l176ch		;1726	28 44 	( D 
	ld a,b			;1728	78 	x 
	cp 004h		;1729	fe 04 	. . 
	jr z,l177fh		;172b	28 52 	( R 
	ld a,d			;172d	7a 	z 
	cp 003h		;172e	fe 03 	. . 
	jp z,009aah		;1730	ca aa 09 	. . . 
	jr nc,l1789h		;1733	30 54 	0 T 
l1735h:
	ld hl,l0562h		;1735	21 62 05 	! b . 
	ld b,000h		;1738	06 00 	. . 
	add hl,bc			;173a	09 	. 
	add hl,bc			;173b	09 	. 
	ld c,(hl)			;173c	4e 	N 
	inc hl			;173d	23 	# 
	ld b,(hl)			;173e	46 	F 
	pop de			;173f	d1 	. 
	ld hl,(0d479h)		;1740	2a 79 d4 	* y . 
	push bc			;1743	c5 	. 
	ret			;1744	c9 	. 
l1745h:
	call 0389ah		;1745	cd 9a 38 	. . 8 
l1748h:
	call 03771h		;1748	cd 71 37 	. q 7 
	pop hl			;174b	e1 	. 
	ld (0d47bh),hl		;174c	22 7b d4 	" { . 
	pop hl			;174f	e1 	. 
	ld (0d47dh),hl		;1750	22 7d d4 	" } . 
l1753h:
	pop bc			;1753	c1 	. 
	pop de			;1754	d1 	. 
	call 03725h		;1755	cd 25 37 	. % 7 
l1758h:
	call 0389ah		;1758	cd 9a 38 	. . 8 
	ld hl,0054ah		;175b	21 4a 05 	! J . 
l175eh:
	ld a,(0d2c6h)		;175e	3a c6 d2 	: . . 
	rlca			;1761	07 	. 
	add a,l			;1762	85 	. 
	ld l,a			;1763	6f 	o 
	adc a,h			;1764	8c 	. 
	sub l			;1765	95 	. 
	ld h,a			;1766	67 	g 
	ld a,(hl)			;1767	7e 	~ 
	inc hl			;1768	23 	# 
	ld h,(hl)			;1769	66 	f 
	ld l,a			;176a	6f 	o 
	jp (hl)			;176b	e9 	. 
l176ch:
	ld a,b			;176c	78 	x 
	push af			;176d	f5 	. 
	call 03771h		;176e	cd 71 37 	. q 7 
	pop af			;1771	f1 	. 
	ld (0d2c5h),a		;1772	32 c5 d2 	2 . . 
	cp 004h		;1775	fe 04 	. . 
	jr z,l1753h		;1777	28 da 	( . 
	pop hl			;1779	e1 	. 
	ld (0d479h),hl		;177a	22 79 d4 	" y . 
	jr l1758h		;177d	18 d9 	. . 
l177fh:
	call 03812h		;177f	cd 12 38 	. . 8 
l1782h:
	pop bc			;1782	c1 	. 
	pop de			;1783	d1 	. 
l1784h:
	ld hl,l0556h		;1784	21 56 05 	! V . 
	jr l175eh		;1787	18 d5 	. . 
l1789h:
	pop hl			;1789	e1 	. 
	call 03715h		;178a	cd 15 37 	. . 7 
	call 0382bh		;178d	cd 2b 38 	. + 8 
	call 03730h		;1790	cd 30 37 	. 0 7 
	pop hl			;1793	e1 	. 
	ld (0d477h),hl		;1794	22 77 d4 	" w . 
	pop hl			;1797	e1 	. 
	ld (0d479h),hl		;1798	22 79 d4 	" y . 
	jr l1784h		;179b	18 e7 	. . 
	push hl			;179d	e5 	. 
	ex de,hl			;179e	eb 	. 
	call 0382bh		;179f	cd 2b 38 	. + 8 
	pop hl			;17a2	e1 	. 
	call 03715h		;17a3	cd 15 37 	. . 7 
	call 0382bh		;17a6	cd 2b 38 	. + 8 
	jp 03b43h		;17a9	c3 43 3b 	. C ; 
sub_17ach:
	rst 10h			;17ac	d7 	. 
	jp z,l09a6h+1		;17ad	ca a7 09 	. . . 
	jp c,03b77h		;17b0	da 77 3b 	. w ; 
	call 04441h		;17b3	cd 41 44 	. A D 
	jp nc,l1868h		;17b6	d2 68 18 	. h . 
	cp 020h		;17b9	fe 20 	.   
	jp c,l1034h		;17bb	da 34 10 	. 4 . 
	call 0db31h		;17be	cd 31 db 	. 1 . 
	inc a			;17c1	3c 	< 
	jp z,l1901h		;17c2	ca 01 19 	. . . 
	dec a			;17c5	3d 	= 
	cp 0f1h		;17c6	fe f1 	. . 
	jr z,sub_17ach		;17c8	28 e2 	( . 
	cp 0f2h		;17ca	fe f2 	. . 
	jp z,l185ah		;17cc	ca 5a 18 	. Z . 
	cp 022h		;17cf	fe 22 	. " 
	jp z,02ac7h		;17d1	ca c7 2a 	. . * 
	cp 0dah		;17d4	fe da 	. . 
	jp z,l197bh		;17d6	ca 7b 19 	. { . 
	cp 026h		;17d9	fe 26 	. & 
	jp z,sub_1885h		;17db	ca 85 18 	. . . 
	cp 0dch		;17de	fe dc 	. . 
	jr nz,l17ech		;17e0	20 0a 	  . 
	rst 10h			;17e2	d7 	. 
	ld a,(0d046h)		;17e3	3a 46 d0 	: F . 
	push hl			;17e6	e5 	. 
	call sub_19f3h		;17e7	cd f3 19 	. . . 
	pop hl			;17ea	e1 	. 
	ret			;17eb	c9 	. 
l17ech:
	cp 0dbh		;17ec	fe db 	. . 
	jr nz,l17fah		;17ee	20 0a 	  . 
	rst 10h			;17f0	d7 	. 
	push hl			;17f1	e5 	. 
	ld hl,(0d311h)		;17f2	2a 11 d3 	* . . 
	call 03a9dh		;17f5	cd 9d 3a 	. . : 
	pop hl			;17f8	e1 	. 
	ret			;17f9	c9 	. 
l17fah:
	cp 0e1h		;17fa	fe e1 	. . 
	jr nz,l1822h		;17fc	20 24 	  $ 
	rst 10h			;17fe	d7 	. 
	rst 8			;17ff	cf 	. 
l1800h:
	jr z,l1800h		;1800	28 fe 	( . 
	inc hl			;1802	23 	# 
	jr nz,l1811h		;1803	20 0c 	  . 
	call sub_1c2dh		;1805	cd 2d 1c 	. - . 
	push hl			;1808	e5 	. 
	call 0dbe5h		;1809	cd e5 db 	. . . 
	ex de,hl			;180c	eb 	. 
	pop hl			;180d	e1 	. 
	jp l1814h		;180e	c3 14 18 	. . . 
l1811h:
	call 04d9fh		;1811	cd 9f 4d 	. . M 
l1814h:
	rst 8			;1814	cf 	. 
	add hl,hl			;1815	29 	) 
	push hl			;1816	e5 	. 
	ex de,hl			;1817	eb 	. 
	ld a,h			;1818	7c 	| 
	or l			;1819	b5 	. 
	jp z,l10d6h		;181a	ca d6 10 	. . . 
	call 037f9h		;181d	cd f9 37 	. . 7 
	pop hl			;1820	e1 	. 
	ret			;1821	c9 	. 
l1822h:
	cp 0d7h		;1822	fe d7 	. . 
	jp z,l19f9h		;1824	ca f9 19 	. . . 
	cp 0dfh		;1827	fe df 	. . 
	jp z,02d8dh		;1829	ca 8d 2d 	. . - 
	cp 0e5h		;182c	fe e5 	. . 
	jp z,05347h		;182e	ca 47 53 	. G S 
	cp 0e6h		;1831	fe e6 	. . 
	jp z,052a3h		;1833	ca a3 52 	. . R 
	cp 0ddh		;1836	fe dd 	. . 
	jp z,02cd8h		;1838	ca d8 2c 	. . , 
	cp 085h		;183b	fe 85 	. . 
	jp z,0dbdch		;183d	ca dc db 	. . . 
	cp 0e2h		;1840	fe e2 	. . 
	jp z,0285ah		;1842	ca 5a 28 	. Z ( 
	cp 0e3h		;1845	fe e3 	. . 
	jp z,0dba6h		;1847	ca a6 db 	. . . 
	cp 0e4h		;184a	fe e4 	. . 
	jp z,0dbc4h		;184c	ca c4 db 	. . . 
	cp 0d8h		;184f	fe d8 	. . 
	jp z,l1a64h		;1851	ca 64 1a 	. d . 
sub_1854h:
	call 01643h		;1854	cd 43 16 	. C . 
	rst 8			;1857	cf 	. 
	add hl,hl			;1858	29 	) 
	ret			;1859	c9 	. 
l185ah:
	ld d,07dh		;185a	16 7d 	. } 
	call l1648h		;185c	cd 48 16 	. H . 
	ld hl,(0d31ah)		;185f	2a 1a d3 	* . . 
	push hl			;1862	e5 	. 
	call 036eah		;1863	cd ea 36 	. . 6 
l1866h:
	pop hl			;1866	e1 	. 
	ret			;1867	c9 	. 
l1868h:
	call 04cb1h		;1868	cd b1 4c 	. . L 
	push hl			;186b	e5 	. 
	ex de,hl			;186c	eb 	. 
	ld (0d479h),hl		;186d	22 79 d4 	" y . 
	rst 30h			;1870	f7 	. 
	call nz,0376ch		;1871	c4 6c 37 	. l 7 
	pop hl			;1874	e1 	. 
	ret			;1875	c9 	. 
sub_1876h:
	ld a,(hl)			;1876	7e 	~ 
sub_1877h:
	cp 061h		;1877	fe 61 	. a 
	ret c			;1879	d8 	. 
	cp 07bh		;187a	fe 7b 	. { 
	ret nc			;187c	d0 	. 
	and 05fh		;187d	e6 5f 	. _ 
	ret			;187f	c9 	. 
	cp 026h		;1880	fe 26 	. & 
	jp nz,sub_10e5h		;1882	c2 e5 10 	. . . 
sub_1885h:
	ld de,l0000h		;1885	11 00 00 	. . . 
	rst 10h			;1888	d7 	. 
	call sub_1877h		;1889	cd 77 18 	. w . 
	cp 04fh		;188c	fe 4f 	. O 
	jr z,l18dfh		;188e	28 4f 	( O 
	cp 048h		;1890	fe 48 	. H 
	jr nz,l18deh		;1892	20 4a 	  J 
	ld b,005h		;1894	06 05 	. . 
l1896h:
	inc hl			;1896	23 	# 
	ld a,(hl)			;1897	7e 	~ 
	call sub_1877h		;1898	cd 77 18 	. w . 
	call 04441h		;189b	cd 41 44 	. A D 
	ex de,hl			;189e	eb 	. 
	jr nc,l18abh		;189f	30 0a 	0 . 
	cp 03ah		;18a1	fe 3a 	. : 
	jr nc,l18fch		;18a3	30 57 	0 W 
	sub 030h		;18a5	d6 30 	. 0 
	jr c,l18fch		;18a7	38 53 	8 S 
	jr l18b1h		;18a9	18 06 	. . 
l18abh:
	cp 047h		;18ab	fe 47 	. G 
	jr nc,l18fch		;18ad	30 4d 	0 M 
	sub 037h		;18af	d6 37 	. 7 
l18b1h:
	add hl,hl			;18b1	29 	) 
	add hl,hl			;18b2	29 	) 
	add hl,hl			;18b3	29 	) 
	add hl,hl			;18b4	29 	) 
	or l			;18b5	b5 	. 
	ld l,a			;18b6	6f 	o 
	ex de,hl			;18b7	eb 	. 
	djnz l1896h		;18b8	10 dc 	. . 
l18bah:
	ld a,(0d444h)		;18ba	3a 44 d4 	: D . 
	or a			;18bd	b7 	. 
	jp z,009a4h		;18be	ca a4 09 	. . . 
	push hl			;18c1	e5 	. 
	ld hl,l05c4h		;18c2	21 c4 05 	! . . 
	call 0207ch		;18c5	cd 7c 20 	. |   
	call 05268h		;18c8	cd 68 52 	. h R 
	pop hl			;18cb	e1 	. 
l18cch:
	ld a,(0d442h)		;18cc	3a 42 d4 	: B . 
	inc a			;18cf	3c 	< 
	ld (0d442h),a		;18d0	32 42 d4 	2 B . 
	ret			;18d3	c9 	. 
l18d4h:
	ld a,(0d444h)		;18d4	3a 44 d4 	: D . 
	or a			;18d7	b7 	. 
	jp nz,l18cch		;18d8	c2 cc 18 	. . . 
l18dbh:
	jp l0992h		;18db	c3 92 09 	. . . 
l18deh:
	dec hl			;18de	2b 	+ 
l18dfh:
	rst 10h			;18df	d7 	. 
	ex de,hl			;18e0	eb 	. 
	jr nc,l18fch		;18e1	30 19 	0 . 
	cp 038h		;18e3	fe 38 	. 8 
	jp nc,l18d4h		;18e5	d2 d4 18 	. . . 
	ld bc,l18bah		;18e8	01 ba 18 	. . . 
	push bc			;18eb	c5 	. 
	add hl,hl			;18ec	29 	) 
	ret c			;18ed	d8 	. 
	add hl,hl			;18ee	29 	) 
	ret c			;18ef	d8 	. 
	add hl,hl			;18f0	29 	) 
	ret c			;18f1	d8 	. 
	pop bc			;18f2	c1 	. 
	ld b,000h		;18f3	06 00 	. . 
	sub 030h		;18f5	d6 30 	. 0 
	ld c,a			;18f7	4f 	O 
	add hl,bc			;18f8	09 	. 
	ex de,hl			;18f9	eb 	. 
	jr l18dfh		;18fa	18 e3 	. . 
l18fch:
	call 037f9h		;18fc	cd f9 37 	. . 7 
	ex de,hl			;18ff	eb 	. 
	ret			;1900	c9 	. 
l1901h:
	inc hl			;1901	23 	# 
	ld a,(hl)			;1902	7e 	~ 
	sub 081h		;1903	d6 81 	. . 
l1905h:
	cp 007h		;1905	fe 07 	. . 
	jr nz,l1913h		;1907	20 0a 	  . 
	push hl			;1909	e5 	. 
	rst 10h			;190a	d7 	. 
	cp 028h		;190b	fe 28 	. ( 
	pop hl			;190d	e1 	. 
	jp nz,0347dh		;190e	c2 7d 34 	. } 4 
	ld a,007h		;1911	3e 07 	> . 
l1913h:
	ld b,000h		;1913	06 00 	. . 
	rlca			;1915	07 	. 
	ld c,a			;1916	4f 	O 
	push bc			;1917	c5 	. 
	rst 10h			;1918	d7 	. 
	ld a,c			;1919	79 	y 
	cp 005h		;191a	fe 05 	. . 
	jr nc,l1934h		;191c	30 16 	0 . 
	call 01643h		;191e	cd 43 16 	. C . 
	rst 8			;1921	cf 	. 
	inc l			;1922	2c 	, 
	call 038b8h		;1923	cd b8 38 	. . 8 
	ex de,hl			;1926	eb 	. 
	ld hl,(0d479h)		;1927	2a 79 d4 	* y . 
	ex (sp),hl			;192a	e3 	. 
	push hl			;192b	e5 	. 
	ex de,hl			;192c	eb 	. 
	call sub_1c2eh		;192d	cd 2e 1c 	. . . 
	ex de,hl			;1930	eb 	. 
	ex (sp),hl			;1931	e3 	. 
	jr l1953h		;1932	18 1f 	. . 
l1934h:
	call sub_1854h		;1934	cd 54 18 	. T . 
	ex (sp),hl			;1937	e3 	. 
	ld a,l			;1938	7d 	} 
	cp 00ch		;1939	fe 0c 	. . 
	jr c,l194ah		;193b	38 0d 	8 . 
	cp 01bh		;193d	fe 1b 	. . 
	call 0db76h		;193f	cd 76 db 	. v . 
	jr nc,l194ah		;1942	30 06 	0 . 
	rst 30h			;1944	f7 	. 
	push hl			;1945	e5 	. 
	call c,0389ah		;1946	dc 9a 38 	. . 8 
	pop hl			;1949	e1 	. 
l194ah:
	ld de,l1866h		;194a	11 66 18 	. f . 
	push de			;194d	d5 	. 
	ld a,001h		;194e	3e 01 	> . 
	ld (0d442h),a		;1950	32 42 d4 	2 B . 
l1953h:
	ld bc,l0219h		;1953	01 19 02 	. . . 
	call 0db37h		;1956	cd 37 db 	. 7 . 
sub_1959h:
	add hl,bc			;1959	09 	. 
	ld c,(hl)			;195a	4e 	N 
	inc hl			;195b	23 	# 
	ld h,(hl)			;195c	66 	f 
	ld l,c			;195d	69 	i 
	jp (hl)			;195e	e9 	. 
	dec d			;195f	15 	. 
	cp 0f2h		;1960	fe f2 	. . 
	ret z			;1962	c8 	. 
	cp 02dh		;1963	fe 2d 	. - 
	ret z			;1965	c8 	. 
	inc d			;1966	14 	. 
	cp 02bh		;1967	fe 2b 	. + 
	ret z			;1969	c8 	. 
	cp 0f1h		;196a	fe f1 	. . 
	ret z			;196c	c8 	. 
	dec hl			;196d	2b 	+ 
	ret			;196e	c9 	. 
l196fh:
	inc a			;196f	3c 	< 
	adc a,a			;1970	8f 	. 
	pop bc			;1971	c1 	. 
	and b			;1972	a0 	. 
	add a,0ffh		;1973	c6 ff 	. . 
	sbc a,a			;1975	9f 	. 
	call 036feh		;1976	cd fe 36 	. . 6 
	jr l198dh		;1979	18 12 	. . 
l197bh:
	ld d,05ah		;197b	16 5a 	. Z 
	call l1648h		;197d	cd 48 16 	. H . 
	call 037eah		;1980	cd ea 37 	. . 7 
	ld a,l			;1983	7d 	} 
	cpl			;1984	2f 	/ 
	ld l,a			;1985	6f 	o 
	ld a,h			;1986	7c 	| 
	cpl			;1987	2f 	/ 
	ld h,a			;1988	67 	g 
	ld (0d479h),hl		;1989	22 79 d4 	" y . 
	pop bc			;198c	c1 	. 
l198dh:
	jp l165bh		;198d	c3 5b 16 	. [ . 
l1990h:
	jr nc,l1997h		;1990	30 05 	0 . 
	sub 003h		;1992	d6 03 	. . 
	or a			;1994	b7 	. 
	scf			;1995	37 	7 
	ret			;1996	c9 	. 
l1997h:
	sub 003h		;1997	d6 03 	. . 
	or a			;1999	b7 	. 
	ret			;199a	c9 	. 
l199bh:
	ld a,b			;199b	78 	x 
	push af			;199c	f5 	. 
	call 037eah		;199d	cd ea 37 	. . 7 
	pop af			;19a0	f1 	. 
	pop de			;19a1	d1 	. 
	cp 07ah		;19a2	fe 7a 	. z 
	jp z,03aa1h		;19a4	ca a1 3a 	. . : 
	cp 07bh		;19a7	fe 7b 	. { 
	jp z,03a44h		;19a9	ca 44 3a 	. D : 
	ld bc,l19f5h		;19ac	01 f5 19 	. . . 
	push bc			;19af	c5 	. 
	cp 046h		;19b0	fe 46 	. F 
	jr nz,l19bah		;19b2	20 06 	  . 
	ld a,e			;19b4	7b 	{ 
	or l			;19b5	b5 	. 
	ld l,a			;19b6	6f 	o 
	ld a,h			;19b7	7c 	| 
	or d			;19b8	b2 	. 
	ret			;19b9	c9 	. 
l19bah:
	cp 050h		;19ba	fe 50 	. P 
	jr nz,l19c4h		;19bc	20 06 	  . 
	ld a,e			;19be	7b 	{ 
	and l			;19bf	a5 	. 
	ld l,a			;19c0	6f 	o 
	ld a,h			;19c1	7c 	| 
	and d			;19c2	a2 	. 
	ret			;19c3	c9 	. 
l19c4h:
	cp 03ch		;19c4	fe 3c 	. < 
	jr nz,l19ceh		;19c6	20 06 	  . 
	ld a,e			;19c8	7b 	{ 
	xor l			;19c9	ad 	. 
	ld l,a			;19ca	6f 	o 
	ld a,h			;19cb	7c 	| 
	xor d			;19cc	aa 	. 
	ret			;19cd	c9 	. 
l19ceh:
	cp 032h		;19ce	fe 32 	. 2 
	jr nz,l19dah		;19d0	20 08 	  . 
	ld a,e			;19d2	7b 	{ 
	xor l			;19d3	ad 	. 
	cpl			;19d4	2f 	/ 
	ld l,a			;19d5	6f 	o 
	ld a,h			;19d6	7c 	| 
	xor d			;19d7	aa 	. 
	cpl			;19d8	2f 	/ 
	ret			;19d9	c9 	. 
l19dah:
	ld a,l			;19da	7d 	} 
	cpl			;19db	2f 	/ 
	and e			;19dc	a3 	. 
	cpl			;19dd	2f 	/ 
	ld l,a			;19de	6f 	o 
	ld a,h			;19df	7c 	| 
	cpl			;19e0	2f 	/ 
	and d			;19e1	a2 	. 
	cpl			;19e2	2f 	/ 
	ret			;19e3	c9 	. 
	or a			;19e4	b7 	. 
	sbc hl,de		;19e5	ed 52 	. R 
	jp 03a9dh		;19e7	c3 9d 3a 	. . : 
	ld a,(0d048h)		;19ea	3a 48 d0 	: H . 
	jr l19f2h		;19ed	18 03 	. . 
	ld a,(0d2c3h)		;19ef	3a c3 d2 	: . . 
l19f2h:
	inc a			;19f2	3c 	< 
sub_19f3h:
	ld l,a			;19f3	6f 	o 
	xor a			;19f4	af 	. 
l19f5h:
	ld h,a			;19f5	67 	g 
	jp 037f9h		;19f6	c3 f9 37 	. . 7 
l19f9h:
	call sub_1a18h		;19f9	cd 18 1a 	. . . 
	push de			;19fc	d5 	. 
	call sub_1854h		;19fd	cd 54 18 	. T . 
	ex (sp),hl			;1a00	e3 	. 
	ld e,(hl)			;1a01	5e 	^ 
	inc hl			;1a02	23 	# 
	ld d,(hl)			;1a03	56 	V 
	ld hl,03b75h		;1a04	21 75 3b 	! u ; 
	push hl			;1a07	e5 	. 
	push de			;1a08	d5 	. 
	ld a,(0d2c5h)		;1a09	3a c5 d2 	: . . 
	push af			;1a0c	f5 	. 
	cp 003h		;1a0d	fe 03 	. . 
	call z,02c82h		;1a0f	cc 82 2c 	. . , 
	pop af			;1a12	f1 	. 
	ex de,hl			;1a13	eb 	. 
	ld hl,0d477h		;1a14	21 77 d4 	! w . 
	ret			;1a17	c9 	. 
sub_1a18h:
	rst 10h			;1a18	d7 	. 
	ld bc,l0000h		;1a19	01 00 00 	. . . 
	cp 01bh		;1a1c	fe 1b 	. . 
	jr nc,l1a2bh		;1a1e	30 0b 	0 . 
	cp 011h		;1a20	fe 11 	. . 
	jr c,l1a2bh		;1a22	38 07 	8 . 
	rst 10h			;1a24	d7 	. 
	ld a,(0d2cch)		;1a25	3a cc d2 	: . . 
	or a			;1a28	b7 	. 
	rla			;1a29	17 	. 
	ld c,a			;1a2a	4f 	O 
l1a2bh:
	ex de,hl			;1a2b	eb 	. 
	ld hl,0d031h		;1a2c	21 31 d0 	! 1 . 
	add hl,bc			;1a2f	09 	. 
	ex de,hl			;1a30	eb 	. 
	ret			;1a31	c9 	. 
l1a32h:
	call sub_1a18h		;1a32	cd 18 1a 	. . . 
	push de			;1a35	d5 	. 
	rst 8			;1a36	cf 	. 
	rst 28h			;1a37	ef 	. 
	call sub_1ee8h		;1a38	cd e8 1e 	. . . 
	ex (sp),hl			;1a3b	e3 	. 
	ld (hl),e			;1a3c	73 	s 
	inc hl			;1a3d	23 	# 
	ld (hl),d			;1a3e	72 	r 
	pop hl			;1a3f	e1 	. 
	ret			;1a40	c9 	. 
	cp 0d7h		;1a41	fe d7 	. . 
	jr z,l1a32h		;1a43	28 ed 	( . 
	call sub_1bcch		;1a45	cd cc 1b 	. . . 
	call sub_1bbeh		;1a48	cd be 1b 	. . . 
	ex de,hl			;1a4b	eb 	. 
	ld (hl),e			;1a4c	73 	s 
	inc hl			;1a4d	23 	# 
	ld (hl),d			;1a4e	72 	r 
	ex de,hl			;1a4f	eb 	. 
	ld a,(hl)			;1a50	7e 	~ 
	cp 028h		;1a51	fe 28 	. ( 
	jp nz,sub_119fh		;1a53	c2 9f 11 	. . . 
	rst 10h			;1a56	d7 	. 
l1a57h:
	call 04cb1h		;1a57	cd b1 4c 	. . L 
	ld a,(hl)			;1a5a	7e 	~ 
	cp 029h		;1a5b	fe 29 	. ) 
	jp z,sub_119fh		;1a5d	ca 9f 11 	. . . 
	rst 8			;1a60	cf 	. 
	inc l			;1a61	2c 	, 
	jr l1a57h		;1a62	18 f3 	. . 
l1a64h:
	call sub_1bcch		;1a64	cd cc 1b 	. . . 
	ld a,(0d2c5h)		;1a67	3a c5 d2 	: . . 
	or a			;1a6a	b7 	. 
	push af			;1a6b	f5 	. 
	ld (0d31ah),hl		;1a6c	22 1a d3 	" . . 
	ex de,hl			;1a6f	eb 	. 
	ld a,(hl)			;1a70	7e 	~ 
	inc hl			;1a71	23 	# 
	ld h,(hl)			;1a72	66 	f 
	ld l,a			;1a73	6f 	o 
	ld a,h			;1a74	7c 	| 
	or l			;1a75	b5 	. 
	jp z,0099eh		;1a76	ca 9e 09 	. . . 
	ld a,(hl)			;1a79	7e 	~ 
	cp 028h		;1a7a	fe 28 	. ( 
	jp nz,01b1fh		;1a7c	c2 1f 1b 	. . . 
	rst 10h			;1a7f	d7 	. 
	ld (0d2fbh),hl		;1a80	22 fb d2 	" . . 
	ex de,hl			;1a83	eb 	. 
	ld hl,(0d31ah)		;1a84	2a 1a d3 	* . . 
	rst 8			;1a87	cf 	. 
	jr z,-79		;1a88	28 af 	( . 
	push af			;1a8a	f5 	. 
	push hl			;1a8b	e5 	. 
	ex de,hl			;1a8c	eb 	. 
l1a8dh:
	ld a,080h		;1a8d	3e 80 	> . 
	ld (0d303h),a		;1a8f	32 03 d3 	2 . . 
	call 04cb1h		;1a92	cd b1 4c 	. . L 
	ex de,hl			;1a95	eb 	. 
	ex (sp),hl			;1a96	e3 	. 
	ld a,(0d2c5h)		;1a97	3a c5 d2 	: . . 
	push af			;1a9a	f5 	. 
	push de			;1a9b	d5 	. 
	call sub_1645h		;1a9c	cd 45 16 	. E . 
	ld (0d31ah),hl		;1a9f	22 1a d3 	" . . 
	pop hl			;1aa2	e1 	. 
	ld (0d2fbh),hl		;1aa3	22 fb d2 	" . . 
	pop af			;1aa6	f1 	. 
	call sub_1ba5h		;1aa7	cd a5 1b 	. . . 
	ld c,004h		;1aaa	0e 04 	. . 
	call 0425bh		;1aac	cd 5b 42 	. [ B 
	ld hl,0fff8h		;1aaf	21 f8 ff 	! . . 
	add hl,sp			;1ab2	39 	9 
	ld sp,hl			;1ab3	f9 	. 
	call 03774h		;1ab4	cd 74 37 	. t 7 
	ld a,(0d2c5h)		;1ab7	3a c5 d2 	: . . 
	push af			;1aba	f5 	. 
	ld hl,(0d31ah)		;1abb	2a 1a d3 	* . . 
	ld a,(hl)			;1abe	7e 	~ 
	cp 029h		;1abf	fe 29 	. ) 
	jr z,l1ad1h		;1ac1	28 0e 	( . 
	rst 8			;1ac3	cf 	. 
	inc l			;1ac4	2c 	, 
	push hl			;1ac5	e5 	. 
	ld hl,(0d2fbh)		;1ac6	2a fb d2 	* . . 
	rst 8			;1ac9	cf 	. 
	inc l			;1aca	2c 	, 
	jr l1a8dh		;1acb	18 c0 	. . 
l1acdh:
	pop af			;1acd	f1 	. 
	ld (0d3ach),a		;1ace	32 ac d3 	2 . . 
l1ad1h:
	pop af			;1ad1	f1 	. 
	or a			;1ad2	b7 	. 
	jr z,l1b14h		;1ad3	28 3f 	( ? 
	ld (0d2c5h),a		;1ad5	32 c5 d2 	2 . . 
	ld hl,l0000h		;1ad8	21 00 00 	! . . 
	add hl,sp			;1adb	39 	9 
	call 0376ch		;1adc	cd 6c 37 	. l 7 
	ld hl,l0008h		;1adf	21 08 00 	! . . 
	add hl,sp			;1ae2	39 	9 
	ld sp,hl			;1ae3	f9 	. 
	pop de			;1ae4	d1 	. 
	ld l,003h		;1ae5	2e 03 	. . 
l1ae7h:
	inc l			;1ae7	2c 	, 
	dec de			;1ae8	1b 	. 
	ld a,(de)			;1ae9	1a 	. 
	or a			;1aea	b7 	. 
	jp m,l1ae7h		;1aeb	fa e7 1a 	. . . 
	dec de			;1aee	1b 	. 
	dec de			;1aef	1b 	. 
	dec de			;1af0	1b 	. 
	ld a,(0d2c5h)		;1af1	3a c5 d2 	: . . 
	add a,l			;1af4	85 	. 
	ld b,a			;1af5	47 	G 
	ld a,(0d3ach)		;1af6	3a ac d3 	: . . 
	ld c,a			;1af9	4f 	O 
	add a,b			;1afa	80 	. 
	cp 064h		;1afb	fe 64 	. d 
	jp nc,l10d6h		;1afd	d2 d6 10 	. . . 
	push af			;1b00	f5 	. 
	ld a,l			;1b01	7d 	} 
	ld b,000h		;1b02	06 00 	. . 
	ld hl,0d3aeh		;1b04	21 ae d3 	! . . 
	add hl,bc			;1b07	09 	. 
	ld c,a			;1b08	4f 	O 
	call sub_1bb9h		;1b09	cd b9 1b 	. . . 
	ld bc,l1acdh		;1b0c	01 cd 1a 	. . . 
	push bc			;1b0f	c5 	. 
	push bc			;1b10	c5 	. 
	jp l11e2h		;1b11	c3 e2 11 	. . . 
l1b14h:
	ld hl,(0d31ah)		;1b14	2a 1a d3 	* . . 
	rst 10h			;1b17	d7 	. 
	push hl			;1b18	e5 	. 
	ld hl,(0d2fbh)		;1b19	2a fb d2 	* . . 
	rst 8			;1b1c	cf 	. 
	add hl,hl			;1b1d	29 	) 
	ld a,0d5h		;1b1e	3e d5 	> . 
	ld (0d2fbh),hl		;1b20	22 fb d2 	" . . 
	ld a,(0d344h)		;1b23	3a 44 d3 	: D . 
	add a,004h		;1b26	c6 04 	. . 
	push af			;1b28	f5 	. 
	rrca			;1b29	0f 	. 
	ld c,a			;1b2a	4f 	O 
	call 0425bh		;1b2b	cd 5b 42 	. [ B 
	pop af			;1b2e	f1 	. 
	ld c,a			;1b2f	4f 	O 
	cpl			;1b30	2f 	/ 
	inc a			;1b31	3c 	< 
	ld l,a			;1b32	6f 	o 
	ld h,0ffh		;1b33	26 ff 	& . 
	add hl,sp			;1b35	39 	9 
	ld sp,hl			;1b36	f9 	. 
	push hl			;1b37	e5 	. 
	ld de,0d342h		;1b38	11 42 d3 	. B . 
	call sub_1bb9h		;1b3b	cd b9 1b 	. . . 
	pop hl			;1b3e	e1 	. 
	ld (0d342h),hl		;1b3f	22 42 d3 	" B . 
	ld hl,(0d3ach)		;1b42	2a ac d3 	* . . 
	ld (0d344h),hl		;1b45	22 44 d3 	" D . 
	ld b,h			;1b48	44 	D 
	ld c,l			;1b49	4d 	M 
	ld hl,0d346h		;1b4a	21 46 d3 	! F . 
	ld de,0d3aeh		;1b4d	11 ae d3 	. . . 
	call sub_1bb9h		;1b50	cd b9 1b 	. . . 
	ld h,a			;1b53	67 	g 
	ld l,a			;1b54	6f 	o 
	ld (0d3ach),hl		;1b55	22 ac d3 	" . . 
	ld hl,(0d418h)		;1b58	2a 18 d4 	* . . 
	inc hl			;1b5b	23 	# 
	ld (0d418h),hl		;1b5c	22 18 d4 	" . . 
	ld a,h			;1b5f	7c 	| 
	or l			;1b60	b5 	. 
	ld (0d415h),a		;1b61	32 15 d4 	2 . . 
	ld hl,(0d2fbh)		;1b64	2a fb d2 	* . . 
	call sub_1640h		;1b67	cd 40 16 	. @ . 
	dec hl			;1b6a	2b 	+ 
	rst 10h			;1b6b	d7 	. 
	jp nz,l0992h		;1b6c	c2 92 09 	. . . 
	rst 30h			;1b6f	f7 	. 
	jr nz,l1b81h		;1b70	20 0f 	  . 
	ld de,0d2f6h		;1b72	11 f6 d2 	. . . 
	ld hl,(0d479h)		;1b75	2a 79 d4 	* y . 
	rst 20h			;1b78	e7 	. 
	jr c,l1b81h		;1b79	38 06 	8 . 
	call 02aa2h		;1b7b	cd a2 2a 	. . * 
	call 02afah		;1b7e	cd fa 2a 	. . * 
l1b81h:
	ld hl,(0d342h)		;1b81	2a 42 d3 	* B . 
	ld d,h			;1b84	54 	T 
	ld e,l			;1b85	5d 	] 
	inc hl			;1b86	23 	# 
	inc hl			;1b87	23 	# 
	ld c,(hl)			;1b88	4e 	N 
	inc hl			;1b89	23 	# 
	ld b,(hl)			;1b8a	46 	F 
	inc bc			;1b8b	03 	. 
	inc bc			;1b8c	03 	. 
	inc bc			;1b8d	03 	. 
	inc bc			;1b8e	03 	. 
	ld hl,0d342h		;1b8f	21 42 d3 	! B . 
	call sub_1bb9h		;1b92	cd b9 1b 	. . . 
	ex de,hl			;1b95	eb 	. 
	ld sp,hl			;1b96	f9 	. 
	ld hl,(0d418h)		;1b97	2a 18 d4 	* . . 
	dec hl			;1b9a	2b 	+ 
	ld (0d418h),hl		;1b9b	22 18 d4 	" . . 
	ld a,h			;1b9e	7c 	| 
	or l			;1b9f	b5 	. 
	ld (0d415h),a		;1ba0	32 15 d4 	2 . . 
	pop hl			;1ba3	e1 	. 
	pop af			;1ba4	f1 	. 
sub_1ba5h:
	push hl			;1ba5	e5 	. 
	and 007h		;1ba6	e6 07 	. . 
	ld hl,l0540h		;1ba8	21 40 05 	! @ . 
	ld c,a			;1bab	4f 	O 
	ld b,000h		;1bac	06 00 	. . 
	add hl,bc			;1bae	09 	. 
	call sub_1959h		;1baf	cd 59 19 	. Y . 
	pop hl			;1bb2	e1 	. 
	ret			;1bb3	c9 	. 
l1bb4h:
	ld a,(de)			;1bb4	1a 	. 
	ld (hl),a			;1bb5	77 	w 
	inc hl			;1bb6	23 	# 
	inc de			;1bb7	13 	. 
	dec bc			;1bb8	0b 	. 
sub_1bb9h:
	ld a,b			;1bb9	78 	x 
	or c			;1bba	b1 	. 
	jr nz,l1bb4h		;1bbb	20 f7 	  . 
	ret			;1bbd	c9 	. 
sub_1bbeh:
	push hl			;1bbe	e5 	. 
	ld hl,(0d051h)		;1bbf	2a 51 d0 	* Q . 
	inc hl			;1bc2	23 	# 
	ld a,h			;1bc3	7c 	| 
	or l			;1bc4	b5 	. 
	pop hl			;1bc5	e1 	. 
	ret nz			;1bc6	c0 	. 
	ld e,00ch		;1bc7	1e 0c 	. . 
	jp l09ach		;1bc9	c3 ac 09 	. . . 
sub_1bcch:
	rst 8			;1bcc	cf 	. 
	ret c			;1bcd	d8 	. 
	ld a,080h		;1bce	3e 80 	> . 
	ld (0d303h),a		;1bd0	32 03 d3 	2 . . 
	or (hl)			;1bd3	b6 	. 
	ld c,a			;1bd4	4f 	O 
	jp 04cb6h		;1bd5	c3 b6 4c 	. . L 
l1bd8h:
	cp 07eh		;1bd8	fe 7e 	. ~ 
	jp nz,l0992h		;1bda	c2 92 09 	. . . 
	inc hl			;1bdd	23 	# 
	ld a,(hl)			;1bde	7e 	~ 
	inc hl			;1bdf	23 	# 
	cp 083h		;1be0	fe 83 	. . 
	jp z,02e10h		;1be2	ca 10 2e 	. . . 
	call 0db5bh		;1be5	cd 5b db 	. [ . 
	jp l0992h		;1be8	c3 92 09 	. . . 
	call sub_1ef2h		;1beb	cd f2 1e 	. . . 
	ld b,h			;1bee	44 	D 
	ld c,l			;1bef	4d 	M 
	in a,(c)		;1bf0	ed 78 	. x 
	jp sub_19f3h		;1bf2	c3 f3 19 	. . . 
sub_1bf5h:
	call sub_1ee8h		;1bf5	cd e8 1e 	. . . 
	push de			;1bf8	d5 	. 
	rst 8			;1bf9	cf 	. 
	inc l			;1bfa	2c 	, 
	call sub_1c2eh		;1bfb	cd 2e 1c 	. . . 
	pop bc			;1bfe	c1 	. 
	ret			;1bff	c9 	. 
	call sub_1bf5h		;1c00	cd f5 1b 	. . . 
	out (c),a		;1c03	ed 79 	. y 
	ret			;1c05	c9 	. 
	call sub_1bf5h		;1c06	cd f5 1b 	. . . 
	push bc			;1c09	c5 	. 
	push af			;1c0a	f5 	. 
	ld e,000h		;1c0b	1e 00 	. . 
	dec hl			;1c0d	2b 	+ 
	rst 10h			;1c0e	d7 	. 
	jr z,l1c16h		;1c0f	28 05 	( . 
	rst 8			;1c11	cf 	. 
	inc l			;1c12	2c 	, 
	call sub_1c2eh		;1c13	cd 2e 1c 	. . . 
l1c16h:
	pop af			;1c16	f1 	. 
	ld d,a			;1c17	57 	W 
	pop bc			;1c18	c1 	. 
l1c19h:
	in a,(c)		;1c19	ed 78 	. x 
	xor e			;1c1b	ab 	. 
	and d			;1c1c	a2 	. 
	jr z,l1c19h		;1c1d	28 fa 	( . 
	ret			;1c1f	c9 	. 
sub_1c20h:
	rst 10h			;1c20	d7 	. 
sub_1c21h:
	call sub_1645h		;1c21	cd 45 16 	. E . 
sub_1c24h:
	push hl			;1c24	e5 	. 
	call 037eah		;1c25	cd ea 37 	. . 7 
	ex de,hl			;1c28	eb 	. 
	pop hl			;1c29	e1 	. 
	ld a,d			;1c2a	7a 	z 
	or a			;1c2b	b7 	. 
	ret			;1c2c	c9 	. 
sub_1c2dh:
	rst 10h			;1c2d	d7 	. 
sub_1c2eh:
	call sub_1645h		;1c2e	cd 45 16 	. E . 
	call sub_1c24h		;1c31	cd 24 1c 	. $ . 
	jp nz,l10d6h		;1c34	c2 d6 10 	. . . 
	dec hl			;1c37	2b 	+ 
	rst 10h			;1c38	d7 	. 
	ld a,e			;1c39	7b 	{ 
	ret			;1c3a	c9 	. 
	ld hl,(0d053h)		;1c3b	2a 53 d0 	* S . 
	ld (0d320h),hl		;1c3e	22 20 d3 	"   . 
	ld hl,08000h		;1c41	21 00 80 	! . . 
	ld e,(hl)			;1c44	5e 	^ 
	inc hl			;1c45	23 	# 
	ld d,(hl)			;1c46	56 	V 
	inc hl			;1c47	23 	# 
	inc hl			;1c48	23 	# 
	ld (0d053h),hl		;1c49	22 53 d0 	" S . 
	ex de,hl			;1c4c	eb 	. 
	ld (0d04fh),hl		;1c4d	22 4f d0 	" O . 
	ld sp,hl			;1c50	f9 	. 
	ld de,0ff00h		;1c51	11 00 ff 	. . . 
	add hl,de			;1c54	19 	. 
	ld (0d2d4h),hl		;1c55	22 d4 d2 	" . . 
	ld bc,l0f8ah		;1c58	01 8a 0f 	. . . 
	push bc			;1c5b	c5 	. 
	jp 042b7h		;1c5c	c3 b7 42 	. . B 
	ld a,001h		;1c5f	3e 01 	> . 
	ld (0d049h),a		;1c61	32 49 d0 	2 I . 
	call 0db61h		;1c64	cd 61 db 	. a . 
	pop bc			;1c67	c1 	. 
	call sub_0bb0h		;1c68	cd b0 0b 	. . . 
	push bc			;1c6b	c5 	. 
l1c6ch:
	ld hl,0ffffh		;1c6c	21 ff ff 	! . . 
	ld (0d051h),hl		;1c6f	22 51 d0 	" Q . 
	pop hl			;1c72	e1 	. 
	pop de			;1c73	d1 	. 
	ld c,(hl)			;1c74	4e 	N 
	inc hl			;1c75	23 	# 
	ld b,(hl)			;1c76	46 	F 
	inc hl			;1c77	23 	# 
	ld a,b			;1c78	78 	x 
	or c			;1c79	b1 	. 
	jp z,l0a4bh		;1c7a	ca 4b 0a 	. K . 
	call 045a0h		;1c7d	cd a0 45 	. . E 
	call z,05289h		;1c80	cc 89 52 	. . R 
	push bc			;1c83	c5 	. 
	ld c,(hl)			;1c84	4e 	N 
	inc hl			;1c85	23 	# 
	ld b,(hl)			;1c86	46 	F 
	inc hl			;1c87	23 	# 
	push bc			;1c88	c5 	. 
	ex (sp),hl			;1c89	e3 	. 
	ex de,hl			;1c8a	eb 	. 
	rst 20h			;1c8b	e7 	. 
	pop bc			;1c8c	c1 	. 
	jp c,00a4ah		;1c8d	da 4a 0a 	. J . 
	ex (sp),hl			;1c90	e3 	. 
	push hl			;1c91	e5 	. 
	push bc			;1c92	c5 	. 
	ex de,hl			;1c93	eb 	. 
	ld (0d313h),hl		;1c94	22 13 d3 	" . . 
	call 03cfah		;1c97	cd fa 3c 	. . < 
	pop hl			;1c9a	e1 	. 
	ld a,(hl)			;1c9b	7e 	~ 
	cp 009h		;1c9c	fe 09 	. . 
	jr z,l1ca3h		;1c9e	28 03 	( . 
	ld a,020h		;1ca0	3e 20 	>   
	rst 18h			;1ca2	df 	. 
l1ca3h:
	call sub_1cbah		;1ca3	cd ba 1c 	. . . 
	ld hl,0d1c0h		;1ca6	21 c0 d1 	! . . 
	call sub_1cb1h		;1ca9	cd b1 1c 	. . . 
	call 05268h		;1cac	cd 68 52 	. h R 
	jr l1c6ch		;1caf	18 bb 	. . 
sub_1cb1h:
	ld a,(hl)			;1cb1	7e 	~ 
	or a			;1cb2	b7 	. 
	ret z			;1cb3	c8 	. 
	call 052d4h		;1cb4	cd d4 52 	. . R 
	inc hl			;1cb7	23 	# 
	jr sub_1cb1h		;1cb8	18 f7 	. . 
sub_1cbah:
	ld bc,0d1c0h		;1cba	01 c0 d1 	. . . 
	ld d,0ffh		;1cbd	16 ff 	. . 
	xor a			;1cbf	af 	. 
	ld (0d2c6h),a		;1cc0	32 c6 d2 	2 . . 
	xor a			;1cc3	af 	. 
	ld (0d42ch),a		;1cc4	32 2c d4 	2 , . 
	jr l1ccdh		;1cc7	18 04 	. . 
l1cc9h:
	inc bc			;1cc9	03 	. 
	inc hl			;1cca	23 	# 
	dec d			;1ccb	15 	. 
	ret z			;1ccc	c8 	. 
l1ccdh:
	ld a,(hl)			;1ccd	7e 	~ 
	or a			;1cce	b7 	. 
	ld (bc),a			;1ccf	02 	. 
	ret z			;1cd0	c8 	. 
	cp 00bh		;1cd1	fe 0b 	. . 
	jr c,l1cfah		;1cd3	38 25 	8 % 
	cp 020h		;1cd5	fe 20 	.   
	ld e,a			;1cd7	5f 	_ 
	jr c,l1d0bh		;1cd8	38 31 	8 1 
	cp 022h		;1cda	fe 22 	. " 
	jr nz,l1ce8h		;1cdc	20 0a 	  . 
	ld a,(0d2c6h)		;1cde	3a c6 d2 	: . . 
	xor 001h		;1ce1	ee 01 	. . 
	ld (0d2c6h),a		;1ce3	32 c6 d2 	2 . . 
	ld a,022h		;1ce6	3e 22 	> " 
l1ce8h:
	cp 03ah		;1ce8	fe 3a 	. : 
	jr nz,l1cfah		;1cea	20 0e 	  . 
	ld a,(0d2c6h)		;1cec	3a c6 d2 	: . . 
	rra			;1cef	1f 	. 
	jr c,l1cf8h		;1cf0	38 06 	8 . 
	rla			;1cf2	17 	. 
	and 0fdh		;1cf3	e6 fd 	. . 
	ld (0d2c6h),a		;1cf5	32 c6 d2 	2 . . 
l1cf8h:
	ld a,03ah		;1cf8	3e 3a 	> : 
l1cfah:
	or a			;1cfa	b7 	. 
	jp m,l1d2dh		;1cfb	fa 2d 1d 	. - . 
	ld e,a			;1cfe	5f 	_ 
	cp 02eh		;1cff	fe 2e 	. . 
	jr z,l1d0bh		;1d01	28 08 	( . 
	call sub_1e0fh		;1d03	cd 0f 1e 	. . . 
	jr nc,l1d0bh		;1d06	30 03 	0 . 
	xor a			;1d08	af 	. 
	jr l1d1ch		;1d09	18 11 	. . 
l1d0bh:
	ld a,(0d42ch)		;1d0b	3a 2c d4 	: , . 
	or a			;1d0e	b7 	. 
	jr z,l1d1ah		;1d0f	28 09 	( . 
	inc a			;1d11	3c 	< 
	jr nz,l1d1ah		;1d12	20 06 	  . 
	ld a,020h		;1d14	3e 20 	>   
	ld (bc),a			;1d16	02 	. 
	inc bc			;1d17	03 	. 
	dec d			;1d18	15 	. 
	ret z			;1d19	c8 	. 
l1d1ah:
	ld a,001h		;1d1a	3e 01 	> . 
l1d1ch:
	ld (0d42ch),a		;1d1c	32 2c d4 	2 , . 
	ld a,e			;1d1f	7b 	{ 
	cp 00bh		;1d20	fe 0b 	. . 
	jr c,l1d29h		;1d22	38 05 	8 . 
	cp 020h		;1d24	fe 20 	.   
	jp c,l1e1ah		;1d26	da 1a 1e 	. . . 
l1d29h:
	ld (bc),a			;1d29	02 	. 
	jp l1cc9h		;1d2a	c3 c9 1c 	. . . 
l1d2dh:
	ld a,(0d2c6h)		;1d2d	3a c6 d2 	: . . 
	rra			;1d30	1f 	. 
	jr c,l1d61h		;1d31	38 2e 	8 . 
	rra			;1d33	1f 	. 
	rra			;1d34	1f 	. 
	jr nc,l1d75h		;1d35	30 3e 	0 > 
	ld a,(hl)			;1d37	7e 	~ 
	cp 0e0h		;1d38	fe e0 	. . 
	push hl			;1d3a	e5 	. 
	push bc			;1d3b	c5 	. 
	ld hl,l1d5eh		;1d3c	21 5e 1d 	! ^ . 
	push hl			;1d3f	e5 	. 
	ret nz			;1d40	c0 	. 
	dec bc			;1d41	0b 	. 
	ld a,(bc)			;1d42	0a 	. 
	cp 04dh		;1d43	fe 4d 	. M 
	ret nz			;1d45	c0 	. 
	dec bc			;1d46	0b 	. 
	ld a,(bc)			;1d47	0a 	. 
	cp 045h		;1d48	fe 45 	. E 
	ret nz			;1d4a	c0 	. 
	dec bc			;1d4b	0b 	. 
	ld a,(bc)			;1d4c	0a 	. 
	cp 052h		;1d4d	fe 52 	. R 
	ret nz			;1d4f	c0 	. 
	dec bc			;1d50	0b 	. 
	ld a,(bc)			;1d51	0a 	. 
	cp 03ah		;1d52	fe 3a 	. : 
	ret nz			;1d54	c0 	. 
	pop af			;1d55	f1 	. 
	pop af			;1d56	f1 	. 
	pop hl			;1d57	e1 	. 
	inc d			;1d58	14 	. 
	inc d			;1d59	14 	. 
	inc d			;1d5a	14 	. 
	inc d			;1d5b	14 	. 
	jr l1d83h		;1d5c	18 25 	. % 
l1d5eh:
	pop bc			;1d5e	c1 	. 
	pop hl			;1d5f	e1 	. 
	ld a,(hl)			;1d60	7e 	~ 
l1d61h:
	jp l1cc9h		;1d61	c3 c9 1c 	. . . 
sub_1d64h:
	ld a,(0d2c6h)		;1d64	3a c6 d2 	: . . 
	or 002h		;1d67	f6 02 	. . 
l1d69h:
	ld (0d2c6h),a		;1d69	32 c6 d2 	2 . . 
	xor a			;1d6c	af 	. 
	ret			;1d6d	c9 	. 
sub_1d6eh:
	ld a,(0d2c6h)		;1d6e	3a c6 d2 	: . . 
	or 004h		;1d71	f6 04 	. . 
	jr l1d69h		;1d73	18 f4 	. . 
l1d75h:
	rla			;1d75	17 	. 
	jr c,l1d61h		;1d76	38 e9 	8 . 
	ld a,(hl)			;1d78	7e 	~ 
	cp 084h		;1d79	fe 84 	. . 
	call z,sub_1d64h		;1d7b	cc 64 1d 	. d . 
	cp 08fh		;1d7e	fe 8f 	. . 
	call z,sub_1d6eh		;1d80	cc 6e 1d 	. n . 
l1d83h:
	ld a,(hl)			;1d83	7e 	~ 
	inc a			;1d84	3c 	< 
	ld a,(hl)			;1d85	7e 	~ 
	jr nz,l1d8ch		;1d86	20 04 	  . 
	inc hl			;1d88	23 	# 
	ld a,(hl)			;1d89	7e 	~ 
	and 07fh		;1d8a	e6 7f 	.  
l1d8ch:
	inc hl			;1d8c	23 	# 
	cp 0a1h		;1d8d	fe a1 	. . 
	jr nz,l1d93h		;1d8f	20 02 	  . 
	dec bc			;1d91	0b 	. 
	inc d			;1d92	14 	. 
l1d93h:
	cp 0b1h		;1d93	fe b1 	. . 
	jr nz,l1da0h		;1d95	20 09 	  . 
	ld a,(hl)			;1d97	7e 	~ 
	inc hl			;1d98	23 	# 
	cp 0f1h		;1d99	fe f1 	. . 
	ld a,0b1h		;1d9b	3e b1 	> . 
	jr z,l1da0h		;1d9d	28 01 	( . 
	dec hl			;1d9f	2b 	+ 
l1da0h:
	push hl			;1da0	e5 	. 
	push bc			;1da1	c5 	. 
	push de			;1da2	d5 	. 
	call 0db10h		;1da3	cd 10 db 	. . . 
	ld hl,002a0h		;1da6	21 a0 02 	! . . 
	ld b,a			;1da9	47 	G 
	ld c,040h		;1daa	0e 40 	. @ 
l1dach:
	inc c			;1dac	0c 	. 
l1dadh:
	inc hl			;1dad	23 	# 
	ld d,h			;1dae	54 	T 
	ld e,l			;1daf	5d 	] 
l1db0h:
	ld a,(hl)			;1db0	7e 	~ 
	or a			;1db1	b7 	. 
	jr z,l1dach		;1db2	28 f8 	( . 
	inc hl			;1db4	23 	# 
	jp p,l1db0h		;1db5	f2 b0 1d 	. . . 
	ld a,(hl)			;1db8	7e 	~ 
	cp b			;1db9	b8 	. 
	jr nz,l1dadh		;1dba	20 f1 	  . 
	ex de,hl			;1dbc	eb 	. 
	cp 0d7h		;1dbd	fe d7 	. . 
	jr z,l1dc3h		;1dbf	28 02 	( . 
	cp 0d8h		;1dc1	fe d8 	. . 
l1dc3h:
	ld a,c			;1dc3	79 	y 
	pop de			;1dc4	d1 	. 
	pop bc			;1dc5	c1 	. 
	ld e,a			;1dc6	5f 	_ 
	jr nz,l1dd4h		;1dc7	20 0b 	  . 
	ld a,(0d42ch)		;1dc9	3a 2c d4 	: , . 
	or a			;1dcc	b7 	. 
	ld a,000h		;1dcd	3e 00 	> . 
	ld (0d42ch),a		;1dcf	32 2c d4 	2 , . 
	jr l1de7h		;1dd2	18 13 	. . 
l1dd4h:
	cp 05bh		;1dd4	fe 5b 	. [ 
	jr nz,l1ddeh		;1dd6	20 06 	  . 
	xor a			;1dd8	af 	. 
	ld (0d42ch),a		;1dd9	32 2c d4 	2 , . 
	jr l1df4h		;1ddc	18 16 	. . 
l1ddeh:
	ld a,(0d42ch)		;1dde	3a 2c d4 	: , . 
	or a			;1de1	b7 	. 
	ld a,0ffh		;1de2	3e ff 	> . 
	ld (0d42ch),a		;1de4	32 2c d4 	2 , . 
l1de7h:
	jr z,l1df1h		;1de7	28 08 	( . 
	ld a,020h		;1de9	3e 20 	>   
	ld (bc),a			;1deb	02 	. 
	inc bc			;1dec	03 	. 
	dec d			;1ded	15 	. 
	jp z,02b49h		;1dee	ca 49 2b 	. I + 
l1df1h:
	ld a,e			;1df1	7b 	{ 
	jr l1df7h		;1df2	18 03 	. . 
l1df4h:
	ld a,(hl)			;1df4	7e 	~ 
	inc hl			;1df5	23 	# 
	ld e,a			;1df6	5f 	_ 
l1df7h:
	and 07fh		;1df7	e6 7f 	.  
	ld (bc),a			;1df9	02 	. 
	inc bc			;1dfa	03 	. 
	dec d			;1dfb	15 	. 
	jp z,02b49h		;1dfc	ca 49 2b 	. I + 
	or e			;1dff	b3 	. 
	jp p,l1df4h		;1e00	f2 f4 1d 	. . . 
	cp 0a8h		;1e03	fe a8 	. . 
	jr nz,l1e0bh		;1e05	20 04 	  . 
	xor a			;1e07	af 	. 
	ld (0d42ch),a		;1e08	32 2c d4 	2 , . 
l1e0bh:
	pop hl			;1e0b	e1 	. 
	jp l1ccdh		;1e0c	c3 cd 1c 	. . . 
sub_1e0fh:
	call 04441h		;1e0f	cd 41 44 	. A D 
	ret nc			;1e12	d0 	. 
	cp 030h		;1e13	fe 30 	. 0 
	ret c			;1e15	d8 	. 
	cp 03ah		;1e16	fe 3a 	. : 
	ccf			;1e18	3f 	? 
	ret			;1e19	c9 	. 
l1e1ah:
	dec hl			;1e1a	2b 	+ 
	rst 10h			;1e1b	d7 	. 
	push de			;1e1c	d5 	. 
	push bc			;1e1d	c5 	. 
	push af			;1e1e	f5 	. 
	call sub_1064h		;1e1f	cd 64 10 	. d . 
	pop af			;1e22	f1 	. 
	ld bc,l1e37h		;1e23	01 37 1e 	. 7 . 
	push bc			;1e26	c5 	. 
	cp 00bh		;1e27	fe 0b 	. . 
	jp z,04014h		;1e29	ca 14 40 	. . @ 
	cp 00ch		;1e2c	fe 0c 	. . 
	jp z,04018h		;1e2e	ca 18 40 	. . @ 
	ld hl,(0d2cch)		;1e31	2a cc d2 	* . . 
	jp 03d0dh		;1e34	c3 0d 3d 	. . = 
l1e37h:
	pop bc			;1e37	c1 	. 
	pop de			;1e38	d1 	. 
	ld a,(0d2cah)		;1e39	3a ca d2 	: . . 
	ld e,04fh		;1e3c	1e 4f 	. O 
	cp 00bh		;1e3e	fe 0b 	. . 
	jr z,l1e48h		;1e40	28 06 	( . 
	cp 00ch		;1e42	fe 0c 	. . 
	ld e,048h		;1e44	1e 48 	. H 
	jr nz,l1e53h		;1e46	20 0b 	  . 
l1e48h:
	ld a,026h		;1e48	3e 26 	> & 
	ld (bc),a			;1e4a	02 	. 
	inc bc			;1e4b	03 	. 
	dec d			;1e4c	15 	. 
	ret z			;1e4d	c8 	. 
	ld a,e			;1e4e	7b 	{ 
	ld (bc),a			;1e4f	02 	. 
	inc bc			;1e50	03 	. 
	dec d			;1e51	15 	. 
	ret z			;1e52	c8 	. 
l1e53h:
	ld a,(0d2cbh)		;1e53	3a cb d2 	: . . 
	cp 004h		;1e56	fe 04 	. . 
	ld e,000h		;1e58	1e 00 	. . 
	jr c,l1e62h		;1e5a	38 06 	8 . 
	ld e,021h		;1e5c	1e 21 	. ! 
	jr z,l1e62h		;1e5e	28 02 	( . 
	ld e,023h		;1e60	1e 23 	. # 
l1e62h:
	ld a,(hl)			;1e62	7e 	~ 
	cp 020h		;1e63	fe 20 	.   
	call z,0374ah		;1e65	cc 4a 37 	. J 7 
l1e68h:
	ld a,(hl)			;1e68	7e 	~ 
	inc hl			;1e69	23 	# 
	or a			;1e6a	b7 	. 
	jr z,l1e8dh		;1e6b	28 20 	(   
	ld (bc),a			;1e6d	02 	. 
	inc bc			;1e6e	03 	. 
	dec d			;1e6f	15 	. 
	ret z			;1e70	c8 	. 
	ld a,(0d2cbh)		;1e71	3a cb d2 	: . . 
	cp 004h		;1e74	fe 04 	. . 
	jr c,l1e68h		;1e76	38 f0 	8 . 
	dec bc			;1e78	0b 	. 
	ld a,(bc)			;1e79	0a 	. 
	inc bc			;1e7a	03 	. 
	jr nz,l1e81h		;1e7b	20 04 	  . 
	cp 02eh		;1e7d	fe 2e 	. . 
	jr z,l1e89h		;1e7f	28 08 	( . 
l1e81h:
	cp 044h		;1e81	fe 44 	. D 
	jr z,l1e89h		;1e83	28 04 	( . 
	cp 045h		;1e85	fe 45 	. E 
	jr nz,l1e68h		;1e87	20 df 	  . 
l1e89h:
	ld e,000h		;1e89	1e 00 	. . 
	jr l1e68h		;1e8b	18 db 	. . 
l1e8dh:
	ld a,e			;1e8d	7b 	{ 
	or a			;1e8e	b7 	. 
	jr z,l1e95h		;1e8f	28 04 	( . 
	ld (bc),a			;1e91	02 	. 
	inc bc			;1e92	03 	. 
	dec d			;1e93	15 	. 
	ret z			;1e94	c8 	. 
l1e95h:
	ld hl,(0d2c8h)		;1e95	2a c8 d2 	* . . 
	jp l1ccdh		;1e98	c3 cd 1c 	. . . 
	call sub_0bb0h		;1e9b	cd b0 0b 	. . . 
	push bc			;1e9e	c5 	. 
	call 0203ch		;1e9f	cd 3c 20 	. <   
	pop bc			;1ea2	c1 	. 
	pop de			;1ea3	d1 	. 
	push bc			;1ea4	c5 	. 
	push bc			;1ea5	c5 	. 
	call sub_0bcch		;1ea6	cd cc 0b 	. . . 
	jr nc,l1eb0h		;1ea9	30 05 	0 . 
	ld d,h			;1eab	54 	T 
	ld e,l			;1eac	5d 	] 
	ex (sp),hl			;1ead	e3 	. 
	push hl			;1eae	e5 	. 
	rst 20h			;1eaf	e7 	. 
l1eb0h:
	jp nc,l10d6h		;1eb0	d2 d6 10 	. . . 
	ld hl,l0940h		;1eb3	21 40 09 	! @ . 
	call 02b1ah		;1eb6	cd 1a 2b 	. . + 
	pop bc			;1eb9	c1 	. 
	ld hl,l0b6eh		;1eba	21 6e 0b 	! n . 
	ex (sp),hl			;1ebd	e3 	. 
sub_1ebeh:
	ex de,hl			;1ebe	eb 	. 
	ld hl,(0d320h)		;1ebf	2a 20 d3 	*   . 
l1ec2h:
	ld a,(de)			;1ec2	1a 	. 
	ld (bc),a			;1ec3	02 	. 
	inc bc			;1ec4	03 	. 
	inc de			;1ec5	13 	. 
	rst 20h			;1ec6	e7 	. 
	jr nz,l1ec2h		;1ec7	20 f9 	  . 
	ld h,b			;1ec9	60 	` 
	ld l,c			;1eca	69 	i 
	ld (0d320h),hl		;1ecb	22 20 d3 	"   . 
	ld (0d322h),hl		;1ece	22 22 d3 	" " . 
	ld (0d324h),hl		;1ed1	22 24 d3 	" $ . 
	ret			;1ed4	c9 	. 
	call sub_1ef2h		;1ed5	cd f2 1e 	. . . 
	ld a,(hl)			;1ed8	7e 	~ 
	jp sub_19f3h		;1ed9	c3 f3 19 	. . . 
	call sub_1ee8h		;1edc	cd e8 1e 	. . . 
	push de			;1edf	d5 	. 
	rst 8			;1ee0	cf 	. 
	inc l			;1ee1	2c 	, 
	call sub_1c2eh		;1ee2	cd 2e 1c 	. . . 
	pop de			;1ee5	d1 	. 
	ld (de),a			;1ee6	12 	. 
	ret			;1ee7	c9 	. 
sub_1ee8h:
	call sub_1645h		;1ee8	cd 45 16 	. E . 
	push hl			;1eeb	e5 	. 
	call sub_1ef2h		;1eec	cd f2 1e 	. . . 
	ex de,hl			;1eef	eb 	. 
	pop hl			;1ef0	e1 	. 
	ret			;1ef1	c9 	. 
sub_1ef2h:
	ld bc,037eah		;1ef2	01 ea 37 	. . 7 
	push bc			;1ef5	c5 	. 
	rst 30h			;1ef6	f7 	. 
	ret m			;1ef7	f8 	. 
	call 0db49h		;1ef8	cd 49 db 	. I . 
	rst 28h			;1efb	ef 	. 
	ret m			;1efc	f8 	. 
	call 03812h		;1efd	cd 12 38 	. . 8 
	ld bc,03245h		;1f00	01 45 32 	. E 2 
	ld de,08076h		;1f03	11 76 80 	. v . 
	call 03785h		;1f06	cd 85 37 	. . 7 
	ret c			;1f09	d8 	. 
	ld bc,06545h		;1f0a	01 45 65 	. E e 
	ld de,06053h		;1f0d	11 53 60 	. S ` 
	call 03785h		;1f10	cd 85 37 	. . 7 
	jp nc,009a4h		;1f13	d2 a4 09 	. . . 
	ld bc,065c5h		;1f16	01 c5 65 	. . e 
	ld de,06053h		;1f19	11 53 60 	. S ` 
	jp 03b2ch		;1f1c	c3 2c 3b 	. , ; 
	ld bc,l000ah		;1f1f	01 0a 00 	. . . 
	push bc			;1f22	c5 	. 
	ld d,b			;1f23	50 	P 
	ld e,b			;1f24	58 	X 
	jr z,l1f4dh		;1f25	28 26 	( & 
	cp 02ch		;1f27	fe 2c 	. , 
	jr z,l1f34h		;1f29	28 09 	( . 
	push de			;1f2b	d5 	. 
	call sub_10dbh		;1f2c	cd db 10 	. . . 
	ld b,d			;1f2f	42 	B 
	ld c,e			;1f30	4b 	K 
	pop de			;1f31	d1 	. 
	jr z,l1f4dh		;1f32	28 19 	( . 
l1f34h:
	rst 8			;1f34	cf 	. 
	inc l			;1f35	2c 	, 
	call sub_10dbh		;1f36	cd db 10 	. . . 
	jr z,l1f4dh		;1f39	28 12 	( . 
	pop af			;1f3b	f1 	. 
	rst 8			;1f3c	cf 	. 
	inc l			;1f3d	2c 	, 
	push de			;1f3e	d5 	. 
	call sub_10e5h		;1f3f	cd e5 10 	. . . 
	jp nz,l0992h		;1f42	c2 92 09 	. . . 
	ld a,d			;1f45	7a 	z 
	or e			;1f46	b3 	. 
	jp z,l10d6h		;1f47	ca d6 10 	. . . 
	ex de,hl			;1f4a	eb 	. 
	ex (sp),hl			;1f4b	e3 	. 
	ex de,hl			;1f4c	eb 	. 
l1f4dh:
	push bc			;1f4d	c5 	. 
	call sub_0bcch		;1f4e	cd cc 0b 	. . . 
	pop de			;1f51	d1 	. 
	push de			;1f52	d5 	. 
	push bc			;1f53	c5 	. 
	call sub_0bcch		;1f54	cd cc 0b 	. . . 
	ld h,b			;1f57	60 	` 
	ld l,c			;1f58	69 	i 
	pop de			;1f59	d1 	. 
	rst 20h			;1f5a	e7 	. 
	ex de,hl			;1f5b	eb 	. 
	jp c,l10d6h		;1f5c	da d6 10 	. . . 
	pop de			;1f5f	d1 	. 
	pop bc			;1f60	c1 	. 
	pop af			;1f61	f1 	. 
	push hl			;1f62	e5 	. 
	push de			;1f63	d5 	. 
	jr l1f74h		;1f64	18 0e 	. . 
l1f66h:
	add hl,bc			;1f66	09 	. 
	jp c,l10d6h		;1f67	da d6 10 	. . . 
	ex de,hl			;1f6a	eb 	. 
	push hl			;1f6b	e5 	. 
	ld hl,0fff9h		;1f6c	21 f9 ff 	! . . 
	rst 20h			;1f6f	e7 	. 
	pop hl			;1f70	e1 	. 
	jp c,l10d6h		;1f71	da d6 10 	. . . 
l1f74h:
	push de			;1f74	d5 	. 
	ld e,(hl)			;1f75	5e 	^ 
	inc hl			;1f76	23 	# 
	ld d,(hl)			;1f77	56 	V 
	ld a,d			;1f78	7a 	z 
	or e			;1f79	b3 	. 
	ex de,hl			;1f7a	eb 	. 
	pop de			;1f7b	d1 	. 
	jr z,l1f85h		;1f7c	28 07 	( . 
	ld a,(hl)			;1f7e	7e 	~ 
	inc hl			;1f7f	23 	# 
	or (hl)			;1f80	b6 	. 
	dec hl			;1f81	2b 	+ 
	ex de,hl			;1f82	eb 	. 
	jr nz,l1f66h		;1f83	20 e1 	  . 
l1f85h:
	push bc			;1f85	c5 	. 
	call 01fa6h		;1f86	cd a6 1f 	. . . 
	pop bc			;1f89	c1 	. 
	pop de			;1f8a	d1 	. 
	pop hl			;1f8b	e1 	. 
l1f8ch:
	push de			;1f8c	d5 	. 
	ld e,(hl)			;1f8d	5e 	^ 
	inc hl			;1f8e	23 	# 
	ld d,(hl)			;1f8f	56 	V 
	ld a,d			;1f90	7a 	z 
	or e			;1f91	b3 	. 
	jr z,l1fa1h		;1f92	28 0d 	( . 
	ex de,hl			;1f94	eb 	. 
	ex (sp),hl			;1f95	e3 	. 
	ex de,hl			;1f96	eb 	. 
	inc hl			;1f97	23 	# 
	ld (hl),e			;1f98	73 	s 
	inc hl			;1f99	23 	# 
	ld (hl),d			;1f9a	72 	r 
	ex de,hl			;1f9b	eb 	. 
	add hl,bc			;1f9c	09 	. 
	ex de,hl			;1f9d	eb 	. 
	pop hl			;1f9e	e1 	. 
	jr l1f8ch		;1f9f	18 eb 	. . 
l1fa1h:
	ld bc,00a4ah		;1fa1	01 4a 0a 	. J . 
	push bc			;1fa4	c5 	. 
	cp 0f6h		;1fa5	fe f6 	. . 
	xor a			;1fa7	af 	. 
	ld (0d307h),a		;1fa8	32 07 d3 	2 . . 
	ld hl,(0d053h)		;1fab	2a 53 d0 	* S . 
	dec hl			;1fae	2b 	+ 
l1fafh:
	inc hl			;1faf	23 	# 
	ld a,(hl)			;1fb0	7e 	~ 
	inc hl			;1fb1	23 	# 
	or (hl)			;1fb2	b6 	. 
	ret z			;1fb3	c8 	. 
	inc hl			;1fb4	23 	# 
	ld e,(hl)			;1fb5	5e 	^ 
	inc hl			;1fb6	23 	# 
	ld d,(hl)			;1fb7	56 	V 
l1fb8h:
	rst 10h			;1fb8	d7 	. 
l1fb9h:
	or a			;1fb9	b7 	. 
	jr z,l1fafh		;1fba	28 f3 	( . 
	ld c,a			;1fbc	4f 	O 
	ld a,(0d307h)		;1fbd	3a 07 d3 	: . . 
	or a			;1fc0	b7 	. 
	ld a,c			;1fc1	79 	y 
	jr z,88		;1fc2	28 56 	( V 
	call 0db94h		;1fc4	cd 94 db 	. . . 
	cp 0a7h		;1fc7	fe a7 	. . 
	jr nz,l1fdfh		;1fc9	20 14 	  . 
	rst 10h			;1fcb	d7 	. 
	cp 089h		;1fcc	fe 89 	. . 
	jr nz,l1fb9h		;1fce	20 e9 	  . 
	rst 10h			;1fd0	d7 	. 
	cp 00eh		;1fd1	fe 0e 	. . 
	jr nz,l1fb9h		;1fd3	20 e4 	  . 
	push de			;1fd5	d5 	. 
	call l10edh		;1fd6	cd ed 10 	. . . 
	ld a,d			;1fd9	7a 	z 
	or e			;1fda	b3 	. 
	jr nz,l1fe7h		;1fdb	20 0a 	  . 
	jr 41		;1fdd	18 27 	. ' 
l1fdfh:
	cp 00eh		;1fdf	fe 0e 	. . 
	jr nz,l1fb8h		;1fe1	20 d5 	  . 
	push de			;1fe3	d5 	. 
	call l10edh		;1fe4	cd ed 10 	. . . 
l1fe7h:
	push hl			;1fe7	e5 	. 
	call sub_0bcch		;1fe8	cd cc 0b 	. . . 
	dec bc			;1feb	0b 	. 
	ld a,00dh		;1fec	3e 0d 	> . 
	jr c,62		;1fee	38 3c 	8 < 
	call 05257h		;1ff0	cd 57 52 	. W R 
	ld hl,0200ah		;1ff3	21 0a 20 	! .   
	push de			;1ff6	d5 	. 
	call 02b1ah		;1ff7	cd 1a 2b 	. . + 
	pop hl			;1ffa	e1 	. 
	call 03cfah		;1ffb	cd fa 3c 	. . < 
	pop bc			;1ffe	c1 	. 
	pop hl			;1fff	e1 	. 

	end
