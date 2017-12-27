;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module stm8s_i2c
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _I2C_DeInit
	.globl _I2C_Init
	.globl _I2C_Cmd
	.globl _I2C_GeneralCallCmd
	.globl _I2C_GenerateSTART
	.globl _I2C_GenerateSTOP
	.globl _I2C_SoftwareResetCmd
	.globl _I2C_StretchClockCmd
	.globl _I2C_AcknowledgeConfig
	.globl _I2C_ITConfig
	.globl _I2C_FastModeDutyCycleConfig
	.globl _I2C_ReceiveData
	.globl _I2C_Send7bitAddress
	.globl _I2C_SendData
	.globl _I2C_CheckEvent
	.globl _I2C_GetLastEvent
	.globl _I2C_GetFlagStatus
	.globl _I2C_ClearFlag
	.globl _I2C_GetITStatus
	.globl _I2C_ClearITPendingBit
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
;	lib/stm8s_i2c.c: 41: void I2C_DeInit(void)
;	-----------------------------------------
;	 function I2C_DeInit
;	-----------------------------------------
_I2C_DeInit:
;	lib/stm8s_i2c.c: 43: I2C->CR1 = I2C_CR1_RESET_VALUE;
	mov	0x5210+0, #0x00
;	lib/stm8s_i2c.c: 44: I2C->CR2 = I2C_CR2_RESET_VALUE;
	mov	0x5211+0, #0x00
;	lib/stm8s_i2c.c: 45: I2C->FREQR = I2C_FREQR_RESET_VALUE;
	mov	0x5212+0, #0x00
;	lib/stm8s_i2c.c: 46: I2C->OARL = I2C_OARL_RESET_VALUE;
	mov	0x5213+0, #0x00
;	lib/stm8s_i2c.c: 47: I2C->OARH = I2C_OARH_RESET_VALUE;
	mov	0x5214+0, #0x00
;	lib/stm8s_i2c.c: 48: I2C->ITR = I2C_ITR_RESET_VALUE;
	mov	0x521a+0, #0x00
;	lib/stm8s_i2c.c: 49: I2C->CCRL = I2C_CCRL_RESET_VALUE;
	mov	0x521b+0, #0x00
;	lib/stm8s_i2c.c: 50: I2C->CCRH = I2C_CCRH_RESET_VALUE;
	mov	0x521c+0, #0x00
;	lib/stm8s_i2c.c: 51: I2C->TRISER = I2C_TRISER_RESET_VALUE;
	mov	0x521d+0, #0x02
	ret
;	lib/stm8s_i2c.c: 70: void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
;	-----------------------------------------
;	 function I2C_Init
;	-----------------------------------------
_I2C_Init:
	sub	sp, #10
;	lib/stm8s_i2c.c: 76: uint8_t tmpccrh = 0;
	clr	(0x03, sp)
;	lib/stm8s_i2c.c: 82: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
	ldw	x, #0x5212
	ld	a, (x)
	and	a, #0xc0
	ld	(x), a
;	lib/stm8s_i2c.c: 84: I2C->FREQR |= InputClockFrequencyMHz;
	ldw	x, #0x5212
	ld	a, (x)
	or	a, (0x16, sp)
	ldw	x, #0x5212
	ld	(x), a
;	lib/stm8s_i2c.c: 88: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
	bres	0x5210, #0
;	lib/stm8s_i2c.c: 91: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
	ldw	x, #0x521c
	ld	a, (x)
	and	a, #0x30
	ld	(x), a
;	lib/stm8s_i2c.c: 92: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
	ldw	x, #0x521b
	ld	a, (x)
	mov	0x521b+0, #0x00
;	lib/stm8s_i2c.c: 103: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
	clrw	x
	ld	a, (0x16, sp)
	ld	xl, a
	clrw	y
	pushw	x
	pushw	y
	push	#0x40
	push	#0x42
	push	#0x0f
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x06, sp), x
	ldw	(0x04, sp), y
;	lib/stm8s_i2c.c: 95: if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
	ldw	x, #0x86a0
	cpw	x, (0x0f, sp)
	ld	a, #0x01
	sbc	a, (0x0e, sp)
	clr	a
	sbc	a, (0x0d, sp)
	jrnc	00109$
;	lib/stm8s_i2c.c: 98: tmpccrh = I2C_CCRH_FS;
	ld	a, #0x80
	ld	(0x03, sp), a
;	lib/stm8s_i2c.c: 100: if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
	tnz	(0x13, sp)
	jrne	00102$
;	lib/stm8s_i2c.c: 103: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
	ldw	x, (0x0f, sp)
	pushw	x
	ldw	x, (0x0f, sp)
	pushw	x
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x01, sp), x
	jra	00103$
00102$:
;	lib/stm8s_i2c.c: 108: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
	ldw	x, (0x0f, sp)
	pushw	x
	ldw	x, (0x0f, sp)
	pushw	x
	push	#0x19
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ld	a, xl
	push	a
	ld	a, xh
	push	a
	pushw	y
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x01, sp), x
;	lib/stm8s_i2c.c: 110: tmpccrh |= I2C_CCRH_DUTY;
	ld	a, #0xc0
	ld	(0x03, sp), a
00103$:
;	lib/stm8s_i2c.c: 114: if (result < (uint16_t)0x01)
	ldw	x, (0x01, sp)
	cpw	x, #0x0001
	jrnc	00105$
;	lib/stm8s_i2c.c: 117: result = (uint16_t)0x0001;
	ldw	x, #0x0001
	ldw	(0x01, sp), x
00105$:
;	lib/stm8s_i2c.c: 123: tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
	ld	a, (0x16, sp)
	ld	xl, a
	ld	a, #0x03
	mul	x, a
	push	#0x0a
	push	#0x00
	pushw	x
	call	__divsint
	addw	sp, #4
	incw	x
	ld	a, xl
;	lib/stm8s_i2c.c: 124: I2C->TRISER = (uint8_t)tmpval;
	ldw	x, #0x521d
	ld	(x), a
	jra	00110$
00109$:
;	lib/stm8s_i2c.c: 131: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
	ldw	x, (0x0f, sp)
	ldw	y, (0x0d, sp)
	sllw	x
	rlcw	y
	pushw	x
	pushw	y
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x01, sp), x
;	lib/stm8s_i2c.c: 134: if (result < (uint16_t)0x0004)
	ldw	x, (0x01, sp)
	cpw	x, #0x0004
	jrnc	00107$
;	lib/stm8s_i2c.c: 137: result = (uint16_t)0x0004;
	ldw	x, #0x0004
	ldw	(0x01, sp), x
00107$:
;	lib/stm8s_i2c.c: 143: I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
	ld	a, (0x16, sp)
	inc	a
	ldw	x, #0x521d
	ld	(x), a
00110$:
;	lib/stm8s_i2c.c: 148: I2C->CCRL = (uint8_t)result;
	ld	a, (0x02, sp)
	ldw	x, #0x521b
	ld	(x), a
;	lib/stm8s_i2c.c: 149: I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
	ld	a, (0x01, sp)
	clr	(0x09, sp)
	and	a, #0x0f
	or	a, (0x03, sp)
	ldw	x, #0x521c
	ld	(x), a
;	lib/stm8s_i2c.c: 152: I2C->CR1 |= I2C_CR1_PE;
	bset	0x5210, #0
;	lib/stm8s_i2c.c: 155: I2C_AcknowledgeConfig(Ack);
	ld	a, (0x14, sp)
	push	a
	call	_I2C_AcknowledgeConfig
	pop	a
;	lib/stm8s_i2c.c: 158: I2C->OARL = (uint8_t)(OwnAddress);
	ld	a, (0x12, sp)
	ldw	x, #0x5213
	ld	(x), a
;	lib/stm8s_i2c.c: 159: I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
	ld	a, (0x15, sp)
	or	a, #0x40
	ld	(0x08, sp), a
;	lib/stm8s_i2c.c: 160: (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
	clr	a
	ld	xl, a
	ld	a, (0x11, sp)
	and	a, #0x03
	ld	xh, a
	ld	a, #0x80
	div	x, a
	ld	a, xl
	or	a, (0x08, sp)
	ldw	x, #0x5214
	ld	(x), a
	addw	sp, #10
	ret
;	lib/stm8s_i2c.c: 169: void I2C_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_Cmd
;	-----------------------------------------
_I2C_Cmd:
;	lib/stm8s_i2c.c: 171: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_i2c.c: 174: I2C->CR1 |= I2C_CR1_PE;
	bset	0x5210, #0
	ret
00102$:
;	lib/stm8s_i2c.c: 179: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
	bres	0x5210, #0
	ret
;	lib/stm8s_i2c.c: 189: void I2C_GeneralCallCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_GeneralCallCmd
;	-----------------------------------------
_I2C_GeneralCallCmd:
;	lib/stm8s_i2c.c: 191: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_i2c.c: 194: I2C->CR1 |= I2C_CR1_ENGC;
	ldw	x, #0x5210
	ld	a, (x)
	or	a, #0x40
	ld	(x), a
	ret
00102$:
;	lib/stm8s_i2c.c: 199: I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
	ldw	x, #0x5210
	ld	a, (x)
	and	a, #0xbf
	ld	(x), a
	ret
;	lib/stm8s_i2c.c: 211: void I2C_GenerateSTART(FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_GenerateSTART
;	-----------------------------------------
_I2C_GenerateSTART:
;	lib/stm8s_i2c.c: 214: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_i2c.c: 217: I2C->CR2 |= I2C_CR2_START;
	bset	0x5211, #0
	ret
00102$:
;	lib/stm8s_i2c.c: 222: I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
	bres	0x5211, #0
	ret
;	lib/stm8s_i2c.c: 232: void I2C_GenerateSTOP(FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_GenerateSTOP
;	-----------------------------------------
_I2C_GenerateSTOP:
;	lib/stm8s_i2c.c: 234: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_i2c.c: 237: I2C->CR2 |= I2C_CR2_STOP;
	ldw	x, #0x5211
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
	ret
00102$:
;	lib/stm8s_i2c.c: 242: I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
	ldw	x, #0x5211
	ld	a, (x)
	and	a, #0xfd
	ld	(x), a
	ret
;	lib/stm8s_i2c.c: 252: void I2C_SoftwareResetCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_SoftwareResetCmd
;	-----------------------------------------
_I2C_SoftwareResetCmd:
;	lib/stm8s_i2c.c: 255: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_i2c.c: 258: I2C->CR2 |= I2C_CR2_SWRST;
	bset	0x5211, #7
	ret
00102$:
;	lib/stm8s_i2c.c: 263: I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
	bres	0x5211, #7
	ret
;	lib/stm8s_i2c.c: 274: void I2C_StretchClockCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_StretchClockCmd
;	-----------------------------------------
_I2C_StretchClockCmd:
;	lib/stm8s_i2c.c: 276: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_i2c.c: 279: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
	bres	0x5210, #7
	ret
00102$:
;	lib/stm8s_i2c.c: 285: I2C->CR1 |= I2C_CR1_NOSTRETCH;
	bset	0x5210, #7
	ret
;	lib/stm8s_i2c.c: 296: void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
;	-----------------------------------------
;	 function I2C_AcknowledgeConfig
;	-----------------------------------------
_I2C_AcknowledgeConfig:
;	lib/stm8s_i2c.c: 298: if (Ack == I2C_ACK_NONE)
	tnz	(0x03, sp)
	jrne	00105$
;	lib/stm8s_i2c.c: 301: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
	ldw	x, #0x5211
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
	ret
00105$:
;	lib/stm8s_i2c.c: 306: I2C->CR2 |= I2C_CR2_ACK;
	ldw	x, #0x5211
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	lib/stm8s_i2c.c: 308: if (Ack == I2C_ACK_CURR)
	ld	a, (0x03, sp)
	cp	a, #0x01
	jrne	00102$
;	lib/stm8s_i2c.c: 311: I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
	ldw	x, #0x5211
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	ret
00102$:
;	lib/stm8s_i2c.c: 316: I2C->CR2 |= I2C_CR2_POS;
	ldw	x, #0x5211
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
	ret
;	lib/stm8s_i2c.c: 329: void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_ITConfig
;	-----------------------------------------
_I2C_ITConfig:
	push	a
;	lib/stm8s_i2c.c: 331: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00102$
;	lib/stm8s_i2c.c: 334: I2C->ITR |= (uint8_t)I2C_IT;
	ldw	x, #0x521a
	ld	a, (x)
	or	a, (0x04, sp)
	ldw	x, #0x521a
	ld	(x), a
	jra	00104$
00102$:
;	lib/stm8s_i2c.c: 339: I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
	ldw	x, #0x521a
	ld	a, (x)
	ld	(0x01, sp), a
	ld	a, (0x04, sp)
	cpl	a
	and	a, (0x01, sp)
	ldw	x, #0x521a
	ld	(x), a
00104$:
	pop	a
	ret
;	lib/stm8s_i2c.c: 349: void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
;	-----------------------------------------
;	 function I2C_FastModeDutyCycleConfig
;	-----------------------------------------
_I2C_FastModeDutyCycleConfig:
;	lib/stm8s_i2c.c: 351: if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
	ld	a, (0x03, sp)
	cp	a, #0x40
	jrne	00102$
;	lib/stm8s_i2c.c: 354: I2C->CCRH |= I2C_CCRH_DUTY;
	ldw	x, #0x521c
	ld	a, (x)
	or	a, #0x40
	ld	(x), a
	ret
00102$:
;	lib/stm8s_i2c.c: 359: I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
	ldw	x, #0x521c
	ld	a, (x)
	and	a, #0xbf
	ld	(x), a
	ret
;	lib/stm8s_i2c.c: 368: uint8_t I2C_ReceiveData(void)
;	-----------------------------------------
;	 function I2C_ReceiveData
;	-----------------------------------------
_I2C_ReceiveData:
;	lib/stm8s_i2c.c: 371: return ((uint8_t)I2C->DR);
	ldw	x, #0x5216
	ld	a, (x)
	ret
;	lib/stm8s_i2c.c: 381: void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
;	-----------------------------------------
;	 function I2C_Send7bitAddress
;	-----------------------------------------
_I2C_Send7bitAddress:
;	lib/stm8s_i2c.c: 384: Address &= (uint8_t)0xFE;
	ld	a, (0x03, sp)
	and	a, #0xfe
	ld	(0x03, sp), a
;	lib/stm8s_i2c.c: 387: I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
	ld	a, (0x03, sp)
	or	a, (0x04, sp)
	ldw	x, #0x5216
	ld	(x), a
	ret
;	lib/stm8s_i2c.c: 395: void I2C_SendData(uint8_t Data)
;	-----------------------------------------
;	 function I2C_SendData
;	-----------------------------------------
_I2C_SendData:
;	lib/stm8s_i2c.c: 398: I2C->DR = Data;
	ldw	x, #0x5216
	ld	a, (0x03, sp)
	ld	(x), a
	ret
;	lib/stm8s_i2c.c: 515: ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
;	-----------------------------------------
;	 function I2C_CheckEvent
;	-----------------------------------------
_I2C_CheckEvent:
	sub	sp, #10
;	lib/stm8s_i2c.c: 517: __IO uint16_t lastevent = 0x00;
	clrw	x
	ldw	(0x01, sp), x
;	lib/stm8s_i2c.c: 522: if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
	ldw	x, (0x0d, sp)
	cpw	x, #0x0004
	jrne	00102$
;	lib/stm8s_i2c.c: 524: lastevent = I2C->SR2 & I2C_SR2_AF;
	ldw	x, #0x5218
	ld	a, (x)
	and	a, #0x04
	clrw	x
	ld	xl, a
	ldw	(0x01, sp), x
	jra	00103$
00102$:
;	lib/stm8s_i2c.c: 528: flag1 = I2C->SR1;
	ldw	x, #0x5217
	ld	a, (x)
;	lib/stm8s_i2c.c: 529: flag2 = I2C->SR3;
	ldw	x, #0x5219
	push	a
	ld	a, (x)
	ld	xl, a
	pop	a
;	lib/stm8s_i2c.c: 530: lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
	clr	(0x03, sp)
	clr	(0x08, sp)
	clr	(0x05, sp)
	or	a, (0x08, sp)
	ld	(0x0a, sp), a
	ld	a, xl
	or	a, (0x05, sp)
	ld	(0x09, sp), a
	ldw	y, (0x09, sp)
	ldw	(0x01, sp), y
00103$:
;	lib/stm8s_i2c.c: 533: if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
	ld	a, (0x02, sp)
	and	a, (0x0e, sp)
	ld	xl, a
	ld	a, (0x01, sp)
	and	a, (0x0d, sp)
	ld	xh, a
	cpw	x, (0x0d, sp)
	jrne	00105$
;	lib/stm8s_i2c.c: 536: status = SUCCESS;
	ld	a, #0x01
;	lib/stm8s_i2c.c: 541: status = ERROR;
	.byte 0x21
00105$:
	clr	a
00106$:
;	lib/stm8s_i2c.c: 545: return status;
	addw	sp, #10
	ret
;	lib/stm8s_i2c.c: 562: I2C_Event_TypeDef I2C_GetLastEvent(void)
;	-----------------------------------------
;	 function I2C_GetLastEvent
;	-----------------------------------------
_I2C_GetLastEvent:
	sub	sp, #4
;	lib/stm8s_i2c.c: 564: __IO uint16_t lastevent = 0;
	clrw	x
	ldw	(0x03, sp), x
;	lib/stm8s_i2c.c: 568: if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
	ldw	x, #0x5218
	ld	a, (x)
	bcp	a, #0x04
	jreq	00102$
;	lib/stm8s_i2c.c: 570: lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
	ldw	x, #0x0004
	ldw	(0x03, sp), x
	jra	00103$
00102$:
;	lib/stm8s_i2c.c: 575: flag1 = I2C->SR1;
	ldw	x, #0x5217
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	(0x01, sp), x
;	lib/stm8s_i2c.c: 576: flag2 = I2C->SR3;
	ldw	x, #0x5219
	ld	a, (x)
	ld	xh, a
	clr	a
;	lib/stm8s_i2c.c: 579: lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
	clr	a
	or	a, (0x02, sp)
	rlwa	x
	or	a, (0x01, sp)
	ld	xh, a
	ldw	(0x03, sp), x
00103$:
;	lib/stm8s_i2c.c: 582: return (I2C_Event_TypeDef)lastevent;
	ldw	x, (0x03, sp)
	addw	sp, #4
	ret
;	lib/stm8s_i2c.c: 613: FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
;	-----------------------------------------
;	 function I2C_GetFlagStatus
;	-----------------------------------------
_I2C_GetFlagStatus:
	pushw	x
;	lib/stm8s_i2c.c: 615: uint8_t tempreg = 0;
	clr	a
	ld	xl, a
;	lib/stm8s_i2c.c: 619: regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
	ld	a, (0x05, sp)
	clr	(0x01, sp)
;	lib/stm8s_i2c.c: 621: switch (regindex)
	cp	a, #0x01
	jreq	00101$
	cp	a, #0x02
	jreq	00102$
	cp	a, #0x03
	jreq	00103$
	jra	00105$
;	lib/stm8s_i2c.c: 624: case 0x01:
00101$:
;	lib/stm8s_i2c.c: 625: tempreg = (uint8_t)I2C->SR1;
	ldw	x, #0x5217
	ld	a, (x)
	ld	xl, a
;	lib/stm8s_i2c.c: 626: break;
	jra	00105$
;	lib/stm8s_i2c.c: 629: case 0x02:
00102$:
;	lib/stm8s_i2c.c: 630: tempreg = (uint8_t)I2C->SR2;
	ldw	x, #0x5218
	ld	a, (x)
	ld	xl, a
;	lib/stm8s_i2c.c: 631: break;
	jra	00105$
;	lib/stm8s_i2c.c: 634: case 0x03:
00103$:
;	lib/stm8s_i2c.c: 635: tempreg = (uint8_t)I2C->SR3;
	ldw	x, #0x5219
	ld	a, (x)
	ld	xl, a
;	lib/stm8s_i2c.c: 640: }
00105$:
;	lib/stm8s_i2c.c: 643: if ((tempreg & (uint8_t)I2C_Flag ) != 0)
	ld	a, (0x06, sp)
	pushw	x
	and	a, (2, sp)
	popw	x
	tnz	a
	jreq	00107$
;	lib/stm8s_i2c.c: 646: bitstatus = SET;
	ld	a, #0x01
;	lib/stm8s_i2c.c: 651: bitstatus = RESET;
	.byte 0x21
00107$:
	clr	a
00108$:
;	lib/stm8s_i2c.c: 654: return bitstatus;
	popw	x
	ret
;	lib/stm8s_i2c.c: 689: void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
;	-----------------------------------------
;	 function I2C_ClearFlag
;	-----------------------------------------
_I2C_ClearFlag:
;	lib/stm8s_i2c.c: 694: flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
	ld	a, (0x04, sp)
	ld	xl, a
	clr	a
;	lib/stm8s_i2c.c: 696: I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
	ld	xh, a
	cplw	x
	ld	a, xl
	ldw	x, #0x5218
	ld	(x), a
	ret
;	lib/stm8s_i2c.c: 719: ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
;	-----------------------------------------
;	 function I2C_GetITStatus
;	-----------------------------------------
_I2C_GetITStatus:
	pushw	x
;	lib/stm8s_i2c.c: 722: __IO uint8_t enablestatus = 0;
	clr	(0x01, sp)
;	lib/stm8s_i2c.c: 725: tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
	clr	a
	ld	a, (0x05, sp)
	and	a, #0x07
	ld	xl, a
	clr	a
	clr	a
	ld	xh, a
;	lib/stm8s_i2c.c: 728: enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
	ldw	y, #0x521a
	ld	a, (y)
	pushw	x
	and	a, (2, sp)
	popw	x
	ld	(0x01, sp), a
;	lib/stm8s_i2c.c: 730: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
	clr	a
	ld	xl, a
	ld	a, (0x05, sp)
	and	a, #0x30
	ld	xh, a
;	lib/stm8s_i2c.c: 733: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
	ld	a, (0x06, sp)
	ld	(0x02, sp), a
;	lib/stm8s_i2c.c: 730: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
	cpw	x, #0x0100
	jrne	00110$
;	lib/stm8s_i2c.c: 733: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
	ldw	x, #0x5217
	ld	a, (x)
	and	a, (0x02, sp)
	tnz	a
	jreq	00102$
	tnz	(0x01, sp)
	jreq	00102$
;	lib/stm8s_i2c.c: 736: bitstatus = SET;
	ld	a, #0x01
	jra	00111$
00102$:
;	lib/stm8s_i2c.c: 741: bitstatus = RESET;
	clr	a
	jra	00111$
00110$:
;	lib/stm8s_i2c.c: 747: if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
	ldw	x, #0x5218
	ld	a, (x)
	and	a, (0x02, sp)
	tnz	a
	jreq	00106$
	tnz	(0x01, sp)
	jreq	00106$
;	lib/stm8s_i2c.c: 750: bitstatus = SET;
	ld	a, #0x01
;	lib/stm8s_i2c.c: 755: bitstatus = RESET;
	.byte 0x21
00106$:
	clr	a
00111$:
;	lib/stm8s_i2c.c: 759: return  bitstatus;
	popw	x
	ret
;	lib/stm8s_i2c.c: 797: void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
;	-----------------------------------------
;	 function I2C_ClearITPendingBit
;	-----------------------------------------
_I2C_ClearITPendingBit:
;	lib/stm8s_i2c.c: 802: flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
	ld	a, (0x04, sp)
	ld	xl, a
	clr	a
;	lib/stm8s_i2c.c: 805: I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
	ld	xh, a
	cplw	x
	ld	a, xl
	ldw	x, #0x5218
	ld	(x), a
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
