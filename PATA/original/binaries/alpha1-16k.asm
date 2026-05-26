; z80dasm 1.1.5
; command line: z80dasm -a -l -t -z -g 0x0000 alpha1-16k.bin

	org	00000h

l0000h:
	ld sp,05fffh		;0000	31 ff 5f 	1 . _ 
	ld hl,0e469h		;0003	21 69 e4 	! i . 
	res 3,(hl)		;0006	cb 9e 	. . 
	ld a,(hl)			;0008	7e 	~ 
	out (020h),a		;0009	d3 20 	.   
	push hl			;000b	e5 	. 
	call 0e45dh		;000c	cd 5d e4 	. ] . 
	pop hl			;000f	e1 	. 
	set 3,(hl)		;0010	cb de 	. . 
	ld a,(hl)			;0012	7e 	~ 
	out (020h),a		;0013	d3 20 	.   
	ld a,031h		;0015	3e 31 	> 1 
	ld (0e466h),a		;0017	32 66 e4 	2 f . 
	call 0e44bh		;001a	cd 4b e4 	. K . 
	ld hl,0c22bh		;001d	21 2b c2 	! + . 
	ld de,06000h		;0020	11 00 60 	. . ` 
	ld bc,l00cch		;0023	01 cc 00 	. . . 
	ldir		;0026	ed b0 	. . 
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
	jp 00005h		;018f	c3 05 00 	. . . 
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
	jp 00005h		;01ba	c3 05 00 	. . . 
	ld e,a			;01bd	5f 	_ 
	ld c,00eh		;01be	0e 0e 	. . 
	jp 00005h		;01c0	c3 05 00 	. . . 
	call 00005h		;01c3	cd 05 00 	. . . 
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
	jp 00005h		;01f1	c3 05 00 	. . . 
	call 00005h		;01f4	cd 05 00 	. . . 
	or a			;01f7	b7 	. 
	ret			;01f8	c9 	. 
	ld c,014h		;01f9	0e 14 	. . 
	jp 0c3f4h		;01fb	c3 f4 c3 	. . . 
	defb 011h,0cdh		;01fe	11 cd 	. . 

	end
