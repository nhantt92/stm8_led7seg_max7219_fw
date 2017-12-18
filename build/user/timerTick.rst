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
      00000F                         31 _timeGet::
      00000F                         32 	.ds 2
      000011                         33 _timeBack::
      000011                         34 	.ds 2
      000013                         35 _timeTickMs::
      000013                         36 	.ds 4
      000017                         37 _timeTickUs::
      000017                         38 	.ds 1
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
      0082FD                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 20: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      0082FD 4B 01            [ 1]   69 	push	#0x01
      0082FF 4B 04            [ 1]   70 	push	#0x04
      008301 CD 84 7A         [ 4]   71 	call	_CLK_PeripheralClockConfig
      008304 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 21: TIM4_DeInit(); 
      008305 CD 87 DA         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 23: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      008308 4B C8            [ 1]   76 	push	#0xc8
      00830A 4B 04            [ 1]   77 	push	#0x04
      00830C CD 87 F3         [ 4]   78 	call	_TIM4_TimeBaseInit
      00830F 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      008310 4B 01            [ 1]   81 	push	#0x01
      008312 CD 88 23         [ 4]   82 	call	_TIM4_ClearFlag
      008315 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 25: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      008316 4B 01            [ 1]   85 	push	#0x01
      008318 4B 01            [ 1]   86 	push	#0x01
      00831A CD 88 05         [ 4]   87 	call	_TIM4_ITConfig
      00831D 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 26: TIM4_Cmd(ENABLE);    // Enable TIM4 
      00831E 4B 01            [ 1]   90 	push	#0x01
      008320 CD 88 00         [ 4]   91 	call	_TIM4_Cmd
      008323 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 27: timeTickMs = 0;
      008324 5F               [ 1]   94 	clrw	x
      008325 CF 00 15         [ 2]   95 	ldw	_timeTickMs+2, x
      008328 CF 00 13         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 28: timeTickUs = 0;
      00832B 72 5F 00 17      [ 1]   98 	clr	_timeTickUs+0
      00832F 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 31: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      008330                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 33: timeTickUs++;
      008330 72 5C 00 17      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 34: if(timeTickUs%5 == 0){
      008334 5F               [ 1]  108 	clrw	x
      008335 C6 00 17         [ 1]  109 	ld	a, _timeTickUs+0
      008338 97               [ 1]  110 	ld	xl, a
      008339 A6 05            [ 1]  111 	ld	a, #0x05
      00833B 62               [ 2]  112 	div	x, a
      00833C 4D               [ 1]  113 	tnz	a
      00833D 27 01            [ 1]  114 	jreq	00109$
      00833F 81               [ 4]  115 	ret
      008340                        116 00109$:
                                    117 ;	user/timerTick.c: 35: timeTickMs++;
      008340 CE 00 15         [ 2]  118 	ldw	x, _timeTickMs+2
      008343 1C 00 01         [ 2]  119 	addw	x, #0x0001
      008346 C6 00 14         [ 1]  120 	ld	a, _timeTickMs+1
      008349 A9 00            [ 1]  121 	adc	a, #0x00
      00834B 90 97            [ 1]  122 	ld	yl, a
      00834D C6 00 13         [ 1]  123 	ld	a, _timeTickMs+0
      008350 A9 00            [ 1]  124 	adc	a, #0x00
      008352 90 95            [ 1]  125 	ld	yh, a
      008354 CF 00 15         [ 2]  126 	ldw	_timeTickMs+2, x
      008357 90 CF 00 13      [ 2]  127 	ldw	_timeTickMs+0, y
      00835B 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 39: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      00835C                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 41: pTime->timeMS = timeTickMs;
      00835C 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      00835E 5C               [ 2]  136 	incw	x
      00835F 5C               [ 2]  137 	incw	x
      008360 90 CE 00 15      [ 2]  138 	ldw	y, _timeTickMs+2
      008364 EF 02            [ 2]  139 	ldw	(0x2, x), y
      008366 90 CE 00 13      [ 2]  140 	ldw	y, _timeTickMs+0
      00836A FF               [ 2]  141 	ldw	(x), y
      00836B 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 44: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      00836C                        147 _TIMER_CheckTimeUS:
      00836C 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 46: timeGet = TIM4_GetCounter();
      00836E CD 88 10         [ 4]  150 	call	_TIM4_GetCounter
      008371 5F               [ 1]  151 	clrw	x
      008372 97               [ 1]  152 	ld	xl, a
      008373 CF 00 0F         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 47: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      008376 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      008378 17 03            [ 2]  156 	ldw	(0x03, sp), y
      00837A 1E 03            [ 2]  157 	ldw	x, (0x03, sp)
      00837C FE               [ 2]  158 	ldw	x, (x)
      00837D 1F 01            [ 2]  159 	ldw	(0x01, sp), x
      00837F 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      008381 C3 00 0F         [ 2]  161 	cpw	x, _timeGet+0
      008384 24 0A            [ 1]  162 	jrnc	00105$
      008386 CE 00 0F         [ 2]  163 	ldw	x, _timeGet+0
      008389 72 F0 01         [ 2]  164 	subw	x, (0x01, sp)
      00838C 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      00838E 24 14            [ 1]  166 	jrnc	00101$
      008390                        167 00105$:
      008390 1E 01            [ 2]  168 	ldw	x, (0x01, sp)
      008392 C3 00 0F         [ 2]  169 	cpw	x, _timeGet+0
      008395 23 17            [ 2]  170 	jrule	00102$
      008397 CE 00 0F         [ 2]  171 	ldw	x, _timeGet+0
      00839A 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      00839D 72 F0 01         [ 2]  173 	subw	x, (0x01, sp)
      0083A0 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      0083A2 25 0A            [ 1]  175 	jrc	00102$
      0083A4                        176 00101$:
                                    177 ;	user/timerTick.c: 48: pTime->timeUS = timeGet;
      0083A4 1E 03            [ 2]  178 	ldw	x, (0x03, sp)
      0083A6 90 CE 00 0F      [ 2]  179 	ldw	y, _timeGet+0
      0083AA FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 49: return 0;
      0083AB 4F               [ 1]  182 	clr	a
      0083AC 20 02            [ 2]  183 	jra	00106$
      0083AE                        184 00102$:
                                    185 ;	user/timerTick.c: 51: return 1;
      0083AE A6 01            [ 1]  186 	ld	a, #0x01
      0083B0                        187 00106$:
      0083B0 5B 04            [ 2]  188 	addw	sp, #4
      0083B2 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 54: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      0083B3                        194 _TIMER_CheckTimeMS:
      0083B3 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 56: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      0083B5 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      0083B7 5C               [ 2]  198 	incw	x
      0083B8 5C               [ 2]  199 	incw	x
      0083B9 1F 05            [ 2]  200 	ldw	(0x05, sp), x
      0083BB 1E 05            [ 2]  201 	ldw	x, (0x05, sp)
      0083BD E6 03            [ 1]  202 	ld	a, (0x3, x)
      0083BF 6B 0A            [ 1]  203 	ld	(0x0a, sp), a
      0083C1 E6 02            [ 1]  204 	ld	a, (0x2, x)
      0083C3 6B 09            [ 1]  205 	ld	(0x09, sp), a
      0083C5 FE               [ 2]  206 	ldw	x, (x)
      0083C6 1F 07            [ 2]  207 	ldw	(0x07, sp), x
      0083C8 CE 00 15         [ 2]  208 	ldw	x, _timeTickMs+2
      0083CB 72 F0 09         [ 2]  209 	subw	x, (0x09, sp)
      0083CE C6 00 14         [ 1]  210 	ld	a, _timeTickMs+1
      0083D1 12 08            [ 1]  211 	sbc	a, (0x08, sp)
      0083D3 88               [ 1]  212 	push	a
      0083D4 C6 00 13         [ 1]  213 	ld	a, _timeTickMs+0
      0083D7 12 08            [ 1]  214 	sbc	a, (0x08, sp)
      0083D9 6B 02            [ 1]  215 	ld	(0x02, sp), a
      0083DB 84               [ 1]  216 	pop	a
      0083DC 88               [ 1]  217 	push	a
      0083DD 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      0083DF 84               [ 1]  219 	pop	a
      0083E0 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      0083E2 7B 01            [ 1]  221 	ld	a, (0x01, sp)
      0083E4 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      0083E6 4F               [ 1]  223 	clr	a
      0083E7 49               [ 1]  224 	rlc	a
      0083E8 6B 0B            [ 1]  225 	ld	(0x0b, sp), a
      0083EA 1E 09            [ 2]  226 	ldw	x, (0x09, sp)
      0083EC C3 00 15         [ 2]  227 	cpw	x, _timeTickMs+2
      0083EF 7B 08            [ 1]  228 	ld	a, (0x08, sp)
      0083F1 C2 00 14         [ 1]  229 	sbc	a, _timeTickMs+1
      0083F4 7B 07            [ 1]  230 	ld	a, (0x07, sp)
      0083F6 C2 00 13         [ 1]  231 	sbc	a, _timeTickMs+0
      0083F9 24 04            [ 1]  232 	jrnc	00105$
      0083FB 0D 0B            [ 1]  233 	tnz	(0x0b, sp)
      0083FD 27 15            [ 1]  234 	jreq	00101$
      0083FF                        235 00105$:
      0083FF CE 00 15         [ 2]  236 	ldw	x, _timeTickMs+2
      008402 13 09            [ 2]  237 	cpw	x, (0x09, sp)
      008404 C6 00 14         [ 1]  238 	ld	a, _timeTickMs+1
      008407 12 08            [ 1]  239 	sbc	a, (0x08, sp)
      008409 C6 00 13         [ 1]  240 	ld	a, _timeTickMs+0
      00840C 12 07            [ 1]  241 	sbc	a, (0x07, sp)
      00840E 24 14            [ 1]  242 	jrnc	00102$
      008410 0D 0B            [ 1]  243 	tnz	(0x0b, sp)
      008412 26 10            [ 1]  244 	jrne	00102$
      008414                        245 00101$:
                                    246 ;	user/timerTick.c: 57: pTime->timeMS = timeTickMs;
      008414 1E 05            [ 2]  247 	ldw	x, (0x05, sp)
      008416 90 CE 00 15      [ 2]  248 	ldw	y, _timeTickMs+2
      00841A EF 02            [ 2]  249 	ldw	(0x2, x), y
      00841C 90 CE 00 13      [ 2]  250 	ldw	y, _timeTickMs+0
      008420 FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 58: return 0;
      008421 4F               [ 1]  253 	clr	a
      008422 20 02            [ 2]  254 	jra	00106$
      008424                        255 00102$:
                                    256 ;	user/timerTick.c: 60: return 1;
      008424 A6 01            [ 1]  257 	ld	a, #0x01
      008426                        258 00106$:
      008426 5B 0B            [ 2]  259 	addw	sp, #11
      008428 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
