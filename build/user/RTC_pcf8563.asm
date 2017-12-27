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
	.globl _ExitCriticalSection_UserCallback
	.globl _EnterCriticalSection_UserCallback
	.globl _I2C_setup
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
	.globl _timeout
	.globl _PCF_Write
	.globl _PCF_Read
	.globl _PCF_getDateTime
	.globl _PCF_Init
	.globl _PCF_setDateTime
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
_timeout::
	.ds 4
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
;	user/RTC_pcf8563.c: 11: void I2C_setup(void)
;	-----------------------------------------
;	 function I2C_setup
;	-----------------------------------------
_I2C_setup:
;	user/RTC_pcf8563.c: 14: I2C_DeInit();
	call	_I2C_DeInit
;	user/RTC_pcf8563.c: 15: Input_Clock = CLK_GetClockFreq()/1000000;
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
;	user/RTC_pcf8563.c: 16: I2C_Cmd(ENABLE);
	push	a
	push	#0x01
	call	_I2C_Cmd
	pop	a
	pop	a
;	user/RTC_pcf8563.c: 17: I2C_Init(100000, PCF8563_WRITE_ADDR, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, Input_Clock);
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
;	user/RTC_pcf8563.c: 20: void EnterCriticalSection_UserCallback(void)
;	-----------------------------------------
;	 function EnterCriticalSection_UserCallback
;	-----------------------------------------
_EnterCriticalSection_UserCallback:
;	user/RTC_pcf8563.c: 22: disableInterrupts();  
	sim
	ret
;	user/RTC_pcf8563.c: 25: void ExitCriticalSection_UserCallback(void)
;	-----------------------------------------
;	 function ExitCriticalSection_UserCallback
;	-----------------------------------------
_ExitCriticalSection_UserCallback:
;	user/RTC_pcf8563.c: 27: enableInterrupts();
	rim
	ret
;	user/RTC_pcf8563.c: 43: uint8_t PCF_Write(uint8_t addr, uint8_t *data, uint8_t count)
;	-----------------------------------------
;	 function PCF_Write
;	-----------------------------------------
_PCF_Write:
	sub	sp, #37
;	user/RTC_pcf8563.c: 45: uint8_t res = 1;
	ld	a, #0x01
	ld	(0x01, sp), a
;	user/RTC_pcf8563.c: 48: I2C_AcknowledgeConfig(I2C_ACK_CURR);
	push	#0x01
	call	_I2C_AcknowledgeConfig
	pop	a
;	user/RTC_pcf8563.c: 49: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 51: while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY))
00103$:
	push	#0x02
	push	#0x03
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00105$
;	user/RTC_pcf8563.c: 53: if(!timeout--)
	ldw	y, (0x04, sp)
	ldw	(0x17, sp), y
	ldw	y, (0x02, sp)
	ldw	(0x15, sp), y
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
	ldw	x, (0x17, sp)
	jrne	00103$
	ldw	x, (0x15, sp)
	jrne	00103$
;	user/RTC_pcf8563.c: 56: return res;
	clr	a
	jp	00133$
00105$:
;	user/RTC_pcf8563.c: 60: I2C_GenerateSTART(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	user/RTC_pcf8563.c: 62: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 64: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
00108$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	ld	(0x21, sp), a
	tnz	(0x21, sp)
	jrne	00110$
;	user/RTC_pcf8563.c: 66: if(!timeout--) 
	ldw	y, (0x04, sp)
	ldw	(0x11, sp), y
	ldw	y, (0x02, sp)
	ldw	(0x0f, sp), y
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
	ldw	x, (0x11, sp)
	jrne	00108$
	ldw	x, (0x0f, sp)
	jrne	00108$
;	user/RTC_pcf8563.c: 68: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 69: goto stop;
	jp	00132$
00110$:
;	user/RTC_pcf8563.c: 73: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
	push	#0x00
	push	#0xa2
	call	_I2C_Send7bitAddress
	popw	x
;	user/RTC_pcf8563.c: 74: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 76: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
00116$:
	push	#0x82
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jrne	00118$
;	user/RTC_pcf8563.c: 78: if(!timeout--)
	ldw	y, (0x02, sp)
	ldw	(0x19, sp), y
	ldw	x, (0x04, sp)
	ldw	y, (0x04, sp)
	subw	y, #0x0001
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	(0x1e, sp), a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ldw	(0x04, sp), y
	ld	(0x02, sp), a
	ld	a, (0x1e, sp)
	ld	(0x03, sp), a
	tnzw	x
	jrne	00114$
	ldw	x, (0x19, sp)
	jrne	00114$
;	user/RTC_pcf8563.c: 80: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 81: goto stop;
	jp	00132$
00114$:
;	user/RTC_pcf8563.c: 83: else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
	push	#0x04
	push	#0x02
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00116$
;	user/RTC_pcf8563.c: 85: I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
	push	#0x04
	push	#0x02
	call	_I2C_ClearFlag
	popw	x
;	user/RTC_pcf8563.c: 86: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 87: goto stop;
	jp	00132$
00118$:
;	user/RTC_pcf8563.c: 91: I2C_SendData(addr);
	ld	a, (0x28, sp)
	push	a
	call	_I2C_SendData
	pop	a
;	user/RTC_pcf8563.c: 92: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 94: while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
00121$:
	push	#0x84
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jrne	00152$
;	user/RTC_pcf8563.c: 96: if(!timeout--)
	ldw	y, (0x04, sp)
	ldw	(0x0c, sp), y
	ldw	y, (0x02, sp)
	ldw	(0x0a, sp), y
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
	ldw	x, (0x0c, sp)
	jrne	00121$
	ldw	x, (0x0a, sp)
	jrne	00121$
;	user/RTC_pcf8563.c: 98: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 99: goto stop;
	jra	00132$
;	user/RTC_pcf8563.c: 103: while(count)
00152$:
	ldw	y, (0x29, sp)
	ldw	(0x13, sp), y
	ld	a, (0x2b, sp)
	ld	(0x0e, sp), a
00129$:
	tnz	(0x0e, sp)
	jreq	00132$
;	user/RTC_pcf8563.c: 105: I2C_SendData(*data);
	ldw	x, (0x13, sp)
	ld	a, (x)
	push	a
	call	_I2C_SendData
	pop	a
;	user/RTC_pcf8563.c: 106: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 108: while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
00126$:
	push	#0x84
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jrne	00128$
;	user/RTC_pcf8563.c: 110: if(!timeout--)
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
	jrne	00126$
	ldw	x, (0x06, sp)
	jrne	00126$
;	user/RTC_pcf8563.c: 112: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 113: goto stop;
	jra	00132$
00128$:
;	user/RTC_pcf8563.c: 116: data++;
	ldw	x, (0x13, sp)
	incw	x
	ldw	(0x13, sp), x
;	user/RTC_pcf8563.c: 117: count--;
	dec	(0x0e, sp)
	jra	00129$
;	user/RTC_pcf8563.c: 120: stop: I2C_GenerateSTOP(ENABLE);
00132$:
	push	#0x01
	call	_I2C_GenerateSTOP
	pop	a
;	user/RTC_pcf8563.c: 121: return res;
	ld	a, (0x01, sp)
00133$:
	addw	sp, #37
	ret
;	user/RTC_pcf8563.c: 124: uint8_t PCF_Read(uint8_t addr, uint8_t *data, uint8_t count)
;	-----------------------------------------
;	 function PCF_Read
;	-----------------------------------------
_PCF_Read:
	sub	sp, #37
;	user/RTC_pcf8563.c: 126: uint8_t res = 1;
	ld	a, #0x01
	ld	(0x01, sp), a
;	user/RTC_pcf8563.c: 128: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 130: while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY))
00103$:
	push	#0x02
	push	#0x03
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00105$
;	user/RTC_pcf8563.c: 132: if(!timeout--)
	ldw	y, (0x04, sp)
	ldw	(0x09, sp), y
	ldw	y, (0x02, sp)
	ldw	(0x07, sp), y
	ldw	x, (0x04, sp)
	subw	x, #0x0001
	ldw	(0x0d, sp), x
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	(0x0c, sp), a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	(0x0b, sp), a
	ldw	y, (0x0d, sp)
	ldw	(0x04, sp), y
	ldw	y, (0x0b, sp)
	ldw	(0x02, sp), y
	ldw	x, (0x09, sp)
	jrne	00103$
	ldw	x, (0x07, sp)
	jrne	00103$
;	user/RTC_pcf8563.c: 135: return res;
	clr	a
	jp	00155$
00105$:
;	user/RTC_pcf8563.c: 139: I2C_GenerateSTART(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	user/RTC_pcf8563.c: 140: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 142: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
00108$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	ld	(0x06, sp), a
	tnz	(0x06, sp)
	jrne	00110$
;	user/RTC_pcf8563.c: 144: if(!timeout--)
	ldw	y, (0x04, sp)
	ldw	(0x1a, sp), y
	ldw	y, (0x02, sp)
	ldw	(0x18, sp), y
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
	ldw	x, (0x1a, sp)
	jrne	00108$
	ldw	x, (0x18, sp)
	jrne	00108$
;	user/RTC_pcf8563.c: 146: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 147: goto stop;
	jp	00154$
00110$:
;	user/RTC_pcf8563.c: 151: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
	push	#0x00
	push	#0xa2
	call	_I2C_Send7bitAddress
	popw	x
;	user/RTC_pcf8563.c: 152: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 153: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
00116$:
	push	#0x82
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jrne	00118$
;	user/RTC_pcf8563.c: 155: if(!timeout--)
	ldw	y, (0x02, sp)
	ldw	(0x22, sp), y
	ldw	x, (0x04, sp)
	ldw	y, (0x04, sp)
	subw	y, #0x0001
	ld	a, (0x03, sp)
	sbc	a, #0x00
	ld	(0x1f, sp), a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ldw	(0x04, sp), y
	ld	(0x02, sp), a
	ld	a, (0x1f, sp)
	ld	(0x03, sp), a
	tnzw	x
	jrne	00114$
	ldw	x, (0x22, sp)
	jrne	00114$
;	user/RTC_pcf8563.c: 157: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 158: goto stop;
	jp	00154$
00114$:
;	user/RTC_pcf8563.c: 160: else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
	push	#0x04
	push	#0x02
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00116$
;	user/RTC_pcf8563.c: 162: I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
	push	#0x04
	push	#0x02
	call	_I2C_ClearFlag
	popw	x
;	user/RTC_pcf8563.c: 163: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 164: goto stop;
	jp	00154$
00118$:
;	user/RTC_pcf8563.c: 168: I2C_SendData(addr);
	ld	a, (0x28, sp)
	push	a
	call	_I2C_SendData
	pop	a
;	user/RTC_pcf8563.c: 169: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 170: while(!I2C_CheckEvent(I2C_FLAG_TRANSFERFINISHED))
00121$:
	push	#0x04
	push	#0x01
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jrne	00123$
;	user/RTC_pcf8563.c: 172: if(!timeout--)
	ldw	y, (0x04, sp)
	ldw	(0x11, sp), y
	ldw	y, (0x02, sp)
	ldw	(0x0f, sp), y
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
	ldw	x, (0x11, sp)
	jrne	00121$
	ldw	x, (0x0f, sp)
	jrne	00121$
;	user/RTC_pcf8563.c: 174: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 175: goto stop;
	jp	00154$
00123$:
;	user/RTC_pcf8563.c: 180: I2C_GenerateSTART(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	user/RTC_pcf8563.c: 181: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 182: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT))
00126$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jrne	00128$
;	user/RTC_pcf8563.c: 184: if(!timeout--)
	ldw	y, (0x04, sp)
	ldw	(0x16, sp), y
	ldw	y, (0x02, sp)
	ldw	(0x14, sp), y
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
	ldw	x, (0x16, sp)
	jrne	00126$
	ldw	x, (0x14, sp)
	jrne	00126$
;	user/RTC_pcf8563.c: 186: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 187: goto stop;
	jp	00154$
00128$:
;	user/RTC_pcf8563.c: 191: I2C_Send7bitAddress(PCF8563_READ_ADDR, I2C_DIRECTION_RX);
	push	#0x01
	push	#0xa3
	call	_I2C_Send7bitAddress
	popw	x
;	user/RTC_pcf8563.c: 192: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 193: while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
00134$:
	push	#0x02
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jrne	00185$
;	user/RTC_pcf8563.c: 195: if(!timeout)
	ldw	x, (0x04, sp)
	jrne	00132$
	ldw	x, (0x02, sp)
	jrne	00132$
;	user/RTC_pcf8563.c: 197: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 198: goto stop;
	jp	00154$
00132$:
;	user/RTC_pcf8563.c: 200: else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
	push	#0x04
	push	#0x02
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00134$
;	user/RTC_pcf8563.c: 202: I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
	push	#0x04
	push	#0x02
	call	_I2C_ClearFlag
	popw	x
;	user/RTC_pcf8563.c: 203: res = 0;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 204: goto stop;
	jp	00154$
;	user/RTC_pcf8563.c: 207: while(count)
00185$:
	ldw	y, (0x29, sp)
	ldw	(0x1c, sp), y
	ld	a, (0x2b, sp)
	ld	(0x13, sp), a
00151$:
	tnz	(0x13, sp)
	jrne	00294$
	jp	00154$
00294$:
;	user/RTC_pcf8563.c: 209: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 210: while(--timeout && I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);
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
;	user/RTC_pcf8563.c: 211: if(count == 0)
	tnz	(0x13, sp)
	jrne	00142$
;	user/RTC_pcf8563.c: 213: I2C_AcknowledgeConfig(I2C_ACK_NONE);
	push	#0x00
	call	_I2C_AcknowledgeConfig
	pop	a
;	user/RTC_pcf8563.c: 214: I2C_GenerateSTOP(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTOP
	pop	a
00142$:
;	user/RTC_pcf8563.c: 216: I2C_AcknowledgeConfig(I2C_ACK_CURR);
	push	#0x01
	call	_I2C_AcknowledgeConfig
	pop	a
;	user/RTC_pcf8563.c: 220: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 221: while (--timeout && I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) == RESET);
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
;	user/RTC_pcf8563.c: 222: timeout = 0x0FFF;
	ldw	x, #0x0fff
	ldw	(0x04, sp), x
	clrw	x
	ldw	(0x02, sp), x
;	user/RTC_pcf8563.c: 223: while(--timeout && !I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED));
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
;	user/RTC_pcf8563.c: 224: *data = I2C_ReceiveData();
	call	_I2C_ReceiveData
	ldw	x, (0x1c, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 225: data++;
	ldw	x, (0x1c, sp)
	incw	x
	ldw	(0x1c, sp), x
;	user/RTC_pcf8563.c: 226: count--;
	dec	(0x13, sp)
	jp	00151$
;	user/RTC_pcf8563.c: 228: stop: I2C_GenerateSTOP(ENABLE);
00154$:
	push	#0x01
	call	_I2C_GenerateSTOP
	pop	a
;	user/RTC_pcf8563.c: 229: return res;
	ld	a, (0x01, sp)
00155$:
	addw	sp, #37
	ret
;	user/RTC_pcf8563.c: 318: uint8_t PCF_getDateTime(PCF_DateTime *dateTime)
;	-----------------------------------------
;	 function PCF_getDateTime
;	-----------------------------------------
_PCF_getDateTime:
	sub	sp, #28
;	user/RTC_pcf8563.c: 322: PCF_Read(0x02, buffer, sizeof(buffer));
	ldw	x, sp
	incw	x
	ldw	(0x16, sp), x
	ldw	x, (0x16, sp)
	push	#0x07
	pushw	x
	push	#0x02
	call	_PCF_Read
	addw	sp, #4
;	user/RTC_pcf8563.c: 324: dateTime->second = (((buffer[0] >> 4) & 0x07) * 10) + (buffer[0] & 0x0F);
	ldw	y, (0x1f, sp)
	ldw	(0x18, sp), y
	ldw	x, (0x16, sp)
	ld	a, (x)
	ld	(0x0a, sp), a
	ld	a, (0x0a, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x07
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x0a, sp)
	and	a, #0x0f
	ld	(0x1a, sp), a
	ld	a, xl
	add	a, (0x1a, sp)
	ldw	x, (0x18, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 325: dateTime->minute = (((buffer[1] >> 4) & 0x07) * 10) + (buffer[1] & 0x0F);
	ldw	x, (0x18, sp)
	incw	x
	ldw	(0x12, sp), x
	ldw	x, (0x16, sp)
	ld	a, (0x1, x)
	ld	(0x1c, sp), a
	ld	a, (0x1c, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x07
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x1c, sp)
	and	a, #0x0f
	ld	(0x14, sp), a
	ld	a, xl
	add	a, (0x14, sp)
	ldw	x, (0x12, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 326: dateTime->hour = (((buffer[2] >> 4) & 0x03) * 10) + (buffer[2] & 0x0F);
	ldw	y, (0x18, sp)
	addw	y, #0x0002
	ldw	x, (0x16, sp)
	ld	a, (0x2, x)
	ld	(0x11, sp), a
	ld	a, (0x11, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x03
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x11, sp)
	and	a, #0x0f
	ld	(0x0e, sp), a
	ld	a, xl
	add	a, (0x0e, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 327: dateTime->day = (((buffer[3] >> 4) & 0x03) * 10) + (buffer[3] & 0x0F);
	ldw	y, (0x18, sp)
	addw	y, #0x0003
	ldw	x, (0x16, sp)
	ld	a, (0x3, x)
	ld	(0x0b, sp), a
	ld	a, (0x0b, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x03
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x0b, sp)
	and	a, #0x0f
	ld	(0x1b, sp), a
	ld	a, xl
	add	a, (0x1b, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 328: dateTime->weekday = (buffer[4] & 0x07);
	ldw	x, (0x18, sp)
	addw	x, #0x0004
	ldw	y, (0x16, sp)
	ld	a, (0x4, y)
	and	a, #0x07
	ld	(x), a
;	user/RTC_pcf8563.c: 329: dateTime->month = ((buffer[5] >> 4) & 0x01) * 10 + (buffer[5] & 0x0F);
	ldw	y, (0x18, sp)
	addw	y, #0x0005
	ldw	x, (0x16, sp)
	addw	x, #0x0005
	ldw	(0x0c, sp), x
	ldw	x, (0x0c, sp)
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
	ld	(0x15, sp), a
	ld	a, xl
	add	a, (0x15, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 330: dateTime->year = 1900 + ((buffer[6] >> 4) & 0x0F) * 10 + (buffer[6] & 0x0F);
	ldw	x, (0x18, sp)
	addw	x, #0x0006
	ldw	(0x08, sp), x
	ldw	x, (0x16, sp)
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
	ld	(0x10, sp), a
	clr	(0x0f, sp)
	addw	y, (0x0f, sp)
	ldw	x, (0x08, sp)
	ldw	(x), y
;	user/RTC_pcf8563.c: 332: if (buffer[5] &  0x80)
	ldw	x, (0x0c, sp)
	ld	a, (x)
	tnz	a
	jrpl	00102$
;	user/RTC_pcf8563.c: 334: dateTime->year += 100;
	ldw	x, (0x08, sp)
	ldw	x, (x)
	addw	x, #0x0064
	ldw	y, (0x08, sp)
	ldw	(y), x
00102$:
;	user/RTC_pcf8563.c: 337: if (buffer[0] & 0x80) //Clock integrity not guaranted
	ldw	x, (0x16, sp)
	ld	a, (x)
	tnz	a
	jrpl	00104$
;	user/RTC_pcf8563.c: 339: return 1;
	ld	a, #0x01
;	user/RTC_pcf8563.c: 342: return 0;
	.byte 0x21
00104$:
	clr	a
00105$:
	addw	sp, #28
	ret
;	user/RTC_pcf8563.c: 347: void PCF_Init(uint8_t mode)
;	-----------------------------------------
;	 function PCF_Init
;	-----------------------------------------
_PCF_Init:
	push	a
;	user/RTC_pcf8563.c: 349: uint8_t tmp = 0x00;
	clr	(0x01, sp)
;	user/RTC_pcf8563.c: 350: I2C_setup();
	call	_I2C_setup
;	user/RTC_pcf8563.c: 353: PCF_Write(0x00, &tmp, 1);
	ldw	x, sp
	incw	x
	push	#0x01
	pushw	x
	push	#0x00
	call	_PCF_Write
	addw	sp, #4
;	user/RTC_pcf8563.c: 354: mode &= 0x13;
	ld	a, (0x04, sp)
	and	a, #0x13
	ld	(0x04, sp), a
;	user/RTC_pcf8563.c: 357: PCF_Write(0x00, &mode, 1);
	ldw	x, sp
	addw	x, #4
	push	#0x01
	pushw	x
	push	#0x00
	call	_PCF_Write
	addw	sp, #5
	ret
;	user/RTC_pcf8563.c: 360: uint8_t PCF_setDateTime(PCF_DateTime *dateTime)
;	-----------------------------------------
;	 function PCF_setDateTime
;	-----------------------------------------
_PCF_setDateTime:
	sub	sp, #38
;	user/RTC_pcf8563.c: 363: if (dateTime->second >= 60 || dateTime->minute >= 60 || dateTime->hour >= 24 || dateTime->day > 32 || dateTime->weekday > 6 || dateTime->month > 12 || dateTime->year < 1900 || dateTime->year >= 2100)
	ldw	y, (0x29, sp)
	ldw	(0x16, sp), y
	ldw	x, (0x16, sp)
	ld	a, (x)
	ld	(0x1f, sp), a
	ld	a, (0x1f, sp)
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
	ldw	(0x1d, sp), x
	ldw	x, (0x1d, sp)
	ld	a, (x)
	cp	a, #0x18
	jrnc	00101$
	ldw	x, (0x16, sp)
	addw	x, #0x0003
	ldw	(0x10, sp), x
	ldw	x, (0x10, sp)
	ld	a, (x)
	cp	a, #0x20
	jrugt	00101$
	ldw	x, (0x16, sp)
	addw	x, #0x0004
	ldw	(0x18, sp), x
	ldw	x, (0x18, sp)
	ld	a, (x)
	cp	a, #0x06
	jrugt	00101$
	ldw	x, (0x16, sp)
	addw	x, #0x0005
	ldw	(0x20, sp), x
	ldw	x, (0x20, sp)
	ld	a, (x)
	cp	a, #0x0c
	jrugt	00101$
	ldw	x, (0x16, sp)
	addw	x, #0x0006
	ldw	(0x22, sp), x
	ldw	x, (0x22, sp)
	ldw	x, (x)
	cpw	x, #0x076c
	jrc	00101$
	cpw	x, #0x0834
	jrc	00102$
00101$:
;	user/RTC_pcf8563.c: 365: return 1;
	ld	a, #0x01
	jp	00113$
00102$:
;	user/RTC_pcf8563.c: 368: buffer[0] = BinToBCD(dateTime->second) & 0x7F;
	ldw	x, sp
	incw	x
	ldw	(0x12, sp), x
	clrw	x
	ld	a, (0x1f, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	swap	a
	and	a, #0xf0
	ld	(0x1a, sp), a
	clrw	x
	ld	a, (0x1f, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x1a, sp)
	and	a, #0x7f
	ldw	x, (0x12, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 369: buffer[1] = BinToBCD(dateTime->minute) & 0x7F;
	ldw	x, (0x12, sp)
	incw	x
	ldw	(0x14, sp), x
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
	ld	(0x1b, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x1b, sp)
	and	a, #0x7f
	ldw	x, (0x14, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 370: buffer[2] = BinToBCD(dateTime->hour) & 0x3F;
	ldw	y, (0x12, sp)
	addw	y, #0x0002
	ldw	x, (0x1d, sp)
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
	ld	(0x1c, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x1c, sp)
	and	a, #0x3f
	ld	(y), a
;	user/RTC_pcf8563.c: 371: buffer[3] = BinToBCD(dateTime->day) & 0x3F;
	ldw	y, (0x12, sp)
	addw	y, #0x0003
	ldw	x, (0x10, sp)
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
	and	a, #0x3f
	ld	(y), a
;	user/RTC_pcf8563.c: 372: buffer[4] = BinToBCD(dateTime->weekday) & 0x07;
	ldw	y, (0x12, sp)
	addw	y, #0x0004
	ldw	x, (0x18, sp)
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
	ld	(0x0e, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x0e, sp)
	and	a, #0x07
	ld	(y), a
;	user/RTC_pcf8563.c: 373: buffer[5] = BinToBCD(dateTime->month) & 0x1F;
	ldw	x, (0x12, sp)
	addw	x, #0x0005
	ldw	(0x0c, sp), x
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
	ld	(0x0b, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x0b, sp)
	and	a, #0x1f
	ldw	x, (0x0c, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 375: if (dateTime->year >= 2000)
	ldw	x, (0x22, sp)
	ldw	x, (x)
	ldw	(0x09, sp), x
;	user/RTC_pcf8563.c: 378: buffer[6] = BinToBCD(dateTime->year - 2000);
	ldw	x, (0x12, sp)
	addw	x, #0x0006
	ldw	(0x25, sp), x
;	user/RTC_pcf8563.c: 375: if (dateTime->year >= 2000)
	ldw	x, (0x09, sp)
	cpw	x, #0x07d0
	jrc	00111$
;	user/RTC_pcf8563.c: 377: buffer[5] |= 0x80;
	ldw	x, (0x0c, sp)
	ld	a, (x)
	or	a, #0x80
	ldw	x, (0x0c, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 378: buffer[6] = BinToBCD(dateTime->year - 2000);
	ldw	x, (0x22, sp)
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
	ldw	x, (0x25, sp)
	ld	(x), a
	jra	00112$
00111$:
;	user/RTC_pcf8563.c: 382: buffer[6] = BinToBCD(dateTime->year - 1900);
	ldw	x, (0x09, sp)
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
	ld	(0x24, sp), a
	exg	a, yl
	add	a, (0x24, sp)
	ldw	x, (0x25, sp)
	ld	(x), a
00112$:
;	user/RTC_pcf8563.c: 385: PCF_Write(0x02, buffer, sizeof(buffer));
	ldw	x, (0x12, sp)
	push	#0x07
	pushw	x
	push	#0x02
	call	_PCF_Write
	addw	sp, #4
;	user/RTC_pcf8563.c: 387: return 0;
	clr	a
00113$:
	addw	sp, #38
	ret
;	user/RTC_pcf8563.c: 417: uint8_t PCF_setAlarm(PCF_Alarm *alarm)
;	-----------------------------------------
;	 function PCF_setAlarm
;	-----------------------------------------
_PCF_setAlarm:
	sub	sp, #19
;	user/RTC_pcf8563.c: 420: if ((alarm->minute >= 60 && alarm->minute != 80) || (alarm->hour >= 24 && alarm->hour != 80) || (alarm->day > 32 && alarm->day != 80) || (alarm->weekday > 6 && alarm->weekday != 80))
	ldw	y, (0x16, sp)
	ldw	(0x0e, sp), y
	ldw	x, (0x0e, sp)
	ld	a, (x)
	ld	(0x12, sp), a
	ld	a, (0x12, sp)
	cp	a, #0x3c
	jrc	00105$
	ld	a, (0x12, sp)
	cp	a, #0x50
	jrne	00101$
00105$:
	ldw	y, (0x0e, sp)
	incw	y
	ld	a, (y)
	cp	a, #0x18
	jrc	00107$
	cp	a, #0x50
	jrne	00101$
00107$:
	ldw	x, (0x0e, sp)
	incw	x
	incw	x
	ldw	(0x0c, sp), x
	ldw	x, (0x0c, sp)
	ld	a, (x)
	cp	a, #0x20
	jrule	00109$
	cp	a, #0x50
	jrne	00101$
00109$:
	ldw	x, (0x0e, sp)
	addw	x, #0x0003
	ldw	(0x10, sp), x
	ldw	x, (0x10, sp)
	ld	a, (x)
	cp	a, #0x06
	jrule	00102$
	cp	a, #0x50
	jreq	00102$
00101$:
;	user/RTC_pcf8563.c: 422: return 1;
	ld	a, #0x01
	jp	00110$
00102$:
;	user/RTC_pcf8563.c: 425: buffer[0] = BinToBCD(alarm->minute) & 0xFF;
	ldw	x, sp
	incw	x
	ldw	(0x06, sp), x
	clrw	x
	ld	a, (0x12, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	swap	a
	and	a, #0xf0
	ld	(0x0b, sp), a
	clrw	x
	ld	a, (0x12, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x0b, sp)
	ldw	x, (0x06, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 426: buffer[1] = BinToBCD(alarm->hour) & 0xBF;
	ldw	x, (0x06, sp)
	incw	x
	ldw	(0x09, sp), x
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
	ld	(0x13, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x13, sp)
	and	a, #0xbf
	ldw	x, (0x09, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 427: buffer[2] = BinToBCD(alarm->day) & 0xBF;
	ldw	y, (0x06, sp)
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
	ld	(0x08, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x08, sp)
	and	a, #0xbf
	ld	(y), a
;	user/RTC_pcf8563.c: 428: buffer[3] = BinToBCD(alarm->weekday) & 0x87;
	ldw	y, (0x06, sp)
	addw	y, #0x0003
	ldw	x, (0x10, sp)
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
	ld	(0x05, sp), a
	clr	a
	ld	xh, a
	ld	a, #0x0a
	div	x, a
	add	a, (0x05, sp)
	and	a, #0x87
	ld	(y), a
;	user/RTC_pcf8563.c: 430: PCF_Write(0x09, buffer, sizeof(buffer));
	ldw	x, (0x06, sp)
	push	#0x04
	pushw	x
	push	#0x09
	call	_PCF_Write
	addw	sp, #4
;	user/RTC_pcf8563.c: 432: return 0;
	clr	a
00110$:
	addw	sp, #19
	ret
;	user/RTC_pcf8563.c: 435: void PCF_setTimer(uint8_t mode, uint8_t count)
;	-----------------------------------------
;	 function PCF_setTimer
;	-----------------------------------------
_PCF_setTimer:
;	user/RTC_pcf8563.c: 437: mode &= 0x13;
	ld	a, (0x03, sp)
	and	a, #0x13
	ld	(0x03, sp), a
;	user/RTC_pcf8563.c: 438: PCF_Write(0x0E, &mode, 1);				//Timer_control
	ldw	x, sp
	addw	x, #3
	push	#0x01
	pushw	x
	push	#0x0e
	call	_PCF_Write
	addw	sp, #4
;	user/RTC_pcf8563.c: 440: PCF_Write(0x0F, &count, 1);				//Timer
	ldw	x, sp
	addw	x, #4
	push	#0x01
	pushw	x
	push	#0x0f
	call	_PCF_Write
	addw	sp, #4
	ret
;	user/RTC_pcf8563.c: 443: uint8_t PCF_getTimer()
;	-----------------------------------------
;	 function PCF_getTimer
;	-----------------------------------------
_PCF_getTimer:
	push	a
;	user/RTC_pcf8563.c: 446: PCF_Read(0x0F, &count, 1);				//Timer
	ldw	x, sp
	incw	x
	push	#0x01
	pushw	x
	push	#0x0f
	call	_PCF_Read
	addw	sp, #4
;	user/RTC_pcf8563.c: 448: return count;
	ld	a, (0x01, sp)
	addw	sp, #1
	ret
;	user/RTC_pcf8563.c: 451: uint8_t PCF_getAlarm(PCF_Alarm *alarm)
;	-----------------------------------------
;	 function PCF_getAlarm
;	-----------------------------------------
_PCF_getAlarm:
	sub	sp, #15
;	user/RTC_pcf8563.c: 455: PCF_Read(0x09, buffer, sizeof(buffer));
	ldw	x, sp
	incw	x
	ldw	(0x08, sp), x
	ldw	x, (0x08, sp)
	push	#0x04
	pushw	x
	push	#0x09
	call	_PCF_Read
	addw	sp, #4
;	user/RTC_pcf8563.c: 457: alarm->minute = (((buffer[0] >> 4) & 0x0F) * 10) + (buffer[0] & 0x0F);
	ldw	y, (0x12, sp)
	ldw	(0x0b, sp), y
	ldw	x, (0x08, sp)
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
	ld	(0x07, sp), a
	ld	a, xl
	add	a, (0x07, sp)
	ldw	x, (0x0b, sp)
	ld	(x), a
;	user/RTC_pcf8563.c: 458: alarm->hour = (((buffer[1] >> 4) & 0x0B) * 10) + (buffer[1] & 0x0F);
	ldw	y, (0x0b, sp)
	incw	y
	ldw	x, (0x08, sp)
	ld	a, (0x1, x)
	ld	(0x05, sp), a
	ld	a, (0x05, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x0b
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x05, sp)
	and	a, #0x0f
	ld	(0x0f, sp), a
	ld	a, xl
	add	a, (0x0f, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 459: alarm->day = (((buffer[2] >> 4) & 0x0B) * 10) + (buffer[2] & 0x0F);
	ldw	y, (0x0b, sp)
	addw	y, #0x0002
	ldw	x, (0x08, sp)
	ld	a, (0x2, x)
	ld	(0x0a, sp), a
	ld	a, (0x0a, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x0b
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x0a, sp)
	and	a, #0x0f
	ld	(0x0e, sp), a
	ld	a, xl
	add	a, (0x0e, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 460: alarm->weekday = (((buffer[3] >> 4) & 0x08) * 10) + (buffer[3] & 0x07);
	ldw	y, (0x0b, sp)
	addw	y, #0x0003
	ldw	x, (0x08, sp)
	ld	a, (0x3, x)
	ld	(0x06, sp), a
	ld	a, (0x06, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x08
	ld	xl, a
	ld	a, #0x0a
	mul	x, a
	ld	a, (0x06, sp)
	and	a, #0x07
	ld	(0x0d, sp), a
	ld	a, xl
	add	a, (0x0d, sp)
	ld	(y), a
;	user/RTC_pcf8563.c: 462: return 0;
	clr	a
	addw	sp, #15
	ret
;	user/RTC_pcf8563.c: 465: uint8_t PCF_getAndClearFlags()
;	-----------------------------------------
;	 function PCF_getAndClearFlags
;	-----------------------------------------
_PCF_getAndClearFlags:
	pushw	x
;	user/RTC_pcf8563.c: 469: PCF_Read(0x01, &flags, 1);				//Control_status_2
	ldw	x, sp
	incw	x
	incw	x
	push	#0x01
	pushw	x
	push	#0x01
	call	_PCF_Read
	addw	sp, #4
;	user/RTC_pcf8563.c: 470: cleared = flags & 0x13;
	ld	a, (0x02, sp)
	and	a, #0x13
	ld	(0x01, sp), a
;	user/RTC_pcf8563.c: 471: PCF_Write(0x01, &cleared, 1);			//Control_status_2
	ldw	x, sp
	incw	x
	push	#0x01
	pushw	x
	push	#0x01
	call	_PCF_Write
	addw	sp, #4
;	user/RTC_pcf8563.c: 473: return flags & 0x0C;					//Mask unnecessary bits
	ld	a, (0x02, sp)
	and	a, #0x0c
	popw	x
	ret
;	user/RTC_pcf8563.c: 476: void PCF_setClockOut(uint8_t mode)
;	-----------------------------------------
;	 function PCF_setClockOut
;	-----------------------------------------
_PCF_setClockOut:
;	user/RTC_pcf8563.c: 478: mode &= 0x13;
	ld	a, (0x03, sp)
	and	a, #0x13
	ld	(0x03, sp), a
;	user/RTC_pcf8563.c: 479: PCF_Write(0x0D, &mode, 1);				//CLKOUT_control
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
__xinit__timeout:
	.byte #0x00,#0x00,#0xa0,#0x00	; 40960
	.area CABS (ABS)
