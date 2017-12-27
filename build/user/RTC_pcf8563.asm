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
	.globl _I2C_ClearFlag
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
;	user/RTC_pcf8563.c: 9: static void I2C_setup(void)
;	-----------------------------------------
;	 function I2C_setup
;	-----------------------------------------
_I2C_setup:
;	user/RTC_pcf8563.c: 11: I2C_DeInit();
	call	_I2C_DeInit
;	user/RTC_pcf8563.c: 12: I2C_Cmd(ENABLE);
	push	#0x01
	call	_I2C_Cmd
	pop	a
;	user/RTC_pcf8563.c: 13: I2C_Init(100000, PCF8563_WRITE_ADDR, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, CLK_GetClockFreq()/1000000);
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
	push	#0xa2
	push	#0x00
	push	#0xa0
	push	#0x86
	push	#0x01
	push	#0x00
	call	_I2C_Init
	addw	sp, #10
	ret
;	user/RTC_pcf8563.c: 16: uint8_t PCF_Write(uint8_t addr, uint8_t *data, uint8_t count)
;	-----------------------------------------
;	 function PCF_Write
;	-----------------------------------------
_PCF_Write:
	sub	sp, #37
;	user/RTC_pcf8563.c: 18: uint8_t res = 1;
	ld	a, #0x01
	ld	(0x01, sp), a
;	user/RTC_pcf8563.c: 21: I2C_AcknowledgeConfig(I2C_ACK_CURR);
	push	#0x01
	call	_I2C_AcknowledgeConfig
	pop	a
;	user/RTC_pcf8563.c: 22: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 24: while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY))
00103$:
	push	#0x02
	push	#0x03
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00105$
;	user/RTC_pcf8563.c: 26: if(!timeout--)
	ldw	y, (0x04, sp)
	ldw	(0x23, sp), y
	ldw	y, (0x02, sp)
	ldw	(0x21, sp), y
	ldw	x, (0x04, sp)
	subw	x, #0x0001
	ldw	(0x17, sp), x
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	(0x16, sp), a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	(0x15, sp), a
	ldw	y, (0x17, sp)
	ldw	(0x04, sp), y
	ldw	y, (0x15, sp)
	ldw	(0x02, sp), y
	ldw	x, (0x23, sp)
	jrne	00103$
	ldw	x, (0x21, sp)
	jrne	00103$
;	user/RTC_pcf8563.c: 29: return res;
	clr	a
	jp	00133$
00105$:
;	user/RTC_pcf8563.c: 33: I2C_GenerateSTART(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	user/RTC_pcf8563.c: 35: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 37: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
00108$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	ld	(0x14, sp), a
	tnz	(0x14, sp)
	jrne	00110$
;	user/RTC_pcf8563.c: 39: if(!timeout--) 
	ldw	y, (0x04, sp)
	ldw	(0x0e, sp), y
	ldw	y, (0x02, sp)
	ldw	(0x0c, sp), y
	ldw	y, (0x04, sp)
	subw	y, #0x0001
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	xl, a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	xh, a
	ldw	(0x04, sp), y
	ldw	(0x02, sp), x
	ldw	x, (0x0e, sp)
	jrne	00108$
	ldw	x, (0x0c, sp)
	jrne	00108$
;	user/RTC_pcf8563.c: 41: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 42: goto stop;
	jp	00132$
00110$:
;	user/RTC_pcf8563.c: 46: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
	push	#0x00
	push	#0xa2
	call	_I2C_Send7bitAddress
	popw	x
;	user/RTC_pcf8563.c: 47: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 49: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
00116$:
	push	#0x82
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jrne	00118$
;	user/RTC_pcf8563.c: 51: if(!timeout--)
	ldw	y, (0x02, sp)
	ldw	(0x08, sp), y
	ldw	x, (0x04, sp)
	ldw	y, (0x04, sp)
	subw	y, #0x0001
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	(0x1a, sp), a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ldw	(0x04, sp), y
	ld	(0x02, sp), a
	ld	a, (0x1a, sp)
	ld	(0x03, sp), a
	tnzw	x
	jrne	00114$
	ldw	x, (0x08, sp)
	jrne	00114$
;	user/RTC_pcf8563.c: 53: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 54: goto stop;
	jp	00132$
00114$:
;	user/RTC_pcf8563.c: 56: else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
	push	#0x04
	push	#0x02
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00116$
;	user/RTC_pcf8563.c: 58: I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
	push	#0x04
	push	#0x02
	call	_I2C_ClearFlag
	popw	x
;	user/RTC_pcf8563.c: 59: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 60: goto stop;
	jp	00132$
00118$:
;	user/RTC_pcf8563.c: 64: I2C_SendData(addr);
	ld	a, (0x28, sp)
	push	a
	call	_I2C_SendData
	pop	a
;	user/RTC_pcf8563.c: 65: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 67: while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
00121$:
	push	#0x84
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jrne	00152$
;	user/RTC_pcf8563.c: 69: if(!timeout--)
	ldw	y, (0x04, sp)
	ldw	(0x1f, sp), y
	ldw	y, (0x02, sp)
	ldw	(0x1d, sp), y
	ldw	y, (0x04, sp)
	subw	y, #0x0001
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	xl, a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	xh, a
	ldw	(0x04, sp), y
	ldw	(0x02, sp), x
	ldw	x, (0x1f, sp)
	jrne	00121$
	ldw	x, (0x1d, sp)
	jrne	00121$
;	user/RTC_pcf8563.c: 71: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 72: goto stop;
	jra	00132$
;	user/RTC_pcf8563.c: 76: while(count)
00152$:
	ldw	y, (0x29, sp)
	ldw	(0x06, sp), y
	ld	a, (0x2b, sp)
	ld	(0x25, sp), a
00129$:
	tnz	(0x25, sp)
	jreq	00132$
;	user/RTC_pcf8563.c: 78: I2C_SendData(*data);
	ldw	x, (0x06, sp)
	ld	a, (x)
	push	a
	call	_I2C_SendData
	pop	a
;	user/RTC_pcf8563.c: 79: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 81: while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
00126$:
	push	#0x84
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jrne	00128$
;	user/RTC_pcf8563.c: 83: if(!timeout--)
	ldw	y, (0x04, sp)
	ldw	(0x12, sp), y
	ldw	y, (0x02, sp)
	ldw	(0x10, sp), y
	ldw	y, (0x04, sp)
	subw	y, #0x0001
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	xl, a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	xh, a
	ldw	(0x04, sp), y
	ldw	(0x02, sp), x
	ldw	x, (0x12, sp)
	jrne	00126$
	ldw	x, (0x10, sp)
	jrne	00126$
;	user/RTC_pcf8563.c: 85: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 86: goto stop;
	jra	00132$
00128$:
;	user/RTC_pcf8563.c: 89: data++;
	ldw	x, (0x06, sp)
	incw	x
	ldw	(0x06, sp), x
;	user/RTC_pcf8563.c: 90: count--;
	dec	(0x25, sp)
	jra	00129$
;	user/RTC_pcf8563.c: 93: stop: I2C_GenerateSTOP(ENABLE);
00132$:
	push	#0x01
	call	_I2C_GenerateSTOP
	pop	a
;	user/RTC_pcf8563.c: 94: return res;
	ld	a, (0x01, sp)
00133$:
	addw	sp, #37
	ret
;	user/RTC_pcf8563.c: 97: uint8_t PCF_Read(uint8_t addr, uint8_t *data, uint8_t count)
;	-----------------------------------------
;	 function PCF_Read
;	-----------------------------------------
_PCF_Read:
	sub	sp, #37
;	user/RTC_pcf8563.c: 99: uint8_t res = 1;
	ld	a, #0x01
	ld	(0x01, sp), a
;	user/RTC_pcf8563.c: 101: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 103: while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY))
00103$:
	push	#0x02
	push	#0x03
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00105$
;	user/RTC_pcf8563.c: 105: if(!timeout--)
	ldw	y, (0x04, sp)
	ldw	(0x1d, sp), y
	ldw	y, (0x02, sp)
	ldw	(0x1b, sp), y
	ldw	x, (0x04, sp)
	subw	x, #0x0001
	ldw	(0x24, sp), x
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	(0x23, sp), a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	(0x22, sp), a
	ldw	y, (0x24, sp)
	ldw	(0x04, sp), y
	ldw	y, (0x22, sp)
	ldw	(0x02, sp), y
	ldw	x, (0x1d, sp)
	jrne	00103$
	ldw	x, (0x1b, sp)
	jrne	00103$
;	user/RTC_pcf8563.c: 108: return res;
	clr	a
	jp	00155$
00105$:
;	user/RTC_pcf8563.c: 112: I2C_GenerateSTART(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	user/RTC_pcf8563.c: 113: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 115: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
00108$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	ld	(0x21, sp), a
	tnz	(0x21, sp)
	jrne	00110$
;	user/RTC_pcf8563.c: 117: if(!timeout--)
	ldw	y, (0x04, sp)
	ldw	(0x08, sp), y
	ldw	y, (0x02, sp)
	ldw	(0x06, sp), y
	ldw	y, (0x04, sp)
	subw	y, #0x0001
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	xl, a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	xh, a
	ldw	(0x04, sp), y
	ldw	(0x02, sp), x
	ldw	x, (0x08, sp)
	jrne	00108$
	ldw	x, (0x06, sp)
	jrne	00108$
;	user/RTC_pcf8563.c: 119: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 120: goto stop;
	jp	00154$
00110$:
;	user/RTC_pcf8563.c: 124: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
	push	#0x00
	push	#0xa2
	call	_I2C_Send7bitAddress
	popw	x
;	user/RTC_pcf8563.c: 125: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 126: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
00116$:
	push	#0x82
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jrne	00118$
;	user/RTC_pcf8563.c: 128: if(!timeout--)
	ldw	y, (0x02, sp)
	ldw	(0x0a, sp), y
	ldw	x, (0x04, sp)
	ldw	y, (0x04, sp)
	subw	y, #0x0001
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	(0x14, sp), a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ldw	(0x04, sp), y
	ld	(0x02, sp), a
	ld	a, (0x14, sp)
	ld	(0x03, sp), a
	tnzw	x
	jrne	00114$
	ldw	x, (0x0a, sp)
	jrne	00114$
;	user/RTC_pcf8563.c: 130: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 131: goto stop;
	jp	00154$
00114$:
;	user/RTC_pcf8563.c: 133: else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
	push	#0x04
	push	#0x02
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00116$
;	user/RTC_pcf8563.c: 135: I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
	push	#0x04
	push	#0x02
	call	_I2C_ClearFlag
	popw	x
;	user/RTC_pcf8563.c: 136: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 137: goto stop;
	jp	00154$
00118$:
;	user/RTC_pcf8563.c: 141: I2C_SendData(addr);
	ld	a, (0x28, sp)
	push	a
	call	_I2C_SendData
	pop	a
;	user/RTC_pcf8563.c: 142: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 143: while(!I2C_CheckEvent(I2C_FLAG_TRANSFERFINISHED))
00121$:
	push	#0x04
	push	#0x01
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jrne	00123$
;	user/RTC_pcf8563.c: 145: if(!timeout--)
	ldw	y, (0x04, sp)
	ldw	(0x19, sp), y
	ldw	y, (0x02, sp)
	ldw	(0x17, sp), y
	ldw	y, (0x04, sp)
	subw	y, #0x0001
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	xl, a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	xh, a
	ldw	(0x04, sp), y
	ldw	(0x02, sp), x
	ldw	x, (0x19, sp)
	jrne	00121$
	ldw	x, (0x17, sp)
	jrne	00121$
;	user/RTC_pcf8563.c: 147: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 148: goto stop;
	jp	00154$
00123$:
;	user/RTC_pcf8563.c: 153: I2C_GenerateSTART(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	user/RTC_pcf8563.c: 154: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 155: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT))
00126$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jrne	00128$
;	user/RTC_pcf8563.c: 157: if(!timeout--)
	ldw	y, (0x04, sp)
	ldw	(0x10, sp), y
	ldw	y, (0x02, sp)
	ldw	(0x0e, sp), y
	ldw	y, (0x04, sp)
	subw	y, #0x0001
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	xl, a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	xh, a
	ldw	(0x04, sp), y
	ldw	(0x02, sp), x
	ldw	x, (0x10, sp)
	jrne	00126$
	ldw	x, (0x0e, sp)
	jrne	00126$
;	user/RTC_pcf8563.c: 159: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 160: goto stop;
	jp	00154$
00128$:
;	user/RTC_pcf8563.c: 164: I2C_Send7bitAddress(PCF8563_READ_ADDR, I2C_DIRECTION_RX);
	push	#0x01
	push	#0xa3
	call	_I2C_Send7bitAddress
	popw	x
;	user/RTC_pcf8563.c: 165: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 166: while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
00134$:
	push	#0x02
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jrne	00136$
;	user/RTC_pcf8563.c: 168: if(!timeout)
	ldw	x, (0x04, sp)
	jrne	00132$
	ldw	x, (0x02, sp)
	jrne	00132$
;	user/RTC_pcf8563.c: 170: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 171: goto stop;
	jp	00154$
00132$:
;	user/RTC_pcf8563.c: 173: else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
	push	#0x04
	push	#0x02
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00134$
;	user/RTC_pcf8563.c: 175: I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
	push	#0x04
	push	#0x02
	call	_I2C_ClearFlag
	popw	x
;	user/RTC_pcf8563.c: 176: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 177: goto stop;
	jp	00154$
00136$:
;	user/RTC_pcf8563.c: 180: disableInterrupts();
	sim
;	user/RTC_pcf8563.c: 181: while(count)
	ldw	y, (0x29, sp)
	ldw	(0x1f, sp), y
	ld	a, (0x2b, sp)
	ld	(0x12, sp), a
00151$:
	tnz	(0x12, sp)
	jrne	00294$
	jp	00153$
00294$:
;	user/RTC_pcf8563.c: 183: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 184: while(--timeout && I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);
00138$:
	ldw	y, (0x04, sp)
	subw	y, #0x0001
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	xl, a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	xh, a
	ldw	(0x04, sp), y
	ldw	(0x02, sp), x
	ldw	x, (0x04, sp)
	jrne	00295$
	ldw	x, (0x02, sp)
	jreq	00140$
00295$:
	push	#0x04
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00138$
00140$:
;	user/RTC_pcf8563.c: 185: if(count == 0)
	tnz	(0x12, sp)
	jrne	00142$
;	user/RTC_pcf8563.c: 187: I2C_AcknowledgeConfig(I2C_ACK_NONE);
	push	#0x00
	call	_I2C_AcknowledgeConfig
	pop	a
;	user/RTC_pcf8563.c: 188: I2C_GenerateSTOP(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTOP
	pop	a
00142$:
;	user/RTC_pcf8563.c: 190: I2C_AcknowledgeConfig(I2C_ACK_CURR);
	push	#0x01
	call	_I2C_AcknowledgeConfig
	pop	a
;	user/RTC_pcf8563.c: 194: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 195: while (--timeout && I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) == RESET);
00144$:
	ldw	y, (0x04, sp)
	subw	y, #0x0001
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	xl, a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	xh, a
	ldw	(0x04, sp), y
	ldw	(0x02, sp), x
	ldw	x, (0x04, sp)
	jrne	00298$
	ldw	x, (0x02, sp)
	jreq	00146$
00298$:
	push	#0x40
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00144$
00146$:
;	user/RTC_pcf8563.c: 196: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 197: while(--timeout && !I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED));
00148$:
	ldw	y, (0x04, sp)
	subw	y, #0x0001
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	xl, a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	xh, a
	ldw	(0x04, sp), y
	ldw	(0x02, sp), x
	ldw	x, (0x04, sp)
	jrne	00300$
	ldw	x, (0x02, sp)
	jreq	00150$
00300$:
	push	#0x40
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00148$
00150$:
;	user/RTC_pcf8563.c: 198: *data = I2C_ReceiveData();
	call	_I2C_ReceiveData
	ldw	x, (0x1f, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 199: data++;
	ldw	x, (0x1f, sp)
	incw	x
	ldw	(0x1f, sp), x
;	user/RTC_pcf8563.c: 200: count--;
	dec	(0x12, sp)
	jp	00151$
00153$:
;	user/RTC_pcf8563.c: 202: enableInterrupts();
	rim
;	user/RTC_pcf8563.c: 203: stop: I2C_GenerateSTOP(ENABLE);
00154$:
	push	#0x01
	call	_I2C_GenerateSTOP
	pop	a
;	user/RTC_pcf8563.c: 204: return res;
	ld	a, (0x01, sp)
00155$:
	addw	sp, #37
	ret
;	user/RTC_pcf8563.c: 207: void PCF_Init(uint8_t mode)
;	-----------------------------------------
;	 function PCF_Init
;	-----------------------------------------
_PCF_Init:
	push	a
;	user/RTC_pcf8563.c: 209: uint8_t tmp = 0x00;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 210: I2C_setup();
	call	_I2C_setup
;	user/RTC_pcf8563.c: 211: PCF_Write(0x00, &tmp, 1);
	ldw	x, sp
	incw	x
	push	#0x01
	pushw	x
	push	#0x00
	call	_PCF_Write
	addw	sp, #4
;	user/RTC_pcf8563.c: 212: mode &= 0x13;
	ld	a, (0x04, sp)
	and	a, #0x13
	ld	(0x04, sp), a
;	user/RTC_pcf8563.c: 213: PCF_Write(0x00, &mode, 1);
	ldw	x, sp
	addw	x, #4
	push	#0x01
	pushw	x
	push	#0x00
	call	_PCF_Write
	addw	sp, #5
	ret
;	user/RTC_pcf8563.c: 216: uint8_t PCF_setDateTime(DateTime *dateTime)
;	-----------------------------------------
;	 function PCF_setDateTime
;	-----------------------------------------
_PCF_setDateTime:
	sub	sp, #38
;	user/RTC_pcf8563.c: 219: if (dateTime->second >= 60 || dateTime->minute >= 60 || dateTime->hour >= 24 || dateTime->day > 32 || dateTime->weekday > 6 || dateTime->month > 12 || dateTime->year < 1900 || dateTime->year >= 2100)
	ldw	y, (0x29, sp)
	ldw	(0x20, sp), y
	ldw	x, (0x20, sp)
	ld	a, (x)
	ld	(0x09, sp), a
	ld	a, (0x09, sp)
	cp	a, #0x3c
	jrnc	00101$
	ldw	y, (0x20, sp)
	incw	y
	ld	a, (y)
	cp	a, #0x3c
	jrnc	00101$
	ldw	x, (0x20, sp)
	incw	x
	incw	x
	ldw	(0x0c, sp), x
	ldw	x, (0x0c, sp)
	ld	a, (x)
	cp	a, #0x18
	jrnc	00101$
	ldw	x, (0x20, sp)
	addw	x, #0x0003
	ldw	(0x17, sp), x
	ldw	x, (0x17, sp)
	ld	a, (x)
	cp	a, #0x20
	jrugt	00101$
	ldw	x, (0x20, sp)
	addw	x, #0x0004
	ldw	(0x15, sp), x
	ldw	x, (0x15, sp)
	ld	a, (x)
	cp	a, #0x06
	jrugt	00101$
	ldw	x, (0x20, sp)
	addw	x, #0x0005
	ldw	(0x11, sp), x
	ldw	x, (0x11, sp)
	ld	a, (x)
	cp	a, #0x0c
	jrugt	00101$
	ldw	x, (0x20, sp)
	addw	x, #0x0006
	ldw	(0x1a, sp), x
	ldw	x, (0x1a, sp)
	ldw	x, (x)
	cpw	x, #0x076c
	jrc	00101$
	cpw	x, #0x0834
	jrc	00102$
00101$:
;	user/RTC_pcf8563.c: 221: return 0;
	clr	a
	jp	00113$
00102$:
;	user/RTC_pcf8563.c: 223: buffer[0] = BinToBCD(dateTime->second) & 0x7F;
	ldw	x, sp
	incw	x
	ldw	(0x0a, sp), x
	clrw	x
	ld	a, (0x09, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	swap	a
	and	a, #0xf0
	ld	(0x19, sp), a
	clrw	x
	ld	a, (0x09, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x19, sp)
	and	a, #0x7f
	ldw	x, (0x0a, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 224: buffer[1] = BinToBCD(dateTime->minute) & 0x7F;
	ldw	x, (0x0a, sp)
	incw	x
	ldw	(0x23, sp), x
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
	ld	(0x10, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x10, sp)
	and	a, #0x7f
	ldw	x, (0x23, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 225: buffer[2] = BinToBCD(dateTime->hour) & 0x3F;
	ldw	y, (0x0a, sp)
	addw	y, #0x0002
	ldw	x, (0x0c, sp)
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
	and	a, #0x3f
	ld	(y), a
;	user/RTC_pcf8563.c: 226: buffer[3] = BinToBCD(dateTime->day) & 0x3F;
	ldw	y, (0x0a, sp)
	addw	y, #0x0003
	ldw	x, (0x17, sp)
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
	ld	(0x1e, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x1e, sp)
	and	a, #0x3f
	ld	(y), a
;	user/RTC_pcf8563.c: 227: buffer[4] = BinToBCD(dateTime->weekday) & 0x07;
	ldw	y, (0x0a, sp)
	addw	y, #0x0004
	ldw	x, (0x15, sp)
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
	ld	(0x14, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x14, sp)
	and	a, #0x07
	ld	(y), a
;	user/RTC_pcf8563.c: 228: buffer[5] = BinToBCD(dateTime->month) & 0x1F;
	ldw	x, (0x0a, sp)
	addw	x, #0x0005
	ldw	(0x25, sp), x
	ldw	x, (0x11, sp)
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
	ld	(0x08, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x08, sp)
	and	a, #0x1f
	ldw	x, (0x25, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 230: if (dateTime->year >= 2000)
	ldw	x, (0x1a, sp)
	ldw	x, (x)
	ldw	(0x0e, sp), x
;	user/RTC_pcf8563.c: 233: buffer[6] = BinToBCD(dateTime->year - 2000);
	ldw	x, (0x0a, sp)
	addw	x, #0x0006
	ldw	(0x1c, sp), x
;	user/RTC_pcf8563.c: 230: if (dateTime->year >= 2000)
	ldw	x, (0x0e, sp)
	cpw	x, #0x07d0
	jrc	00111$
;	user/RTC_pcf8563.c: 232: buffer[5] |= 0x80;
	ldw	x, (0x25, sp)
	ld	a, (x)
	or	a, #0x80
	ldw	x, (0x25, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 233: buffer[6] = BinToBCD(dateTime->year - 2000);
	ldw	x, (0x1a, sp)
	ldw	x, (x)
	subw	x, #0x07d0
	pushw	x
	ldw	y, #0x000a
	divw	x, y
	ld	a, xl
	popw	x
	swap	a
	and	a, #0xf0
	ld	(0x1f, sp), a
	ldw	y, #0x000a
	divw	x, y
	ld	a, yl
	add	a, (0x1f, sp)
	ldw	x, (0x1c, sp)
	ld	(x), a
	jra	00112$
00111$:
;	user/RTC_pcf8563.c: 237: buffer[6] = BinToBCD(dateTime->year - 1900);
	ldw	x, (0x0e, sp)
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
	ld	(0x13, sp), a
	exg	a, yl
	add	a, (0x13, sp)
	ldw	x, (0x1c, sp)
	ld	(x), a
00112$:
;	user/RTC_pcf8563.c: 240: PCF_Write(0x02, buffer, sizeof(buffer));
	ldw	x, (0x0a, sp)
	push	#0x07
	pushw	x
	push	#0x02
	call	_PCF_Write
	addw	sp, #4
;	user/RTC_pcf8563.c: 242: return 1;
	ld	a, #0x01
00113$:
	addw	sp, #38
	ret
;	user/RTC_pcf8563.c: 245: uint8_t PCF_getDateTime(DateTime *dateTime)
;	-----------------------------------------
;	 function PCF_getDateTime
;	-----------------------------------------
_PCF_getDateTime:
	sub	sp, #28
;	user/RTC_pcf8563.c: 249: PCF_Read(0x02, buffer, sizeof(buffer));
	ldw	x, sp
	incw	x
	ldw	(0x0e, sp), x
	ldw	x, (0x0e, sp)
	push	#0x07
	pushw	x
	push	#0x02
	call	_PCF_Read
	addw	sp, #4
;	user/RTC_pcf8563.c: 250: dateTime->second = (((buffer[0] >> 4) & 0x07) * 10) + (buffer[0] & 0x0F);
	ldw	y, (0x1f, sp)
	ldw	(0x0a, sp), y
	ldw	x, (0x0e, sp)
	ld	a, (x)
	ld	(0x19, sp), a
	ld	a, (0x19, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x07
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x19, sp)
	and	a, #0x0f
	ld	(0x0c, sp), a
	ld	a, xl
	add	a, (0x0c, sp)
	ldw	x, (0x0a, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 251: dateTime->minute = (((buffer[1] >> 4) & 0x07) * 10) + (buffer[1] & 0x0F);
	ldw	x, (0x0a, sp)
	incw	x
	ldw	(0x10, sp), x
	ldw	x, (0x0e, sp)
	ld	a, (0x1, x)
	ld	(0x09, sp), a
	ld	a, (0x09, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x07
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x09, sp)
	and	a, #0x0f
	ld	(0x08, sp), a
	ld	a, xl
	add	a, (0x08, sp)
	ldw	x, (0x10, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 252: dateTime->hour = (((buffer[2] >> 4) & 0x03) * 10) + (buffer[2] & 0x0F);
	ldw	y, (0x0a, sp)
	addw	y, #0x0002
	ldw	x, (0x0e, sp)
	ld	a, (0x2, x)
	ld	(0x0d, sp), a
	ld	a, (0x0d, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x03
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x0d, sp)
	and	a, #0x0f
	ld	(0x14, sp), a
	ld	a, xl
	add	a, (0x14, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 253: dateTime->day = (((buffer[3] >> 4) & 0x03) * 10) + (buffer[3] & 0x0F);
	ldw	y, (0x0a, sp)
	addw	y, #0x0003
	ldw	x, (0x0e, sp)
	ld	a, (0x3, x)
	ld	(0x17, sp), a
	ld	a, (0x17, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x03
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x17, sp)
	and	a, #0x0f
	ld	(0x18, sp), a
	ld	a, xl
	add	a, (0x18, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 254: dateTime->weekday = (buffer[4] & 0x07);
	ldw	x, (0x0a, sp)
	addw	x, #0x0004
	ldw	y, (0x0e, sp)
	ld	a, (0x4, y)
	and	a, #0x07
	ld	(x), a
;	user/RTC_pcf8563.c: 255: dateTime->month = ((buffer[5] >> 4) & 0x01) * 10 + (buffer[5] & 0x0F);
	ldw	y, (0x0a, sp)
	addw	y, #0x0005
	ldw	x, (0x0e, sp)
	addw	x, #0x0005
	ldw	(0x1b, sp), x
	ldw	x, (0x1b, sp)
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
	ld	(0x1a, sp), a
	ld	a, xl
	add	a, (0x1a, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 256: dateTime->year = 1900 + ((buffer[6] >> 4) & 0x0F) * 10 + (buffer[6] & 0x0F);
	ldw	x, (0x0a, sp)
	addw	x, #0x0006
	ldw	(0x15, sp), x
	ldw	x, (0x0e, sp)
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
	ld	(0x13, sp), a
	clr	(0x12, sp)
	addw	y, (0x12, sp)
	ldw	x, (0x15, sp)
	ldw	(x), y
;	user/RTC_pcf8563.c: 258: if (buffer[5] &  0x80)
	ldw	x, (0x1b, sp)
	ld	a, (x)
	tnz	a
	jrpl	00102$
;	user/RTC_pcf8563.c: 260: dateTime->year += 100;
	ldw	x, (0x15, sp)
	ldw	x, (x)
	addw	x, #0x0064
	ldw	y, (0x15, sp)
	ldw	(y), x
00102$:
;	user/RTC_pcf8563.c: 263: if (buffer[0] & 0x80) //Clock integrity not guaranted
	ldw	x, (0x0e, sp)
	ld	a, (x)
	tnz	a
	jrpl	00104$
;	user/RTC_pcf8563.c: 265: return 0;
	clr	a
	jra	00105$
00104$:
;	user/RTC_pcf8563.c: 268: return 1;
	ld	a, #0x01
00105$:
	addw	sp, #28
	ret
;	user/RTC_pcf8563.c: 272: uint8_t PCF_setAlarm(Alarm *alarm)
;	-----------------------------------------
;	 function PCF_setAlarm
;	-----------------------------------------
_PCF_setAlarm:
	sub	sp, #19
;	user/RTC_pcf8563.c: 275: if ((alarm->minute >= 60 && alarm->minute != 80) || (alarm->hour >= 24 && alarm->hour != 80) || (alarm->day > 32 && alarm->day != 80) || (alarm->weekday > 6 && alarm->weekday != 80))
	ldw	y, (0x16, sp)
	ldw	(0x12, sp), y
	ldw	x, (0x12, sp)
	ld	a, (x)
	ld	(0x11, sp), a
	ld	a, (0x11, sp)
	cp	a, #0x3c
	jrc	00105$
	ld	a, (0x11, sp)
	cp	a, #0x50
	jrne	00101$
00105$:
	ldw	y, (0x12, sp)
	incw	y
	ld	a, (y)
	cp	a, #0x18
	jrc	00107$
	cp	a, #0x50
	jrne	00101$
00107$:
	ldw	x, (0x12, sp)
	incw	x
	incw	x
	ldw	(0x06, sp), x
	ldw	x, (0x06, sp)
	ld	a, (x)
	cp	a, #0x20
	jrule	00109$
	cp	a, #0x50
	jrne	00101$
00109$:
	ldw	x, (0x12, sp)
	addw	x, #0x0003
	ldw	(0x0b, sp), x
	ldw	x, (0x0b, sp)
	ld	a, (x)
	cp	a, #0x06
	jrule	00102$
	cp	a, #0x50
	jreq	00102$
00101$:
;	user/RTC_pcf8563.c: 277: return 1;
	ld	a, #0x01
	jp	00110$
00102$:
;	user/RTC_pcf8563.c: 279: buffer[0] = BinToBCD(alarm->minute) & 0xFF;
	ldw	x, sp
	incw	x
	ldw	(0x08, sp), x
	clrw	x
	ld	a, (0x11, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	swap	a
	and	a, #0xf0
	ld	(0x05, sp), a
	clrw	x
	ld	a, (0x11, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x05, sp)
	ldw	x, (0x08, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 280: buffer[1] = BinToBCD(alarm->hour) & 0xBF;
	ldw	x, (0x08, sp)
	incw	x
	ldw	(0x0d, sp), x
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
	ld	(0x10, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x10, sp)
	and	a, #0xbf
	ldw	x, (0x0d, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 281: buffer[2] = BinToBCD(alarm->day) & 0xBF;
	ldw	y, (0x08, sp)
	addw	y, #0x0002
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
	ld	(0x0a, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x0a, sp)
	and	a, #0xbf
	ld	(y), a
;	user/RTC_pcf8563.c: 282: buffer[3] = BinToBCD(alarm->weekday) & 0x87;
	ldw	y, (0x08, sp)
	addw	y, #0x0003
	ldw	x, (0x0b, sp)
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
	ld	(0x0f, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x0f, sp)
	and	a, #0x87
	ld	(y), a
;	user/RTC_pcf8563.c: 284: PCF_Write(0x09, buffer, sizeof(buffer));
	ldw	x, (0x08, sp)
	push	#0x04
	pushw	x
	push	#0x09
	call	_PCF_Write
	addw	sp, #4
;	user/RTC_pcf8563.c: 286: return 0;
	clr	a
00110$:
	addw	sp, #19
	ret
;	user/RTC_pcf8563.c: 289: void PCF_setTimer(uint8_t mode, uint8_t count)
;	-----------------------------------------
;	 function PCF_setTimer
;	-----------------------------------------
_PCF_setTimer:
;	user/RTC_pcf8563.c: 291: mode &= 0x13;
	ld	a, (0x03, sp)
	and	a, #0x13
	ld	(0x03, sp), a
;	user/RTC_pcf8563.c: 292: PCF_Write(0x0E, &mode, 1);				//Timer_control
	ldw	x, sp
	addw	x, #3
	push	#0x01
	pushw	x
	push	#0x0e
	call	_PCF_Write
	addw	sp, #4
;	user/RTC_pcf8563.c: 293: PCF_Write(0x0F, &count, 1);				//Timer
	ldw	x, sp
	addw	x, #4
	push	#0x01
	pushw	x
	push	#0x0f
	call	_PCF_Write
	addw	sp, #4
	ret
;	user/RTC_pcf8563.c: 296: uint8_t PCF_getTimer()
;	-----------------------------------------
;	 function PCF_getTimer
;	-----------------------------------------
_PCF_getTimer:
	push	a
;	user/RTC_pcf8563.c: 299: PCF_Read(0x0F, &count, 1);				//Timer
	ldw	x, sp
	incw	x
	push	#0x01
	pushw	x
	push	#0x0f
	call	_PCF_Read
	addw	sp, #4
;	user/RTC_pcf8563.c: 301: return count;
	ld	a, (0x01, sp)
	addw	sp, #1
	ret
;	user/RTC_pcf8563.c: 304: uint8_t PCF_getAlarm(Alarm *alarm)
;	-----------------------------------------
;	 function PCF_getAlarm
;	-----------------------------------------
_PCF_getAlarm:
	sub	sp, #15
;	user/RTC_pcf8563.c: 308: PCF_Read(0x09, buffer, sizeof(buffer));
	ldw	x, sp
	incw	x
	ldw	(0x0d, sp), x
	ldw	x, (0x0d, sp)
	push	#0x04
	pushw	x
	push	#0x09
	call	_PCF_Read
	addw	sp, #4
;	user/RTC_pcf8563.c: 310: alarm->minute = (((buffer[0] >> 4) & 0x0F) * 10) + (buffer[0] & 0x0F);
	ldw	y, (0x12, sp)
	ldw	(0x07, sp), y
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
	ld	(0x09, sp), a
	ld	a, xl
	add	a, (0x09, sp)
	ldw	x, (0x07, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 311: alarm->hour = (((buffer[1] >> 4) & 0x0B) * 10) + (buffer[1] & 0x0F);
	ldw	y, (0x07, sp)
	incw	y
	ldw	x, (0x0d, sp)
	ld	a, (0x1, x)
	ld	(0x0b, sp), a
	ld	a, (0x0b, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x0b
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x0b, sp)
	and	a, #0x0f
	ld	(0x0c, sp), a
	ld	a, xl
	add	a, (0x0c, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 312: alarm->day = (((buffer[2] >> 4) & 0x0B) * 10) + (buffer[2] & 0x0F);
	ldw	y, (0x07, sp)
	addw	y, #0x0002
	ldw	x, (0x0d, sp)
	ld	a, (0x2, x)
	ld	(0x06, sp), a
	ld	a, (0x06, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x0b
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x06, sp)
	and	a, #0x0f
	ld	(0x0a, sp), a
	ld	a, xl
	add	a, (0x0a, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 313: alarm->weekday = (((buffer[3] >> 4) & 0x08) * 10) + (buffer[3] & 0x07);
	ldw	y, (0x07, sp)
	addw	y, #0x0003
	ldw	x, (0x0d, sp)
	ld	a, (0x3, x)
	ld	(0x0f, sp), a
	ld	a, (0x0f, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x08
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x0f, sp)
	and	a, #0x07
	ld	(0x05, sp), a
	ld	a, xl
	add	a, (0x05, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 315: return 0;
	clr	a
	addw	sp, #15
	ret
;	user/RTC_pcf8563.c: 318: uint8_t PCF_getAndClearFlags(void)
;	-----------------------------------------
;	 function PCF_getAndClearFlags
;	-----------------------------------------
_PCF_getAndClearFlags:
	pushw	x
;	user/RTC_pcf8563.c: 322: PCF_Read(0x01, &flags, 1);				//Control_status_2
	ldw	x, sp
	incw	x
	push	#0x01
	pushw	x
	push	#0x01
	call	_PCF_Read
	addw	sp, #4
;	user/RTC_pcf8563.c: 323: cleared = flags & 0x13;
	ld	a, (0x01, sp)
	and	a, #0x13
	ld	(0x02, sp), a
;	user/RTC_pcf8563.c: 324: PCF_Write(0x01, &cleared, 1);			//Control_status_2
	ldw	x, sp
	incw	x
	incw	x
	push	#0x01
	pushw	x
	push	#0x01
	call	_PCF_Write
	addw	sp, #4
;	user/RTC_pcf8563.c: 326: return flags & 0x0C;					//Mask unnecessary bits
	ld	a, (0x01, sp)
	and	a, #0x0c
	popw	x
	ret
;	user/RTC_pcf8563.c: 329: void PCF_setClockOut(uint8_t mode)
;	-----------------------------------------
;	 function PCF_setClockOut
;	-----------------------------------------
_PCF_setClockOut:
;	user/RTC_pcf8563.c: 331: mode &= 0x13;
	ld	a, (0x03, sp)
	and	a, #0x13
	ld	(0x03, sp), a
;	user/RTC_pcf8563.c: 332: PCF_Write(0x0D, &mode, 1);				//CLKOUT_control
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
