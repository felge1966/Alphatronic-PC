; z80dasm 1.1.5
; command line: z80dasm -a -l -t -z -g 0x0000 alpha1-8k.bin

	org	00000h

l0000h:
	ld sp,05fffh		;0000	31 ff 5f 	1 . _ 
l0003h:
	ld hl,0e469h		;0003	21 69 e4 	! i . 
l0006h:
	res 3,(hl)		;0006	cb 9e 	. . 
	ld a,(hl)			;0008	7e 	~ 
l0009h:
	out (020h),a		;0009	d3 20 	.   
l000bh:
	push hl			;000b	e5 	. 
l000ch:
	call 0e45dh		;000c	cd 5d e4 	. ] . 
l000fh:
	pop hl			;000f	e1 	. 
l0010h:
	set 3,(hl)		;0010	cb de 	. . 
	ld a,(hl)			;0012	7e 	~ 
	out (020h),a		;0013	d3 20 	.   
	ld a,031h		;0015	3e 31 	> 1 
	ld (0e466h),a		;0017	32 66 e4 	2 f . 
	call 0e44bh		;001a	cd 4b e4 	. K . 
	ld hl,0c22bh		;001d	21 2b c2 	! + . 
l0020h:
	ld de,06000h		;0020	11 00 60 	. . ` 
	ld bc,l00cch		;0023	01 cc 00 	. . . 
	ldir		;0026	ed b0 	. . 
l0028h:
	jp 06000h		;0028	c3 00 60 	. . ` 
	ld c,02ah		;002b	0e 2a 	. * 
	call 0e412h		;002d	cd 12 e4 	. . . 
	ld hl,l0000h		;0030	21 00 00 	! . . 
	ld (060c9h),hl		;0033	22 c9 60 	" . ` 
	ld a,(060cbh)		;0036	3a cb 60 	: . ` 
	ld c,a			;0039	4f 	O 
	cp 020h		;003a	fe 20 	.   
l003ch:
	ld b,000h		;003c	06 00 	. . 
	jr c,l0044h		;003e	38 04 	8 . 
	ld c,01fh		;0040	0e 1f 	. . 
	sub c			;0042	91 	. 
	ld b,a			;0043	47 	G 
l0044h:
	ld d,c			;0044	51 	Q 
	ld e,0ffh		;0045	1e ff 	. . 
	push de			;0047	d5 	. 
	set 6,d		;0048	cb f2 	. . 
	ld a,e			;004a	7b 	{ 
	out (065h),a		;004b	d3 65 	. e 
	ld a,d			;004d	7a 	z 
	out (065h),a		;004e	d3 65 	. e 
	pop de			;0050	d1 	. 
	inc de			;0051	13 	. 
	ld hl,(060c9h)		;0052	2a c9 60 	* . ` 
	ex de,hl			;0055	eb 	. 
	ld (060c9h),hl		;0056	22 c9 60 	" . ` 
	ld hl,0c300h		;0059	21 00 c3 	! . . 
l005ch:
	add hl,de			;005c	19 	. 
	ld a,l			;005d	7d 	} 
	out (064h),a		;005e	d3 64 	. d 
	ld a,h			;0060	7c 	| 
	out (064h),a		;0061	d3 64 	. d 
	ld a,044h		;0063	3e 44 	> D 
	out (068h),a		;0065	d3 68 	. h 
	ld hl,060b6h		;0067	21 b6 60 	! . ` 
	call 060a0h		;006a	cd a0 60 	. . ` 
	call 06097h		;006d	cd 97 60 	. . ` 
	and 0c0h		;0070	e6 c0 	. . 
	push af			;0072	f5 	. 
	ld c,006h		;0073	0e 06 	. . 
l0075h:
	call 06097h		;0075	cd 97 60 	. . ` 
	dec c			;0078	0d 	. 
	jr nz,l0075h		;0079	20 fa 	  . 
	pop af			;007b	f1 	. 
	jr nz,l0094h		;007c	20 16 	  . 
	cp b			;007e	b8 	. 
	jp z,0d900h		;007f	ca 00 d9 	. . . 
	ld hl,060c0h		;0082	21 c0 60 	! . ` 
	call 06087h		;0085	cd 87 60 	. . ` 
	ld a,001h		;0088	3e 01 	> . 
	ld (060b8h),a		;008a	32 b8 60 	2 . ` 
	ld (060bah),a		;008d	32 ba 60 	2 . ` 
	scf			;0090	37 	7 
	ld c,b			;0091	48 	H 
	jr l003ch		;0092	18 a8 	. . 
l0094h:
	ld hl,06077h		;0094	21 77 60 	! w ` 
l0097h:
	ld a,(hl)			;0097	7e 	~ 
	inc hl			;0098	23 	# 
	or a			;0099	b7 	. 
	jr z,l00a9h		;009a	28 0d 	( . 
	ld c,a			;009c	4f 	O 
	call 0e412h		;009d	cd 12 e4 	. . . 
	jr l0097h		;00a0	18 f5 	. . 
	rlca			;00a2	07 	. 
	ld b,d			;00a3	42 	B 
	ld l,a			;00a4	6f 	o 
	ld l,a			;00a5	6f 	o 
	ld (hl),h			;00a6	74 	t 
	jr nz,l00a9h		;00a7	20 00 	  . 
l00a9h:
	ld hl,060c4h		;00a9	21 c4 60 	! . ` 
	call 06087h		;00ac	cd 87 60 	. . ` 
	jp 06005h		;00af	c3 05 60 	. . ` 
	call 060a0h		;00b2	cd a0 60 	. . ` 
	ld hl,060c7h		;00b5	21 c7 60 	! . ` 
	call 060a0h		;00b8	cd a0 60 	. . ` 
	call 06097h		;00bb	cd 97 60 	. . ` 
	call 06097h		;00be	cd 97 60 	. . ` 
	ret			;00c1	c9 	. 
l00c2h:
	in a,(0f9h)		;00c2	db f9 	. . 
	add a,040h		;00c4	c6 40 	. @ 
	jr nc,l00c2h		;00c6	30 fa 	0 . 
	in a,(0f8h)		;00c8	db f8 	. . 
	ret			;00ca	c9 	. 
	ld c,(hl)			;00cb	4e 	N 
l00cch:
	inc hl			;00cc	23 	# 
l00cdh:
	in a,(0f9h)		;00cd	db f9 	. . 
	bit 7,a		;00cf	cb 7f 	.  
	jr z,l00cdh		;00d1	28 fa 	( . 
	ld a,(hl)			;00d3	7e 	~ 
	out (0f8h),a		;00d4	d3 f8 	. . 
	inc hl			;00d6	23 	# 
	dec c			;00d7	0d 	. 
	jr nz,l00cdh		;00d8	20 f3 	  . 
l00dah:
	in a,(0f0h)		;00da	db f0 	. . 
	bit 6,a		;00dc	cb 77 	. w 
	jr nz,l00dah		;00de	20 fa 	  . 
	ret			;00e0	c9 	. 
	add hl,bc			;00e1	09 	. 
	add a,000h		;00e2	c6 00 	. . 
	nop			;00e4	00 	. 
	nop			;00e5	00 	. 
	ld (bc),a			;00e6	02 	. 
	ld bc,03610h		;00e7	01 10 36 	. . 6 
	rst 38h			;00ea	ff 	. 
	inc bc			;00eb	03 	. 
	rrca			;00ec	0f 	. 
	nop			;00ed	00 	. 
	ld bc,00702h		;00ee	01 02 07 	. . . 
	nop			;00f1	00 	. 
	ld bc,01908h		;00f2	01 08 19 	. . . 
	nop			;00f5	00 	. 
	ld e,03ch		;00f6	1e 3c 	. < 
	dec l			;00f8	2d 	- 
	dec l			;00f9	2d 	- 
	dec l			;00fa	2d 	- 
	nop			;00fb	00 	. 
	nop			;00fc	00 	. 
	nop			;00fd	00 	. 
	nop			;00fe	00 	. 
	nop			;00ff	00 	. 
l0100h:
	jp 0c65ch		;0100	c3 5c c6 	. \ . 
	jp 0c658h		;0103	c3 58 c6 	. X . 
	ld a,a			;0106	7f 	 
	nop			;0107	00 	. 
	jr nz,l012ah		;0108	20 20 	    
	jr nz,34		;010a	20 20 	    
	jr nz,l012eh		;010c	20 20 	    
	jr nz,l0130h		;010e	20 20 	    
	jr nz,l0132h		;0110	20 20 	    
	jr nz,34		;0112	20 20 	    
	jr nz,l0136h		;0114	20 20 	    
	jr nz,l0138h		;0116	20 20 	    
	ld b,e			;0118	43 	C 
	ld c,a			;0119	4f 	O 
	ld d,b			;011a	50 	P 
	ld e,c			;011b	59 	Y 
	ld d,d			;011c	52 	R 
	ld c,c			;011d	49 	I 
	ld b,a			;011e	47 	G 
	ld c,b			;011f	48 	H 
	ld d,h			;0120	54 	T 
	jr nz,l014bh		;0121	20 28 	  ( 
	ld b,e			;0123	43 	C 
	add hl,hl			;0124	29 	) 
	jr nz,l0158h		;0125	20 31 	  1 
	add hl,sp			;0127	39 	9 
	scf			;0128	37 	7 
	add hl,sp			;0129	39 	9 
l012ah:
	inc l			;012a	2c 	, 
	jr nz,l0171h		;012b	20 44 	  D 
	ld c,c			;012d	49 	I 
l012eh:
	ld b,a			;012e	47 	G 
	ld c,c			;012f	49 	I 
l0130h:
	ld d,h			;0130	54 	T 
	ld b,c			;0131	41 	A 
l0132h:
	ld c,h			;0132	4c 	L 
	jr nz,l0187h		;0133	20 52 	  R 
	ld b,l			;0135	45 	E 
l0136h:
	ld d,e			;0136	53 	S 
	ld b,l			;0137	45 	E 
l0138h:
	ld b,c			;0138	41 	A 
	ld d,d			;0139	52 	R 
	ld b,e			;013a	43 	C 
	ld c,b			;013b	48 	H 
	jr nz,l015eh		;013c	20 20 	    
	nop			;013e	00 	. 
	nop			;013f	00 	. 
	nop			;0140	00 	. 
	nop			;0141	00 	. 
	nop			;0142	00 	. 
	nop			;0143	00 	. 
	nop			;0144	00 	. 
	nop			;0145	00 	. 
	nop			;0146	00 	. 
	nop			;0147	00 	. 
	nop			;0148	00 	. 
	nop			;0149	00 	. 
	nop			;014a	00 	. 
l014bh:
	nop			;014b	00 	. 
	nop			;014c	00 	. 
	nop			;014d	00 	. 
	nop			;014e	00 	. 
	nop			;014f	00 	. 
	nop			;0150	00 	. 
	nop			;0151	00 	. 
	nop			;0152	00 	. 
	nop			;0153	00 	. 
	nop			;0154	00 	. 
	nop			;0155	00 	. 
	nop			;0156	00 	. 
	nop			;0157	00 	. 
l0158h:
	nop			;0158	00 	. 
	nop			;0159	00 	. 
	nop			;015a	00 	. 
	nop			;015b	00 	. 
	nop			;015c	00 	. 
	nop			;015d	00 	. 
l015eh:
	nop			;015e	00 	. 
	nop			;015f	00 	. 
	nop			;0160	00 	. 
	nop			;0161	00 	. 
	nop			;0162	00 	. 
	nop			;0163	00 	. 
	nop			;0164	00 	. 
	nop			;0165	00 	. 
	nop			;0166	00 	. 
	nop			;0167	00 	. 
	nop			;0168	00 	. 
	nop			;0169	00 	. 
	nop			;016a	00 	. 
	nop			;016b	00 	. 
	nop			;016c	00 	. 
	nop			;016d	00 	. 
	nop			;016e	00 	. 
	nop			;016f	00 	. 
	nop			;0170	00 	. 
l0171h:
	nop			;0171	00 	. 
	nop			;0172	00 	. 
	nop			;0173	00 	. 
	nop			;0174	00 	. 
	nop			;0175	00 	. 
	nop			;0176	00 	. 
	nop			;0177	00 	. 
	nop			;0178	00 	. 
	nop			;0179	00 	. 
	nop			;017a	00 	. 
	nop			;017b	00 	. 
	nop			;017c	00 	. 
	nop			;017d	00 	. 
	nop			;017e	00 	. 
	nop			;017f	00 	. 
	nop			;0180	00 	. 
	nop			;0181	00 	. 
	nop			;0182	00 	. 
	nop			;0183	00 	. 
	nop			;0184	00 	. 
	nop			;0185	00 	. 
	nop			;0186	00 	. 
l0187h:
	nop			;0187	00 	. 
	ex af,af'			;0188	08 	. 
	jp l0000h		;0189	c3 00 00 	. . . 
	ld e,a			;018c	5f 	_ 
	ld c,002h		;018d	0e 02 	. . 
	jp l0003h+2		;018f	c3 05 00 	. . . 
	push bc			;0192	c5 	. 
	call 0c38ch		;0193	cd 8c c3 	. . . 
	pop bc			;0196	c1 	. 
	ret			;0197	c9 	. 
	ld a,00dh		;0198	3e 0d 	> . 
	call 0c392h		;019a	cd 92 c3 	. . . 
	ld a,00ah		;019d	3e 0a 	> . 
	jp 0c392h		;019f	c3 92 c3 	. . . 
	ld a,020h		;01a2	3e 20 	>   
	jp 0c392h		;01a4	c3 92 c3 	. . . 
	push bc			;01a7	c5 	. 
	call 0c398h		;01a8	cd 98 c3 	. . . 
	pop hl			;01ab	e1 	. 
	ld a,(hl)			;01ac	7e 	~ 
	or a			;01ad	b7 	. 
	ret z			;01ae	c8 	. 
	inc hl			;01af	23 	# 
	push hl			;01b0	e5 	. 
	call 0c38ch		;01b1	cd 8c c3 	. . . 
	pop hl			;01b4	e1 	. 
	jp 0c3ach		;01b5	c3 ac c3 	. . . 
	ld c,00dh		;01b8	0e 0d 	. . 
	jp l0003h+2		;01ba	c3 05 00 	. . . 
	ld e,a			;01bd	5f 	_ 
	ld c,00eh		;01be	0e 0e 	. . 
	jp l0003h+2		;01c0	c3 05 00 	. . . 
	call l0003h+2		;01c3	cd 05 00 	. . . 
	ld (0caeeh),a		;01c6	32 ee ca 	2 . . 
	inc a			;01c9	3c 	< 
	ret			;01ca	c9 	. 
	ld c,00fh		;01cb	0e 0f 	. . 
	jp 0c3c3h		;01cd	c3 c3 c3 	. . . 
	xor a			;01d0	af 	. 
	ld (0caedh),a		;01d1	32 ed ca 	2 . . 
	ld de,0cacdh		;01d4	11 cd ca 	. . . 
	jp 0c3cbh		;01d7	c3 cb c3 	. . . 
	ld c,010h		;01da	0e 10 	. . 
	jp 0c3c3h		;01dc	c3 c3 c3 	. . . 
	ld c,011h		;01df	0e 11 	. . 
	jp 0c3c3h		;01e1	c3 c3 c3 	. . . 
	ld c,012h		;01e4	0e 12 	. . 
	jp 0c3c3h		;01e6	c3 c3 c3 	. . . 
	ld de,0cacdh		;01e9	11 cd ca 	. . . 
	jp 0c3dfh		;01ec	c3 df c3 	. . . 
	ld c,013h		;01ef	0e 13 	. . 
	jp l0003h+2		;01f1	c3 05 00 	. . . 
	call l0003h+2		;01f4	cd 05 00 	. . . 
	or a			;01f7	b7 	. 
	ret			;01f8	c9 	. 
	ld c,014h		;01f9	0e 14 	. . 
	jp 0c3f4h		;01fb	c3 f4 c3 	. . . 
	ld de,0cacdh		;01fe	11 cd ca 	. . . 
	jp 0c3f9h		;0201	c3 f9 c3 	. . . 
	ld c,015h		;0204	0e 15 	. . 
	jp 0c3f4h		;0206	c3 f4 c3 	. . . 
	ld c,016h		;0209	0e 16 	. . 
	jp 0c3c3h		;020b	c3 c3 c3 	. . . 
	ld c,017h		;020e	0e 17 	. . 
	jp l0003h+2		;0210	c3 05 00 	. . . 
	ld e,0ffh		;0213	1e ff 	. . 
	ld c,020h		;0215	0e 20 	.   
	jp l0003h+2		;0217	c3 05 00 	. . . 
	call 0c413h		;021a	cd 13 c4 	. . . 
	add a,a			;021d	87 	. 
	add a,a			;021e	87 	. 
	add a,a			;021f	87 	. 
	add a,a			;0220	87 	. 
	ld hl,0caefh		;0221	21 ef ca 	! . . 
	or (hl)			;0224	b6 	. 
	ld (l0003h+1),a		;0225	32 04 00 	2 . . 
	ret			;0228	c9 	. 
	ld a,(0caefh)		;0229	3a ef ca 	: . . 
	ld (l0003h+1),a		;022c	32 04 00 	2 . . 
	ret			;022f	c9 	. 
	cp 061h		;0230	fe 61 	. a 
	ret c			;0232	d8 	. 
	cp 07bh		;0233	fe 7b 	. { 
	ret nc			;0235	d0 	. 
	and 05fh		;0236	e6 5f 	. _ 
	ret			;0238	c9 	. 
	ld a,(0caabh)		;0239	3a ab ca 	: . . 
	or a			;023c	b7 	. 
	jp z,0c496h		;023d	ca 96 c4 	. . . 
	ld a,(0caefh)		;0240	3a ef ca 	: . . 
	or a			;0243	b7 	. 
	ld a,000h		;0244	3e 00 	> . 
	call nz,0c3bdh		;0246	c4 bd c3 	. . . 
	ld de,0caach		;0249	11 ac ca 	. . . 
	call 0c3cbh		;024c	cd cb c3 	. . . 
	jp z,0c496h		;024f	ca 96 c4 	. . . 
	ld a,(0cabbh)		;0252	3a bb ca 	: . . 
	dec a			;0255	3d 	= 
	ld (0cacch),a		;0256	32 cc ca 	2 . . 
	ld de,0caach		;0259	11 ac ca 	. . . 
	call 0c3f9h		;025c	cd f9 c3 	. . . 
	jp nz,0c496h		;025f	c2 96 c4 	. . . 
	ld de,0c307h		;0262	11 07 c3 	. . . 
	ld hl,00080h		;0265	21 80 00 	! . . 
	ld b,080h		;0268	06 80 	. . 
	call 0c742h		;026a	cd 42 c7 	. B . 
	ld hl,0cabah		;026d	21 ba ca 	! . . 
	ld (hl),000h		;0270	36 00 	6 . 
	inc hl			;0272	23 	# 
	dec (hl)			;0273	35 	5 
	ld de,0caach		;0274	11 ac ca 	. . . 
	call 0c3dah		;0277	cd da c3 	. . . 
	jp z,0c496h		;027a	ca 96 c4 	. . . 
	ld a,(0caefh)		;027d	3a ef ca 	: . . 
	or a			;0280	b7 	. 
	call nz,0c3bdh		;0281	c4 bd c3 	. . . 
	ld hl,0c308h		;0284	21 08 c3 	! . . 
	call 0c3ach		;0287	cd ac c3 	. . . 
	call 0c4c2h		;028a	cd c2 c4 	. . . 
	jp z,0c4a7h		;028d	ca a7 c4 	. . . 
	call 0c4ddh		;0290	cd dd c4 	. . . 
	jp 0c682h		;0293	c3 82 c6 	. . . 
	call 0c4ddh		;0296	cd dd c4 	. . . 
	call 0c41ah		;0299	cd 1a c4 	. . . 
	ld c,00ah		;029c	0e 0a 	. . 
	ld de,0c306h		;029e	11 06 c3 	. . . 
	call l0003h+2		;02a1	cd 05 00 	. . . 
	call 0c429h		;02a4	cd 29 c4 	. ) . 
	ld hl,0c307h		;02a7	21 07 c3 	! . . 
	ld b,(hl)			;02aa	46 	F 
	inc hl			;02ab	23 	# 
	ld a,b			;02ac	78 	x 
	or a			;02ad	b7 	. 
	jp z,0c4bah		;02ae	ca ba c4 	. . . 
	ld a,(hl)			;02b1	7e 	~ 
	call 0c430h		;02b2	cd 30 c4 	. 0 . 
	ld (hl),a			;02b5	77 	w 
	dec b			;02b6	05 	. 
	jp 0c4abh		;02b7	c3 ab c4 	. . . 
	ld (hl),a			;02ba	77 	w 
	ld hl,0c308h		;02bb	21 08 c3 	! . . 
	ld (0c388h),hl		;02be	22 88 c3 	" . . 
	ret			;02c1	c9 	. 
	ld c,00bh		;02c2	0e 0b 	. . 
	call l0003h+2		;02c4	cd 05 00 	. . . 
	or a			;02c7	b7 	. 
	ret z			;02c8	c8 	. 
	ld c,001h		;02c9	0e 01 	. . 
	call l0003h+2		;02cb	cd 05 00 	. . . 
	or a			;02ce	b7 	. 
	ret			;02cf	c9 	. 
	ld c,019h		;02d0	0e 19 	. . 
	jp l0003h+2		;02d2	c3 05 00 	. . . 
	ld de,00080h		;02d5	11 80 00 	. . . 
	ld c,01ah		;02d8	0e 1a 	. . 
	jp l0003h+2		;02da	c3 05 00 	. . . 
	ld hl,0caabh		;02dd	21 ab ca 	! . . 
	ld a,(hl)			;02e0	7e 	~ 
	or a			;02e1	b7 	. 
	ret z			;02e2	c8 	. 
	ld (hl),000h		;02e3	36 00 	6 . 
	xor a			;02e5	af 	. 
	call 0c3bdh		;02e6	cd bd c3 	. . . 
	ld de,0caach		;02e9	11 ac ca 	. . . 
	call 0c3efh		;02ec	cd ef c3 	. . . 
	ld a,(0caefh)		;02ef	3a ef ca 	: . . 
	jp 0c3bdh		;02f2	c3 bd c3 	. . . 
	ld de,0c628h		;02f5	11 28 c6 	. ( . 
	ld hl,0cb00h		;02f8	21 00 cb 	! . . 
	ld b,006h		;02fb	06 06 	. . 
	ld a,(de)			;02fd	1a 	. 
	cp (hl)			;02fe	be 	. 
	jp nz,0c6cfh		;02ff	c2 cf c6 	. . . 
	inc de			;0302	13 	. 
	inc hl			;0303	23 	# 
	dec b			;0304	05 	. 
	jp nz,0c4fdh		;0305	c2 fd c4 	. . . 
	ret			;0308	c9 	. 
	call 0c398h		;0309	cd 98 c3 	. . . 
	ld hl,(0c38ah)		;030c	2a 8a c3 	* . . 
	ld a,(hl)			;030f	7e 	~ 
	cp 020h		;0310	fe 20 	.   
	jp z,0c522h		;0312	ca 22 c5 	. " . 
	or a			;0315	b7 	. 
	jp z,0c522h		;0316	ca 22 c5 	. " . 
	push hl			;0319	e5 	. 
	call 0c38ch		;031a	cd 8c c3 	. . . 
	pop hl			;031d	e1 	. 
	inc hl			;031e	23 	# 
	jp 0c50fh		;031f	c3 0f c5 	. . . 
	ld a,03fh		;0322	3e 3f 	> ? 
	call 0c38ch		;0324	cd 8c c3 	. . . 
	call 0c398h		;0327	cd 98 c3 	. . . 
	call 0c4ddh		;032a	cd dd c4 	. . . 
	jp 0c682h		;032d	c3 82 c6 	. . . 
	ld a,(de)			;0330	1a 	. 
	or a			;0331	b7 	. 
	ret z			;0332	c8 	. 
	cp 020h		;0333	fe 20 	.   
	jp c,0c509h		;0335	da 09 c5 	. . . 
	ret z			;0338	c8 	. 
	cp 03dh		;0339	fe 3d 	. = 
	ret z			;033b	c8 	. 
	cp 05fh		;033c	fe 5f 	. _ 
	ret z			;033e	c8 	. 
	cp 02eh		;033f	fe 2e 	. . 
	ret z			;0341	c8 	. 
	cp 03ah		;0342	fe 3a 	. : 
	ret z			;0344	c8 	. 
	cp 03bh		;0345	fe 3b 	. ; 
	ret z			;0347	c8 	. 
	cp 03ch		;0348	fe 3c 	. < 
	ret z			;034a	c8 	. 
	cp 03eh		;034b	fe 3e 	. > 
	ret z			;034d	c8 	. 
	ret			;034e	c9 	. 
	ld a,(de)			;034f	1a 	. 
	or a			;0350	b7 	. 
	ret z			;0351	c8 	. 
	cp 020h		;0352	fe 20 	.   
	ret nz			;0354	c0 	. 
	inc de			;0355	13 	. 
	jp 0c54fh		;0356	c3 4f c5 	. O . 
	add a,l			;0359	85 	. 
	ld l,a			;035a	6f 	o 
	ret nc			;035b	d0 	. 
	inc h			;035c	24 	$ 
	ret			;035d	c9 	. 
	ld a,000h		;035e	3e 00 	> . 
	ld hl,0cacdh		;0360	21 cd ca 	! . . 
	call 0c559h		;0363	cd 59 c5 	. Y . 
	push hl			;0366	e5 	. 
	push hl			;0367	e5 	. 
	xor a			;0368	af 	. 
	ld (0caf0h),a		;0369	32 f0 ca 	2 . . 
	ld hl,(0c388h)		;036c	2a 88 c3 	* . . 
	ex de,hl			;036f	eb 	. 
	call 0c54fh		;0370	cd 4f c5 	. O . 
	ex de,hl			;0373	eb 	. 
	ld (0c38ah),hl		;0374	22 8a c3 	" . . 
	ex de,hl			;0377	eb 	. 
	pop hl			;0378	e1 	. 
	ld a,(de)			;0379	1a 	. 
	or a			;037a	b7 	. 
	jp z,0c589h		;037b	ca 89 c5 	. . . 
	sbc a,040h		;037e	de 40 	. @ 
	ld b,a			;0380	47 	G 
	inc de			;0381	13 	. 
	ld a,(de)			;0382	1a 	. 
	cp 03ah		;0383	fe 3a 	. : 
	jp z,0c590h		;0385	ca 90 c5 	. . . 
	dec de			;0388	1b 	. 
	ld a,(0caefh)		;0389	3a ef ca 	: . . 
	ld (hl),a			;038c	77 	w 
	jp 0c596h		;038d	c3 96 c5 	. . . 
	ld a,b			;0390	78 	x 
	ld (0caf0h),a		;0391	32 f0 ca 	2 . . 
	ld (hl),b			;0394	70 	p 
	inc de			;0395	13 	. 
	ld b,008h		;0396	06 08 	. . 
	call 0c530h		;0398	cd 30 c5 	. 0 . 
	jp z,0c5b9h		;039b	ca b9 c5 	. . . 
	inc hl			;039e	23 	# 
	cp 02ah		;039f	fe 2a 	. * 
	jp nz,0c5a9h		;03a1	c2 a9 c5 	. . . 
	ld (hl),03fh		;03a4	36 3f 	6 ? 
	jp 0c5abh		;03a6	c3 ab c5 	. . . 
	ld (hl),a			;03a9	77 	w 
	inc de			;03aa	13 	. 
	dec b			;03ab	05 	. 
	jp nz,0c598h		;03ac	c2 98 c5 	. . . 
	call 0c530h		;03af	cd 30 c5 	. 0 . 
	jp z,0c5c0h		;03b2	ca c0 c5 	. . . 
	inc de			;03b5	13 	. 
	jp 0c5afh		;03b6	c3 af c5 	. . . 
	inc hl			;03b9	23 	# 
	ld (hl),020h		;03ba	36 20 	6   
	dec b			;03bc	05 	. 
	jp nz,0c5b9h		;03bd	c2 b9 c5 	. . . 
	ld b,003h		;03c0	06 03 	. . 
	cp 02eh		;03c2	fe 2e 	. . 
	jp nz,0c5e9h		;03c4	c2 e9 c5 	. . . 
	inc de			;03c7	13 	. 
	call 0c530h		;03c8	cd 30 c5 	. 0 . 
	jp z,0c5e9h		;03cb	ca e9 c5 	. . . 
	inc hl			;03ce	23 	# 
	cp 02ah		;03cf	fe 2a 	. * 
	jp nz,0c5d9h		;03d1	c2 d9 c5 	. . . 
	ld (hl),03fh		;03d4	36 3f 	6 ? 
	jp 0c5dbh		;03d6	c3 db c5 	. . . 
	ld (hl),a			;03d9	77 	w 
	inc de			;03da	13 	. 
	dec b			;03db	05 	. 
	jp nz,0c5c8h		;03dc	c2 c8 c5 	. . . 
	call 0c530h		;03df	cd 30 c5 	. 0 . 
	jp z,0c5f0h		;03e2	ca f0 c5 	. . . 
	inc de			;03e5	13 	. 
	jp 0c5dfh		;03e6	c3 df c5 	. . . 
	inc hl			;03e9	23 	# 
	ld (hl),020h		;03ea	36 20 	6   
	dec b			;03ec	05 	. 
	jp nz,0c5e9h		;03ed	c2 e9 c5 	. . . 
	ld b,003h		;03f0	06 03 	. . 
	inc hl			;03f2	23 	# 
	ld (hl),000h		;03f3	36 00 	6 . 
	dec b			;03f5	05 	. 
	jp nz,0c5f2h		;03f6	c2 f2 c5 	. . . 
	ex de,hl			;03f9	eb 	. 
	ld (0c388h),hl		;03fa	22 88 c3 	" . . 
	pop hl			;03fd	e1 	. 
	ld bc,l000bh		;03fe	01 0b 00 	. . . 
	inc hl			;0401	23 	# 
	ld a,(hl)			;0402	7e 	~ 
	cp 03fh		;0403	fe 3f 	. ? 
	jp nz,0c609h		;0405	c2 09 c6 	. . . 
	inc b			;0408	04 	. 
	dec c			;0409	0d 	. 
	jp nz,0c601h		;040a	c2 01 c6 	. . . 
	ld a,b			;040d	78 	x 
	or a			;040e	b7 	. 
	ret			;040f	c9 	. 
	ld b,h			;0410	44 	D 
	ld c,c			;0411	49 	I 
	ld d,d			;0412	52 	R 
	jr nz,71		;0413	20 45 	  E 
	ld d,d			;0415	52 	R 
	ld b,c			;0416	41 	A 
	jr nz,86		;0417	20 54 	  T 
	ld e,c			;0419	59 	Y 
	ld d,b			;041a	50 	P 
	ld b,l			;041b	45 	E 
	ld d,e			;041c	53 	S 
	ld b,c			;041d	41 	A 
	ld d,(hl)			;041e	56 	V 
	ld b,l			;041f	45 	E 
	ld d,d			;0420	52 	R 
	ld b,l			;0421	45 	E 
	ld c,(hl)			;0422	4e 	N 
	jr nz,87		;0423	20 55 	  U 
	ld d,e			;0425	53 	S 
	ld b,l			;0426	45 	E 
	ld d,d			;0427	52 	R 
	cp 016h		;0428	fe 16 	. . 
	nop			;042a	00 	. 
	nop			;042b	00 	. 
	sub (hl)			;042c	96 	. 
	ld b,h			;042d	44 	D 
	ld hl,0c610h		;042e	21 10 c6 	! . . 
	ld c,000h		;0431	0e 00 	. . 
	ld a,c			;0433	79 	y 
	cp 006h		;0434	fe 06 	. . 
	ret nc			;0436	d0 	. 
	ld de,0caceh		;0437	11 ce ca 	. . . 
	ld b,004h		;043a	06 04 	. . 
	ld a,(de)			;043c	1a 	. 
	cp (hl)			;043d	be 	. 
	jp nz,0c64fh		;043e	c2 4f c6 	. O . 
	inc de			;0441	13 	. 
	inc hl			;0442	23 	# 
	dec b			;0443	05 	. 
	jp nz,0c63ch		;0444	c2 3c c6 	. < . 
	ld a,(de)			;0447	1a 	. 
	cp 020h		;0448	fe 20 	.   
	jp nz,0c654h		;044a	c2 54 c6 	. T . 
	ld a,c			;044d	79 	y 
	ret			;044e	c9 	. 
	inc hl			;044f	23 	# 
	dec b			;0450	05 	. 
	jp nz,0c64fh		;0451	c2 4f c6 	. O . 
	inc c			;0454	0c 	. 
	jp 0c633h		;0455	c3 33 c6 	. 3 . 
	xor a			;0458	af 	. 
	ld (0c307h),a		;0459	32 07 c3 	2 . . 
	ld sp,0caabh		;045c	31 ab ca 	1 . . 
	push bc			;045f	c5 	. 
	ld a,c			;0460	79 	y 
	rra			;0461	1f 	. 
	rra			;0462	1f 	. 
	rra			;0463	1f 	. 
	rra			;0464	1f 	. 
	and 00fh		;0465	e6 0f 	. . 
	ld e,a			;0467	5f 	_ 
	call 0c415h		;0468	cd 15 c4 	. . . 
	call 0c3b8h		;046b	cd b8 c3 	. . . 
	ld (0caabh),a		;046e	32 ab ca 	2 . . 
	pop bc			;0471	c1 	. 
	ld a,c			;0472	79 	y 
	and 00fh		;0473	e6 0f 	. . 
	ld (0caefh),a		;0475	32 ef ca 	2 . . 
	call 0c3bdh		;0478	cd bd c3 	. . . 
	ld a,(0c307h)		;047b	3a 07 c3 	: . . 
	or a			;047e	b7 	. 
	jp nz,0c698h		;047f	c2 98 c6 	. . . 
	ld sp,0caabh		;0482	31 ab ca 	1 . . 
	call 0c398h		;0485	cd 98 c3 	. . . 
	call 0c4d0h		;0488	cd d0 c4 	. . . 
	add a,041h		;048b	c6 41 	. A 
	call 0c38ch		;048d	cd 8c c3 	. . . 
	ld a,03eh		;0490	3e 3e 	> > 
	call 0c38ch		;0492	cd 8c c3 	. . . 
	call 0c439h		;0495	cd 39 c4 	. 9 . 
	ld de,00080h		;0498	11 80 00 	. . . 
	call 0c4d8h		;049b	cd d8 c4 	. . . 
	call 0c4d0h		;049e	cd d0 c4 	. . . 
	ld (0caefh),a		;04a1	32 ef ca 	2 . . 
	call 0c55eh		;04a4	cd 5e c5 	. ^ . 
	call nz,0c509h		;04a7	c4 09 c5 	. . . 
	ld a,(0caf0h)		;04aa	3a f0 ca 	: . . 
	or a			;04ad	b7 	. 
	jp nz,0c9a5h		;04ae	c2 a5 c9 	. . . 
	call 0c62eh		;04b1	cd 2e c6 	. . . 
	ld hl,0c6c1h		;04b4	21 c1 c6 	! . . 
	ld e,a			;04b7	5f 	_ 
	ld d,000h		;04b8	16 00 	. . 
	add hl,de			;04ba	19 	. 
	add hl,de			;04bb	19 	. 
	ld a,(hl)			;04bc	7e 	~ 
	inc hl			;04bd	23 	# 
	ld h,(hl)			;04be	66 	f 
	ld l,a			;04bf	6f 	o 
	jp (hl)			;04c0	e9 	. 
	ld (hl),a			;04c1	77 	w 
	rst 0			;04c2	c7 	. 
	rra			;04c3	1f 	. 
	ret z			;04c4	c8 	. 
	ld e,l			;04c5	5d 	] 
	ret z			;04c6	c8 	. 
	xor l			;04c7	ad 	. 
	ret z			;04c8	c8 	. 
	djnz -53		;04c9	10 c9 	. . 
	adc a,(hl)			;04cb	8e 	. 
	ret			;04cc	c9 	. 
	and l			;04cd	a5 	. 
	ret			;04ce	c9 	. 
	ld hl,076f3h		;04cf	21 f3 76 	! . v 
	ld (0c300h),hl		;04d2	22 00 c3 	" . . 
	ld hl,0c300h		;04d5	21 00 c3 	! . . 
	jp (hl)			;04d8	e9 	. 
	ld bc,0c6dfh		;04d9	01 df c6 	. . . 
	jp 0c3a7h		;04dc	c3 a7 c3 	. . . 
	ld d,d			;04df	52 	R 
	ld b,l			;04e0	45 	E 
	ld b,c			;04e1	41 	A 
	ld b,h			;04e2	44 	D 
	jr nz,l052ah		;04e3	20 45 	  E 
	ld d,d			;04e5	52 	R 
	ld d,d			;04e6	52 	R 
	ld c,a			;04e7	4f 	O 
	ld d,d			;04e8	52 	R 
	nop			;04e9	00 	. 
	ld bc,0c6f0h		;04ea	01 f0 c6 	. . . 
	jp 0c3a7h		;04ed	c3 a7 c3 	. . . 
	ld c,(hl)			;04f0	4e 	N 
	ld c,a			;04f1	4f 	O 
	jr nz,l053ah		;04f2	20 46 	  F 
	ld c,c			;04f4	49 	I 
	ld c,h			;04f5	4c 	L 
	ld b,l			;04f6	45 	E 
	nop			;04f7	00 	. 
	call 0c55eh		;04f8	cd 5e c5 	. ^ . 
	ld a,(0caf0h)		;04fb	3a f0 ca 	: . . 
	or a			;04fe	b7 	. 
	jp nz,0c509h		;04ff	c2 09 c5 	. . . 
	ld hl,0caceh		;0502	21 ce ca 	! . . 
	ld bc,l000bh		;0505	01 0b 00 	. . . 
	ld a,(hl)			;0508	7e 	~ 
	cp 020h		;0509	fe 20 	.   
	jp z,0c733h		;050b	ca 33 c7 	. 3 . 
	inc hl			;050e	23 	# 
	sub 030h		;050f	d6 30 	. 0 
	cp 00ah		;0511	fe 0a 	. . 
	jp nc,0c509h		;0513	d2 09 c5 	. . . 
	ld d,a			;0516	57 	W 
	ld a,b			;0517	78 	x 
	and 0e0h		;0518	e6 e0 	. . 
	jp nz,0c509h		;051a	c2 09 c5 	. . . 
	ld a,b			;051d	78 	x 
	rlca			;051e	07 	. 
	rlca			;051f	07 	. 
	rlca			;0520	07 	. 
	add a,b			;0521	80 	. 
	jp c,0c509h		;0522	da 09 c5 	. . . 
	add a,b			;0525	80 	. 
	jp c,0c509h		;0526	da 09 c5 	. . . 
	add a,d			;0529	82 	. 
l052ah:
	jp c,0c509h		;052a	da 09 c5 	. . . 
	ld b,a			;052d	47 	G 
	dec c			;052e	0d 	. 
	jp nz,0c708h		;052f	c2 08 c7 	. . . 
	ret			;0532	c9 	. 
	ld a,(hl)			;0533	7e 	~ 
	cp 020h		;0534	fe 20 	.   
	jp nz,0c509h		;0536	c2 09 c5 	. . . 
	inc hl			;0539	23 	# 
l053ah:
	dec c			;053a	0d 	. 
	jp nz,0c733h		;053b	c2 33 c7 	. 3 . 
	ld a,b			;053e	78 	x 
	ret			;053f	c9 	. 
	ld b,003h		;0540	06 03 	. . 
	ld a,(hl)			;0542	7e 	~ 
	ld (de),a			;0543	12 	. 
	inc hl			;0544	23 	# 
	inc de			;0545	13 	. 
	dec b			;0546	05 	. 
	jp nz,0c742h		;0547	c2 42 c7 	. B . 
	ret			;054a	c9 	. 
	ld hl,00080h		;054b	21 80 00 	! . . 
	add a,c			;054e	81 	. 
	call 0c559h		;054f	cd 59 c5 	. Y . 
	ld a,(hl)			;0552	7e 	~ 
	ret			;0553	c9 	. 
	xor a			;0554	af 	. 
	ld (0cacdh),a		;0555	32 cd ca 	2 . . 
	ld a,(0caf0h)		;0558	3a f0 ca 	: . . 
	or a			;055b	b7 	. 
	ret z			;055c	c8 	. 
	dec a			;055d	3d 	= 
	ld hl,0caefh		;055e	21 ef ca 	! . . 
	cp (hl)			;0561	be 	. 
	ret z			;0562	c8 	. 
	jp 0c3bdh		;0563	c3 bd c3 	. . . 
	ld a,(0caf0h)		;0566	3a f0 ca 	: . . 
	or a			;0569	b7 	. 
	ret z			;056a	c8 	. 
	dec a			;056b	3d 	= 
	ld hl,0caefh		;056c	21 ef ca 	! . . 
	cp (hl)			;056f	be 	. 
	ret z			;0570	c8 	. 
	ld a,(0caefh)		;0571	3a ef ca 	: . . 
	jp 0c3bdh		;0574	c3 bd c3 	. . . 
	call 0c55eh		;0577	cd 5e c5 	. ^ . 
	call 0c754h		;057a	cd 54 c7 	. T . 
	ld hl,0caceh		;057d	21 ce ca 	! . . 
	ld a,(hl)			;0580	7e 	~ 
	cp 020h		;0581	fe 20 	.   
	jp nz,0c78fh		;0583	c2 8f c7 	. . . 
	ld b,00bh		;0586	06 0b 	. . 
	ld (hl),03fh		;0588	36 3f 	6 ? 
	inc hl			;058a	23 	# 
	dec b			;058b	05 	. 
	jp nz,0c788h		;058c	c2 88 c7 	. . . 
	ld e,000h		;058f	1e 00 	. . 
	push de			;0591	d5 	. 
	call 0c3e9h		;0592	cd e9 c3 	. . . 
	call z,0c6eah		;0595	cc ea c6 	. . . 
	jp z,0c81bh		;0598	ca 1b c8 	. . . 
	ld a,(0caeeh)		;059b	3a ee ca 	: . . 
	rrca			;059e	0f 	. 
	rrca			;059f	0f 	. 
	rrca			;05a0	0f 	. 
	and 060h		;05a1	e6 60 	. ` 
	ld c,a			;05a3	4f 	O 
	ld a,00ah		;05a4	3e 0a 	> . 
	call 0c74bh		;05a6	cd 4b c7 	. K . 
	rla			;05a9	17 	. 
	jp c,0c80fh		;05aa	da 0f c8 	. . . 
	pop de			;05ad	d1 	. 
	ld a,e			;05ae	7b 	{ 
	inc e			;05af	1c 	. 
	push de			;05b0	d5 	. 
	and 003h		;05b1	e6 03 	. . 
	push af			;05b3	f5 	. 
	jp nz,0c7cch		;05b4	c2 cc c7 	. . . 
	call 0c398h		;05b7	cd 98 c3 	. . . 
	push bc			;05ba	c5 	. 
	call 0c4d0h		;05bb	cd d0 c4 	. . . 
	pop bc			;05be	c1 	. 
	add a,041h		;05bf	c6 41 	. A 
	call 0c392h		;05c1	cd 92 c3 	. . . 
	ld a,03ah		;05c4	3e 3a 	> : 
	call 0c392h		;05c6	cd 92 c3 	. . . 
	jp 0c7d4h		;05c9	c3 d4 c7 	. . . 
	call 0c3a2h		;05cc	cd a2 c3 	. . . 
	ld a,03ah		;05cf	3e 3a 	> : 
	call 0c392h		;05d1	cd 92 c3 	. . . 
	call 0c3a2h		;05d4	cd a2 c3 	. . . 
	ld b,001h		;05d7	06 01 	. . 
	ld a,b			;05d9	78 	x 
	call 0c74bh		;05da	cd 4b c7 	. K . 
	and 07fh		;05dd	e6 7f 	.  
	cp 020h		;05df	fe 20 	.   
	jp nz,0c7f9h		;05e1	c2 f9 c7 	. . . 
	pop af			;05e4	f1 	. 
	push af			;05e5	f5 	. 
	cp 003h		;05e6	fe 03 	. . 
	jp nz,0c7f7h		;05e8	c2 f7 c7 	. . . 
	ld a,009h		;05eb	3e 09 	> . 
	call 0c74bh		;05ed	cd 4b c7 	. K . 
	and 07fh		;05f0	e6 7f 	.  
	cp 020h		;05f2	fe 20 	.   
	jp z,0c80eh		;05f4	ca 0e c8 	. . . 
	ld a,020h		;05f7	3e 20 	>   
	call 0c392h		;05f9	cd 92 c3 	. . . 
	inc b			;05fc	04 	. 
	ld a,b			;05fd	78 	x 
	cp 00ch		;05fe	fe 0c 	. . 
	jp nc,0c80eh		;0600	d2 0e c8 	. . . 
	cp 009h		;0603	fe 09 	. . 
	jp nz,0c7d9h		;0605	c2 d9 c7 	. . . 
	call 0c3a2h		;0608	cd a2 c3 	. . . 
	jp 0c7d9h		;060b	c3 d9 c7 	. . . 
	pop af			;060e	f1 	. 
	call 0c4c2h		;060f	cd c2 c4 	. . . 
	jp nz,0c81bh		;0612	c2 1b c8 	. . . 
	call 0c3e4h		;0615	cd e4 c3 	. . . 
	jp 0c798h		;0618	c3 98 c7 	. . . 
	pop de			;061b	d1 	. 
	jp 0ca86h		;061c	c3 86 ca 	. . . 
	call 0c55eh		;061f	cd 5e c5 	. ^ . 
	cp 00bh		;0622	fe 0b 	. . 
	jp nz,0c842h		;0624	c2 42 c8 	. B . 
	ld bc,0c852h		;0627	01 52 c8 	. R . 
	call 0c3a7h		;062a	cd a7 c3 	. . . 
	call 0c439h		;062d	cd 39 c4 	. 9 . 
	ld hl,0c307h		;0630	21 07 c3 	! . . 
	dec (hl)			;0633	35 	5 
	jp nz,0c682h		;0634	c2 82 c6 	. . . 
	inc hl			;0637	23 	# 
	ld a,(hl)			;0638	7e 	~ 
	cp 059h		;0639	fe 59 	. Y 
	jp nz,0c682h		;063b	c2 82 c6 	. . . 
	inc hl			;063e	23 	# 
	ld (0c388h),hl		;063f	22 88 c3 	" . . 
	call 0c754h		;0642	cd 54 c7 	. T . 
	ld de,0cacdh		;0645	11 cd ca 	. . . 
	call 0c3efh		;0648	cd ef c3 	. . . 
	inc a			;064b	3c 	< 
	call z,0c6eah		;064c	cc ea c6 	. . . 
	jp 0ca86h		;064f	c3 86 ca 	. . . 
	ld b,c			;0652	41 	A 
	ld c,h			;0653	4c 	L 
	ld c,h			;0654	4c 	L 
	jr nz,42		;0655	20 28 	  ( 
	ld e,c			;0657	59 	Y 
	cpl			;0658	2f 	/ 
	ld c,(hl)			;0659	4e 	N 
	add hl,hl			;065a	29 	) 
	ccf			;065b	3f 	? 
	nop			;065c	00 	. 
	call 0c55eh		;065d	cd 5e c5 	. ^ . 
	jp nz,0c509h		;0660	c2 09 c5 	. . . 
	call 0c754h		;0663	cd 54 c7 	. T . 
	call 0c3d0h		;0666	cd d0 c3 	. . . 
	jp z,0c8a7h		;0669	ca a7 c8 	. . . 
	call 0c398h		;066c	cd 98 c3 	. . . 
	ld hl,0caf1h		;066f	21 f1 ca 	! . . 
	ld (hl),0ffh		;0672	36 ff 	6 . 
	ld hl,0caf1h		;0674	21 f1 ca 	! . . 
	ld a,(hl)			;0677	7e 	~ 
	cp 080h		;0678	fe 80 	. . 
	jp c,0c887h		;067a	da 87 c8 	. . . 
	push hl			;067d	e5 	. 
	call 0c3feh		;067e	cd fe c3 	. . . 
	pop hl			;0681	e1 	. 
	jp nz,0c8a0h		;0682	c2 a0 c8 	. . . 
	xor a			;0685	af 	. 
	ld (hl),a			;0686	77 	w 
	inc (hl)			;0687	34 	4 
	ld hl,00080h		;0688	21 80 00 	! . . 
	call 0c559h		;068b	cd 59 c5 	. Y . 
	ld a,(hl)			;068e	7e 	~ 
	cp 01ah		;068f	fe 1a 	. . 
	jp z,0ca86h		;0691	ca 86 ca 	. . . 
	call 0c38ch		;0694	cd 8c c3 	. . . 
	call 0c4c2h		;0697	cd c2 c4 	. . . 
	jp nz,0ca86h		;069a	c2 86 ca 	. . . 
	jp 0c874h		;069d	c3 74 c8 	. t . 
	dec a			;06a0	3d 	= 
	jp z,0ca86h		;06a1	ca 86 ca 	. . . 
	call 0c6d9h		;06a4	cd d9 c6 	. . . 
	call 0c766h		;06a7	cd 66 c7 	. f . 
	jp 0c509h		;06aa	c3 09 c5 	. . . 
	call 0c6f8h		;06ad	cd f8 c6 	. . . 
	push af			;06b0	f5 	. 
	call 0c55eh		;06b1	cd 5e c5 	. ^ . 
	jp nz,0c509h		;06b4	c2 09 c5 	. . . 
	call 0c754h		;06b7	cd 54 c7 	. T . 
	ld de,0cacdh		;06ba	11 cd ca 	. . . 
	push de			;06bd	d5 	. 
	call 0c3efh		;06be	cd ef c3 	. . . 
	pop de			;06c1	d1 	. 
	call 0c409h		;06c2	cd 09 c4 	. . . 
	jp z,0c8fbh		;06c5	ca fb c8 	. . . 
	xor a			;06c8	af 	. 
	ld (0caedh),a		;06c9	32 ed ca 	2 . . 
	pop af			;06cc	f1 	. 
	ld l,a			;06cd	6f 	o 
	ld h,000h		;06ce	26 00 	& . 
	add hl,hl			;06d0	29 	) 
	ld de,l0100h		;06d1	11 00 01 	. . . 
	ld a,h			;06d4	7c 	| 
	or l			;06d5	b5 	. 
	jp z,0c8f1h		;06d6	ca f1 c8 	. . . 
	dec hl			;06d9	2b 	+ 
	push hl			;06da	e5 	. 
	ld hl,00080h		;06db	21 80 00 	! . . 
	add hl,de			;06de	19 	. 
	push hl			;06df	e5 	. 
	call 0c4d8h		;06e0	cd d8 c4 	. . . 
	ld de,0cacdh		;06e3	11 cd ca 	. . . 
	call 0c404h		;06e6	cd 04 c4 	. . . 
	pop de			;06e9	d1 	. 
	pop hl			;06ea	e1 	. 
	jp nz,0c8fbh		;06eb	c2 fb c8 	. . . 
	jp 0c8d4h		;06ee	c3 d4 c8 	. . . 
	ld de,0cacdh		;06f1	11 cd ca 	. . . 
	call 0c3dah		;06f4	cd da c3 	. . . 
	inc a			;06f7	3c 	< 
	jp nz,0c901h		;06f8	c2 01 c9 	. . . 
	ld bc,0c907h		;06fb	01 07 c9 	. . . 
	call 0c3a7h		;06fe	cd a7 c3 	. . . 
	call 0c4d5h		;0701	cd d5 c4 	. . . 
	jp 0ca86h		;0704	c3 86 ca 	. . . 
	ld c,(hl)			;0707	4e 	N 
	ld c,a			;0708	4f 	O 
	jr nz,l075eh		;0709	20 53 	  S 
	ld d,b			;070b	50 	P 
	ld b,c			;070c	41 	A 
	ld b,e			;070d	43 	C 
	ld b,l			;070e	45 	E 
	nop			;070f	00 	. 
	call 0c55eh		;0710	cd 5e c5 	. ^ . 
	jp nz,0c509h		;0713	c2 09 c5 	. . . 
	ld a,(0caf0h)		;0716	3a f0 ca 	: . . 
	push af			;0719	f5 	. 
	call 0c754h		;071a	cd 54 c7 	. T . 
	call 0c3e9h		;071d	cd e9 c3 	. . . 
	jp nz,0c979h		;0720	c2 79 c9 	. y . 
	ld hl,0cacdh		;0723	21 cd ca 	! . . 
	ld de,0caddh		;0726	11 dd ca 	. . . 
	ld b,010h		;0729	06 10 	. . 
	call 0c742h		;072b	cd 42 c7 	. B . 
	ld hl,(0c388h)		;072e	2a 88 c3 	* . . 
	ex de,hl			;0731	eb 	. 
	call 0c54fh		;0732	cd 4f c5 	. O . 
	cp 03dh		;0735	fe 3d 	. = 
	jp z,0c93fh		;0737	ca 3f c9 	. ? . 
	cp 05fh		;073a	fe 5f 	. _ 
	jp nz,0c973h		;073c	c2 73 c9 	. s . 
	ex de,hl			;073f	eb 	. 
	inc hl			;0740	23 	# 
	ld (0c388h),hl		;0741	22 88 c3 	" . . 
	call 0c55eh		;0744	cd 5e c5 	. ^ . 
	jp nz,0c973h		;0747	c2 73 c9 	. s . 
	pop af			;074a	f1 	. 
	ld b,a			;074b	47 	G 
	ld hl,0caf0h		;074c	21 f0 ca 	! . . 
	ld a,(hl)			;074f	7e 	~ 
	or a			;0750	b7 	. 
	jp z,0c959h		;0751	ca 59 c9 	. Y . 
	cp b			;0754	b8 	. 
	ld (hl),b			;0755	70 	p 
	jp nz,0c973h		;0756	c2 73 c9 	. s . 
	ld (hl),b			;0759	70 	p 
	xor a			;075a	af 	. 
	ld (0cacdh),a		;075b	32 cd ca 	2 . . 
l075eh:
	call 0c3e9h		;075e	cd e9 c3 	. . . 
	jp z,0c96dh		;0761	ca 6d c9 	. m . 
	ld de,0cacdh		;0764	11 cd ca 	. . . 
	call 0c40eh		;0767	cd 0e c4 	. . . 
	jp 0ca86h		;076a	c3 86 ca 	. . . 
	call 0c6eah		;076d	cd ea c6 	. . . 
	jp 0ca86h		;0770	c3 86 ca 	. . . 
	call 0c766h		;0773	cd 66 c7 	. f . 
	jp 0c509h		;0776	c3 09 c5 	. . . 
	ld bc,0c982h		;0779	01 82 c9 	. . . 
	call 0c3a7h		;077c	cd a7 c3 	. . . 
	jp 0ca86h		;077f	c3 86 ca 	. . . 
	ld b,(hl)			;0782	46 	F 
	ld c,c			;0783	49 	I 
	ld c,h			;0784	4c 	L 
	ld b,l			;0785	45 	E 
	jr nz,l07cdh		;0786	20 45 	  E 
	ld e,b			;0788	58 	X 
	ld c,c			;0789	49 	I 
	ld d,e			;078a	53 	S 
	ld d,h			;078b	54 	T 
	ld d,e			;078c	53 	S 
	nop			;078d	00 	. 
	call 0c6f8h		;078e	cd f8 c6 	. . . 
	cp 010h		;0791	fe 10 	. . 
	jp nc,0c509h		;0793	d2 09 c5 	. . . 
	ld e,a			;0796	5f 	_ 
	ld a,(0caceh)		;0797	3a ce ca 	: . . 
	cp 020h		;079a	fe 20 	.   
	jp z,0c509h		;079c	ca 09 c5 	. . . 
	call 0c415h		;079f	cd 15 c4 	. . . 
	jp 0ca89h		;07a2	c3 89 ca 	. . . 
	call 0c4f5h		;07a5	cd f5 c4 	. . . 
	ld a,(0caceh)		;07a8	3a ce ca 	: . . 
	cp 020h		;07ab	fe 20 	.   
	jp nz,0c9c4h		;07ad	c2 c4 c9 	. . . 
	ld a,(0caf0h)		;07b0	3a f0 ca 	: . . 
	or a			;07b3	b7 	. 
	jp z,0ca89h		;07b4	ca 89 ca 	. . . 
	dec a			;07b7	3d 	= 
	ld (0caefh),a		;07b8	32 ef ca 	2 . . 
	call 0c429h		;07bb	cd 29 c4 	. ) . 
	call 0c3bdh		;07be	cd bd c3 	. . . 
	jp 0ca89h		;07c1	c3 89 ca 	. . . 
	ld de,0cad6h		;07c4	11 d6 ca 	. . . 
	ld a,(de)			;07c7	1a 	. 
	cp 020h		;07c8	fe 20 	.   
	jp nz,0c509h		;07ca	c2 09 c5 	. . . 
l07cdh:
	push de			;07cd	d5 	. 
	call 0c754h		;07ce	cd 54 c7 	. T . 
	pop de			;07d1	d1 	. 
	ld hl,0ca83h		;07d2	21 83 ca 	! . . 
	call 0c740h		;07d5	cd 40 c7 	. @ . 
	call 0c3d0h		;07d8	cd d0 c3 	. . . 
	jp z,0ca6bh		;07db	ca 6b ca 	. k . 
	ld hl,l0100h		;07de	21 00 01 	! . . 
	push hl			;07e1	e5 	. 
	ex de,hl			;07e2	eb 	. 
	call 0c4d8h		;07e3	cd d8 c4 	. . . 
	ld de,0cacdh		;07e6	11 cd ca 	. . . 
	call 0c3f9h		;07e9	cd f9 c3 	. . . 
	jp nz,0ca01h		;07ec	c2 01 ca 	. . . 
	pop hl			;07ef	e1 	. 
	ld de,00080h		;07f0	11 80 00 	. . . 
	add hl,de			;07f3	19 	. 
	ld de,0c300h		;07f4	11 00 c3 	. . . 
	ld a,l			;07f7	7d 	} 
	sub e			;07f8	93 	. 
	ld a,h			;07f9	7c 	| 
	sbc a,d			;07fa	9a 	. 
	jp nc,0ca71h		;07fb	d2 71 ca 	. q . 
	jp 0c9e1h		;07fe	c3 e1 c9 	. . . 
	pop hl			;0801	e1 	. 
	dec a			;0802	3d 	= 
	jp nz,0ca71h		;0803	c2 71 ca 	. q . 
	call 0c766h		;0806	cd 66 c7 	. f . 
	call 0c55eh		;0809	cd 5e c5 	. ^ . 
	ld hl,0caf0h		;080c	21 f0 ca 	! . . 
	push hl			;080f	e5 	. 
	ld a,(hl)			;0810	7e 	~ 
	ld (0cacdh),a		;0811	32 cd ca 	2 . . 
	ld a,010h		;0814	3e 10 	> . 
	call 0c560h		;0816	cd 60 c5 	. ` . 
	pop hl			;0819	e1 	. 
	ld a,(hl)			;081a	7e 	~ 
	ld (0caddh),a		;081b	32 dd ca 	2 . . 
	xor a			;081e	af 	. 
	ld (0caedh),a		;081f	32 ed ca 	2 . . 
	ld de,l005ch		;0822	11 5c 00 	. \ . 
	ld hl,0cacdh		;0825	21 cd ca 	! . . 
	ld b,021h		;0828	06 21 	. ! 
	call 0c742h		;082a	cd 42 c7 	. B . 
	ld hl,0c308h		;082d	21 08 c3 	! . . 
	ld a,(hl)			;0830	7e 	~ 
	or a			;0831	b7 	. 
	jp z,0ca3eh		;0832	ca 3e ca 	. > . 
	cp 020h		;0835	fe 20 	.   
	jp z,0ca3eh		;0837	ca 3e ca 	. > . 
	inc hl			;083a	23 	# 
	jp 0ca30h		;083b	c3 30 ca 	. 0 . 
	ld b,000h		;083e	06 00 	. . 
	ld de,00081h		;0840	11 81 00 	. . . 
	ld a,(hl)			;0843	7e 	~ 
	ld (de),a			;0844	12 	. 
	or a			;0845	b7 	. 
	jp z,0ca4fh		;0846	ca 4f ca 	. O . 
	inc b			;0849	04 	. 
	inc hl			;084a	23 	# 
	inc de			;084b	13 	. 
	jp 0ca43h		;084c	c3 43 ca 	. C . 
	ld a,b			;084f	78 	x 
	ld (00080h),a		;0850	32 80 00 	2 . . 
	call 0c398h		;0853	cd 98 c3 	. . . 
	call 0c4d5h		;0856	cd d5 c4 	. . . 
	call 0c41ah		;0859	cd 1a c4 	. . . 
	call l0100h		;085c	cd 00 01 	. . . 
	ld sp,0caabh		;085f	31 ab ca 	1 . . 
	call 0c429h		;0862	cd 29 c4 	. ) . 
	call 0c3bdh		;0865	cd bd c3 	. . . 
	jp 0c682h		;0868	c3 82 c6 	. . . 
	call 0c766h		;086b	cd 66 c7 	. f . 
	jp 0c509h		;086e	c3 09 c5 	. . . 
	ld bc,0ca7ah		;0871	01 7a ca 	. z . 
	call 0c3a7h		;0874	cd a7 c3 	. . . 
	jp 0ca86h		;0877	c3 86 ca 	. . . 
	ld b,d			;087a	42 	B 
	ld b,c			;087b	41 	A 
	ld b,h			;087c	44 	D 
	jr nz,l08cbh		;087d	20 4c 	  L 
	ld c,a			;087f	4f 	O 
	ld b,c			;0880	41 	A 
	ld b,h			;0881	44 	D 
	nop			;0882	00 	. 
	ld b,e			;0883	43 	C 
	ld c,a			;0884	4f 	O 
	ld c,l			;0885	4d 	M 
	call 0c766h		;0886	cd 66 c7 	. f . 
	call 0c55eh		;0889	cd 5e c5 	. ^ . 
	ld a,(0caceh)		;088c	3a ce ca 	: . . 
	sub 020h		;088f	d6 20 	.   
	ld hl,0caf0h		;0891	21 f0 ca 	! . . 
	or (hl)			;0894	b6 	. 
	jp nz,0c509h		;0895	c2 09 c5 	. . . 
	jp 0c682h		;0898	c3 82 c6 	. . . 
	nop			;089b	00 	. 
	nop			;089c	00 	. 
	nop			;089d	00 	. 
	nop			;089e	00 	. 
	nop			;089f	00 	. 
	nop			;08a0	00 	. 
	nop			;08a1	00 	. 
	nop			;08a2	00 	. 
	nop			;08a3	00 	. 
	nop			;08a4	00 	. 
	nop			;08a5	00 	. 
	nop			;08a6	00 	. 
	nop			;08a7	00 	. 
	nop			;08a8	00 	. 
	nop			;08a9	00 	. 
	nop			;08aa	00 	. 
	nop			;08ab	00 	. 
	nop			;08ac	00 	. 
	inc h			;08ad	24 	$ 
	inc h			;08ae	24 	$ 
	inc h			;08af	24 	$ 
	jr nz,l08d2h		;08b0	20 20 	    
	jr nz,l08d4h		;08b2	20 20 	    
	jr nz,l0909h		;08b4	20 53 	  S 
	ld d,l			;08b6	55 	U 
	ld b,d			;08b7	42 	B 
	nop			;08b8	00 	. 
	nop			;08b9	00 	. 
	nop			;08ba	00 	. 
	nop			;08bb	00 	. 
	nop			;08bc	00 	. 
	nop			;08bd	00 	. 
	nop			;08be	00 	. 
	nop			;08bf	00 	. 
	nop			;08c0	00 	. 
	nop			;08c1	00 	. 
	nop			;08c2	00 	. 
	nop			;08c3	00 	. 
	nop			;08c4	00 	. 
	nop			;08c5	00 	. 
	nop			;08c6	00 	. 
	nop			;08c7	00 	. 
	nop			;08c8	00 	. 
	nop			;08c9	00 	. 
	nop			;08ca	00 	. 
l08cbh:
	nop			;08cb	00 	. 
	nop			;08cc	00 	. 
	nop			;08cd	00 	. 
	nop			;08ce	00 	. 
	nop			;08cf	00 	. 
	nop			;08d0	00 	. 
	nop			;08d1	00 	. 
l08d2h:
	nop			;08d2	00 	. 
	nop			;08d3	00 	. 
l08d4h:
	nop			;08d4	00 	. 
	nop			;08d5	00 	. 
	nop			;08d6	00 	. 
	nop			;08d7	00 	. 
	nop			;08d8	00 	. 
	nop			;08d9	00 	. 
	nop			;08da	00 	. 
	nop			;08db	00 	. 
	nop			;08dc	00 	. 
	nop			;08dd	00 	. 
	nop			;08de	00 	. 
	nop			;08df	00 	. 
	nop			;08e0	00 	. 
	nop			;08e1	00 	. 
	nop			;08e2	00 	. 
	nop			;08e3	00 	. 
	nop			;08e4	00 	. 
	nop			;08e5	00 	. 
	nop			;08e6	00 	. 
	nop			;08e7	00 	. 
	nop			;08e8	00 	. 
	nop			;08e9	00 	. 
	nop			;08ea	00 	. 
	nop			;08eb	00 	. 
	nop			;08ec	00 	. 
	nop			;08ed	00 	. 
	nop			;08ee	00 	. 
	nop			;08ef	00 	. 
	nop			;08f0	00 	. 
	nop			;08f1	00 	. 
	nop			;08f2	00 	. 
	nop			;08f3	00 	. 
	nop			;08f4	00 	. 
	nop			;08f5	00 	. 
	nop			;08f6	00 	. 
	nop			;08f7	00 	. 
	nop			;08f8	00 	. 
	nop			;08f9	00 	. 
	nop			;08fa	00 	. 
	nop			;08fb	00 	. 
	nop			;08fc	00 	. 
	nop			;08fd	00 	. 
	nop			;08fe	00 	. 
	nop			;08ff	00 	. 
	cp 016h		;0900	fe 16 	. . 
	nop			;0902	00 	. 
	nop			;0903	00 	. 
	sub (hl)			;0904	96 	. 
	ld b,h			;0905	44 	D 
	jp 0cb11h		;0906	c3 11 cb 	. . . 
l0909h:
	sbc a,c			;0909	99 	. 
	res 4,l		;090a	cb a5 	. . 
	res 5,e		;090c	cb ab 	. . 
	res 6,c		;090e	cb b1 	. . 
	set 5,e		;0910	cb eb 	. . 
	ld (0ce43h),hl		;0912	22 43 ce 	" C . 
	ex de,hl			;0915	eb 	. 
	ld a,e			;0916	7b 	{ 
	ld (0d8d6h),a		;0917	32 d6 d8 	2 . . 
	ld hl,l0000h		;091a	21 00 00 	! . . 
	ld (0ce45h),hl		;091d	22 45 ce 	" E . 
	add hl,sp			;0920	39 	9 
	ld (0ce0fh),hl		;0921	22 0f ce 	" . . 
	ld sp,0ce41h		;0924	31 41 ce 	1 A . 
	xor a			;0927	af 	. 
	ld (0d8e0h),a		;0928	32 e0 d8 	2 . . 
	ld (0d8deh),a		;092b	32 de d8 	2 . . 
	ld hl,0d874h		;092e	21 74 d8 	! t . 
	push hl			;0931	e5 	. 
	ld a,c			;0932	79 	y 
	cp 029h		;0933	fe 29 	. ) 
	ret nc			;0935	d0 	. 
	ld c,e			;0936	4b 	K 
	ld hl,0cb47h		;0937	21 47 cb 	! G . 
	ld e,a			;093a	5f 	_ 
	ld d,000h		;093b	16 00 	. . 
	add hl,de			;093d	19 	. 
	add hl,de			;093e	19 	. 
	ld e,(hl)			;093f	5e 	^ 
	inc hl			;0940	23 	# 
	ld d,(hl)			;0941	56 	V 
	ld hl,(0ce43h)		;0942	2a 43 ce 	* C . 
	ex de,hl			;0945	eb 	. 
	jp (hl)			;0946	e9 	. 
	inc bc			;0947	03 	. 
	exx			;0948	d9 	. 
	ret z			;0949	c8 	. 
	call 0cc90h		;094a	cd 90 cc 	. . . 
	adc a,0cdh		;094d	ce cd 	. . 
	ld (de),a			;094f	12 	. 
	exx			;0950	d9 	. 
	rrca			;0951	0f 	. 
	exx			;0952	d9 	. 
	call nc,0edcdh		;0953	d4 cd ed 	. . . 
	call 0cdf3h		;0956	cd f3 cd 	. . . 
	ret m			;0959	f8 	. 
	call 0cce1h		;095a	cd e1 cc 	. . . 
	cp 0cdh		;095d	fe cd 	. . 
	ld a,(hl)			;095f	7e 	~ 
	rst 10h			;0960	d7 	. 
	add a,e			;0961	83 	. 
	rst 10h			;0962	d7 	. 
	ld b,l			;0963	45 	E 
	rst 10h			;0964	d7 	. 
	sbc a,h			;0965	9c 	. 
	rst 10h			;0966	d7 	. 
	and l			;0967	a5 	. 
	rst 10h			;0968	d7 	. 
	xor e			;0969	ab 	. 
	rst 10h			;096a	d7 	. 
	ret z			;096b	c8 	. 
	rst 10h			;096c	d7 	. 
	rst 10h			;096d	d7 	. 
	rst 10h			;096e	d7 	. 
	ret po			;096f	e0 	. 
	rst 10h			;0970	d7 	. 
	and 0d7h		;0971	e6 d7 	. . 
	call pe,0f5d7h		;0973	ec d7 f5 	. . . 
	rst 10h			;0976	d7 	. 
	cp 0d7h		;0977	fe d7 	. . 
	inc b			;0979	04 	. 
	ret c			;097a	d8 	. 
	ld a,(bc)			;097b	0a 	. 
	ret c			;097c	d8 	. 
	ld de,02cd8h		;097d	11 d8 2c 	. . , 
	ret nc			;0980	d0 	. 
	rla			;0981	17 	. 
	ret c			;0982	d8 	. 
	dec e			;0983	1d 	. 
	ret c			;0984	d8 	. 
	ld h,0d8h		;0985	26 d8 	& . 
	dec l			;0987	2d 	- 
	ret c			;0988	d8 	. 
	ld b,c			;0989	41 	A 
	ret c			;098a	d8 	. 
	ld b,a			;098b	47 	G 
	ret c			;098c	d8 	. 
	ld c,l			;098d	4d 	M 
	ret c			;098e	d8 	. 
	ld c,0d7h		;098f	0e d7 	. . 
	ld d,e			;0991	53 	S 
	ret c			;0992	d8 	. 
	inc b			;0993	04 	. 
	adc a,004h		;0994	ce 04 	. . 
	adc a,09bh		;0996	ce 9b 	. . 
	ret c			;0998	d8 	. 
	ld hl,0cbcah		;0999	21 ca cb 	! . . 
	call 0cbe5h		;099c	cd e5 cb 	. . . 
	cp 003h		;099f	fe 03 	. . 
	jp z,l0000h		;09a1	ca 00 00 	. . . 
	ret			;09a4	c9 	. 
	ld hl,0cbd5h		;09a5	21 d5 cb 	! . . 
	jp 0cbb4h		;09a8	c3 b4 cb 	. . . 
	ld hl,0cbe1h		;09ab	21 e1 cb 	! . . 
	jp 0cbb4h		;09ae	c3 b4 cb 	. . . 
	ld hl,0cbdch		;09b1	21 dc cb 	! . . 
	call 0cbe5h		;09b4	cd e5 cb 	. . . 
	jp l0000h		;09b7	c3 00 00 	. . . 
	ld b,d			;09ba	42 	B 
	ld h,h			;09bb	64 	d 
	ld l,a			;09bc	6f 	o 
	ld (hl),e			;09bd	73 	s 
	jr nz,71		;09be	20 45 	  E 
	ld (hl),d			;09c0	72 	r 
	ld (hl),d			;09c1	72 	r 
	jr nz,l0a13h		;09c2	20 4f 	  O 
	ld l,(hl)			;09c4	6e 	n 
	jr nz,34		;09c5	20 20 	    
	ld a,(02420h)		;09c7	3a 20 24 	:   $ 
	ld b,d			;09ca	42 	B 
	ld h,c			;09cb	61 	a 
	ld h,h			;09cc	64 	d 
	jr nz,l0a22h		;09cd	20 53 	  S 
	ld h,l			;09cf	65 	e 
	ld h,e			;09d0	63 	c 
	ld (hl),h			;09d1	74 	t 
	ld l,a			;09d2	6f 	o 
	ld (hl),d			;09d3	72 	r 
	inc h			;09d4	24 	$ 
	ld d,e			;09d5	53 	S 
	ld h,l			;09d6	65 	e 
	ld l,h			;09d7	6c 	l 
	ld h,l			;09d8	65 	e 
	ld h,e			;09d9	63 	c 
	ld (hl),h			;09da	74 	t 
	inc h			;09db	24 	$ 
	ld b,(hl)			;09dc	46 	F 
	ld l,c			;09dd	69 	i 
	ld l,h			;09de	6c 	l 
	ld h,l			;09df	65 	e 
	jr nz,84		;09e0	20 52 	  R 
	cpl			;09e2	2f 	/ 
	ld c,a			;09e3	4f 	O 
	inc h			;09e4	24 	$ 
	push hl			;09e5	e5 	. 
	call 0ccc9h		;09e6	cd c9 cc 	. . . 
	ld a,(0ce42h)		;09e9	3a 42 ce 	: B . 
	add a,041h		;09ec	c6 41 	. A 
	ld (0cbc6h),a		;09ee	32 c6 cb 	2 . . 
	ld bc,0cbbah		;09f1	01 ba cb 	. . . 
	call 0ccd3h		;09f4	cd d3 cc 	. . . 
	pop bc			;09f7	c1 	. 
	call 0ccd3h		;09f8	cd d3 cc 	. . . 
	ld hl,0ce0eh		;09fb	21 0e ce 	! . . 
	ld a,(hl)			;09fe	7e 	~ 
	ld (hl),000h		;09ff	36 00 	6 . 
	or a			;0a01	b7 	. 
	ret nz			;0a02	c0 	. 
	jp 0d909h		;0a03	c3 09 d9 	. . . 
	call 0cbfbh		;0a06	cd fb cb 	. . . 
	call 0cc14h		;0a09	cd 14 cc 	. . . 
	ret c			;0a0c	d8 	. 
	push af			;0a0d	f5 	. 
	ld c,a			;0a0e	4f 	O 
	call 0cc90h		;0a0f	cd 90 cc 	. . . 
	pop af			;0a12	f1 	. 
l0a13h:
	ret			;0a13	c9 	. 
	cp 00dh		;0a14	fe 0d 	. . 
	ret z			;0a16	c8 	. 
	cp 00ah		;0a17	fe 0a 	. . 
	ret z			;0a19	c8 	. 
	cp 009h		;0a1a	fe 09 	. . 
	ret z			;0a1c	c8 	. 
	cp 008h		;0a1d	fe 08 	. . 
	ret z			;0a1f	c8 	. 
	cp 020h		;0a20	fe 20 	.   
l0a22h:
	ret			;0a22	c9 	. 
	ld a,(0ce0eh)		;0a23	3a 0e ce 	: . . 
	or a			;0a26	b7 	. 
	jp nz,0cc45h		;0a27	c2 45 cc 	. E . 
	call 0d906h		;0a2a	cd 06 d9 	. . . 
	and 001h		;0a2d	e6 01 	. . 
	ret z			;0a2f	c8 	. 
	call 0d909h		;0a30	cd 09 d9 	. . . 
	cp 013h		;0a33	fe 13 	. . 
	jp nz,0cc42h		;0a35	c2 42 cc 	. B . 
	call 0d909h		;0a38	cd 09 d9 	. . . 
	cp 003h		;0a3b	fe 03 	. . 
	jp z,l0000h		;0a3d	ca 00 00 	. . . 
	xor a			;0a40	af 	. 
	ret			;0a41	c9 	. 
	ld (0ce0eh),a		;0a42	32 0e ce 	2 . . 
	ld a,001h		;0a45	3e 01 	> . 
	ret			;0a47	c9 	. 
	ld a,(0ce0ah)		;0a48	3a 0a ce 	: . . 
	or a			;0a4b	b7 	. 
	jp nz,0cc62h		;0a4c	c2 62 cc 	. b . 
	push bc			;0a4f	c5 	. 
	call 0cc23h		;0a50	cd 23 cc 	. # . 
	pop bc			;0a53	c1 	. 
	push bc			;0a54	c5 	. 
	call 0d90ch		;0a55	cd 0c d9 	. . . 
	pop bc			;0a58	c1 	. 
	push bc			;0a59	c5 	. 
	ld a,(0ce0dh)		;0a5a	3a 0d ce 	: . . 
	or a			;0a5d	b7 	. 
	call nz,0d90fh		;0a5e	c4 0f d9 	. . . 
	pop bc			;0a61	c1 	. 
	ld a,c			;0a62	79 	y 
	ld hl,0ce0ch		;0a63	21 0c ce 	! . . 
	cp 07fh		;0a66	fe 7f 	.  
	ret z			;0a68	c8 	. 
	inc (hl)			;0a69	34 	4 
	cp 020h		;0a6a	fe 20 	.   
	ret nc			;0a6c	d0 	. 
	dec (hl)			;0a6d	35 	5 
	ld a,(hl)			;0a6e	7e 	~ 
	or a			;0a6f	b7 	. 
	ret z			;0a70	c8 	. 
	ld a,c			;0a71	79 	y 
	cp 008h		;0a72	fe 08 	. . 
	jp nz,0cc79h		;0a74	c2 79 cc 	. y . 
	dec (hl)			;0a77	35 	5 
	ret			;0a78	c9 	. 
	cp 00ah		;0a79	fe 0a 	. . 
	ret nz			;0a7b	c0 	. 
	ld (hl),000h		;0a7c	36 00 	6 . 
	ret			;0a7e	c9 	. 
	ld a,c			;0a7f	79 	y 
	call 0cc14h		;0a80	cd 14 cc 	. . . 
	jp nc,0cc90h		;0a83	d2 90 cc 	. . . 
	push af			;0a86	f5 	. 
	ld c,05eh		;0a87	0e 5e 	. ^ 
	call 0cc48h		;0a89	cd 48 cc 	. H . 
	pop af			;0a8c	f1 	. 
	or 040h		;0a8d	f6 40 	. @ 
	ld c,a			;0a8f	4f 	O 
	ld a,c			;0a90	79 	y 
	cp 009h		;0a91	fe 09 	. . 
	jp nz,0cc48h		;0a93	c2 48 cc 	. H . 
	ld c,020h		;0a96	0e 20 	.   
	call 0cc48h		;0a98	cd 48 cc 	. H . 
	ld a,(0ce0ch)		;0a9b	3a 0c ce 	: . . 
	and 007h		;0a9e	e6 07 	. . 
	jp nz,0cc96h		;0aa0	c2 96 cc 	. . . 
	ret			;0aa3	c9 	. 
	call 0ccach		;0aa4	cd ac cc 	. . . 
	ld c,020h		;0aa7	0e 20 	.   
	call 0d90ch		;0aa9	cd 0c d9 	. . . 
	ld c,008h		;0aac	0e 08 	. . 
	jp 0d90ch		;0aae	c3 0c d9 	. . . 
	ld c,023h		;0ab1	0e 23 	. # 
	call 0cc48h		;0ab3	cd 48 cc 	. H . 
	call 0ccc9h		;0ab6	cd c9 cc 	. . . 
	ld a,(0ce0ch)		;0ab9	3a 0c ce 	: . . 
	ld hl,0ce0bh		;0abc	21 0b ce 	! . . 
	cp (hl)			;0abf	be 	. 
	ret nc			;0ac0	d0 	. 
	ld c,020h		;0ac1	0e 20 	.   
	call 0cc48h		;0ac3	cd 48 cc 	. H . 
	jp 0ccb9h		;0ac6	c3 b9 cc 	. . . 
	ld c,00dh		;0ac9	0e 0d 	. . 
	call 0cc48h		;0acb	cd 48 cc 	. H . 
	ld c,00ah		;0ace	0e 0a 	. . 
	jp 0cc48h		;0ad0	c3 48 cc 	. H . 
	ld a,(bc)			;0ad3	0a 	. 
	cp 024h		;0ad4	fe 24 	. $ 
	ret z			;0ad6	c8 	. 
	inc bc			;0ad7	03 	. 
	push bc			;0ad8	c5 	. 
	ld c,a			;0ad9	4f 	O 
	call 0cc90h		;0ada	cd 90 cc 	. . . 
	pop bc			;0add	c1 	. 
	jp 0ccd3h		;0ade	c3 d3 cc 	. . . 
	ld a,(0ce0ch)		;0ae1	3a 0c ce 	: . . 
	ld (0ce0bh),a		;0ae4	32 0b ce 	2 . . 
	ld hl,(0ce43h)		;0ae7	2a 43 ce 	* C . 
	ld c,(hl)			;0aea	4e 	N 
	inc hl			;0aeb	23 	# 
	push hl			;0aec	e5 	. 
	ld b,000h		;0aed	06 00 	. . 
	push bc			;0aef	c5 	. 
	push hl			;0af0	e5 	. 
	call 0cbfbh		;0af1	cd fb cb 	. . . 
	and 07fh		;0af4	e6 7f 	.  
	pop hl			;0af6	e1 	. 
	pop bc			;0af7	c1 	. 
	cp 00dh		;0af8	fe 0d 	. . 
	jp z,0cdc1h		;0afa	ca c1 cd 	. . . 
	cp 00ah		;0afd	fe 0a 	. . 
	jp z,0cdc1h		;0aff	ca c1 cd 	. . . 
	cp 008h		;0b02	fe 08 	. . 
	jp nz,0cd16h		;0b04	c2 16 cd 	. . . 
	ld a,b			;0b07	78 	x 
	or a			;0b08	b7 	. 
	jp z,0ccefh		;0b09	ca ef cc 	. . . 
	dec b			;0b0c	05 	. 
	ld a,(0ce0ch)		;0b0d	3a 0c ce 	: . . 
	ld (0ce0ah),a		;0b10	32 0a ce 	2 . . 
	jp 0cd70h		;0b13	c3 70 cd 	. p . 
	cp 07fh		;0b16	fe 7f 	.  
	jp nz,0cd26h		;0b18	c2 26 cd 	. & . 
	ld a,b			;0b1b	78 	x 
	or a			;0b1c	b7 	. 
	jp z,0ccefh		;0b1d	ca ef cc 	. . . 
	ld a,(hl)			;0b20	7e 	~ 
	dec b			;0b21	05 	. 
	dec hl			;0b22	2b 	+ 
	jp 0cda9h		;0b23	c3 a9 cd 	. . . 
	cp 005h		;0b26	fe 05 	. . 
	jp nz,0cd37h		;0b28	c2 37 cd 	. 7 . 
	push bc			;0b2b	c5 	. 
	push hl			;0b2c	e5 	. 
	call 0ccc9h		;0b2d	cd c9 cc 	. . . 
	xor a			;0b30	af 	. 
	ld (0ce0bh),a		;0b31	32 0b ce 	2 . . 
	jp 0ccf1h		;0b34	c3 f1 cc 	. . . 
	cp 010h		;0b37	fe 10 	. . 
	jp nz,0cd48h		;0b39	c2 48 cd 	. H . 
	push hl			;0b3c	e5 	. 
	ld hl,0ce0dh		;0b3d	21 0d ce 	! . . 
	ld a,001h		;0b40	3e 01 	> . 
	sub (hl)			;0b42	96 	. 
	ld (hl),a			;0b43	77 	w 
	pop hl			;0b44	e1 	. 
	jp 0ccefh		;0b45	c3 ef cc 	. . . 
	cp 018h		;0b48	fe 18 	. . 
	jp nz,0cd5fh		;0b4a	c2 5f cd 	. _ . 
	pop hl			;0b4d	e1 	. 
	ld a,(0ce0bh)		;0b4e	3a 0b ce 	: . . 
	ld hl,0ce0ch		;0b51	21 0c ce 	! . . 
	cp (hl)			;0b54	be 	. 
	jp nc,0cce1h		;0b55	d2 e1 cc 	. . . 
	dec (hl)			;0b58	35 	5 
	call 0cca4h		;0b59	cd a4 cc 	. . . 
	jp 0cd4eh		;0b5c	c3 4e cd 	. N . 
	cp 015h		;0b5f	fe 15 	. . 
	jp nz,0cd6bh		;0b61	c2 6b cd 	. k . 
	call 0ccb1h		;0b64	cd b1 cc 	. . . 
	pop hl			;0b67	e1 	. 
	jp 0cce1h		;0b68	c3 e1 cc 	. . . 
	cp 012h		;0b6b	fe 12 	. . 
	jp nz,0cda6h		;0b6d	c2 a6 cd 	. . . 
	push bc			;0b70	c5 	. 
	call 0ccb1h		;0b71	cd b1 cc 	. . . 
	pop bc			;0b74	c1 	. 
	pop hl			;0b75	e1 	. 
	push hl			;0b76	e5 	. 
	push bc			;0b77	c5 	. 
	ld a,b			;0b78	78 	x 
	or a			;0b79	b7 	. 
	jp z,0cd8ah		;0b7a	ca 8a cd 	. . . 
	inc hl			;0b7d	23 	# 
	ld c,(hl)			;0b7e	4e 	N 
	dec b			;0b7f	05 	. 
	push bc			;0b80	c5 	. 
	push hl			;0b81	e5 	. 
	call 0cc7fh		;0b82	cd 7f cc 	.  . 
	pop hl			;0b85	e1 	. 
	pop bc			;0b86	c1 	. 
	jp 0cd78h		;0b87	c3 78 cd 	. x . 
	push hl			;0b8a	e5 	. 
	ld a,(0ce0ah)		;0b8b	3a 0a ce 	: . . 
	or a			;0b8e	b7 	. 
	jp z,0ccf1h		;0b8f	ca f1 cc 	. . . 
	ld hl,0ce0ch		;0b92	21 0c ce 	! . . 
	sub (hl)			;0b95	96 	. 
	ld (0ce0ah),a		;0b96	32 0a ce 	2 . . 
	call 0cca4h		;0b99	cd a4 cc 	. . . 
	ld hl,0ce0ah		;0b9c	21 0a ce 	! . . 
	dec (hl)			;0b9f	35 	5 
	jp nz,0cd99h		;0ba0	c2 99 cd 	. . . 
	jp 0ccf1h		;0ba3	c3 f1 cc 	. . . 
	inc hl			;0ba6	23 	# 
	ld (hl),a			;0ba7	77 	w 
	inc b			;0ba8	04 	. 
	push bc			;0ba9	c5 	. 
	push hl			;0baa	e5 	. 
	ld c,a			;0bab	4f 	O 
	call 0cc7fh		;0bac	cd 7f cc 	.  . 
	pop hl			;0baf	e1 	. 
	pop bc			;0bb0	c1 	. 
	ld a,(hl)			;0bb1	7e 	~ 
	cp 003h		;0bb2	fe 03 	. . 
	ld a,b			;0bb4	78 	x 
	jp nz,0cdbdh		;0bb5	c2 bd cd 	. . . 
	cp 001h		;0bb8	fe 01 	. . 
	jp z,l0000h		;0bba	ca 00 00 	. . . 
	cp c			;0bbd	b9 	. 
	jp c,0ccefh		;0bbe	da ef cc 	. . . 
	pop hl			;0bc1	e1 	. 
	ld (hl),b			;0bc2	70 	p 
	ld c,00dh		;0bc3	0e 0d 	. . 
	jp 0cc48h		;0bc5	c3 48 cc 	. H . 
	call 0cc06h		;0bc8	cd 06 cc 	. . . 
	jp 0ce01h		;0bcb	c3 01 ce 	. . . 
	call 0d915h		;0bce	cd 15 d9 	. . . 
	jp 0ce01h		;0bd1	c3 01 ce 	. . . 
	ld a,c			;0bd4	79 	y 
	inc a			;0bd5	3c 	< 
	jp z,0cde0h		;0bd6	ca e0 cd 	. . . 
	inc a			;0bd9	3c 	< 
	jp z,0d906h		;0bda	ca 06 d9 	. . . 
	jp 0d90ch		;0bdd	c3 0c d9 	. . . 
	call 0d906h		;0be0	cd 06 d9 	. . . 
	or a			;0be3	b7 	. 
	jp z,0d891h		;0be4	ca 91 d8 	. . . 
	call 0d909h		;0be7	cd 09 d9 	. . . 
	jp 0ce01h		;0bea	c3 01 ce 	. . . 
	ld a,(l0003h)		;0bed	3a 03 00 	: . . 
	jp 0ce01h		;0bf0	c3 01 ce 	. . . 
	ld hl,l0003h		;0bf3	21 03 00 	! . . 
	ld (hl),c			;0bf6	71 	q 
	ret			;0bf7	c9 	. 
	ex de,hl			;0bf8	eb 	. 
	ld c,l			;0bf9	4d 	M 
	ld b,h			;0bfa	44 	D 
	jp 0ccd3h		;0bfb	c3 d3 cc 	. . . 
	call 0cc23h		;0bfe	cd 23 cc 	. # . 
	ld (0ce45h),a		;0c01	32 45 ce 	2 E . 
	ret			;0c04	c9 	. 
	ld a,001h		;0c05	3e 01 	> . 
	jp 0ce01h		;0c07	c3 01 ce 	. . . 
	nop			;0c0a	00 	. 
	nop			;0c0b	00 	. 
	nop			;0c0c	00 	. 
	nop			;0c0d	00 	. 
	nop			;0c0e	00 	. 
	nop			;0c0f	00 	. 
	nop			;0c10	00 	. 
	nop			;0c11	00 	. 
	nop			;0c12	00 	. 
	nop			;0c13	00 	. 
	nop			;0c14	00 	. 
	nop			;0c15	00 	. 
	nop			;0c16	00 	. 
	nop			;0c17	00 	. 
	nop			;0c18	00 	. 
	nop			;0c19	00 	. 
	nop			;0c1a	00 	. 
	nop			;0c1b	00 	. 
	nop			;0c1c	00 	. 
	nop			;0c1d	00 	. 
	nop			;0c1e	00 	. 
	nop			;0c1f	00 	. 
	nop			;0c20	00 	. 
	nop			;0c21	00 	. 
	nop			;0c22	00 	. 
	nop			;0c23	00 	. 
	nop			;0c24	00 	. 
	nop			;0c25	00 	. 
	nop			;0c26	00 	. 
	nop			;0c27	00 	. 
	nop			;0c28	00 	. 
	nop			;0c29	00 	. 
	nop			;0c2a	00 	. 
	nop			;0c2b	00 	. 
	nop			;0c2c	00 	. 
	nop			;0c2d	00 	. 
	nop			;0c2e	00 	. 
	nop			;0c2f	00 	. 
	nop			;0c30	00 	. 
	nop			;0c31	00 	. 
	nop			;0c32	00 	. 
	nop			;0c33	00 	. 
	nop			;0c34	00 	. 
	nop			;0c35	00 	. 
	nop			;0c36	00 	. 
	nop			;0c37	00 	. 
	nop			;0c38	00 	. 
	nop			;0c39	00 	. 
	nop			;0c3a	00 	. 
	nop			;0c3b	00 	. 
	nop			;0c3c	00 	. 
	nop			;0c3d	00 	. 
	nop			;0c3e	00 	. 
	nop			;0c3f	00 	. 
	nop			;0c40	00 	. 
	nop			;0c41	00 	. 
	nop			;0c42	00 	. 
	nop			;0c43	00 	. 
	nop			;0c44	00 	. 
	nop			;0c45	00 	. 
	nop			;0c46	00 	. 
	ld hl,0cb0bh		;0c47	21 0b cb 	! . . 
	ld e,(hl)			;0c4a	5e 	^ 
	inc hl			;0c4b	23 	# 
	ld d,(hl)			;0c4c	56 	V 
	ex de,hl			;0c4d	eb 	. 
	jp (hl)			;0c4e	e9 	. 
	inc c			;0c4f	0c 	. 
	dec c			;0c50	0d 	. 
	ret z			;0c51	c8 	. 
	ld a,(de)			;0c52	1a 	. 
	ld (hl),a			;0c53	77 	w 
	inc de			;0c54	13 	. 
	inc hl			;0c55	23 	# 
	jp 0ce50h		;0c56	c3 50 ce 	. P . 
	ld a,(0ce42h)		;0c59	3a 42 ce 	: B . 
	ld c,a			;0c5c	4f 	O 
	call 0d91bh		;0c5d	cd 1b d9 	. . . 
	ld a,h			;0c60	7c 	| 
	or l			;0c61	b5 	. 
	ret z			;0c62	c8 	. 
	ld e,(hl)			;0c63	5e 	^ 
	inc hl			;0c64	23 	# 
	ld d,(hl)			;0c65	56 	V 
	inc hl			;0c66	23 	# 
	ld (0d8b3h),hl		;0c67	22 b3 d8 	" . . 
	inc hl			;0c6a	23 	# 
	inc hl			;0c6b	23 	# 
	ld (0d8b5h),hl		;0c6c	22 b5 d8 	" . . 
	inc hl			;0c6f	23 	# 
	inc hl			;0c70	23 	# 
	ld (0d8b7h),hl		;0c71	22 b7 d8 	" . . 
	inc hl			;0c74	23 	# 
	inc hl			;0c75	23 	# 
	ex de,hl			;0c76	eb 	. 
	ld (0d8d0h),hl		;0c77	22 d0 d8 	" . . 
	ld hl,0d8b9h		;0c7a	21 b9 d8 	! . . 
	ld c,008h		;0c7d	0e 08 	. . 
	call 0ce4fh		;0c7f	cd 4f ce 	. O . 
	ld hl,(0d8bbh)		;0c82	2a bb d8 	* . . 
	ex de,hl			;0c85	eb 	. 
	ld hl,0d8c1h		;0c86	21 c1 d8 	! . . 
	ld c,00fh		;0c89	0e 0f 	. . 
	call 0ce4fh		;0c8b	cd 4f ce 	. O . 
	ld hl,(0d8c6h)		;0c8e	2a c6 d8 	* . . 
	ld a,h			;0c91	7c 	| 
	ld hl,0d8ddh		;0c92	21 dd d8 	! . . 
	ld (hl),0ffh		;0c95	36 ff 	6 . 
	or a			;0c97	b7 	. 
	jp z,0ce9dh		;0c98	ca 9d ce 	. . . 
	ld (hl),000h		;0c9b	36 00 	6 . 
	ld a,0ffh		;0c9d	3e ff 	> . 
	or a			;0c9f	b7 	. 
	ret			;0ca0	c9 	. 
	call 0d918h		;0ca1	cd 18 d9 	. . . 
	xor a			;0ca4	af 	. 
	ld hl,(0d8b5h)		;0ca5	2a b5 d8 	* . . 
	ld (hl),a			;0ca8	77 	w 
	inc hl			;0ca9	23 	# 
	ld (hl),a			;0caa	77 	w 
	ld hl,(0d8b7h)		;0cab	2a b7 d8 	* . . 
	ld (hl),a			;0cae	77 	w 
	inc hl			;0caf	23 	# 
	ld (hl),a			;0cb0	77 	w 
	ret			;0cb1	c9 	. 
	call 0d927h		;0cb2	cd 27 d9 	. ' . 
	jp 0cebbh		;0cb5	c3 bb ce 	. . . 
	call 0d92ah		;0cb8	cd 2a d9 	. * . 
	or a			;0cbb	b7 	. 
	ret z			;0cbc	c8 	. 
	ld hl,0cb09h		;0cbd	21 09 cb 	! . . 
	jp 0ce4ah		;0cc0	c3 4a ce 	. J . 
	ld hl,(0d8eah)		;0cc3	2a ea d8 	* . . 
	ld c,002h		;0cc6	0e 02 	. . 
	call 0cfeah		;0cc8	cd ea cf 	. . . 
	ld (0d8e5h),hl		;0ccb	22 e5 d8 	" . . 
	ld (0d8ech),hl		;0cce	22 ec d8 	" . . 
	ld hl,0d8e5h		;0cd1	21 e5 d8 	! . . 
	ld c,(hl)			;0cd4	4e 	N 
	inc hl			;0cd5	23 	# 
	ld b,(hl)			;0cd6	46 	F 
	ld hl,(0d8b7h)		;0cd7	2a b7 d8 	* . . 
	ld e,(hl)			;0cda	5e 	^ 
	inc hl			;0cdb	23 	# 
	ld d,(hl)			;0cdc	56 	V 
	ld hl,(0d8b5h)		;0cdd	2a b5 d8 	* . . 
	ld a,(hl)			;0ce0	7e 	~ 
	inc hl			;0ce1	23 	# 
	ld h,(hl)			;0ce2	66 	f 
	ld l,a			;0ce3	6f 	o 
	ld a,c			;0ce4	79 	y 
	sub e			;0ce5	93 	. 
	ld a,b			;0ce6	78 	x 
	sbc a,d			;0ce7	9a 	. 
	jp nc,0cefah		;0ce8	d2 fa ce 	. . . 
	push hl			;0ceb	e5 	. 
	ld hl,(0d8c1h)		;0cec	2a c1 d8 	* . . 
	ld a,e			;0cef	7b 	{ 
	sub l			;0cf0	95 	. 
	ld e,a			;0cf1	5f 	_ 
	ld a,d			;0cf2	7a 	z 
	sbc a,h			;0cf3	9c 	. 
	ld d,a			;0cf4	57 	W 
	pop hl			;0cf5	e1 	. 
	dec hl			;0cf6	2b 	+ 
	jp 0cee4h		;0cf7	c3 e4 ce 	. . . 
	push hl			;0cfa	e5 	. 
	ld hl,(0d8c1h)		;0cfb	2a c1 d8 	* . . 
	add hl,de			;0cfe	19 	. 
	jp c,0cf0fh		;0cff	da 0f cf 	. . . 
	ld a,c			;0d02	79 	y 
	sub l			;0d03	95 	. 
	ld a,b			;0d04	78 	x 
	sbc a,h			;0d05	9c 	. 
	jp c,0cf0fh		;0d06	da 0f cf 	. . . 
	ex de,hl			;0d09	eb 	. 
	pop hl			;0d0a	e1 	. 
	inc hl			;0d0b	23 	# 
	jp 0cefah		;0d0c	c3 fa ce 	. . . 
	pop hl			;0d0f	e1 	. 
	push bc			;0d10	c5 	. 
	push de			;0d11	d5 	. 
	push hl			;0d12	e5 	. 
	ex de,hl			;0d13	eb 	. 
	ld hl,(0d8ceh)		;0d14	2a ce d8 	* . . 
	add hl,de			;0d17	19 	. 
	ld b,h			;0d18	44 	D 
	ld c,l			;0d19	4d 	M 
	call 0d91eh		;0d1a	cd 1e d9 	. . . 
	pop de			;0d1d	d1 	. 
	ld hl,(0d8b5h)		;0d1e	2a b5 d8 	* . . 
	ld (hl),e			;0d21	73 	s 
	inc hl			;0d22	23 	# 
	ld (hl),d			;0d23	72 	r 
	pop de			;0d24	d1 	. 
	ld hl,(0d8b7h)		;0d25	2a b7 d8 	* . . 
	ld (hl),e			;0d28	73 	s 
	inc hl			;0d29	23 	# 
	ld (hl),d			;0d2a	72 	r 
	pop bc			;0d2b	c1 	. 
	ld a,c			;0d2c	79 	y 
	sub e			;0d2d	93 	. 
	ld c,a			;0d2e	4f 	O 
	ld a,b			;0d2f	78 	x 
	sbc a,d			;0d30	9a 	. 
	ld b,a			;0d31	47 	G 
	ld hl,(0d8d0h)		;0d32	2a d0 d8 	* . . 
	ex de,hl			;0d35	eb 	. 
	call 0d930h		;0d36	cd 30 d9 	. 0 . 
	ld c,l			;0d39	4d 	M 
	ld b,h			;0d3a	44 	D 
	jp 0d921h		;0d3b	c3 21 d9 	. ! . 
	ld hl,0d8c3h		;0d3e	21 c3 d8 	! . . 
	ld c,(hl)			;0d41	4e 	N 
	ld a,(0d8e3h)		;0d42	3a e3 d8 	: . . 
	or a			;0d45	b7 	. 
	rra			;0d46	1f 	. 
	dec c			;0d47	0d 	. 
	jp nz,0cf45h		;0d48	c2 45 cf 	. E . 
	ld b,a			;0d4b	47 	G 
	ld a,008h		;0d4c	3e 08 	> . 
	sub (hl)			;0d4e	96 	. 
	ld c,a			;0d4f	4f 	O 
	ld a,(0d8e2h)		;0d50	3a e2 d8 	: . . 
	dec c			;0d53	0d 	. 
	jp z,0cf5ch		;0d54	ca 5c cf 	. \ . 
	or a			;0d57	b7 	. 
	rla			;0d58	17 	. 
	jp 0cf53h		;0d59	c3 53 cf 	. S . 
	add a,b			;0d5c	80 	. 
	ret			;0d5d	c9 	. 
	ld hl,(0ce43h)		;0d5e	2a 43 ce 	* C . 
	ld de,l0010h		;0d61	11 10 00 	. . . 
	add hl,de			;0d64	19 	. 
	add hl,bc			;0d65	09 	. 
	ld a,(0d8ddh)		;0d66	3a dd d8 	: . . 
	or a			;0d69	b7 	. 
	jp z,0cf71h		;0d6a	ca 71 cf 	. q . 
	ld l,(hl)			;0d6d	6e 	n 
	ld h,000h		;0d6e	26 00 	& . 
	ret			;0d70	c9 	. 
	add hl,bc			;0d71	09 	. 
	ld e,(hl)			;0d72	5e 	^ 
	inc hl			;0d73	23 	# 
	ld d,(hl)			;0d74	56 	V 
	ex de,hl			;0d75	eb 	. 
	ret			;0d76	c9 	. 
	call 0cf3eh		;0d77	cd 3e cf 	. > . 
	ld c,a			;0d7a	4f 	O 
	ld b,000h		;0d7b	06 00 	. . 
	call 0cf5eh		;0d7d	cd 5e cf 	. ^ . 
	ld (0d8e5h),hl		;0d80	22 e5 d8 	" . . 
	ret			;0d83	c9 	. 
	ld hl,(0d8e5h)		;0d84	2a e5 d8 	* . . 
	ld a,l			;0d87	7d 	} 
	or h			;0d88	b4 	. 
	ret			;0d89	c9 	. 
	ld a,(0d8c3h)		;0d8a	3a c3 d8 	: . . 
	ld hl,(0d8e5h)		;0d8d	2a e5 d8 	* . . 
	add hl,hl			;0d90	29 	) 
	dec a			;0d91	3d 	= 
	jp nz,0cf90h		;0d92	c2 90 cf 	. . . 
	ld (0d8e7h),hl		;0d95	22 e7 d8 	" . . 
	ld a,(0d8c4h)		;0d98	3a c4 d8 	: . . 
	ld c,a			;0d9b	4f 	O 
	ld a,(0d8e3h)		;0d9c	3a e3 d8 	: . . 
	and c			;0d9f	a1 	. 
	or l			;0da0	b5 	. 
	ld l,a			;0da1	6f 	o 
	ld (0d8e5h),hl		;0da2	22 e5 d8 	" . . 
	ret			;0da5	c9 	. 
	ld hl,(0ce43h)		;0da6	2a 43 ce 	* C . 
	ld de,l000ch		;0da9	11 0c 00 	. . . 
	add hl,de			;0dac	19 	. 
	ret			;0dad	c9 	. 
	ld hl,(0ce43h)		;0dae	2a 43 ce 	* C . 
	ld de,l000fh		;0db1	11 0f 00 	. . . 
	add hl,de			;0db4	19 	. 
	ex de,hl			;0db5	eb 	. 
	ld hl,l0010h+1		;0db6	21 11 00 	! . . 
	add hl,de			;0db9	19 	. 
	ret			;0dba	c9 	. 
	call 0cfaeh		;0dbb	cd ae cf 	. . . 
	ld a,(hl)			;0dbe	7e 	~ 
	ld (0d8e3h),a		;0dbf	32 e3 d8 	2 . . 
	ex de,hl			;0dc2	eb 	. 
	ld a,(hl)			;0dc3	7e 	~ 
	ld (0d8e1h),a		;0dc4	32 e1 d8 	2 . . 
	call 0cfa6h		;0dc7	cd a6 cf 	. . . 
	ld a,(0d8c5h)		;0dca	3a c5 d8 	: . . 
	and (hl)			;0dcd	a6 	. 
	ld (0d8e2h),a		;0dce	32 e2 d8 	2 . . 
	ret			;0dd1	c9 	. 
	call 0cfaeh		;0dd2	cd ae cf 	. . . 
	ld a,(0d8d5h)		;0dd5	3a d5 d8 	: . . 
	cp 002h		;0dd8	fe 02 	. . 
	jp nz,0cfdeh		;0dda	c2 de cf 	. . . 
	xor a			;0ddd	af 	. 
	ld c,a			;0dde	4f 	O 
	ld a,(0d8e3h)		;0ddf	3a e3 d8 	: . . 
	add a,c			;0de2	81 	. 
	ld (hl),a			;0de3	77 	w 
	ex de,hl			;0de4	eb 	. 
	ld a,(0d8e1h)		;0de5	3a e1 d8 	: . . 
	ld (hl),a			;0de8	77 	w 
	ret			;0de9	c9 	. 
	inc c			;0dea	0c 	. 
	dec c			;0deb	0d 	. 
	ret z			;0dec	c8 	. 
	ld a,h			;0ded	7c 	| 
	or a			;0dee	b7 	. 
	rra			;0def	1f 	. 
	ld h,a			;0df0	67 	g 
	ld a,l			;0df1	7d 	} 
	rra			;0df2	1f 	. 
	ld l,a			;0df3	6f 	o 
	jp 0cfebh		;0df4	c3 eb cf 	. . . 
	ld c,080h		;0df7	0e 80 	. . 
	ld hl,(0d8b9h)		;0df9	2a b9 d8 	* . . 
	xor a			;0dfc	af 	. 
	add a,(hl)			;0dfd	86 	. 
	inc hl			;0dfe	23 	# 
	dec c			;0dff	0d 	. 
	jp nz,0cffdh		;0e00	c2 fd cf 	. . . 
	ret			;0e03	c9 	. 
	inc c			;0e04	0c 	. 
	dec c			;0e05	0d 	. 
	ret z			;0e06	c8 	. 
	add hl,hl			;0e07	29 	) 
	jp 0d005h		;0e08	c3 05 d0 	. . . 
	push bc			;0e0b	c5 	. 
	ld a,(0ce42h)		;0e0c	3a 42 ce 	: B . 
	ld c,a			;0e0f	4f 	O 
	ld hl,l0000h+1		;0e10	21 01 00 	! . . 
	call 0d004h		;0e13	cd 04 d0 	. . . 
	pop bc			;0e16	c1 	. 
	ld a,c			;0e17	79 	y 
	or l			;0e18	b5 	. 
	ld l,a			;0e19	6f 	o 
	ld a,b			;0e1a	78 	x 
	or h			;0e1b	b4 	. 
	ld h,a			;0e1c	67 	g 
	ret			;0e1d	c9 	. 
	ld hl,(0d8adh)		;0e1e	2a ad d8 	* . . 
	ld a,(0ce42h)		;0e21	3a 42 ce 	: B . 
	ld c,a			;0e24	4f 	O 
	call 0cfeah		;0e25	cd ea cf 	. . . 
	ld a,l			;0e28	7d 	} 
	and 001h		;0e29	e6 01 	. . 
	ret			;0e2b	c9 	. 
	ld hl,0d8adh		;0e2c	21 ad d8 	! . . 
	ld c,(hl)			;0e2f	4e 	N 
	inc hl			;0e30	23 	# 
	ld b,(hl)			;0e31	46 	F 
	call 0d00bh		;0e32	cd 0b d0 	. . . 
	ld (0d8adh),hl		;0e35	22 ad d8 	" . . 
	ld hl,(0d8c8h)		;0e38	2a c8 d8 	* . . 
	inc hl			;0e3b	23 	# 
	ex de,hl			;0e3c	eb 	. 
	ld hl,(0d8b3h)		;0e3d	2a b3 d8 	* . . 
	ld (hl),e			;0e40	73 	s 
	inc hl			;0e41	23 	# 
	ld (hl),d			;0e42	72 	r 
	ret			;0e43	c9 	. 
	call 0d05eh		;0e44	cd 5e d0 	. ^ . 
	ld de,l0009h		;0e47	11 09 00 	. . . 
	add hl,de			;0e4a	19 	. 
	ld a,(hl)			;0e4b	7e 	~ 
	rla			;0e4c	17 	. 
	ret nc			;0e4d	d0 	. 
	ld hl,0cb0fh		;0e4e	21 0f cb 	! . . 
	jp 0ce4ah		;0e51	c3 4a ce 	. J . 
	call 0d01eh		;0e54	cd 1e d0 	. . . 
	ret z			;0e57	c8 	. 
	ld hl,0cb0dh		;0e58	21 0d cb 	! . . 
	jp 0ce4ah		;0e5b	c3 4a ce 	. J . 
	ld hl,(0d8b9h)		;0e5e	2a b9 d8 	* . . 
	ld a,(0d8e9h)		;0e61	3a e9 d8 	: . . 
	add a,l			;0e64	85 	. 
	ld l,a			;0e65	6f 	o 
	ret nc			;0e66	d0 	. 
	inc h			;0e67	24 	$ 
	ret			;0e68	c9 	. 
	ld hl,(0ce43h)		;0e69	2a 43 ce 	* C . 
	ld de,l000ch+2		;0e6c	11 0e 00 	. . . 
	add hl,de			;0e6f	19 	. 
	ld a,(hl)			;0e70	7e 	~ 
	ret			;0e71	c9 	. 
	call 0d069h		;0e72	cd 69 d0 	. i . 
	ld (hl),000h		;0e75	36 00 	6 . 
	ret			;0e77	c9 	. 
	call 0d069h		;0e78	cd 69 d0 	. i . 
	or 080h		;0e7b	f6 80 	. . 
	ld (hl),a			;0e7d	77 	w 
	ret			;0e7e	c9 	. 
	ld hl,(0d8eah)		;0e7f	2a ea d8 	* . . 
	ex de,hl			;0e82	eb 	. 
	ld hl,(0d8b3h)		;0e83	2a b3 d8 	* . . 
	ld a,e			;0e86	7b 	{ 
	sub (hl)			;0e87	96 	. 
	inc hl			;0e88	23 	# 
	ld a,d			;0e89	7a 	z 
	sbc a,(hl)			;0e8a	9e 	. 
	ret			;0e8b	c9 	. 
	call 0d07fh		;0e8c	cd 7f d0 	.  . 
	ret c			;0e8f	d8 	. 
	inc de			;0e90	13 	. 
	ld (hl),d			;0e91	72 	r 
	dec hl			;0e92	2b 	+ 
	ld (hl),e			;0e93	73 	s 
	ret			;0e94	c9 	. 
	ld a,e			;0e95	7b 	{ 
	sub l			;0e96	95 	. 
	ld l,a			;0e97	6f 	o 
	ld a,d			;0e98	7a 	z 
	sbc a,h			;0e99	9c 	. 
	ld h,a			;0e9a	67 	g 
	ret			;0e9b	c9 	. 
	ld c,0ffh		;0e9c	0e ff 	. . 
	ld hl,(0d8ech)		;0e9e	2a ec d8 	* . . 
	ex de,hl			;0ea1	eb 	. 
	ld hl,(0d8cch)		;0ea2	2a cc d8 	* . . 
	call 0d095h		;0ea5	cd 95 d0 	. . . 
	ret nc			;0ea8	d0 	. 
	push bc			;0ea9	c5 	. 
	call 0cff7h		;0eaa	cd f7 cf 	. . . 
	ld hl,(0d8bdh)		;0ead	2a bd d8 	* . . 
	ex de,hl			;0eb0	eb 	. 
	ld hl,(0d8ech)		;0eb1	2a ec d8 	* . . 
	add hl,de			;0eb4	19 	. 
	pop bc			;0eb5	c1 	. 
	inc c			;0eb6	0c 	. 
	jp z,0d0c4h		;0eb7	ca c4 d0 	. . . 
	cp (hl)			;0eba	be 	. 
	ret z			;0ebb	c8 	. 
	call 0d07fh		;0ebc	cd 7f d0 	.  . 
	ret nc			;0ebf	d0 	. 
	call 0d02ch		;0ec0	cd 2c d0 	. , . 
	ret			;0ec3	c9 	. 
	ld (hl),a			;0ec4	77 	w 
	ret			;0ec5	c9 	. 
	call 0d09ch		;0ec6	cd 9c d0 	. . . 
	call 0d0e0h		;0ec9	cd e0 d0 	. . . 
	ld c,001h		;0ecc	0e 01 	. . 
	call 0ceb8h		;0ece	cd b8 ce 	. . . 
	jp 0d0dah		;0ed1	c3 da d0 	. . . 
	call 0d0e0h		;0ed4	cd e0 d0 	. . . 
	call 0ceb2h		;0ed7	cd b2 ce 	. . . 
	ld hl,0d8b1h		;0eda	21 b1 d8 	! . . 
	jp 0d0e3h		;0edd	c3 e3 d0 	. . . 
	ld hl,0d8b9h		;0ee0	21 b9 d8 	! . . 
	ld c,(hl)			;0ee3	4e 	N 
	inc hl			;0ee4	23 	# 
	ld b,(hl)			;0ee5	46 	F 
	jp 0d924h		;0ee6	c3 24 d9 	. $ . 
	ld hl,(0d8b9h)		;0ee9	2a b9 d8 	* . . 
	ex de,hl			;0eec	eb 	. 
	ld hl,(0d8b1h)		;0eed	2a b1 d8 	* . . 
	ld c,080h		;0ef0	0e 80 	. . 
	jp 0ce4fh		;0ef2	c3 4f ce 	. O . 
	ld hl,0d8eah		;0ef5	21 ea d8 	! . . 
	ld a,(hl)			;0ef8	7e 	~ 
	inc hl			;0ef9	23 	# 
	cp (hl)			;0efa	be 	. 
	ret nz			;0efb	c0 	. 
	inc a			;0efc	3c 	< 
	ret			;0efd	c9 	. 
	ld hl,0ffffh		;0efe	21 ff ff 	! . . 
	ld (0d8eah),hl		;0f01	22 ea d8 	" . . 
	ret			;0f04	c9 	. 
	ld hl,(0d8c8h)		;0f05	2a c8 d8 	* . . 
	ex de,hl			;0f08	eb 	. 
	ld hl,(0d8eah)		;0f09	2a ea d8 	* . . 
	inc hl			;0f0c	23 	# 
	ld (0d8eah),hl		;0f0d	22 ea d8 	" . . 
	call 0d095h		;0f10	cd 95 d0 	. . . 
	jp nc,0d119h		;0f13	d2 19 d1 	. . . 
	jp 0d0feh		;0f16	c3 fe d0 	. . . 
	ld a,(0d8eah)		;0f19	3a ea d8 	: . . 
	and 003h		;0f1c	e6 03 	. . 
	ld b,005h		;0f1e	06 05 	. . 
	add a,a			;0f20	87 	. 
	dec b			;0f21	05 	. 
	jp nz,0d120h		;0f22	c2 20 d1 	.   . 
	ld (0d8e9h),a		;0f25	32 e9 d8 	2 . . 
	or a			;0f28	b7 	. 
	ret nz			;0f29	c0 	. 
	push bc			;0f2a	c5 	. 
	call 0cec3h		;0f2b	cd c3 ce 	. . . 
	call 0d0d4h		;0f2e	cd d4 d0 	. . . 
	pop bc			;0f31	c1 	. 
	jp 0d09eh		;0f32	c3 9e d0 	. . . 
	ld a,c			;0f35	79 	y 
	and 007h		;0f36	e6 07 	. . 
	inc a			;0f38	3c 	< 
	ld e,a			;0f39	5f 	_ 
	ld d,a			;0f3a	57 	W 
	ld a,c			;0f3b	79 	y 
	rrca			;0f3c	0f 	. 
	rrca			;0f3d	0f 	. 
	rrca			;0f3e	0f 	. 
	and 01fh		;0f3f	e6 1f 	. . 
	ld c,a			;0f41	4f 	O 
	ld a,b			;0f42	78 	x 
	add a,a			;0f43	87 	. 
	add a,a			;0f44	87 	. 
	add a,a			;0f45	87 	. 
	add a,a			;0f46	87 	. 
	add a,a			;0f47	87 	. 
	or c			;0f48	b1 	. 
	ld c,a			;0f49	4f 	O 
	ld a,b			;0f4a	78 	x 
	rrca			;0f4b	0f 	. 
	rrca			;0f4c	0f 	. 
	rrca			;0f4d	0f 	. 
	and 01fh		;0f4e	e6 1f 	. . 
	ld b,a			;0f50	47 	G 
	ld hl,(0d8bfh)		;0f51	2a bf d8 	* . . 
	add hl,bc			;0f54	09 	. 
	ld a,(hl)			;0f55	7e 	~ 
	rlca			;0f56	07 	. 
	dec e			;0f57	1d 	. 
	jp nz,0d156h		;0f58	c2 56 d1 	. V . 
	ret			;0f5b	c9 	. 
	push de			;0f5c	d5 	. 
	call 0d135h		;0f5d	cd 35 d1 	. 5 . 
	and 0feh		;0f60	e6 fe 	. . 
	pop bc			;0f62	c1 	. 
	or c			;0f63	b1 	. 
	rrca			;0f64	0f 	. 
	dec d			;0f65	15 	. 
	jp nz,0d164h		;0f66	c2 64 d1 	. d . 
	ld (hl),a			;0f69	77 	w 
	ret			;0f6a	c9 	. 
	call 0d05eh		;0f6b	cd 5e d0 	. ^ . 
	ld de,l0010h		;0f6e	11 10 00 	. . . 
	add hl,de			;0f71	19 	. 
	push bc			;0f72	c5 	. 
	ld c,011h		;0f73	0e 11 	. . 
	pop de			;0f75	d1 	. 
	dec c			;0f76	0d 	. 
	ret z			;0f77	c8 	. 
	push de			;0f78	d5 	. 
	ld a,(0d8ddh)		;0f79	3a dd d8 	: . . 
	or a			;0f7c	b7 	. 
	jp z,0d188h		;0f7d	ca 88 d1 	. . . 
	push bc			;0f80	c5 	. 
	push hl			;0f81	e5 	. 
	ld c,(hl)			;0f82	4e 	N 
	ld b,000h		;0f83	06 00 	. . 
	jp 0d18eh		;0f85	c3 8e d1 	. . . 
	dec c			;0f88	0d 	. 
	push bc			;0f89	c5 	. 
	ld c,(hl)			;0f8a	4e 	N 
	inc hl			;0f8b	23 	# 
	ld b,(hl)			;0f8c	46 	F 
	push hl			;0f8d	e5 	. 
	ld a,c			;0f8e	79 	y 
	or b			;0f8f	b0 	. 
	jp z,0d19dh		;0f90	ca 9d d1 	. . . 
	ld hl,(0d8c6h)		;0f93	2a c6 d8 	* . . 
	ld a,l			;0f96	7d 	} 
	sub c			;0f97	91 	. 
	ld a,h			;0f98	7c 	| 
	sbc a,b			;0f99	98 	. 
	call nc,0d15ch		;0f9a	d4 5c d1 	. \ . 
	pop hl			;0f9d	e1 	. 
	inc hl			;0f9e	23 	# 
	pop bc			;0f9f	c1 	. 
l0fa0h:
	jp 0d175h		;0fa0	c3 75 d1 	. u . 
	ld hl,(0d8c6h)		;0fa3	2a c6 d8 	* . . 
	ld c,003h		;0fa6	0e 03 	. . 
	call 0cfeah		;0fa8	cd ea cf 	. . . 
	inc hl			;0fab	23 	# 
	ld b,h			;0fac	44 	D 
	ld c,l			;0fad	4d 	M 
	ld hl,(0d8bfh)		;0fae	2a bf d8 	* . . 
	ld (hl),000h		;0fb1	36 00 	6 . 
	inc hl			;0fb3	23 	# 
	dec bc			;0fb4	0b 	. 
	ld a,b			;0fb5	78 	x 
	or c			;0fb6	b1 	. 
	jp nz,0d1b1h		;0fb7	c2 b1 d1 	. . . 
	ld hl,(0d8cah)		;0fba	2a ca d8 	* . . 
	ex de,hl			;0fbd	eb 	. 
	ld hl,(0d8bfh)		;0fbe	2a bf d8 	* . . 
	ld (hl),e			;0fc1	73 	s 
	inc hl			;0fc2	23 	# 
	ld (hl),d			;0fc3	72 	r 
	call 0cea1h		;0fc4	cd a1 ce 	. . . 
	ld hl,(0d8b3h)		;0fc7	2a b3 d8 	* . . 
	ld (hl),003h		;0fca	36 03 	6 . 
	inc hl			;0fcc	23 	# 
	ld (hl),000h		;0fcd	36 00 	6 . 
	call 0d0feh		;0fcf	cd fe d0 	. . . 
	ld c,0ffh		;0fd2	0e ff 	. . 
	call 0d105h		;0fd4	cd 05 d1 	. . . 
	call 0d0f5h		;0fd7	cd f5 d0 	. . . 
	ret z			;0fda	c8 	. 
	call 0d05eh		;0fdb	cd 5e d0 	. ^ . 
	ld a,0e5h		;0fde	3e e5 	> . 
	cp (hl)			;0fe0	be 	. 
	jp z,0d1d2h		;0fe1	ca d2 d1 	. . . 
	ld a,(0ce41h)		;0fe4	3a 41 ce 	: A . 
	cp (hl)			;0fe7	be 	. 
	jp nz,0d1f6h		;0fe8	c2 f6 d1 	. . . 
	inc hl			;0feb	23 	# 
	ld a,(hl)			;0fec	7e 	~ 
	sub 024h		;0fed	d6 24 	. $ 
	jp nz,0d1f6h		;0fef	c2 f6 d1 	. . . 
	dec a			;0ff2	3d 	= 
	ld (0ce45h),a		;0ff3	32 45 ce 	2 E . 
	ld c,001h		;0ff6	0e 01 	. . 
	call 0d16bh		;0ff8	cd 6b d1 	. k . 
	call 0d08ch		;0ffb	cd 8c d0 	. . . 
	jp 0d1d2h		;0ffe	c3 d2 d1 	. . . 
	ld a,(0d8d4h)		;1001	3a d4 d8 	: . . 
	jp 0ce01h		;1004	c3 01 ce 	. . . 
	push bc			;1007	c5 	. 
	push af			;1008	f5 	. 
	ld a,(0d8c5h)		;1009	3a c5 d8 	: . . 
	cpl			;100c	2f 	/ 
	ld b,a			;100d	47 	G 
	ld a,c			;100e	79 	y 
	and b			;100f	a0 	. 
	ld c,a			;1010	4f 	O 
	pop af			;1011	f1 	. 
	and b			;1012	a0 	. 
	sub c			;1013	91 	. 
	and 01fh		;1014	e6 1f 	. . 
	pop bc			;1016	c1 	. 
	ret			;1017	c9 	. 
	ld a,0ffh		;1018	3e ff 	> . 
	ld (0d8d4h),a		;101a	32 d4 d8 	2 . . 
	ld hl,0d8d8h		;101d	21 d8 d8 	! . . 
	ld (hl),c			;1020	71 	q 
	ld hl,(0ce43h)		;1021	2a 43 ce 	* C . 
	ld (0d8d9h),hl		;1024	22 d9 d8 	" . . 
	call 0d0feh		;1027	cd fe d0 	. . . 
	call 0cea1h		;102a	cd a1 ce 	. . . 
	ld c,000h		;102d	0e 00 	. . 
	call 0d105h		;102f	cd 05 d1 	. . . 
	call 0d0f5h		;1032	cd f5 d0 	. . . 
	jp z,0d294h		;1035	ca 94 d2 	. . . 
	ld hl,(0d8d9h)		;1038	2a d9 d8 	* . . 
	ex de,hl			;103b	eb 	. 
	ld a,(de)			;103c	1a 	. 
	cp 0e5h		;103d	fe e5 	. . 
	jp z,0d24ah		;103f	ca 4a d2 	. J . 
	push de			;1042	d5 	. 
	call 0d07fh		;1043	cd 7f d0 	.  . 
	pop de			;1046	d1 	. 
	jp nc,0d294h		;1047	d2 94 d2 	. . . 
	call 0d05eh		;104a	cd 5e d0 	. ^ . 
	ld a,(0d8d8h)		;104d	3a d8 d8 	: . . 
	ld c,a			;1050	4f 	O 
	ld b,000h		;1051	06 00 	. . 
	ld a,c			;1053	79 	y 
	or a			;1054	b7 	. 
	jp z,0d283h		;1055	ca 83 d2 	. . . 
	ld a,(de)			;1058	1a 	. 
	cp 03fh		;1059	fe 3f 	. ? 
	jp z,0d27ch		;105b	ca 7c d2 	. | . 
	ld a,b			;105e	78 	x 
	cp 00dh		;105f	fe 0d 	. . 
	jp z,0d27ch		;1061	ca 7c d2 	. | . 
	cp 00ch		;1064	fe 0c 	. . 
	ld a,(de)			;1066	1a 	. 
	jp z,0d273h		;1067	ca 73 d2 	. s . 
	sub (hl)			;106a	96 	. 
	and 07fh		;106b	e6 7f 	.  
	jp nz,0d22dh		;106d	c2 2d d2 	. - . 
	jp 0d27ch		;1070	c3 7c d2 	. | . 
	push bc			;1073	c5 	. 
	ld c,(hl)			;1074	4e 	N 
	call 0d207h		;1075	cd 07 d2 	. . . 
	pop bc			;1078	c1 	. 
	jp nz,0d22dh		;1079	c2 2d d2 	. - . 
	inc de			;107c	13 	. 
	inc hl			;107d	23 	# 
	inc b			;107e	04 	. 
	dec c			;107f	0d 	. 
	jp 0d253h		;1080	c3 53 d2 	. S . 
	ld a,(0d8eah)		;1083	3a ea d8 	: . . 
	and 003h		;1086	e6 03 	. . 
	ld (0ce45h),a		;1088	32 45 ce 	2 E . 
	ld hl,0d8d4h		;108b	21 d4 d8 	! . . 
	ld a,(hl)			;108e	7e 	~ 
	rla			;108f	17 	. 
	ret nc			;1090	d0 	. 
	xor a			;1091	af 	. 
	ld (hl),a			;1092	77 	w 
	ret			;1093	c9 	. 
	call 0d0feh		;1094	cd fe d0 	. . . 
	ld a,0ffh		;1097	3e ff 	> . 
	jp 0ce01h		;1099	c3 01 ce 	. . . 
	call 0d054h		;109c	cd 54 d0 	. T . 
	ld c,00ch		;109f	0e 0c 	. . 
	call 0d218h		;10a1	cd 18 d2 	. . . 
	call 0d0f5h		;10a4	cd f5 d0 	. . . 
	ret z			;10a7	c8 	. 
	call 0d044h		;10a8	cd 44 d0 	. D . 
	call 0d05eh		;10ab	cd 5e d0 	. ^ . 
	ld (hl),0e5h		;10ae	36 e5 	6 . 
	ld c,000h		;10b0	0e 00 	. . 
	call 0d16bh		;10b2	cd 6b d1 	. k . 
	call 0d0c6h		;10b5	cd c6 d0 	. . . 
	call 0d22dh		;10b8	cd 2d d2 	. - . 
	jp 0d2a4h		;10bb	c3 a4 d2 	. . . 
	ld d,b			;10be	50 	P 
	ld e,c			;10bf	59 	Y 
	ld a,c			;10c0	79 	y 
	or b			;10c1	b0 	. 
	jp z,0d2d1h		;10c2	ca d1 d2 	. . . 
	dec bc			;10c5	0b 	. 
	push de			;10c6	d5 	. 
	push bc			;10c7	c5 	. 
	call 0d135h		;10c8	cd 35 d1 	. 5 . 
	rra			;10cb	1f 	. 
	jp nc,0d2ech		;10cc	d2 ec d2 	. . . 
	pop bc			;10cf	c1 	. 
	pop de			;10d0	d1 	. 
	ld hl,(0d8c6h)		;10d1	2a c6 d8 	* . . 
	ld a,e			;10d4	7b 	{ 
	sub l			;10d5	95 	. 
	ld a,d			;10d6	7a 	z 
	sbc a,h			;10d7	9c 	. 
	jp nc,0d2f4h		;10d8	d2 f4 d2 	. . . 
	inc de			;10db	13 	. 
	push bc			;10dc	c5 	. 
	push de			;10dd	d5 	. 
	ld b,d			;10de	42 	B 
	ld c,e			;10df	4b 	K 
	call 0d135h		;10e0	cd 35 d1 	. 5 . 
	rra			;10e3	1f 	. 
	jp nc,0d2ech		;10e4	d2 ec d2 	. . . 
	pop de			;10e7	d1 	. 
	pop bc			;10e8	c1 	. 
	jp 0d2c0h		;10e9	c3 c0 d2 	. . . 
	rla			;10ec	17 	. 
	inc a			;10ed	3c 	< 
	call 0d164h		;10ee	cd 64 d1 	. d . 
	pop hl			;10f1	e1 	. 
	pop de			;10f2	d1 	. 
	ret			;10f3	c9 	. 
	ld a,c			;10f4	79 	y 
	or b			;10f5	b0 	. 
	jp nz,0d2c0h		;10f6	c2 c0 d2 	. . . 
	ld hl,l0000h		;10f9	21 00 00 	! . . 
	ret			;10fc	c9 	. 
	ld c,000h		;10fd	0e 00 	. . 
	ld e,020h		;10ff	1e 20 	.   
	push de			;1101	d5 	. 
	ld b,000h		;1102	06 00 	. . 
	ld hl,(0ce43h)		;1104	2a 43 ce 	* C . 
	add hl,bc			;1107	09 	. 
	ex de,hl			;1108	eb 	. 
	call 0d05eh		;1109	cd 5e d0 	. ^ . 
	pop bc			;110c	c1 	. 
	call 0ce4fh		;110d	cd 4f ce 	. O . 
	call 0cec3h		;1110	cd c3 ce 	. . . 
	jp 0d0c6h		;1113	c3 c6 d0 	. . . 
	call 0d054h		;1116	cd 54 d0 	. T . 
	ld c,00ch		;1119	0e 0c 	. . 
	call 0d218h		;111b	cd 18 d2 	. . . 
	ld hl,(0ce43h)		;111e	2a 43 ce 	* C . 
	ld a,(hl)			;1121	7e 	~ 
	ld de,l0010h		;1122	11 10 00 	. . . 
	add hl,de			;1125	19 	. 
	ld (hl),a			;1126	77 	w 
	call 0d0f5h		;1127	cd f5 d0 	. . . 
	ret z			;112a	c8 	. 
	call 0d044h		;112b	cd 44 d0 	. D . 
	ld c,010h		;112e	0e 10 	. . 
	ld e,00ch		;1130	1e 0c 	. . 
	call 0d301h		;1132	cd 01 d3 	. . . 
	call 0d22dh		;1135	cd 2d d2 	. - . 
	jp 0d327h		;1138	c3 27 d3 	. ' . 
	ld c,00ch		;113b	0e 0c 	. . 
	call 0d218h		;113d	cd 18 d2 	. . . 
	call 0d0f5h		;1140	cd f5 d0 	. . . 
	ret z			;1143	c8 	. 
	ld c,000h		;1144	0e 00 	. . 
	ld e,00ch		;1146	1e 0c 	. . 
	call 0d301h		;1148	cd 01 d3 	. . . 
	call 0d22dh		;114b	cd 2d d2 	. - . 
	jp 0d340h		;114e	c3 40 d3 	. @ . 
	ld c,00fh		;1151	0e 0f 	. . 
	call 0d218h		;1153	cd 18 d2 	. . . 
	call 0d0f5h		;1156	cd f5 d0 	. . . 
	ret z			;1159	c8 	. 
	call 0cfa6h		;115a	cd a6 cf 	. . . 
	ld a,(hl)			;115d	7e 	~ 
	push af			;115e	f5 	. 
	push hl			;115f	e5 	. 
	call 0d05eh		;1160	cd 5e d0 	. ^ . 
	ex de,hl			;1163	eb 	. 
	ld hl,(0ce43h)		;1164	2a 43 ce 	* C . 
	ld c,020h		;1167	0e 20 	.   
	push de			;1169	d5 	. 
	call 0ce4fh		;116a	cd 4f ce 	. O . 
	call 0d078h		;116d	cd 78 d0 	. x . 
	pop de			;1170	d1 	. 
	ld hl,l000ch		;1171	21 0c 00 	! . . 
	add hl,de			;1174	19 	. 
	ld c,(hl)			;1175	4e 	N 
	ld hl,l000fh		;1176	21 0f 00 	! . . 
	add hl,de			;1179	19 	. 
	ld b,(hl)			;117a	46 	F 
	pop hl			;117b	e1 	. 
	pop af			;117c	f1 	. 
	ld (hl),a			;117d	77 	w 
	ld a,c			;117e	79 	y 
	cp (hl)			;117f	be 	. 
	ld a,b			;1180	78 	x 
	jp z,0d38bh		;1181	ca 8b d3 	. . . 
	ld a,000h		;1184	3e 00 	> . 
	jp c,0d38bh		;1186	da 8b d3 	. . . 
	ld a,080h		;1189	3e 80 	> . 
	ld hl,(0ce43h)		;118b	2a 43 ce 	* C . 
	ld de,l000fh		;118e	11 0f 00 	. . . 
	add hl,de			;1191	19 	. 
	ld (hl),a			;1192	77 	w 
	ret			;1193	c9 	. 
	ld a,(hl)			;1194	7e 	~ 
	inc hl			;1195	23 	# 
	or (hl)			;1196	b6 	. 
	dec hl			;1197	2b 	+ 
	ret nz			;1198	c0 	. 
	ld a,(de)			;1199	1a 	. 
	ld (hl),a			;119a	77 	w 
	inc de			;119b	13 	. 
	inc hl			;119c	23 	# 
	ld a,(de)			;119d	1a 	. 
	ld (hl),a			;119e	77 	w 
	dec de			;119f	1b 	. 
	dec hl			;11a0	2b 	+ 
	ret			;11a1	c9 	. 
	xor a			;11a2	af 	. 
	ld (0ce45h),a		;11a3	32 45 ce 	2 E . 
	ld (0d8eah),a		;11a6	32 ea d8 	2 . . 
	ld (0d8ebh),a		;11a9	32 eb d8 	2 . . 
	call 0d01eh		;11ac	cd 1e d0 	. . . 
	ret nz			;11af	c0 	. 
	call 0d069h		;11b0	cd 69 d0 	. i . 
	and 080h		;11b3	e6 80 	. . 
	ret nz			;11b5	c0 	. 
	ld c,00fh		;11b6	0e 0f 	. . 
	call 0d218h		;11b8	cd 18 d2 	. . . 
	call 0d0f5h		;11bb	cd f5 d0 	. . . 
	ret z			;11be	c8 	. 
	ld bc,l0010h		;11bf	01 10 00 	. . . 
	call 0d05eh		;11c2	cd 5e d0 	. ^ . 
	add hl,bc			;11c5	09 	. 
	ex de,hl			;11c6	eb 	. 
	ld hl,(0ce43h)		;11c7	2a 43 ce 	* C . 
	add hl,bc			;11ca	09 	. 
	ld c,010h		;11cb	0e 10 	. . 
	ld a,(0d8ddh)		;11cd	3a dd d8 	: . . 
	or a			;11d0	b7 	. 
	jp z,0d3e8h		;11d1	ca e8 d3 	. . . 
	ld a,(hl)			;11d4	7e 	~ 
	or a			;11d5	b7 	. 
	ld a,(de)			;11d6	1a 	. 
	jp nz,0d3dbh		;11d7	c2 db d3 	. . . 
	ld (hl),a			;11da	77 	w 
	or a			;11db	b7 	. 
	jp nz,0d3e1h		;11dc	c2 e1 d3 	. . . 
	ld a,(hl)			;11df	7e 	~ 
	ld (de),a			;11e0	12 	. 
	cp (hl)			;11e1	be 	. 
	jp nz,0d41fh		;11e2	c2 1f d4 	. . . 
	jp 0d3fdh		;11e5	c3 fd d3 	. . . 
	call 0d394h		;11e8	cd 94 d3 	. . . 
	ex de,hl			;11eb	eb 	. 
	call 0d394h		;11ec	cd 94 d3 	. . . 
	ex de,hl			;11ef	eb 	. 
	ld a,(de)			;11f0	1a 	. 
	cp (hl)			;11f1	be 	. 
	jp nz,0d41fh		;11f2	c2 1f d4 	. . . 
	inc de			;11f5	13 	. 
	inc hl			;11f6	23 	# 
	ld a,(de)			;11f7	1a 	. 
	cp (hl)			;11f8	be 	. 
	jp nz,0d41fh		;11f9	c2 1f d4 	. . . 
	dec c			;11fc	0d 	. 
	inc de			;11fd	13 	. 
	inc hl			;11fe	23 	# 
	dec c			;11ff	0d 	. 
	jp nz,0d3cdh		;1200	c2 cd d3 	. . . 
	ld bc,0ffech		;1203	01 ec ff 	. . . 
	add hl,bc			;1206	09 	. 
	ex de,hl			;1207	eb 	. 
	add hl,bc			;1208	09 	. 
	ld a,(de)			;1209	1a 	. 
	cp (hl)			;120a	be 	. 
	jp c,0d417h		;120b	da 17 d4 	. . . 
	ld (hl),a			;120e	77 	w 
	ld bc,l0003h		;120f	01 03 00 	. . . 
	add hl,bc			;1212	09 	. 
	ex de,hl			;1213	eb 	. 
	add hl,bc			;1214	09 	. 
	ld a,(hl)			;1215	7e 	~ 
	ld (de),a			;1216	12 	. 
	ld a,0ffh		;1217	3e ff 	> . 
	ld (0d8d2h),a		;1219	32 d2 d8 	2 . . 
	jp 0d310h		;121c	c3 10 d3 	. . . 
	ld hl,0ce45h		;121f	21 45 ce 	! E . 
	dec (hl)			;1222	35 	5 
	ret			;1223	c9 	. 
	call 0d054h		;1224	cd 54 d0 	. T . 
	ld hl,(0ce43h)		;1227	2a 43 ce 	* C . 
	push hl			;122a	e5 	. 
	ld hl,0d8ach		;122b	21 ac d8 	! . . 
	ld (0ce43h),hl		;122e	22 43 ce 	" C . 
	ld c,001h		;1231	0e 01 	. . 
	call 0d218h		;1233	cd 18 d2 	. . . 
	call 0d0f5h		;1236	cd f5 d0 	. . . 
	pop hl			;1239	e1 	. 
	ld (0ce43h),hl		;123a	22 43 ce 	" C . 
	ret z			;123d	c8 	. 
	ex de,hl			;123e	eb 	. 
	ld hl,l000fh		;123f	21 0f 00 	! . . 
	add hl,de			;1242	19 	. 
	ld c,011h		;1243	0e 11 	. . 
	xor a			;1245	af 	. 
	ld (hl),a			;1246	77 	w 
	inc hl			;1247	23 	# 
	dec c			;1248	0d 	. 
	jp nz,0d446h		;1249	c2 46 d4 	. F . 
	ld hl,l000ch+1		;124c	21 0d 00 	! . . 
	add hl,de			;124f	19 	. 
	ld (hl),a			;1250	77 	w 
	call 0d08ch		;1251	cd 8c d0 	. . . 
	call 0d2fdh		;1254	cd fd d2 	. . . 
	jp 0d078h		;1257	c3 78 d0 	. x . 
	xor a			;125a	af 	. 
	ld (0d8d2h),a		;125b	32 d2 d8 	2 . . 
	call 0d3a2h		;125e	cd a2 d3 	. . . 
	call 0d0f5h		;1261	cd f5 d0 	. . . 
	ret z			;1264	c8 	. 
	ld hl,(0ce43h)		;1265	2a 43 ce 	* C . 
	ld bc,l000ch		;1268	01 0c 00 	. . . 
	add hl,bc			;126b	09 	. 
	ld a,(hl)			;126c	7e 	~ 
	inc a			;126d	3c 	< 
	and 01fh		;126e	e6 1f 	. . 
	ld (hl),a			;1270	77 	w 
	jp z,0d483h		;1271	ca 83 d4 	. . . 
	ld b,a			;1274	47 	G 
	ld a,(0d8c5h)		;1275	3a c5 d8 	: . . 
	and b			;1278	a0 	. 
	ld hl,0d8d2h		;1279	21 d2 d8 	! . . 
	and (hl)			;127c	a6 	. 
	jp z,0d48eh		;127d	ca 8e d4 	. . . 
	jp 0d4ach		;1280	c3 ac d4 	. . . 
	ld bc,l0000h+2		;1283	01 02 00 	. . . 
	add hl,bc			;1286	09 	. 
	inc (hl)			;1287	34 	4 
	ld a,(hl)			;1288	7e 	~ 
	and 00fh		;1289	e6 0f 	. . 
	jp z,0d4b6h		;128b	ca b6 d4 	. . . 
	ld c,00fh		;128e	0e 0f 	. . 
	call 0d218h		;1290	cd 18 d2 	. . . 
	call 0d0f5h		;1293	cd f5 d0 	. . . 
	jp nz,0d4ach		;1296	c2 ac d4 	. . . 
	ld a,(0d8d3h)		;1299	3a d3 d8 	: . . 
	inc a			;129c	3c 	< 
	jp z,0d4b6h		;129d	ca b6 d4 	. . . 
	call 0d424h		;12a0	cd 24 d4 	. $ . 
	call 0d0f5h		;12a3	cd f5 d0 	. . . 
	jp z,0d4b6h		;12a6	ca b6 d4 	. . . 
	jp 0d4afh		;12a9	c3 af d4 	. . . 
	call 0d35ah		;12ac	cd 5a d3 	. Z . 
	call 0cfbbh		;12af	cd bb cf 	. . . 
	xor a			;12b2	af 	. 
	jp 0ce01h		;12b3	c3 01 ce 	. . . 
	call 0ce05h		;12b6	cd 05 ce 	. . . 
	jp 0d078h		;12b9	c3 78 d0 	. x . 
	ld a,001h		;12bc	3e 01 	> . 
	ld (0d8d5h),a		;12be	32 d5 d8 	2 . . 
	ld a,0ffh		;12c1	3e ff 	> . 
	ld (0d8d3h),a		;12c3	32 d3 d8 	2 . . 
	call 0cfbbh		;12c6	cd bb cf 	. . . 
	ld a,(0d8e3h)		;12c9	3a e3 d8 	: . . 
	ld hl,0d8e1h		;12cc	21 e1 d8 	! . . 
	cp (hl)			;12cf	be 	. 
	jp c,0d4e6h		;12d0	da e6 d4 	. . . 
	cp 080h		;12d3	fe 80 	. . 
	jp nz,0d4fbh		;12d5	c2 fb d4 	. . . 
	call 0d45ah		;12d8	cd 5a d4 	. Z . 
	xor a			;12db	af 	. 
	ld (0d8e3h),a		;12dc	32 e3 d8 	2 . . 
	ld a,(0ce45h)		;12df	3a 45 ce 	: E . 
	or a			;12e2	b7 	. 
	jp nz,0d4fbh		;12e3	c2 fb d4 	. . . 
	call 0cf77h		;12e6	cd 77 cf 	. w . 
	call 0cf84h		;12e9	cd 84 cf 	. . . 
	jp z,0d4fbh		;12ec	ca fb d4 	. . . 
	call 0cf8ah		;12ef	cd 8a cf 	. . . 
	call 0ced1h		;12f2	cd d1 ce 	. . . 
	call 0ceb2h		;12f5	cd b2 ce 	. . . 
	jp 0cfd2h		;12f8	c3 d2 cf 	. . . 
	jp 0ce05h		;12fb	c3 05 ce 	. . . 
	ld a,001h		;12fe	3e 01 	> . 
	ld (0d8d5h),a		;1300	32 d5 d8 	2 . . 
	ld a,000h		;1303	3e 00 	> . 
	ld (0d8d3h),a		;1305	32 d3 d8 	2 . . 
	call 0d054h		;1308	cd 54 d0 	. T . 
	ld hl,(0ce43h)		;130b	2a 43 ce 	* C . 
	call 0d047h		;130e	cd 47 d0 	. G . 
	call 0cfbbh		;1311	cd bb cf 	. . . 
	ld a,(0d8e3h)		;1314	3a e3 d8 	: . . 
	cp 080h		;1317	fe 80 	. . 
	jp nc,0ce05h		;1319	d2 05 ce 	. . . 
	call 0cf77h		;131c	cd 77 cf 	. w . 
	call 0cf84h		;131f	cd 84 cf 	. . . 
	ld c,000h		;1322	0e 00 	. . 
	jp nz,0d56eh		;1324	c2 6e d5 	. n . 
	call 0cf3eh		;1327	cd 3e cf 	. > . 
	ld (0d8d7h),a		;132a	32 d7 d8 	2 . . 
	ld bc,l0000h		;132d	01 00 00 	. . . 
	or a			;1330	b7 	. 
	jp z,0d53bh		;1331	ca 3b d5 	. ; . 
	ld c,a			;1334	4f 	O 
	dec bc			;1335	0b 	. 
	call 0cf5eh		;1336	cd 5e cf 	. ^ . 
	ld b,h			;1339	44 	D 
	ld c,l			;133a	4d 	M 
	call 0d2beh		;133b	cd be d2 	. . . 
	ld a,l			;133e	7d 	} 
	or h			;133f	b4 	. 
	jp nz,0d548h		;1340	c2 48 d5 	. H . 
	ld a,002h		;1343	3e 02 	> . 
	jp 0ce01h		;1345	c3 01 ce 	. . . 
	ld (0d8e5h),hl		;1348	22 e5 d8 	" . . 
	ex de,hl			;134b	eb 	. 
	ld hl,(0ce43h)		;134c	2a 43 ce 	* C . 
	ld bc,l0010h		;134f	01 10 00 	. . . 
	add hl,bc			;1352	09 	. 
	ld a,(0d8ddh)		;1353	3a dd d8 	: . . 
	or a			;1356	b7 	. 
	ld a,(0d8d7h)		;1357	3a d7 d8 	: . . 
	jp z,0d564h		;135a	ca 64 d5 	. d . 
	call 0d064h		;135d	cd 64 d0 	. d . 
	ld (hl),e			;1360	73 	s 
	jp 0d56ch		;1361	c3 6c d5 	. l . 
	ld c,a			;1364	4f 	O 
	ld b,000h		;1365	06 00 	. . 
	add hl,bc			;1367	09 	. 
	add hl,bc			;1368	09 	. 
	ld (hl),e			;1369	73 	s 
	inc hl			;136a	23 	# 
	ld (hl),d			;136b	72 	r 
	ld c,002h		;136c	0e 02 	. . 
	ld a,(0ce45h)		;136e	3a 45 ce 	: E . 
	or a			;1371	b7 	. 
	ret nz			;1372	c0 	. 
	push bc			;1373	c5 	. 
	call 0cf8ah		;1374	cd 8a cf 	. . . 
	ld a,(0d8d5h)		;1377	3a d5 d8 	: . . 
	dec a			;137a	3d 	= 
	dec a			;137b	3d 	= 
	jp nz,0d5bbh		;137c	c2 bb d5 	. . . 
	pop bc			;137f	c1 	. 
	push bc			;1380	c5 	. 
	ld a,c			;1381	79 	y 
	dec a			;1382	3d 	= 
	dec a			;1383	3d 	= 
	jp nz,0d5bbh		;1384	c2 bb d5 	. . . 
	push hl			;1387	e5 	. 
	ld hl,(0d8b9h)		;1388	2a b9 d8 	* . . 
	ld d,a			;138b	57 	W 
	ld (hl),a			;138c	77 	w 
	inc hl			;138d	23 	# 
	inc d			;138e	14 	. 
	jp p,0d58ch		;138f	f2 8c d5 	. . . 
	call 0d0e0h		;1392	cd e0 d0 	. . . 
	ld hl,(0d8e7h)		;1395	2a e7 d8 	* . . 
	ld c,002h		;1398	0e 02 	. . 
	ld (0d8e5h),hl		;139a	22 e5 d8 	" . . 
	push bc			;139d	c5 	. 
	call 0ced1h		;139e	cd d1 ce 	. . . 
	pop bc			;13a1	c1 	. 
	call 0ceb8h		;13a2	cd b8 ce 	. . . 
	ld hl,(0d8e5h)		;13a5	2a e5 d8 	* . . 
	ld c,000h		;13a8	0e 00 	. . 
	ld a,(0d8c4h)		;13aa	3a c4 d8 	: . . 
	ld b,a			;13ad	47 	G 
	and l			;13ae	a5 	. 
	cp b			;13af	b8 	. 
	inc hl			;13b0	23 	# 
	jp nz,0d59ah		;13b1	c2 9a d5 	. . . 
	pop hl			;13b4	e1 	. 
	ld (0d8e5h),hl		;13b5	22 e5 d8 	" . . 
	call 0d0dah		;13b8	cd da d0 	. . . 
	call 0ced1h		;13bb	cd d1 ce 	. . . 
	pop bc			;13be	c1 	. 
	push bc			;13bf	c5 	. 
	call 0ceb8h		;13c0	cd b8 ce 	. . . 
	pop bc			;13c3	c1 	. 
	ld a,(0d8e3h)		;13c4	3a e3 d8 	: . . 
	ld hl,0d8e1h		;13c7	21 e1 d8 	! . . 
	cp (hl)			;13ca	be 	. 
	jp c,0d5d2h		;13cb	da d2 d5 	. . . 
	ld (hl),a			;13ce	77 	w 
	inc (hl)			;13cf	34 	4 
	ld c,002h		;13d0	0e 02 	. . 
	dec c			;13d2	0d 	. 
	dec c			;13d3	0d 	. 
	jp nz,0d5dfh		;13d4	c2 df d5 	. . . 
	push af			;13d7	f5 	. 
	call 0d069h		;13d8	cd 69 d0 	. i . 
	and 07fh		;13db	e6 7f 	.  
	ld (hl),a			;13dd	77 	w 
	pop af			;13de	f1 	. 
	cp 07fh		;13df	fe 7f 	.  
	jp nz,0d600h		;13e1	c2 00 d6 	. . . 
	ld a,(0d8d5h)		;13e4	3a d5 d8 	: . . 
	cp 001h		;13e7	fe 01 	. . 
	jp nz,0d600h		;13e9	c2 00 d6 	. . . 
	call 0cfd2h		;13ec	cd d2 cf 	. . . 
	call 0d45ah		;13ef	cd 5a d4 	. Z . 
	ld hl,0ce45h		;13f2	21 45 ce 	! E . 
	ld a,(hl)			;13f5	7e 	~ 
	or a			;13f6	b7 	. 
	jp nz,0d5feh		;13f7	c2 fe d5 	. . . 
	dec a			;13fa	3d 	= 
	ld (0d8e3h),a		;13fb	32 e3 d8 	2 . . 
	ld (hl),000h		;13fe	36 00 	6 . 
	jp 0cfd2h		;1400	c3 d2 cf 	. . . 
	xor a			;1403	af 	. 
	ld (0d8d5h),a		;1404	32 d5 d8 	2 . . 
	push bc			;1407	c5 	. 
	ld hl,(0ce43h)		;1408	2a 43 ce 	* C . 
	ex de,hl			;140b	eb 	. 
	ld hl,l0020h+1		;140c	21 21 00 	! ! . 
	add hl,de			;140f	19 	. 
	ld a,(hl)			;1410	7e 	~ 
	and 07fh		;1411	e6 7f 	.  
	push af			;1413	f5 	. 
	ld a,(hl)			;1414	7e 	~ 
	rla			;1415	17 	. 
	inc hl			;1416	23 	# 
	ld a,(hl)			;1417	7e 	~ 
	rla			;1418	17 	. 
	and 01fh		;1419	e6 1f 	. . 
	ld c,a			;141b	4f 	O 
	ld a,(hl)			;141c	7e 	~ 
	rra			;141d	1f 	. 
	rra			;141e	1f 	. 
	rra			;141f	1f 	. 
	rra			;1420	1f 	. 
	and 00fh		;1421	e6 0f 	. . 
	ld b,a			;1423	47 	G 
	pop af			;1424	f1 	. 
	inc hl			;1425	23 	# 
	ld l,(hl)			;1426	6e 	n 
	inc l			;1427	2c 	, 
	dec l			;1428	2d 	- 
	ld l,006h		;1429	2e 06 	. . 
	jp nz,0d68bh		;142b	c2 8b d6 	. . . 
	ld hl,l0020h		;142e	21 20 00 	!   . 
	add hl,de			;1431	19 	. 
	ld (hl),a			;1432	77 	w 
	ld hl,l000ch		;1433	21 0c 00 	! . . 
	add hl,de			;1436	19 	. 
	ld a,c			;1437	79 	y 
	sub (hl)			;1438	96 	. 
	jp nz,0d647h		;1439	c2 47 d6 	. G . 
	ld hl,l000ch+2		;143c	21 0e 00 	! . . 
	add hl,de			;143f	19 	. 
	ld a,b			;1440	78 	x 
	sub (hl)			;1441	96 	. 
	and 07fh		;1442	e6 7f 	.  
	jp z,0d67fh		;1444	ca 7f d6 	.  . 
	push bc			;1447	c5 	. 
	push de			;1448	d5 	. 
	call 0d3a2h		;1449	cd a2 d3 	. . . 
	pop de			;144c	d1 	. 
	pop bc			;144d	c1 	. 
	ld l,003h		;144e	2e 03 	. . 
	ld a,(0ce45h)		;1450	3a 45 ce 	: E . 
	inc a			;1453	3c 	< 
	jp z,0d684h		;1454	ca 84 d6 	. . . 
	ld hl,l000ch		;1457	21 0c 00 	! . . 
	add hl,de			;145a	19 	. 
	ld (hl),c			;145b	71 	q 
	ld hl,l000ch+2		;145c	21 0e 00 	! . . 
	add hl,de			;145f	19 	. 
	ld (hl),b			;1460	70 	p 
	call 0d351h		;1461	cd 51 d3 	. Q . 
	ld a,(0ce45h)		;1464	3a 45 ce 	: E . 
	inc a			;1467	3c 	< 
	jp nz,0d67fh		;1468	c2 7f d6 	.  . 
	pop bc			;146b	c1 	. 
	push bc			;146c	c5 	. 
	ld l,004h		;146d	2e 04 	. . 
	inc c			;146f	0c 	. 
	jp z,0d684h		;1470	ca 84 d6 	. . . 
	call 0d424h		;1473	cd 24 d4 	. $ . 
	ld l,005h		;1476	2e 05 	. . 
	ld a,(0ce45h)		;1478	3a 45 ce 	: E . 
	inc a			;147b	3c 	< 
	jp z,0d684h		;147c	ca 84 d6 	. . . 
	pop bc			;147f	c1 	. 
	xor a			;1480	af 	. 
	jp 0ce01h		;1481	c3 01 ce 	. . . 
	push hl			;1484	e5 	. 
	call 0d069h		;1485	cd 69 d0 	. i . 
	ld (hl),0c0h		;1488	36 c0 	6 . 
	pop hl			;148a	e1 	. 
	pop bc			;148b	c1 	. 
	ld a,l			;148c	7d 	} 
	ld (0ce45h),a		;148d	32 45 ce 	2 E . 
	jp 0d078h		;1490	c3 78 d0 	. x . 
	ld c,0ffh		;1493	0e ff 	. . 
	call 0d603h		;1495	cd 03 d6 	. . . 
	call z,0d4c1h		;1498	cc c1 d4 	. . . 
	ret			;149b	c9 	. 
	ld c,000h		;149c	0e 00 	. . 
	call 0d603h		;149e	cd 03 d6 	. . . 
	call z,0d503h		;14a1	cc 03 d5 	. . . 
	ret			;14a4	c9 	. 
	ex de,hl			;14a5	eb 	. 
	add hl,de			;14a6	19 	. 
	ld c,(hl)			;14a7	4e 	N 
	ld b,000h		;14a8	06 00 	. . 
	ld hl,l000ch		;14aa	21 0c 00 	! . . 
	add hl,de			;14ad	19 	. 
	ld a,(hl)			;14ae	7e 	~ 
	rrca			;14af	0f 	. 
	and 080h		;14b0	e6 80 	. . 
	add a,c			;14b2	81 	. 
	ld c,a			;14b3	4f 	O 
	ld a,000h		;14b4	3e 00 	> . 
	adc a,b			;14b6	88 	. 
	ld b,a			;14b7	47 	G 
	ld a,(hl)			;14b8	7e 	~ 
	rrca			;14b9	0f 	. 
	and 00fh		;14ba	e6 0f 	. . 
	add a,b			;14bc	80 	. 
	ld b,a			;14bd	47 	G 
	ld hl,l000ch+2		;14be	21 0e 00 	! . . 
	add hl,de			;14c1	19 	. 
	ld a,(hl)			;14c2	7e 	~ 
	add a,a			;14c3	87 	. 
	add a,a			;14c4	87 	. 
	add a,a			;14c5	87 	. 
	add a,a			;14c6	87 	. 
	push af			;14c7	f5 	. 
	add a,b			;14c8	80 	. 
	ld b,a			;14c9	47 	G 
	push af			;14ca	f5 	. 
	pop hl			;14cb	e1 	. 
	ld a,l			;14cc	7d 	} 
	pop hl			;14cd	e1 	. 
	or l			;14ce	b5 	. 
	and 001h		;14cf	e6 01 	. . 
	ret			;14d1	c9 	. 
	ld c,00ch		;14d2	0e 0c 	. . 
	call 0d218h		;14d4	cd 18 d2 	. . . 
	ld hl,(0ce43h)		;14d7	2a 43 ce 	* C . 
	ld de,l0020h+1		;14da	11 21 00 	. ! . 
	add hl,de			;14dd	19 	. 
	push hl			;14de	e5 	. 
	ld (hl),d			;14df	72 	r 
	inc hl			;14e0	23 	# 
	ld (hl),d			;14e1	72 	r 
	inc hl			;14e2	23 	# 
	ld (hl),d			;14e3	72 	r 
	call 0d0f5h		;14e4	cd f5 d0 	. . . 
	jp z,0d70ch		;14e7	ca 0c d7 	. . . 
	call 0d05eh		;14ea	cd 5e d0 	. ^ . 
	ld de,l000fh		;14ed	11 0f 00 	. . . 
	call 0d6a5h		;14f0	cd a5 d6 	. . . 
	pop hl			;14f3	e1 	. 
	push hl			;14f4	e5 	. 
	ld e,a			;14f5	5f 	_ 
	ld a,c			;14f6	79 	y 
	sub (hl)			;14f7	96 	. 
	inc hl			;14f8	23 	# 
	ld a,b			;14f9	78 	x 
	sbc a,(hl)			;14fa	9e 	. 
	inc hl			;14fb	23 	# 
	ld a,e			;14fc	7b 	{ 
	sbc a,(hl)			;14fd	9e 	. 
	jp c,0d706h		;14fe	da 06 d7 	. . . 
	ld (hl),e			;1501	73 	s 
	dec hl			;1502	2b 	+ 
	ld (hl),b			;1503	70 	p 
	dec hl			;1504	2b 	+ 
	ld (hl),c			;1505	71 	q 
	call 0d22dh		;1506	cd 2d d2 	. - . 
	jp 0d6e4h		;1509	c3 e4 d6 	. . . 
	pop hl			;150c	e1 	. 
	ret			;150d	c9 	. 
	ld hl,(0ce43h)		;150e	2a 43 ce 	* C . 
	ld de,l0020h		;1511	11 20 00 	.   . 
	call 0d6a5h		;1514	cd a5 d6 	. . . 
	ld hl,l0020h+1		;1517	21 21 00 	! ! . 
	add hl,de			;151a	19 	. 
	ld (hl),c			;151b	71 	q 
	inc hl			;151c	23 	# 
	ld (hl),b			;151d	70 	p 
	inc hl			;151e	23 	# 
	ld (hl),a			;151f	77 	w 
	ret			;1520	c9 	. 
	ld hl,(0d8afh)		;1521	2a af d8 	* . . 
	ld a,(0ce42h)		;1524	3a 42 ce 	: B . 
	ld c,a			;1527	4f 	O 
	call 0cfeah		;1528	cd ea cf 	. . . 
	push hl			;152b	e5 	. 
	ex de,hl			;152c	eb 	. 
	call 0ce59h		;152d	cd 59 ce 	. Y . 
	pop hl			;1530	e1 	. 
	call z,0ce47h		;1531	cc 47 ce 	. G . 
	ld a,l			;1534	7d 	} 
	rra			;1535	1f 	. 
	ret c			;1536	d8 	. 
	ld hl,(0d8afh)		;1537	2a af d8 	* . . 
	ld c,l			;153a	4d 	M 
	ld b,h			;153b	44 	D 
	call 0d00bh		;153c	cd 0b d0 	. . . 
	ld (0d8afh),hl		;153f	22 af d8 	" . . 
	jp 0d1a3h		;1542	c3 a3 d1 	. . . 
	ld a,(0d8d6h)		;1545	3a d6 d8 	: . . 
	ld hl,0ce42h		;1548	21 42 ce 	! B . 
	cp (hl)			;154b	be 	. 
	ret z			;154c	c8 	. 
	ld (hl),a			;154d	77 	w 
	jp 0d721h		;154e	c3 21 d7 	. ! . 
	ld a,0ffh		;1551	3e ff 	> . 
	ld (0d8deh),a		;1553	32 de d8 	2 . . 
	ld hl,(0ce43h)		;1556	2a 43 ce 	* C . 
	ld a,(hl)			;1559	7e 	~ 
	and 01fh		;155a	e6 1f 	. . 
	dec a			;155c	3d 	= 
	ld (0d8d6h),a		;155d	32 d6 d8 	2 . . 
	cp 01eh		;1560	fe 1e 	. . 
	jp nc,0d775h		;1562	d2 75 d7 	. u . 
	ld a,(0ce42h)		;1565	3a 42 ce 	: B . 
	ld (0d8dfh),a		;1568	32 df d8 	2 . . 
	ld a,(hl)			;156b	7e 	~ 
	ld (0d8e0h),a		;156c	32 e0 d8 	2 . . 
	and 0e0h		;156f	e6 e0 	. . 
	ld (hl),a			;1571	77 	w 
	call 0d745h		;1572	cd 45 d7 	. E . 
	ld a,(0ce41h)		;1575	3a 41 ce 	: A . 
	ld hl,(0ce43h)		;1578	2a 43 ce 	* C . 
	or (hl)			;157b	b6 	. 
	ld (hl),a			;157c	77 	w 
	ret			;157d	c9 	. 
	ld a,022h		;157e	3e 22 	> " 
	jp 0ce01h		;1580	c3 01 ce 	. . . 
	ld hl,l0000h		;1583	21 00 00 	! . . 
	ld (0d8adh),hl		;1586	22 ad d8 	" . . 
	ld (0d8afh),hl		;1589	22 af d8 	" . . 
	xor a			;158c	af 	. 
	ld (0ce42h),a		;158d	32 42 ce 	2 B . 
	ld hl,00080h		;1590	21 80 00 	! . . 
	ld (0d8b1h),hl		;1593	22 b1 d8 	" . . 
	call 0d0dah		;1596	cd da d0 	. . . 
	jp 0d721h		;1599	c3 21 d7 	. ! . 
	call 0d072h		;159c	cd 72 d0 	. r . 
	call 0d751h		;159f	cd 51 d7 	. Q . 
	jp 0d351h		;15a2	c3 51 d3 	. Q . 
	call 0d751h		;15a5	cd 51 d7 	. Q . 
	jp 0d3a2h		;15a8	c3 a2 d3 	. . . 
	ld c,000h		;15ab	0e 00 	. . 
	ex de,hl			;15ad	eb 	. 
	ld a,(hl)			;15ae	7e 	~ 
	cp 03fh		;15af	fe 3f 	. ? 
	jp z,0d7c2h		;15b1	ca c2 d7 	. . . 
	call 0cfa6h		;15b4	cd a6 cf 	. . . 
	ld a,(hl)			;15b7	7e 	~ 
	cp 03fh		;15b8	fe 3f 	. ? 
	call nz,0d072h		;15ba	c4 72 d0 	. r . 
	call 0d751h		;15bd	cd 51 d7 	. Q . 
	ld c,00fh		;15c0	0e 0f 	. . 
	call 0d218h		;15c2	cd 18 d2 	. . . 
	jp 0d0e9h		;15c5	c3 e9 d0 	. . . 
	ld hl,(0d8d9h)		;15c8	2a d9 d8 	* . . 
	ld (0ce43h),hl		;15cb	22 43 ce 	" C . 
	call 0d751h		;15ce	cd 51 d7 	. Q . 
	call 0d22dh		;15d1	cd 2d d2 	. - . 
	jp 0d0e9h		;15d4	c3 e9 d0 	. . . 
	call 0d751h		;15d7	cd 51 d7 	. Q . 
	call 0d29ch		;15da	cd 9c d2 	. . . 
	jp 0d201h		;15dd	c3 01 d2 	. . . 
	call 0d751h		;15e0	cd 51 d7 	. Q . 
	jp 0d4bch		;15e3	c3 bc d4 	. . . 
	call 0d751h		;15e6	cd 51 d7 	. Q . 
	jp 0d4feh		;15e9	c3 fe d4 	. . . 
	call 0d072h		;15ec	cd 72 d0 	. r . 
	call 0d751h		;15ef	cd 51 d7 	. Q . 
	jp 0d424h		;15f2	c3 24 d4 	. $ . 
	call 0d751h		;15f5	cd 51 d7 	. Q . 
	call 0d316h		;15f8	cd 16 d3 	. . . 
	jp 0d201h		;15fb	c3 01 d2 	. . . 
	ld hl,(0d8afh)		;15fe	2a af d8 	* . . 
	jp 0d829h		;1601	c3 29 d8 	. ) . 
	ld a,(0ce42h)		;1604	3a 42 ce 	: B . 
	jp 0ce01h		;1607	c3 01 ce 	. . . 
	ex de,hl			;160a	eb 	. 
	ld (0d8b1h),hl		;160b	22 b1 d8 	" . . 
	jp 0d0dah		;160e	c3 da d0 	. . . 
	ld hl,(0d8bfh)		;1611	2a bf d8 	* . . 
	jp 0d829h		;1614	c3 29 d8 	. ) . 
	ld hl,(0d8adh)		;1617	2a ad d8 	* . . 
	jp 0d829h		;161a	c3 29 d8 	. ) . 
	call 0d751h		;161d	cd 51 d7 	. Q . 
	call 0d33bh		;1620	cd 3b d3 	. ; . 
	jp 0d201h		;1623	c3 01 d2 	. . . 
	ld hl,(0d8bbh)		;1626	2a bb d8 	* . . 
	ld (0ce45h),hl		;1629	22 45 ce 	" E . 
	ret			;162c	c9 	. 
	ld a,(0d8d6h)		;162d	3a d6 d8 	: . . 
	cp 0ffh		;1630	fe ff 	. . 
	jp nz,0d83bh		;1632	c2 3b d8 	. ; . 
	ld a,(0ce41h)		;1635	3a 41 ce 	: A . 
	jp 0ce01h		;1638	c3 01 ce 	. . . 
	and 01fh		;163b	e6 1f 	. . 
	ld (0ce41h),a		;163d	32 41 ce 	2 A . 
	ret			;1640	c9 	. 
	call 0d751h		;1641	cd 51 d7 	. Q . 
	jp 0d693h		;1644	c3 93 d6 	. . . 
	call 0d751h		;1647	cd 51 d7 	. Q . 
	jp 0d69ch		;164a	c3 9c d6 	. . . 
	call 0d751h		;164d	cd 51 d7 	. Q . 
	jp 0d6d2h		;1650	c3 d2 d6 	. . . 
	ld hl,(0ce43h)		;1653	2a 43 ce 	* C . 
	ld a,l			;1656	7d 	} 
	cpl			;1657	2f 	/ 
	ld e,a			;1658	5f 	_ 
	ld a,h			;1659	7c 	| 
	cpl			;165a	2f 	/ 
	ld hl,(0d8afh)		;165b	2a af d8 	* . . 
	and h			;165e	a4 	. 
	ld d,a			;165f	57 	W 
	ld a,l			;1660	7d 	} 
	and e			;1661	a3 	. 
	ld e,a			;1662	5f 	_ 
	ld hl,(0d8adh)		;1663	2a ad d8 	* . . 
	ex de,hl			;1666	eb 	. 
	ld (0d8afh),hl		;1667	22 af d8 	" . . 
	ld a,l			;166a	7d 	} 
	and e			;166b	a3 	. 
	ld l,a			;166c	6f 	o 
	ld a,h			;166d	7c 	| 
	and d			;166e	a2 	. 
	ld h,a			;166f	67 	g 
	ld (0d8adh),hl		;1670	22 ad d8 	" . . 
	ret			;1673	c9 	. 
	ld a,(0d8deh)		;1674	3a de d8 	: . . 
	or a			;1677	b7 	. 
	jp z,0d891h		;1678	ca 91 d8 	. . . 
	ld hl,(0ce43h)		;167b	2a 43 ce 	* C . 
	ld (hl),000h		;167e	36 00 	6 . 
	ld a,(0d8e0h)		;1680	3a e0 d8 	: . . 
	or a			;1683	b7 	. 
	jp z,0d891h		;1684	ca 91 d8 	. . . 
	ld (hl),a			;1687	77 	w 
	ld a,(0d8dfh)		;1688	3a df d8 	: . . 
	ld (0d8d6h),a		;168b	32 d6 d8 	2 . . 
	call 0d745h		;168e	cd 45 d7 	. E . 
	ld hl,(0ce0fh)		;1691	2a 0f ce 	* . . 
	ld sp,hl			;1694	f9 	. 
	ld hl,(0ce45h)		;1695	2a 45 ce 	* E . 
	ld a,l			;1698	7d 	} 
	ld b,h			;1699	44 	D 
	ret			;169a	c9 	. 
	call 0d751h		;169b	cd 51 d7 	. Q . 
	ld a,002h		;169e	3e 02 	> . 
	ld (0d8d5h),a		;16a0	32 d5 d8 	2 . . 
	ld c,000h		;16a3	0e 00 	. . 
	call 0d607h		;16a5	cd 07 d6 	. . . 
	call z,0d503h		;16a8	cc 03 d5 	. . . 
	ret			;16ab	c9 	. 
	push hl			;16ac	e5 	. 
	nop			;16ad	00 	. 
	nop			;16ae	00 	. 
	nop			;16af	00 	. 
	nop			;16b0	00 	. 
	add a,b			;16b1	80 	. 
	nop			;16b2	00 	. 
	nop			;16b3	00 	. 
	nop			;16b4	00 	. 
	nop			;16b5	00 	. 
	nop			;16b6	00 	. 
	nop			;16b7	00 	. 
	nop			;16b8	00 	. 
	nop			;16b9	00 	. 
	nop			;16ba	00 	. 
	nop			;16bb	00 	. 
	nop			;16bc	00 	. 
	nop			;16bd	00 	. 
	nop			;16be	00 	. 
	nop			;16bf	00 	. 
	nop			;16c0	00 	. 
	nop			;16c1	00 	. 
	nop			;16c2	00 	. 
	nop			;16c3	00 	. 
	nop			;16c4	00 	. 
	nop			;16c5	00 	. 
	nop			;16c6	00 	. 
	nop			;16c7	00 	. 
	nop			;16c8	00 	. 
	nop			;16c9	00 	. 
	nop			;16ca	00 	. 
	nop			;16cb	00 	. 
	nop			;16cc	00 	. 
	nop			;16cd	00 	. 
	nop			;16ce	00 	. 
	nop			;16cf	00 	. 
	nop			;16d0	00 	. 
	nop			;16d1	00 	. 
	nop			;16d2	00 	. 
	nop			;16d3	00 	. 
	nop			;16d4	00 	. 
	nop			;16d5	00 	. 
	nop			;16d6	00 	. 
	nop			;16d7	00 	. 
	nop			;16d8	00 	. 
	nop			;16d9	00 	. 
	nop			;16da	00 	. 
	nop			;16db	00 	. 
	nop			;16dc	00 	. 
	nop			;16dd	00 	. 
	nop			;16de	00 	. 
	nop			;16df	00 	. 
	nop			;16e0	00 	. 
	nop			;16e1	00 	. 
	nop			;16e2	00 	. 
	nop			;16e3	00 	. 
	nop			;16e4	00 	. 
	nop			;16e5	00 	. 
	nop			;16e6	00 	. 
	nop			;16e7	00 	. 
	nop			;16e8	00 	. 
	nop			;16e9	00 	. 
	nop			;16ea	00 	. 
	nop			;16eb	00 	. 
	nop			;16ec	00 	. 
	nop			;16ed	00 	. 
	nop			;16ee	00 	. 
	nop			;16ef	00 	. 
	nop			;16f0	00 	. 
	nop			;16f1	00 	. 
	nop			;16f2	00 	. 
	nop			;16f3	00 	. 
	nop			;16f4	00 	. 
	nop			;16f5	00 	. 
	nop			;16f6	00 	. 
	nop			;16f7	00 	. 
	nop			;16f8	00 	. 
	nop			;16f9	00 	. 
	nop			;16fa	00 	. 
	nop			;16fb	00 	. 
	nop			;16fc	00 	. 
	nop			;16fd	00 	. 
	nop			;16fe	00 	. 
	nop			;16ff	00 	. 
	jp 0df37h		;1700	c3 37 df 	. 7 . 
	jp 0d9a3h		;1703	c3 a3 d9 	. . . 
	jp 0da1ah		;1706	c3 1a da 	. . . 
	jp 0da28h		;1709	c3 28 da 	. ( . 
	jp 0da36h		;170c	c3 36 da 	. 6 . 
	jp 0da64h		;170f	c3 64 da 	. d . 
	jp 0da53h		;1712	c3 53 da 	. S . 
	jp 0da44h		;1715	c3 44 da 	. D . 
	jp 0dab4h		;1718	c3 b4 da 	. . . 
	jp 0da94h		;171b	c3 94 da 	. . . 
	jp 0dabfh		;171e	c3 bf da 	. . . 
	jp 0dac4h		;1721	c3 c4 da 	. . . 
	jp 0dacah		;1724	c3 ca da 	. . . 
	jp 0dadch		;1727	c3 dc da 	. . . 
	jp 0daefh		;172a	c3 ef da 	. . . 
	jp 0da74h		;172d	c3 74 da 	. t . 
	jp 0dad0h		;1730	c3 d0 da 	. . . 
	jr nz,l1777h		;1733	20 42 	  B 
	ld l,a			;1735	6f 	o 
	ld l,a			;1736	6f 	o 
	ld (hl),h			;1737	74 	t 
	nop			;1738	00 	. 
	ld c,c			;1739	49 	I 
	ld l,(hl)			;173a	6e 	n 
	ld (hl),e			;173b	73 	s 
	ld h,l			;173c	65 	e 
	ld (hl),d			;173d	72 	r 
	ld (hl),h			;173e	74 	t 
	jr nz,l1761h		;173f	20 20 	    
l1741h:
	ld d,b			;1741	50 	P 
	ld b,e			;1742	43 	C 
	dec l			;1743	2d 	- 
	ld b,e			;1744	43 	C 
	ld d,b			;1745	50 	P 
	cpl			;1746	2f 	/ 
	ld c,l			;1747	4d 	M 
	dec l			;1748	2d 	- 
	ld d,e			;1749	53 	S 
	ld a,c			;174a	79 	y 
	ld (hl),e			;174b	73 	s 
	ld (hl),h			;174c	74 	t 
	ld h,l			;174d	65 	e 
	ld l,l			;174e	6d 	m 
	jr nz,102		;174f	20 64 	  d 
	ld l,c			;1751	69 	i 
	ld (hl),e			;1752	73 	s 
	ld l,e			;1753	6b 	k 
	nop			;1754	00 	. 
	nop			;1755	00 	. 
	nop			;1756	00 	. 
	nop			;1757	00 	. 
	nop			;1758	00 	. 
	nop			;1759	00 	. 
	nop			;175a	00 	. 
	nop			;175b	00 	. 
	nop			;175c	00 	. 
	or a			;175d	b7 	. 
	sbc a,085h		;175e	de 85 	. . 
	exx			;1760	d9 	. 
l1761h:
	jr z,l1741h		;1761	28 de 	( . 
	ld a,b			;1763	78 	x 
	sbc a,000h		;1764	de 00 	. . 
	nop			;1766	00 	. 
	nop			;1767	00 	. 
	nop			;1768	00 	. 
	nop			;1769	00 	. 
	nop			;176a	00 	. 
	nop			;176b	00 	. 
	nop			;176c	00 	. 
	or a			;176d	b7 	. 
	sbc a,085h		;176e	de 85 	. . 
	exx			;1770	d9 	. 
	ld c,b			;1771	48 	H 
	sbc a,08dh		;1772	de 8d 	. . 
	sbc a,000h		;1774	de 00 	. . 
	nop			;1776	00 	. 
l1777h:
	nop			;1777	00 	. 
	nop			;1778	00 	. 
	nop			;1779	00 	. 
	nop			;177a	00 	. 
	nop			;177b	00 	. 
	nop			;177c	00 	. 
	or a			;177d	b7 	. 
	sbc a,094h		;177e	de 94 	. . 
	exx			;1780	d9 	. 
	ld l,b			;1781	68 	h 
	sbc a,0a2h		;1782	de a2 	. . 
	sbc a,040h		;1784	de 40 	. @ 
	nop			;1786	00 	. 
	inc b			;1787	04 	. 
	rrca			;1788	0f 	. 
	ld bc,l0097h		;1789	01 97 00 	. . . 
	ld a,a			;178c	7f 	 
	nop			;178d	00 	. 
	ret nz			;178e	c0 	. 
	nop			;178f	00 	. 
	jr nz,l1792h		;1790	20 00 	  . 
l1792h:
	ld (bc),a			;1792	02 	. 
	nop			;1793	00 	. 
	jr nz,l1796h		;1794	20 00 	  . 
l1796h:
	inc bc			;1796	03 	. 
	rlca			;1797	07 	. 
	nop			;1798	00 	. 
	sub a			;1799	97 	. 
	nop			;179a	00 	. 
	ccf			;179b	3f 	? 
	nop			;179c	00 	. 
	ret nz			;179d	c0 	. 
	nop			;179e	00 	. 
	djnz l17a1h		;179f	10 00 	. . 
l17a1h:
	ld (bc),a			;17a1	02 	. 
	nop			;17a2	00 	. 
l17a3h:
	ld sp,00080h		;17a3	31 80 00 	1 . . 
	call 0e44eh		;17a6	cd 4e e4 	. N . 
	ld a,(l0003h+1)		;17a9	3a 04 00 	: . . 
	cp 00fh		;17ac	fe 0f 	. . 
	jr z,l17cdh		;17ae	28 1d 	( . 
l17b0h:
	xor a			;17b0	af 	. 
	ld (0de18h),a		;17b1	32 18 de 	2 . . 
	ld (0de0bh),a		;17b4	32 0b de 	2 . . 
	ld (0de1ah),a		;17b7	32 1a de 	2 . . 
	ld (0de19h),a		;17ba	32 19 de 	2 . . 
	ld a,0c6h		;17bd	3e c6 	> . 
	call 0dbfah		;17bf	cd fa db 	. . . 
	or a			;17c2	b7 	. 
	jr z,l17dfh		;17c3	28 1a 	( . 
	ld hl,0d933h		;17c5	21 33 d9 	! 3 . 
	call 0da0eh		;17c8	cd 0e da 	. . . 
	jr l17a3h		;17cb	18 d6 	. . 
l17cdh:
	xor a			;17cd	af 	. 
	ld (l0003h+1),a		;17ce	32 04 00 	2 . . 
	ld (0de1dh),a		;17d1	32 1d de 	2 . . 
	ld hl,0d939h		;17d4	21 39 d9 	! 9 . 
	call 0da0eh		;17d7	cd 0e da 	. . . 
	call 0da28h		;17da	cd 28 da 	. ( . 
	jr l17b0h		;17dd	18 d1 	. . 
l17dfh:
	ld a,0c3h		;17df	3e c3 	> . 
	ld hl,0d903h		;17e1	21 03 d9 	! . . 
	ld (l0000h),a		;17e4	32 00 00 	2 . . 
	ld (l0000h+1),hl		;17e7	22 01 00 	" . . 
	ld hl,0cb06h		;17ea	21 06 cb 	! . . 
	ld (l0003h+2),a		;17ed	32 05 00 	2 . . 
	ld (l0006h),hl		;17f0	22 06 00 	" . . 
	xor a			;17f3	af 	. 
	ld (0de1ch),a		;17f4	32 1c de 	2 . . 
	ld (0de1eh),a		;17f7	32 1e de 	2 . . 
	ld bc,00080h		;17fa	01 80 00 	. . . 
	call 0dacah		;17fd	cd ca da 	. . . 
	ld a,(l0003h+1)		;1800	3a 04 00 	: . . 
l1803h:
	ld c,a			;1803	4f 	O 
	call 0da94h		;1804	cd 94 da 	. . . 
	ld a,h			;1807	7c 	| 
	or l			;1808	b5 	. 
	jr z,l1803h		;1809	28 f8 	( . 
	jp 0c300h		;180b	c3 00 c3 	. . . 
l180eh:
	ld a,(hl)			;180e	7e 	~ 
	or a			;180f	b7 	. 
	ret z			;1810	c8 	. 
	push hl			;1811	e5 	. 
	ld c,a			;1812	4f 	O 
	call 0da36h		;1813	cd 36 da 	. 6 . 
	pop hl			;1816	e1 	. 
	inc hl			;1817	23 	# 
	jr l180eh		;1818	18 f4 	. . 
	ld a,(l0003h)		;181a	3a 03 00 	: . . 
	call 0da84h		;181d	cd 84 da 	. . . 
	inc bc			;1820	03 	. 
	call po,0e40ch		;1821	e4 0c e4 	. . . 
	dec d			;1824	15 	. 
	call po,0e41eh		;1825	e4 1e e4 	. . . 
	ld a,(l0003h)		;1828	3a 03 00 	: . . 
	call 0da84h		;182b	cd 84 da 	. . . 
	ld b,0e4h		;182e	06 e4 	. . 
	rrca			;1830	0f 	. 
	call po,0e418h		;1831	e4 18 e4 	. . . 
	ld hl,03ae4h		;1834	21 e4 3a 	! . : 
	inc bc			;1837	03 	. 
	nop			;1838	00 	. 
	call 0da84h		;1839	cd 84 da 	. . . 
	add hl,bc			;183c	09 	. 
	call po,0e412h		;183d	e4 12 e4 	. . . 
	dec de			;1840	1b 	. 
	call po,0e424h		;1841	e4 24 e4 	. $ . 
	ld a,(l0003h)		;1844	3a 03 00 	: . . 
	rrca			;1847	0f 	. 
	call 0da85h		;1848	cd 85 da 	. . . 
	ld b,0e4h		;184b	06 e4 	. . 
	daa			;184d	27 	' 
	call po,0e42ah		;184e	e4 2a e4 	. * . 
	dec l			;1851	2d 	- 
	call po,0033ah		;1852	e4 3a 03 	. : . 
	nop			;1855	00 	. 
	rrca			;1856	0f 	. 
	rrca			;1857	0f 	. 
	rrca			;1858	0f 	. 
	call 0da85h		;1859	cd 85 da 	. . . 
	add hl,bc			;185c	09 	. 
	call po,0e430h		;185d	e4 30 e4 	. 0 . 
	inc sp			;1860	33 	3 
	call po,0e436h		;1861	e4 36 e4 	. 6 . 
	ld a,(l0003h)		;1864	3a 03 00 	: . . 
	rlca			;1867	07 	. 
	rlca			;1868	07 	. 
	call 0da84h		;1869	cd 84 da 	. . . 
	add hl,bc			;186c	09 	. 
	call po,0e412h		;186d	e4 12 e4 	. . . 
	add hl,sp			;1870	39 	9 
	call po,0e43ch		;1871	e4 3c e4 	. < . 
	ld a,(l0003h)		;1874	3a 03 00 	: . . 
	rlca			;1877	07 	. 
	rlca			;1878	07 	. 
	call 0da84h		;1879	cd 84 da 	. . . 
	ccf			;187c	3f 	? 
	call po,0e442h		;187d	e4 42 e4 	. B . 
	ld b,l			;1880	45 	E 
	call po,0e448h		;1881	e4 48 e4 	. H . 
	rlca			;1884	07 	. 
	and 006h		;1885	e6 06 	. . 
	ex (sp),hl			;1887	e3 	. 
	push de			;1888	d5 	. 
	ld e,a			;1889	5f 	_ 
	ld d,000h		;188a	16 00 	. . 
	add hl,de			;188c	19 	. 
	ld a,(hl)			;188d	7e 	~ 
	inc hl			;188e	23 	# 
	ld h,(hl)			;188f	66 	f 
	ld l,a			;1890	6f 	o 
	pop de			;1891	d1 	. 
	ex (sp),hl			;1892	e3 	. 
	ret			;1893	c9 	. 
	ld hl,l0000h		;1894	21 00 00 	! . . 
	ld a,c			;1897	79 	y 
	cp 00fh		;1898	fe 0f 	. . 
	jr z,l18ach		;189a	28 10 	( . 
	cp 002h		;189c	fe 02 	. . 
	ret nc			;189e	d0 	. 
	ld (0de15h),a		;189f	32 15 de 	2 . . 
	ld l,a			;18a2	6f 	o 
l18a3h:
	add hl,hl			;18a3	29 	) 
	add hl,hl			;18a4	29 	) 
	add hl,hl			;18a5	29 	) 
	add hl,hl			;18a6	29 	) 
	ld de,0d955h		;18a7	11 55 d9 	. U . 
	add hl,de			;18aa	19 	. 
	ret			;18ab	c9 	. 
l18ach:
	ld l,002h		;18ac	2e 02 	. . 
	xor a			;18ae	af 	. 
	ld (0de15h),a		;18af	32 15 de 	2 . . 
	jr l18a3h		;18b2	18 ef 	. . 
	ld a,(0de1dh)		;18b4	3a 1d de 	: . . 
	or a			;18b7	b7 	. 
	jr nz,l18bdh		;18b8	20 03 	  . 
	ld (0de1ch),a		;18ba	32 1c de 	2 . . 
l18bdh:
	ld c,000h		;18bd	0e 00 	. . 
	ld a,c			;18bf	79 	y 
	ld (0de16h),a		;18c0	32 16 de 	2 . . 
	ret			;18c3	c9 	. 
	ld a,c			;18c4	79 	y 
	dec a			;18c5	3d 	= 
	ld (0de17h),a		;18c6	32 17 de 	2 . . 
	ret			;18c9	c9 	. 
	ld h,b			;18ca	60 	` 
	ld l,c			;18cb	69 	i 
	ld (0de26h),hl		;18cc	22 26 de 	" & . 
	ret			;18cf	c9 	. 
	ld h,b			;18d0	60 	` 
	ld l,c			;18d1	69 	i 
	inc hl			;18d2	23 	# 
	ld a,d			;18d3	7a 	z 
	or e			;18d4	b3 	. 
	ret z			;18d5	c8 	. 
	ex de,hl			;18d6	eb 	. 
	add hl,bc			;18d7	09 	. 
	ld l,(hl)			;18d8	6e 	n 
	ld h,000h		;18d9	26 00 	& . 
	ret			;18db	c9 	. 
	xor a			;18dc	af 	. 
	ld (0de1eh),a		;18dd	32 1e de 	2 . . 
	ld a,001h		;18e0	3e 01 	> . 
	ld (0de24h),a		;18e2	32 24 de 	2 $ . 
	ld (0de23h),a		;18e5	32 23 de 	2 # . 
	ld a,002h		;18e8	3e 02 	> . 
	ld (0de25h),a		;18ea	32 25 de 	2 % . 
	jr l1951h		;18ed	18 62 	. b 
	xor a			;18ef	af 	. 
	ld (0de24h),a		;18f0	32 24 de 	2 $ . 
	ld a,c			;18f3	79 	y 
	ld (0de25h),a		;18f4	32 25 de 	2 % . 
	cp 002h		;18f7	fe 02 	. . 
	jr nz,l1912h		;18f9	20 17 	  . 
	ld a,010h		;18fb	3e 10 	> . 
	ld (0de1eh),a		;18fd	32 1e de 	2 . . 
	ld a,(0de15h)		;1900	3a 15 de 	: . . 
	ld (0de1fh),a		;1903	32 1f de 	2 . . 
	ld a,(0de16h)		;1906	3a 16 de 	: . . 
	ld (0de20h),a		;1909	32 20 de 	2   . 
	ld a,(0de17h)		;190c	3a 17 de 	: . . 
	ld (0de21h),a		;190f	32 21 de 	2 ! . 
l1912h:
	ld a,(0de1eh)		;1912	3a 1e de 	: . . 
	or a			;1915	b7 	. 
	jr z,l1949h		;1916	28 31 	( 1 
	dec a			;1918	3d 	= 
	ld (0de1eh),a		;1919	32 1e de 	2 . . 
	ld a,(0de15h)		;191c	3a 15 de 	: . . 
	ld hl,0de1fh		;191f	21 1f de 	! . . 
	cp (hl)			;1922	be 	. 
	jr nz,l1949h		;1923	20 24 	  $ 
	ld a,(0de16h)		;1925	3a 16 de 	: . . 
	ld hl,0de20h		;1928	21 20 de 	!   . 
	cp (hl)			;192b	be 	. 
	jr nz,l1949h		;192c	20 1b 	  . 
	ld a,(0de17h)		;192e	3a 17 de 	: . . 
	ld hl,0de21h		;1931	21 21 de 	! ! . 
	cp (hl)			;1934	be 	. 
	jr nz,l1949h		;1935	20 12 	  . 
	inc (hl)			;1937	34 	4 
	ld a,040h		;1938	3e 40 	> @ 
	cp (hl)			;193a	be 	. 
	jr nz,l1943h		;193b	20 06 	  . 
	ld (hl),000h		;193d	36 00 	6 . 
	ld hl,0de20h		;193f	21 20 de 	!   . 
	inc (hl)			;1942	34 	4 
l1943h:
	xor a			;1943	af 	. 
	ld (0de23h),a		;1944	32 23 de 	2 # . 
	jr l1951h		;1947	18 08 	. . 
l1949h:
	xor a			;1949	af 	. 
	ld (0de1eh),a		;194a	32 1e de 	2 . . 
	inc a			;194d	3c 	< 
	ld (0de23h),a		;194e	32 23 de 	2 # . 
l1951h:
	ld (0de09h),sp		;1951	ed 73 09 de 	. s . . 
	ld sp,0e3ffh		;1955	31 ff e3 	1 . . 
	xor a			;1958	af 	. 
	ld (0de22h),a		;1959	32 22 de 	2 " . 
	ld a,(0de17h)		;195c	3a 17 de 	: . . 
	or a			;195f	b7 	. 
	rra			;1960	1f 	. 
	or a			;1961	b7 	. 
	rra			;1962	1f 	. 
	or a			;1963	b7 	. 
	rra			;1964	1f 	. 
	ld (0de1bh),a		;1965	32 1b de 	2 . . 
	ld hl,0de1ch		;1968	21 1c de 	! . . 
	ld a,(hl)			;196b	7e 	~ 
	ld (hl),001h		;196c	36 01 	6 . 
	or a			;196e	b7 	. 
	jr z,l1993h		;196f	28 22 	( " 
	ld a,(0de15h)		;1971	3a 15 de 	: . . 
	ld hl,0de18h		;1974	21 18 de 	! . . 
	cp (hl)			;1977	be 	. 
	jr nz,l198ch		;1978	20 12 	  . 
	ld a,(0de16h)		;197a	3a 16 de 	: . . 
	ld hl,0de19h		;197d	21 19 de 	! . . 
	cp (hl)			;1980	be 	. 
	jr nz,l198ch		;1981	20 09 	  . 
	ld a,(0de1bh)		;1983	3a 1b de 	: . . 
	ld hl,0de1ah		;1986	21 1a de 	! . . 
	cp (hl)			;1989	be 	. 
	jr z,l19b0h		;198a	28 24 	( $ 
l198ch:
	ld a,(0de1dh)		;198c	3a 1d de 	: . . 
	or a			;198f	b7 	. 
	call nz,0dbf4h		;1990	c4 f4 db 	. . . 
l1993h:
	ld a,(0de15h)		;1993	3a 15 de 	: . . 
	ld (0de18h),a		;1996	32 18 de 	2 . . 
	ld a,(0de16h)		;1999	3a 16 de 	: . . 
	ld (0de19h),a		;199c	32 19 de 	2 . . 
	ld a,(0de1bh)		;199f	3a 1b de 	: . . 
	ld (0de1ah),a		;19a2	32 1a de 	2 . . 
	ld a,(0de23h)		;19a5	3a 23 de 	: # . 
	or a			;19a8	b7 	. 
	call nz,0dbf8h		;19a9	c4 f8 db 	. . . 
	xor a			;19ac	af 	. 
	ld (0de1dh),a		;19ad	32 1d de 	2 . . 
l19b0h:
	ld a,(0de17h)		;19b0	3a 17 de 	: . . 
	and 007h		;19b3	e6 07 	. . 
	ld l,a			;19b5	6f 	o 
	ld h,000h		;19b6	26 00 	& . 
	add hl,hl			;19b8	29 	) 
	add hl,hl			;19b9	29 	) 
	add hl,hl			;19ba	29 	) 
	add hl,hl			;19bb	29 	) 
	add hl,hl			;19bc	29 	) 
	add hl,hl			;19bd	29 	) 
	add hl,hl			;19be	29 	) 
	ld de,0df37h		;19bf	11 37 df 	. 7 . 
	add hl,de			;19c2	19 	. 
	ld de,(0de26h)		;19c3	ed 5b 26 de 	. [ & . 
	ld bc,00080h		;19c7	01 80 00 	. . . 
	ld a,(0de24h)		;19ca	3a 24 de 	: $ . 
	or a			;19cd	b7 	. 
	jr nz,l19d6h		;19ce	20 06 	  . 
	ld a,001h		;19d0	3e 01 	> . 
	ld (0de1dh),a		;19d2	32 1d de 	2 . . 
	ex de,hl			;19d5	eb 	. 
l19d6h:
	ldir		;19d6	ed b0 	. . 
	ld a,(0de25h)		;19d8	3a 25 de 	: % . 
	cp 001h		;19db	fe 01 	. . 
	ld a,(0de22h)		;19dd	3a 22 de 	: " . 
	jr nz,l19efh		;19e0	20 0d 	  . 
	or a			;19e2	b7 	. 
	jr nz,l19efh		;19e3	20 0a 	  . 
	xor a			;19e5	af 	. 
	ld (0de1dh),a		;19e6	32 1d de 	2 . . 
	call 0dbf4h		;19e9	cd f4 db 	. . . 
	ld a,(0de22h)		;19ec	3a 22 de 	: " . 
l19efh:
	ld sp,(0de09h)		;19ef	ed 7b 09 de 	. { . . 
	ret			;19f3	c9 	. 
	ld a,045h		;19f4	3e 45 	> E 
	jr l19fah		;19f6	18 02 	. . 
	ld a,046h		;19f8	3e 46 	> F 
l19fah:
	ld (0de0ch),a		;19fa	32 0c de 	2 . . 
	ld a,00ah		;19fd	3e 0a 	> . 
	ld (0dd18h),a		;19ff	32 18 dd 	2 . . 
	in a,(0f0h)		;1a02	db f0 	. . 
	bit 7,a		;1a04	cb 7f 	.  
	ld a,0ffh		;1a06	3e ff 	> . 
	out (0f0h),a		;1a08	d3 f0 	. . 
	jr z,l1a18h		;1a0a	28 0c 	( . 
	ld hl,0b64ah		;1a0c	21 4a b6 	! J . 
	call 0e451h		;1a0f	cd 51 e4 	. Q . 
	ld hl,0b64ah		;1a12	21 4a b6 	! J . 
	call 0e451h		;1a15	cd 51 e4 	. Q . 
l1a18h:
	ld b,003h		;1a18	06 03 	. . 
l1a1ah:
	ld c,0ffh		;1a1a	0e ff 	. . 
l1a1ch:
	ld a,004h		;1a1c	3e 04 	> . 
	call 0ddb4h		;1a1e	cd b4 dd 	. . . 
	call 0ddd6h		;1a21	cd d6 dd 	. . . 
	bit 5,a		;1a24	cb 6f 	. o 
	jr nz,l1a33h		;1a26	20 0b 	  . 
	dec c			;1a28	0d 	. 
	jr nz,l1a1ch		;1a29	20 f1 	  . 
	ld hl,0dd6fh		;1a2b	21 6f dd 	! o . 
l1a2eh:
	call 0dd19h		;1a2e	cd 19 dd 	. . . 
	jr l1a1ah		;1a31	18 e7 	. . 
l1a33h:
	bit 6,a		;1a33	cb 77 	. w 
	jr z,l1a43h		;1a35	28 0c 	( . 
	ld a,(0de0ch)		;1a37	3a 0c de 	: . . 
	cp 045h		;1a3a	fe 45 	. E 
	jr nz,l1a43h		;1a3c	20 05 	  . 
	ld hl,0dd72h		;1a3e	21 72 dd 	! r . 
	jr l1a2eh		;1a41	18 eb 	. . 
l1a43h:
	ld a,(0de0bh)		;1a43	3a 0b de 	: . . 
	ld c,a			;1a46	4f 	O 
	ld a,(0de18h)		;1a47	3a 18 de 	: . . 
	inc a			;1a4a	3c 	< 
	ld b,a			;1a4b	47 	G 
	and c			;1a4c	a1 	. 
	jr nz,l1a5fh		;1a4d	20 10 	  . 
	ld a,b			;1a4f	78 	x 
	or c			;1a50	b1 	. 
	ld (0de0bh),a		;1a51	32 0b de 	2 . . 
	ld a,007h		;1a54	3e 07 	> . 
	call 0ddb4h		;1a56	cd b4 dd 	. . . 
	call 0dd8ah		;1a59	cd 8a dd 	. . . 
	jp nz,0dcf7h		;1a5c	c2 f7 dc 	. . . 
l1a5fh:
	ld a,00fh		;1a5f	3e 0f 	> . 
	call 0ddb4h		;1a61	cd b4 dd 	. . . 
	call 0dd81h		;1a64	cd 81 dd 	. . . 
	ld a,(0de19h)		;1a67	3a 19 de 	: . . 
	out (0f8h),a		;1a6a	d3 f8 	. . 
	ld (0de02h),a		;1a6c	32 02 de 	2 . . 
	call 0dd8ah		;1a6f	cd 8a dd 	. . . 
	jp nz,0dcf7h		;1a72	c2 f7 dc 	. . . 
	push bc			;1a75	c5 	. 
	ld hl,l0fa0h		;1a76	21 a0 0f 	! . . 
	call 0e451h		;1a79	cd 51 e4 	. Q . 
	pop bc			;1a7c	c1 	. 
	ld a,(0de1ah)		;1a7d	3a 1a de 	: . . 
	rlca			;1a80	07 	. 
	rlca			;1a81	07 	. 
	ld c,a			;1a82	4f 	O 
	and 00fh		;1a83	e6 0f 	. . 
	inc a			;1a85	3c 	< 
	ld (0de04h),a		;1a86	32 04 de 	2 . . 
	xor a			;1a89	af 	. 
	bit 4,c		;1a8a	cb 61 	. a 
	jr z,l1a8fh		;1a8c	28 01 	( . 
	inc a			;1a8e	3c 	< 
l1a8fh:
	ld (0de03h),a		;1a8f	32 03 de 	2 . . 
	ld a,044h		;1a92	3e 44 	> D 
	out (068h),a		;1a94	d3 68 	. h 
	ld a,(0de0ch)		;1a96	3a 0c de 	: . . 
	ld c,a			;1a99	4f 	O 
	ld de,0df37h		;1a9a	11 37 df 	. 7 . 
	ld hl,043ffh		;1a9d	21 ff 43 	! . C 
	bit 7,a		;1aa0	cb 7f 	.  
	jr z,l1aaah		;1aa2	28 06 	( . 
	ld de,0c200h		;1aa4	11 00 c2 	. . . 
	ld hl,055ffh		;1aa7	21 ff 55 	! . U 
l1aaah:
	bit 0,a		;1aaa	cb 47 	. G 
	jr z,l1ab0h		;1aac	28 02 	( . 
	ld h,083h		;1aae	26 83 	& . 
l1ab0h:
	ld a,e			;1ab0	7b 	{ 
	out (064h),a		;1ab1	d3 64 	. d 
	ld a,d			;1ab3	7a 	z 
	out (064h),a		;1ab4	d3 64 	. d 
	ld a,l			;1ab6	7d 	} 
	out (065h),a		;1ab7	d3 65 	. e 
	ld a,h			;1ab9	7c 	| 
	out (065h),a		;1aba	d3 65 	. e 
	ld a,c			;1abc	79 	y 
	call 0ddb4h		;1abd	cd b4 dd 	. . . 
	ld ix,0de02h		;1ac0	dd 21 02 de 	. ! . . 
	ld c,007h		;1ac4	0e 07 	. . 
l1ac6h:
	call 0dd81h		;1ac6	cd 81 dd 	. . . 
	ld a,(ix+000h)		;1ac9	dd 7e 00 	. ~ . 
	out (0f8h),a		;1acc	d3 f8 	. . 
	inc ix		;1ace	dd 23 	. # 
	dec c			;1ad0	0d 	. 
	jr nz,l1ac6h		;1ad1	20 f3 	  . 
	call 0ddcfh		;1ad3	cd cf dd 	. . . 
	ld ix,0de0eh		;1ad6	dd 21 0e de 	. ! . . 
	ld c,007h		;1ada	0e 07 	. . 
l1adch:
	call 0ddd6h		;1adc	cd d6 dd 	. . . 
	ld (ix+000h),a		;1adf	dd 77 00 	. w . 
	inc ix		;1ae2	dd 23 	. # 
	dec c			;1ae4	0d 	. 
	jr nz,l1adch		;1ae5	20 f5 	  . 
	ld a,(0de0eh)		;1ae7	3a 0e de 	: . . 
	and 0c0h		;1aea	e6 c0 	. . 
	jr nz,l1afeh		;1aec	20 10 	  . 
	ld (0de22h),a		;1aee	32 22 de 	2 " . 
	ld a,080h		;1af1	3e 80 	> . 
	out (0f0h),a		;1af3	d3 f0 	. . 
	xor a			;1af5	af 	. 
	ret			;1af6	c9 	. 
	ld a,(0de0bh)		;1af7	3a 0b de 	: . . 
	sub b			;1afa	90 	. 
	ld (0de0bh),a		;1afb	32 0b de 	2 . . 
l1afeh:
	ld a,(0dd18h)		;1afe	3a 18 dd 	: . . 
	dec a			;1b01	3d 	= 
	ld (0dd18h),a		;1b02	32 18 dd 	2 . . 
	and 003h		;1b05	e6 03 	. . 
	call z,0dddfh		;1b07	cc df dd 	. . . 
	jp nz,0dc02h		;1b0a	c2 02 dc 	. . . 
l1b0dh:
	ld a,001h		;1b0d	3e 01 	> . 
	ld (0de22h),a		;1b0f	32 22 de 	2 " . 
	xor a			;1b12	af 	. 
	ld (l0003h+1),a		;1b13	32 04 00 	2 . . 
	inc a			;1b16	3c 	< 
	ret			;1b17	c9 	. 
	or h			;1b18	b4 	. 
	ld a,b			;1b19	78 	x 
	or a			;1b1a	b7 	. 
	jr nz,l1b23h		;1b1b	20 06 	  . 
	pop hl			;1b1d	e1 	. 
	ld (l0003h+1),a		;1b1e	32 04 00 	2 . . 
	jr l1b0dh		;1b21	18 ea 	. . 
l1b23h:
	dec b			;1b23	05 	. 
	push bc			;1b24	c5 	. 
	push hl			;1b25	e5 	. 
	ld c,01bh		;1b26	0e 1b 	. . 
	call 0da36h		;1b28	cd 36 da 	. 6 . 
	ld c,017h		;1b2b	0e 17 	. . 
	call 0da36h		;1b2d	cd 36 da 	. 6 . 
	ex de,hl			;1b30	eb 	. 
	ld (0de0eh),hl		;1b31	22 0e de 	" . . 
	ld hl,0dd5eh		;1b34	21 5e dd 	! ^ . 
	call 0da0eh		;1b37	cd 0e da 	. . . 
	pop hl			;1b3a	e1 	. 
	call 0da0eh		;1b3b	cd 0e da 	. . . 
	call 0da28h		;1b3e	cd 28 da 	. ( . 
	ld hl,0dd75h		;1b41	21 75 dd 	! u . 
	call 0da0eh		;1b44	cd 0e da 	. . . 
	ld hl,(0de0eh)		;1b47	2a 0e de 	* . . 
	ld de,0dd7eh		;1b4a	11 7e dd 	. ~ . 
	ld a,h			;1b4d	7c 	| 
	add a,020h		;1b4e	c6 20 	.   
	ld (de),a			;1b50	12 	. 
	inc de			;1b51	13 	. 
	ld a,l			;1b52	7d 	} 
	add a,020h		;1b53	c6 20 	.   
	ld (de),a			;1b55	12 	. 
	ld hl,0dd7ch		;1b56	21 7c dd 	! | . 
	call 0da0eh		;1b59	cd 0e da 	. . . 
	pop bc			;1b5c	c1 	. 
	ret			;1b5d	c9 	. 
	dec de			;1b5e	1b 	. 
	ld e,c			;1b5f	59 	Y 
	jr c,l1bc3h		;1b60	38 61 	8 a 
	rlca			;1b62	07 	. 
	ld b,d			;1b63	42 	B 
	ld c,c			;1b64	49 	I 
	ld c,a			;1b65	4f 	O 
	ld d,e			;1b66	53 	S 
	jr nz,l1baeh		;1b67	20 45 	  E 
	ld (hl),d			;1b69	72 	r 
	ld (hl),d			;1b6a	72 	r 
	ld l,a			;1b6b	6f 	o 
	ld (hl),d			;1b6c	72 	r 
	jr nz,l1b6fh		;1b6d	20 00 	  . 
l1b6fh:
	ld c,(hl)			;1b6f	4e 	N 
	ld d,d			;1b70	52 	R 
	nop			;1b71	00 	. 
	ld d,a			;1b72	57 	W 
	ld d,b			;1b73	50 	P 
	nop			;1b74	00 	. 
	dec de			;1b75	1b 	. 
	ld e,c			;1b76	59 	Y 
	jr c,l1bdah		;1b77	38 61 	8 a 
	dec de			;1b79	1b 	. 
	ld c,e			;1b7a	4b 	K 
	nop			;1b7b	00 	. 
	dec de			;1b7c	1b 	. 
	ld e,c			;1b7d	59 	Y 
	nop			;1b7e	00 	. 
	nop			;1b7f	00 	. 
	nop			;1b80	00 	. 
	push af			;1b81	f5 	. 
l1b82h:
	in a,(0f9h)		;1b82	db f9 	. . 
	bit 7,a		;1b84	cb 7f 	.  
	jr z,l1b82h		;1b86	28 fa 	( . 
	pop af			;1b88	f1 	. 
	ret			;1b89	c9 	. 
	call 0ddcfh		;1b8a	cd cf dd 	. . . 
l1b8dh:
	ld a,008h		;1b8d	3e 08 	> . 
	call 0dd81h		;1b8f	cd 81 dd 	. . . 
	out (0f8h),a		;1b92	d3 f8 	. . 
	call 0ddd6h		;1b94	cd d6 dd 	. . . 
	cp 080h		;1b97	fe 80 	. . 
	jr z,l1baeh		;1b99	28 13 	( . 
	ld c,a			;1b9b	4f 	O 
	call 0ddd6h		;1b9c	cd d6 dd 	. . . 
	ld a,c			;1b9f	79 	y 
	add a,040h		;1ba0	c6 40 	. @ 
	jr c,l1b8dh		;1ba2	38 e9 	8 . 
	and 080h		;1ba4	e6 80 	. . 
	jr z,l1ba9h		;1ba6	28 01 	( . 
	ld a,c			;1ba8	79 	y 
l1ba9h:
	ld (0de0eh),a		;1ba9	32 0e de 	2 . . 
	jr l1b8dh		;1bac	18 df 	. . 
l1baeh:
	ld a,(0de0eh)		;1bae	3a 0e de 	: . . 
	cp 000h		;1bb1	fe 00 	. . 
	ret			;1bb3	c9 	. 
	call 0dd81h		;1bb4	cd 81 dd 	. . . 
	out (0f8h),a		;1bb7	d3 f8 	. . 
	cp 007h		;1bb9	fe 07 	. . 
	call 0dd81h		;1bbb	cd 81 dd 	. . . 
	jr z,l1bc5h		;1bbe	28 05 	( . 
	ld a,(0de1ah)		;1bc0	3a 1a de 	: . . 
l1bc3h:
	and 0fch		;1bc3	e6 fc 	. . 
l1bc5h:
	ld a,(0de18h)		;1bc5	3a 18 de 	: . . 
	jr z,l1bcch		;1bc8	28 02 	( . 
	or 004h		;1bca	f6 04 	. . 
l1bcch:
	out (0f8h),a		;1bcc	d3 f8 	. . 
	ret			;1bce	c9 	. 
l1bcfh:
	in a,(0f0h)		;1bcf	db f0 	. . 
	bit 6,a		;1bd1	cb 77 	. w 
	jr nz,l1bcfh		;1bd3	20 fa 	  . 
	ret			;1bd5	c9 	. 
l1bd6h:
	in a,(0f9h)		;1bd6	db f9 	. . 
	add a,040h		;1bd8	c6 40 	. @ 
l1bdah:
	jr nc,l1bd6h		;1bda	30 fa 	0 . 
	in a,(0f8h)		;1bdc	db f8 	. . 
	ret			;1bde	c9 	. 
	xor a			;1bdf	af 	. 
	out (0f0h),a		;1be0	d3 f0 	. . 
	ld hl,l0028h		;1be2	21 28 00 	! ( . 
	call 0e451h		;1be5	cd 51 e4 	. Q . 
	ld a,0ffh		;1be8	3e ff 	> . 
	out (0f0h),a		;1bea	d3 f0 	. . 
	ld a,003h		;1bec	3e 03 	> . 
	call 0dd81h		;1bee	cd 81 dd 	. . . 
	out (0f8h),a		;1bf1	d3 f8 	. . 
	ld a,0cfh		;1bf3	3e cf 	> . 
	call 0dd81h		;1bf5	cd 81 dd 	. . . 
	out (0f8h),a		;1bf8	d3 f8 	. . 
	ld a,01ch		;1bfa	3e 1c 	> . 
	call 0dd81h		;1bfc	cd 81 dd 	. . . 
	out (0f8h),a		;1bff	d3 f8 	. . 
	ret			;1c01	c9 	. 
	nop			;1c02	00 	. 
	nop			;1c03	00 	. 
	nop			;1c04	00 	. 
	ld bc,03610h		;1c05	01 10 36 	. . 6 
	rst 38h			;1c08	ff 	. 
	nop			;1c09	00 	. 
	nop			;1c0a	00 	. 
	nop			;1c0b	00 	. 
	nop			;1c0c	00 	. 
	nop			;1c0d	00 	. 
	nop			;1c0e	00 	. 
	nop			;1c0f	00 	. 
	nop			;1c10	00 	. 
	nop			;1c11	00 	. 
	nop			;1c12	00 	. 
	nop			;1c13	00 	. 
	nop			;1c14	00 	. 
	nop			;1c15	00 	. 
	nop			;1c16	00 	. 
	nop			;1c17	00 	. 
	nop			;1c18	00 	. 
	nop			;1c19	00 	. 
	nop			;1c1a	00 	. 
	nop			;1c1b	00 	. 
	nop			;1c1c	00 	. 
	nop			;1c1d	00 	. 
	nop			;1c1e	00 	. 
	nop			;1c1f	00 	. 
	nop			;1c20	00 	. 
	nop			;1c21	00 	. 
	nop			;1c22	00 	. 
	nop			;1c23	00 	. 
	nop			;1c24	00 	. 
	nop			;1c25	00 	. 
	nop			;1c26	00 	. 
	nop			;1c27	00 	. 
	nop			;1c28	00 	. 
	nop			;1c29	00 	. 
	nop			;1c2a	00 	. 
	nop			;1c2b	00 	. 
	nop			;1c2c	00 	. 
	nop			;1c2d	00 	. 
	nop			;1c2e	00 	. 
	nop			;1c2f	00 	. 
	nop			;1c30	00 	. 
	nop			;1c31	00 	. 
	nop			;1c32	00 	. 
	nop			;1c33	00 	. 
	nop			;1c34	00 	. 
	nop			;1c35	00 	. 
	nop			;1c36	00 	. 
	nop			;1c37	00 	. 
	nop			;1c38	00 	. 
	nop			;1c39	00 	. 
	nop			;1c3a	00 	. 
	nop			;1c3b	00 	. 
	nop			;1c3c	00 	. 
	nop			;1c3d	00 	. 
	nop			;1c3e	00 	. 
	nop			;1c3f	00 	. 
	nop			;1c40	00 	. 
	nop			;1c41	00 	. 
	nop			;1c42	00 	. 
	nop			;1c43	00 	. 
	nop			;1c44	00 	. 
	nop			;1c45	00 	. 
	nop			;1c46	00 	. 
	nop			;1c47	00 	. 
	nop			;1c48	00 	. 
	nop			;1c49	00 	. 
	nop			;1c4a	00 	. 
	nop			;1c4b	00 	. 
	nop			;1c4c	00 	. 
	nop			;1c4d	00 	. 
	nop			;1c4e	00 	. 
	nop			;1c4f	00 	. 
	nop			;1c50	00 	. 
	nop			;1c51	00 	. 
	nop			;1c52	00 	. 
	nop			;1c53	00 	. 
	nop			;1c54	00 	. 
	nop			;1c55	00 	. 
	nop			;1c56	00 	. 
	nop			;1c57	00 	. 
	nop			;1c58	00 	. 
	nop			;1c59	00 	. 
	nop			;1c5a	00 	. 
	nop			;1c5b	00 	. 
	nop			;1c5c	00 	. 
	nop			;1c5d	00 	. 
	nop			;1c5e	00 	. 
	nop			;1c5f	00 	. 
	nop			;1c60	00 	. 
	nop			;1c61	00 	. 
	nop			;1c62	00 	. 
	nop			;1c63	00 	. 
	nop			;1c64	00 	. 
	nop			;1c65	00 	. 
	nop			;1c66	00 	. 
	nop			;1c67	00 	. 
	nop			;1c68	00 	. 
	nop			;1c69	00 	. 
	nop			;1c6a	00 	. 
	nop			;1c6b	00 	. 
	nop			;1c6c	00 	. 
	nop			;1c6d	00 	. 
	nop			;1c6e	00 	. 
	nop			;1c6f	00 	. 
	nop			;1c70	00 	. 
	nop			;1c71	00 	. 
	nop			;1c72	00 	. 
	nop			;1c73	00 	. 
	nop			;1c74	00 	. 
	nop			;1c75	00 	. 
	nop			;1c76	00 	. 
	nop			;1c77	00 	. 
	nop			;1c78	00 	. 
	nop			;1c79	00 	. 
	nop			;1c7a	00 	. 
	nop			;1c7b	00 	. 
	nop			;1c7c	00 	. 
	nop			;1c7d	00 	. 
	nop			;1c7e	00 	. 
	nop			;1c7f	00 	. 
	nop			;1c80	00 	. 
	nop			;1c81	00 	. 
	nop			;1c82	00 	. 
	nop			;1c83	00 	. 
	nop			;1c84	00 	. 
	nop			;1c85	00 	. 
	nop			;1c86	00 	. 
	nop			;1c87	00 	. 
	nop			;1c88	00 	. 
	nop			;1c89	00 	. 
	nop			;1c8a	00 	. 
	nop			;1c8b	00 	. 
	nop			;1c8c	00 	. 
	nop			;1c8d	00 	. 
	nop			;1c8e	00 	. 
	nop			;1c8f	00 	. 
	nop			;1c90	00 	. 
	nop			;1c91	00 	. 
	nop			;1c92	00 	. 
	nop			;1c93	00 	. 
	nop			;1c94	00 	. 
	nop			;1c95	00 	. 
	nop			;1c96	00 	. 
	nop			;1c97	00 	. 
	nop			;1c98	00 	. 
	nop			;1c99	00 	. 
	nop			;1c9a	00 	. 
	nop			;1c9b	00 	. 
	nop			;1c9c	00 	. 
	nop			;1c9d	00 	. 
	nop			;1c9e	00 	. 
	nop			;1c9f	00 	. 
	nop			;1ca0	00 	. 
	nop			;1ca1	00 	. 
	nop			;1ca2	00 	. 
	nop			;1ca3	00 	. 
	nop			;1ca4	00 	. 
	nop			;1ca5	00 	. 
	nop			;1ca6	00 	. 
	nop			;1ca7	00 	. 
	nop			;1ca8	00 	. 
	nop			;1ca9	00 	. 
	nop			;1caa	00 	. 
	nop			;1cab	00 	. 
	nop			;1cac	00 	. 
	nop			;1cad	00 	. 
	nop			;1cae	00 	. 
	nop			;1caf	00 	. 
	nop			;1cb0	00 	. 
	nop			;1cb1	00 	. 
	nop			;1cb2	00 	. 
	nop			;1cb3	00 	. 
	nop			;1cb4	00 	. 
	nop			;1cb5	00 	. 
	nop			;1cb6	00 	. 
	nop			;1cb7	00 	. 
	nop			;1cb8	00 	. 
	nop			;1cb9	00 	. 
	nop			;1cba	00 	. 
	nop			;1cbb	00 	. 
	nop			;1cbc	00 	. 
	nop			;1cbd	00 	. 
	nop			;1cbe	00 	. 
	nop			;1cbf	00 	. 
	nop			;1cc0	00 	. 
	nop			;1cc1	00 	. 
	nop			;1cc2	00 	. 
	nop			;1cc3	00 	. 
	nop			;1cc4	00 	. 
	nop			;1cc5	00 	. 
	nop			;1cc6	00 	. 
	nop			;1cc7	00 	. 
	nop			;1cc8	00 	. 
	nop			;1cc9	00 	. 
	nop			;1cca	00 	. 
	nop			;1ccb	00 	. 
	nop			;1ccc	00 	. 
	nop			;1ccd	00 	. 
	nop			;1cce	00 	. 
	nop			;1ccf	00 	. 
	nop			;1cd0	00 	. 
	nop			;1cd1	00 	. 
	nop			;1cd2	00 	. 
	nop			;1cd3	00 	. 
	nop			;1cd4	00 	. 
	nop			;1cd5	00 	. 
	nop			;1cd6	00 	. 
	nop			;1cd7	00 	. 
	nop			;1cd8	00 	. 
	nop			;1cd9	00 	. 
	nop			;1cda	00 	. 
	nop			;1cdb	00 	. 
	nop			;1cdc	00 	. 
	nop			;1cdd	00 	. 
	nop			;1cde	00 	. 
	nop			;1cdf	00 	. 
	nop			;1ce0	00 	. 
	nop			;1ce1	00 	. 
	nop			;1ce2	00 	. 
	nop			;1ce3	00 	. 
	nop			;1ce4	00 	. 
	nop			;1ce5	00 	. 
	nop			;1ce6	00 	. 
	nop			;1ce7	00 	. 
	nop			;1ce8	00 	. 
	nop			;1ce9	00 	. 
	nop			;1cea	00 	. 
	nop			;1ceb	00 	. 
	nop			;1cec	00 	. 
	nop			;1ced	00 	. 
	nop			;1cee	00 	. 
	nop			;1cef	00 	. 
	nop			;1cf0	00 	. 
	nop			;1cf1	00 	. 
	nop			;1cf2	00 	. 
	nop			;1cf3	00 	. 
	nop			;1cf4	00 	. 
	nop			;1cf5	00 	. 
	nop			;1cf6	00 	. 
	nop			;1cf7	00 	. 
	nop			;1cf8	00 	. 
	nop			;1cf9	00 	. 
	nop			;1cfa	00 	. 
	nop			;1cfb	00 	. 
	nop			;1cfc	00 	. 
	nop			;1cfd	00 	. 
	nop			;1cfe	00 	. 
	nop			;1cff	00 	. 
	nop			;1d00	00 	. 
	nop			;1d01	00 	. 
	nop			;1d02	00 	. 
	nop			;1d03	00 	. 
	nop			;1d04	00 	. 
	nop			;1d05	00 	. 
	nop			;1d06	00 	. 
	nop			;1d07	00 	. 
	nop			;1d08	00 	. 
	nop			;1d09	00 	. 
	nop			;1d0a	00 	. 
	nop			;1d0b	00 	. 
	nop			;1d0c	00 	. 
	nop			;1d0d	00 	. 
	nop			;1d0e	00 	. 
	nop			;1d0f	00 	. 
	nop			;1d10	00 	. 
	nop			;1d11	00 	. 
	nop			;1d12	00 	. 
	nop			;1d13	00 	. 
	nop			;1d14	00 	. 
	nop			;1d15	00 	. 
	nop			;1d16	00 	. 
	nop			;1d17	00 	. 
	nop			;1d18	00 	. 
	nop			;1d19	00 	. 
	nop			;1d1a	00 	. 
	nop			;1d1b	00 	. 
	nop			;1d1c	00 	. 
	nop			;1d1d	00 	. 
	nop			;1d1e	00 	. 
	nop			;1d1f	00 	. 
	nop			;1d20	00 	. 
	nop			;1d21	00 	. 
	nop			;1d22	00 	. 
	nop			;1d23	00 	. 
	nop			;1d24	00 	. 
	nop			;1d25	00 	. 
	nop			;1d26	00 	. 
	nop			;1d27	00 	. 
	nop			;1d28	00 	. 
	nop			;1d29	00 	. 
	nop			;1d2a	00 	. 
	nop			;1d2b	00 	. 
	nop			;1d2c	00 	. 
	nop			;1d2d	00 	. 
	nop			;1d2e	00 	. 
	nop			;1d2f	00 	. 
	nop			;1d30	00 	. 
	nop			;1d31	00 	. 
	nop			;1d32	00 	. 
	nop			;1d33	00 	. 
	nop			;1d34	00 	. 
	nop			;1d35	00 	. 
	nop			;1d36	00 	. 
	ld sp,00080h		;1d37	31 80 00 	1 . . 
	xor a			;1d3a	af 	. 
	ld (l0003h+1),a		;1d3b	32 04 00 	2 . . 
	ld (0de1dh),a		;1d3e	32 1d de 	2 . . 
	ld (0dfc0h),a		;1d41	32 c0 df 	2 . . 
	ld a,095h		;1d44	3e 95 	> . 
	ld (l0003h),a		;1d46	32 03 00 	2 . . 
	ld hl,0dfc1h		;1d49	21 c1 df 	! . . 
	ld (0dfbeh),hl		;1d4c	22 be df 	" . . 
	ld hl,(0cb04h)		;1d4f	2a 04 cb 	* . . 
	call 0dfc6h		;1d52	cd c6 df 	. . . 
	ld hl,0dfb5h		;1d55	21 b5 df 	! . . 
	ld a,(0dfc0h)		;1d58	3a c0 df 	: . . 
	ld b,a			;1d5b	47 	G 
	ld a,005h		;1d5c	3e 05 	> . 
	sub b			;1d5e	90 	. 
l1d5fh:
	or a			;1d5f	b7 	. 
	jr z,l1d66h		;1d60	28 04 	( . 
	dec a			;1d62	3d 	= 
	inc hl			;1d63	23 	# 
	jr l1d5fh		;1d64	18 f9 	. . 
l1d66h:
	ld de,0dfc1h		;1d66	11 c1 df 	. . . 
l1d69h:
	ld a,b			;1d69	78 	x 
	or a			;1d6a	b7 	. 
	jr z,l1d74h		;1d6b	28 07 	( . 
	dec b			;1d6d	05 	. 
	ld a,(de)			;1d6e	1a 	. 
	ld (hl),a			;1d6f	77 	w 
	inc hl			;1d70	23 	# 
	inc de			;1d71	13 	. 
	jr l1d69h		;1d72	18 f5 	. . 
l1d74h:
	ld hl,0df7dh		;1d74	21 7d df 	! } . 
	call 0da0eh		;1d77	cd 0e da 	. . . 
	jp 0d9dfh		;1d7a	c3 df d9 	. . . 
	jr nz,55		;1d7d	20 35 	  5 
	ld (hl),04bh		;1d7f	36 4b 	6 K 
	jr nz,l1da3h		;1d81	20 20 	    
	ld b,e			;1d83	43 	C 
	ld d,b			;1d84	50 	P 
	cpl			;1d85	2f 	/ 
	ld c,l			;1d86	4d 	M 
	jr nz,l1dbbh		;1d87	20 32 	  2 
	ld l,032h		;1d89	2e 32 	. 2 
	jr nz,l1dbch		;1d8b	20 2f 	  / 
	jr nz,l1dc2h		;1d8d	20 33 	  3 
	ld l,030h		;1d8f	2e 30 	. 0 
	jr nz,l1db3h		;1d91	20 20 	    
	jr nz,l1df6h		;1d93	20 61 	  a 
	ld l,h			;1d95	6c 	l 
	ld (hl),b			;1d96	70 	p 
	ld l,b			;1d97	68 	h 
	ld h,c			;1d98	61 	a 
	ld (hl),h			;1d99	74 	t 
	ld (hl),d			;1d9a	72 	r 
	ld l,a			;1d9b	6f 	o 
	ld l,(hl)			;1d9c	6e 	n 
	ld l,c			;1d9d	69 	i 
	ld h,e			;1d9e	63 	c 
	jr nz,l1dc1h		;1d9f	20 20 	    
	ld d,b			;1da1	50 	P 
	ld b,e			;1da2	43 	C 
l1da3h:
	jr nz,l1dc5h		;1da3	20 20 	    
	jr nz,l1dfah		;1da5	20 53 	  S 
	ld h,l			;1da7	65 	e 
	ld (hl),d			;1da8	72 	r 
	ld l,c			;1da9	69 	i 
	ld h,c			;1daa	61 	a 
	ld l,h			;1dab	6c 	l 
	jr nz,112		;1dac	20 6e 	  n 
	ld (hl),l			;1dae	75 	u 
	ld l,l			;1daf	6d 	m 
	ld h,d			;1db0	62 	b 
	ld h,l			;1db1	65 	e 
	ld (hl),d			;1db2	72 	r 
l1db3h:
	jr nz,34		;1db3	20 20 	    
	jr nc,l1de7h		;1db5	30 30 	0 0 
	jr nc,50		;1db7	30 30 	0 0 
	jr nc,l1ddbh		;1db9	30 20 	0   
l1dbbh:
	dec c			;1dbb	0d 	. 
l1dbch:
	ld a,(bc)			;1dbc	0a 	. 
	nop			;1dbd	00 	. 
	jp z,l0000h		;1dbe	ca 00 00 	. . . 
l1dc1h:
	nop			;1dc1	00 	. 
l1dc2h:
	nop			;1dc2	00 	. 
	nop			;1dc3	00 	. 
	nop			;1dc4	00 	. 
l1dc5h:
	nop			;1dc5	00 	. 
	push bc			;1dc6	c5 	. 
	push de			;1dc7	d5 	. 
	push hl			;1dc8	e5 	. 
	ld bc,0fff6h		;1dc9	01 f6 ff 	. . . 
	ld de,0ffffh		;1dcc	11 ff ff 	. . . 
	add hl,bc			;1dcf	09 	. 
	inc de			;1dd0	13 	. 
	jp c,0dfcfh		;1dd1	da cf df 	. . . 
	ld bc,l0009h+1		;1dd4	01 0a 00 	. . . 
	add hl,bc			;1dd7	09 	. 
	ex de,hl			;1dd8	eb 	. 
	ld a,h			;1dd9	7c 	| 
	or l			;1dda	b5 	. 
l1ddbh:
	call nz,0dfc6h		;1ddb	c4 c6 df 	. . . 
	ld a,e			;1dde	7b 	{ 
	add a,030h		;1ddf	c6 30 	. 0 
	push hl			;1de1	e5 	. 
	ld hl,(0dfbeh)		;1de2	2a be df 	* . . 
	ld (hl),a			;1de5	77 	w 
	inc hl			;1de6	23 	# 
l1de7h:
	ld (0dfbeh),hl		;1de7	22 be df 	" . . 
	ld hl,0dfc0h		;1dea	21 c0 df 	! . . 
	inc (hl)			;1ded	34 	4 
	pop hl			;1dee	e1 	. 
	pop hl			;1def	e1 	. 
	pop de			;1df0	d1 	. 
	pop bc			;1df1	c1 	. 
	ret			;1df2	c9 	. 
	ld b,d			;1df3	42 	B 
	ld c,c			;1df4	49 	I 
	ld c,a			;1df5	4f 	O 
l1df6h:
	ld d,e			;1df6	53 	S 
	jr nz,l1e42h		;1df7	20 49 	  I 
	ld c,c			;1df9	49 	I 
l1dfah:
	jr nz,34		;1dfa	20 20 	    
	ld h,c			;1dfc	61 	a 
	ld l,h			;1dfd	6c 	l 
	ld (hl),b			;1dfe	70 	p 
	ld l,b			;1dff	68 	h 
	ld h,c			;1e00	61 	a 
	ld (hl),h			;1e01	74 	t 
	ld (hl),d			;1e02	72 	r 
	ld l,a			;1e03	6f 	o 
	ld l,(hl)			;1e04	6e 	n 
	ld l,c			;1e05	69 	i 
	ld h,e			;1e06	63 	c 
	jr nz,l1e29h		;1e07	20 20 	    
	ld d,b			;1e09	50 	P 
	ld b,e			;1e0a	43 	C 
	jr nz,l1e2dh		;1e0b	20 20 	    
	jr nz,l1e65h		;1e0d	20 56 	  V 
	jr nz,l1e44h		;1e0f	20 33 	  3 
	ld l,030h		;1e11	2e 30 	. 0 
	jr nz,l1e35h		;1e13	20 20 	    
	jr nz,l1e48h		;1e15	20 31 	  1 
	inc sp			;1e17	33 	3 
	ld l,030h		;1e18	2e 30 	. 0 
	inc sp			;1e1a	33 	3 
	ld l,038h		;1e1b	2e 38 	. 8 
	inc (hl)			;1e1d	34 	4 
	nop			;1e1e	00 	. 
	nop			;1e1f	00 	. 
	nop			;1e20	00 	. 
	nop			;1e21	00 	. 
	nop			;1e22	00 	. 
	nop			;1e23	00 	. 
	nop			;1e24	00 	. 
	nop			;1e25	00 	. 
	nop			;1e26	00 	. 
	nop			;1e27	00 	. 
	nop			;1e28	00 	. 
l1e29h:
	nop			;1e29	00 	. 
	nop			;1e2a	00 	. 
	nop			;1e2b	00 	. 
	nop			;1e2c	00 	. 
l1e2dh:
	nop			;1e2d	00 	. 
	nop			;1e2e	00 	. 
	nop			;1e2f	00 	. 
	nop			;1e30	00 	. 
	nop			;1e31	00 	. 
	nop			;1e32	00 	. 
	nop			;1e33	00 	. 
	nop			;1e34	00 	. 
l1e35h:
	nop			;1e35	00 	. 
	nop			;1e36	00 	. 
	nop			;1e37	00 	. 
	nop			;1e38	00 	. 
	nop			;1e39	00 	. 
	nop			;1e3a	00 	. 
	nop			;1e3b	00 	. 
	nop			;1e3c	00 	. 
	nop			;1e3d	00 	. 
	nop			;1e3e	00 	. 
	nop			;1e3f	00 	. 
	nop			;1e40	00 	. 
	nop			;1e41	00 	. 
l1e42h:
	nop			;1e42	00 	. 
	nop			;1e43	00 	. 
l1e44h:
	nop			;1e44	00 	. 
	nop			;1e45	00 	. 
	nop			;1e46	00 	. 
	nop			;1e47	00 	. 
l1e48h:
	nop			;1e48	00 	. 
	nop			;1e49	00 	. 
	nop			;1e4a	00 	. 
	nop			;1e4b	00 	. 
	nop			;1e4c	00 	. 
	nop			;1e4d	00 	. 
	nop			;1e4e	00 	. 
	nop			;1e4f	00 	. 
	nop			;1e50	00 	. 
	nop			;1e51	00 	. 
	nop			;1e52	00 	. 
	nop			;1e53	00 	. 
	nop			;1e54	00 	. 
	nop			;1e55	00 	. 
	nop			;1e56	00 	. 
	nop			;1e57	00 	. 
	nop			;1e58	00 	. 
	nop			;1e59	00 	. 
	nop			;1e5a	00 	. 
	nop			;1e5b	00 	. 
	nop			;1e5c	00 	. 
	nop			;1e5d	00 	. 
	nop			;1e5e	00 	. 
	nop			;1e5f	00 	. 
	nop			;1e60	00 	. 
	nop			;1e61	00 	. 
	nop			;1e62	00 	. 
	nop			;1e63	00 	. 
	nop			;1e64	00 	. 
l1e65h:
	nop			;1e65	00 	. 
	nop			;1e66	00 	. 
	nop			;1e67	00 	. 
	nop			;1e68	00 	. 
	nop			;1e69	00 	. 
	nop			;1e6a	00 	. 
	nop			;1e6b	00 	. 
	nop			;1e6c	00 	. 
	nop			;1e6d	00 	. 
	nop			;1e6e	00 	. 
	nop			;1e6f	00 	. 
	nop			;1e70	00 	. 
	nop			;1e71	00 	. 
	nop			;1e72	00 	. 
	nop			;1e73	00 	. 
	nop			;1e74	00 	. 
	nop			;1e75	00 	. 
	nop			;1e76	00 	. 
	nop			;1e77	00 	. 
	nop			;1e78	00 	. 
	nop			;1e79	00 	. 
	nop			;1e7a	00 	. 
	nop			;1e7b	00 	. 
	nop			;1e7c	00 	. 
	nop			;1e7d	00 	. 
	nop			;1e7e	00 	. 
	nop			;1e7f	00 	. 
	nop			;1e80	00 	. 
	nop			;1e81	00 	. 
	nop			;1e82	00 	. 
	nop			;1e83	00 	. 
	nop			;1e84	00 	. 
	nop			;1e85	00 	. 
	nop			;1e86	00 	. 
	nop			;1e87	00 	. 
	nop			;1e88	00 	. 
	nop			;1e89	00 	. 
	nop			;1e8a	00 	. 
	nop			;1e8b	00 	. 
	nop			;1e8c	00 	. 
	nop			;1e8d	00 	. 
	nop			;1e8e	00 	. 
	nop			;1e8f	00 	. 
	nop			;1e90	00 	. 
	nop			;1e91	00 	. 
	nop			;1e92	00 	. 
	nop			;1e93	00 	. 
	nop			;1e94	00 	. 
	nop			;1e95	00 	. 
	nop			;1e96	00 	. 
	nop			;1e97	00 	. 
	nop			;1e98	00 	. 
	nop			;1e99	00 	. 
	nop			;1e9a	00 	. 
	nop			;1e9b	00 	. 
	nop			;1e9c	00 	. 
	nop			;1e9d	00 	. 
	nop			;1e9e	00 	. 
	nop			;1e9f	00 	. 
	nop			;1ea0	00 	. 
	nop			;1ea1	00 	. 
	nop			;1ea2	00 	. 
	nop			;1ea3	00 	. 
	nop			;1ea4	00 	. 
	nop			;1ea5	00 	. 
	nop			;1ea6	00 	. 
	nop			;1ea7	00 	. 
	nop			;1ea8	00 	. 
	nop			;1ea9	00 	. 
	nop			;1eaa	00 	. 
	nop			;1eab	00 	. 
	nop			;1eac	00 	. 
	nop			;1ead	00 	. 
	nop			;1eae	00 	. 
	nop			;1eaf	00 	. 
	nop			;1eb0	00 	. 
	nop			;1eb1	00 	. 
	nop			;1eb2	00 	. 
	nop			;1eb3	00 	. 
	nop			;1eb4	00 	. 
	nop			;1eb5	00 	. 
	nop			;1eb6	00 	. 
	nop			;1eb7	00 	. 
	nop			;1eb8	00 	. 
	nop			;1eb9	00 	. 
	nop			;1eba	00 	. 
	nop			;1ebb	00 	. 
	nop			;1ebc	00 	. 
	nop			;1ebd	00 	. 
	nop			;1ebe	00 	. 
	nop			;1ebf	00 	. 
	nop			;1ec0	00 	. 
	nop			;1ec1	00 	. 
	nop			;1ec2	00 	. 
	nop			;1ec3	00 	. 
	nop			;1ec4	00 	. 
	nop			;1ec5	00 	. 
	nop			;1ec6	00 	. 
	nop			;1ec7	00 	. 
	nop			;1ec8	00 	. 
	nop			;1ec9	00 	. 
	nop			;1eca	00 	. 
	nop			;1ecb	00 	. 
	nop			;1ecc	00 	. 
	nop			;1ecd	00 	. 
	nop			;1ece	00 	. 
	nop			;1ecf	00 	. 
	nop			;1ed0	00 	. 
	nop			;1ed1	00 	. 
	nop			;1ed2	00 	. 
	nop			;1ed3	00 	. 
	nop			;1ed4	00 	. 
	nop			;1ed5	00 	. 
	nop			;1ed6	00 	. 
	nop			;1ed7	00 	. 
	nop			;1ed8	00 	. 
	nop			;1ed9	00 	. 
	nop			;1eda	00 	. 
	nop			;1edb	00 	. 
	nop			;1edc	00 	. 
	nop			;1edd	00 	. 
	nop			;1ede	00 	. 
	nop			;1edf	00 	. 
	nop			;1ee0	00 	. 
	nop			;1ee1	00 	. 
	nop			;1ee2	00 	. 
	nop			;1ee3	00 	. 
	nop			;1ee4	00 	. 
	nop			;1ee5	00 	. 
	nop			;1ee6	00 	. 
	nop			;1ee7	00 	. 
	nop			;1ee8	00 	. 
	nop			;1ee9	00 	. 
	nop			;1eea	00 	. 
	nop			;1eeb	00 	. 
	nop			;1eec	00 	. 
	nop			;1eed	00 	. 
	nop			;1eee	00 	. 
	nop			;1eef	00 	. 
	nop			;1ef0	00 	. 
	nop			;1ef1	00 	. 
	nop			;1ef2	00 	. 
	nop			;1ef3	00 	. 
	nop			;1ef4	00 	. 
	nop			;1ef5	00 	. 
	nop			;1ef6	00 	. 
	nop			;1ef7	00 	. 
	nop			;1ef8	00 	. 
	nop			;1ef9	00 	. 
	nop			;1efa	00 	. 
	nop			;1efb	00 	. 
	nop			;1efc	00 	. 
	nop			;1efd	00 	. 
	nop			;1efe	00 	. 
	nop			;1eff	00 	. 
	nop			;1f00	00 	. 
	nop			;1f01	00 	. 
	nop			;1f02	00 	. 
	nop			;1f03	00 	. 
	nop			;1f04	00 	. 
	nop			;1f05	00 	. 
	nop			;1f06	00 	. 
	nop			;1f07	00 	. 
	nop			;1f08	00 	. 
	nop			;1f09	00 	. 
	nop			;1f0a	00 	. 
	nop			;1f0b	00 	. 
	nop			;1f0c	00 	. 
	nop			;1f0d	00 	. 
	nop			;1f0e	00 	. 
	nop			;1f0f	00 	. 
	nop			;1f10	00 	. 
	nop			;1f11	00 	. 
	nop			;1f12	00 	. 
	nop			;1f13	00 	. 
	nop			;1f14	00 	. 
	nop			;1f15	00 	. 
	nop			;1f16	00 	. 
	nop			;1f17	00 	. 
	nop			;1f18	00 	. 
	nop			;1f19	00 	. 
	nop			;1f1a	00 	. 
	nop			;1f1b	00 	. 
	nop			;1f1c	00 	. 
	nop			;1f1d	00 	. 
	nop			;1f1e	00 	. 
	nop			;1f1f	00 	. 
	nop			;1f20	00 	. 
	nop			;1f21	00 	. 
	nop			;1f22	00 	. 
	nop			;1f23	00 	. 
	nop			;1f24	00 	. 
	nop			;1f25	00 	. 
	nop			;1f26	00 	. 
	nop			;1f27	00 	. 
	nop			;1f28	00 	. 
	nop			;1f29	00 	. 
	nop			;1f2a	00 	. 
	nop			;1f2b	00 	. 
	nop			;1f2c	00 	. 
	nop			;1f2d	00 	. 
	nop			;1f2e	00 	. 
	nop			;1f2f	00 	. 
	nop			;1f30	00 	. 
	nop			;1f31	00 	. 
	nop			;1f32	00 	. 
	nop			;1f33	00 	. 
	nop			;1f34	00 	. 
	nop			;1f35	00 	. 
	nop			;1f36	00 	. 
	nop			;1f37	00 	. 
	nop			;1f38	00 	. 
	nop			;1f39	00 	. 
	nop			;1f3a	00 	. 
	nop			;1f3b	00 	. 
	nop			;1f3c	00 	. 
	nop			;1f3d	00 	. 
	nop			;1f3e	00 	. 
	nop			;1f3f	00 	. 
	nop			;1f40	00 	. 
	nop			;1f41	00 	. 
	nop			;1f42	00 	. 
	nop			;1f43	00 	. 
	nop			;1f44	00 	. 
	nop			;1f45	00 	. 
	nop			;1f46	00 	. 
	nop			;1f47	00 	. 
	nop			;1f48	00 	. 
	nop			;1f49	00 	. 
	nop			;1f4a	00 	. 
	nop			;1f4b	00 	. 
	nop			;1f4c	00 	. 
	nop			;1f4d	00 	. 
	nop			;1f4e	00 	. 
	nop			;1f4f	00 	. 
	nop			;1f50	00 	. 
	nop			;1f51	00 	. 
	nop			;1f52	00 	. 
	nop			;1f53	00 	. 
	nop			;1f54	00 	. 
	nop			;1f55	00 	. 
	nop			;1f56	00 	. 
	nop			;1f57	00 	. 
	nop			;1f58	00 	. 
	nop			;1f59	00 	. 
	nop			;1f5a	00 	. 
	nop			;1f5b	00 	. 
	nop			;1f5c	00 	. 
	nop			;1f5d	00 	. 
	nop			;1f5e	00 	. 
	nop			;1f5f	00 	. 
	nop			;1f60	00 	. 
	nop			;1f61	00 	. 
	nop			;1f62	00 	. 
	nop			;1f63	00 	. 
	nop			;1f64	00 	. 
	nop			;1f65	00 	. 
	nop			;1f66	00 	. 
	nop			;1f67	00 	. 
	nop			;1f68	00 	. 
	nop			;1f69	00 	. 
	nop			;1f6a	00 	. 
	nop			;1f6b	00 	. 
	nop			;1f6c	00 	. 
	nop			;1f6d	00 	. 
	nop			;1f6e	00 	. 
	nop			;1f6f	00 	. 
	nop			;1f70	00 	. 
	nop			;1f71	00 	. 
	nop			;1f72	00 	. 
	nop			;1f73	00 	. 
	nop			;1f74	00 	. 
	nop			;1f75	00 	. 
	nop			;1f76	00 	. 
	nop			;1f77	00 	. 
	nop			;1f78	00 	. 
	nop			;1f79	00 	. 
	nop			;1f7a	00 	. 
	nop			;1f7b	00 	. 
	nop			;1f7c	00 	. 
	nop			;1f7d	00 	. 
	nop			;1f7e	00 	. 
	nop			;1f7f	00 	. 
	nop			;1f80	00 	. 
	nop			;1f81	00 	. 
	nop			;1f82	00 	. 
	nop			;1f83	00 	. 
	nop			;1f84	00 	. 
	nop			;1f85	00 	. 
	nop			;1f86	00 	. 
	nop			;1f87	00 	. 
	nop			;1f88	00 	. 
	nop			;1f89	00 	. 
	nop			;1f8a	00 	. 
	nop			;1f8b	00 	. 
	nop			;1f8c	00 	. 
	nop			;1f8d	00 	. 
	nop			;1f8e	00 	. 
	nop			;1f8f	00 	. 
	nop			;1f90	00 	. 
	nop			;1f91	00 	. 
	nop			;1f92	00 	. 
	nop			;1f93	00 	. 
	nop			;1f94	00 	. 
	nop			;1f95	00 	. 
	nop			;1f96	00 	. 
	nop			;1f97	00 	. 
	nop			;1f98	00 	. 
	nop			;1f99	00 	. 
	nop			;1f9a	00 	. 
	nop			;1f9b	00 	. 
	nop			;1f9c	00 	. 
	nop			;1f9d	00 	. 
	nop			;1f9e	00 	. 
	nop			;1f9f	00 	. 
	nop			;1fa0	00 	. 
	nop			;1fa1	00 	. 
	nop			;1fa2	00 	. 
	nop			;1fa3	00 	. 
	nop			;1fa4	00 	. 
	nop			;1fa5	00 	. 
	nop			;1fa6	00 	. 
	nop			;1fa7	00 	. 
	nop			;1fa8	00 	. 
	nop			;1fa9	00 	. 
	nop			;1faa	00 	. 
	nop			;1fab	00 	. 
	nop			;1fac	00 	. 
	nop			;1fad	00 	. 
	nop			;1fae	00 	. 
	nop			;1faf	00 	. 
	nop			;1fb0	00 	. 
	nop			;1fb1	00 	. 
	nop			;1fb2	00 	. 
	nop			;1fb3	00 	. 
	nop			;1fb4	00 	. 
	nop			;1fb5	00 	. 
	nop			;1fb6	00 	. 
	nop			;1fb7	00 	. 
	nop			;1fb8	00 	. 
	nop			;1fb9	00 	. 
	nop			;1fba	00 	. 
	nop			;1fbb	00 	. 
	nop			;1fbc	00 	. 
	nop			;1fbd	00 	. 
	nop			;1fbe	00 	. 
	nop			;1fbf	00 	. 
	nop			;1fc0	00 	. 
	nop			;1fc1	00 	. 
	nop			;1fc2	00 	. 
	nop			;1fc3	00 	. 
	nop			;1fc4	00 	. 
	nop			;1fc5	00 	. 
	nop			;1fc6	00 	. 
	nop			;1fc7	00 	. 
	nop			;1fc8	00 	. 
	nop			;1fc9	00 	. 
	nop			;1fca	00 	. 
	nop			;1fcb	00 	. 
	nop			;1fcc	00 	. 
	nop			;1fcd	00 	. 
	nop			;1fce	00 	. 
	nop			;1fcf	00 	. 
	nop			;1fd0	00 	. 
	nop			;1fd1	00 	. 
	nop			;1fd2	00 	. 
	nop			;1fd3	00 	. 
	nop			;1fd4	00 	. 
	nop			;1fd5	00 	. 
	nop			;1fd6	00 	. 
	nop			;1fd7	00 	. 
	nop			;1fd8	00 	. 
	nop			;1fd9	00 	. 
	nop			;1fda	00 	. 
	nop			;1fdb	00 	. 
	nop			;1fdc	00 	. 
	nop			;1fdd	00 	. 
	nop			;1fde	00 	. 
	nop			;1fdf	00 	. 
	nop			;1fe0	00 	. 
	nop			;1fe1	00 	. 
	nop			;1fe2	00 	. 
	nop			;1fe3	00 	. 
	nop			;1fe4	00 	. 
	nop			;1fe5	00 	. 
	nop			;1fe6	00 	. 
	nop			;1fe7	00 	. 
	nop			;1fe8	00 	. 
	nop			;1fe9	00 	. 
	nop			;1fea	00 	. 
	nop			;1feb	00 	. 
	nop			;1fec	00 	. 
	nop			;1fed	00 	. 
	nop			;1fee	00 	. 
	nop			;1fef	00 	. 
	nop			;1ff0	00 	. 
	nop			;1ff1	00 	. 
	nop			;1ff2	00 	. 
	nop			;1ff3	00 	. 
	nop			;1ff4	00 	. 
	nop			;1ff5	00 	. 
	nop			;1ff6	00 	. 
	nop			;1ff7	00 	. 
	nop			;1ff8	00 	. 
	nop			;1ff9	00 	. 
	nop			;1ffa	00 	. 
	nop			;1ffb	00 	. 
	nop			;1ffc	00 	. 
	nop			;1ffd	00 	. 
	nop			;1ffe	00 	. 
	nop			;1fff	00 	. 

	end
