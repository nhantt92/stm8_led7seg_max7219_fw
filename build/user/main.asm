;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _TIM4_UPD_OVF_IRQHandler
	.globl _delay
	.globl _PCF_Init
	.globl _TIMER_CheckTimeMS
	.globl _TIMER_InitTime
	.globl _TIMER_Inc
	.globl _TIMER_Init
	.globl _send7Seg
	.globl _setIntensity
	.globl _Init
	.globl _max7Seg
	.globl _TIM4_ClearITPendingBit
	.globl _IWDG_Enable
	.globl _IWDG_ReloadCounter
	.globl _IWDG_SetReload
	.globl _IWDG_SetPrescaler
	.globl _IWDG_WriteAccessCmd
	.globl _GPIO_Init
	.globl _CLK_Config
	.globl _tick
	.globl _IWDG_Config
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_tick::
	.ds 6
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int _TIM4_UPD_OVF_IRQHandler ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	user/main.c: 25: static void GPIO_Config(void)
;	-----------------------------------------
;	 function GPIO_Config
;	-----------------------------------------
_GPIO_Config:
;	user/main.c: 27: GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
	push	#0xb0
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/main.c: 28: GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
	push	#0xb0
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
	ret
;	user/main.c: 31: void delay(uint16_t x)
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	pushw	x
;	user/main.c: 33: while(x--);
	ldw	x, (0x05, sp)
00101$:
	ldw	(0x01, sp), x
	decw	x
	ldw	y, (0x01, sp)
	jrne	00101$
	popw	x
	ret
;	user/main.c: 36: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
	div	x, a
;	user/main.c: 38: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	push	#0x01
	call	_TIM4_ClearITPendingBit
	pop	a
;	user/main.c: 39: TIMER_Inc();
	call	_TIMER_Inc
;	user/main.c: 40: IWDG_ReloadCounter();
	call	_IWDG_ReloadCounter
	iret
;	user/main.c: 43: void IWDG_Config(void)
;	-----------------------------------------
;	 function IWDG_Config
;	-----------------------------------------
_IWDG_Config:
;	user/main.c: 47: IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
	push	#0x55
	call	_IWDG_WriteAccessCmd
	pop	a
;	user/main.c: 49: IWDG_SetPrescaler(IWDG_Prescaler_256);
	push	#0x06
	call	_IWDG_SetPrescaler
	pop	a
;	user/main.c: 53: IWDG_SetReload(250);
	push	#0xfa
	call	_IWDG_SetReload
	pop	a
;	user/main.c: 55: IWDG_ReloadCounter();
	call	_IWDG_ReloadCounter
;	user/main.c: 57: IWDG_Enable();
	jp	_IWDG_Enable
;	user/main.c: 60: void main() 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #23
;	user/main.c: 62: uint8_t hh = 0, mm = 0, ss = 0;
	clr	(0x01, sp)
	clr	(0x02, sp)
	clr	(0x13, sp)
;	user/main.c: 65: dateTime.second = 43;
	ldw	x, sp
	ld	a, #0x2b
	ld	(11, x), a
;	user/main.c: 66: dateTime.minute = 15;
	ldw	x, sp
	addw	x, #11
	ldw	(0x16, sp), x
	ldw	x, (0x16, sp)
	incw	x
	ld	a, #0x0f
	ld	(x), a
;	user/main.c: 67: dateTime.hour = 17;
	ldw	x, (0x16, sp)
	incw	x
	incw	x
	ld	a, #0x11
	ld	(x), a
;	user/main.c: 68: dateTime.day = 21;
	ldw	x, (0x16, sp)
	ld	a, #0x15
	ld	(0x0003, x), a
;	user/main.c: 69: dateTime.weekday = 5;
	ldw	x, (0x16, sp)
	ld	a, #0x05
	ld	(0x0004, x), a
;	user/main.c: 70: dateTime.month = 12;
	ldw	x, (0x16, sp)
	ld	a, #0x0c
	ld	(0x0005, x), a
;	user/main.c: 71: dateTime.year = 2017;
	ldw	x, (0x16, sp)
	addw	x, #0x0006
	ldw	y, #0x07e1
	ldw	(x), y
;	user/main.c: 72: CLK_Config();
	call	_CLK_Config
;	user/main.c: 73: GPIO_Config();
	call	_GPIO_Config
;	user/main.c: 74: PCF_Init(PCF_ALARM_INTERRUPT_ENABLE);
	push	#0x02
	call	_PCF_Init
	pop	a
;	user/main.c: 76: max7Seg(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 8);
	push	#0x08
	push	#0x20
	push	#0x10
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_max7Seg
	addw	sp, #6
;	user/main.c: 77: Init();
	call	_Init
;	user/main.c: 78: TIMER_Init();
	call	_TIMER_Init
;	user/main.c: 81: IWDG_Config();
	call	_IWDG_Config
;	user/main.c: 82: enableInterrupts();
	rim
;	user/main.c: 83: setIntensity(0x03);
	push	#0x03
	call	_setIntensity
	pop	a
;	user/main.c: 84: TIMER_InitTime(&tick);
	ldw	x, #_tick+0
	ldw	(0x14, sp), x
	ldw	x, (0x14, sp)
	pushw	x
	call	_TIMER_InitTime
	popw	x
;	user/main.c: 86: send7Seg(DIG7, 0);
	push	#0x00
	push	#0x08
	call	_send7Seg
	popw	x
;	user/main.c: 87: send7Seg(DIG6, 0);
	push	#0x00
	push	#0x07
	call	_send7Seg
	popw	x
;	user/main.c: 88: send7Seg(DIG5, 10);
	push	#0x0a
	push	#0x06
	call	_send7Seg
	popw	x
;	user/main.c: 89: send7Seg(DIG4, 0);
	push	#0x00
	push	#0x05
	call	_send7Seg
	popw	x
;	user/main.c: 90: send7Seg(DIG3, 0);
	push	#0x00
	push	#0x04
	call	_send7Seg
	popw	x
;	user/main.c: 91: send7Seg(DIG2, 10);
	push	#0x0a
	push	#0x03
	call	_send7Seg
	popw	x
;	user/main.c: 92: send7Seg(DIG1, 0);
	push	#0x00
	push	#0x02
	call	_send7Seg
	popw	x
;	user/main.c: 93: send7Seg(DIG0, 0);
	push	#0x00
	push	#0x01
	call	_send7Seg
	popw	x
;	user/main.c: 94: while(TRUE) 
00110$:
;	user/main.c: 96: if(TIMER_CheckTimeMS(&tick, 1000) == 0)
	ldw	y, (0x14, sp)
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
	pushw	y
	call	_TIMER_CheckTimeMS
	addw	sp, #6
	tnz	a
	jrne	00110$
;	user/main.c: 98: if(++ss >=60)
	inc	(0x13, sp)
	ld	a, (0x13, sp)
	cp	a, #0x3c
	jrc	00106$
;	user/main.c: 100: ss=0;
	clr	(0x13, sp)
;	user/main.c: 101: if(++mm >=60)
	inc	(0x02, sp)
	ld	a, (0x02, sp)
	cp	a, #0x3c
	jrc	00106$
;	user/main.c: 103: mm=0;
	clr	(0x02, sp)
;	user/main.c: 104: if(++hh >= 24)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x18
	jrc	00106$
;	user/main.c: 105: hh = 0;
	clr	(0x01, sp)
00106$:
;	user/main.c: 108: send7Seg(DIG0, ss%10);
	clrw	x
	ld	a, (0x13, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	push	a
	push	#0x01
	call	_send7Seg
	popw	x
;	user/main.c: 109: send7Seg(DIG1, ss/10);
	clrw	x
	ld	a, (0x13, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	push	a
	push	#0x02
	call	_send7Seg
	popw	x
;	user/main.c: 110: send7Seg(DIG3, mm%10);
	clrw	x
	ld	a, (0x02, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	push	a
	push	#0x04
	call	_send7Seg
	popw	x
;	user/main.c: 111: send7Seg(DIG4, mm/10);
	clrw	x
	ld	a, (0x02, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	push	a
	push	#0x05
	call	_send7Seg
	popw	x
;	user/main.c: 112: send7Seg(DIG6, hh%10);
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	push	a
	push	#0x07
	call	_send7Seg
	popw	x
;	user/main.c: 113: send7Seg(DIG7, hh/10);
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	push	a
	push	#0x08
	call	_send7Seg
	popw	x
	jp	00110$
	addw	sp, #23
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
