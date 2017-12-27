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
	.globl _clock_setup
	.globl _PCF_getDateTime
	.globl _PCF_setDateTime
	.globl _PCF_setClockOut
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
	.globl _CLK_GetFlagStatus
	.globl _CLK_SYSCLKConfig
	.globl _CLK_HSIPrescalerConfig
	.globl _CLK_ClockSwitchConfig
	.globl _CLK_PeripheralClockConfig
	.globl _CLK_ClockSwitchCmd
	.globl _CLK_LSICmd
	.globl _CLK_HSICmd
	.globl _CLK_HSECmd
	.globl _CLK_DeInit
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
;	user/main.c: 27: void clock_setup(void)
;	-----------------------------------------
;	 function clock_setup
;	-----------------------------------------
_clock_setup:
;	user/main.c: 29: CLK_DeInit();
	call	_CLK_DeInit
;	user/main.c: 30: CLK_HSECmd(DISABLE);
	push	#0x00
	call	_CLK_HSECmd
	pop	a
;	user/main.c: 31: CLK_LSICmd(DISABLE);
	push	#0x00
	call	_CLK_LSICmd
	pop	a
;	user/main.c: 32: CLK_HSICmd(ENABLE);
	push	#0x01
	call	_CLK_HSICmd
	pop	a
;	user/main.c: 33: while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
00101$:
	push	#0x02
	push	#0x01
	call	_CLK_GetFlagStatus
	popw	x
	tnz	a
	jreq	00101$
;	user/main.c: 34: CLK_ClockSwitchCmd(ENABLE);
	push	#0x01
	call	_CLK_ClockSwitchCmd
	pop	a
;	user/main.c: 35: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	push	#0x00
	call	_CLK_HSIPrescalerConfig
	pop	a
;	user/main.c: 36: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
	push	#0x81
	call	_CLK_SYSCLKConfig
	pop	a
;	user/main.c: 37: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	push	#0x01
	push	#0x00
	push	#0xe1
	push	#0x01
	call	_CLK_ClockSwitchConfig
	addw	sp, #4
;	user/main.c: 38: CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	push	#0x00
	push	#0x01
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 39: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	push	#0x01
	push	#0x00
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 40: CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	push	#0x00
	push	#0x13
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 41: CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	push	#0x00
	push	#0x12
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 42: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	push	#0x00
	push	#0x03
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 43: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	push	#0x00
	push	#0x07
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 44: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	push	#0x00
	push	#0x05
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 45: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
	push	#0x01
	push	#0x04
	call	_CLK_PeripheralClockConfig
	popw	x
	ret
;	user/main.c: 48: static void GPIO_Config(void)
;	-----------------------------------------
;	 function GPIO_Config
;	-----------------------------------------
_GPIO_Config:
;	user/main.c: 50: GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT);
	push	#0x40
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/main.c: 51: GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);
	push	#0x40
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
	ret
;	user/main.c: 54: void delay(uint16_t x)
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	pushw	x
;	user/main.c: 56: while(x--);
	ldw	x, (0x05, sp)
00101$:
	ldw	(0x01, sp), x
	decw	x
	ldw	y, (0x01, sp)
	jrne	00101$
	popw	x
	ret
;	user/main.c: 59: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
	div	x, a
;	user/main.c: 61: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	push	#0x01
	call	_TIM4_ClearITPendingBit
	pop	a
;	user/main.c: 62: TIMER_Inc();
	call	_TIMER_Inc
;	user/main.c: 63: IWDG_ReloadCounter();
	call	_IWDG_ReloadCounter
	iret
;	user/main.c: 66: void IWDG_Config(void)
;	-----------------------------------------
;	 function IWDG_Config
;	-----------------------------------------
_IWDG_Config:
;	user/main.c: 70: IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
	push	#0x55
	call	_IWDG_WriteAccessCmd
	pop	a
;	user/main.c: 72: IWDG_SetPrescaler(IWDG_Prescaler_256);
	push	#0x06
	call	_IWDG_SetPrescaler
	pop	a
;	user/main.c: 76: IWDG_SetReload(250);
	push	#0xfa
	call	_IWDG_SetReload
	pop	a
;	user/main.c: 78: IWDG_ReloadCounter();
	call	_IWDG_ReloadCounter
;	user/main.c: 80: IWDG_Enable();
	jp	_IWDG_Enable
;	user/main.c: 83: void main() 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #22
;	user/main.c: 87: dateTimeSet.second = 0;
	ldw	x, sp
	incw	x
	clr	(x)
;	user/main.c: 88: dateTimeSet.minute = 25;
	ldw	x, sp
	incw	x
	ldw	(0x15, sp), x
	ldw	x, (0x15, sp)
	incw	x
	ld	a, #0x19
	ld	(x), a
;	user/main.c: 89: dateTimeSet.hour = 16;
	ldw	x, (0x15, sp)
	incw	x
	incw	x
	ld	a, #0x10
	ld	(x), a
;	user/main.c: 90: dateTimeSet.day = 27;
	ldw	x, (0x15, sp)
	ld	a, #0x1b
	ld	(0x0003, x), a
;	user/main.c: 91: dateTimeSet.weekday = 4;
	ldw	x, (0x15, sp)
	ld	a, #0x04
	ld	(0x0004, x), a
;	user/main.c: 92: dateTimeSet.month = 12;
	ldw	x, (0x15, sp)
	ld	a, #0x0c
	ld	(0x0005, x), a
;	user/main.c: 93: dateTimeSet.year = 2017;
	ldw	x, (0x15, sp)
	addw	x, #0x0006
	ldw	y, #0x07e1
	ldw	(x), y
;	user/main.c: 94: clock_setup();
	call	_clock_setup
;	user/main.c: 95: GPIO_Config();
	call	_GPIO_Config
;	user/main.c: 96: PCF_Init(PCF_ALARM_INTERRUPT_ENABLE | PCF_TIMER_INTERRUPT_ENABLE);
	push	#0x03
	call	_PCF_Init
	pop	a
;	user/main.c: 97: max7Seg(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 8);
	push	#0x08
	push	#0x20
	push	#0x10
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_max7Seg
	addw	sp, #6
;	user/main.c: 98: Init();
	call	_Init
;	user/main.c: 99: TIMER_Init();
	call	_TIMER_Init
;	user/main.c: 100: PCF_setClockOut(PCF_CLKOUT_1HZ);
	push	#0x13
	call	_PCF_setClockOut
	pop	a
;	user/main.c: 101: delay(50);
	push	#0x32
	push	#0x00
	call	_delay
	popw	x
;	user/main.c: 102: PCF_setDateTime(&dateTimeSet);
	ldw	x, (0x15, sp)
	pushw	x
	call	_PCF_setDateTime
	popw	x
;	user/main.c: 103: delay(50);
	push	#0x32
	push	#0x00
	call	_delay
	popw	x
;	user/main.c: 104: IWDG_Config();
	call	_IWDG_Config
;	user/main.c: 105: enableInterrupts();
	rim
;	user/main.c: 106: setIntensity(0x0F);
	push	#0x0f
	call	_setIntensity
	pop	a
;	user/main.c: 107: TIMER_InitTime(&tick);
	ldw	x, #_tick+0
	ldw	(0x11, sp), x
	ldw	x, (0x11, sp)
	pushw	x
	call	_TIMER_InitTime
	popw	x
;	user/main.c: 108: send7Seg(DIG7, 0);
	push	#0x00
	push	#0x08
	call	_send7Seg
	popw	x
;	user/main.c: 109: send7Seg(DIG6, 0);
	push	#0x00
	push	#0x07
	call	_send7Seg
	popw	x
;	user/main.c: 110: send7Seg(DIG5, 10);
	push	#0x0a
	push	#0x06
	call	_send7Seg
	popw	x
;	user/main.c: 111: send7Seg(DIG4, 0);
	push	#0x00
	push	#0x05
	call	_send7Seg
	popw	x
;	user/main.c: 112: send7Seg(DIG3, 0);
	push	#0x00
	push	#0x04
	call	_send7Seg
	popw	x
;	user/main.c: 113: send7Seg(DIG2, 10);
	push	#0x0a
	push	#0x03
	call	_send7Seg
	popw	x
;	user/main.c: 114: send7Seg(DIG1, 0);
	push	#0x00
	push	#0x02
	call	_send7Seg
	popw	x
;	user/main.c: 115: send7Seg(DIG0, 0);
	push	#0x00
	push	#0x01
	call	_send7Seg
	popw	x
;	user/main.c: 116: while(TRUE) 
00104$:
;	user/main.c: 118: if(TIMER_CheckTimeMS(&tick, 100) == 0)
	ldw	y, (0x11, sp)
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	pushw	y
	call	_TIMER_CheckTimeMS
	addw	sp, #6
	tnz	a
	jrne	00104$
;	user/main.c: 120: PCF_getDateTime(&dateTimeGet);  
	ldw	x, sp
	addw	x, #9
	ldw	(0x13, sp), x
	ldw	x, (0x13, sp)
	pushw	x
	call	_PCF_getDateTime
	popw	x
;	user/main.c: 121: send7Seg(DIG0, dateTimeGet.second%10);
	ldw	x, (0x13, sp)
	ld	a, (x)
	clrw	x
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	push	a
	push	#0x01
	call	_send7Seg
	popw	x
;	user/main.c: 122: send7Seg(DIG1, dateTimeGet.second/10);
	ldw	x, (0x13, sp)
	ld	a, (x)
	clrw	x
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	push	a
	push	#0x02
	call	_send7Seg
	popw	x
;	user/main.c: 123: send7Seg(DIG3, dateTimeGet.minute%10);
	ldw	x, (0x13, sp)
	incw	x
	ld	a, (x)
	pushw	x
	clrw	x
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	push	a
	push	#0x04
	call	_send7Seg
	popw	x
	popw	x
;	user/main.c: 124: send7Seg(DIG4, dateTimeGet.minute/10);
	ld	a, (x)
	clrw	x
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	push	a
	push	#0x05
	call	_send7Seg
	popw	x
;	user/main.c: 125: send7Seg(DIG6, dateTimeGet.hour%10);
	ldw	x, (0x13, sp)
	incw	x
	incw	x
	ld	a, (x)
	pushw	x
	clrw	x
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	push	a
	push	#0x07
	call	_send7Seg
	popw	x
	popw	x
;	user/main.c: 126: send7Seg(DIG7, dateTimeGet.hour/10);
	ld	a, (x)
	clrw	x
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	push	a
	push	#0x08
	call	_send7Seg
	popw	x
;	user/main.c: 127: IWDG_ReloadCounter();
	call	_IWDG_ReloadCounter
	jp	00104$
	addw	sp, #22
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
