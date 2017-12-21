;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module RTC_pcf8563
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PCF_getAndClearFlags
	.globl _I2C_GetFlagStatus
	.globl _I2C_CheckEvent
	.globl _I2C_SendData
	.globl _I2C_Send7bitAddress
	.globl _I2C_ReceiveData
	.globl _I2C_AcknowledgeConfig
	.globl _I2C_GenerateSTOP
	.globl _I2C_GenerateSTART
	.globl _I2C_Cmd
	.globl _I2C_Init
	.globl _I2C_DeInit
	.globl _CLK_GetClockFreq
	.globl _CLK_PeripheralClockConfig
	.globl _PCF_Write
	.globl _PCF_Read
	.globl _PCF_Init
	.globl _PCF_setDateTime
	.globl _PCF_getDateTime
	.globl _PCF_setAlarm
	.globl _PCF_setTimer
	.globl _PCF_getTimer
	.globl _PCF_getAlarm
	.globl _PCF_setClockOut
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
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
;	user/RTC_pcf8563.c: 7: static void IIC_Init(uint32_t clock_frequency, uint16_t own_addr)
;	-----------------------------------------
;	 function IIC_Init
;	-----------------------------------------
_IIC_Init:
;	user/RTC_pcf8563.c: 9: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	push	#0x01
	push	#0x00
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/RTC_pcf8563.c: 10: I2C_DeInit();
	call	_I2C_DeInit
;	user/RTC_pcf8563.c: 11: I2C_Init(clock_frequency, own_addr, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, (CLK_GetClockFreq()/1000000));
	call	_CLK_GetClockFreq
	push	#0x40
	push	#0x42
	push	#0x0f
	push	#0x00
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ld	a, xl
	push	a
	push	#0x00
	push	#0x01
	push	#0x00
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	call	_I2C_Init
	addw	sp, #10
;	user/RTC_pcf8563.c: 12: I2C_Cmd(ENABLE);
	push	#0x01
	call	_I2C_Cmd
	pop	a
	ret
;	user/RTC_pcf8563.c: 15: void PCF_Write(uint8_t addr, uint8_t *data, uint8_t count)
;	-----------------------------------------
;	 function PCF_Write
;	-----------------------------------------
_PCF_Write:
	push	a
;	user/RTC_pcf8563.c: 19: I2C_GenerateSTART(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	user/RTC_pcf8563.c: 23: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
	push	#0x00
	push	#0xa2
	call	_I2C_Send7bitAddress
	popw	x
;	user/RTC_pcf8563.c: 26: I2C_SendData(addr);
	ld	a, (0x04, sp)
	push	a
	call	_I2C_SendData
	pop	a
;	user/RTC_pcf8563.c: 29: while(count){
	ld	a, (0x07, sp)
	ld	(0x01, sp), a
	ldw	x, (0x05, sp)
00101$:
	tnz	(0x01, sp)
	jreq	00103$
;	user/RTC_pcf8563.c: 30: count--;
	dec	(0x01, sp)
;	user/RTC_pcf8563.c: 31: I2C_SendData(*data);
	ld	a, (x)
	pushw	x
	push	a
	call	_I2C_SendData
	pop	a
	popw	x
;	user/RTC_pcf8563.c: 32: data++;
	incw	x
	jra	00101$
00103$:
;	user/RTC_pcf8563.c: 35: I2C_GenerateSTOP(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTOP
	pop	a
	pop	a
	ret
;	user/RTC_pcf8563.c: 38: void PCF_Read(uint8_t addr, uint8_t *data, uint8_t count)
;	-----------------------------------------
;	 function PCF_Read
;	-----------------------------------------
_PCF_Read:
	sub	sp, #3
;	user/RTC_pcf8563.c: 40: while(!I2C_GetFlagStatus( I2C_FLAG_BUSBUSY));
00101$:
	push	#0x02
	push	#0x03
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00101$
;	user/RTC_pcf8563.c: 41: I2C_GenerateSTART(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	user/RTC_pcf8563.c: 43: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
00104$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00104$
;	user/RTC_pcf8563.c: 44: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
	push	#0x00
	push	#0xa2
	call	_I2C_Send7bitAddress
	popw	x
;	user/RTC_pcf8563.c: 45: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
00107$:
	push	#0x82
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00107$
;	user/RTC_pcf8563.c: 47: I2C_SendData(addr);
	ld	a, (0x06, sp)
	push	a
	call	_I2C_SendData
	pop	a
;	user/RTC_pcf8563.c: 48: while(!I2C_CheckEvent(I2C_FLAG_TRANSFERFINISHED));
00110$:
	push	#0x04
	push	#0x01
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00110$
;	user/RTC_pcf8563.c: 51: I2C_GenerateSTART(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	user/RTC_pcf8563.c: 52: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
00113$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00113$
;	user/RTC_pcf8563.c: 54: I2C_Send7bitAddress(PCF8563_READ_ADDR, I2C_DIRECTION_RX);
	push	#0x01
	push	#0xa3
	call	_I2C_Send7bitAddress
	popw	x
;	user/RTC_pcf8563.c: 56: while(I2C_GetFlagStatus(I2C_FLAG_ADDRESSSENTMATCHED) == RESET);
00116$:
	push	#0x02
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00116$
;	user/RTC_pcf8563.c: 57: while(count)
	ld	a, (0x09, sp)
	ld	(0x03, sp), a
	ldw	y, (0x07, sp)
	ldw	(0x01, sp), y
00122$:
	tnz	(0x03, sp)
	jreq	00124$
;	user/RTC_pcf8563.c: 59: count--;
	dec	(0x03, sp)
;	user/RTC_pcf8563.c: 60: I2C_AcknowledgeConfig(I2C_ACK_NONE);
	push	#0x00
	call	_I2C_AcknowledgeConfig
	pop	a
;	user/RTC_pcf8563.c: 63: I2C->SR1;        I2C->SR3;
	ldw	x, #0x5217
	ld	a, (x)
	ldw	x, #0x5219
	ld	a, (x)
;	user/RTC_pcf8563.c: 64: while (I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
00119$:
	push	#0x40
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00119$
;	user/RTC_pcf8563.c: 65: *data = I2C_ReceiveData();
	call	_I2C_ReceiveData
	ldw	x, (0x01, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 66: data++;
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
;	user/RTC_pcf8563.c: 67: I2C_AcknowledgeConfig( I2C_ACK_CURR);
	push	#0x01
	call	_I2C_AcknowledgeConfig
	pop	a
	jra	00122$
00124$:
;	user/RTC_pcf8563.c: 69: I2C_GenerateSTOP(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTOP
	addw	sp, #4
	ret
;	user/RTC_pcf8563.c: 72: void PCF_Init(uint8_t mode)
;	-----------------------------------------
;	 function PCF_Init
;	-----------------------------------------
_PCF_Init:
	push	a
;	user/RTC_pcf8563.c: 74: uint8_t tmp = 0x00;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 75: IIC_Init(100000, 0xA2);
	push	#0xa2
	push	#0x00
	push	#0xa0
	push	#0x86
	push	#0x01
	push	#0x00
	call	_IIC_Init
	addw	sp, #6
;	user/RTC_pcf8563.c: 76: PCF_Write(0x00, &tmp, 1);
	ldw	x, sp
	incw	x
	push	#0x01
	pushw	x
	push	#0x00
	call	_PCF_Write
	addw	sp, #5
	ret
;	user/RTC_pcf8563.c: 81: uint8_t PCF_setDateTime(PCF_DateTime *dateTime)
;	-----------------------------------------
;	 function PCF_setDateTime
;	-----------------------------------------
_PCF_setDateTime:
	sub	sp, #38
;	user/RTC_pcf8563.c: 84: if (dateTime->second >= 60 || dateTime->minute >= 60 || dateTime->hour >= 24 || dateTime->day > 32 || dateTime->weekday > 6 || dateTime->month > 12 || dateTime->year < 1900 || dateTime->year >= 2100)
	ldw	y, (0x29, sp)
	ldw	(0x16, sp), y
	ldw	x, (0x16, sp)
	ld	a, (x)
	ld	(0x23, sp), a
	ld	a, (0x23, sp)
	cp	a, #0x3c
	jrnc	00101$
	ldw	y, (0x16, sp)
	incw	y
	ld	a, (y)
	cp	a, #0x3c
	jrnc	00101$
	ldw	x, (0x16, sp)
	incw	x
	incw	x
	ldw	(0x14, sp), x
	ldw	x, (0x14, sp)
	ld	a, (x)
	cp	a, #0x18
	jrnc	00101$
	ldw	x, (0x16, sp)
	addw	x, #0x0003
	ldw	(0x20, sp), x
	ldw	x, (0x20, sp)
	ld	a, (x)
	cp	a, #0x20
	jrugt	00101$
	ldw	x, (0x16, sp)
	addw	x, #0x0004
	ldw	(0x1e, sp), x
	ldw	x, (0x1e, sp)
	ld	a, (x)
	cp	a, #0x06
	jrugt	00101$
	ldw	x, (0x16, sp)
	addw	x, #0x0005
	ldw	(0x0e, sp), x
	ldw	x, (0x0e, sp)
	ld	a, (x)
	cp	a, #0x0c
	jrugt	00101$
	ldw	x, (0x16, sp)
	addw	x, #0x0006
	ldw	(0x0a, sp), x
	ldw	x, (0x0a, sp)
	ldw	x, (x)
	cpw	x, #0x076c
	jrc	00101$
	cpw	x, #0x0834
	jrc	00102$
00101$:
;	user/RTC_pcf8563.c: 86: return 1;
	ld	a, #0x01
	jp	00113$
00102$:
;	user/RTC_pcf8563.c: 89: buffer[0] = BinToBCD(dateTime->second) & 0x7F;
	ldw	x, sp
	incw	x
	ldw	(0x10, sp), x
	clrw	x
	ld	a, (0x23, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	swap	a
	and	a, #0xf0
	ld	(0x0d, sp), a
	clrw	x
	ld	a, (0x23, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x0d, sp)
	and	a, #0x7f
	ldw	x, (0x10, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 90: buffer[1] = BinToBCD(dateTime->minute) & 0x7F;
	ldw	x, (0x10, sp)
	incw	x
	ldw	(0x12, sp), x
	ld	a, (y)
	ld	xl, a
	pushw	x
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	popw	x
	swap	a
	and	a, #0xf0
	ld	(0x1d, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x1d, sp)
	and	a, #0x7f
	ldw	x, (0x12, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 91: buffer[2] = BinToBCD(dateTime->hour) & 0x3F;
	ldw	y, (0x10, sp)
	addw	y, #0x0002
	ldw	x, (0x14, sp)
	ld	a, (x)
	ld	xl, a
	pushw	x
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	popw	x
	swap	a
	and	a, #0xf0
	ld	(0x0c, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x0c, sp)
	and	a, #0x3f
	ld	(y), a
;	user/RTC_pcf8563.c: 92: buffer[3] = BinToBCD(dateTime->day) & 0x3F;
	ldw	y, (0x10, sp)
	addw	y, #0x0003
	ldw	x, (0x20, sp)
	ld	a, (x)
	ld	xl, a
	pushw	x
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	popw	x
	swap	a
	and	a, #0xf0
	ld	(0x09, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x09, sp)
	and	a, #0x3f
	ld	(y), a
;	user/RTC_pcf8563.c: 93: buffer[4] = BinToBCD(dateTime->weekday) & 0x07;
	ldw	y, (0x10, sp)
	addw	y, #0x0004
	ldw	x, (0x1e, sp)
	ld	a, (x)
	ld	xl, a
	pushw	x
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	popw	x
	swap	a
	and	a, #0xf0
	ld	(0x18, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x18, sp)
	and	a, #0x07
	ld	(y), a
;	user/RTC_pcf8563.c: 94: buffer[5] = BinToBCD(dateTime->month) & 0x1F;
	ldw	x, (0x10, sp)
	addw	x, #0x0005
	ldw	(0x24, sp), x
	ldw	x, (0x0e, sp)
	ld	a, (x)
	ld	xl, a
	pushw	x
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	popw	x
	swap	a
	and	a, #0xf0
	ld	(0x22, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x22, sp)
	and	a, #0x1f
	ldw	x, (0x24, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 96: if (dateTime->year >= 2000)
	ldw	x, (0x0a, sp)
	ldw	x, (x)
	ldw	(0x19, sp), x
;	user/RTC_pcf8563.c: 99: buffer[6] = BinToBCD(dateTime->year - 2000);
	ldw	x, (0x10, sp)
	addw	x, #0x0006
	ldw	(0x1b, sp), x
;	user/RTC_pcf8563.c: 96: if (dateTime->year >= 2000)
	ldw	x, (0x19, sp)
	cpw	x, #0x07d0
	jrc	00111$
;	user/RTC_pcf8563.c: 98: buffer[5] |= 0x80;
	ldw	x, (0x24, sp)
	ld	a, (x)
	or	a, #0x80
	ldw	x, (0x24, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 99: buffer[6] = BinToBCD(dateTime->year - 2000);
	ldw	x, (0x0a, sp)
	ldw	x, (x)
	subw	x, #0x07d0
	pushw	x
	ldw	y, #0x000a
	divw	x, y
	ld	a, xl
	popw	x
	swap	a
	and	a, #0xf0
	ld	(0x08, sp), a
	ldw	y, #0x000a
	divw	x, y
	ld	a, yl
	add	a, (0x08, sp)
	ldw	x, (0x1b, sp)
	ld	(x), a
	jra	00112$
00111$:
;	user/RTC_pcf8563.c: 103: buffer[6] = BinToBCD(dateTime->year - 1900);
	ldw	x, (0x19, sp)
	subw	x, #0x076c
	pushw	x
	ldw	y, #0x000a
	divw	x, y
	ld	a, xl
	popw	x
	swap	a
	and	a, #0xf0
	ldw	y, #0x000a
	divw	x, y
	exg	a, yl
	ld	(0x26, sp), a
	exg	a, yl
	add	a, (0x26, sp)
	ldw	x, (0x1b, sp)
	ld	(x), a
00112$:
;	user/RTC_pcf8563.c: 106: PCF_Write(0x02, buffer, sizeof(buffer));
	ldw	x, (0x10, sp)
	push	#0x07
	pushw	x
	push	#0x02
	call	_PCF_Write
	addw	sp, #4
;	user/RTC_pcf8563.c: 108: return 0;
	clr	a
00113$:
	addw	sp, #38
	ret
;	user/RTC_pcf8563.c: 111: uint8_t PCF_getDateTime(PCF_DateTime *dateTime)
;	-----------------------------------------
;	 function PCF_getDateTime
;	-----------------------------------------
_PCF_getDateTime:
	sub	sp, #28
;	user/RTC_pcf8563.c: 115: PCF_Read(0x02, buffer, sizeof(buffer));
	ldw	x, sp
	incw	x
	ldw	(0x12, sp), x
	ldw	x, (0x12, sp)
	push	#0x07
	pushw	x
	push	#0x02
	call	_PCF_Read
	addw	sp, #4
;	user/RTC_pcf8563.c: 117: dateTime->second = (((buffer[0] >> 4) & 0x07) * 10) + (buffer[0] & 0x0F);
	ldw	y, (0x1f, sp)
	ldw	(0x0b, sp), y
	ldw	x, (0x12, sp)
	ld	a, (x)
	ld	(0x14, sp), a
	ld	a, (0x14, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x07
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x14, sp)
	and	a, #0x0f
	ld	(0x15, sp), a
	ld	a, xl
	add	a, (0x15, sp)
	ldw	x, (0x0b, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 118: dateTime->minute = (((buffer[1] >> 4) & 0x07) * 10) + (buffer[1] & 0x0F);
	ldw	x, (0x0b, sp)
	incw	x
	ldw	(0x0f, sp), x
	ldw	x, (0x12, sp)
	ld	a, (0x1, x)
	ld	(0x11, sp), a
	ld	a, (0x11, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x07
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x11, sp)
	and	a, #0x0f
	ld	(0x18, sp), a
	ld	a, xl
	add	a, (0x18, sp)
	ldw	x, (0x0f, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 119: dateTime->hour = (((buffer[2] >> 4) & 0x03) * 10) + (buffer[2] & 0x0F);
	ldw	y, (0x0b, sp)
	addw	y, #0x0002
	ldw	x, (0x12, sp)
	ld	a, (0x2, x)
	ld	(0x0a, sp), a
	ld	a, (0x0a, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x03
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x0a, sp)
	and	a, #0x0f
	ld	(0x0e, sp), a
	ld	a, xl
	add	a, (0x0e, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 120: dateTime->day = (((buffer[3] >> 4) & 0x03) * 10) + (buffer[3] & 0x0F);
	ldw	y, (0x0b, sp)
	addw	y, #0x0003
	ldw	x, (0x12, sp)
	ld	a, (0x3, x)
	ld	(0x1a, sp), a
	ld	a, (0x1a, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x03
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x1a, sp)
	and	a, #0x0f
	ld	(0x19, sp), a
	ld	a, xl
	add	a, (0x19, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 121: dateTime->weekday = (buffer[4] & 0x07);
	ldw	x, (0x0b, sp)
	addw	x, #0x0004
	ldw	y, (0x12, sp)
	ld	a, (0x4, y)
	and	a, #0x07
	ld	(x), a
;	user/RTC_pcf8563.c: 122: dateTime->month = ((buffer[5] >> 4) & 0x01) * 10 + (buffer[5] & 0x0F);
	ldw	y, (0x0b, sp)
	addw	y, #0x0005
	ldw	x, (0x12, sp)
	addw	x, #0x0005
	ldw	(0x08, sp), x
	ldw	x, (0x08, sp)
	ld	a, (x)
	push	a
	srl	a
	srl	a
	srl	a
	srl	a
	and	a, #0x01
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	pop	a
	and	a, #0x0f
	ld	(0x0d, sp), a
	ld	a, xl
	add	a, (0x0d, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 123: dateTime->year = 1900 + ((buffer[6] >> 4) & 0x0F) * 10 + (buffer[6] & 0x0F);
	ldw	x, (0x0b, sp)
	addw	x, #0x0006
	ldw	(0x1b, sp), x
	ldw	x, (0x12, sp)
	ld	a, (0x6, x)
	ld	xl, a
	swap	a
	and	a, #0x0f
	and	a, #0x0f
	exg	a, yl
	ld	a, #0x0a
	exg	a, yl
	mul	y, a
	addw	y, #0x076c
	ld	a, xl
	and	a, #0x0f
	ld	(0x17, sp), a
	clr	(0x16, sp)
	addw	y, (0x16, sp)
	ldw	x, (0x1b, sp)
	ldw	(x), y
;	user/RTC_pcf8563.c: 125: if (buffer[5] &  0x80)
	ldw	x, (0x08, sp)
	ld	a, (x)
	tnz	a
	jrpl	00102$
;	user/RTC_pcf8563.c: 127: dateTime->year += 100;
	ldw	x, (0x1b, sp)
	ldw	x, (x)
	addw	x, #0x0064
	ldw	y, (0x1b, sp)
	ldw	(y), x
00102$:
;	user/RTC_pcf8563.c: 130: if (buffer[0] & 0x80) //Clock integrity not guaranted
	ldw	x, (0x12, sp)
	ld	a, (x)
	tnz	a
	jrpl	00104$
;	user/RTC_pcf8563.c: 132: return 1;
	ld	a, #0x01
;	user/RTC_pcf8563.c: 135: return 0;
	.byte 0x21
00104$:
	clr	a
00105$:
	addw	sp, #28
	ret
;	user/RTC_pcf8563.c: 138: uint8_t PCF_setAlarm(PCF_Alarm *alarm)
;	-----------------------------------------
;	 function PCF_setAlarm
;	-----------------------------------------
_PCF_setAlarm:
	sub	sp, #19
;	user/RTC_pcf8563.c: 141: if ((alarm->minute >= 60 && alarm->minute != 80) || (alarm->hour >= 24 && alarm->hour != 80) || (alarm->day > 32 && alarm->day != 80) || (alarm->weekday > 6 && alarm->weekday != 80))
	ldw	y, (0x16, sp)
	ldw	(0x0a, sp), y
	ldw	x, (0x0a, sp)
	ld	a, (x)
	ld	(0x0f, sp), a
	ld	a, (0x0f, sp)
	cp	a, #0x3c
	jrc	00105$
	ld	a, (0x0f, sp)
	cp	a, #0x50
	jrne	00101$
00105$:
	ldw	y, (0x0a, sp)
	incw	y
	ld	a, (y)
	cp	a, #0x18
	jrc	00107$
	cp	a, #0x50
	jrne	00101$
00107$:
	ldw	x, (0x0a, sp)
	incw	x
	incw	x
	ldw	(0x08, sp), x
	ldw	x, (0x08, sp)
	ld	a, (x)
	cp	a, #0x20
	jrule	00109$
	cp	a, #0x50
	jrne	00101$
00109$:
	ldw	x, (0x0a, sp)
	addw	x, #0x0003
	ldw	(0x06, sp), x
	ldw	x, (0x06, sp)
	ld	a, (x)
	cp	a, #0x06
	jrule	00102$
	cp	a, #0x50
	jreq	00102$
00101$:
;	user/RTC_pcf8563.c: 143: return 1;
	ld	a, #0x01
	jp	00110$
00102$:
;	user/RTC_pcf8563.c: 146: buffer[0] = BinToBCD(alarm->minute) & 0xFF;
	ldw	x, sp
	incw	x
	ldw	(0x0d, sp), x
	clrw	x
	ld	a, (0x0f, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	swap	a
	and	a, #0xf0
	ld	(0x10, sp), a
	clrw	x
	ld	a, (0x0f, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x10, sp)
	ldw	x, (0x0d, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 147: buffer[1] = BinToBCD(alarm->hour) & 0xBF;
	ldw	x, (0x0d, sp)
	incw	x
	ldw	(0x11, sp), x
	ld	a, (y)
	ld	xl, a
	pushw	x
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	popw	x
	swap	a
	and	a, #0xf0
	ld	(0x05, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x05, sp)
	and	a, #0xbf
	ldw	x, (0x11, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 148: buffer[2] = BinToBCD(alarm->day) & 0xBF;
	ldw	y, (0x0d, sp)
	addw	y, #0x0002
	ldw	x, (0x08, sp)
	ld	a, (x)
	ld	xl, a
	pushw	x
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	popw	x
	swap	a
	and	a, #0xf0
	ld	(0x13, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x13, sp)
	and	a, #0xbf
	ld	(y), a
;	user/RTC_pcf8563.c: 149: buffer[3] = BinToBCD(alarm->weekday) & 0x87;
	ldw	y, (0x0d, sp)
	addw	y, #0x0003
	ldw	x, (0x06, sp)
	ld	a, (x)
	ld	xl, a
	pushw	x
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	popw	x
	swap	a
	and	a, #0xf0
	ld	(0x0c, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x0c, sp)
	and	a, #0x87
	ld	(y), a
;	user/RTC_pcf8563.c: 151: PCF_Write(0x09, buffer, sizeof(buffer));
	ldw	x, (0x0d, sp)
	push	#0x04
	pushw	x
	push	#0x09
	call	_PCF_Write
	addw	sp, #4
;	user/RTC_pcf8563.c: 153: return 0;
	clr	a
00110$:
	addw	sp, #19
	ret
;	user/RTC_pcf8563.c: 156: void PCF_setTimer(uint8_t mode, uint8_t count)
;	-----------------------------------------
;	 function PCF_setTimer
;	-----------------------------------------
_PCF_setTimer:
;	user/RTC_pcf8563.c: 158: mode &= 0x13;
	ld	a, (0x03, sp)
	and	a, #0x13
	ld	(0x03, sp), a
;	user/RTC_pcf8563.c: 159: PCF_Write(0x0E, &mode, 1);				//Timer_control
	ldw	x, sp
	addw	x, #3
	push	#0x01
	pushw	x
	push	#0x0e
	call	_PCF_Write
	addw	sp, #4
;	user/RTC_pcf8563.c: 161: PCF_Write(0x0F, &count, 1);				//Timer
	ldw	x, sp
	addw	x, #4
	push	#0x01
	pushw	x
	push	#0x0f
	call	_PCF_Write
	addw	sp, #4
	ret
;	user/RTC_pcf8563.c: 164: uint8_t PCF_getTimer()
;	-----------------------------------------
;	 function PCF_getTimer
;	-----------------------------------------
_PCF_getTimer:
	push	a
;	user/RTC_pcf8563.c: 167: PCF_Read(0x0F, &count, 1);				//Timer
	ldw	x, sp
	incw	x
	push	#0x01
	pushw	x
	push	#0x0f
	call	_PCF_Read
	addw	sp, #4
;	user/RTC_pcf8563.c: 169: return count;
	ld	a, (0x01, sp)
	addw	sp, #1
	ret
;	user/RTC_pcf8563.c: 172: uint8_t PCF_getAlarm(PCF_Alarm *alarm)
;	-----------------------------------------
;	 function PCF_getAlarm
;	-----------------------------------------
_PCF_getAlarm:
	sub	sp, #15
;	user/RTC_pcf8563.c: 176: PCF_Read(0x09, buffer, sizeof(buffer));
	ldw	x, sp
	incw	x
	ldw	(0x0d, sp), x
	ldw	x, (0x0d, sp)
	push	#0x04
	pushw	x
	push	#0x09
	call	_PCF_Read
	addw	sp, #4
;	user/RTC_pcf8563.c: 178: alarm->minute = (((buffer[0] >> 4) & 0x0F) * 10) + (buffer[0] & 0x0F);
	ldw	y, (0x12, sp)
	ldw	(0x0b, sp), y
	ldw	x, (0x0d, sp)
	ld	a, (x)
	ld	yl, a
	swap	a
	and	a, #0x0f
	and	a, #0x0f
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, yl
	and	a, #0x0f
	ld	(0x0a, sp), a
	ld	a, xl
	add	a, (0x0a, sp)
	ldw	x, (0x0b, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 179: alarm->hour = (((buffer[1] >> 4) & 0x0B) * 10) + (buffer[1] & 0x0F);
	ldw	y, (0x0b, sp)
	incw	y
	ldw	x, (0x0d, sp)
	ld	a, (0x1, x)
	ld	(0x08, sp), a
	ld	a, (0x08, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x0b
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x08, sp)
	and	a, #0x0f
	ld	(0x0f, sp), a
	ld	a, xl
	add	a, (0x0f, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 180: alarm->day = (((buffer[2] >> 4) & 0x0B) * 10) + (buffer[2] & 0x0F);
	ldw	y, (0x0b, sp)
	addw	y, #0x0002
	ldw	x, (0x0d, sp)
	ld	a, (0x2, x)
	ld	(0x07, sp), a
	ld	a, (0x07, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x0b
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x07, sp)
	and	a, #0x0f
	ld	(0x06, sp), a
	ld	a, xl
	add	a, (0x06, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 181: alarm->weekday = (((buffer[3] >> 4) & 0x08) * 10) + (buffer[3] & 0x07);
	ldw	y, (0x0b, sp)
	addw	y, #0x0003
	ldw	x, (0x0d, sp)
	ld	a, (0x3, x)
	ld	(0x05, sp), a
	ld	a, (0x05, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x08
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x05, sp)
	and	a, #0x07
	ld	(0x09, sp), a
	ld	a, xl
	add	a, (0x09, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 183: return 0;
	clr	a
	addw	sp, #15
	ret
;	user/RTC_pcf8563.c: 186: uint8_t PCF_getAndClearFlags()
;	-----------------------------------------
;	 function PCF_getAndClearFlags
;	-----------------------------------------
_PCF_getAndClearFlags:
	pushw	x
;	user/RTC_pcf8563.c: 190: PCF_Read(0x01, &flags, 1);				//Control_status_2
	ldw	x, sp
	incw	x
	incw	x
	push	#0x01
	pushw	x
	push	#0x01
	call	_PCF_Read
	addw	sp, #4
;	user/RTC_pcf8563.c: 191: cleared = flags & 0x13;
	ld	a, (0x02, sp)
	and	a, #0x13
	ld	(0x01, sp), a
;	user/RTC_pcf8563.c: 192: PCF_Write(0x01, &cleared, 1);			//Control_status_2
	ldw	x, sp
	incw	x
	push	#0x01
	pushw	x
	push	#0x01
	call	_PCF_Write
	addw	sp, #4
;	user/RTC_pcf8563.c: 194: return flags & 0x0C;					//Mask unnecessary bits
	ld	a, (0x02, sp)
	and	a, #0x0c
	popw	x
	ret
;	user/RTC_pcf8563.c: 197: void PCF_setClockOut(uint8_t mode)
;	-----------------------------------------
;	 function PCF_setClockOut
;	-----------------------------------------
_PCF_setClockOut:
;	user/RTC_pcf8563.c: 199: mode &= 0x13;
	ld	a, (0x03, sp)
	and	a, #0x13
	ld	(0x03, sp), a
;	user/RTC_pcf8563.c: 200: PCF_Write(0x0D, &mode, 1);				//CLKOUT_control
	ldw	x, sp
	addw	x, #3
	push	#0x01
	pushw	x
	push	#0x0d
	call	_PCF_Write
	addw	sp, #4
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
