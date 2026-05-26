; z80dasm 1.1.5
; command line: z80dasm -a -l -t -z -g 0x0000 roycpm-1_64k.td0

	org	00000h

l0000h:
	ld d,h			;0000	54 	T 
l0001h:
	ld b,h			;0001	44 	D 
	nop			;0002	00 	. 
	ld b,b			;0003	40 	@ 
	dec d			;0004	15 	. 
l0005h:
	nop			;0005	00 	. 
	ld (bc),a			;0006	02 	. 
	add a,c			;0007	81 	. 
	nop			;0008	00 	. 
	ld (bc),a			;0009	02 	. 
	or 04ah		;000a	f6 4a 	. J 
	sub b			;000c	90 	. 
	ld d,a			;000d	57 	W 
	ld l,e			;000e	6b 	k 
	nop			;000f	00 	. 
	ld (hl),d			;0010	72 	r 
	nop			;0011	00 	. 
	ld a,(bc)			;0012	0a 	. 
	rlca			;0013	07 	. 
	ld a,(05215h)		;0014	3a 15 52 	: . R 
	ld l,a			;0017	6f 	o 
	ld a,c			;0018	79 	y 
	ld h,c			;0019	61 	a 
	ld l,h			;001a	6c 	l 
	jr nz,l005eh		;001b	20 41 	  A 
	ld l,h			;001d	6c 	l 
	ld (hl),b			;001e	70 	p 
	ld l,b			;001f	68 	h 
	ld h,c			;0020	61 	a 
	ld (hl),h			;0021	74 	t 
	ld (hl),d			;0022	72 	r 
	ld l,a			;0023	6f 	o 
	ld l,(hl)			;0024	6e 	n 
l0025h:
	ld l,c			;0025	69 	i 
	ld h,e			;0026	63 	c 
	jr nz,l0079h		;0027	20 50 	  P 
	ld b,e			;0029	43 	C 
	jr nz,l007fh		;002a	20 53 	  S 
	ld a,c			;002c	79 	y 
	ld (hl),e			;002d	73 	s 
	ld (hl),h			;002e	74 	t 
	ld h,l			;002f	65 	e 
	ld l,l			;0030	6d 	m 
	nop			;0031	00 	. 
	dec (hl)			;0032	35 	5 
	ld (hl),04bh		;0033	36 4b 	6 K 
	jr nz,l007ah		;0035	20 43 	  C 
	ld d,b			;0037	50 	P 
	cpl			;0038	2f 	/ 
	ld c,l			;0039	4d 	M 
	jr nz,l006eh		;003a	20 32 	  2 
	ld l,032h		;003c	2e 32 	. 2 
	cpl			;003e	2f 	/ 
	inc sp			;003f	33 	3 
	ld l,031h		;0040	2e 31 	. 1 
	jr nz,l0097h		;0042	20 53 	  S 
	ld e,c			;0044	59 	Y 
	ld d,e			;0045	53 	S 
	ld d,h			;0046	54 	T 
	ld b,l			;0047	45 	E 
	ld c,l			;0048	4d 	M 
	jr nz,70		;0049	20 44 	  D 
	ld c,c			;004b	49 	I 
	ld d,e			;004c	53 	S 
	ld c,e			;004d	4b 	K 
	nop			;004e	00 	. 
	ld d,e			;004f	53 	S 
	ld h,l			;0050	65 	e 
	ld (hl),d			;0051	72 	r 
	ld l,c			;0052	69 	i 
	ld h,c			;0053	61 	a 
	ld l,h			;0054	6c 	l 
	jr nz,l007ah		;0055	20 23 	  # 
	jr nz,50		;0057	20 30 	  0 
	ld sp,03037h		;0059	31 37 30 	1 7 0 
	inc sp			;005c	33 	3 
	nop			;005d	00 	. 
l005eh:
	ld b,e			;005e	43 	C 
	ld l,a			;005f	6f 	o 
	ld (hl),b			;0060	70 	p 
	ld a,c			;0061	79 	y 
	ld (hl),d			;0062	72 	r 
	ld l,c			;0063	69 	i 
	ld h,a			;0064	67 	g 
	ld l,b			;0065	68 	h 
	ld (hl),h			;0066	74 	t 
	jr nz,l009ah		;0067	20 31 	  1 
	add hl,sp			;0069	39 	9 
	jr c,l00a0h		;006a	38 34 	8 4 
	jr nz,l00d0h		;006c	20 62 	  b 
l006eh:
	ld a,c			;006e	79 	y 
	jr nz,86		;006f	20 54 	  T 
	ld b,c			;0071	41 	A 
	jr nz,84		;0072	20 52 	  R 
	ld c,a			;0074	4f 	O 
	ld e,c			;0075	59 	Y 
	ld b,c			;0076	41 	A 
	ld c,h			;0077	4c 	L 
	cpl			;0078	2f 	/ 
l0079h:
	ld b,h			;0079	44 	D 
l007ah:
	ld d,d			;007a	52 	R 
	ld c,c			;007b	49 	I 
	nop			;007c	00 	. 
	nop			;007d	00 	. 
	nop			;007e	00 	. 
l007fh:
	nop			;007f	00 	. 
	nop			;0080	00 	. 
	djnz l0083h		;0081	10 00 	. . 
l0083h:
	nop			;0083	00 	. 
	ld b,b			;0084	40 	@ 
	nop			;0085	00 	. 
	nop			;0086	00 	. 
	ld bc,l0001h		;0087	01 01 00 	. . . 
	ld c,c			;008a	49 	I 
	ld bc,l0001h		;008b	01 01 00 	. . . 
	ld sp,05fffh		;008e	31 ff 5f 	1 . _ 
	ld hl,0e469h		;0091	21 69 e4 	! i . 
	res 3,(hl)		;0094	cb 9e 	. . 
	ld a,(hl)			;0096	7e 	~ 
l0097h:
	out (020h),a		;0097	d3 20 	.   
	push hl			;0099	e5 	. 
l009ah:
	call 0e45dh		;009a	cd 5d e4 	. ] . 
	pop hl			;009d	e1 	. 
	set 3,(hl)		;009e	cb de 	. . 
l00a0h:
	ld a,(hl)			;00a0	7e 	~ 
	out (020h),a		;00a1	d3 20 	.   
	ld a,031h		;00a3	3e 31 	> 1 
	ld (0e466h),a		;00a5	32 66 e4 	2 f . 
	call 0e44bh		;00a8	cd 4b e4 	. K . 
	ld hl,0c22bh		;00ab	21 2b c2 	! + . 
	ld de,06000h		;00ae	11 00 60 	. . ` 
	ld bc,l00cch		;00b1	01 cc 00 	. . . 
	ldir		;00b4	ed b0 	. . 
	jp 06000h		;00b6	c3 00 60 	. . ` 
	ld c,02ah		;00b9	0e 2a 	. * 
	call 0e412h		;00bb	cd 12 e4 	. . . 
	ld hl,l0000h		;00be	21 00 00 	! . . 
	ld (060c9h),hl		;00c1	22 c9 60 	" . ` 
	ld a,(060cbh)		;00c4	3a cb 60 	: . ` 
	ld c,a			;00c7	4f 	O 
	cp 020h		;00c8	fe 20 	.   
l00cah:
	ld b,000h		;00ca	06 00 	. . 
l00cch:
	jr c,l00d2h		;00cc	38 04 	8 . 
	ld c,01fh		;00ce	0e 1f 	. . 
l00d0h:
	sub c			;00d0	91 	. 
	ld b,a			;00d1	47 	G 
l00d2h:
	ld d,c			;00d2	51 	Q 
	ld e,0ffh		;00d3	1e ff 	. . 
	push de			;00d5	d5 	. 
	set 6,d		;00d6	cb f2 	. . 
	ld a,e			;00d8	7b 	{ 
	out (065h),a		;00d9	d3 65 	. e 
	ld a,d			;00db	7a 	z 
	out (065h),a		;00dc	d3 65 	. e 
	pop de			;00de	d1 	. 
	inc de			;00df	13 	. 
	ld hl,(060c9h)		;00e0	2a c9 60 	* . ` 
	ex de,hl			;00e3	eb 	. 
	ld (060c9h),hl		;00e4	22 c9 60 	" . ` 
	ld hl,0c300h		;00e7	21 00 c3 	! . . 
	add hl,de			;00ea	19 	. 
	ld a,l			;00eb	7d 	} 
	out (064h),a		;00ec	d3 64 	. d 
	ld a,h			;00ee	7c 	| 
	out (064h),a		;00ef	d3 64 	. d 
	ld a,044h		;00f1	3e 44 	> D 
	out (068h),a		;00f3	d3 68 	. h 
	ld hl,060b6h		;00f5	21 b6 60 	! . ` 
	call 060a0h		;00f8	cd a0 60 	. . ` 
	call 06097h		;00fb	cd 97 60 	. . ` 
	and 0c0h		;00fe	e6 c0 	. . 
	push af			;0100	f5 	. 
	ld c,006h		;0101	0e 06 	. . 
l0103h:
	call 06097h		;0103	cd 97 60 	. . ` 
	dec c			;0106	0d 	. 
	jr nz,l0103h		;0107	20 fa 	  . 
	pop af			;0109	f1 	. 
	jr nz,l0122h		;010a	20 16 	  . 
	cp b			;010c	b8 	. 
	jp z,0d900h		;010d	ca 00 d9 	. . . 
	ld hl,060c0h		;0110	21 c0 60 	! . ` 
	call 06087h		;0113	cd 87 60 	. . ` 
	ld a,001h		;0116	3e 01 	> . 
	ld (060b8h),a		;0118	32 b8 60 	2 . ` 
	ld (060bah),a		;011b	32 ba 60 	2 . ` 
	scf			;011e	37 	7 
	ld c,b			;011f	48 	H 
	jr l00cah		;0120	18 a8 	. . 
l0122h:
	ld hl,06077h		;0122	21 77 60 	! w ` 
l0125h:
	ld a,(hl)			;0125	7e 	~ 
	inc hl			;0126	23 	# 
	or a			;0127	b7 	. 
	jr z,l0137h		;0128	28 0d 	( . 
	ld c,a			;012a	4f 	O 
	call 0e412h		;012b	cd 12 e4 	. . . 
	jr l0125h		;012e	18 f5 	. . 
	rlca			;0130	07 	. 
	ld b,d			;0131	42 	B 
	ld l,a			;0132	6f 	o 
	ld l,a			;0133	6f 	o 
	ld (hl),h			;0134	74 	t 
	jr nz,l0137h		;0135	20 00 	  . 
l0137h:
	ld hl,060c4h		;0137	21 c4 60 	! . ` 
	call 06087h		;013a	cd 87 60 	. . ` 
	jp 06005h		;013d	c3 05 60 	. . ` 
	call 060a0h		;0140	cd a0 60 	. . ` 
	ld hl,060c7h		;0143	21 c7 60 	! . ` 
	call 060a0h		;0146	cd a0 60 	. . ` 
	call 06097h		;0149	cd 97 60 	. . ` 
	call 06097h		;014c	cd 97 60 	. . ` 
	ret			;014f	c9 	. 
l0150h:
	in a,(0f9h)		;0150	db f9 	. . 
	add a,040h		;0152	c6 40 	. @ 
	jr nc,l0150h		;0154	30 fa 	0 . 
	in a,(0f8h)		;0156	db f8 	. . 
	ret			;0158	c9 	. 
	ld c,(hl)			;0159	4e 	N 
	inc hl			;015a	23 	# 
l015bh:
	in a,(0f9h)		;015b	db f9 	. . 
	bit 7,a		;015d	cb 7f 	.  
	jr z,l015bh		;015f	28 fa 	( . 
	ld a,(hl)			;0161	7e 	~ 
	out (0f8h),a		;0162	d3 f8 	. . 
	inc hl			;0164	23 	# 
	dec c			;0165	0d 	. 
	jr nz,l015bh		;0166	20 f3 	  . 
l0168h:
	in a,(0f0h)		;0168	db f0 	. . 
	bit 6,a		;016a	cb 77 	. w 
	jr nz,l0168h		;016c	20 fa 	  . 
	ret			;016e	c9 	. 
	add hl,bc			;016f	09 	. 
	add a,000h		;0170	c6 00 	. . 
	nop			;0172	00 	. 
	nop			;0173	00 	. 
	ld (bc),a			;0174	02 	. 
	ld bc,03610h		;0175	01 10 36 	. . 6 
	rst 38h			;0178	ff 	. 
	inc bc			;0179	03 	. 
	rrca			;017a	0f 	. 
	nop			;017b	00 	. 
	ld bc,00702h		;017c	01 02 07 	. . . 
	nop			;017f	00 	. 
	ld bc,01908h		;0180	01 08 19 	. . . 
	nop			;0183	00 	. 
	ld e,03ch		;0184	1e 3c 	. < 
	dec l			;0186	2d 	- 
	dec l			;0187	2d 	- 
	dec l			;0188	2d 	- 
	nop			;0189	00 	. 
	nop			;018a	00 	. 
	nop			;018b	00 	. 
	nop			;018c	00 	. 
	nop			;018d	00 	. 
	nop			;018e	00 	. 
	nop			;018f	00 	. 
	ld (bc),a			;0190	02 	. 
	ld bc,01800h		;0191	01 00 18 	. . . 
	cp a			;0194	bf 	. 
	nop			;0195	00 	. 
	ld (bc),a			;0196	02 	. 
	nop			;0197	00 	. 
	ld a,0c3h		;0198	3e c3 	> . 
	ld e,h			;019a	5c 	\ 
	add a,0c3h		;019b	c6 c3 	. . 
	ld e,b			;019d	58 	X 
	add a,07fh		;019e	c6 7f 	.  
	nop			;01a0	00 	. 
	ld b,c			;01a1	41 	A 
	ld d,l			;01a2	55 	U 
	ld d,h			;01a3	54 	T 
	ld c,a			;01a4	4f 	O 
	ld b,l			;01a5	45 	E 
	ld e,b			;01a6	58 	X 
	nop			;01a7	00 	. 
	jr nz,l01aah		;01a8	20 00 	  . 
l01aah:
	jr nz,l01cch		;01aa	20 20 	    
	jr nz,l01ceh		;01ac	20 20 	    
	jr nz,l01d0h		;01ae	20 20 	    
	jr nz,69		;01b0	20 43 	  C 
	ld c,a			;01b2	4f 	O 
	ld d,b			;01b3	50 	P 
	ld e,c			;01b4	59 	Y 
	ld d,d			;01b5	52 	R 
	ld c,c			;01b6	49 	I 
	ld b,a			;01b7	47 	G 
	ld c,b			;01b8	48 	H 
	ld d,h			;01b9	54 	T 
	jr nz,l01e4h		;01ba	20 28 	  ( 
	ld b,e			;01bc	43 	C 
	add hl,hl			;01bd	29 	) 
	jr nz,51		;01be	20 31 	  1 
	add hl,sp			;01c0	39 	9 
	scf			;01c1	37 	7 
	add hl,sp			;01c2	39 	9 
	inc l			;01c3	2c 	, 
	jr nz,70		;01c4	20 44 	  D 
	ld c,c			;01c6	49 	I 
	ld b,a			;01c7	47 	G 
	ld c,c			;01c8	49 	I 
	ld d,h			;01c9	54 	T 
	ld b,c			;01ca	41 	A 
	ld c,h			;01cb	4c 	L 
l01cch:
	jr nz,84		;01cc	20 52 	  R 
l01ceh:
	ld b,l			;01ce	45 	E 
	ld d,e			;01cf	53 	S 
l01d0h:
	ld b,l			;01d0	45 	E 
	ld b,c			;01d1	41 	A 
	ld d,d			;01d2	52 	R 
	ld b,e			;01d3	43 	C 
	ld c,b			;01d4	48 	H 
	jr nz,l01f7h		;01d5	20 20 	    
	ld bc,l0025h		;01d7	01 25 00 	. % . 
	nop			;01da	00 	. 
	nop			;01db	00 	. 
	ld a,b			;01dc	78 	x 
	ex af,af'			;01dd	08 	. 
	jp l0000h		;01de	c3 00 00 	. . . 
	ld e,a			;01e1	5f 	_ 
	ld c,002h		;01e2	0e 02 	. . 
l01e4h:
	jp l0005h		;01e4	c3 05 00 	. . . 
	push bc			;01e7	c5 	. 
	call 0c38ch		;01e8	cd 8c c3 	. . . 
	pop bc			;01eb	c1 	. 
	ret			;01ec	c9 	. 
	ld a,00dh		;01ed	3e 0d 	> . 
	call 0c392h		;01ef	cd 92 c3 	. . . 
	ld a,00ah		;01f2	3e 0a 	> . 
	jp 0c392h		;01f4	c3 92 c3 	. . . 
l01f7h:
	ld a,020h		;01f7	3e 20 	>   
	jp 0c392h		;01f9	c3 92 c3 	. . . 
	push bc			;01fc	c5 	. 
	call 0c398h		;01fd	cd 98 c3 	. . . 

	end
