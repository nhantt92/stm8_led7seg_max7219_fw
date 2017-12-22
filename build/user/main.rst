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
      009C24                         60 __start__stack:
      009C24                         61 	.ds	1
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
      008064 82 00 8D 56             97 	int _TIM4_UPD_OVF_IRQHandler ;int23
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
      00808F AE 00 00         [ 2]  121 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  122 	jreq	00004$
      008094                        123 00003$:
      008094 D6 9C 23         [ 1]  124 	ld	a, (s_INITIALIZER - 1, x)
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
      008080 CC 8D 7C         [ 2]  138 	jp	_main
                                    139 ;	return from main will return to caller
                                    140 ;--------------------------------------------------------
                                    141 ; code
                                    142 ;--------------------------------------------------------
                                    143 	.area CODE
                                    144 ;	user/main.c: 27: void clock_setup(void)
                                    145 ;	-----------------------------------------
                                    146 ;	 function clock_setup
                                    147 ;	-----------------------------------------
      008CAF                        148 _clock_setup:
                                    149 ;	user/main.c: 29: CLK_DeInit();
      008CAF CD 91 76         [ 4]  150 	call	_CLK_DeInit
                                    151 ;	user/main.c: 30: CLK_HSECmd(DISABLE);
      008CB2 4B 00            [ 1]  152 	push	#0x00
      008CB4 CD 91 C2         [ 4]  153 	call	_CLK_HSECmd
      008CB7 84               [ 1]  154 	pop	a
                                    155 ;	user/main.c: 31: CLK_LSICmd(DISABLE);
      008CB8 4B 00            [ 1]  156 	push	#0x00
      008CBA CD 91 DE         [ 4]  157 	call	_CLK_LSICmd
      008CBD 84               [ 1]  158 	pop	a
                                    159 ;	user/main.c: 32: CLK_HSICmd(ENABLE);
      008CBE 4B 01            [ 1]  160 	push	#0x01
      008CC0 CD 91 D0         [ 4]  161 	call	_CLK_HSICmd
      008CC3 84               [ 1]  162 	pop	a
                                    163 ;	user/main.c: 33: while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
      008CC4                        164 00101$:
      008CC4 4B 02            [ 1]  165 	push	#0x02
      008CC6 4B 01            [ 1]  166 	push	#0x01
      008CC8 CD 94 74         [ 4]  167 	call	_CLK_GetFlagStatus
      008CCB 85               [ 2]  168 	popw	x
      008CCC 4D               [ 1]  169 	tnz	a
      008CCD 27 F5            [ 1]  170 	jreq	00101$
                                    171 ;	user/main.c: 34: CLK_ClockSwitchCmd(ENABLE);
      008CCF 4B 01            [ 1]  172 	push	#0x01
      008CD1 CD 92 00         [ 4]  173 	call	_CLK_ClockSwitchCmd
      008CD4 84               [ 1]  174 	pop	a
                                    175 ;	user/main.c: 35: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
      008CD5 4B 18            [ 1]  176 	push	#0x18
      008CD7 CD 93 43         [ 4]  177 	call	_CLK_HSIPrescalerConfig
      008CDA 84               [ 1]  178 	pop	a
                                    179 ;	user/main.c: 36: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
      008CDB 4B 81            [ 1]  180 	push	#0x81
      008CDD CD 93 BA         [ 4]  181 	call	_CLK_SYSCLKConfig
      008CE0 84               [ 1]  182 	pop	a
                                    183 ;	user/main.c: 37: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
      008CE1 4B 01            [ 1]  184 	push	#0x01
      008CE3 4B 00            [ 1]  185 	push	#0x00
      008CE5 4B E1            [ 1]  186 	push	#0xe1
      008CE7 4B 01            [ 1]  187 	push	#0x01
      008CE9 CD 92 7E         [ 4]  188 	call	_CLK_ClockSwitchConfig
      008CEC 5B 04            [ 2]  189 	addw	sp, #4
                                    190 ;	user/main.c: 38: CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
      008CEE 4B 00            [ 1]  191 	push	#0x00
      008CF0 4B 01            [ 1]  192 	push	#0x01
      008CF2 CD 92 28         [ 4]  193 	call	_CLK_PeripheralClockConfig
      008CF5 85               [ 2]  194 	popw	x
                                    195 ;	user/main.c: 39: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
      008CF6 4B 01            [ 1]  196 	push	#0x01
      008CF8 4B 00            [ 1]  197 	push	#0x00
      008CFA CD 92 28         [ 4]  198 	call	_CLK_PeripheralClockConfig
      008CFD 85               [ 2]  199 	popw	x
                                    200 ;	user/main.c: 40: CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
      008CFE 4B 00            [ 1]  201 	push	#0x00
      008D00 4B 13            [ 1]  202 	push	#0x13
      008D02 CD 92 28         [ 4]  203 	call	_CLK_PeripheralClockConfig
      008D05 85               [ 2]  204 	popw	x
                                    205 ;	user/main.c: 41: CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
      008D06 4B 00            [ 1]  206 	push	#0x00
      008D08 4B 12            [ 1]  207 	push	#0x12
      008D0A CD 92 28         [ 4]  208 	call	_CLK_PeripheralClockConfig
      008D0D 85               [ 2]  209 	popw	x
                                    210 ;	user/main.c: 42: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
      008D0E 4B 00            [ 1]  211 	push	#0x00
      008D10 4B 03            [ 1]  212 	push	#0x03
      008D12 CD 92 28         [ 4]  213 	call	_CLK_PeripheralClockConfig
      008D15 85               [ 2]  214 	popw	x
                                    215 ;	user/main.c: 43: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
      008D16 4B 00            [ 1]  216 	push	#0x00
      008D18 4B 07            [ 1]  217 	push	#0x07
      008D1A CD 92 28         [ 4]  218 	call	_CLK_PeripheralClockConfig
      008D1D 85               [ 2]  219 	popw	x
                                    220 ;	user/main.c: 44: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
      008D1E 4B 00            [ 1]  221 	push	#0x00
      008D20 4B 05            [ 1]  222 	push	#0x05
      008D22 CD 92 28         [ 4]  223 	call	_CLK_PeripheralClockConfig
      008D25 85               [ 2]  224 	popw	x
                                    225 ;	user/main.c: 45: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
      008D26 4B 01            [ 1]  226 	push	#0x01
      008D28 4B 04            [ 1]  227 	push	#0x04
      008D2A CD 92 28         [ 4]  228 	call	_CLK_PeripheralClockConfig
      008D2D 85               [ 2]  229 	popw	x
      008D2E 81               [ 4]  230 	ret
                                    231 ;	user/main.c: 48: static void GPIO_Config(void)
                                    232 ;	-----------------------------------------
                                    233 ;	 function GPIO_Config
                                    234 ;	-----------------------------------------
      008D2F                        235 _GPIO_Config:
                                    236 ;	user/main.c: 50: GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT);
      008D2F 4B 40            [ 1]  237 	push	#0x40
      008D31 4B 10            [ 1]  238 	push	#0x10
      008D33 4B 05            [ 1]  239 	push	#0x05
      008D35 4B 50            [ 1]  240 	push	#0x50
      008D37 CD 95 02         [ 4]  241 	call	_GPIO_Init
      008D3A 5B 04            [ 2]  242 	addw	sp, #4
                                    243 ;	user/main.c: 51: GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);
      008D3C 4B 40            [ 1]  244 	push	#0x40
      008D3E 4B 20            [ 1]  245 	push	#0x20
      008D40 4B 05            [ 1]  246 	push	#0x05
      008D42 4B 50            [ 1]  247 	push	#0x50
      008D44 CD 95 02         [ 4]  248 	call	_GPIO_Init
      008D47 5B 04            [ 2]  249 	addw	sp, #4
      008D49 81               [ 4]  250 	ret
                                    251 ;	user/main.c: 54: void delay(uint16_t x)
                                    252 ;	-----------------------------------------
                                    253 ;	 function delay
                                    254 ;	-----------------------------------------
      008D4A                        255 _delay:
      008D4A 89               [ 2]  256 	pushw	x
                                    257 ;	user/main.c: 56: while(x--);
      008D4B 1E 05            [ 2]  258 	ldw	x, (0x05, sp)
      008D4D                        259 00101$:
      008D4D 1F 01            [ 2]  260 	ldw	(0x01, sp), x
      008D4F 5A               [ 2]  261 	decw	x
      008D50 16 01            [ 2]  262 	ldw	y, (0x01, sp)
      008D52 26 F9            [ 1]  263 	jrne	00101$
      008D54 85               [ 2]  264 	popw	x
      008D55 81               [ 4]  265 	ret
                                    266 ;	user/main.c: 59: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    267 ;	-----------------------------------------
                                    268 ;	 function TIM4_UPD_OVF_IRQHandler
                                    269 ;	-----------------------------------------
      008D56                        270 _TIM4_UPD_OVF_IRQHandler:
      008D56 62               [ 2]  271 	div	x, a
                                    272 ;	user/main.c: 61: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
      008D57 4B 01            [ 1]  273 	push	#0x01
      008D59 CD 9B 11         [ 4]  274 	call	_TIM4_ClearITPendingBit
      008D5C 84               [ 1]  275 	pop	a
                                    276 ;	user/main.c: 62: TIMER_Inc();
      008D5D CD 90 7D         [ 4]  277 	call	_TIMER_Inc
                                    278 ;	user/main.c: 63: IWDG_ReloadCounter();
      008D60 CD 99 3A         [ 4]  279 	call	_IWDG_ReloadCounter
      008D63 80               [11]  280 	iret
                                    281 ;	user/main.c: 66: void IWDG_Config(void)
                                    282 ;	-----------------------------------------
                                    283 ;	 function IWDG_Config
                                    284 ;	-----------------------------------------
      008D64                        285 _IWDG_Config:
                                    286 ;	user/main.c: 70: IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
      008D64 4B 55            [ 1]  287 	push	#0x55
      008D66 CD 99 25         [ 4]  288 	call	_IWDG_WriteAccessCmd
      008D69 84               [ 1]  289 	pop	a
                                    290 ;	user/main.c: 72: IWDG_SetPrescaler(IWDG_Prescaler_256);
      008D6A 4B 06            [ 1]  291 	push	#0x06
      008D6C CD 99 2C         [ 4]  292 	call	_IWDG_SetPrescaler
      008D6F 84               [ 1]  293 	pop	a
                                    294 ;	user/main.c: 76: IWDG_SetReload(250);
      008D70 4B FA            [ 1]  295 	push	#0xfa
      008D72 CD 99 33         [ 4]  296 	call	_IWDG_SetReload
      008D75 84               [ 1]  297 	pop	a
                                    298 ;	user/main.c: 78: IWDG_ReloadCounter();
      008D76 CD 99 3A         [ 4]  299 	call	_IWDG_ReloadCounter
                                    300 ;	user/main.c: 80: IWDG_Enable();
      008D79 CC 99 3F         [ 2]  301 	jp	_IWDG_Enable
                                    302 ;	user/main.c: 154: void main() 
                                    303 ;	-----------------------------------------
                                    304 ;	 function main
                                    305 ;	-----------------------------------------
      008D7C                        306 _main:
      008D7C 52 16            [ 2]  307 	sub	sp, #22
                                    308 ;	user/main.c: 159: dateTime.second = 40;
      008D7E 96               [ 1]  309 	ldw	x, sp
      008D7F A6 28            [ 1]  310 	ld	a, #0x28
      008D81 E7 09            [ 1]  311 	ld	(9, x), a
                                    312 ;	user/main.c: 160: dateTime.minute = 32;
      008D83 96               [ 1]  313 	ldw	x, sp
      008D84 1C 00 09         [ 2]  314 	addw	x, #9
      008D87 1F 15            [ 2]  315 	ldw	(0x15, sp), x
      008D89 1E 15            [ 2]  316 	ldw	x, (0x15, sp)
      008D8B 5C               [ 2]  317 	incw	x
      008D8C A6 20            [ 1]  318 	ld	a, #0x20
      008D8E F7               [ 1]  319 	ld	(x), a
                                    320 ;	user/main.c: 161: dateTime.hour = 15;
      008D8F 1E 15            [ 2]  321 	ldw	x, (0x15, sp)
      008D91 5C               [ 2]  322 	incw	x
      008D92 5C               [ 2]  323 	incw	x
      008D93 A6 0F            [ 1]  324 	ld	a, #0x0f
      008D95 F7               [ 1]  325 	ld	(x), a
                                    326 ;	user/main.c: 162: dateTime.day = 22;
      008D96 1E 15            [ 2]  327 	ldw	x, (0x15, sp)
      008D98 A6 16            [ 1]  328 	ld	a, #0x16
      008D9A E7 03            [ 1]  329 	ld	(0x0003, x), a
                                    330 ;	user/main.c: 163: dateTime.weekday = 6;
      008D9C 1E 15            [ 2]  331 	ldw	x, (0x15, sp)
      008D9E A6 06            [ 1]  332 	ld	a, #0x06
      008DA0 E7 04            [ 1]  333 	ld	(0x0004, x), a
                                    334 ;	user/main.c: 164: dateTime.month = 12;
      008DA2 1E 15            [ 2]  335 	ldw	x, (0x15, sp)
      008DA4 A6 0C            [ 1]  336 	ld	a, #0x0c
      008DA6 E7 05            [ 1]  337 	ld	(0x0005, x), a
                                    338 ;	user/main.c: 165: dateTime.year = 2017;
      008DA8 1E 15            [ 2]  339 	ldw	x, (0x15, sp)
      008DAA 1C 00 06         [ 2]  340 	addw	x, #0x0006
      008DAD 90 AE 07 E1      [ 2]  341 	ldw	y, #0x07e1
      008DB1 FF               [ 2]  342 	ldw	(x), y
                                    343 ;	user/main.c: 166: clock_setup();
      008DB2 CD 8C AF         [ 4]  344 	call	_clock_setup
                                    345 ;	user/main.c: 167: GPIO_Config();
      008DB5 CD 8D 2F         [ 4]  346 	call	_GPIO_Config
                                    347 ;	user/main.c: 170: PCF_Init(PCF_ALARM_INTERRUPT_ENABLE | PCF_TIMER_INTERRUPT_ENABLE);
      008DB8 4B 03            [ 1]  348 	push	#0x03
      008DBA CD 84 02         [ 4]  349 	call	_PCF_Init
      008DBD 84               [ 1]  350 	pop	a
                                    351 ;	user/main.c: 173: max7Seg(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 8);
      008DBE 4B 08            [ 1]  352 	push	#0x08
      008DC0 4B 20            [ 1]  353 	push	#0x20
      008DC2 4B 10            [ 1]  354 	push	#0x10
      008DC4 4B 40            [ 1]  355 	push	#0x40
      008DC6 4B 0A            [ 1]  356 	push	#0x0a
      008DC8 4B 50            [ 1]  357 	push	#0x50
      008DCA CD 8E D7         [ 4]  358 	call	_max7Seg
      008DCD 5B 06            [ 2]  359 	addw	sp, #6
                                    360 ;	user/main.c: 174: Init();
      008DCF CD 8F AB         [ 4]  361 	call	_Init
                                    362 ;	user/main.c: 175: TIMER_Init();
      008DD2 CD 90 4A         [ 4]  363 	call	_TIMER_Init
                                    364 ;	user/main.c: 176: PCF_setClockOut(PCF_CLKOUT_1HZ);
      008DD5 4B 13            [ 1]  365 	push	#0x13
      008DD7 CD 87 9A         [ 4]  366 	call	_PCF_setClockOut
      008DDA 84               [ 1]  367 	pop	a
                                    368 ;	user/main.c: 177: delay(50);
      008DDB 4B 32            [ 1]  369 	push	#0x32
      008DDD 4B 00            [ 1]  370 	push	#0x00
      008DDF CD 8D 4A         [ 4]  371 	call	_delay
      008DE2 85               [ 2]  372 	popw	x
                                    373 ;	user/main.c: 178: PCF_setDateTime(&dateTime);
      008DE3 1E 15            [ 2]  374 	ldw	x, (0x15, sp)
      008DE5 89               [ 2]  375 	pushw	x
      008DE6 CD 84 29         [ 4]  376 	call	_PCF_setDateTime
      008DE9 85               [ 2]  377 	popw	x
                                    378 ;	user/main.c: 179: delay(50);
      008DEA 4B 32            [ 1]  379 	push	#0x32
      008DEC 4B 00            [ 1]  380 	push	#0x00
      008DEE CD 8D 4A         [ 4]  381 	call	_delay
      008DF1 85               [ 2]  382 	popw	x
                                    383 ;	user/main.c: 180: IWDG_Config();
      008DF2 CD 8D 64         [ 4]  384 	call	_IWDG_Config
                                    385 ;	user/main.c: 181: enableInterrupts();
      008DF5 9A               [ 1]  386 	rim
                                    387 ;	user/main.c: 182: setIntensity(0x03);
      008DF6 4B 03            [ 1]  388 	push	#0x03
      008DF8 CD 8F FC         [ 4]  389 	call	_setIntensity
      008DFB 84               [ 1]  390 	pop	a
                                    391 ;	user/main.c: 183: TIMER_InitTime(&tick);
      008DFC AE 00 01         [ 2]  392 	ldw	x, #_tick+0
      008DFF 1F 11            [ 2]  393 	ldw	(0x11, sp), x
      008E01 1E 11            [ 2]  394 	ldw	x, (0x11, sp)
      008E03 89               [ 2]  395 	pushw	x
      008E04 CD 90 A9         [ 4]  396 	call	_TIMER_InitTime
      008E07 85               [ 2]  397 	popw	x
                                    398 ;	user/main.c: 184: send7Seg(DIG7, 0);
      008E08 4B 00            [ 1]  399 	push	#0x00
      008E0A 4B 08            [ 1]  400 	push	#0x08
      008E0C CD 90 06         [ 4]  401 	call	_send7Seg
      008E0F 85               [ 2]  402 	popw	x
                                    403 ;	user/main.c: 185: send7Seg(DIG6, 0);
      008E10 4B 00            [ 1]  404 	push	#0x00
      008E12 4B 07            [ 1]  405 	push	#0x07
      008E14 CD 90 06         [ 4]  406 	call	_send7Seg
      008E17 85               [ 2]  407 	popw	x
                                    408 ;	user/main.c: 186: send7Seg(DIG5, 10);
      008E18 4B 0A            [ 1]  409 	push	#0x0a
      008E1A 4B 06            [ 1]  410 	push	#0x06
      008E1C CD 90 06         [ 4]  411 	call	_send7Seg
      008E1F 85               [ 2]  412 	popw	x
                                    413 ;	user/main.c: 187: send7Seg(DIG4, 0);
      008E20 4B 00            [ 1]  414 	push	#0x00
      008E22 4B 05            [ 1]  415 	push	#0x05
      008E24 CD 90 06         [ 4]  416 	call	_send7Seg
      008E27 85               [ 2]  417 	popw	x
                                    418 ;	user/main.c: 188: send7Seg(DIG3, 0);
      008E28 4B 00            [ 1]  419 	push	#0x00
      008E2A 4B 04            [ 1]  420 	push	#0x04
      008E2C CD 90 06         [ 4]  421 	call	_send7Seg
      008E2F 85               [ 2]  422 	popw	x
                                    423 ;	user/main.c: 189: send7Seg(DIG2, 10);
      008E30 4B 0A            [ 1]  424 	push	#0x0a
      008E32 4B 03            [ 1]  425 	push	#0x03
      008E34 CD 90 06         [ 4]  426 	call	_send7Seg
      008E37 85               [ 2]  427 	popw	x
                                    428 ;	user/main.c: 190: send7Seg(DIG1, 0);
      008E38 4B 00            [ 1]  429 	push	#0x00
      008E3A 4B 02            [ 1]  430 	push	#0x02
      008E3C CD 90 06         [ 4]  431 	call	_send7Seg
      008E3F 85               [ 2]  432 	popw	x
                                    433 ;	user/main.c: 191: send7Seg(DIG0, 0);
      008E40 4B 00            [ 1]  434 	push	#0x00
      008E42 4B 01            [ 1]  435 	push	#0x01
      008E44 CD 90 06         [ 4]  436 	call	_send7Seg
      008E47 85               [ 2]  437 	popw	x
                                    438 ;	user/main.c: 192: while(TRUE) 
      008E48                        439 00104$:
                                    440 ;	user/main.c: 214: if(TIMER_CheckTimeMS(&tick, 50) == 0)
      008E48 16 11            [ 2]  441 	ldw	y, (0x11, sp)
      008E4A 4B 32            [ 1]  442 	push	#0x32
      008E4C 5F               [ 1]  443 	clrw	x
      008E4D 89               [ 2]  444 	pushw	x
      008E4E 4B 00            [ 1]  445 	push	#0x00
      008E50 90 89            [ 2]  446 	pushw	y
      008E52 CD 91 00         [ 4]  447 	call	_TIMER_CheckTimeMS
      008E55 5B 06            [ 2]  448 	addw	sp, #6
      008E57 4D               [ 1]  449 	tnz	a
      008E58 26 EE            [ 1]  450 	jrne	00104$
                                    451 ;	user/main.c: 216: PCF_getDateTime(&pcfDateTime);  
      008E5A 96               [ 1]  452 	ldw	x, sp
      008E5B 5C               [ 2]  453 	incw	x
      008E5C 1F 13            [ 2]  454 	ldw	(0x13, sp), x
      008E5E 1E 13            [ 2]  455 	ldw	x, (0x13, sp)
      008E60 89               [ 2]  456 	pushw	x
      008E61 CD 82 B4         [ 4]  457 	call	_PCF_getDateTime
      008E64 85               [ 2]  458 	popw	x
                                    459 ;	user/main.c: 217: send7Seg(DIG0, pcfDateTime.second%10);
      008E65 1E 13            [ 2]  460 	ldw	x, (0x13, sp)
      008E67 F6               [ 1]  461 	ld	a, (x)
      008E68 5F               [ 1]  462 	clrw	x
      008E69 97               [ 1]  463 	ld	xl, a
      008E6A A6 0A            [ 1]  464 	ld	a, #0x0a
      008E6C 62               [ 2]  465 	div	x, a
      008E6D 88               [ 1]  466 	push	a
      008E6E 4B 01            [ 1]  467 	push	#0x01
      008E70 CD 90 06         [ 4]  468 	call	_send7Seg
      008E73 85               [ 2]  469 	popw	x
                                    470 ;	user/main.c: 218: send7Seg(DIG1, pcfDateTime.second/10);
      008E74 1E 13            [ 2]  471 	ldw	x, (0x13, sp)
      008E76 F6               [ 1]  472 	ld	a, (x)
      008E77 5F               [ 1]  473 	clrw	x
      008E78 97               [ 1]  474 	ld	xl, a
      008E79 A6 0A            [ 1]  475 	ld	a, #0x0a
      008E7B 62               [ 2]  476 	div	x, a
      008E7C 9F               [ 1]  477 	ld	a, xl
      008E7D 88               [ 1]  478 	push	a
      008E7E 4B 02            [ 1]  479 	push	#0x02
      008E80 CD 90 06         [ 4]  480 	call	_send7Seg
      008E83 85               [ 2]  481 	popw	x
                                    482 ;	user/main.c: 219: send7Seg(DIG3, pcfDateTime.minute%10);
      008E84 1E 13            [ 2]  483 	ldw	x, (0x13, sp)
      008E86 5C               [ 2]  484 	incw	x
      008E87 F6               [ 1]  485 	ld	a, (x)
      008E88 89               [ 2]  486 	pushw	x
      008E89 5F               [ 1]  487 	clrw	x
      008E8A 97               [ 1]  488 	ld	xl, a
      008E8B A6 0A            [ 1]  489 	ld	a, #0x0a
      008E8D 62               [ 2]  490 	div	x, a
      008E8E 88               [ 1]  491 	push	a
      008E8F 4B 04            [ 1]  492 	push	#0x04
      008E91 CD 90 06         [ 4]  493 	call	_send7Seg
      008E94 85               [ 2]  494 	popw	x
      008E95 85               [ 2]  495 	popw	x
                                    496 ;	user/main.c: 220: send7Seg(DIG4, pcfDateTime.minute/10);
      008E96 F6               [ 1]  497 	ld	a, (x)
      008E97 5F               [ 1]  498 	clrw	x
      008E98 97               [ 1]  499 	ld	xl, a
      008E99 A6 0A            [ 1]  500 	ld	a, #0x0a
      008E9B 62               [ 2]  501 	div	x, a
      008E9C 9F               [ 1]  502 	ld	a, xl
      008E9D 88               [ 1]  503 	push	a
      008E9E 4B 05            [ 1]  504 	push	#0x05
      008EA0 CD 90 06         [ 4]  505 	call	_send7Seg
      008EA3 85               [ 2]  506 	popw	x
                                    507 ;	user/main.c: 221: send7Seg(DIG6, pcfDateTime.hour%10);
      008EA4 1E 13            [ 2]  508 	ldw	x, (0x13, sp)
      008EA6 5C               [ 2]  509 	incw	x
      008EA7 5C               [ 2]  510 	incw	x
      008EA8 F6               [ 1]  511 	ld	a, (x)
      008EA9 89               [ 2]  512 	pushw	x
      008EAA 5F               [ 1]  513 	clrw	x
      008EAB 97               [ 1]  514 	ld	xl, a
      008EAC A6 0A            [ 1]  515 	ld	a, #0x0a
      008EAE 62               [ 2]  516 	div	x, a
      008EAF 88               [ 1]  517 	push	a
      008EB0 4B 07            [ 1]  518 	push	#0x07
      008EB2 CD 90 06         [ 4]  519 	call	_send7Seg
      008EB5 85               [ 2]  520 	popw	x
      008EB6 85               [ 2]  521 	popw	x
                                    522 ;	user/main.c: 222: send7Seg(DIG7, pcfDateTime.hour/10);
      008EB7 F6               [ 1]  523 	ld	a, (x)
      008EB8 5F               [ 1]  524 	clrw	x
      008EB9 97               [ 1]  525 	ld	xl, a
      008EBA A6 0A            [ 1]  526 	ld	a, #0x0a
      008EBC 62               [ 2]  527 	div	x, a
      008EBD 9F               [ 1]  528 	ld	a, xl
      008EBE 88               [ 1]  529 	push	a
      008EBF 4B 08            [ 1]  530 	push	#0x08
      008EC1 CD 90 06         [ 4]  531 	call	_send7Seg
      008EC4 85               [ 2]  532 	popw	x
      008EC5 CC 8E 48         [ 2]  533 	jp	00104$
      008EC8 5B 16            [ 2]  534 	addw	sp, #22
      008ECA 81               [ 4]  535 	ret
                                    536 	.area CODE
                                    537 	.area INITIALIZER
                                    538 	.area CABS (ABS)
