                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_clk
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _HSIDivFactor
                                     12 	.globl _CLK_Config
                                     13 	.globl _CLK_PeripheralClockConfig
                                     14 	.globl _CLK_SYSCLKConfig
                                     15 	.globl _CLK_GetClockFreq
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area DATA
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area INITIALIZED
                                     24 ;--------------------------------------------------------
                                     25 ; absolute external ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DABS (ABS)
                                     28 ;--------------------------------------------------------
                                     29 ; global & static initialisations
                                     30 ;--------------------------------------------------------
                                     31 	.area HOME
                                     32 	.area GSINIT
                                     33 	.area GSFINAL
                                     34 	.area GSINIT
                                     35 ;--------------------------------------------------------
                                     36 ; Home
                                     37 ;--------------------------------------------------------
                                     38 	.area HOME
                                     39 	.area HOME
                                     40 ;--------------------------------------------------------
                                     41 ; code
                                     42 ;--------------------------------------------------------
                                     43 	.area CODE
                                     44 ;	lib/stm8s_clk.c: 15: void CLK_Config(void)
                                     45 ;	-----------------------------------------
                                     46 ;	 function CLK_Config
                                     47 ;	-----------------------------------------
      008482                         48 _CLK_Config:
                                     49 ;	lib/stm8s_clk.c: 18: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      008482 35 01 50 C0      [ 1]   50 	mov	0x50c0+0, #0x01
                                     51 ;	lib/stm8s_clk.c: 19: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      008486 35 00 50 C1      [ 1]   52 	mov	0x50c1+0, #0x00
                                     53 ;	lib/stm8s_clk.c: 20: CLK->SWR  = CLK_SWR_RESET_VALUE;
      00848A 35 E1 50 C4      [ 1]   54 	mov	0x50c4+0, #0xe1
                                     55 ;	lib/stm8s_clk.c: 21: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      00848E 35 00 50 C5      [ 1]   56 	mov	0x50c5+0, #0x00
                                     57 ;	lib/stm8s_clk.c: 22: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      008492 35 18 50 C6      [ 1]   58 	mov	0x50c6+0, #0x18
                                     59 ;	lib/stm8s_clk.c: 23: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      008496 35 FF 50 C7      [ 1]   60 	mov	0x50c7+0, #0xff
                                     61 ;	lib/stm8s_clk.c: 24: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      00849A 35 FF 50 CA      [ 1]   62 	mov	0x50ca+0, #0xff
                                     63 ;	lib/stm8s_clk.c: 25: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      00849E 35 00 50 C8      [ 1]   64 	mov	0x50c8+0, #0x00
                                     65 ;	lib/stm8s_clk.c: 26: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      0084A2 35 00 50 C9      [ 1]   66 	mov	0x50c9+0, #0x00
                                     67 ;	lib/stm8s_clk.c: 27: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      0084A6                         68 00101$:
      0084A6 AE 50 C9         [ 2]   69 	ldw	x, #0x50c9
      0084A9 F6               [ 1]   70 	ld	a, (x)
      0084AA 44               [ 1]   71 	srl	a
      0084AB 25 F9            [ 1]   72 	jrc	00101$
                                     73 ;	lib/stm8s_clk.c: 29: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      0084AD 35 00 50 C9      [ 1]   74 	mov	0x50c9+0, #0x00
                                     75 ;	lib/stm8s_clk.c: 30: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      0084B1 35 00 50 CC      [ 1]   76 	mov	0x50cc+0, #0x00
                                     77 ;	lib/stm8s_clk.c: 31: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      0084B5 35 00 50 CD      [ 1]   78 	mov	0x50cd+0, #0x00
                                     79 ;	lib/stm8s_clk.c: 35: CLK->ICKR |= CLK_ICKR_HSIEN; /* Set HSIEN bit */
      0084B9 72 10 50 C0      [ 1]   80 	bset	0x50c0, #0
                                     81 ;	lib/stm8s_clk.c: 42: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV); /* Clear High speed internal clock prescaler */
      0084BD AE 50 C6         [ 2]   82 	ldw	x, #0x50c6
      0084C0 F6               [ 1]   83 	ld	a, (x)
      0084C1 A4 E7            [ 1]   84 	and	a, #0xe7
      0084C3 F7               [ 1]   85 	ld	(x), a
                                     86 ;	lib/stm8s_clk.c: 43: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1; /* Set High speed internal clock prescaler */
      0084C4 AE 50 C6         [ 2]   87 	ldw	x, #0x50c6
      0084C7 F6               [ 1]   88 	ld	a, (x)
      0084C8 AE 50 C6         [ 2]   89 	ldw	x, #0x50c6
      0084CB F7               [ 1]   90 	ld	(x), a
                                     91 ;	lib/stm8s_clk.c: 45: CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
      0084CC 4B 00            [ 1]   92 	push	#0x00
      0084CE CD 85 29         [ 4]   93 	call	_CLK_SYSCLKConfig
      0084D1 84               [ 1]   94 	pop	a
      0084D2 81               [ 4]   95 	ret
                                     96 ;	lib/stm8s_clk.c: 48: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                     97 ;	-----------------------------------------
                                     98 ;	 function CLK_PeripheralClockConfig
                                     99 ;	-----------------------------------------
      0084D3                        100 _CLK_PeripheralClockConfig:
      0084D3 89               [ 2]  101 	pushw	x
                                    102 ;	lib/stm8s_clk.c: 55: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0084D4 7B 05            [ 1]  103 	ld	a, (0x05, sp)
      0084D6 A4 0F            [ 1]  104 	and	a, #0x0f
      0084D8 88               [ 1]  105 	push	a
      0084D9 A6 01            [ 1]  106 	ld	a, #0x01
      0084DB 6B 02            [ 1]  107 	ld	(0x02, sp), a
      0084DD 84               [ 1]  108 	pop	a
      0084DE 4D               [ 1]  109 	tnz	a
      0084DF 27 05            [ 1]  110 	jreq	00125$
      0084E1                        111 00124$:
      0084E1 08 01            [ 1]  112 	sll	(0x01, sp)
      0084E3 4A               [ 1]  113 	dec	a
      0084E4 26 FB            [ 1]  114 	jrne	00124$
      0084E6                        115 00125$:
                                    116 ;	lib/stm8s_clk.c: 60: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0084E6 7B 01            [ 1]  117 	ld	a, (0x01, sp)
      0084E8 43               [ 1]  118 	cpl	a
      0084E9 6B 02            [ 1]  119 	ld	(0x02, sp), a
                                    120 ;	lib/stm8s_clk.c: 50: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      0084EB 7B 05            [ 1]  121 	ld	a, (0x05, sp)
      0084ED A5 10            [ 1]  122 	bcp	a, #0x10
      0084EF 26 1C            [ 1]  123 	jrne	00108$
                                    124 ;	lib/stm8s_clk.c: 52: if (NewState != DISABLE)
      0084F1 0D 06            [ 1]  125 	tnz	(0x06, sp)
      0084F3 27 0C            [ 1]  126 	jreq	00102$
                                    127 ;	lib/stm8s_clk.c: 55: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0084F5 AE 50 C7         [ 2]  128 	ldw	x, #0x50c7
      0084F8 F6               [ 1]  129 	ld	a, (x)
      0084F9 1A 01            [ 1]  130 	or	a, (0x01, sp)
      0084FB AE 50 C7         [ 2]  131 	ldw	x, #0x50c7
      0084FE F7               [ 1]  132 	ld	(x), a
      0084FF 20 26            [ 2]  133 	jra	00110$
      008501                        134 00102$:
                                    135 ;	lib/stm8s_clk.c: 60: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008501 AE 50 C7         [ 2]  136 	ldw	x, #0x50c7
      008504 F6               [ 1]  137 	ld	a, (x)
      008505 14 02            [ 1]  138 	and	a, (0x02, sp)
      008507 AE 50 C7         [ 2]  139 	ldw	x, #0x50c7
      00850A F7               [ 1]  140 	ld	(x), a
      00850B 20 1A            [ 2]  141 	jra	00110$
      00850D                        142 00108$:
                                    143 ;	lib/stm8s_clk.c: 65: if (NewState != DISABLE)
      00850D 0D 06            [ 1]  144 	tnz	(0x06, sp)
      00850F 27 0C            [ 1]  145 	jreq	00105$
                                    146 ;	lib/stm8s_clk.c: 68: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008511 AE 50 CA         [ 2]  147 	ldw	x, #0x50ca
      008514 F6               [ 1]  148 	ld	a, (x)
      008515 1A 01            [ 1]  149 	or	a, (0x01, sp)
      008517 AE 50 CA         [ 2]  150 	ldw	x, #0x50ca
      00851A F7               [ 1]  151 	ld	(x), a
      00851B 20 0A            [ 2]  152 	jra	00110$
      00851D                        153 00105$:
                                    154 ;	lib/stm8s_clk.c: 73: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00851D AE 50 CA         [ 2]  155 	ldw	x, #0x50ca
      008520 F6               [ 1]  156 	ld	a, (x)
      008521 14 02            [ 1]  157 	and	a, (0x02, sp)
      008523 AE 50 CA         [ 2]  158 	ldw	x, #0x50ca
      008526 F7               [ 1]  159 	ld	(x), a
      008527                        160 00110$:
      008527 85               [ 2]  161 	popw	x
      008528 81               [ 4]  162 	ret
                                    163 ;	lib/stm8s_clk.c: 78: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    164 ;	-----------------------------------------
                                    165 ;	 function CLK_SYSCLKConfig
                                    166 ;	-----------------------------------------
      008529                        167 _CLK_SYSCLKConfig:
      008529 89               [ 2]  168 	pushw	x
                                    169 ;	lib/stm8s_clk.c: 80: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      00852A 0D 05            [ 1]  170 	tnz	(0x05, sp)
      00852C 2B 19            [ 1]  171 	jrmi	00102$
                                    172 ;	lib/stm8s_clk.c: 82: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      00852E AE 50 C6         [ 2]  173 	ldw	x, #0x50c6
      008531 F6               [ 1]  174 	ld	a, (x)
      008532 A4 E7            [ 1]  175 	and	a, #0xe7
      008534 F7               [ 1]  176 	ld	(x), a
                                    177 ;	lib/stm8s_clk.c: 83: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      008535 AE 50 C6         [ 2]  178 	ldw	x, #0x50c6
      008538 F6               [ 1]  179 	ld	a, (x)
      008539 6B 01            [ 1]  180 	ld	(0x01, sp), a
      00853B 7B 05            [ 1]  181 	ld	a, (0x05, sp)
      00853D A4 18            [ 1]  182 	and	a, #0x18
      00853F 1A 01            [ 1]  183 	or	a, (0x01, sp)
      008541 AE 50 C6         [ 2]  184 	ldw	x, #0x50c6
      008544 F7               [ 1]  185 	ld	(x), a
      008545 20 17            [ 2]  186 	jra	00104$
      008547                        187 00102$:
                                    188 ;	lib/stm8s_clk.c: 87: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      008547 AE 50 C6         [ 2]  189 	ldw	x, #0x50c6
      00854A F6               [ 1]  190 	ld	a, (x)
      00854B A4 F8            [ 1]  191 	and	a, #0xf8
      00854D F7               [ 1]  192 	ld	(x), a
                                    193 ;	lib/stm8s_clk.c: 88: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      00854E AE 50 C6         [ 2]  194 	ldw	x, #0x50c6
      008551 F6               [ 1]  195 	ld	a, (x)
      008552 6B 02            [ 1]  196 	ld	(0x02, sp), a
      008554 7B 05            [ 1]  197 	ld	a, (0x05, sp)
      008556 A4 07            [ 1]  198 	and	a, #0x07
      008558 1A 02            [ 1]  199 	or	a, (0x02, sp)
      00855A AE 50 C6         [ 2]  200 	ldw	x, #0x50c6
      00855D F7               [ 1]  201 	ld	(x), a
      00855E                        202 00104$:
      00855E 85               [ 2]  203 	popw	x
      00855F 81               [ 4]  204 	ret
                                    205 ;	lib/stm8s_clk.c: 92: uint32_t CLK_GetClockFreq(void)
                                    206 ;	-----------------------------------------
                                    207 ;	 function CLK_GetClockFreq
                                    208 ;	-----------------------------------------
      008560                        209 _CLK_GetClockFreq:
      008560 52 07            [ 2]  210 	sub	sp, #7
                                    211 ;	lib/stm8s_clk.c: 99: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      008562 AE 50 C3         [ 2]  212 	ldw	x, #0x50c3
      008565 F6               [ 1]  213 	ld	a, (x)
      008566 6B 01            [ 1]  214 	ld	(0x01, sp), a
                                    215 ;	lib/stm8s_clk.c: 100: if (clocksource == CLK_SOURCE_HSI)
      008568 7B 01            [ 1]  216 	ld	a, (0x01, sp)
      00856A A1 E1            [ 1]  217 	cp	a, #0xe1
      00856C 26 2C            [ 1]  218 	jrne	00105$
                                    219 ;	lib/stm8s_clk.c: 102: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      00856E AE 50 C6         [ 2]  220 	ldw	x, #0x50c6
      008571 F6               [ 1]  221 	ld	a, (x)
      008572 A4 18            [ 1]  222 	and	a, #0x18
                                    223 ;	lib/stm8s_clk.c: 103: tmp = (uint8_t)(tmp >> 3);
      008574 44               [ 1]  224 	srl	a
      008575 44               [ 1]  225 	srl	a
      008576 44               [ 1]  226 	srl	a
                                    227 ;	lib/stm8s_clk.c: 104: presc = HSIDivFactor[tmp];
      008577 AE 85 B9         [ 2]  228 	ldw	x, #_HSIDivFactor+0
      00857A 1F 06            [ 2]  229 	ldw	(0x06, sp), x
      00857C 5F               [ 1]  230 	clrw	x
      00857D 97               [ 1]  231 	ld	xl, a
      00857E 72 FB 06         [ 2]  232 	addw	x, (0x06, sp)
      008581 F6               [ 1]  233 	ld	a, (x)
                                    234 ;	lib/stm8s_clk.c: 105: clockfrequency = HSI_VALUE / presc;
      008582 5F               [ 1]  235 	clrw	x
      008583 97               [ 1]  236 	ld	xl, a
      008584 90 5F            [ 1]  237 	clrw	y
      008586 89               [ 2]  238 	pushw	x
      008587 90 89            [ 2]  239 	pushw	y
      008589 4B 00            [ 1]  240 	push	#0x00
      00858B 4B 24            [ 1]  241 	push	#0x24
      00858D 4B F4            [ 1]  242 	push	#0xf4
      00858F 4B 00            [ 1]  243 	push	#0x00
      008591 CD 8B D4         [ 4]  244 	call	__divulong
      008594 5B 08            [ 2]  245 	addw	sp, #8
      008596 1F 04            [ 2]  246 	ldw	(0x04, sp), x
      008598 20 1A            [ 2]  247 	jra	00106$
      00859A                        248 00105$:
                                    249 ;	lib/stm8s_clk.c: 107: else if ( clocksource == CLK_SOURCE_LSI)
      00859A 7B 01            [ 1]  250 	ld	a, (0x01, sp)
      00859C A1 D2            [ 1]  251 	cp	a, #0xd2
      00859E 26 0B            [ 1]  252 	jrne	00102$
                                    253 ;	lib/stm8s_clk.c: 109: clockfrequency = LSI_VALUE;
      0085A0 AE F4 00         [ 2]  254 	ldw	x, #0xf400
      0085A3 1F 04            [ 2]  255 	ldw	(0x04, sp), x
      0085A5 90 AE 00 01      [ 2]  256 	ldw	y, #0x0001
      0085A9 20 09            [ 2]  257 	jra	00106$
      0085AB                        258 00102$:
                                    259 ;	lib/stm8s_clk.c: 113: clockfrequency = HSE_VALUE;
      0085AB AE 24 00         [ 2]  260 	ldw	x, #0x2400
      0085AE 1F 04            [ 2]  261 	ldw	(0x04, sp), x
      0085B0 90 AE 00 F4      [ 2]  262 	ldw	y, #0x00f4
      0085B4                        263 00106$:
                                    264 ;	lib/stm8s_clk.c: 115: return((uint32_t)clockfrequency);
      0085B4 1E 04            [ 2]  265 	ldw	x, (0x04, sp)
      0085B6 5B 07            [ 2]  266 	addw	sp, #7
      0085B8 81               [ 4]  267 	ret
                                    268 	.area CODE
      0085B9                        269 _HSIDivFactor:
      0085B9 01                     270 	.db #0x01	; 1
      0085BA 02                     271 	.db #0x02	; 2
      0085BB 04                     272 	.db #0x04	; 4
      0085BC 08                     273 	.db #0x08	; 8
                                    274 	.area INITIALIZER
                                    275 	.area CABS (ABS)
