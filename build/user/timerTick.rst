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
      009047                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 20: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      009047 4B 01            [ 1]   69 	push	#0x01
      009049 4B 04            [ 1]   70 	push	#0x04
      00904B CD 92 25         [ 4]   71 	call	_CLK_PeripheralClockConfig
      00904E 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 21: TIM4_DeInit(); 
      00904F CD 9A BD         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 23: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      009052 4B C8            [ 1]   76 	push	#0xc8
      009054 4B 04            [ 1]   77 	push	#0x04
      009056 CD 9A D6         [ 4]   78 	call	_TIM4_TimeBaseInit
      009059 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      00905A 4B 01            [ 1]   81 	push	#0x01
      00905C CD 9B 06         [ 4]   82 	call	_TIM4_ClearFlag
      00905F 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 25: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      009060 4B 01            [ 1]   85 	push	#0x01
      009062 4B 01            [ 1]   86 	push	#0x01
      009064 CD 9A E8         [ 4]   87 	call	_TIM4_ITConfig
      009067 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 26: TIM4_Cmd(ENABLE);    // Enable TIM4 
      009068 4B 01            [ 1]   90 	push	#0x01
      00906A CD 9A E3         [ 4]   91 	call	_TIM4_Cmd
      00906D 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 27: timeTickMs = 0;
      00906E 5F               [ 1]   94 	clrw	x
      00906F CF 00 1B         [ 2]   95 	ldw	_timeTickMs+2, x
      009072 CF 00 19         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 28: timeTickUs = 0;
      009075 72 5F 00 1D      [ 1]   98 	clr	_timeTickUs+0
      009079 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 31: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      00907A                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 33: timeTickUs++;
      00907A 72 5C 00 1D      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 34: if(timeTickUs%5 == 0){
      00907E 5F               [ 1]  108 	clrw	x
      00907F C6 00 1D         [ 1]  109 	ld	a, _timeTickUs+0
      009082 97               [ 1]  110 	ld	xl, a
      009083 A6 05            [ 1]  111 	ld	a, #0x05
      009085 62               [ 2]  112 	div	x, a
      009086 4D               [ 1]  113 	tnz	a
      009087 27 01            [ 1]  114 	jreq	00109$
      009089 81               [ 4]  115 	ret
      00908A                        116 00109$:
                                    117 ;	user/timerTick.c: 35: timeTickMs++;
      00908A CE 00 1B         [ 2]  118 	ldw	x, _timeTickMs+2
      00908D 1C 00 01         [ 2]  119 	addw	x, #0x0001
      009090 C6 00 1A         [ 1]  120 	ld	a, _timeTickMs+1
      009093 A9 00            [ 1]  121 	adc	a, #0x00
      009095 90 97            [ 1]  122 	ld	yl, a
      009097 C6 00 19         [ 1]  123 	ld	a, _timeTickMs+0
      00909A A9 00            [ 1]  124 	adc	a, #0x00
      00909C 90 95            [ 1]  125 	ld	yh, a
      00909E CF 00 1B         [ 2]  126 	ldw	_timeTickMs+2, x
      0090A1 90 CF 00 19      [ 2]  127 	ldw	_timeTickMs+0, y
      0090A5 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 39: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      0090A6                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 41: pTime->timeMS = timeTickMs;
      0090A6 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      0090A8 5C               [ 2]  136 	incw	x
      0090A9 5C               [ 2]  137 	incw	x
      0090AA 90 CE 00 1B      [ 2]  138 	ldw	y, _timeTickMs+2
      0090AE EF 02            [ 2]  139 	ldw	(0x2, x), y
      0090B0 90 CE 00 19      [ 2]  140 	ldw	y, _timeTickMs+0
      0090B4 FF               [ 2]  141 	ldw	(x), y
      0090B5 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 44: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      0090B6                        147 _TIMER_CheckTimeUS:
      0090B6 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 46: timeGet = TIM4_GetCounter();
      0090B8 CD 9A F3         [ 4]  150 	call	_TIM4_GetCounter
      0090BB 5F               [ 1]  151 	clrw	x
      0090BC 97               [ 1]  152 	ld	xl, a
      0090BD CF 00 15         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 47: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      0090C0 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      0090C2 17 03            [ 2]  156 	ldw	(0x03, sp), y
      0090C4 1E 03            [ 2]  157 	ldw	x, (0x03, sp)
      0090C6 FE               [ 2]  158 	ldw	x, (x)
      0090C7 1F 01            [ 2]  159 	ldw	(0x01, sp), x
      0090C9 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      0090CB C3 00 15         [ 2]  161 	cpw	x, _timeGet+0
      0090CE 24 0A            [ 1]  162 	jrnc	00105$
      0090D0 CE 00 15         [ 2]  163 	ldw	x, _timeGet+0
      0090D3 72 F0 01         [ 2]  164 	subw	x, (0x01, sp)
      0090D6 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      0090D8 24 14            [ 1]  166 	jrnc	00101$
      0090DA                        167 00105$:
      0090DA 1E 01            [ 2]  168 	ldw	x, (0x01, sp)
      0090DC C3 00 15         [ 2]  169 	cpw	x, _timeGet+0
      0090DF 23 17            [ 2]  170 	jrule	00102$
      0090E1 CE 00 15         [ 2]  171 	ldw	x, _timeGet+0
      0090E4 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      0090E7 72 F0 01         [ 2]  173 	subw	x, (0x01, sp)
      0090EA 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      0090EC 25 0A            [ 1]  175 	jrc	00102$
      0090EE                        176 00101$:
                                    177 ;	user/timerTick.c: 48: pTime->timeUS = timeGet;
      0090EE 1E 03            [ 2]  178 	ldw	x, (0x03, sp)
      0090F0 90 CE 00 15      [ 2]  179 	ldw	y, _timeGet+0
      0090F4 FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 49: return 0;
      0090F5 4F               [ 1]  182 	clr	a
      0090F6 20 02            [ 2]  183 	jra	00106$
      0090F8                        184 00102$:
                                    185 ;	user/timerTick.c: 51: return 1;
      0090F8 A6 01            [ 1]  186 	ld	a, #0x01
      0090FA                        187 00106$:
      0090FA 5B 04            [ 2]  188 	addw	sp, #4
      0090FC 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 54: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      0090FD                        194 _TIMER_CheckTimeMS:
      0090FD 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 56: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      0090FF 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      009101 5C               [ 2]  198 	incw	x
      009102 5C               [ 2]  199 	incw	x
      009103 1F 02            [ 2]  200 	ldw	(0x02, sp), x
      009105 1E 02            [ 2]  201 	ldw	x, (0x02, sp)
      009107 E6 03            [ 1]  202 	ld	a, (0x3, x)
      009109 6B 0B            [ 1]  203 	ld	(0x0b, sp), a
      00910B E6 02            [ 1]  204 	ld	a, (0x2, x)
      00910D 6B 0A            [ 1]  205 	ld	(0x0a, sp), a
      00910F FE               [ 2]  206 	ldw	x, (x)
      009110 1F 08            [ 2]  207 	ldw	(0x08, sp), x
      009112 CE 00 1B         [ 2]  208 	ldw	x, _timeTickMs+2
      009115 72 F0 0A         [ 2]  209 	subw	x, (0x0a, sp)
      009118 C6 00 1A         [ 1]  210 	ld	a, _timeTickMs+1
      00911B 12 09            [ 1]  211 	sbc	a, (0x09, sp)
      00911D 88               [ 1]  212 	push	a
      00911E C6 00 19         [ 1]  213 	ld	a, _timeTickMs+0
      009121 12 09            [ 1]  214 	sbc	a, (0x09, sp)
      009123 6B 05            [ 1]  215 	ld	(0x05, sp), a
      009125 84               [ 1]  216 	pop	a
      009126 88               [ 1]  217 	push	a
      009127 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      009129 84               [ 1]  219 	pop	a
      00912A 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      00912C 7B 04            [ 1]  221 	ld	a, (0x04, sp)
      00912E 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      009130 4F               [ 1]  223 	clr	a
      009131 49               [ 1]  224 	rlc	a
      009132 6B 01            [ 1]  225 	ld	(0x01, sp), a
      009134 1E 0A            [ 2]  226 	ldw	x, (0x0a, sp)
      009136 C3 00 1B         [ 2]  227 	cpw	x, _timeTickMs+2
      009139 7B 09            [ 1]  228 	ld	a, (0x09, sp)
      00913B C2 00 1A         [ 1]  229 	sbc	a, _timeTickMs+1
      00913E 7B 08            [ 1]  230 	ld	a, (0x08, sp)
      009140 C2 00 19         [ 1]  231 	sbc	a, _timeTickMs+0
      009143 24 04            [ 1]  232 	jrnc	00105$
      009145 0D 01            [ 1]  233 	tnz	(0x01, sp)
      009147 27 15            [ 1]  234 	jreq	00101$
      009149                        235 00105$:
      009149 CE 00 1B         [ 2]  236 	ldw	x, _timeTickMs+2
      00914C 13 0A            [ 2]  237 	cpw	x, (0x0a, sp)
      00914E C6 00 1A         [ 1]  238 	ld	a, _timeTickMs+1
      009151 12 09            [ 1]  239 	sbc	a, (0x09, sp)
      009153 C6 00 19         [ 1]  240 	ld	a, _timeTickMs+0
      009156 12 08            [ 1]  241 	sbc	a, (0x08, sp)
      009158 24 14            [ 1]  242 	jrnc	00102$
      00915A 0D 01            [ 1]  243 	tnz	(0x01, sp)
      00915C 26 10            [ 1]  244 	jrne	00102$
      00915E                        245 00101$:
                                    246 ;	user/timerTick.c: 57: pTime->timeMS = timeTickMs;
      00915E 1E 02            [ 2]  247 	ldw	x, (0x02, sp)
      009160 90 CE 00 1B      [ 2]  248 	ldw	y, _timeTickMs+2
      009164 EF 02            [ 2]  249 	ldw	(0x2, x), y
      009166 90 CE 00 19      [ 2]  250 	ldw	y, _timeTickMs+0
      00916A FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 58: return 0;
      00916B 4F               [ 1]  253 	clr	a
      00916C 20 02            [ 2]  254 	jra	00106$
      00916E                        255 00102$:
                                    256 ;	user/timerTick.c: 60: return 1;
      00916E A6 01            [ 1]  257 	ld	a, #0x01
      009170                        258 00106$:
      009170 5B 0B            [ 2]  259 	addw	sp, #11
      009172 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
