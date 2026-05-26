; z80dasm 1.1.5
; command line: z80dasm -a -l roycpm-1_64k.td0.hex

	org	00100h

	jr nc,l0132h		;0100
	jr nc,l0134h		;0102
	jr nc,l0136h		;0104
	jr nc,$+50		;0106
	jr nz,l012ah		;0108
	dec (hl)			;010a
	inc (hl)			;010b
	jr nz,$+54		;010c
	inc (hl)			;010e
	jr nz,l0141h		;010f
	jr nc,l0133h		;0111
	inc (hl)			;0113
	jr nc,l0136h		;0114
	ld sp,02035h		;0116
	jr nc,l014bh		;0119
	jr nz,$+50		;011b
	ld (03820h),a		;011d
	ld sp,02020h		;0120
	jr nc,l0155h		;0123
	jr nz,$+50		;0125
	ld (06620h),a		;0127
l012ah:
	ld (hl),020h		;012a
	inc (hl)			;012c
	ld h,c			;012d
	jr nz,l0169h		;012e
	jr nc,$+34		;0130
l0132h:
	dec (hl)			;0132
l0133h:
	scf			;0133
l0134h:
	jr nz,l016ch		;0134
l0136h:
	ld h,d			;0136
	jr nz,l0169h		;0137
	jr nc,$+34		;0139
	jr nz,l01b9h		;013b
	ld d,h			;013d
	ld b,h			;013e
	ld l,040h		;013f
l0141h:
	ld l,02eh		;0141
	ld l,02eh		;0143
	ld l,02eh		;0145
	ld l,04ah		;0147
	ld l,057h		;0149
l014bh:
	ld l,e			;014b
	ld l,07ch		;014c
	ld a,(bc)			;014e
	jr nc,$+50		;014f
	jr nc,l0183h		;0151
	jr nc,l0185h		;0153
l0155h:
	ld sp,02030h		;0155
	jr nz,l0191h		;0158
	ld (03020h),a		;015a
	jr nc,l017fh		;015d
	jr nc,l01c2h		;015f
	jr nz,l0193h		;0161
	scf			;0163
	jr nz,l0199h		;0164
	ld h,c			;0166
	jr nz,l019ah		;0167
l0169h:
	dec (hl)			;0169
	jr nz,$+55		;016a
l016ch:
	ld (03620h),a		;016c
	ld h,(hl)			;016f
	jr nz,$+34		;0170
	scf			;0172
	add hl,sp			;0173
	jr nz,l01ach		;0174
	ld sp,03620h		;0176
	ld h,e			;0179
	jr nz,$+52		;017a
	jr nc,l019eh		;017c
	inc (hl)			;017e
l017fh:
	ld sp,03620h		;017f
	ld h,e			;0182
l0183h:
	jr nz,l01bch		;0183
l0185h:
	jr nc,l01a7h		;0185
	ld (hl),038h		;0187
	jr nz,$+34		;0189
	ld a,h			;018b
	ld (hl),d			;018c
	ld l,02eh		;018d
	ld l,03ah		;018f
l0191h:
	ld l,052h		;0191
l0193h:
	ld l,a			;0193
	ld a,c			;0194
	ld h,c			;0195
	ld l,h			;0196
	jr nz,l01dah		;0197
l0199h:
	ld l,h			;0199
l019ah:
	ld (hl),b			;019a
	ld l,b			;019b
	ld a,h			;019c
	ld a,(bc)			;019d
l019eh:
	jr nc,$+50		;019e
	jr nc,l01d2h		;01a0
	jr nc,l01d4h		;01a2
	ld (02030h),a		;01a4
l01a7h:
	jr nz,l01dfh		;01a7
	ld sp,03720h		;01a9
l01ach:
	inc (hl)			;01ac
	jr nz,$+57		;01ad
	ld (03620h),a		;01af
	ld h,(hl)			;01b2
	jr nz,l01ebh		;01b3
	ld h,l			;01b5
	jr nz,$+56		;01b6
	add hl,sp			;01b8
l01b9h:
	jr nz,l01f1h		;01b9
	inc sp			;01bb
l01bch:
	jr nz,$+52		;01bc
	jr nc,l01e0h		;01be
	jr nz,$+55		;01c0
l01c2h:
	jr nc,l01e4h		;01c2
	inc (hl)			;01c4
	inc sp			;01c5
	jr nz,$+52		;01c6
	jr nc,l01eah		;01c8
	dec (hl)			;01ca
	inc sp			;01cb
	jr nz,l0205h		;01cc
	add hl,sp			;01ce
	jr nz,$+57		;01cf
	inc sp			;01d1
l01d2h:
	jr nz,l020bh		;01d2
l01d4h:
	inc (hl)			;01d4
	jr nz,l020dh		;01d5
	dec (hl)			;01d7
	jr nz,$+34		;01d8
l01dah:
	ld a,h			;01da
	ld h,c			;01db
	ld (hl),h			;01dc
	ld (hl),d			;01dd
	ld l,a			;01de
l01dfh:
	ld l,(hl)			;01df
l01e0h:
	ld l,c			;01e0
	ld h,e			;01e1
	jr nz,l0234h		;01e2
l01e4h:
	ld b,e			;01e4
	jr nz,l023ah		;01e5
	ld a,c			;01e7
	ld (hl),e			;01e8
	ld (hl),h			;01e9
l01eah:
	ld h,l			;01ea
l01ebh:
	ld a,h			;01eb
	ld a,(bc)			;01ec
	jr nc,$+50		;01ed
	jr nc,$+50		;01ef
l01f1h:
	jr nc,l0223h		;01f1
	inc sp			;01f3
	jr nc,$+34		;01f4
	jr nz,$+56		;01f6
	ld h,h			;01f8
	jr nz,l022bh		;01f9
	jr nc,l021dh		;01fb
	inc sp			;01fd
	dec (hl)			;01fe
	jr nz,l0234h		;01ff
	ld (hl),020h		;0201
	inc (hl)			;0203
	ld h,d			;0204
l0205h:
	jr nz,l0239h		;0205
	jr nc,l0229h		;0207
	inc (hl)			;0209
	inc sp			;020a
l020bh:
	jr nz,l0242h		;020b
l020dh:
	jr nc,l022fh		;020d
	jr nz,l0243h		;020f
	ld h,(hl)			;0211
	jr nz,l0248h		;0212
	ld h,h			;0214
	jr nz,$+52		;0215
	jr nc,l0239h		;0217
	inc sp			;0219
	ld (03220h),a		;021a
l021dh:
	ld h,l			;021d
	jr nz,l0253h		;021e
	ld (03220h),a		;0220
l0223h:
	ld h,(hl)			;0223
	jr nz,l0259h		;0224
	inc sp			;0226
	jr nz,$+34		;0227
l0229h:
	ld a,h			;0229
	ld l,l			;022a
l022bh:
	ld l,035h		;022b
	ld (hl),04bh		;022d
l022fh:
	jr nz,l0274h		;022f
	ld d,b			;0231
	cpl			;0232
	ld c,l			;0233
l0234h:
	jr nz,$+52		;0234
	ld l,032h		;0236
	cpl			;0238
l0239h:
	inc sp			;0239
l023ah:
	ld a,h			;023a
	ld a,(bc)			;023b
	jr nc,$+50		;023c
	jr nc,l0270h		;023e
	jr nc,l0272h		;0240
l0242h:
	inc (hl)			;0242
l0243h:
	jr nc,l0265h		;0243
	jr nz,l0279h		;0245
	ld h,l			;0247
l0248h:
	jr nz,l027dh		;0248
	ld sp,03220h		;024a
	jr nc,l026fh		;024d
	dec (hl)			;024f
	inc sp			;0250
	jr nz,$+55		;0251
l0253h:
	add hl,sp			;0253
	jr nz,l028bh		;0254
	inc sp			;0256
	jr nz,$+55		;0257
l0259h:
	inc (hl)			;0259
	jr nz,$+54		;025a
	dec (hl)			;025c
	jr nz,l027fh		;025d
	inc (hl)			;025f
	ld h,h			;0260
	jr nz,$+52		;0261
	jr nc,l0285h		;0263
l0265h:
	inc (hl)			;0265
	inc (hl)			;0266
	jr nz,l029dh		;0267
	add hl,sp			;0269
	jr nz,$+55		;026a
	inc sp			;026c
	jr nz,l02a3h		;026d
l026fh:
	ld h,d			;026f
l0270h:
	jr nz,l02a2h		;0270
l0272h:
	jr nc,l0294h		;0272
l0274h:
	dec (hl)			;0274
	inc sp			;0275
	jr nz,$+34		;0276
	ld a,h			;0278
l0279h:
	ld l,031h		;0279
	jr nz,$+85		;027b
l027dh:
	ld e,c			;027d
	ld d,e			;027e
l027fh:
	ld d,h			;027f
	ld b,l			;0280
	ld c,l			;0281
	jr nz,l02c8h		;0282
	ld c,c			;0284
l0285h:
	ld d,e			;0285
	ld c,e			;0286
	ld l,053h		;0287
	ld a,h			;0289
	ld a,(bc)			;028a
l028bh:
	jr nc,$+50		;028b
	jr nc,$+50		;028d
	jr nc,l02c1h		;028f
	dec (hl)			;0291
	jr nc,$+34		;0292
l0294h:
	jr nz,l02cch		;0294
	dec (hl)			;0296
	jr nz,$+57		;0297
	ld (03620h),a		;0299
	add hl,sp			;029c
l029dh:
	jr nz,l02d5h		;029d
	ld sp,03620h		;029f
l02a2h:
	ld h,e			;02a2
l02a3h:
	jr nz,l02d7h		;02a3
	jr nc,l02c7h		;02a5
	ld (02033h),a		;02a7
	ld (02030h),a		;02aa
	jr nz,l02e2h		;02ad
	jr nc,l02d1h		;02af
	inc sp			;02b1
	ld sp,03320h		;02b2
	scf			;02b5
	jr nz,l02ebh		;02b6
	jr nc,l02dah		;02b8
	inc sp			;02ba
	inc sp			;02bb
	jr nz,l02eeh		;02bc
	jr nc,l02e0h		;02be
	inc (hl)			;02c0
l02c1h:
	inc sp			;02c1
	jr nz,l02fah		;02c2
	ld h,(hl)			;02c4
	jr nz,l02e7h		;02c5
l02c7h:
	ld a,h			;02c7
l02c8h:
	ld h,l			;02c8
	ld (hl),d			;02c9
	ld l,c			;02ca
	ld h,c			;02cb
l02cch:
	ld l,h			;02cc
	jr nz,l02f2h		;02cd
	jr nz,l0301h		;02cf
l02d1h:
	ld sp,03037h		;02d1
	inc sp			;02d4
l02d5h:
	ld l,043h		;02d5
l02d7h:
	ld l,a			;02d7
	ld a,h			;02d8
	ld a,(bc)			;02d9
l02dah:
	jr nc,l030ch		;02da
	jr nc,l030eh		;02dc
	jr nc,l0310h		;02de
l02e0h:
	ld (hl),030h		;02e0
l02e2h:
	jr nz,l0304h		;02e2
	scf			;02e4
	jr nc,l0307h		;02e5
l02e7h:
	scf			;02e7
	add hl,sp			;02e8
	jr nz,$+57		;02e9
l02ebh:
	ld (03620h),a		;02eb
l02eeh:
	add hl,sp			;02ee
	jr nz,$+56		;02ef
	scf			;02f1
l02f2h:
	jr nz,$+56		;02f2
	jr c,$+34		;02f4
	scf			;02f6
	inc (hl)			;02f7
	jr nz,$+52		;02f8
l02fah:
	jr nc,l031ch		;02fa
	jr nz,$+53		;02fc
	ld sp,03320h		;02fe
l0301h:
	add hl,sp			;0301
	jr nz,l0337h		;0302
l0304h:
	jr c,l0326h		;0304
	inc sp			;0306
l0307h:
	inc (hl)			;0307
	jr nz,l033ch		;0308
	jr nc,$+34		;030a
l030ch:
	ld (hl),032h		;030c
l030eh:
	jr nz,$+57		;030e
l0310h:
	add hl,sp			;0310
	jr nz,$+52		;0311
	jr nc,l0335h		;0313
	jr nz,l0393h		;0315
	ld (hl),b			;0317
	ld a,c			;0318
	ld (hl),d			;0319
	ld l,c			;031a
	ld h,a			;031b
l031ch:
	ld l,b			;031c
	ld (hl),h			;031d
	jr nz,l0351h		;031e
	add hl,sp			;0320
	jr c,l0357h		;0321
	jr nz,$+100		;0323
	ld a,c			;0325
l0326h:
	jr nz,$+126		;0326
	ld a,(bc)			;0328
	jr nc,l035bh		;0329
	jr nc,l035dh		;032b
	jr nc,l035fh		;032d
	scf			;032f
	jr nc,$+34		;0330
	jr nz,$+55		;0332
	inc (hl)			;0334
l0335h:
	jr nz,l036bh		;0335
l0337h:
	ld sp,03220h		;0337
	jr nc,$+34		;033a
l033ch:
	dec (hl)			;033c
	ld (03420h),a		;033d
	ld h,(hl)			;0340
	jr nz,l0378h		;0341
	add hl,sp			;0343
	jr nz,l037ah		;0344
	ld sp,03420h		;0346
	ld h,e			;0349
	jr nz,l036ch		;034a
	ld (02066h),a		;034c
	inc (hl)			;034f
	inc (hl)			;0350
l0351h:
	jr nz,l0388h		;0351
	ld (03420h),a		;0353
	add hl,sp			;0356
l0357h:
	jr nz,$+50		;0357
	jr nc,$+34		;0359
l035bh:
	jr nc,$+50		;035b
l035dh:
	jr nz,l038fh		;035d
l035fh:
	jr nc,$+34		;035f
	jr nc,l0393h		;0361
	jr nz,$+34		;0363
	ld a,h			;0365
	ld d,h			;0366
	ld b,c			;0367
	jr nz,l03bch		;0368
	ld c,a			;036a
l036bh:
	ld e,c			;036b
l036ch:
	ld b,c			;036c
	ld c,h			;036d
	cpl			;036e
	ld b,h			;036f
	ld d,d			;0370
	ld c,c			;0371
	ld l,02eh		;0372
	ld l,02eh		;0374
	ld a,h			;0376
	ld a,(bc)			;0377
l0378h:
	jr nc,$+50		;0378
l037ah:
	jr nc,$+50		;037a
	jr nc,l03aeh		;037c
	jr c,$+50		;037e
	jr nz,l03a2h		;0380
	jr nc,l03b4h		;0382
	jr nz,l03b7h		;0384
	jr nc,l03a8h		;0386
l0388h:
	jr nc,l03bah		;0388
	jr nz,l03bch		;038a
	jr nc,l03aeh		;038c
	inc (hl)			;038e
l038fh:
	jr nc,l03b1h		;038f
	jr nc,$+50		;0391
l0393h:
	jr nz,$+50		;0393
	jr nc,l03b7h		;0395
	jr nc,$+51		;0397
	jr nz,$+34		;0399
	jr nc,l03ceh		;039b
	jr nz,$+50		;039d
	jr nc,$+34		;039f
	inc (hl)			;03a1
l03a2h:
	add hl,sp			;03a2
	jr nz,l03d5h		;03a3
	ld sp,03020h		;03a5
l03a8h:
	ld sp,03020h		;03a8
	jr nc,l03cdh		;03ab
	inc sp			;03ad
l03aeh:
	ld sp,06620h		;03ae
l03b1h:
	ld h,(hl)			;03b1
	jr nz,$+34		;03b2
l03b4h:
	ld a,h			;03b4
	ld l,02eh		;03b5
l03b7h:
	ld l,02eh		;03b7
	ld b,b			;03b9
l03bah:
	ld l,02eh		;03ba
l03bch:
	ld l,02eh		;03bc
	ld l,049h		;03be
	ld l,02eh		;03c0
	ld l,031h		;03c2
	ld l,07ch		;03c4
	ld a,(bc)			;03c6
	jr nc,$+50		;03c7
	jr nc,$+50		;03c9
	jr nc,l03fdh		;03cb
l03cdh:
	add hl,sp			;03cd
l03ceh:
	jr nc,$+34		;03ce
	jr nz,$+55		;03d0
	ld h,(hl)			;03d2
	jr nz,$+52		;03d3
l03d5h:
	ld sp,03620h		;03d5
	add hl,sp			;03d8
	jr nz,l0440h		;03d9
	inc (hl)			;03db
	jr nz,l0441h		;03dc
	ld h,d			;03de
	jr nz,l041ah		;03df
	ld h,l			;03e1
	jr nz,$+57		;03e2
	ld h,l			;03e4
	jr nz,$+102		;03e5
	inc sp			;03e7
	jr nz,l040ah		;03e8
	ld (02030h),a		;03ea
	ld h,l			;03ed
	dec (hl)			;03ee
	jr nz,l0454h		;03ef
	ld h,h			;03f1
	jr nz,l0429h		;03f2
	ld h,h			;03f4
	jr nz,$+103		;03f5
	inc (hl)			;03f7
	jr nz,l045fh		;03f8
	ld sp,06320h		;03fa
l03fdh:
	ld h,d			;03fd
	jr nz,l0464h		;03fe
	ld h,l			;0400
	jr nz,$+34		;0401
	ld a,h			;0403
	ld e,a			;0404
	ld hl,02e69h		;0405
	ld l,02eh		;0408
l040ah:
	ld a,(hl)			;040a
	ld l,020h		;040b
	ld l,02eh		;040d
	ld e,l			;040f
	ld l,02eh		;0410
	ld l,02eh		;0412
	ld a,h			;0414
	ld a,(bc)			;0415
	jr nc,$+50		;0416
	jr nc,$+50		;0418
l041ah:
	jr nc,l044ch		;041a
	ld h,c			;041c
	jr nc,$+34		;041d
	jr nz,l0458h		;041f
	ld h,l			;0421
	jr nz,$+102		;0422
	inc sp			;0424
	jr nz,$+52		;0425
	jr nc,l0449h		;0427
l0429h:
	inc sp			;0429
	ld h,l			;042a
	jr nz,l0460h		;042b
	ld sp,03320h		;042d
	ld (03620h),a		;0430
	ld (hl),020h		;0433
	ld h,l			;0435
	inc (hl)			;0436
	jr nz,$+34		;0437
	ld h,e			;0439
	ld h,h			;043a
	jr nz,$+54		;043b
	ld h,d			;043d
	jr nz,l04a5h		;043e
l0440h:
	inc (hl)			;0440
l0441h:
	jr nz,$+52		;0441
	ld sp,03220h		;0443
	ld h,d			;0446
	jr nz,$+101		;0447
l0449h:
	ld (03120h),a		;0449
l044ch:
	ld sp,03020h		;044c
	jr nc,$+34		;044f
	jr nz,l04cfh		;0451
	ld a,(hl)			;0453
l0454h:
	ld l,020h		;0454
	ld a,031h		;0456
l0458h:
	ld (02e66h),a		;0458
	ld l,04bh		;045b
	ld l,021h		;045d
l045fh:
	dec hl			;045f
l0460h:
	ld l,02eh		;0460
	ld l,07ch		;0462
l0464h:
	ld a,(bc)			;0464
	jr nc,$+50		;0465
	jr nc,l0499h		;0467
	jr nc,l049bh		;0469
	ld h,d			;046b
	jr nc,$+34		;046c
	jr nz,$+56		;046e
	jr nc,l0492h		;0470
	jr nc,l04a5h		;0472
	jr nz,l04d9h		;0474
	ld h,e			;0476
	jr nz,l04a9h		;0477
	jr nc,l049bh		;0479
	ld h,l			;047b
	ld h,h			;047c
	jr nz,l04e1h		;047d
	jr nc,$+34		;047f
	ld h,e			;0481
	inc sp			;0482
	jr nz,$+50		;0483
	jr nc,l04a7h		;0485
	jr nz,l04bfh		;0487
	jr nc,l04abh		;0489
	jr nc,$+103		;048b
	jr nz,l04c1h		;048d
	ld h,c			;048f
	jr nz,l04f5h		;0490
l0492h:
	ld h,h			;0492
	jr nz,l04c6h		;0493
	ld (06520h),a		;0495
	inc (hl)			;0498
l0499h:
	jr nz,$+52		;0499
l049bh:
	ld sp,03020h		;049b
	jr nc,$+34		;049e
	jr nz,l051eh		;04a0
	ld h,b			;04a2
	ld l,02eh		;04a3
l04a5h:
	ld l,02eh		;04a5
l04a7h:
	ld l,02eh		;04a7
l04a9h:
	ld l,060h		;04a9
l04abh:
	ld l,02ah		;04ab
	ld l,02eh		;04ad
	ld l,021h		;04af
	ld l,07ch		;04b1
	ld a,(bc)			;04b3
	jr nc,l04e6h		;04b4
	jr nc,l04e8h		;04b6
	jr nc,l04eah		;04b8
	ld h,e			;04ba
	jr nc,l04ddh		;04bb
	jr nz,$+50		;04bd
l04bfh:
	jr nc,l04e1h		;04bf
l04c1h:
	ld (02032h),a		;04c1
	ld h,e			;04c4
	add hl,sp			;04c5
l04c6h:
	jr nz,$+56		;04c6
	jr nc,l04eah		;04c8
	inc sp			;04ca
	ld h,c			;04cb
	jr nz,l0531h		;04cc
	ld h,d			;04ce
l04cfh:
	jr nz,l0507h		;04cf
	jr nc,l04f3h		;04d1
	inc (hl)			;04d3
	ld h,(hl)			;04d4
	jr nz,$+34		;04d5
	ld h,(hl)			;04d7
	ld h,l			;04d8
l04d9h:
	jr nz,$+52		;04d9
	jr nc,l04fdh		;04db
l04ddh:
	jr nc,$+56		;04dd
	jr nz,l0511h		;04df
l04e1h:
	jr nc,l0503h		;04e1
	inc sp			;04e3
	jr c,$+34		;04e4
l04e6h:
	jr nc,$+54		;04e6
l04e8h:
	jr nz,l051ah		;04e8
l04eah:
	ld h,l			;04ea
	jr nz,l051eh		;04eb
	ld h,(hl)			;04ed
	jr nz,$+34		;04ee
	ld a,h			;04f0
	ld l,022h		;04f1
l04f3h:
	ld l,060h		;04f3
l04f5h:
	ld a,(0602eh)		;04f5
	ld c,a			;04f8
	ld l,020h		;04f9
	ld l,02eh		;04fb
l04fdh:
	jr c,l052dh		;04fd
	ld l,02eh		;04ff
	ld a,h			;0501
	ld a,(bc)			;0502
l0503h:
	jr nc,$+50		;0503
	jr nc,l0537h		;0505
l0507h:
	jr nc,l0539h		;0507
	ld h,h			;0509
	jr nc,$+34		;050a
	jr nz,l0547h		;050c
	ld sp,03420h		;050e
l0511h:
	scf			;0511
	jr nz,l0549h		;0512
	ld sp,03120h		;0514
	ld h,l			;0517
	jr nz,l0580h		;0518
l051ah:
	ld h,(hl)			;051a
	jr nz,$+102		;051b
	dec (hl)			;051d
l051eh:
	jr nz,l0583h		;051e
	ld h,d			;0520
	jr nz,l0589h		;0521
	ld (02020h),a		;0523
	scf			;0526
	ld h,d			;0527
	jr nz,l058eh		;0528
	inc sp			;052a
	jr nz,l0563h		;052b
l052dh:
	dec (hl)			;052d
	jr nz,l0567h		;052e
	ld h,c			;0530
l0531h:
	jr nz,$+102		;0531
	inc sp			;0533
	jr nz,l056ch		;0534
	dec (hl)			;0536
l0537h:
	jr nz,l059dh		;0537
l0539h:
	ld sp,03120h		;0539
	inc sp			;053c
	jr nz,$+34		;053d
	ld a,h			;053f
	ld l,047h		;0540
	ld d,c			;0542
	ld l,02eh		;0543
	ld l,02eh		;0545
l0547h:
	ld l,07bh		;0547
l0549h:
	ld l,065h		;0549
	ld a,d			;054b
	ld l,065h		;054c
	ld l,02eh		;054e
	ld a,h			;0550
	ld a,(bc)			;0551
	jr nc,$+50		;0552
	jr nc,l0586h		;0554
	jr nc,l0588h		;0556
	ld h,l			;0558
	jr nc,$+34		;0559
	jr nz,l058fh		;055b
	ld h,c			;055d
	jr nz,$+101		;055e
	add hl,sp			;0560
	jr nz,l0599h		;0561
l0563h:
	jr nc,l0585h		;0563
	ld h,l			;0565
	ld h,d			;0566
l0567h:
	jr nz,l059bh		;0567
	ld (06320h),a		;0569
l056ch:
	add hl,sp			;056c
	jr nz,l05a5h		;056d
	jr nc,$+34		;056f
	ld (02031h),a		;0571
	jr nz,$+50		;0574
	jr nc,$+34		;0576
	ld h,e			;0578
	inc sp			;0579
	jr nz,l05adh		;057a
	add hl,sp			;057c
	jr nz,l05b6h		;057d
	ld h,h			;057f
l0580h:
	jr nz,l05e6h		;0580
	inc sp			;0582
l0583h:
	jr nz,$+56		;0583
l0585h:
	inc (hl)			;0585
l0586h:
	jr nz,$+57		;0586
l0588h:
	ld h,e			;0588
l0589h:
	jr nz,l05efh		;0589
	inc sp			;058b
	jr nz,$+34		;058c
l058eh:
	ld a,h			;058e
l058fh:
	ld hl,(0602eh)		;058f
	ld l,022h		;0592
	ld l,060h		;0594
	ld hl,02e2eh		;0596
l0599h:
	ld l,07dh		;0599
l059bh:
	ld l,064h		;059b
l059dh:
	ld a,h			;059d
	ld l,07ch		;059e
	ld a,(bc)			;05a0
	jr nc,$+50		;05a1
	jr nc,$+50		;05a3
l05a5h:
	jr nc,l05d7h		;05a5
	ld h,(hl)			;05a7
	jr nc,l05cah		;05a8
	jr nz,$+56		;05aa
	inc (hl)			;05ac
l05adh:
	jr nz,$+53		;05ad
	ld h,l			;05af
	jr nz,l05e6h		;05b0
	inc (hl)			;05b2
	jr nz,$+102		;05b3
	inc sp			;05b5
l05b6h:
	jr nz,l05eeh		;05b6
	jr c,l05dah		;05b8
	ld (02031h),a		;05ba
	ld h,d			;05bd
	ld (hl),020h		;05be
	ld (hl),030h		;05c0
	jr nz,$+34		;05c2
	ld h,e			;05c4
	ld h,h			;05c5
	jr nz,l0629h		;05c6
	jr nc,$+34		;05c8
l05cah:
	ld (hl),030h		;05ca
	jr nz,l0631h		;05cc
	ld h,h			;05ce
	jr nz,l060ah		;05cf
	scf			;05d1
	jr nz,l060ah		;05d2
	jr nc,l05f6h		;05d4
	ld h,l			;05d6
l05d7h:
	ld (hl),020h		;05d7
	ld h,e			;05d9
l05dah:
	jr nc,l05fch		;05da
	jr nz,$+126		;05dc
	ld h,h			;05de
	ld a,044h		;05df
	ld l,068h		;05e1
	ld hl,0602eh		;05e3
l05e6h:
	ld l,02eh		;05e6
	ld h,b			;05e8
	ld l,02eh		;05e9
	ld h,b			;05eb
	ld l,02eh		;05ec
l05eeh:
	ld a,h			;05ee
l05efh:
	ld a,(bc)			;05ef
	jr nc,l0622h		;05f0
	jr nc,l0624h		;05f2
	jr nc,$+51		;05f4
l05f6h:
	jr nc,l0628h		;05f6
	jr nz,l061ah		;05f8
	ld h,(hl)			;05fa
	dec (hl)			;05fb
l05fch:
	jr nz,$+50		;05fc
	ld h,l			;05fe
	jr nz,l0631h		;05ff
	ld (hl),020h		;0601
	ld h,e			;0603
	ld h,h			;0604
	jr nz,$+59		;0605
	scf			;0607
	jr nz,$+56		;0608
l060ah:
	jr nc,l062ch		;060a
	jr nc,l0672h		;060c
	jr nz,$+52		;060e
	jr nc,$+34		;0610
	jr nz,l067ah		;0612
	ld h,c			;0614
	jr nz,$+104		;0615
	ld sp,03220h		;0617
l061ah:
	jr nc,$+34		;061a
	ld sp,02036h		;061c
	ld h,d			;061f
	jr c,$+34		;0620
l0622h:
	ld h,e			;0622
	ld h,c			;0623
l0624h:
	jr nz,l0656h		;0624
	jr nc,l0648h		;0626
l0628h:
	ld h,h			;0628
l0629h:
	add hl,sp			;0629
	jr nz,$+34		;062a
l062ch:
	ld a,h			;062c
	ld l,02eh		;062d
	ld l,02eh		;062f
l0631h:
	ld l,060h		;0631
	ld l,020h		;0633
	ld l,02eh		;0635
	jr nz,$+48		;0637
	ld l,02eh		;0639
	ld l,02eh		;063b
	ld a,h			;063d
	ld a,(bc)			;063e
	jr nc,$+50		;063f
	jr nc,$+50		;0641
	jr nc,l0676h		;0643
	ld sp,02030h		;0645
l0648h:
	jr nz,l067ch		;0648
	ld sp,06320h		;064a
	jr nc,l066fh		;064d
	ld (hl),030h		;064f
	jr nz,l06b6h		;0651
	ld h,h			;0653
	jr nz,l068eh		;0654
l0656h:
	scf			;0656
	jr nz,$+56		;0657
	jr nc,$+34		;0659
	inc sp			;065b
	ld h,l			;065c
	jr nz,$+50		;065d
	ld sp,02020h		;065f
	inc sp			;0662
	ld (06220h),a		;0663
	jr c,$+34		;0666
	ld (hl),030h		;0668
	jr nz,$+53		;066a
	ld (06220h),a		;066c
l066fh:
	ld h,c			;066f
	jr nz,l06a8h		;0670
l0672h:
	jr nc,l0694h		;0672
	inc sp			;0674
	scf			;0675
l0676h:
	jr nz,l06ach		;0676
	jr c,$+34		;0678
l067ah:
	jr nz,$+126		;067a
l067ch:
	ld hl,0602eh		;067c
	ld l,02eh		;067f
	ld h,b			;0681
	ld a,02eh		;0682
	ld (0602eh),a		;0684
	ld (0602eh),a		;0687
	scf			;068a
	ld c,b			;068b
	ld a,h			;068c
	ld a,(bc)			;068d
l068eh:
	jr nc,$+50		;068e
	jr nc,l06c2h		;0690
	jr nc,$+51		;0692
l0694h:
	ld (02030h),a		;0694
	jr nz,l06cah		;0697
	jr c,l06bbh		;0699
	ld h,c			;069b
	jr c,l06beh		;069c
	ld (02031h),a		;069e
	scf			;06a1
	scf			;06a2
	jr nz,$+56		;06a3
	jr nc,l06c7h		;06a5
	scf			;06a7
l06a8h:
	ld h,l			;06a8
	jr nz,l06ddh		;06a9
	inc sp			;06ab
l06ach:
	jr nz,l0710h		;06ac
	scf			;06ae
	jr nz,l06d1h		;06af
	ld (02038h),a		;06b1
	jr nc,l071ah		;06b4
l06b6h:
	jr nz,$+54		;06b6
	ld h,(hl)			;06b8
	jr nz,l071eh		;06b9
l06bbh:
	ld h,h			;06bb
	jr nz,l06efh		;06bc
l06beh:
	ld (06520h),a		;06be
	inc (hl)			;06c1
l06c2h:
	jr nz,l06f5h		;06c2
	jr c,l06e6h		;06c4
	ld h,(hl)			;06c6
l06c7h:
	dec (hl)			;06c7
	jr nz,$+34		;06c8
l06cah:
	ld a,h			;06ca
	ld l,02eh		;06cb
	ld hl,06077h		;06cd
	ld a,(hl)			;06d0
l06d1h:
	inc hl			;06d1
	ld l,028h		;06d2
	ld l,04fh		;06d4
	ld l,02eh		;06d6
	ld l,02eh		;06d8
	ld l,07ch		;06da
	ld a,(bc)			;06dc
l06ddh:
	jr nc,l070fh		;06dd
	jr nc,l0711h		;06df
	jr nc,l0714h		;06e1
	inc sp			;06e3
	jr nc,l0706h		;06e4
l06e6h:
	jr nz,l0718h		;06e6
	scf			;06e8
	jr nz,l071fh		;06e9
	ld (03620h),a		;06eb
	ld h,(hl)			;06ee
l06efh:
	jr nz,l0727h		;06ef
	ld h,(hl)			;06f1
	jr nz,l072bh		;06f2
	inc (hl)			;06f4
l06f5h:
	jr nz,l0729h		;06f5
	jr nc,$+34		;06f7
	jr nc,l072bh		;06f9
	jr nz,$+52		;06fb
	ld sp,02020h		;06fd
	ld h,e			;0700
	inc (hl)			;0701
	jr nz,l073ah		;0702
	jr nc,l0726h		;0704
l0706h:
	ld h,e			;0706
	ld h,h			;0707
	jr nz,$+58		;0708
	scf			;070a
	jr nz,l0743h		;070b
	jr nc,$+34		;070d
l070fh:
	ld h,e			;070f
l0710h:
	inc sp			;0710
l0711h:
	jr nz,l0743h		;0711
	dec (hl)			;0713
l0714h:
	jr nz,l074ch		;0714
	jr nc,l0738h		;0716
l0718h:
	jr nz,l0796h		;0718
l071ah:
	ld l,042h		;071a
	ld l,a			;071c
	ld l,a			;071d
l071eh:
	ld (hl),h			;071e
l071fh:
	jr nz,$+48		;071f
	ld hl,0602eh		;0721
	ld l,02eh		;0724
l0726h:
	ld h,b			;0726
l0727h:
	ld l,02eh		;0727
l0729h:
	ld h,b			;0729
	ld a,h			;072a
l072bh:
	ld a,(bc)			;072b
	jr nc,$+50		;072c
	jr nc,l0760h		;072e
	jr nc,$+51		;0730
	inc (hl)			;0732
	jr nc,$+34		;0733
	jr nz,$+101		;0735
	ld h,h			;0737
l0738h:
	jr nz,l079bh		;0738
l073ah:
	jr nc,l075ch		;073a
	ld (hl),030h		;073c
	jr nz,l0772h		;073e
	ld sp,06320h		;0740
l0743h:
	scf			;0743
	jr nz,$+56		;0744
	jr nc,l0768h		;0746
	ld h,e			;0748
	ld h,h			;0749
	jr nz,$+99		;074a
l074ch:
	jr nc,$+34		;074c
	jr nz,l0786h		;074e
	jr nc,l0772h		;0750
	ld h,e			;0752
	ld h,h			;0753
	jr nz,l078fh		;0754
	scf			;0756
	jr nz,l078fh		;0757
	jr nc,l077bh		;0759
	ld h,e			;075b
l075ch:
	ld h,h			;075c
	jr nz,l0798h		;075d
	scf			;075f
l0760h:
	jr nz,l0798h		;0760
	jr nc,l0784h		;0762
	ld h,e			;0764
	add hl,sp			;0765
	jr nz,$+34		;0766
l0768h:
	ld a,h			;0768
	ld l,02eh		;0769
	ld h,b			;076b
	ld hl,0602eh		;076c
	ld l,02eh		;076f
	ld h,b			;0771
l0772h:
	ld l,02eh		;0772
	ld h,b			;0774
	ld l,02eh		;0775
	ld h,b			;0777
	ld l,07ch		;0778
	ld a,(bc)			;077a
l077bh:
	jr nc,$+50		;077b
	jr nc,l07afh		;077d
	jr nc,l07b2h		;077f
	dec (hl)			;0781
	jr nc,$+34		;0782
l0784h:
	jr nz,l07eah		;0784
l0786h:
	ld h,d			;0786
	jr nz,l07efh		;0787
	add hl,sp			;0789
	jr nz,l07efh		;078a
	ld (hl),020h		;078c
	inc (hl)			;078e
l078fh:
	jr nc,l07b1h		;078f
	inc sp			;0791
	jr nc,l07b4h		;0792
	ld h,(hl)			;0794
	ld h,c			;0795
l0796h:
	jr nz,l07fch		;0796
l0798h:
	ld h,d			;0798
	jr nz,l0801h		;0799
l079bh:
	jr c,$+34		;079b
	jr nz,$+101		;079d
	add hl,sp			;079f
	jr nz,l07d6h		;07a0
	ld h,l			;07a2
	jr nz,$+52		;07a3
	inc sp			;07a5
	jr nz,l080ch		;07a6
	ld h,d			;07a8
	jr nz,$+104		;07a9
	add hl,sp			;07ab
	jr nz,$+101		;07ac
	ld h,d			;07ae
l07afh:
	jr nz,$+57		;07af
l07b1h:
	ld h,(hl)			;07b1
l07b2h:
	jr nz,$+52		;07b2
l07b4h:
	jr c,l07d6h		;07b4
	jr nz,$+126		;07b6
	ld l,02eh		;07b8
	ld l,040h		;07ba
	jr nc,$+48		;07bc
	ld l,02eh		;07be
	ld l,04eh		;07c0
	inc hl			;07c2
	ld l,02eh		;07c3
	ld l,02eh		;07c5
	jr z,$+126		;07c7
	ld a,(bc)			;07c9
	jr nc,l07fch		;07ca
	jr nc,l07feh		;07cc
	jr nc,l0801h		;07ce
	ld (hl),030h		;07d0
	jr nz,l07f4h		;07d2
	ld h,(hl)			;07d4
	ld h,c			;07d5
l07d6h:
	jr nz,$+57		;07d6
	ld h,l			;07d8
	jr nz,$+102		;07d9
	inc sp			;07db
	jr nz,l0844h		;07dc
	jr c,l0800h		;07de
	ld (02033h),a		;07e0
	jr nc,$+102		;07e3
	jr nz,l0819h		;07e5
	jr nc,l0809h		;07e7
	ld h,(hl)			;07e9
l07eah:
	inc sp			;07ea
	jr nz,$+34		;07eb
	ld h,h			;07ed
	ld h,d			;07ee
l07efh:
	jr nz,$+104		;07ef
	jr nc,l0813h		;07f1
	ld h,e			;07f3
l07f4h:
	ld h,d			;07f4
	jr nz,l082eh		;07f5
	scf			;07f7
	jr nz,l082ch		;07f8
	jr nc,$+34		;07fa
l07fch:
	ld h,(hl)			;07fc
	ld h,c			;07fd
l07feh:
	jr nz,$+101		;07fe
l0800h:
	add hl,sp			;0800
l0801h:
	jr nz,l0833h		;0801
	add hl,sp			;0803
	jr nz,l0826h		;0804
	ld a,h			;0806
	ld l,07eh		;0807
l0809h:
	ld l,02eh		;0809
	inc hl			;080b
l080ch:
	ld l,020h		;080c
	ld l,02eh		;080e
	ld l,02eh		;0810
	ld (hl),a			;0812
l0813h:
	jr nz,l0843h		;0813
	ld l,02eh		;0815
	ld a,h			;0817
	ld a,(bc)			;0818
l0819h:
	jr nc,$+50		;0819
	jr nc,$+50		;081b
	jr nc,l0850h		;081d
	scf			;081f
	jr nc,$+34		;0820
	jr nz,$+101		;0822
	ld (hl),020h		;0824
l0826h:
	jr nc,l0858h		;0826
	jr nz,l085ah		;0828
	jr nc,l084ch		;082a
l082ch:
	jr nc,l085eh		;082c
l082eh:
	jr nz,l0860h		;082e
	ld (03020h),a		;0830
l0833h:
	ld sp,03120h		;0833
	jr nc,l0858h		;0836
	inc sp			;0838
	ld (hl),020h		;0839
	jr nz,$+104		;083b
	ld h,(hl)			;083d
	jr nz,l0870h		;083e
	inc sp			;0840
	jr nz,$+50		;0841
l0843h:
	ld h,(hl)			;0843
l0844h:
	jr nz,l0876h		;0844
	jr nc,l0868h		;0846
	jr nc,l087bh		;0848
	jr nz,$+50		;084a
l084ch:
	ld (03020h),a		;084c
	scf			;084f
l0850h:
	jr nz,l0882h		;0850
	jr nc,l0874h		;0852
	jr nz,$+126		;0854
	ld l,02eh		;0856
l0858h:
	ld l,02eh		;0858
l085ah:
	ld l,02eh		;085a
	ld l,036h		;085c
l085eh:
	ld l,02eh		;085e
l0860h:
	ld l,02eh		;0860
	ld l,02eh		;0862
	ld l,02eh		;0864
	ld a,h			;0866
	ld a,(bc)			;0867
l0868h:
	jr nc,l089ah		;0868
	jr nc,l089ch		;086a
	jr nc,$+51		;086c
	jr c,l08a0h		;086e
l0870h:
	jr nz,l0892h		;0870
	jr nc,l08a5h		;0872
l0874h:
	jr nz,$+50		;0874
l0876h:
	jr c,l0898h		;0876
	ld sp,02039h		;0878
l087bh:
	jr nc,l08adh		;087b
	jr nz,l08b0h		;087d
	ld h,l			;087f
	jr nz,$+53		;0880
l0882h:
	ld h,e			;0882
	jr nz,l08b7h		;0883
	ld h,h			;0885
	jr nz,$+52		;0886
	ld h,h			;0888
	jr nz,l08abh		;0889
	ld (02064h),a		;088b
	jr nc,l08c0h		;088e
	jr nz,l08c2h		;0890
l0892h:
	jr nc,l08b4h		;0892
	jr nc,$+50		;0894
	jr nz,l08c8h		;0896
l0898h:
	jr nc,$+34		;0898
l089ah:
	jr nc,$+50		;089a
l089ch:
	jr nz,l08ceh		;089c
	jr nc,l08c0h		;089e
l08a0h:
	jr nc,$+50		;08a0
	jr nz,$+34		;08a2
	ld a,h			;08a4
l08a5h:
	ld l,02eh		;08a5
	ld l,02eh		;08a7
	ld l,03ch		;08a9
l08abh:
	dec l			;08ab
	dec l			;08ac
l08adh:
	dec l			;08ad
	ld l,02eh		;08ae
l08b0h:
	ld l,02eh		;08b0
	ld l,02eh		;08b2
l08b4h:
	ld l,07ch		;08b4
	ld a,(bc)			;08b6
l08b7h:
	jr nc,$+50		;08b7
	jr nc,$+50		;08b9
	jr nc,$+51		;08bb
	add hl,sp			;08bd
	jr nc,$+34		;08be
l08c0h:
	jr nz,$+50		;08c0
l08c2h:
	ld (03020h),a		;08c2
	ld sp,03020h		;08c5
l08c8h:
	jr nc,l08eah		;08c8
	ld sp,02038h		;08ca
	ld h,d			;08cd
l08ceh:
	ld h,(hl)			;08ce
	jr nz,l0901h		;08cf
	jr nc,l08f3h		;08d1
	jr nc,$+52		;08d3
	jr nz,$+50		;08d5
	jr nc,$+34		;08d7
	jr nz,$+53		;08d9
	ld h,l			;08db
	jr nz,l0941h		;08dc
	inc sp			;08de
	jr nz,$+55		;08df
	ld h,e			;08e1
	jr nz,l0947h		;08e2
	ld (hl),020h		;08e4
	ld h,e			;08e6
	inc sp			;08e7
	jr nz,$+55		;08e8
l08eah:
	jr c,l090ch		;08ea
	ld h,e			;08ec
	ld (hl),020h		;08ed
	scf			;08ef
	ld h,(hl)			;08f0
	jr nz,l0913h		;08f1
l08f3h:
	ld a,h			;08f3
	ld l,02eh		;08f4
	ld l,02eh		;08f6
	ld l,02eh		;08f8
	ld l,02eh		;08fa
	ld a,02eh		;08fc
	ld e,h			;08fe
	ld l,02eh		;08ff
l0901h:
	ld e,b			;0901
	ld l,02eh		;0902
	ld a,h			;0904
	ld a,(bc)			;0905
	jr nc,l0938h		;0906
	jr nc,$+50		;0908
	jr nc,$+51		;090a
l090ch:
	ld h,c			;090c
	jr nc,$+34		;090d
	jr nz,l0941h		;090f
	jr nc,$+34		;0911
l0913h:
	inc (hl)			;0913
	ld sp,03520h		;0914
	dec (hl)			;0917
	jr nz,$+55		;0918
	inc (hl)			;091a
	jr nz,$+54		;091b
	ld h,(hl)			;091d
	jr nz,l0954h		;091e
	dec (hl)			;0920
	jr nz,$+55		;0921
	jr c,l0945h		;0923
	jr nc,l0957h		;0925
	jr nz,l0949h		;0927
	ld (02030h),a		;0929
	jr nc,l095eh		;092c
	jr nz,l0962h		;092e
	jr nc,l0952h		;0930
	ld (02030h),a		;0932
	ld (02030h),a		;0935
l0938h:
	ld (02030h),a		;0938
	ld (02030h),a		;093b
	ld (02030h),a		;093e
l0941h:
	jr nz,l09bfh		;0941
	ld l,041h		;0943
l0945h:
	ld d,l			;0945
	ld d,h			;0946
l0947h:
	ld c,a			;0947
	ld b,l			;0948
l0949h:
	ld e,b			;0949
	ld l,020h		;094a
	ld l,020h		;094c
	jr nz,$+34		;094e
	jr nz,l0972h		;0950
l0952h:
	jr nz,$+126		;0952
l0954h:
	ld a,(bc)			;0954
	jr nc,$+50		;0955
l0957h:
	jr nc,l0989h		;0957
	jr nc,$+51		;0959
	ld h,d			;095b
	jr nc,$+34		;095c
l095eh:
	jr nz,l0992h		;095e
	jr nc,$+34		;0960
l0962h:
	inc (hl)			;0962
	inc sp			;0963
	jr nz,l099ah		;0964
	ld h,(hl)			;0966
	jr nz,l099eh		;0967
	jr nc,l098bh		;0969
	dec (hl)			;096b
	add hl,sp			;096c
	jr nz,l09a4h		;096d
	ld (03420h),a		;096f
l0972h:
	add hl,sp			;0972
	jr nz,$+54		;0973
	scf			;0975
	jr nz,l0998h		;0976
	inc (hl)			;0978
	jr c,l099bh		;0979
	dec (hl)			;097b
	inc (hl)			;097c
	jr nz,$+52		;097d
	jr nc,$+34		;097f
	ld (02038h),a		;0981
	inc (hl)			;0984
	inc sp			;0985
	jr nz,$+52		;0986
	add hl,sp			;0988
l0989h:
	jr nz,l09bdh		;0989
l098bh:
	jr nc,l09adh		;098b
	inc sp			;098d
	ld sp,02020h		;098e
	ld a,h			;0991
l0992h:
	jr nz,l09d7h		;0992
	ld c,a			;0994
	ld d,b			;0995
	ld e,c			;0996
	ld d,d			;0997
l0998h:
	ld c,c			;0998
	ld b,a			;0999
l099ah:
	ld c,b			;099a
l099bh:
	ld d,h			;099b
	jr nz,$+42		;099c
l099eh:
	ld b,e			;099e
	add hl,hl			;099f
	jr nz,$+51		;09a0
	ld a,h			;09a2
	ld a,(bc)			;09a3
l09a4h:
	jr nc,l09d6h		;09a4
	jr nc,$+50		;09a6
	jr nc,l09dbh		;09a8
	ld h,e			;09aa
	jr nc,$+34		;09ab
l09adh:
	jr nz,l09e2h		;09ad
	add hl,sp			;09af
	jr nz,l09e5h		;09b0
	scf			;09b2
	jr nz,l09e8h		;09b3
	add hl,sp			;09b5
	jr nz,l09eah		;09b6
	ld h,e			;09b8
	jr nz,l09edh		;09b9
	jr nc,l09ddh		;09bb
l09bdh:
	inc (hl)			;09bd
	inc (hl)			;09be
l09bfh:
	jr nz,l09f5h		;09bf
	add hl,sp			;09c1
	jr nz,$+54		;09c2
	scf			;09c4
	jr nz,l09e7h		;09c5
	inc (hl)			;09c7
	add hl,sp			;09c8
	jr nz,$+55		;09c9
	inc (hl)			;09cb
	jr nz,$+54		;09cc
	ld sp,03420h		;09ce
	ld h,e			;09d1
	jr nz,$+52		;09d2
	jr nc,$+34		;09d4
l09d6h:
	dec (hl)			;09d6
l09d7h:
	ld (03420h),a		;09d7
	dec (hl)			;09da
l09dbh:
	jr nz,l0a12h		;09db
l09ddh:
	inc sp			;09dd
	jr nz,$+34		;09de
	ld a,h			;09e0
	add hl,sp			;09e1
l09e2h:
	scf			;09e2
	add hl,sp			;09e3
	inc l			;09e4
l09e5h:
	jr nz,$+70		;09e5
l09e7h:
	ld c,c			;09e7
l09e8h:
	ld b,a			;09e8
	ld c,c			;09e9
l09eah:
	ld d,h			;09ea
	ld b,c			;09eb
	ld c,h			;09ec
l09edh:
	jr nz,l0a41h		;09ed
	ld b,l			;09ef
	ld d,e			;09f0
	ld a,h			;09f1
	ld a,(bc)			;09f2
	jr nc,l0a25h		;09f3
l09f5h:
	jr nc,l0a27h		;09f5
	jr nc,l0a2ah		;09f7
	ld h,h			;09f9
	jr nc,$+34		;09fa
	jr nz,l0a32h		;09fc
	dec (hl)			;09fe
	jr nz,l0a35h		;09ff
	ld sp,03520h		;0a01
	ld (03420h),a		;0a04
	inc sp			;0a07
	jr nz,$+54		;0a08
	jr c,l0a2ch		;0a0a
	ld (02030h),a		;0a0c
	ld (02030h),a		;0a0f
l0a12h:
	jr nc,$+51		;0a12
	jr nz,$+34		;0a14
	ld (02035h),a		;0a16
	jr nc,l0a4bh		;0a19
	jr nz,l0a4dh		;0a1b
	jr nc,l0a3fh		;0a1d
	jr nc,l0a51h		;0a1f
	jr nz,l0a5ah		;0a21
	jr c,$+34		;0a23
l0a25h:
	jr nc,l0a5fh		;0a25
l0a27h:
	jr nz,$+101		;0a27
	inc sp			;0a29
l0a2ah:
	jr nz,l0a5ch		;0a2a
l0a2ch:
	jr nc,$+34		;0a2c
	jr nz,$+126		;0a2e
	ld b,l			;0a30
	ld b,c			;0a31
l0a32h:
	ld d,d			;0a32
	ld b,e			;0a33
	ld c,b			;0a34
l0a35h:
	jr nz,$+34		;0a35
	ld l,025h		;0a37
	ld l,02eh		;0a39
	ld l,078h		;0a3b
	ld l,02eh		;0a3d
l0a3fh:
	ld l,07ch		;0a3f
l0a41h:
	ld a,(bc)			;0a41
	jr nc,$+50		;0a42
	jr nc,l0a76h		;0a44
	jr nc,l0a79h		;0a46
	ld h,l			;0a48
	jr nc,$+34		;0a49
l0a4bh:
	jr nz,$+50		;0a4b
l0a4dh:
	jr nc,l0a6fh		;0a4d
	dec (hl)			;0a4f
	ld h,(hl)			;0a50
l0a51h:
	jr nz,l0a83h		;0a51
	ld h,l			;0a53
	jr nz,$+50		;0a54
	ld (06320h),a		;0a56
	inc sp			;0a59
l0a5ah:
	jr nz,$+50		;0a5a
l0a5ch:
	dec (hl)			;0a5c
	jr nz,l0a8fh		;0a5d
l0a5fh:
	jr nc,l0a81h		;0a5f
	ld h,e			;0a61
	dec (hl)			;0a62
	jr nz,l0a85h		;0a63
	ld h,e			;0a65
	ld h,h			;0a66
	jr nz,$+58		;0a67
	ld h,e			;0a69
	jr nz,$+101		;0a6a
	inc sp			;0a6c
	jr nz,l0ad2h		;0a6d
l0a6fh:
	ld sp,06320h		;0a6f
	add hl,sp			;0a72
	jr nz,l0aa8h		;0a73
	ld h,l			;0a75
l0a76h:
	jr nz,l0aa8h		;0a76
	ld h,h			;0a78
l0a79h:
	jr nz,l0adeh		;0a79
	ld h,h			;0a7b
	jr nz,$+34		;0a7c
	ld a,h			;0a7e
	ld l,05fh		;0a7f
l0a81h:
	ld l,02eh		;0a81
l0a83h:
	ld l,02eh		;0a83
l0a85h:
	ld l,02eh		;0a85
	ld l,02eh		;0a87
	ld l,02eh		;0a89
	ld l,03eh		;0a8b
	ld l,02eh		;0a8d
l0a8fh:
	ld a,h			;0a8f
	ld a,(bc)			;0a90
	jr nc,$+50		;0a91
	jr nc,l0ac5h		;0a93
	jr nc,$+51		;0a95
	ld h,(hl)			;0a97
	jr nc,$+34		;0a98
	jr nz,$+59		;0a9a
	ld (06320h),a		;0a9c
	inc sp			;0a9f
	jr nz,$+53		;0aa0
	ld h,l			;0aa2
	jr nz,$+50		;0aa3
	ld h,c			;0aa5
	jr nz,$+101		;0aa6
l0aa8h:
	inc sp			;0aa8
	jr nz,l0ae4h		;0aa9
	ld (06320h),a		;0aab
	inc sp			;0aae
	jr nz,l0ae4h		;0aaf
	ld h,l			;0ab1
	jr nz,l0ad4h		;0ab2
	ld (02030h),a		;0ab4
	ld h,e			;0ab7
	inc sp			;0ab8
	jr nz,$+59		;0ab9
	ld (06320h),a		;0abb
	inc sp			;0abe
	jr nz,$+101		;0abf
	dec (hl)			;0ac1
	jr nz,$+101		;0ac2
	ld h,h			;0ac4
l0ac5h:
	jr nz,$+59		;0ac5
	jr c,$+34		;0ac7
	ld h,e			;0ac9
	inc sp			;0aca
	jr nz,$+34		;0acb
	ld a,h			;0acd
	ld l,02eh		;0ace
	ld a,02eh		;0ad0
l0ad2h:
	ld l,02eh		;0ad2
l0ad4h:
	ld l,03eh		;0ad4
	jr nz,$+48		;0ad6
	ld l,02eh		;0ad8
	ld l,02eh		;0ada
	ld l,02eh		;0adc
l0adeh:
	ld a,h			;0ade
	ld a,(bc)			;0adf
	jr nc,$+50		;0ae0
	jr nc,$+50		;0ae2
l0ae4h:
	jr nc,$+52		;0ae4
	jr nc,$+50		;0ae6
	ld a,(bc)			;0ae8
