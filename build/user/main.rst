                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _TIM4_UPD_OVF_IRQHandler
                                     13 	.globl _delay
                                     14 	.globl _clock_setup
                                     15 	.globl _PCF_getDateTime
                                     16 	.globl _PCF_setDateTime
                                     17 	.globl _PCF_setClockOut
                                     18 	.globl _PCF_Init
                                     19 	.globl _TIMER_CheckTimeMS
                                     20 	.globl _TIMER_InitTime
                                     21 	.globl _TIMER_Inc
                                     22 	.globl _TIMER_Init
                                     23 	.globl _send7Seg
                                     24 	.globl _setIntensity
                                     25 	.globl _Init
                                     26 	.globl _max7Seg
                                     27 	.globl _TIM4_ClearITPendingBit
                                     28 	.globl _IWDG_Enable
                                     29 	.globl _IWDG_ReloadCounter
                                     30 	.globl _IWDG_SetReload
                                     31 	.globl _IWDG_SetPrescaler
                                     32 	.globl _IWDG_WriteAccessCmd
                                     33 	.globl _GPIO_Init
                                     34 	.globl _CLK_GetFlagStatus
                                     35 	.globl _CLK_SYSCLKConfig
                                     36 	.globl _CLK_HSIPrescalerConfig
                                     37 	.globl _CLK_ClockSwitchConfig
                                     38 	.globl _CLK_PeripheralClockConfig
                                     39 	.globl _CLK_ClockSwitchCmd
                                     40 	.globl _CLK_LSICmd
                                     41 	.globl _CLK_HSICmd
                                     42 	.globl _CLK_HSECmd
                                     43 	.globl _CLK_DeInit
                                     44 	.globl _tick
                                     45 	.globl _IWDG_Config
                                     46 ;--------------------------------------------------------
                                     47 ; ram data
                                     48 ;--------------------------------------------------------
                                     49 	.area DATA
      000001                         50 _tick::
      000001                         51 	.ds 6
                                     52 ;--------------------------------------------------------
                                     53 ; ram data
                                     54 ;--------------------------------------------------------
                                     55 	.area INITIALIZED
                                     56 ;--------------------------------------------------------
                                     57 ; Stack segment in internal ram 
                                     58 ;--------------------------------------------------------
                                     59 	.area	SSEG
      009922                         60 __start__stack:
      009922                         61 	.ds	1
                                     62 
                                     63 ;--------------------------------------------------------
                                     64 ; absolute external ram data
                                     65 ;--------------------------------------------------------
                                     66 	.area DABS (ABS)
                                     67 ;--------------------------------------------------------
                                     68 ; interrupt vector 
                                     69 ;--------------------------------------------------------
                                     70 	.area HOME
      008000                         71 __interrupt_vect:
      008000 82 00 80 83             72 	int s_GSINIT ;reset
      008004 82 00 00 00             73 	int 0x0000 ;trap
      008008 82 00 00 00             74 	int 0x0000 ;int0
      00800C 82 00 00 00             75 	int 0x0000 ;int1
      008010 82 00 00 00             76 	int 0x0000 ;int2
      008014 82 00 00 00             77 	int 0x0000 ;int3
      008018 82 00 00 00             78 	int 0x0000 ;int4
      00801C 82 00 00 00             79 	int 0x0000 ;int5
      008020 82 00 00 00             80 	int 0x0000 ;int6
      008024 82 00 00 00             81 	int 0x0000 ;int7
      008028 82 00 00 00             82 	int 0x0000 ;int8
      00802C 82 00 00 00             83 	int 0x0000 ;int9
      008030 82 00 00 00             84 	int 0x0000 ;int10
      008034 82 00 00 00             85 	int 0x0000 ;int11
      008038 82 00 00 00             86 	int 0x0000 ;int12
      00803C 82 00 00 00             87 	int 0x0000 ;int13
      008040 82 00 00 00             88 	int 0x0000 ;int14
      008044 82 00 00 00             89 	int 0x0000 ;int15
      008048 82 00 00 00             90 	int 0x0000 ;int16
      00804C 82 00 00 00             91 	int 0x0000 ;int17
      008050 82 00 00 00             92 	int 0x0000 ;int18
      008054 82 00 00 00             93 	int 0x0000 ;int19
      008058 82 00 00 00             94 	int 0x0000 ;int20
      00805C 82 00 00 00             95 	int 0x0000 ;int21
      008060 82 00 00 00             96 	int 0x0000 ;int22
      008064 82 00 8A 50             97 	int _TIM4_UPD_OVF_IRQHandler ;int23
      008068 82 00 00 00             98 	int 0x0000 ;int24
      00806C 82 00 00 00             99 	int 0x0000 ;int25
      008070 82 00 00 00            100 	int 0x0000 ;int26
      008074 82 00 00 00            101 	int 0x0000 ;int27
      008078 82 00 00 00            102 	int 0x0000 ;int28
      00807C 82 00 00 00            103 	int 0x0000 ;int29
                                    104 ;--------------------------------------------------------
                                    105 ; global & static initialisations
                                    106 ;--------------------------------------------------------
                                    107 	.area HOME
                                    108 	.area GSINIT
                                    109 	.area GSFINAL
                                    110 	.area GSINIT
      008083                        111 __sdcc_gs_init_startup:
      008083                        112 __sdcc_init_data:
                                    113 ; stm8_genXINIT() start
      008083 AE 00 1D         [ 2]  114 	ldw x, #l_DATA
      008086 27 07            [ 1]  115 	jreq	00002$
      008088                        116 00001$:
      008088 72 4F 00 00      [ 1]  117 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  118 	decw x
      00808D 26 F9            [ 1]  119 	jrne	00001$
      00808F                        120 00002$:
      00808F AE 00 04         [ 2]  121 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  122 	jreq	00004$
      008094                        123 00003$:
      008094 D6 99 1D         [ 1]  124 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 1D         [ 1]  125 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  126 	decw	x
      00809B 26 F7            [ 1]  127 	jrne	00003$
      00809D                        128 00004$:
                                    129 ; stm8_genXINIT() end
                                    130 	.area GSFINAL
      00809D CC 80 80         [ 2]  131 	jp	__sdcc_program_startup
                                    132 ;--------------------------------------------------------
                                    133 ; Home
                                    134 ;--------------------------------------------------------
                                    135 	.area HOME
                                    136 	.area HOME
      008080                        137 __sdcc_program_startup:
      008080 CC 8A 76         [ 2]  138 	jp	_main
                                    139 ;	return from main will return to caller
                                    140 ;--------------------------------------------------------
                                    141 ; code
                                    142 ;--------------------------------------------------------
                                    143 	.area CODE
                                    144 ;	user/main.c: 27: void clock_setup(void)
                                    145 ;	-----------------------------------------
                                    146 ;	 function clock_setup
                                    147 ;	-----------------------------------------
      0089A9                        148 _clock_setup:
                                    149 ;	user/main.c: 29: CLK_DeInit();
      0089A9 CD 8E 70         [ 4]  150 	call	_CLK_DeInit
                                    151 ;	user/main.c: 30: CLK_HSECmd(DISABLE);
      0089AC 4B 00            [ 1]  152 	push	#0x00
      0089AE CD 8E BC         [ 4]  153 	call	_CLK_HSECmd
      0089B1 84               [ 1]  154 	pop	a
                                    155 ;	user/main.c: 31: CLK_LSICmd(DISABLE);
      0089B2 4B 00            [ 1]  156 	push	#0x00
      0089B4 CD 8E D8         [ 4]  157 	call	_CLK_LSICmd
      0089B7 84               [ 1]  158 	pop	a
                                    159 ;	user/main.c: 32: CLK_HSICmd(ENABLE);
      0089B8 4B 01            [ 1]  160 	push	#0x01
      0089BA CD 8E CA         [ 4]  161 	call	_CLK_HSICmd
      0089BD 84               [ 1]  162 	pop	a
                                    163 ;	user/main.c: 33: while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
      0089BE                        164 00101$:
      0089BE 4B 02            [ 1]  165 	push	#0x02
      0089C0 4B 01            [ 1]  166 	push	#0x01
      0089C2 CD 91 6E         [ 4]  167 	call	_CLK_GetFlagStatus
      0089C5 85               [ 2]  168 	popw	x
      0089C6 4D               [ 1]  169 	tnz	a
      0089C7 27 F5            [ 1]  170 	jreq	00101$
                                    171 ;	user/main.c: 34: CLK_ClockSwitchCmd(ENABLE);
      0089C9 4B 01            [ 1]  172 	push	#0x01
      0089CB CD 8E FA         [ 4]  173 	call	_CLK_ClockSwitchCmd
      0089CE 84               [ 1]  174 	pop	a
                                    175 ;	user/main.c: 35: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
      0089CF 4B 18            [ 1]  176 	push	#0x18
      0089D1 CD 90 3D         [ 4]  177 	call	_CLK_HSIPrescalerConfig
      0089D4 84               [ 1]  178 	pop	a
                                    179 ;	user/main.c: 36: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
      0089D5 4B 81            [ 1]  180 	push	#0x81
      0089D7 CD 90 B4         [ 4]  181 	call	_CLK_SYSCLKConfig
      0089DA 84               [ 1]  182 	pop	a
                                    183 ;	user/main.c: 37: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
      0089DB 4B 01            [ 1]  184 	push	#0x01
      0089DD 4B 00            [ 1]  185 	push	#0x00
      0089DF 4B E1            [ 1]  186 	push	#0xe1
      0089E1 4B 01            [ 1]  187 	push	#0x01
      0089E3 CD 8F 78         [ 4]  188 	call	_CLK_ClockSwitchConfig
      0089E6 5B 04            [ 2]  189 	addw	sp, #4
                                    190 ;	user/main.c: 38: CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
      0089E8 4B 00            [ 1]  191 	push	#0x00
      0089EA 4B 01            [ 1]  192 	push	#0x01
      0089EC CD 8F 22         [ 4]  193 	call	_CLK_PeripheralClockConfig
      0089EF 85               [ 2]  194 	popw	x
                                    195 ;	user/main.c: 39: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
      0089F0 4B 01            [ 1]  196 	push	#0x01
      0089F2 4B 00            [ 1]  197 	push	#0x00
      0089F4 CD 8F 22         [ 4]  198 	call	_CLK_PeripheralClockConfig
      0089F7 85               [ 2]  199 	popw	x
                                    200 ;	user/main.c: 40: CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
      0089F8 4B 00            [ 1]  201 	push	#0x00
      0089FA 4B 13            [ 1]  202 	push	#0x13
      0089FC CD 8F 22         [ 4]  203 	call	_CLK_PeripheralClockConfig
      0089FF 85               [ 2]  204 	popw	x
                                    205 ;	user/main.c: 41: CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
      008A00 4B 00            [ 1]  206 	push	#0x00
      008A02 4B 12            [ 1]  207 	push	#0x12
      008A04 CD 8F 22         [ 4]  208 	call	_CLK_PeripheralClockConfig
      008A07 85               [ 2]  209 	popw	x
                                    210 ;	user/main.c: 42: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
      008A08 4B 00            [ 1]  211 	push	#0x00
      008A0A 4B 03            [ 1]  212 	push	#0x03
      008A0C CD 8F 22         [ 4]  213 	call	_CLK_PeripheralClockConfig
      008A0F 85               [ 2]  214 	popw	x
                                    215 ;	user/main.c: 43: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
      008A10 4B 00            [ 1]  216 	push	#0x00
      008A12 4B 07            [ 1]  217 	push	#0x07
      008A14 CD 8F 22         [ 4]  218 	call	_CLK_PeripheralClockConfig
      008A17 85               [ 2]  219 	popw	x
                                    220 ;	user/main.c: 44: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
      008A18 4B 00            [ 1]  221 	push	#0x00
      008A1A 4B 05            [ 1]  222 	push	#0x05
      008A1C CD 8F 22         [ 4]  223 	call	_CLK_PeripheralClockConfig
      008A1F 85               [ 2]  224 	popw	x
                                    225 ;	user/main.c: 45: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
      008A20 4B 01            [ 1]  226 	push	#0x01
      008A22 4B 04            [ 1]  227 	push	#0x04
      008A24 CD 8F 22         [ 4]  228 	call	_CLK_PeripheralClockConfig
      008A27 85               [ 2]  229 	popw	x
      008A28 81               [ 4]  230 	ret
                                    231 ;	user/main.c: 48: static void GPIO_Config(void)
                                    232 ;	-----------------------------------------
                                    233 ;	 function GPIO_Config
                                    234 ;	-----------------------------------------
      008A29                        235 _GPIO_Config:
                                    236 ;	user/main.c: 50: GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT);
      008A29 4B 40            [ 1]  237 	push	#0x40
      008A2B 4B 10            [ 1]  238 	push	#0x10
      008A2D 4B 05            [ 1]  239 	push	#0x05
      008A2F 4B 50            [ 1]  240 	push	#0x50
      008A31 CD 91 FC         [ 4]  241 	call	_GPIO_Init
      008A34 5B 04            [ 2]  242 	addw	sp, #4
                                    243 ;	user/main.c: 51: GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);
      008A36 4B 40            [ 1]  244 	push	#0x40
      008A38 4B 20            [ 1]  245 	push	#0x20
      008A3A 4B 05            [ 1]  246 	push	#0x05
      008A3C 4B 50            [ 1]  247 	push	#0x50
      008A3E CD 91 FC         [ 4]  248 	call	_GPIO_Init
      008A41 5B 04            [ 2]  249 	addw	sp, #4
      008A43 81               [ 4]  250 	ret
                                    251 ;	user/main.c: 54: void delay(uint16_t x)
                                    252 ;	-----------------------------------------
                                    253 ;	 function delay
                                    254 ;	-----------------------------------------
      008A44                        255 _delay:
      008A44 89               [ 2]  256 	pushw	x
                                    257 ;	user/main.c: 56: while(x--);
      008A45 1E 05            [ 2]  258 	ldw	x, (0x05, sp)
      008A47                        259 00101$:
      008A47 1F 01            [ 2]  260 	ldw	(0x01, sp), x
      008A49 5A               [ 2]  261 	decw	x
      008A4A 16 01            [ 2]  262 	ldw	y, (0x01, sp)
      008A4C 26 F9            [ 1]  263 	jrne	00101$
      008A4E 85               [ 2]  264 	popw	x
      008A4F 81               [ 4]  265 	ret
                                    266 ;	user/main.c: 59: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    267 ;	-----------------------------------------
                                    268 ;	 function TIM4_UPD_OVF_IRQHandler
                                    269 ;	-----------------------------------------
      008A50                        270 _TIM4_UPD_OVF_IRQHandler:
      008A50 62               [ 2]  271 	div	x, a
                                    272 ;	user/main.c: 61: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
      008A51 4B 01            [ 1]  273 	push	#0x01
      008A53 CD 98 0B         [ 4]  274 	call	_TIM4_ClearITPendingBit
      008A56 84               [ 1]  275 	pop	a
                                    276 ;	user/main.c: 62: TIMER_Inc();
      008A57 CD 8D 77         [ 4]  277 	call	_TIMER_Inc
                                    278 ;	user/main.c: 63: IWDG_ReloadCounter();
      008A5A CD 96 34         [ 4]  279 	call	_IWDG_ReloadCounter
      008A5D 80               [11]  280 	iret
                                    281 ;	user/main.c: 66: void IWDG_Config(void)
                                    282 ;	-----------------------------------------
                                    283 ;	 function IWDG_Config
                                    284 ;	-----------------------------------------
      008A5E                        285 _IWDG_Config:
                                    286 ;	user/main.c: 70: IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
      008A5E 4B 55            [ 1]  287 	push	#0x55
      008A60 CD 96 1F         [ 4]  288 	call	_IWDG_WriteAccessCmd
      008A63 84               [ 1]  289 	pop	a
                                    290 ;	user/main.c: 72: IWDG_SetPrescaler(IWDG_Prescaler_256);
      008A64 4B 06            [ 1]  291 	push	#0x06
      008A66 CD 96 26         [ 4]  292 	call	_IWDG_SetPrescaler
      008A69 84               [ 1]  293 	pop	a
                                    294 ;	user/main.c: 76: IWDG_SetReload(250);
      008A6A 4B FA            [ 1]  295 	push	#0xfa
      008A6C CD 96 2D         [ 4]  296 	call	_IWDG_SetReload
      008A6F 84               [ 1]  297 	pop	a
                                    298 ;	user/main.c: 78: IWDG_ReloadCounter();
      008A70 CD 96 34         [ 4]  299 	call	_IWDG_ReloadCounter
                                    300 ;	user/main.c: 80: IWDG_Enable();
      008A73 CC 96 39         [ 2]  301 	jp	_IWDG_Enable
                                    302 ;	user/main.c: 83: void main() 
                                    303 ;	-----------------------------------------
                                    304 ;	 function main
                                    305 ;	-----------------------------------------
      008A76                        306 _main:
      008A76 52 16            [ 2]  307 	sub	sp, #22
                                    308 ;	user/main.c: 88: dateTime.second = 40;
      008A78 96               [ 1]  309 	ldw	x, sp
      008A79 A6 28            [ 1]  310 	ld	a, #0x28
      008A7B E7 09            [ 1]  311 	ld	(9, x), a
                                    312 ;	user/main.c: 89: dateTime.minute = 32;
      008A7D 96               [ 1]  313 	ldw	x, sp
      008A7E 1C 00 09         [ 2]  314 	addw	x, #9
      008A81 1F 11            [ 2]  315 	ldw	(0x11, sp), x
      008A83 1E 11            [ 2]  316 	ldw	x, (0x11, sp)
      008A85 5C               [ 2]  317 	incw	x
      008A86 A6 20            [ 1]  318 	ld	a, #0x20
      008A88 F7               [ 1]  319 	ld	(x), a
                                    320 ;	user/main.c: 90: dateTime.hour = 15;
      008A89 1E 11            [ 2]  321 	ldw	x, (0x11, sp)
      008A8B 5C               [ 2]  322 	incw	x
      008A8C 5C               [ 2]  323 	incw	x
      008A8D A6 0F            [ 1]  324 	ld	a, #0x0f
      008A8F F7               [ 1]  325 	ld	(x), a
                                    326 ;	user/main.c: 91: dateTime.day = 22;
      008A90 1E 11            [ 2]  327 	ldw	x, (0x11, sp)
      008A92 A6 16            [ 1]  328 	ld	a, #0x16
      008A94 E7 03            [ 1]  329 	ld	(0x0003, x), a
                                    330 ;	user/main.c: 92: dateTime.weekday = 6;
      008A96 1E 11            [ 2]  331 	ldw	x, (0x11, sp)
      008A98 A6 06            [ 1]  332 	ld	a, #0x06
      008A9A E7 04            [ 1]  333 	ld	(0x0004, x), a
                                    334 ;	user/main.c: 93: dateTime.month = 12;
      008A9C 1E 11            [ 2]  335 	ldw	x, (0x11, sp)
      008A9E A6 0C            [ 1]  336 	ld	a, #0x0c
      008AA0 E7 05            [ 1]  337 	ld	(0x0005, x), a
                                    338 ;	user/main.c: 94: dateTime.year = 2017;
      008AA2 1E 11            [ 2]  339 	ldw	x, (0x11, sp)
      008AA4 1C 00 06         [ 2]  340 	addw	x, #0x0006
      008AA7 90 AE 07 E1      [ 2]  341 	ldw	y, #0x07e1
      008AAB FF               [ 2]  342 	ldw	(x), y
                                    343 ;	user/main.c: 95: clock_setup();
      008AAC CD 89 A9         [ 4]  344 	call	_clock_setup
                                    345 ;	user/main.c: 96: GPIO_Config();
      008AAF CD 8A 29         [ 4]  346 	call	_GPIO_Config
                                    347 ;	user/main.c: 99: PCF_Init(PCF_ALARM_INTERRUPT_ENABLE | PCF_TIMER_INTERRUPT_ENABLE);
      008AB2 4B 03            [ 1]  348 	push	#0x03
      008AB4 CD 85 FC         [ 4]  349 	call	_PCF_Init
      008AB7 84               [ 1]  350 	pop	a
                                    351 ;	user/main.c: 102: max7Seg(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 8);
      008AB8 4B 08            [ 1]  352 	push	#0x08
      008ABA 4B 20            [ 1]  353 	push	#0x20
      008ABC 4B 10            [ 1]  354 	push	#0x10
      008ABE 4B 40            [ 1]  355 	push	#0x40
      008AC0 4B 0A            [ 1]  356 	push	#0x0a
      008AC2 4B 50            [ 1]  357 	push	#0x50
      008AC4 CD 8B D1         [ 4]  358 	call	_max7Seg
      008AC7 5B 06            [ 2]  359 	addw	sp, #6
                                    360 ;	user/main.c: 103: Init();
      008AC9 CD 8C A5         [ 4]  361 	call	_Init
                                    362 ;	user/main.c: 104: TIMER_Init();
      008ACC CD 8D 44         [ 4]  363 	call	_TIMER_Init
                                    364 ;	user/main.c: 105: PCF_setClockOut(PCF_CLKOUT_1HZ);
      008ACF 4B 13            [ 1]  365 	push	#0x13
      008AD1 CD 89 94         [ 4]  366 	call	_PCF_setClockOut
      008AD4 84               [ 1]  367 	pop	a
                                    368 ;	user/main.c: 106: delay(50);
      008AD5 4B 32            [ 1]  369 	push	#0x32
      008AD7 4B 00            [ 1]  370 	push	#0x00
      008AD9 CD 8A 44         [ 4]  371 	call	_delay
      008ADC 85               [ 2]  372 	popw	x
                                    373 ;	user/main.c: 107: PCF_setDateTime(&dateTime);
      008ADD 1E 11            [ 2]  374 	ldw	x, (0x11, sp)
      008ADF 89               [ 2]  375 	pushw	x
      008AE0 CD 86 23         [ 4]  376 	call	_PCF_setDateTime
      008AE3 85               [ 2]  377 	popw	x
                                    378 ;	user/main.c: 108: delay(50);
      008AE4 4B 32            [ 1]  379 	push	#0x32
      008AE6 4B 00            [ 1]  380 	push	#0x00
      008AE8 CD 8A 44         [ 4]  381 	call	_delay
      008AEB 85               [ 2]  382 	popw	x
                                    383 ;	user/main.c: 109: IWDG_Config();
      008AEC CD 8A 5E         [ 4]  384 	call	_IWDG_Config
                                    385 ;	user/main.c: 110: enableInterrupts();
      008AEF 9A               [ 1]  386 	rim
                                    387 ;	user/main.c: 111: setIntensity(0x03);
      008AF0 4B 03            [ 1]  388 	push	#0x03
      008AF2 CD 8C F6         [ 4]  389 	call	_setIntensity
      008AF5 84               [ 1]  390 	pop	a
                                    391 ;	user/main.c: 112: TIMER_InitTime(&tick);
      008AF6 AE 00 01         [ 2]  392 	ldw	x, #_tick+0
      008AF9 1F 13            [ 2]  393 	ldw	(0x13, sp), x
      008AFB 1E 13            [ 2]  394 	ldw	x, (0x13, sp)
      008AFD 89               [ 2]  395 	pushw	x
      008AFE CD 8D A3         [ 4]  396 	call	_TIMER_InitTime
      008B01 85               [ 2]  397 	popw	x
                                    398 ;	user/main.c: 113: send7Seg(DIG7, 0);
      008B02 4B 00            [ 1]  399 	push	#0x00
      008B04 4B 08            [ 1]  400 	push	#0x08
      008B06 CD 8D 00         [ 4]  401 	call	_send7Seg
      008B09 85               [ 2]  402 	popw	x
                                    403 ;	user/main.c: 114: send7Seg(DIG6, 0);
      008B0A 4B 00            [ 1]  404 	push	#0x00
      008B0C 4B 07            [ 1]  405 	push	#0x07
      008B0E CD 8D 00         [ 4]  406 	call	_send7Seg
      008B11 85               [ 2]  407 	popw	x
                                    408 ;	user/main.c: 115: send7Seg(DIG5, 10);
      008B12 4B 0A            [ 1]  409 	push	#0x0a
      008B14 4B 06            [ 1]  410 	push	#0x06
      008B16 CD 8D 00         [ 4]  411 	call	_send7Seg
      008B19 85               [ 2]  412 	popw	x
                                    413 ;	user/main.c: 116: send7Seg(DIG4, 0);
      008B1A 4B 00            [ 1]  414 	push	#0x00
      008B1C 4B 05            [ 1]  415 	push	#0x05
      008B1E CD 8D 00         [ 4]  416 	call	_send7Seg
      008B21 85               [ 2]  417 	popw	x
                                    418 ;	user/main.c: 117: send7Seg(DIG3, 0);
      008B22 4B 00            [ 1]  419 	push	#0x00
      008B24 4B 04            [ 1]  420 	push	#0x04
      008B26 CD 8D 00         [ 4]  421 	call	_send7Seg
      008B29 85               [ 2]  422 	popw	x
                                    423 ;	user/main.c: 118: send7Seg(DIG2, 10);
      008B2A 4B 0A            [ 1]  424 	push	#0x0a
      008B2C 4B 03            [ 1]  425 	push	#0x03
      008B2E CD 8D 00         [ 4]  426 	call	_send7Seg
      008B31 85               [ 2]  427 	popw	x
                                    428 ;	user/main.c: 119: send7Seg(DIG1, 0);
      008B32 4B 00            [ 1]  429 	push	#0x00
      008B34 4B 02            [ 1]  430 	push	#0x02
      008B36 CD 8D 00         [ 4]  431 	call	_send7Seg
      008B39 85               [ 2]  432 	popw	x
                                    433 ;	user/main.c: 120: send7Seg(DIG0, 0);
      008B3A 4B 00            [ 1]  434 	push	#0x00
      008B3C 4B 01            [ 1]  435 	push	#0x01
      008B3E CD 8D 00         [ 4]  436 	call	_send7Seg
      008B41 85               [ 2]  437 	popw	x
                                    438 ;	user/main.c: 121: while(TRUE) 
      008B42                        439 00104$:
                                    440 ;	user/main.c: 143: if(TIMER_CheckTimeMS(&tick, 50) == 0)
      008B42 16 13            [ 2]  441 	ldw	y, (0x13, sp)
      008B44 4B 32            [ 1]  442 	push	#0x32
      008B46 5F               [ 1]  443 	clrw	x
      008B47 89               [ 2]  444 	pushw	x
      008B48 4B 00            [ 1]  445 	push	#0x00
      008B4A 90 89            [ 2]  446 	pushw	y
      008B4C CD 8D FA         [ 4]  447 	call	_TIMER_CheckTimeMS
      008B4F 5B 06            [ 2]  448 	addw	sp, #6
      008B51 4D               [ 1]  449 	tnz	a
      008B52 26 EE            [ 1]  450 	jrne	00104$
                                    451 ;	user/main.c: 145: PCF_getDateTime(&pcfDateTime);  
      008B54 96               [ 1]  452 	ldw	x, sp
      008B55 5C               [ 2]  453 	incw	x
      008B56 1F 15            [ 2]  454 	ldw	(0x15, sp), x
      008B58 1E 15            [ 2]  455 	ldw	x, (0x15, sp)
      008B5A 89               [ 2]  456 	pushw	x
      008B5B CD 84 ED         [ 4]  457 	call	_PCF_getDateTime
      008B5E 85               [ 2]  458 	popw	x
                                    459 ;	user/main.c: 146: send7Seg(DIG0, pcfDateTime.second%10);
      008B5F 1E 15            [ 2]  460 	ldw	x, (0x15, sp)
      008B61 F6               [ 1]  461 	ld	a, (x)
      008B62 5F               [ 1]  462 	clrw	x
      008B63 97               [ 1]  463 	ld	xl, a
      008B64 A6 0A            [ 1]  464 	ld	a, #0x0a
      008B66 62               [ 2]  465 	div	x, a
      008B67 88               [ 1]  466 	push	a
      008B68 4B 01            [ 1]  467 	push	#0x01
      008B6A CD 8D 00         [ 4]  468 	call	_send7Seg
      008B6D 85               [ 2]  469 	popw	x
                                    470 ;	user/main.c: 147: send7Seg(DIG1, pcfDateTime.second/10);
      008B6E 1E 15            [ 2]  471 	ldw	x, (0x15, sp)
      008B70 F6               [ 1]  472 	ld	a, (x)
      008B71 5F               [ 1]  473 	clrw	x
      008B72 97               [ 1]  474 	ld	xl, a
      008B73 A6 0A            [ 1]  475 	ld	a, #0x0a
      008B75 62               [ 2]  476 	div	x, a
      008B76 9F               [ 1]  477 	ld	a, xl
      008B77 88               [ 1]  478 	push	a
      008B78 4B 02            [ 1]  479 	push	#0x02
      008B7A CD 8D 00         [ 4]  480 	call	_send7Seg
      008B7D 85               [ 2]  481 	popw	x
                                    482 ;	user/main.c: 148: send7Seg(DIG3, pcfDateTime.minute%10);
      008B7E 1E 15            [ 2]  483 	ldw	x, (0x15, sp)
      008B80 5C               [ 2]  484 	incw	x
      008B81 F6               [ 1]  485 	ld	a, (x)
      008B82 89               [ 2]  486 	pushw	x
      008B83 5F               [ 1]  487 	clrw	x
      008B84 97               [ 1]  488 	ld	xl, a
      008B85 A6 0A            [ 1]  489 	ld	a, #0x0a
      008B87 62               [ 2]  490 	div	x, a
      008B88 88               [ 1]  491 	push	a
      008B89 4B 04            [ 1]  492 	push	#0x04
      008B8B CD 8D 00         [ 4]  493 	call	_send7Seg
      008B8E 85               [ 2]  494 	popw	x
      008B8F 85               [ 2]  495 	popw	x
                                    496 ;	user/main.c: 149: send7Seg(DIG4, pcfDateTime.minute/10);
      008B90 F6               [ 1]  497 	ld	a, (x)
      008B91 5F               [ 1]  498 	clrw	x
      008B92 97               [ 1]  499 	ld	xl, a
      008B93 A6 0A            [ 1]  500 	ld	a, #0x0a
      008B95 62               [ 2]  501 	div	x, a
      008B96 9F               [ 1]  502 	ld	a, xl
      008B97 88               [ 1]  503 	push	a
      008B98 4B 05            [ 1]  504 	push	#0x05
      008B9A CD 8D 00         [ 4]  505 	call	_send7Seg
      008B9D 85               [ 2]  506 	popw	x
                                    507 ;	user/main.c: 150: send7Seg(DIG6, pcfDateTime.hour%10);
      008B9E 1E 15            [ 2]  508 	ldw	x, (0x15, sp)
      008BA0 5C               [ 2]  509 	incw	x
      008BA1 5C               [ 2]  510 	incw	x
      008BA2 F6               [ 1]  511 	ld	a, (x)
      008BA3 89               [ 2]  512 	pushw	x
      008BA4 5F               [ 1]  513 	clrw	x
      008BA5 97               [ 1]  514 	ld	xl, a
      008BA6 A6 0A            [ 1]  515 	ld	a, #0x0a
      008BA8 62               [ 2]  516 	div	x, a
      008BA9 88               [ 1]  517 	push	a
      008BAA 4B 07            [ 1]  518 	push	#0x07
      008BAC CD 8D 00         [ 4]  519 	call	_send7Seg
      008BAF 85               [ 2]  520 	popw	x
      008BB0 85               [ 2]  521 	popw	x
                                    522 ;	user/main.c: 151: send7Seg(DIG7, pcfDateTime.hour/10);
      008BB1 F6               [ 1]  523 	ld	a, (x)
      008BB2 5F               [ 1]  524 	clrw	x
      008BB3 97               [ 1]  525 	ld	xl, a
      008BB4 A6 0A            [ 1]  526 	ld	a, #0x0a
      008BB6 62               [ 2]  527 	div	x, a
      008BB7 9F               [ 1]  528 	ld	a, xl
      008BB8 88               [ 1]  529 	push	a
      008BB9 4B 08            [ 1]  530 	push	#0x08
      008BBB CD 8D 00         [ 4]  531 	call	_send7Seg
      008BBE 85               [ 2]  532 	popw	x
      008BBF CC 8B 42         [ 2]  533 	jp	00104$
      008BC2 5B 16            [ 2]  534 	addw	sp, #22
      008BC4 81               [ 4]  535 	ret
                                    536 	.area CODE
                                    537 	.area INITIALIZER
                                    538 	.area CABS (ABS)
