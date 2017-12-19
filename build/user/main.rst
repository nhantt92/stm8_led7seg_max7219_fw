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
                                     14 	.globl _TIMER_CheckTimeMS
                                     15 	.globl _TIMER_InitTime
                                     16 	.globl _TIMER_Inc
                                     17 	.globl _TIMER_Init
                                     18 	.globl _send7Seg
                                     19 	.globl _setIntensity
                                     20 	.globl _Init
                                     21 	.globl _max7Seg
                                     22 	.globl _TIM4_ClearITPendingBit
                                     23 	.globl _IWDG_Enable
                                     24 	.globl _IWDG_ReloadCounter
                                     25 	.globl _IWDG_SetReload
                                     26 	.globl _IWDG_SetPrescaler
                                     27 	.globl _IWDG_WriteAccessCmd
                                     28 	.globl _CLK_Config
                                     29 	.globl _tick
                                     30 	.globl _IWDG_Config
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DATA
      000001                         35 _tick::
      000001                         36 	.ds 6
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area INITIALIZED
                                     41 ;--------------------------------------------------------
                                     42 ; Stack segment in internal ram 
                                     43 ;--------------------------------------------------------
                                     44 	.area	SSEG
      00001E                         45 __start__stack:
      00001E                         46 	.ds	1
                                     47 
                                     48 ;--------------------------------------------------------
                                     49 ; absolute external ram data
                                     50 ;--------------------------------------------------------
                                     51 	.area DABS (ABS)
                                     52 ;--------------------------------------------------------
                                     53 ; interrupt vector 
                                     54 ;--------------------------------------------------------
                                     55 	.area HOME
      008000                         56 __interrupt_vect:
      008000 82 00 80 83             57 	int s_GSINIT ;reset
      008004 82 00 00 00             58 	int 0x0000 ;trap
      008008 82 00 00 00             59 	int 0x0000 ;int0
      00800C 82 00 00 00             60 	int 0x0000 ;int1
      008010 82 00 00 00             61 	int 0x0000 ;int2
      008014 82 00 00 00             62 	int 0x0000 ;int3
      008018 82 00 00 00             63 	int 0x0000 ;int4
      00801C 82 00 00 00             64 	int 0x0000 ;int5
      008020 82 00 00 00             65 	int 0x0000 ;int6
      008024 82 00 00 00             66 	int 0x0000 ;int7
      008028 82 00 00 00             67 	int 0x0000 ;int8
      00802C 82 00 00 00             68 	int 0x0000 ;int9
      008030 82 00 00 00             69 	int 0x0000 ;int10
      008034 82 00 00 00             70 	int 0x0000 ;int11
      008038 82 00 00 00             71 	int 0x0000 ;int12
      00803C 82 00 00 00             72 	int 0x0000 ;int13
      008040 82 00 00 00             73 	int 0x0000 ;int14
      008044 82 00 00 00             74 	int 0x0000 ;int15
      008048 82 00 00 00             75 	int 0x0000 ;int16
      00804C 82 00 00 00             76 	int 0x0000 ;int17
      008050 82 00 00 00             77 	int 0x0000 ;int18
      008054 82 00 00 00             78 	int 0x0000 ;int19
      008058 82 00 00 00             79 	int 0x0000 ;int20
      00805C 82 00 00 00             80 	int 0x0000 ;int21
      008060 82 00 00 00             81 	int 0x0000 ;int22
      008064 82 00 80 AC             82 	int _TIM4_UPD_OVF_IRQHandler ;int23
      008068 82 00 00 00             83 	int 0x0000 ;int24
      00806C 82 00 00 00             84 	int 0x0000 ;int25
      008070 82 00 00 00             85 	int 0x0000 ;int26
      008074 82 00 00 00             86 	int 0x0000 ;int27
      008078 82 00 00 00             87 	int 0x0000 ;int28
      00807C 82 00 00 00             88 	int 0x0000 ;int29
                                     89 ;--------------------------------------------------------
                                     90 ; global & static initialisations
                                     91 ;--------------------------------------------------------
                                     92 	.area HOME
                                     93 	.area GSINIT
                                     94 	.area GSFINAL
                                     95 	.area GSINIT
      008083                         96 __sdcc_gs_init_startup:
      008083                         97 __sdcc_init_data:
                                     98 ; stm8_genXINIT() start
      008083 AE 00 1D         [ 2]   99 	ldw x, #l_DATA
      008086 27 07            [ 1]  100 	jreq	00002$
      008088                        101 00001$:
      008088 72 4F 00 00      [ 1]  102 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  103 	decw x
      00808D 26 F9            [ 1]  104 	jrne	00001$
      00808F                        105 00002$:
      00808F AE 00 00         [ 2]  106 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  107 	jreq	00004$
      008094                        108 00003$:
      008094 D6 89 06         [ 1]  109 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 1D         [ 1]  110 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  111 	decw	x
      00809B 26 F7            [ 1]  112 	jrne	00003$
      00809D                        113 00004$:
                                    114 ; stm8_genXINIT() end
                                    115 	.area GSFINAL
      00809D CC 80 80         [ 2]  116 	jp	__sdcc_program_startup
                                    117 ;--------------------------------------------------------
                                    118 ; Home
                                    119 ;--------------------------------------------------------
                                    120 	.area HOME
                                    121 	.area HOME
      008080                        122 __sdcc_program_startup:
      008080 CC 80 D2         [ 2]  123 	jp	_main
                                    124 ;	return from main will return to caller
                                    125 ;--------------------------------------------------------
                                    126 ; code
                                    127 ;--------------------------------------------------------
                                    128 	.area CODE
                                    129 ;	user/main.c: 27: void delay(uint16_t x)
                                    130 ;	-----------------------------------------
                                    131 ;	 function delay
                                    132 ;	-----------------------------------------
      0080A0                        133 _delay:
      0080A0 89               [ 2]  134 	pushw	x
                                    135 ;	user/main.c: 29: while(x--);
      0080A1 1E 05            [ 2]  136 	ldw	x, (0x05, sp)
      0080A3                        137 00101$:
      0080A3 1F 01            [ 2]  138 	ldw	(0x01, sp), x
      0080A5 5A               [ 2]  139 	decw	x
      0080A6 16 01            [ 2]  140 	ldw	y, (0x01, sp)
      0080A8 26 F9            [ 1]  141 	jrne	00101$
      0080AA 85               [ 2]  142 	popw	x
      0080AB 81               [ 4]  143 	ret
                                    144 ;	user/main.c: 32: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    145 ;	-----------------------------------------
                                    146 ;	 function TIM4_UPD_OVF_IRQHandler
                                    147 ;	-----------------------------------------
      0080AC                        148 _TIM4_UPD_OVF_IRQHandler:
      0080AC 62               [ 2]  149 	div	x, a
                                    150 ;	user/main.c: 34: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
      0080AD 4B 01            [ 1]  151 	push	#0x01
      0080AF CD 88 84         [ 4]  152 	call	_TIM4_ClearITPendingBit
      0080B2 84               [ 1]  153 	pop	a
                                    154 ;	user/main.c: 35: TIMER_Inc();
      0080B3 CD 83 89         [ 4]  155 	call	_TIMER_Inc
                                    156 ;	user/main.c: 36: IWDG_ReloadCounter();
      0080B6 CD 86 AD         [ 4]  157 	call	_IWDG_ReloadCounter
      0080B9 80               [11]  158 	iret
                                    159 ;	user/main.c: 39: void IWDG_Config(void)
                                    160 ;	-----------------------------------------
                                    161 ;	 function IWDG_Config
                                    162 ;	-----------------------------------------
      0080BA                        163 _IWDG_Config:
                                    164 ;	user/main.c: 43: IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
      0080BA 4B 55            [ 1]  165 	push	#0x55
      0080BC CD 86 98         [ 4]  166 	call	_IWDG_WriteAccessCmd
      0080BF 84               [ 1]  167 	pop	a
                                    168 ;	user/main.c: 45: IWDG_SetPrescaler(IWDG_Prescaler_256);
      0080C0 4B 06            [ 1]  169 	push	#0x06
      0080C2 CD 86 9F         [ 4]  170 	call	_IWDG_SetPrescaler
      0080C5 84               [ 1]  171 	pop	a
                                    172 ;	user/main.c: 49: IWDG_SetReload(250);
      0080C6 4B FA            [ 1]  173 	push	#0xfa
      0080C8 CD 86 A6         [ 4]  174 	call	_IWDG_SetReload
      0080CB 84               [ 1]  175 	pop	a
                                    176 ;	user/main.c: 51: IWDG_ReloadCounter();
      0080CC CD 86 AD         [ 4]  177 	call	_IWDG_ReloadCounter
                                    178 ;	user/main.c: 53: IWDG_Enable();
      0080CF CC 86 B2         [ 2]  179 	jp	_IWDG_Enable
                                    180 ;	user/main.c: 56: void main() 
                                    181 ;	-----------------------------------------
                                    182 ;	 function main
                                    183 ;	-----------------------------------------
      0080D2                        184 _main:
      0080D2 52 05            [ 2]  185 	sub	sp, #5
                                    186 ;	user/main.c: 58: uint8_t hh = 0, mm = 0, ss = 0;
      0080D4 0F 02            [ 1]  187 	clr	(0x02, sp)
      0080D6 0F 03            [ 1]  188 	clr	(0x03, sp)
      0080D8 0F 01            [ 1]  189 	clr	(0x01, sp)
                                    190 ;	user/main.c: 59: CLK_Config();
      0080DA CD 84 82         [ 4]  191 	call	_CLK_Config
                                    192 ;	user/main.c: 62: max7Seg(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 8);
      0080DD 4B 08            [ 1]  193 	push	#0x08
      0080DF 4B 20            [ 1]  194 	push	#0x20
      0080E1 4B 10            [ 1]  195 	push	#0x10
      0080E3 4B 40            [ 1]  196 	push	#0x40
      0080E5 4B 0A            [ 1]  197 	push	#0x0a
      0080E7 4B 50            [ 1]  198 	push	#0x50
      0080E9 CD 81 E3         [ 4]  199 	call	_max7Seg
      0080EC 5B 06            [ 2]  200 	addw	sp, #6
                                    201 ;	user/main.c: 63: Init();
      0080EE CD 82 B7         [ 4]  202 	call	_Init
                                    203 ;	user/main.c: 64: TIMER_Init();
      0080F1 CD 83 56         [ 4]  204 	call	_TIMER_Init
                                    205 ;	user/main.c: 65: IWDG_Config();
      0080F4 CD 80 BA         [ 4]  206 	call	_IWDG_Config
                                    207 ;	user/main.c: 66: enableInterrupts();
      0080F7 9A               [ 1]  208 	rim
                                    209 ;	user/main.c: 67: setIntensity(0x03);
      0080F8 4B 03            [ 1]  210 	push	#0x03
      0080FA CD 83 08         [ 4]  211 	call	_setIntensity
      0080FD 84               [ 1]  212 	pop	a
                                    213 ;	user/main.c: 68: TIMER_InitTime(&tick);
      0080FE AE 00 01         [ 2]  214 	ldw	x, #_tick+0
      008101 1F 04            [ 2]  215 	ldw	(0x04, sp), x
      008103 1E 04            [ 2]  216 	ldw	x, (0x04, sp)
      008105 89               [ 2]  217 	pushw	x
      008106 CD 83 B5         [ 4]  218 	call	_TIMER_InitTime
      008109 85               [ 2]  219 	popw	x
                                    220 ;	user/main.c: 70: send7Seg(DIG7, 0);
      00810A 4B 00            [ 1]  221 	push	#0x00
      00810C 4B 08            [ 1]  222 	push	#0x08
      00810E CD 83 12         [ 4]  223 	call	_send7Seg
      008111 85               [ 2]  224 	popw	x
                                    225 ;	user/main.c: 71: send7Seg(DIG6, 0);
      008112 4B 00            [ 1]  226 	push	#0x00
      008114 4B 07            [ 1]  227 	push	#0x07
      008116 CD 83 12         [ 4]  228 	call	_send7Seg
      008119 85               [ 2]  229 	popw	x
                                    230 ;	user/main.c: 72: send7Seg(DIG5, 10);
      00811A 4B 0A            [ 1]  231 	push	#0x0a
      00811C 4B 06            [ 1]  232 	push	#0x06
      00811E CD 83 12         [ 4]  233 	call	_send7Seg
      008121 85               [ 2]  234 	popw	x
                                    235 ;	user/main.c: 73: send7Seg(DIG4, 0);
      008122 4B 00            [ 1]  236 	push	#0x00
      008124 4B 05            [ 1]  237 	push	#0x05
      008126 CD 83 12         [ 4]  238 	call	_send7Seg
      008129 85               [ 2]  239 	popw	x
                                    240 ;	user/main.c: 74: send7Seg(DIG3, 0);
      00812A 4B 00            [ 1]  241 	push	#0x00
      00812C 4B 04            [ 1]  242 	push	#0x04
      00812E CD 83 12         [ 4]  243 	call	_send7Seg
      008131 85               [ 2]  244 	popw	x
                                    245 ;	user/main.c: 75: send7Seg(DIG2, 10);
      008132 4B 0A            [ 1]  246 	push	#0x0a
      008134 4B 03            [ 1]  247 	push	#0x03
      008136 CD 83 12         [ 4]  248 	call	_send7Seg
      008139 85               [ 2]  249 	popw	x
                                    250 ;	user/main.c: 76: send7Seg(DIG1, 0);
      00813A 4B 00            [ 1]  251 	push	#0x00
      00813C 4B 02            [ 1]  252 	push	#0x02
      00813E CD 83 12         [ 4]  253 	call	_send7Seg
      008141 85               [ 2]  254 	popw	x
                                    255 ;	user/main.c: 77: send7Seg(DIG0, 0);
      008142 4B 00            [ 1]  256 	push	#0x00
      008144 4B 01            [ 1]  257 	push	#0x01
      008146 CD 83 12         [ 4]  258 	call	_send7Seg
      008149 85               [ 2]  259 	popw	x
                                    260 ;	user/main.c: 78: while(TRUE) 
      00814A                        261 00110$:
                                    262 ;	user/main.c: 80: if(TIMER_CheckTimeMS(&tick, 1000) == 0)
      00814A 16 04            [ 2]  263 	ldw	y, (0x04, sp)
      00814C 4B E8            [ 1]  264 	push	#0xe8
      00814E 4B 03            [ 1]  265 	push	#0x03
      008150 5F               [ 1]  266 	clrw	x
      008151 89               [ 2]  267 	pushw	x
      008152 90 89            [ 2]  268 	pushw	y
      008154 CD 84 0C         [ 4]  269 	call	_TIMER_CheckTimeMS
      008157 5B 06            [ 2]  270 	addw	sp, #6
      008159 4D               [ 1]  271 	tnz	a
      00815A 26 EE            [ 1]  272 	jrne	00110$
                                    273 ;	user/main.c: 82: if(++ss >=60)
      00815C 0C 01            [ 1]  274 	inc	(0x01, sp)
      00815E 7B 01            [ 1]  275 	ld	a, (0x01, sp)
      008160 A1 3C            [ 1]  276 	cp	a, #0x3c
      008162 25 16            [ 1]  277 	jrc	00106$
                                    278 ;	user/main.c: 84: ss=0;
      008164 0F 01            [ 1]  279 	clr	(0x01, sp)
                                    280 ;	user/main.c: 85: if(++mm >=60)
      008166 0C 03            [ 1]  281 	inc	(0x03, sp)
      008168 7B 03            [ 1]  282 	ld	a, (0x03, sp)
      00816A A1 3C            [ 1]  283 	cp	a, #0x3c
      00816C 25 0C            [ 1]  284 	jrc	00106$
                                    285 ;	user/main.c: 87: mm=0;
      00816E 0F 03            [ 1]  286 	clr	(0x03, sp)
                                    287 ;	user/main.c: 88: if(++hh >= 24)
      008170 0C 02            [ 1]  288 	inc	(0x02, sp)
      008172 7B 02            [ 1]  289 	ld	a, (0x02, sp)
      008174 A1 18            [ 1]  290 	cp	a, #0x18
      008176 25 02            [ 1]  291 	jrc	00106$
                                    292 ;	user/main.c: 89: hh = 0;
      008178 0F 02            [ 1]  293 	clr	(0x02, sp)
      00817A                        294 00106$:
                                    295 ;	user/main.c: 92: send7Seg(DIG0, ss%10);
      00817A 5F               [ 1]  296 	clrw	x
      00817B 7B 01            [ 1]  297 	ld	a, (0x01, sp)
      00817D 97               [ 1]  298 	ld	xl, a
      00817E A6 0A            [ 1]  299 	ld	a, #0x0a
      008180 62               [ 2]  300 	div	x, a
      008181 88               [ 1]  301 	push	a
      008182 4B 01            [ 1]  302 	push	#0x01
      008184 CD 83 12         [ 4]  303 	call	_send7Seg
      008187 85               [ 2]  304 	popw	x
                                    305 ;	user/main.c: 93: send7Seg(DIG1, ss/10);
      008188 5F               [ 1]  306 	clrw	x
      008189 7B 01            [ 1]  307 	ld	a, (0x01, sp)
      00818B 97               [ 1]  308 	ld	xl, a
      00818C A6 0A            [ 1]  309 	ld	a, #0x0a
      00818E 62               [ 2]  310 	div	x, a
      00818F 9F               [ 1]  311 	ld	a, xl
      008190 88               [ 1]  312 	push	a
      008191 4B 02            [ 1]  313 	push	#0x02
      008193 CD 83 12         [ 4]  314 	call	_send7Seg
      008196 85               [ 2]  315 	popw	x
                                    316 ;	user/main.c: 94: send7Seg(DIG3, mm%10);
      008197 5F               [ 1]  317 	clrw	x
      008198 7B 03            [ 1]  318 	ld	a, (0x03, sp)
      00819A 97               [ 1]  319 	ld	xl, a
      00819B A6 0A            [ 1]  320 	ld	a, #0x0a
      00819D 62               [ 2]  321 	div	x, a
      00819E 88               [ 1]  322 	push	a
      00819F 4B 04            [ 1]  323 	push	#0x04
      0081A1 CD 83 12         [ 4]  324 	call	_send7Seg
      0081A4 85               [ 2]  325 	popw	x
                                    326 ;	user/main.c: 95: send7Seg(DIG4, mm/10);
      0081A5 5F               [ 1]  327 	clrw	x
      0081A6 7B 03            [ 1]  328 	ld	a, (0x03, sp)
      0081A8 97               [ 1]  329 	ld	xl, a
      0081A9 A6 0A            [ 1]  330 	ld	a, #0x0a
      0081AB 62               [ 2]  331 	div	x, a
      0081AC 9F               [ 1]  332 	ld	a, xl
      0081AD 88               [ 1]  333 	push	a
      0081AE 4B 05            [ 1]  334 	push	#0x05
      0081B0 CD 83 12         [ 4]  335 	call	_send7Seg
      0081B3 85               [ 2]  336 	popw	x
                                    337 ;	user/main.c: 96: send7Seg(DIG6, hh%10);
      0081B4 5F               [ 1]  338 	clrw	x
      0081B5 7B 02            [ 1]  339 	ld	a, (0x02, sp)
      0081B7 97               [ 1]  340 	ld	xl, a
      0081B8 A6 0A            [ 1]  341 	ld	a, #0x0a
      0081BA 62               [ 2]  342 	div	x, a
      0081BB 88               [ 1]  343 	push	a
      0081BC 4B 07            [ 1]  344 	push	#0x07
      0081BE CD 83 12         [ 4]  345 	call	_send7Seg
      0081C1 85               [ 2]  346 	popw	x
                                    347 ;	user/main.c: 97: send7Seg(DIG7, hh/10);
      0081C2 5F               [ 1]  348 	clrw	x
      0081C3 7B 02            [ 1]  349 	ld	a, (0x02, sp)
      0081C5 97               [ 1]  350 	ld	xl, a
      0081C6 A6 0A            [ 1]  351 	ld	a, #0x0a
      0081C8 62               [ 2]  352 	div	x, a
      0081C9 9F               [ 1]  353 	ld	a, xl
      0081CA 88               [ 1]  354 	push	a
      0081CB 4B 08            [ 1]  355 	push	#0x08
      0081CD CD 83 12         [ 4]  356 	call	_send7Seg
      0081D0 85               [ 2]  357 	popw	x
      0081D1 CC 81 4A         [ 2]  358 	jp	00110$
      0081D4 5B 05            [ 2]  359 	addw	sp, #5
      0081D6 81               [ 4]  360 	ret
                                    361 	.area CODE
                                    362 	.area INITIALIZER
                                    363 	.area CABS (ABS)
