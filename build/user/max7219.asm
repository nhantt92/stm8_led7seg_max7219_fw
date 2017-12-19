;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module max7219
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memset
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _max7seg
	.globl _max7Seg
	.globl _Max7219_Write_Byte
	.globl _setCommand
	.globl _Init
	.globl _setIntensity
	.globl _send7Seg
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_max7seg::
	.ds 14
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
;	user/max7219.c: 7: static void delay_ms(uint8_t x)
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	push	a
;	user/max7219.c: 9: while(x--);
	ld	a, (0x04, sp)
00101$:
	ld	(0x01, sp), a
	dec	a
	tnz	(0x01, sp)
	jrne	00101$
	pop	a
	ret
;	user/max7219.c: 12: void max7Seg(GPIO_TypeDef* port, uint8_t data, uint8_t cs, uint8_t clk, uint8_t numLed)
;	-----------------------------------------
;	 function max7Seg
;	-----------------------------------------
_max7Seg:
	pushw	x
;	user/max7219.c: 14: max7seg.port = port;
	ldw	x, #_max7seg+0
	ldw	y, (0x05, sp)
	ldw	(x), y
;	user/max7219.c: 15: max7seg.data = data;
	ldw	x, #_max7seg+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	ld	a, (0x07, sp)
	ld	(x), a
;	user/max7219.c: 16: max7seg.cs = cs;
	ldw	x, (0x01, sp)
	ld	a, (0x08, sp)
	ld	(0x0003, x), a
;	user/max7219.c: 17: max7seg.clk = clk;
	ldw	x, (0x01, sp)
	ld	a, (0x09, sp)
	ld	(0x0004, x), a
;	user/max7219.c: 18: max7seg.numLed =  numLed;
	ldw	x, (0x01, sp)
	ld	a, (0x0a, sp)
	ld	(0x0005, x), a
;	user/max7219.c: 19: memset(max7seg.buffer, 0x00, sizeof(max7seg.buffer));
	ldw	x, (0x01, sp)
	addw	x, #0x0006
	push	#0x08
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	call	_memset
	addw	sp, #8
	ret
;	user/max7219.c: 22: void Max7219_Write_Byte(uint8_t dat)
;	-----------------------------------------
;	 function Max7219_Write_Byte
;	-----------------------------------------
_Max7219_Write_Byte:
	sub	sp, #6
;	user/max7219.c: 26: dsent = dat;
	ld	a, (0x09, sp)
	ld	(0x01, sp), a
;	user/max7219.c: 27: for(cnt=0; cnt<8; cnt++)
	ldw	x, #_max7seg+0
	ldw	(0x05, sp), x
	ldw	x, (0x05, sp)
	addw	x, #0x0004
	ldw	(0x03, sp), x
	clr	(0x02, sp)
00105$:
;	user/max7219.c: 29: GPIO_WriteLow(max7seg.port, max7seg.clk);
	ldw	x, (0x03, sp)
	ld	a, (x)
	ldw	x, (0x05, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
	ldw	x, (0x05, sp)
	ldw	x, (x)
;	user/max7219.c: 31: GPIO_WriteHigh(max7seg.port, max7seg.data);
	ldw	y, (0x05, sp)
	ld	a, (0x2, y)
;	user/max7219.c: 30: if(dsent&0x80)
	tnz	(0x01, sp)
	jrpl	00102$
;	user/max7219.c: 31: GPIO_WriteHigh(max7seg.port, max7seg.data);
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00103$
00102$:
;	user/max7219.c: 33: GPIO_WriteLow(max7seg.port, max7seg.data);
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
00103$:
;	user/max7219.c: 34: GPIO_WriteHigh(max7seg.port, max7seg.clk);
	ldw	x, (0x03, sp)
	ld	a, (x)
	ldw	x, (0x05, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/max7219.c: 35: dsent <<= 1;
	sll	(0x01, sp)
;	user/max7219.c: 27: for(cnt=0; cnt<8; cnt++)
	inc	(0x02, sp)
	ld	a, (0x02, sp)
	cp	a, #0x08
	jrc	00105$
	addw	sp, #6
	ret
;	user/max7219.c: 39: void setCommand(uint8_t command, uint8_t value)
;	-----------------------------------------
;	 function setCommand
;	-----------------------------------------
_setCommand:
	sub	sp, #4
;	user/max7219.c: 42: GPIO_WriteLow(max7seg.port, max7seg.cs);
	ldw	x, #_max7seg+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	addw	x, #0x0003
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	ld	a, (x)
	ldw	x, (0x01, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/max7219.c: 43: Max7219_Write_Byte(command);
	ld	a, (0x07, sp)
	push	a
	call	_Max7219_Write_Byte
	pop	a
;	user/max7219.c: 44: Max7219_Write_Byte(value);
	ld	a, (0x08, sp)
	push	a
	call	_Max7219_Write_Byte
	pop	a
;	user/max7219.c: 45: GPIO_WriteLow(max7seg.port, max7seg.cs);
	ldw	x, (0x03, sp)
	ld	a, (x)
	ldw	x, (0x01, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/max7219.c: 46: GPIO_WriteHigh(max7seg.port, max7seg.cs);
	ldw	x, (0x03, sp)
	ld	a, (x)
	ldw	x, (0x01, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #7
	ret
;	user/max7219.c: 49: void Init(void)
;	-----------------------------------------
;	 function Init
;	-----------------------------------------
_Init:
	sub	sp, #4
;	user/max7219.c: 51: GPIO_Init(max7seg.port, max7seg.data|max7seg.cs|max7seg.clk, GPIO_MODE_OUT_PP_HIGH_FAST);
	ldw	x, #_max7seg+0
	ldw	(0x02, sp), x
	ldw	x, (0x02, sp)
	ld	a, (0x2, x)
	ld	(0x01, sp), a
	ldw	x, (0x02, sp)
	ld	a, (0x3, x)
	or	a, (0x01, sp)
	ld	(0x04, sp), a
	ldw	x, (0x02, sp)
	ld	a, (0x4, x)
	or	a, (0x04, sp)
	ldw	x, (0x02, sp)
	ldw	x, (x)
	push	#0xf0
	push	a
	pushw	x
	call	_GPIO_Init
	addw	sp, #4
;	user/max7219.c: 52: setCommand(SCANLIMIT, 0x07); //scanf num led 7seg
	push	#0x07
	push	#0x0b
	call	_setCommand
	popw	x
;	user/max7219.c: 53: setCommand(DECODEMODE, 0xff); // decode digit 7 -0
	push	#0xff
	push	#0x09
	call	_setCommand
	popw	x
;	user/max7219.c: 54: setCommand(SHUTDOWN, 0x01); // normal operator
	push	#0x01
	push	#0x0c
	call	_setCommand
	popw	x
;	user/max7219.c: 55: setCommand(DISPLAYTEST, 0x00); //no display test
	push	#0x00
	push	#0x0f
	call	_setCommand
	popw	x
;	user/max7219.c: 56: setCommand(INTENSITY, 0x01); // brightness 9/32
	push	#0x01
	push	#0x0a
	call	_setCommand
	addw	sp, #6
	ret
;	user/max7219.c: 59: void setIntensity(uint8_t intensity)
;	-----------------------------------------
;	 function setIntensity
;	-----------------------------------------
_setIntensity:
;	user/max7219.c: 61: setCommand(INTENSITY, intensity);
	ld	a, (0x03, sp)
	push	a
	push	#0x0a
	call	_setCommand
	popw	x
	ret
;	user/max7219.c: 64: void send7Seg(uint8_t led, uint8_t data)
;	-----------------------------------------
;	 function send7Seg
;	-----------------------------------------
_send7Seg:
	sub	sp, #4
;	user/max7219.c: 67: GPIO_WriteLow(max7seg.port, max7seg.cs);
	ldw	x, #_max7seg+0
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	addw	x, #0x0003
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/max7219.c: 68: Max7219_Write_Byte(led);
	ld	a, (0x07, sp)
	push	a
	call	_Max7219_Write_Byte
	pop	a
;	user/max7219.c: 69: Max7219_Write_Byte(data);
	ld	a, (0x08, sp)
	push	a
	call	_Max7219_Write_Byte
	pop	a
;	user/max7219.c: 70: GPIO_WriteLow(max7seg.port, max7seg.cs);
	ldw	x, (0x01, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/max7219.c: 71: GPIO_WriteHigh(max7seg.port, max7seg.cs);
	ldw	x, (0x01, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #7
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
