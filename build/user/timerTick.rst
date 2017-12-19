                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module timerTick
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_ClearFlag
                                     12 	.globl _TIM4_GetCounter
                                     13 	.globl _TIM4_ITConfig
                                     14 	.globl _TIM4_Cmd
                                     15 	.globl _TIM4_TimeBaseInit
                                     16 	.globl _TIM4_DeInit
                                     17 	.globl _CLK_PeripheralClockConfig
                                     18 	.globl _timeTickUs
                                     19 	.globl _timeTickMs
                                     20 	.globl _timeBack
                                     21 	.globl _timeGet
                                     22 	.globl _TIMER_Init
                                     23 	.globl _TIMER_Inc
                                     24 	.globl _TIMER_InitTime
                                     25 	.globl _TIMER_CheckTimeUS
                                     26 	.globl _TIMER_CheckTimeMS
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DATA
      000015                         31 _timeGet::
      000015                         32 	.ds 2
      000017                         33 _timeBack::
      000017                         34 	.ds 2
      000019                         35 _timeTickMs::
      000019                         36 	.ds 4
      00001D                         37 _timeTickUs::
      00001D                         38 	.ds 1
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area INITIALIZED
                                     43 ;--------------------------------------------------------
                                     44 ; absolute external ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area DABS (ABS)
                                     47 ;--------------------------------------------------------
                                     48 ; global & static initialisations
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area GSINIT
                                     54 ;--------------------------------------------------------
                                     55 ; Home
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area HOME
                                     59 ;--------------------------------------------------------
                                     60 ; code
                                     61 ;--------------------------------------------------------
                                     62 	.area CODE
                                     63 ;	user/timerTick.c: 18: void TIMER_Init(void)
                                     64 ;	-----------------------------------------
                                     65 ;	 function TIMER_Init
                                     66 ;	-----------------------------------------
      008356                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 20: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      008356 4B 01            [ 1]   69 	push	#0x01
      008358 4B 04            [ 1]   70 	push	#0x04
      00835A CD 84 D3         [ 4]   71 	call	_CLK_PeripheralClockConfig
      00835D 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 21: TIM4_DeInit(); 
      00835E CD 88 33         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 23: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      008361 4B C8            [ 1]   76 	push	#0xc8
      008363 4B 04            [ 1]   77 	push	#0x04
      008365 CD 88 4C         [ 4]   78 	call	_TIM4_TimeBaseInit
      008368 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      008369 4B 01            [ 1]   81 	push	#0x01
      00836B CD 88 7C         [ 4]   82 	call	_TIM4_ClearFlag
      00836E 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 25: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      00836F 4B 01            [ 1]   85 	push	#0x01
      008371 4B 01            [ 1]   86 	push	#0x01
      008373 CD 88 5E         [ 4]   87 	call	_TIM4_ITConfig
      008376 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 26: TIM4_Cmd(ENABLE);    // Enable TIM4 
      008377 4B 01            [ 1]   90 	push	#0x01
      008379 CD 88 59         [ 4]   91 	call	_TIM4_Cmd
      00837C 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 27: timeTickMs = 0;
      00837D 5F               [ 1]   94 	clrw	x
      00837E CF 00 1B         [ 2]   95 	ldw	_timeTickMs+2, x
      008381 CF 00 19         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 28: timeTickUs = 0;
      008384 72 5F 00 1D      [ 1]   98 	clr	_timeTickUs+0
      008388 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 31: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      008389                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 33: timeTickUs++;
      008389 72 5C 00 1D      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 34: if(timeTickUs%5 == 0){
      00838D 5F               [ 1]  108 	clrw	x
      00838E C6 00 1D         [ 1]  109 	ld	a, _timeTickUs+0
      008391 97               [ 1]  110 	ld	xl, a
      008392 A6 05            [ 1]  111 	ld	a, #0x05
      008394 62               [ 2]  112 	div	x, a
      008395 4D               [ 1]  113 	tnz	a
      008396 27 01            [ 1]  114 	jreq	00109$
      008398 81               [ 4]  115 	ret
      008399                        116 00109$:
                                    117 ;	user/timerTick.c: 35: timeTickMs++;
      008399 CE 00 1B         [ 2]  118 	ldw	x, _timeTickMs+2
      00839C 1C 00 01         [ 2]  119 	addw	x, #0x0001
      00839F C6 00 1A         [ 1]  120 	ld	a, _timeTickMs+1
      0083A2 A9 00            [ 1]  121 	adc	a, #0x00
      0083A4 90 97            [ 1]  122 	ld	yl, a
      0083A6 C6 00 19         [ 1]  123 	ld	a, _timeTickMs+0
      0083A9 A9 00            [ 1]  124 	adc	a, #0x00
      0083AB 90 95            [ 1]  125 	ld	yh, a
      0083AD CF 00 1B         [ 2]  126 	ldw	_timeTickMs+2, x
      0083B0 90 CF 00 19      [ 2]  127 	ldw	_timeTickMs+0, y
      0083B4 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 39: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      0083B5                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 41: pTime->timeMS = timeTickMs;
      0083B5 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      0083B7 5C               [ 2]  136 	incw	x
      0083B8 5C               [ 2]  137 	incw	x
      0083B9 90 CE 00 1B      [ 2]  138 	ldw	y, _timeTickMs+2
      0083BD EF 02            [ 2]  139 	ldw	(0x2, x), y
      0083BF 90 CE 00 19      [ 2]  140 	ldw	y, _timeTickMs+0
      0083C3 FF               [ 2]  141 	ldw	(x), y
      0083C4 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 44: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      0083C5                        147 _TIMER_CheckTimeUS:
      0083C5 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 46: timeGet = TIM4_GetCounter();
      0083C7 CD 88 69         [ 4]  150 	call	_TIM4_GetCounter
      0083CA 5F               [ 1]  151 	clrw	x
      0083CB 97               [ 1]  152 	ld	xl, a
      0083CC CF 00 15         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 47: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      0083CF 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      0083D1 17 03            [ 2]  156 	ldw	(0x03, sp), y
      0083D3 1E 03            [ 2]  157 	ldw	x, (0x03, sp)
      0083D5 FE               [ 2]  158 	ldw	x, (x)
      0083D6 1F 01            [ 2]  159 	ldw	(0x01, sp), x
      0083D8 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      0083DA C3 00 15         [ 2]  161 	cpw	x, _timeGet+0
      0083DD 24 0A            [ 1]  162 	jrnc	00105$
      0083DF CE 00 15         [ 2]  163 	ldw	x, _timeGet+0
      0083E2 72 F0 01         [ 2]  164 	subw	x, (0x01, sp)
      0083E5 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      0083E7 24 14            [ 1]  166 	jrnc	00101$
      0083E9                        167 00105$:
      0083E9 1E 01            [ 2]  168 	ldw	x, (0x01, sp)
      0083EB C3 00 15         [ 2]  169 	cpw	x, _timeGet+0
      0083EE 23 17            [ 2]  170 	jrule	00102$
      0083F0 CE 00 15         [ 2]  171 	ldw	x, _timeGet+0
      0083F3 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      0083F6 72 F0 01         [ 2]  173 	subw	x, (0x01, sp)
      0083F9 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      0083FB 25 0A            [ 1]  175 	jrc	00102$
      0083FD                        176 00101$:
                                    177 ;	user/timerTick.c: 48: pTime->timeUS = timeGet;
      0083FD 1E 03            [ 2]  178 	ldw	x, (0x03, sp)
      0083FF 90 CE 00 15      [ 2]  179 	ldw	y, _timeGet+0
      008403 FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 49: return 0;
      008404 4F               [ 1]  182 	clr	a
      008405 20 02            [ 2]  183 	jra	00106$
      008407                        184 00102$:
                                    185 ;	user/timerTick.c: 51: return 1;
      008407 A6 01            [ 1]  186 	ld	a, #0x01
      008409                        187 00106$:
      008409 5B 04            [ 2]  188 	addw	sp, #4
      00840B 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 54: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      00840C                        194 _TIMER_CheckTimeMS:
      00840C 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 56: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      00840E 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      008410 5C               [ 2]  198 	incw	x
      008411 5C               [ 2]  199 	incw	x
      008412 1F 05            [ 2]  200 	ldw	(0x05, sp), x
      008414 1E 05            [ 2]  201 	ldw	x, (0x05, sp)
      008416 E6 03            [ 1]  202 	ld	a, (0x3, x)
      008418 6B 0A            [ 1]  203 	ld	(0x0a, sp), a
      00841A E6 02            [ 1]  204 	ld	a, (0x2, x)
      00841C 6B 09            [ 1]  205 	ld	(0x09, sp), a
      00841E FE               [ 2]  206 	ldw	x, (x)
      00841F 1F 07            [ 2]  207 	ldw	(0x07, sp), x
      008421 CE 00 1B         [ 2]  208 	ldw	x, _timeTickMs+2
      008424 72 F0 09         [ 2]  209 	subw	x, (0x09, sp)
      008427 C6 00 1A         [ 1]  210 	ld	a, _timeTickMs+1
      00842A 12 08            [ 1]  211 	sbc	a, (0x08, sp)
      00842C 88               [ 1]  212 	push	a
      00842D C6 00 19         [ 1]  213 	ld	a, _timeTickMs+0
      008430 12 08            [ 1]  214 	sbc	a, (0x08, sp)
      008432 6B 02            [ 1]  215 	ld	(0x02, sp), a
      008434 84               [ 1]  216 	pop	a
      008435 88               [ 1]  217 	push	a
      008436 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      008438 84               [ 1]  219 	pop	a
      008439 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      00843B 7B 01            [ 1]  221 	ld	a, (0x01, sp)
      00843D 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      00843F 4F               [ 1]  223 	clr	a
      008440 49               [ 1]  224 	rlc	a
      008441 6B 0B            [ 1]  225 	ld	(0x0b, sp), a
      008443 1E 09            [ 2]  226 	ldw	x, (0x09, sp)
      008445 C3 00 1B         [ 2]  227 	cpw	x, _timeTickMs+2
      008448 7B 08            [ 1]  228 	ld	a, (0x08, sp)
      00844A C2 00 1A         [ 1]  229 	sbc	a, _timeTickMs+1
      00844D 7B 07            [ 1]  230 	ld	a, (0x07, sp)
      00844F C2 00 19         [ 1]  231 	sbc	a, _timeTickMs+0
      008452 24 04            [ 1]  232 	jrnc	00105$
      008454 0D 0B            [ 1]  233 	tnz	(0x0b, sp)
      008456 27 15            [ 1]  234 	jreq	00101$
      008458                        235 00105$:
      008458 CE 00 1B         [ 2]  236 	ldw	x, _timeTickMs+2
      00845B 13 09            [ 2]  237 	cpw	x, (0x09, sp)
      00845D C6 00 1A         [ 1]  238 	ld	a, _timeTickMs+1
      008460 12 08            [ 1]  239 	sbc	a, (0x08, sp)
      008462 C6 00 19         [ 1]  240 	ld	a, _timeTickMs+0
      008465 12 07            [ 1]  241 	sbc	a, (0x07, sp)
      008467 24 14            [ 1]  242 	jrnc	00102$
      008469 0D 0B            [ 1]  243 	tnz	(0x0b, sp)
      00846B 26 10            [ 1]  244 	jrne	00102$
      00846D                        245 00101$:
                                    246 ;	user/timerTick.c: 57: pTime->timeMS = timeTickMs;
      00846D 1E 05            [ 2]  247 	ldw	x, (0x05, sp)
      00846F 90 CE 00 1B      [ 2]  248 	ldw	y, _timeTickMs+2
      008473 EF 02            [ 2]  249 	ldw	(0x2, x), y
      008475 90 CE 00 19      [ 2]  250 	ldw	y, _timeTickMs+0
      008479 FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 58: return 0;
      00847A 4F               [ 1]  253 	clr	a
      00847B 20 02            [ 2]  254 	jra	00106$
      00847D                        255 00102$:
                                    256 ;	user/timerTick.c: 60: return 1;
      00847D A6 01            [ 1]  257 	ld	a, #0x01
      00847F                        258 00106$:
      00847F 5B 0B            [ 2]  259 	addw	sp, #11
      008481 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
