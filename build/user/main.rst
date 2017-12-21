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
                                     14 	.globl _PCF_Init
                                     15 	.globl _TIMER_CheckTimeMS
                                     16 	.globl _TIMER_InitTime
                                     17 	.globl _TIMER_Inc
                                     18 	.globl _TIMER_Init
                                     19 	.globl _send7Seg
                                     20 	.globl _setIntensity
                                     21 	.globl _Init
                                     22 	.globl _max7Seg
                                     23 	.globl _TIM4_ClearITPendingBit
                                     24 	.globl _IWDG_Enable
                                     25 	.globl _IWDG_ReloadCounter
                                     26 	.globl _IWDG_SetReload
                                     27 	.globl _IWDG_SetPrescaler
                                     28 	.globl _IWDG_WriteAccessCmd
                                     29 	.globl _GPIO_Init
                                     30 	.globl _CLK_Config
                                     31 	.globl _tick
                                     32 	.globl _IWDG_Config
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area DATA
      000001                         37 _tick::
      000001                         38 	.ds 6
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area INITIALIZED
                                     43 ;--------------------------------------------------------
                                     44 ; Stack segment in internal ram 
                                     45 ;--------------------------------------------------------
                                     46 	.area	SSEG
      009806                         47 __start__stack:
      009806                         48 	.ds	1
                                     49 
                                     50 ;--------------------------------------------------------
                                     51 ; absolute external ram data
                                     52 ;--------------------------------------------------------
                                     53 	.area DABS (ABS)
                                     54 ;--------------------------------------------------------
                                     55 ; interrupt vector 
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
      008000                         58 __interrupt_vect:
      008000 82 00 80 83             59 	int s_GSINIT ;reset
      008004 82 00 00 00             60 	int 0x0000 ;trap
      008008 82 00 00 00             61 	int 0x0000 ;int0
      00800C 82 00 00 00             62 	int 0x0000 ;int1
      008010 82 00 00 00             63 	int 0x0000 ;int2
      008014 82 00 00 00             64 	int 0x0000 ;int3
      008018 82 00 00 00             65 	int 0x0000 ;int4
      00801C 82 00 00 00             66 	int 0x0000 ;int5
      008020 82 00 00 00             67 	int 0x0000 ;int6
      008024 82 00 00 00             68 	int 0x0000 ;int7
      008028 82 00 00 00             69 	int 0x0000 ;int8
      00802C 82 00 00 00             70 	int 0x0000 ;int9
      008030 82 00 00 00             71 	int 0x0000 ;int10
      008034 82 00 00 00             72 	int 0x0000 ;int11
      008038 82 00 00 00             73 	int 0x0000 ;int12
      00803C 82 00 00 00             74 	int 0x0000 ;int13
      008040 82 00 00 00             75 	int 0x0000 ;int14
      008044 82 00 00 00             76 	int 0x0000 ;int15
      008048 82 00 00 00             77 	int 0x0000 ;int16
      00804C 82 00 00 00             78 	int 0x0000 ;int17
      008050 82 00 00 00             79 	int 0x0000 ;int18
      008054 82 00 00 00             80 	int 0x0000 ;int19
      008058 82 00 00 00             81 	int 0x0000 ;int20
      00805C 82 00 00 00             82 	int 0x0000 ;int21
      008060 82 00 00 00             83 	int 0x0000 ;int22
      008064 82 00 8B 96             84 	int _TIM4_UPD_OVF_IRQHandler ;int23
      008068 82 00 00 00             85 	int 0x0000 ;int24
      00806C 82 00 00 00             86 	int 0x0000 ;int25
      008070 82 00 00 00             87 	int 0x0000 ;int26
      008074 82 00 00 00             88 	int 0x0000 ;int27
      008078 82 00 00 00             89 	int 0x0000 ;int28
      00807C 82 00 00 00             90 	int 0x0000 ;int29
                                     91 ;--------------------------------------------------------
                                     92 ; global & static initialisations
                                     93 ;--------------------------------------------------------
                                     94 	.area HOME
                                     95 	.area GSINIT
                                     96 	.area GSFINAL
                                     97 	.area GSINIT
      008083                         98 __sdcc_gs_init_startup:
      008083                         99 __sdcc_init_data:
                                    100 ; stm8_genXINIT() start
      008083 AE 00 1D         [ 2]  101 	ldw x, #l_DATA
      008086 27 07            [ 1]  102 	jreq	00002$
      008088                        103 00001$:
      008088 72 4F 00 00      [ 1]  104 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  105 	decw x
      00808D 26 F9            [ 1]  106 	jrne	00001$
      00808F                        107 00002$:
      00808F AE 00 00         [ 2]  108 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  109 	jreq	00004$
      008094                        110 00003$:
      008094 D6 98 05         [ 1]  111 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 1D         [ 1]  112 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  113 	decw	x
      00809B 26 F7            [ 1]  114 	jrne	00003$
      00809D                        115 00004$:
                                    116 ; stm8_genXINIT() end
                                    117 	.area GSFINAL
      00809D CC 80 80         [ 2]  118 	jp	__sdcc_program_startup
                                    119 ;--------------------------------------------------------
                                    120 ; Home
                                    121 ;--------------------------------------------------------
                                    122 	.area HOME
                                    123 	.area HOME
      008080                        124 __sdcc_program_startup:
      008080 CC 8B BC         [ 2]  125 	jp	_main
                                    126 ;	return from main will return to caller
                                    127 ;--------------------------------------------------------
                                    128 ; code
                                    129 ;--------------------------------------------------------
                                    130 	.area CODE
                                    131 ;	user/main.c: 25: static void GPIO_Config(void)
                                    132 ;	-----------------------------------------
                                    133 ;	 function GPIO_Config
                                    134 ;	-----------------------------------------
      008B6F                        135 _GPIO_Config:
                                    136 ;	user/main.c: 27: GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
      008B6F 4B B0            [ 1]  137 	push	#0xb0
      008B71 4B 10            [ 1]  138 	push	#0x10
      008B73 4B 05            [ 1]  139 	push	#0x05
      008B75 4B 50            [ 1]  140 	push	#0x50
      008B77 CD 90 E4         [ 4]  141 	call	_GPIO_Init
      008B7A 5B 04            [ 2]  142 	addw	sp, #4
                                    143 ;	user/main.c: 28: GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
      008B7C 4B B0            [ 1]  144 	push	#0xb0
      008B7E 4B 20            [ 1]  145 	push	#0x20
      008B80 4B 05            [ 1]  146 	push	#0x05
      008B82 4B 50            [ 1]  147 	push	#0x50
      008B84 CD 90 E4         [ 4]  148 	call	_GPIO_Init
      008B87 5B 04            [ 2]  149 	addw	sp, #4
      008B89 81               [ 4]  150 	ret
                                    151 ;	user/main.c: 31: void delay(uint16_t x)
                                    152 ;	-----------------------------------------
                                    153 ;	 function delay
                                    154 ;	-----------------------------------------
      008B8A                        155 _delay:
      008B8A 89               [ 2]  156 	pushw	x
                                    157 ;	user/main.c: 33: while(x--);
      008B8B 1E 05            [ 2]  158 	ldw	x, (0x05, sp)
      008B8D                        159 00101$:
      008B8D 1F 01            [ 2]  160 	ldw	(0x01, sp), x
      008B8F 5A               [ 2]  161 	decw	x
      008B90 16 01            [ 2]  162 	ldw	y, (0x01, sp)
      008B92 26 F9            [ 1]  163 	jrne	00101$
      008B94 85               [ 2]  164 	popw	x
      008B95 81               [ 4]  165 	ret
                                    166 ;	user/main.c: 36: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    167 ;	-----------------------------------------
                                    168 ;	 function TIM4_UPD_OVF_IRQHandler
                                    169 ;	-----------------------------------------
      008B96                        170 _TIM4_UPD_OVF_IRQHandler:
      008B96 62               [ 2]  171 	div	x, a
                                    172 ;	user/main.c: 38: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
      008B97 4B 01            [ 1]  173 	push	#0x01
      008B99 CD 96 F3         [ 4]  174 	call	_TIM4_ClearITPendingBit
      008B9C 84               [ 1]  175 	pop	a
                                    176 ;	user/main.c: 39: TIMER_Inc();
      008B9D CD 8E B0         [ 4]  177 	call	_TIMER_Inc
                                    178 ;	user/main.c: 40: IWDG_ReloadCounter();
      008BA0 CD 95 1C         [ 4]  179 	call	_IWDG_ReloadCounter
      008BA3 80               [11]  180 	iret
                                    181 ;	user/main.c: 43: void IWDG_Config(void)
                                    182 ;	-----------------------------------------
                                    183 ;	 function IWDG_Config
                                    184 ;	-----------------------------------------
      008BA4                        185 _IWDG_Config:
                                    186 ;	user/main.c: 47: IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
      008BA4 4B 55            [ 1]  187 	push	#0x55
      008BA6 CD 95 07         [ 4]  188 	call	_IWDG_WriteAccessCmd
      008BA9 84               [ 1]  189 	pop	a
                                    190 ;	user/main.c: 49: IWDG_SetPrescaler(IWDG_Prescaler_256);
      008BAA 4B 06            [ 1]  191 	push	#0x06
      008BAC CD 95 0E         [ 4]  192 	call	_IWDG_SetPrescaler
      008BAF 84               [ 1]  193 	pop	a
                                    194 ;	user/main.c: 53: IWDG_SetReload(250);
      008BB0 4B FA            [ 1]  195 	push	#0xfa
      008BB2 CD 95 15         [ 4]  196 	call	_IWDG_SetReload
      008BB5 84               [ 1]  197 	pop	a
                                    198 ;	user/main.c: 55: IWDG_ReloadCounter();
      008BB6 CD 95 1C         [ 4]  199 	call	_IWDG_ReloadCounter
                                    200 ;	user/main.c: 57: IWDG_Enable();
      008BB9 CC 95 21         [ 2]  201 	jp	_IWDG_Enable
                                    202 ;	user/main.c: 60: void main() 
                                    203 ;	-----------------------------------------
                                    204 ;	 function main
                                    205 ;	-----------------------------------------
      008BBC                        206 _main:
      008BBC 52 17            [ 2]  207 	sub	sp, #23
                                    208 ;	user/main.c: 62: uint8_t hh = 0, mm = 0, ss = 0;
      008BBE 0F 01            [ 1]  209 	clr	(0x01, sp)
      008BC0 0F 02            [ 1]  210 	clr	(0x02, sp)
      008BC2 0F 13            [ 1]  211 	clr	(0x13, sp)
                                    212 ;	user/main.c: 65: dateTime.second = 43;
      008BC4 96               [ 1]  213 	ldw	x, sp
      008BC5 A6 2B            [ 1]  214 	ld	a, #0x2b
      008BC7 E7 0B            [ 1]  215 	ld	(11, x), a
                                    216 ;	user/main.c: 66: dateTime.minute = 15;
      008BC9 96               [ 1]  217 	ldw	x, sp
      008BCA 1C 00 0B         [ 2]  218 	addw	x, #11
      008BCD 1F 16            [ 2]  219 	ldw	(0x16, sp), x
      008BCF 1E 16            [ 2]  220 	ldw	x, (0x16, sp)
      008BD1 5C               [ 2]  221 	incw	x
      008BD2 A6 0F            [ 1]  222 	ld	a, #0x0f
      008BD4 F7               [ 1]  223 	ld	(x), a
                                    224 ;	user/main.c: 67: dateTime.hour = 17;
      008BD5 1E 16            [ 2]  225 	ldw	x, (0x16, sp)
      008BD7 5C               [ 2]  226 	incw	x
      008BD8 5C               [ 2]  227 	incw	x
      008BD9 A6 11            [ 1]  228 	ld	a, #0x11
      008BDB F7               [ 1]  229 	ld	(x), a
                                    230 ;	user/main.c: 68: dateTime.day = 21;
      008BDC 1E 16            [ 2]  231 	ldw	x, (0x16, sp)
      008BDE A6 15            [ 1]  232 	ld	a, #0x15
      008BE0 E7 03            [ 1]  233 	ld	(0x0003, x), a
                                    234 ;	user/main.c: 69: dateTime.weekday = 5;
      008BE2 1E 16            [ 2]  235 	ldw	x, (0x16, sp)
      008BE4 A6 05            [ 1]  236 	ld	a, #0x05
      008BE6 E7 04            [ 1]  237 	ld	(0x0004, x), a
                                    238 ;	user/main.c: 70: dateTime.month = 12;
      008BE8 1E 16            [ 2]  239 	ldw	x, (0x16, sp)
      008BEA A6 0C            [ 1]  240 	ld	a, #0x0c
      008BEC E7 05            [ 1]  241 	ld	(0x0005, x), a
                                    242 ;	user/main.c: 71: dateTime.year = 2017;
      008BEE 1E 16            [ 2]  243 	ldw	x, (0x16, sp)
      008BF0 1C 00 06         [ 2]  244 	addw	x, #0x0006
      008BF3 90 AE 07 E1      [ 2]  245 	ldw	y, #0x07e1
      008BF7 FF               [ 2]  246 	ldw	(x), y
                                    247 ;	user/main.c: 72: CLK_Config();
      008BF8 CD 8F A9         [ 4]  248 	call	_CLK_Config
                                    249 ;	user/main.c: 73: GPIO_Config();
      008BFB CD 8B 6F         [ 4]  250 	call	_GPIO_Config
                                    251 ;	user/main.c: 74: PCF_Init(PCF_ALARM_INTERRUPT_ENABLE);
      008BFE 4B 02            [ 1]  252 	push	#0x02
      008C00 CD 81 B9         [ 4]  253 	call	_PCF_Init
      008C03 84               [ 1]  254 	pop	a
                                    255 ;	user/main.c: 76: max7Seg(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 8);
      008C04 4B 08            [ 1]  256 	push	#0x08
      008C06 4B 20            [ 1]  257 	push	#0x20
      008C08 4B 10            [ 1]  258 	push	#0x10
      008C0A 4B 40            [ 1]  259 	push	#0x40
      008C0C 4B 0A            [ 1]  260 	push	#0x0a
      008C0E 4B 50            [ 1]  261 	push	#0x50
      008C10 CD 8D 0A         [ 4]  262 	call	_max7Seg
      008C13 5B 06            [ 2]  263 	addw	sp, #6
                                    264 ;	user/main.c: 77: Init();
      008C15 CD 8D DE         [ 4]  265 	call	_Init
                                    266 ;	user/main.c: 78: TIMER_Init();
      008C18 CD 8E 7D         [ 4]  267 	call	_TIMER_Init
                                    268 ;	user/main.c: 81: IWDG_Config();
      008C1B CD 8B A4         [ 4]  269 	call	_IWDG_Config
                                    270 ;	user/main.c: 82: enableInterrupts();
      008C1E 9A               [ 1]  271 	rim
                                    272 ;	user/main.c: 83: setIntensity(0x03);
      008C1F 4B 03            [ 1]  273 	push	#0x03
      008C21 CD 8E 2F         [ 4]  274 	call	_setIntensity
      008C24 84               [ 1]  275 	pop	a
                                    276 ;	user/main.c: 84: TIMER_InitTime(&tick);
      008C25 AE 00 01         [ 2]  277 	ldw	x, #_tick+0
      008C28 1F 14            [ 2]  278 	ldw	(0x14, sp), x
      008C2A 1E 14            [ 2]  279 	ldw	x, (0x14, sp)
      008C2C 89               [ 2]  280 	pushw	x
      008C2D CD 8E DC         [ 4]  281 	call	_TIMER_InitTime
      008C30 85               [ 2]  282 	popw	x
                                    283 ;	user/main.c: 86: send7Seg(DIG7, 0);
      008C31 4B 00            [ 1]  284 	push	#0x00
      008C33 4B 08            [ 1]  285 	push	#0x08
      008C35 CD 8E 39         [ 4]  286 	call	_send7Seg
      008C38 85               [ 2]  287 	popw	x
                                    288 ;	user/main.c: 87: send7Seg(DIG6, 0);
      008C39 4B 00            [ 1]  289 	push	#0x00
      008C3B 4B 07            [ 1]  290 	push	#0x07
      008C3D CD 8E 39         [ 4]  291 	call	_send7Seg
      008C40 85               [ 2]  292 	popw	x
                                    293 ;	user/main.c: 88: send7Seg(DIG5, 10);
      008C41 4B 0A            [ 1]  294 	push	#0x0a
      008C43 4B 06            [ 1]  295 	push	#0x06
      008C45 CD 8E 39         [ 4]  296 	call	_send7Seg
      008C48 85               [ 2]  297 	popw	x
                                    298 ;	user/main.c: 89: send7Seg(DIG4, 0);
      008C49 4B 00            [ 1]  299 	push	#0x00
      008C4B 4B 05            [ 1]  300 	push	#0x05
      008C4D CD 8E 39         [ 4]  301 	call	_send7Seg
      008C50 85               [ 2]  302 	popw	x
                                    303 ;	user/main.c: 90: send7Seg(DIG3, 0);
      008C51 4B 00            [ 1]  304 	push	#0x00
      008C53 4B 04            [ 1]  305 	push	#0x04
      008C55 CD 8E 39         [ 4]  306 	call	_send7Seg
      008C58 85               [ 2]  307 	popw	x
                                    308 ;	user/main.c: 91: send7Seg(DIG2, 10);
      008C59 4B 0A            [ 1]  309 	push	#0x0a
      008C5B 4B 03            [ 1]  310 	push	#0x03
      008C5D CD 8E 39         [ 4]  311 	call	_send7Seg
      008C60 85               [ 2]  312 	popw	x
                                    313 ;	user/main.c: 92: send7Seg(DIG1, 0);
      008C61 4B 00            [ 1]  314 	push	#0x00
      008C63 4B 02            [ 1]  315 	push	#0x02
      008C65 CD 8E 39         [ 4]  316 	call	_send7Seg
      008C68 85               [ 2]  317 	popw	x
                                    318 ;	user/main.c: 93: send7Seg(DIG0, 0);
      008C69 4B 00            [ 1]  319 	push	#0x00
      008C6B 4B 01            [ 1]  320 	push	#0x01
      008C6D CD 8E 39         [ 4]  321 	call	_send7Seg
      008C70 85               [ 2]  322 	popw	x
                                    323 ;	user/main.c: 94: while(TRUE) 
      008C71                        324 00110$:
                                    325 ;	user/main.c: 96: if(TIMER_CheckTimeMS(&tick, 1000) == 0)
      008C71 16 14            [ 2]  326 	ldw	y, (0x14, sp)
      008C73 4B E8            [ 1]  327 	push	#0xe8
      008C75 4B 03            [ 1]  328 	push	#0x03
      008C77 5F               [ 1]  329 	clrw	x
      008C78 89               [ 2]  330 	pushw	x
      008C79 90 89            [ 2]  331 	pushw	y
      008C7B CD 8F 33         [ 4]  332 	call	_TIMER_CheckTimeMS
      008C7E 5B 06            [ 2]  333 	addw	sp, #6
      008C80 4D               [ 1]  334 	tnz	a
      008C81 26 EE            [ 1]  335 	jrne	00110$
                                    336 ;	user/main.c: 98: if(++ss >=60)
      008C83 0C 13            [ 1]  337 	inc	(0x13, sp)
      008C85 7B 13            [ 1]  338 	ld	a, (0x13, sp)
      008C87 A1 3C            [ 1]  339 	cp	a, #0x3c
      008C89 25 16            [ 1]  340 	jrc	00106$
                                    341 ;	user/main.c: 100: ss=0;
      008C8B 0F 13            [ 1]  342 	clr	(0x13, sp)
                                    343 ;	user/main.c: 101: if(++mm >=60)
      008C8D 0C 02            [ 1]  344 	inc	(0x02, sp)
      008C8F 7B 02            [ 1]  345 	ld	a, (0x02, sp)
      008C91 A1 3C            [ 1]  346 	cp	a, #0x3c
      008C93 25 0C            [ 1]  347 	jrc	00106$
                                    348 ;	user/main.c: 103: mm=0;
      008C95 0F 02            [ 1]  349 	clr	(0x02, sp)
                                    350 ;	user/main.c: 104: if(++hh >= 24)
      008C97 0C 01            [ 1]  351 	inc	(0x01, sp)
      008C99 7B 01            [ 1]  352 	ld	a, (0x01, sp)
      008C9B A1 18            [ 1]  353 	cp	a, #0x18
      008C9D 25 02            [ 1]  354 	jrc	00106$
                                    355 ;	user/main.c: 105: hh = 0;
      008C9F 0F 01            [ 1]  356 	clr	(0x01, sp)
      008CA1                        357 00106$:
                                    358 ;	user/main.c: 108: send7Seg(DIG0, ss%10);
      008CA1 5F               [ 1]  359 	clrw	x
      008CA2 7B 13            [ 1]  360 	ld	a, (0x13, sp)
      008CA4 97               [ 1]  361 	ld	xl, a
      008CA5 A6 0A            [ 1]  362 	ld	a, #0x0a
      008CA7 62               [ 2]  363 	div	x, a
      008CA8 88               [ 1]  364 	push	a
      008CA9 4B 01            [ 1]  365 	push	#0x01
      008CAB CD 8E 39         [ 4]  366 	call	_send7Seg
      008CAE 85               [ 2]  367 	popw	x
                                    368 ;	user/main.c: 109: send7Seg(DIG1, ss/10);
      008CAF 5F               [ 1]  369 	clrw	x
      008CB0 7B 13            [ 1]  370 	ld	a, (0x13, sp)
      008CB2 97               [ 1]  371 	ld	xl, a
      008CB3 A6 0A            [ 1]  372 	ld	a, #0x0a
      008CB5 62               [ 2]  373 	div	x, a
      008CB6 9F               [ 1]  374 	ld	a, xl
      008CB7 88               [ 1]  375 	push	a
      008CB8 4B 02            [ 1]  376 	push	#0x02
      008CBA CD 8E 39         [ 4]  377 	call	_send7Seg
      008CBD 85               [ 2]  378 	popw	x
                                    379 ;	user/main.c: 110: send7Seg(DIG3, mm%10);
      008CBE 5F               [ 1]  380 	clrw	x
      008CBF 7B 02            [ 1]  381 	ld	a, (0x02, sp)
      008CC1 97               [ 1]  382 	ld	xl, a
      008CC2 A6 0A            [ 1]  383 	ld	a, #0x0a
      008CC4 62               [ 2]  384 	div	x, a
      008CC5 88               [ 1]  385 	push	a
      008CC6 4B 04            [ 1]  386 	push	#0x04
      008CC8 CD 8E 39         [ 4]  387 	call	_send7Seg
      008CCB 85               [ 2]  388 	popw	x
                                    389 ;	user/main.c: 111: send7Seg(DIG4, mm/10);
      008CCC 5F               [ 1]  390 	clrw	x
      008CCD 7B 02            [ 1]  391 	ld	a, (0x02, sp)
      008CCF 97               [ 1]  392 	ld	xl, a
      008CD0 A6 0A            [ 1]  393 	ld	a, #0x0a
      008CD2 62               [ 2]  394 	div	x, a
      008CD3 9F               [ 1]  395 	ld	a, xl
      008CD4 88               [ 1]  396 	push	a
      008CD5 4B 05            [ 1]  397 	push	#0x05
      008CD7 CD 8E 39         [ 4]  398 	call	_send7Seg
      008CDA 85               [ 2]  399 	popw	x
                                    400 ;	user/main.c: 112: send7Seg(DIG6, hh%10);
      008CDB 5F               [ 1]  401 	clrw	x
      008CDC 7B 01            [ 1]  402 	ld	a, (0x01, sp)
      008CDE 97               [ 1]  403 	ld	xl, a
      008CDF A6 0A            [ 1]  404 	ld	a, #0x0a
      008CE1 62               [ 2]  405 	div	x, a
      008CE2 88               [ 1]  406 	push	a
      008CE3 4B 07            [ 1]  407 	push	#0x07
      008CE5 CD 8E 39         [ 4]  408 	call	_send7Seg
      008CE8 85               [ 2]  409 	popw	x
                                    410 ;	user/main.c: 113: send7Seg(DIG7, hh/10);
      008CE9 5F               [ 1]  411 	clrw	x
      008CEA 7B 01            [ 1]  412 	ld	a, (0x01, sp)
      008CEC 97               [ 1]  413 	ld	xl, a
      008CED A6 0A            [ 1]  414 	ld	a, #0x0a
      008CEF 62               [ 2]  415 	div	x, a
      008CF0 9F               [ 1]  416 	ld	a, xl
      008CF1 88               [ 1]  417 	push	a
      008CF2 4B 08            [ 1]  418 	push	#0x08
      008CF4 CD 8E 39         [ 4]  419 	call	_send7Seg
      008CF7 85               [ 2]  420 	popw	x
      008CF8 CC 8C 71         [ 2]  421 	jp	00110$
      008CFB 5B 17            [ 2]  422 	addw	sp, #23
      008CFD 81               [ 4]  423 	ret
                                    424 	.area CODE
                                    425 	.area INITIALIZER
                                    426 	.area CABS (ABS)
