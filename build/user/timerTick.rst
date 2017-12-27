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
      008D44                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 20: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      008D44 4B 01            [ 1]   69 	push	#0x01
      008D46 4B 04            [ 1]   70 	push	#0x04
      008D48 CD 8F 22         [ 4]   71 	call	_CLK_PeripheralClockConfig
      008D4B 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 21: TIM4_DeInit(); 
      008D4C CD 97 BA         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 23: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      008D4F 4B C8            [ 1]   76 	push	#0xc8
      008D51 4B 04            [ 1]   77 	push	#0x04
      008D53 CD 97 D3         [ 4]   78 	call	_TIM4_TimeBaseInit
      008D56 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      008D57 4B 01            [ 1]   81 	push	#0x01
      008D59 CD 98 03         [ 4]   82 	call	_TIM4_ClearFlag
      008D5C 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 25: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      008D5D 4B 01            [ 1]   85 	push	#0x01
      008D5F 4B 01            [ 1]   86 	push	#0x01
      008D61 CD 97 E5         [ 4]   87 	call	_TIM4_ITConfig
      008D64 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 26: TIM4_Cmd(ENABLE);    // Enable TIM4 
      008D65 4B 01            [ 1]   90 	push	#0x01
      008D67 CD 97 E0         [ 4]   91 	call	_TIM4_Cmd
      008D6A 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 27: timeTickMs = 0;
      008D6B 5F               [ 1]   94 	clrw	x
      008D6C CF 00 1B         [ 2]   95 	ldw	_timeTickMs+2, x
      008D6F CF 00 19         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 28: timeTickUs = 0;
      008D72 72 5F 00 1D      [ 1]   98 	clr	_timeTickUs+0
      008D76 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 31: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      008D77                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 33: timeTickUs++;
      008D77 72 5C 00 1D      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 34: if(timeTickUs%5 == 0){
      008D7B 5F               [ 1]  108 	clrw	x
      008D7C C6 00 1D         [ 1]  109 	ld	a, _timeTickUs+0
      008D7F 97               [ 1]  110 	ld	xl, a
      008D80 A6 05            [ 1]  111 	ld	a, #0x05
      008D82 62               [ 2]  112 	div	x, a
      008D83 4D               [ 1]  113 	tnz	a
      008D84 27 01            [ 1]  114 	jreq	00109$
      008D86 81               [ 4]  115 	ret
      008D87                        116 00109$:
                                    117 ;	user/timerTick.c: 35: timeTickMs++;
      008D87 CE 00 1B         [ 2]  118 	ldw	x, _timeTickMs+2
      008D8A 1C 00 01         [ 2]  119 	addw	x, #0x0001
      008D8D C6 00 1A         [ 1]  120 	ld	a, _timeTickMs+1
      008D90 A9 00            [ 1]  121 	adc	a, #0x00
      008D92 90 97            [ 1]  122 	ld	yl, a
      008D94 C6 00 19         [ 1]  123 	ld	a, _timeTickMs+0
      008D97 A9 00            [ 1]  124 	adc	a, #0x00
      008D99 90 95            [ 1]  125 	ld	yh, a
      008D9B CF 00 1B         [ 2]  126 	ldw	_timeTickMs+2, x
      008D9E 90 CF 00 19      [ 2]  127 	ldw	_timeTickMs+0, y
      008DA2 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 39: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      008DA3                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 41: pTime->timeMS = timeTickMs;
      008DA3 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      008DA5 5C               [ 2]  136 	incw	x
      008DA6 5C               [ 2]  137 	incw	x
      008DA7 90 CE 00 1B      [ 2]  138 	ldw	y, _timeTickMs+2
      008DAB EF 02            [ 2]  139 	ldw	(0x2, x), y
      008DAD 90 CE 00 19      [ 2]  140 	ldw	y, _timeTickMs+0
      008DB1 FF               [ 2]  141 	ldw	(x), y
      008DB2 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 44: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      008DB3                        147 _TIMER_CheckTimeUS:
      008DB3 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 46: timeGet = TIM4_GetCounter();
      008DB5 CD 97 F0         [ 4]  150 	call	_TIM4_GetCounter
      008DB8 5F               [ 1]  151 	clrw	x
      008DB9 97               [ 1]  152 	ld	xl, a
      008DBA CF 00 15         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 47: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      008DBD 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      008DBF 17 01            [ 2]  156 	ldw	(0x01, sp), y
      008DC1 1E 01            [ 2]  157 	ldw	x, (0x01, sp)
      008DC3 FE               [ 2]  158 	ldw	x, (x)
      008DC4 1F 03            [ 2]  159 	ldw	(0x03, sp), x
      008DC6 1E 03            [ 2]  160 	ldw	x, (0x03, sp)
      008DC8 C3 00 15         [ 2]  161 	cpw	x, _timeGet+0
      008DCB 24 0A            [ 1]  162 	jrnc	00105$
      008DCD CE 00 15         [ 2]  163 	ldw	x, _timeGet+0
      008DD0 72 F0 03         [ 2]  164 	subw	x, (0x03, sp)
      008DD3 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      008DD5 24 14            [ 1]  166 	jrnc	00101$
      008DD7                        167 00105$:
      008DD7 1E 03            [ 2]  168 	ldw	x, (0x03, sp)
      008DD9 C3 00 15         [ 2]  169 	cpw	x, _timeGet+0
      008DDC 23 17            [ 2]  170 	jrule	00102$
      008DDE CE 00 15         [ 2]  171 	ldw	x, _timeGet+0
      008DE1 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      008DE4 72 F0 03         [ 2]  173 	subw	x, (0x03, sp)
      008DE7 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      008DE9 25 0A            [ 1]  175 	jrc	00102$
      008DEB                        176 00101$:
                                    177 ;	user/timerTick.c: 48: pTime->timeUS = timeGet;
      008DEB 1E 01            [ 2]  178 	ldw	x, (0x01, sp)
      008DED 90 CE 00 15      [ 2]  179 	ldw	y, _timeGet+0
      008DF1 FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 49: return 0;
      008DF2 4F               [ 1]  182 	clr	a
      008DF3 20 02            [ 2]  183 	jra	00106$
      008DF5                        184 00102$:
                                    185 ;	user/timerTick.c: 51: return 1;
      008DF5 A6 01            [ 1]  186 	ld	a, #0x01
      008DF7                        187 00106$:
      008DF7 5B 04            [ 2]  188 	addw	sp, #4
      008DF9 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 54: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      008DFA                        194 _TIMER_CheckTimeMS:
      008DFA 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 56: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      008DFC 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      008DFE 5C               [ 2]  198 	incw	x
      008DFF 5C               [ 2]  199 	incw	x
      008E00 1F 02            [ 2]  200 	ldw	(0x02, sp), x
      008E02 1E 02            [ 2]  201 	ldw	x, (0x02, sp)
      008E04 E6 03            [ 1]  202 	ld	a, (0x3, x)
      008E06 6B 0B            [ 1]  203 	ld	(0x0b, sp), a
      008E08 E6 02            [ 1]  204 	ld	a, (0x2, x)
      008E0A 6B 0A            [ 1]  205 	ld	(0x0a, sp), a
      008E0C FE               [ 2]  206 	ldw	x, (x)
      008E0D 1F 08            [ 2]  207 	ldw	(0x08, sp), x
      008E0F CE 00 1B         [ 2]  208 	ldw	x, _timeTickMs+2
      008E12 72 F0 0A         [ 2]  209 	subw	x, (0x0a, sp)
      008E15 C6 00 1A         [ 1]  210 	ld	a, _timeTickMs+1
      008E18 12 09            [ 1]  211 	sbc	a, (0x09, sp)
      008E1A 88               [ 1]  212 	push	a
      008E1B C6 00 19         [ 1]  213 	ld	a, _timeTickMs+0
      008E1E 12 09            [ 1]  214 	sbc	a, (0x09, sp)
      008E20 6B 05            [ 1]  215 	ld	(0x05, sp), a
      008E22 84               [ 1]  216 	pop	a
      008E23 88               [ 1]  217 	push	a
      008E24 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      008E26 84               [ 1]  219 	pop	a
      008E27 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      008E29 7B 04            [ 1]  221 	ld	a, (0x04, sp)
      008E2B 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      008E2D 4F               [ 1]  223 	clr	a
      008E2E 49               [ 1]  224 	rlc	a
      008E2F 6B 01            [ 1]  225 	ld	(0x01, sp), a
      008E31 1E 0A            [ 2]  226 	ldw	x, (0x0a, sp)
      008E33 C3 00 1B         [ 2]  227 	cpw	x, _timeTickMs+2
      008E36 7B 09            [ 1]  228 	ld	a, (0x09, sp)
      008E38 C2 00 1A         [ 1]  229 	sbc	a, _timeTickMs+1
      008E3B 7B 08            [ 1]  230 	ld	a, (0x08, sp)
      008E3D C2 00 19         [ 1]  231 	sbc	a, _timeTickMs+0
      008E40 24 04            [ 1]  232 	jrnc	00105$
      008E42 0D 01            [ 1]  233 	tnz	(0x01, sp)
      008E44 27 15            [ 1]  234 	jreq	00101$
      008E46                        235 00105$:
      008E46 CE 00 1B         [ 2]  236 	ldw	x, _timeTickMs+2
      008E49 13 0A            [ 2]  237 	cpw	x, (0x0a, sp)
      008E4B C6 00 1A         [ 1]  238 	ld	a, _timeTickMs+1
      008E4E 12 09            [ 1]  239 	sbc	a, (0x09, sp)
      008E50 C6 00 19         [ 1]  240 	ld	a, _timeTickMs+0
      008E53 12 08            [ 1]  241 	sbc	a, (0x08, sp)
      008E55 24 14            [ 1]  242 	jrnc	00102$
      008E57 0D 01            [ 1]  243 	tnz	(0x01, sp)
      008E59 26 10            [ 1]  244 	jrne	00102$
      008E5B                        245 00101$:
                                    246 ;	user/timerTick.c: 57: pTime->timeMS = timeTickMs;
      008E5B 1E 02            [ 2]  247 	ldw	x, (0x02, sp)
      008E5D 90 CE 00 1B      [ 2]  248 	ldw	y, _timeTickMs+2
      008E61 EF 02            [ 2]  249 	ldw	(0x2, x), y
      008E63 90 CE 00 19      [ 2]  250 	ldw	y, _timeTickMs+0
      008E67 FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 58: return 0;
      008E68 4F               [ 1]  253 	clr	a
      008E69 20 02            [ 2]  254 	jra	00106$
      008E6B                        255 00102$:
                                    256 ;	user/timerTick.c: 60: return 1;
      008E6B A6 01            [ 1]  257 	ld	a, #0x01
      008E6D                        258 00106$:
      008E6D 5B 0B            [ 2]  259 	addw	sp, #11
      008E6F 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
