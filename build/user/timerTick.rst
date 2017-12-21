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
      008E7D                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 20: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      008E7D 4B 01            [ 1]   69 	push	#0x01
      008E7F 4B 04            [ 1]   70 	push	#0x04
      008E81 CD 8F FA         [ 4]   71 	call	_CLK_PeripheralClockConfig
      008E84 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 21: TIM4_DeInit(); 
      008E85 CD 96 A2         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 23: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      008E88 4B C8            [ 1]   76 	push	#0xc8
      008E8A 4B 04            [ 1]   77 	push	#0x04
      008E8C CD 96 BB         [ 4]   78 	call	_TIM4_TimeBaseInit
      008E8F 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      008E90 4B 01            [ 1]   81 	push	#0x01
      008E92 CD 96 EB         [ 4]   82 	call	_TIM4_ClearFlag
      008E95 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 25: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      008E96 4B 01            [ 1]   85 	push	#0x01
      008E98 4B 01            [ 1]   86 	push	#0x01
      008E9A CD 96 CD         [ 4]   87 	call	_TIM4_ITConfig
      008E9D 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 26: TIM4_Cmd(ENABLE);    // Enable TIM4 
      008E9E 4B 01            [ 1]   90 	push	#0x01
      008EA0 CD 96 C8         [ 4]   91 	call	_TIM4_Cmd
      008EA3 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 27: timeTickMs = 0;
      008EA4 5F               [ 1]   94 	clrw	x
      008EA5 CF 00 1B         [ 2]   95 	ldw	_timeTickMs+2, x
      008EA8 CF 00 19         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 28: timeTickUs = 0;
      008EAB 72 5F 00 1D      [ 1]   98 	clr	_timeTickUs+0
      008EAF 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 31: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      008EB0                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 33: timeTickUs++;
      008EB0 72 5C 00 1D      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 34: if(timeTickUs%5 == 0){
      008EB4 5F               [ 1]  108 	clrw	x
      008EB5 C6 00 1D         [ 1]  109 	ld	a, _timeTickUs+0
      008EB8 97               [ 1]  110 	ld	xl, a
      008EB9 A6 05            [ 1]  111 	ld	a, #0x05
      008EBB 62               [ 2]  112 	div	x, a
      008EBC 4D               [ 1]  113 	tnz	a
      008EBD 27 01            [ 1]  114 	jreq	00109$
      008EBF 81               [ 4]  115 	ret
      008EC0                        116 00109$:
                                    117 ;	user/timerTick.c: 35: timeTickMs++;
      008EC0 CE 00 1B         [ 2]  118 	ldw	x, _timeTickMs+2
      008EC3 1C 00 01         [ 2]  119 	addw	x, #0x0001
      008EC6 C6 00 1A         [ 1]  120 	ld	a, _timeTickMs+1
      008EC9 A9 00            [ 1]  121 	adc	a, #0x00
      008ECB 90 97            [ 1]  122 	ld	yl, a
      008ECD C6 00 19         [ 1]  123 	ld	a, _timeTickMs+0
      008ED0 A9 00            [ 1]  124 	adc	a, #0x00
      008ED2 90 95            [ 1]  125 	ld	yh, a
      008ED4 CF 00 1B         [ 2]  126 	ldw	_timeTickMs+2, x
      008ED7 90 CF 00 19      [ 2]  127 	ldw	_timeTickMs+0, y
      008EDB 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 39: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      008EDC                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 41: pTime->timeMS = timeTickMs;
      008EDC 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      008EDE 5C               [ 2]  136 	incw	x
      008EDF 5C               [ 2]  137 	incw	x
      008EE0 90 CE 00 1B      [ 2]  138 	ldw	y, _timeTickMs+2
      008EE4 EF 02            [ 2]  139 	ldw	(0x2, x), y
      008EE6 90 CE 00 19      [ 2]  140 	ldw	y, _timeTickMs+0
      008EEA FF               [ 2]  141 	ldw	(x), y
      008EEB 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 44: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      008EEC                        147 _TIMER_CheckTimeUS:
      008EEC 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 46: timeGet = TIM4_GetCounter();
      008EEE CD 96 D8         [ 4]  150 	call	_TIM4_GetCounter
      008EF1 5F               [ 1]  151 	clrw	x
      008EF2 97               [ 1]  152 	ld	xl, a
      008EF3 CF 00 15         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 47: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      008EF6 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      008EF8 17 03            [ 2]  156 	ldw	(0x03, sp), y
      008EFA 1E 03            [ 2]  157 	ldw	x, (0x03, sp)
      008EFC FE               [ 2]  158 	ldw	x, (x)
      008EFD 1F 01            [ 2]  159 	ldw	(0x01, sp), x
      008EFF 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      008F01 C3 00 15         [ 2]  161 	cpw	x, _timeGet+0
      008F04 24 0A            [ 1]  162 	jrnc	00105$
      008F06 CE 00 15         [ 2]  163 	ldw	x, _timeGet+0
      008F09 72 F0 01         [ 2]  164 	subw	x, (0x01, sp)
      008F0C 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      008F0E 24 14            [ 1]  166 	jrnc	00101$
      008F10                        167 00105$:
      008F10 1E 01            [ 2]  168 	ldw	x, (0x01, sp)
      008F12 C3 00 15         [ 2]  169 	cpw	x, _timeGet+0
      008F15 23 17            [ 2]  170 	jrule	00102$
      008F17 CE 00 15         [ 2]  171 	ldw	x, _timeGet+0
      008F1A 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      008F1D 72 F0 01         [ 2]  173 	subw	x, (0x01, sp)
      008F20 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      008F22 25 0A            [ 1]  175 	jrc	00102$
      008F24                        176 00101$:
                                    177 ;	user/timerTick.c: 48: pTime->timeUS = timeGet;
      008F24 1E 03            [ 2]  178 	ldw	x, (0x03, sp)
      008F26 90 CE 00 15      [ 2]  179 	ldw	y, _timeGet+0
      008F2A FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 49: return 0;
      008F2B 4F               [ 1]  182 	clr	a
      008F2C 20 02            [ 2]  183 	jra	00106$
      008F2E                        184 00102$:
                                    185 ;	user/timerTick.c: 51: return 1;
      008F2E A6 01            [ 1]  186 	ld	a, #0x01
      008F30                        187 00106$:
      008F30 5B 04            [ 2]  188 	addw	sp, #4
      008F32 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 54: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      008F33                        194 _TIMER_CheckTimeMS:
      008F33 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 56: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      008F35 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      008F37 5C               [ 2]  198 	incw	x
      008F38 5C               [ 2]  199 	incw	x
      008F39 1F 05            [ 2]  200 	ldw	(0x05, sp), x
      008F3B 1E 05            [ 2]  201 	ldw	x, (0x05, sp)
      008F3D E6 03            [ 1]  202 	ld	a, (0x3, x)
      008F3F 6B 0A            [ 1]  203 	ld	(0x0a, sp), a
      008F41 E6 02            [ 1]  204 	ld	a, (0x2, x)
      008F43 6B 09            [ 1]  205 	ld	(0x09, sp), a
      008F45 FE               [ 2]  206 	ldw	x, (x)
      008F46 1F 07            [ 2]  207 	ldw	(0x07, sp), x
      008F48 CE 00 1B         [ 2]  208 	ldw	x, _timeTickMs+2
      008F4B 72 F0 09         [ 2]  209 	subw	x, (0x09, sp)
      008F4E C6 00 1A         [ 1]  210 	ld	a, _timeTickMs+1
      008F51 12 08            [ 1]  211 	sbc	a, (0x08, sp)
      008F53 88               [ 1]  212 	push	a
      008F54 C6 00 19         [ 1]  213 	ld	a, _timeTickMs+0
      008F57 12 08            [ 1]  214 	sbc	a, (0x08, sp)
      008F59 6B 02            [ 1]  215 	ld	(0x02, sp), a
      008F5B 84               [ 1]  216 	pop	a
      008F5C 88               [ 1]  217 	push	a
      008F5D 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      008F5F 84               [ 1]  219 	pop	a
      008F60 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      008F62 7B 01            [ 1]  221 	ld	a, (0x01, sp)
      008F64 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      008F66 4F               [ 1]  223 	clr	a
      008F67 49               [ 1]  224 	rlc	a
      008F68 6B 0B            [ 1]  225 	ld	(0x0b, sp), a
      008F6A 1E 09            [ 2]  226 	ldw	x, (0x09, sp)
      008F6C C3 00 1B         [ 2]  227 	cpw	x, _timeTickMs+2
      008F6F 7B 08            [ 1]  228 	ld	a, (0x08, sp)
      008F71 C2 00 1A         [ 1]  229 	sbc	a, _timeTickMs+1
      008F74 7B 07            [ 1]  230 	ld	a, (0x07, sp)
      008F76 C2 00 19         [ 1]  231 	sbc	a, _timeTickMs+0
      008F79 24 04            [ 1]  232 	jrnc	00105$
      008F7B 0D 0B            [ 1]  233 	tnz	(0x0b, sp)
      008F7D 27 15            [ 1]  234 	jreq	00101$
      008F7F                        235 00105$:
      008F7F CE 00 1B         [ 2]  236 	ldw	x, _timeTickMs+2
      008F82 13 09            [ 2]  237 	cpw	x, (0x09, sp)
      008F84 C6 00 1A         [ 1]  238 	ld	a, _timeTickMs+1
      008F87 12 08            [ 1]  239 	sbc	a, (0x08, sp)
      008F89 C6 00 19         [ 1]  240 	ld	a, _timeTickMs+0
      008F8C 12 07            [ 1]  241 	sbc	a, (0x07, sp)
      008F8E 24 14            [ 1]  242 	jrnc	00102$
      008F90 0D 0B            [ 1]  243 	tnz	(0x0b, sp)
      008F92 26 10            [ 1]  244 	jrne	00102$
      008F94                        245 00101$:
                                    246 ;	user/timerTick.c: 57: pTime->timeMS = timeTickMs;
      008F94 1E 05            [ 2]  247 	ldw	x, (0x05, sp)
      008F96 90 CE 00 1B      [ 2]  248 	ldw	y, _timeTickMs+2
      008F9A EF 02            [ 2]  249 	ldw	(0x2, x), y
      008F9C 90 CE 00 19      [ 2]  250 	ldw	y, _timeTickMs+0
      008FA0 FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 58: return 0;
      008FA1 4F               [ 1]  253 	clr	a
      008FA2 20 02            [ 2]  254 	jra	00106$
      008FA4                        255 00102$:
                                    256 ;	user/timerTick.c: 60: return 1;
      008FA4 A6 01            [ 1]  257 	ld	a, #0x01
      008FA6                        258 00106$:
      008FA6 5B 0B            [ 2]  259 	addw	sp, #11
      008FA8 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
