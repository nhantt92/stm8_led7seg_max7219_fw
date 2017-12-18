;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module cp437_text
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cp437_font
	.globl _TIMER_CheckTimeMS
	.globl _TIMER_InitTime
	.globl _memset
	.globl _DrawEx
	.globl _Screen
	.globl _text
	.globl _TEXT_Init
	.globl _TEXT_GetStringLen
	.globl _TEXT_GetStringToBuff
	.globl _TEXT_Manage
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_text::
	.ds 210
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	user/cp437_text.c: 8: void TEXT_Init(void)
;	-----------------------------------------
;	 function TEXT_Init
;	-----------------------------------------
_TEXT_Init:
	pushw	x
;	user/cp437_text.c: 10: text.scrollCnt = 0;
	ldw	x, #_text+0
	clr	(x)
;	user/cp437_text.c: 11: text.change = 0;
	ldw	x, #_text+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	addw	x, #0x00d1
	clr	(x)
;	user/cp437_text.c: 12: memset((uint8_t*)text.data, 0, sizeof(text.data));
	ldw	x, (0x01, sp)
	addw	x, #0x0009
	push	#0xc8
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	call	_memset
	addw	sp, #6
;	user/cp437_text.c: 13: TIMER_InitTime(&text.tick);
	ldw	x, (0x01, sp)
	incw	x
	pushw	x
	call	_TIMER_InitTime
	addw	sp, #4
	ret
;	user/cp437_text.c: 16: uint16_t TEXT_GetStringLen(uint8_t *str)
;	-----------------------------------------
;	 function TEXT_GetStringLen
;	-----------------------------------------
_TEXT_GetStringLen:
	pushw	x
;	user/cp437_text.c: 18: uint16_t charLen = 0;
	clrw	x
	ldw	(0x01, sp), x
;	user/cp437_text.c: 20: while(str[charLen])
	clrw	x
00104$:
	ldw	y, (0x05, sp)
	addw	y, (0x01, sp)
	ld	a, (y)
	tnz	a
	jreq	00106$
;	user/cp437_text.c: 22: if(str[charLen] <= 0x7F)
	cp	a, #0x7f
	jrugt	00102$
;	user/cp437_text.c: 23: charLen++;
	ldw	y, (0x01, sp)
	incw	y
	ldw	(0x01, sp), y
	jra	00103$
00102$:
;	user/cp437_text.c: 26: charLen+=2;
	ldw	y, (0x01, sp)
	addw	y, #0x0002
	ldw	(0x01, sp), y
00103$:
;	user/cp437_text.c: 28: charCnt++;
	incw	x
	jra	00104$
00106$:
;	user/cp437_text.c: 30: return charCnt;
	addw	sp, #2
	ret
;	user/cp437_text.c: 35: void TEXT_GetStringToBuff(uint8_t *str)
;	-----------------------------------------
;	 function TEXT_GetStringToBuff
;	-----------------------------------------
_TEXT_GetStringToBuff:
	sub	sp, #25
;	user/cp437_text.c: 43: text.dataLen = matrix.maxLed*8;
	ldw	x, #_text+0
	ldw	(0x16, sp), x
	ldw	y, (0x16, sp)
	addw	y, #0x0007
	ldw	x, #_matrix+5
	ld	a, (x)
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	ldw	(y), x
;	user/cp437_text.c: 44: while(str[charLen])
	ldw	x, sp
	addw	x, #4
	ldw	(0x10, sp), x
	ldw	x, #_cp437_font+0
	ldw	(0x12, sp), x
	ldw	x, (0x16, sp)
	addw	x, #0x0009
	ldw	(0x0e, sp), x
	clrw	x
	ldw	(0x02, sp), x
	ld	(0x15, sp), a
	ld	(0x14, sp), a
00109$:
	ldw	x, (0x1c, sp)
	addw	x, (0x02, sp)
	ld	a, (x)
	tnz	a
	jreq	00116$
;	user/cp437_text.c: 46: if(str[charLen] < 32)
	cp	a, #0x20
	jrnc	00105$
;	user/cp437_text.c: 49: textInc = 32;
	ldw	x, #0x0020
	jra	00121$
00105$:
;	user/cp437_text.c: 50: else if(str[charLen] > 128)
	cp	a, #0x80
	jrule	00102$
;	user/cp437_text.c: 52: textInc = 128;
	ldw	x, #0x0080
	jra	00121$
00102$:
;	user/cp437_text.c: 55: textInc = str[charLen];
	clrw	x
	ld	xl, a
;	user/cp437_text.c: 56: for(charW=0;charW<8;charW++)
00121$:
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x18, sp), x
	clr	a
00112$:
;	user/cp437_text.c: 58: buff[charW] = cp437_font[textInc*8+charW];
	clrw	y
	ld	yl, a
	addw	y, (0x10, sp)
	clrw	x
	ld	xl, a
	addw	x, (0x18, sp)
	addw	x, (0x12, sp)
	push	a
	ld	a, (x)
	ld	xl, a
	ld	(y), a
	pop	a
;	user/cp437_text.c: 56: for(charW=0;charW<8;charW++)
	inc	a
	cp	a, #0x08
	jrc	00112$
;	user/cp437_text.c: 60: for (add = 0; add < 8; add++)
	clr	(0x01, sp)
00114$:
;	user/cp437_text.c: 62: text.data[offSet+add] = buff[add];
	ld	a, (0x15, sp)
	add	a, (0x01, sp)
	clrw	x
	ld	xl, a
	addw	x, (0x0e, sp)
	clrw	y
	ld	a, (0x01, sp)
	ld	yl, a
	addw	y, (0x10, sp)
	ld	a, (y)
	ld	(x), a
;	user/cp437_text.c: 60: for (add = 0; add < 8; add++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrc	00114$
;	user/cp437_text.c: 64: charLen++;
	ldw	x, (0x02, sp)
	incw	x
	ldw	(0x02, sp), x
;	user/cp437_text.c: 65: offSet +=8;
	ldw	x, (0x14, sp)
	addw	x, #0x0008
	ldw	(0x14, sp), x
	jra	00109$
00116$:
	addw	sp, #25
	ret
;	user/cp437_text.c: 69: void TEXT_Manage(void)
;	-----------------------------------------
;	 function TEXT_Manage
;	-----------------------------------------
_TEXT_Manage:
	sub	sp, #12
;	user/cp437_text.c: 71: uint8_t buff[8] = "NHANTT";
	ldw	x, sp
	incw	x
	ldw	(0x0b, sp), x
	ldw	x, (0x0b, sp)
	ld	a, #0x4e
	ld	(x), a
	ldw	x, (0x0b, sp)
	incw	x
	ld	a, #0x48
	ld	(x), a
	ldw	x, (0x0b, sp)
	incw	x
	incw	x
	ld	a, #0x41
	ld	(x), a
	ldw	x, (0x0b, sp)
	ld	a, #0x4e
	ld	(0x0003, x), a
	ldw	x, (0x0b, sp)
	ld	a, #0x54
	ld	(0x0004, x), a
	ldw	x, (0x0b, sp)
	ld	a, #0x54
	ld	(0x0005, x), a
	ldw	x, (0x0b, sp)
	addw	x, #0x0006
	clr	(x)
	ldw	x, (0x0b, sp)
	addw	x, #0x0007
	clr	(x)
;	user/cp437_text.c: 72: TEXT_GetStringToBuff(buff);
	ldw	x, (0x0b, sp)
	pushw	x
	call	_TEXT_GetStringToBuff
	popw	x
;	user/cp437_text.c: 78: if(TIMER_CheckTimeMS(&text.tick, 800) == 0)
	ldw	x, #_text+0
	ldw	(0x09, sp), x
	ldw	x, (0x09, sp)
	incw	x
	push	#0x20
	push	#0x03
	push	#0x00
	push	#0x00
	pushw	x
	call	_TIMER_CheckTimeMS
	addw	sp, #6
	tnz	a
	jrne	00105$
;	user/cp437_text.c: 80: DrawEx(text.scrollCnt, text.data);
	ldw	x, (0x09, sp)
	addw	x, #0x0009
	ldw	y, (0x09, sp)
	ld	a, (y)
	pushw	x
	push	a
	call	_DrawEx
	addw	sp, #3
;	user/cp437_text.c: 81: Screen();
	call	_Screen
;	user/cp437_text.c: 82: if(++text.scrollCnt >= 32)
	ldw	x, (0x09, sp)
	ld	a, (x)
	inc	a
	ld	(x), a
	cp	a, #0x20
	jrc	00105$
;	user/cp437_text.c: 84: text.scrollCnt = 0;
	ldw	x, (0x09, sp)
	clr	(x)
00105$:
	addw	sp, #12
	ret
	.area CODE
_cp437_font:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x95	; 149
	.db #0xb1	; 177
	.db #0xb1	; 177
	.db #0x95	; 149
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xeb	; 235
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xeb	; 235
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x0e	; 14
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7e	; 126
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0xba	; 186
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xba	; 186
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xb8	; 184
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xb8	; 184
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0xfd	; 253
	.db #0x7f	; 127
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x4e	; 78	'N'
	.db #0x5f	; 95
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0x5f	; 95
	.db #0x4e	; 78	'N'
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x65	; 101	'e'
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x99	; 153
	.db #0x5a	; 90	'Z'
	.db #0x3c	; 60
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0x3c	; 60
	.db #0x5a	; 90	'Z'
	.db #0x99	; 153
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x66	; 102	'f'
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5f	; 95
	.db #0x5f	; 95
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5f	; 95
	.db #0x5f	; 95
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0xda	; 218
	.db #0xbf	; 191
	.db #0xa5	; 165
	.db #0xfd	; 253
	.db #0x59	; 89	'Y'
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x94	; 148
	.db #0xb6	; 182
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xb6	; 182
	.db #0x94	; 148
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x2a	; 42
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x2a	; 42
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x06	; 6
	.db #0x0e	; 14
	.db #0x1e	; 30
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1e	; 30
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x5f	; 95
	.db #0x5f	; 95
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x14	; 20
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x2e	; 46
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x3a	; 58
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x46	; 70	'F'
	.db #0x66	; 102	'f'
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0x66	; 102	'f'
	.db #0x62	; 98	'b'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x7a	; 122	'z'
	.db #0x4f	; 79	'O'
	.db #0x5d	; 93
	.db #0x37	; 55	'7'
	.db #0x7a	; 122	'z'
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x63	; 99	'c'
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x2a	; 42
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x2a	; 42
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x71	; 113	'q'
	.db #0x59	; 89	'Y'
	.db #0x4d	; 77	'M'
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x62	; 98	'b'
	.db #0x73	; 115	's'
	.db #0x59	; 89	'Y'
	.db #0x49	; 73	'I'
	.db #0x6f	; 111	'o'
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x63	; 99	'c'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x7f	; 127
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x1c	; 28
	.db #0x16	; 22
	.db #0x53	; 83	'S'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x67	; 103	'g'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x7d	; 125
	.db #0x39	; 57	'9'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x4b	; 75	'K'
	.db #0x49	; 73	'I'
	.db #0x79	; 121	'y'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x71	; 113	'q'
	.db #0x79	; 121	'y'
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x7f	; 127
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x4f	; 79	'O'
	.db #0x49	; 73	'I'
	.db #0x69	; 105	'i'
	.db #0x3f	; 63
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xe6	; 230
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x36	; 54	'6'
	.db #0x63	; 99	'c'
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x63	; 99	'c'
	.db #0x36	; 54	'6'
	.db #0x1c	; 28
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x51	; 81	'Q'
	.db #0x59	; 89	'Y'
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x5d	; 93
	.db #0x5d	; 93
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7e	; 126
	.db #0x13	; 19
	.db #0x13	; 19
	.db #0x7e	; 126
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x7f	; 127
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x63	; 99	'c'
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x63	; 99	'c'
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x5d	; 93
	.db #0x41	; 65	'A'
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x41	; 65	'A'
	.db #0x51	; 81	'Q'
	.db #0x73	; 115	's'
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x77	; 119	'w'
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x0e	; 14
	.db #0x1c	; 28
	.db #0x0e	; 14
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x41	; 65	'A'
	.db #0x63	; 99	'c'
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0x71	; 113	'q'
	.db #0x7f	; 127
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x09	; 9
	.db #0x19	; 25
	.db #0x7f	; 127
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x26	; 38
	.db #0x6f	; 111	'o'
	.db #0x4d	; 77	'M'
	.db #0x59	; 89	'Y'
	.db #0x73	; 115	's'
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x43	; 67	'C'
	.db #0x67	; 103	'g'
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x67	; 103	'g'
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x4f	; 79	'O'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x4f	; 79	'O'
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x47	; 71	'G'
	.db #0x63	; 99	'c'
	.db #0x71	; 113	'q'
	.db #0x59	; 89	'Y'
	.db #0x4d	; 77	'M'
	.db #0x67	; 103	'g'
	.db #0x73	; 115	's'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x74	; 116	't'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x3c	; 60
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x6c	; 108	'l'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x5c	; 92
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0xbc	; 188
	.db #0xa4	; 164
	.db #0xa4	; 164
	.db #0xf8	; 248
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x7c	; 124
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xfd	; 253
	.db #0x7d	; 125
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x6c	; 108	'l'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x18	; 24
	.db #0x38	; 56	'8'
	.db #0x1c	; 28
	.db #0x7c	; 124
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x7c	; 124
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xa4	; 164
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0xa4	; 164
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x84	; 132
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x78	; 120	'x'
	.db #0x4c	; 76	'L'
	.db #0x04	; 4
	.db #0x1c	; 28
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x5c	; 92
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x74	; 116	't'
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x44	; 68	'D'
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x7c	; 124
	.db #0x70	; 112	'p'
	.db #0x38	; 56	'8'
	.db #0x70	; 112	'p'
	.db #0x7c	; 124
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x6c	; 108	'l'
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x6c	; 108	'l'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x9c	; 156
	.db #0xbc	; 188
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xfc	; 252
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0x64	; 100	'd'
	.db #0x74	; 116	't'
	.db #0x5c	; 92
	.db #0x4c	; 76	'L'
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x3e	; 62
	.db #0x77	; 119	'w'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x77	; 119	'w'
	.db #0x3e	; 62
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x78	; 120	'x'
	.db #0x4c	; 76	'L'
	.db #0x46	; 70	'F'
	.db #0x4c	; 76	'L'
	.db #0x78	; 120	'x'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x9f	; 159
	.db #0x91	; 145
	.db #0xb1	; 177
	.db #0xfb	; 251
	.db #0x4a	; 74	'J'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3a	; 58
	.db #0x7a	; 122	'z'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7a	; 122	'z'
	.db #0x7a	; 122	'z'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x5d	; 93
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x23	; 35
	.db #0x75	; 117	'u'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x7d	; 125
	.db #0x7b	; 123
	.db #0x42	; 66	'B'
	.db #0x21	; 33
	.db #0x75	; 117	'u'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x7d	; 125
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x75	; 117	'u'
	.db #0x55	; 85	'U'
	.db #0x54	; 84	'T'
	.db #0x7c	; 124
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x74	; 116	't'
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x7c	; 124
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0xa4	; 164
	.db #0xa4	; 164
	.db #0xe4	; 228
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x3b	; 59
	.db #0x7d	; 125
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x5d	; 93
	.db #0x1b	; 27
	.db #0x02	; 2
	.db #0x39	; 57	'9'
	.db #0x7d	; 125
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x5d	; 93
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x39	; 57	'9'
	.db #0x7d	; 125
	.db #0x55	; 85	'U'
	.db #0x54	; 84	'T'
	.db #0x5c	; 92
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x45	; 69	'E'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x41	; 65	'A'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x45	; 69	'E'
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x43	; 67	'C'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x45	; 69	'E'
	.db #0x7d	; 125
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x79	; 121	'y'
	.db #0x7d	; 125
	.db #0x16	; 22
	.db #0x12	; 18
	.db #0x16	; 22
	.db #0x7d	; 125
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x78	; 120	'x'
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x78	; 120	'x'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x45	; 69	'E'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x74	; 116	't'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x7c	; 124
	.db #0x7e	; 126
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x7b	; 123
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x7b	; 123
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x7a	; 122	'z'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x7a	; 122	'z'
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x7a	; 122	'z'
	.db #0x4a	; 74	'J'
	.db #0x48	; 72	'H'
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3a	; 58
	.db #0x7b	; 123
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x7b	; 123
	.db #0x7a	; 122	'z'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x3a	; 58
	.db #0x7a	; 122	'z'
	.db #0x42	; 66	'B'
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0xba	; 186
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xfa	; 250
	.db #0x7a	; 122	'z'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x3d	; 61
	.db #0x7d	; 125
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7d	; 125
	.db #0x3d	; 61
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x43	; 67	'C'
	.db #0x66	; 102	'f'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x2b	; 43
	.db #0x2f	; 47
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x2f	; 47
	.db #0x2b	; 43
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x2f	; 47
	.db #0xf6	; 246
	.db #0xf8	; 248
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x88	; 136
	.db #0xfe	; 254
	.db #0x7f	; 127
	.db #0x09	; 9
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x74	; 116	't'
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x7d	; 125
	.db #0x79	; 121	'y'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x48	; 72	'H'
	.db #0x4a	; 74	'J'
	.db #0x7a	; 122	'z'
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x7a	; 122	'z'
	.db #0x7a	; 122	'z'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x7a	; 122	'z'
	.db #0x7a	; 122	'z'
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x7a	; 122	'z'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x19	; 25
	.db #0x31	; 49	'1'
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x26	; 38
	.db #0x2f	; 47
	.db #0x29	; 41
	.db #0x2f	; 47
	.db #0x2f	; 47
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x26	; 38
	.db #0x2f	; 47
	.db #0x29	; 41
	.db #0x2f	; 47
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x4d	; 77	'M'
	.db #0x45	; 69	'E'
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4f	; 79	'O'
	.db #0x6f	; 111	'o'
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0xbb	; 187
	.db #0x91	; 145
	.db #0x4f	; 79	'O'
	.db #0x6f	; 111	'o'
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x6c	; 108	'l'
	.db #0x76	; 118	'v'
	.db #0xfb	; 251
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x36	; 54	'6'
	.db #0x22	; 34
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x36	; 54	'6'
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x36	; 54	'6'
	.db #0x1c	; 28
	.db #0x08	; 8
	.db #0x22	; 34
	.db #0x36	; 54	'6'
	.db #0x1c	; 28
	.db #0x08	; 8
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xdd	; 221
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x77	; 119	'w'
	.db #0xdd	; 221
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0x77	; 119	'w'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0xf4	; 244
	.db #0xf4	; 244
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x17	; 23
	.db #0x17	; 23
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x17	; 23
	.db #0x17	; 23
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xf4	; 244
	.db #0xf4	; 244
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x17	; 23
	.db #0x17	; 23
	.db #0x10	; 16
	.db #0x17	; 23
	.db #0x17	; 23
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0xf4	; 244
	.db #0xf4	; 244
	.db #0x04	; 4
	.db #0xf4	; 244
	.db #0xf4	; 244
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x17	; 23
	.db #0x17	; 23
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0xf4	; 244
	.db #0xf4	; 244
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x6c	; 108	'l'
	.db #0x38	; 56	'8'
	.db #0x6c	; 108	'l'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x3e	; 62
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x02	; 2
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x77	; 119	'w'
	.db #0x5d	; 93
	.db #0x49	; 73	'I'
	.db #0x63	; 99	'c'
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x3c	; 60
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0x7e	; 126
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x3e	; 62
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x7e	; 126
	.db #0x7c	; 124
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0xbd	; 189
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xbd	; 189
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x6b	; 107	'k'
	.db #0x49	; 73	'I'
	.db #0x6b	; 107	'k'
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0x7e	; 126
	.db #0x73	; 115	's'
	.db #0x01	; 1
	.db #0x73	; 115	's'
	.db #0x7e	; 126
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x4a	; 74	'J'
	.db #0x4f	; 79	'O'
	.db #0x7d	; 125
	.db #0x39	; 57	'9'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x98	; 152
	.db #0xfc	; 252
	.db #0x64	; 100	'd'
	.db #0x3c	; 60
	.db #0x3e	; 62
	.db #0x27	; 39
	.db #0x3d	; 61
	.db #0x18	; 24
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x6b	; 107	'k'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x5f	; 95
	.db #0x5f	; 95
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x51	; 81	'Q'
	.db #0x5b	; 91
	.db #0x4e	; 78	'N'
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x44	; 68	'D'
	.db #0x4e	; 78	'N'
	.db #0x5b	; 91
	.db #0x51	; 81	'Q'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x36	; 54	'6'
	.db #0x12	; 18
	.db #0x36	; 54	'6'
	.db #0x24	; 36
	.db #0x36	; 54	'6'
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x1d	; 29
	.db #0x17	; 23
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area INITIALIZER
	.area CABS (ABS)
