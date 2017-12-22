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
                                     11 	.globl _CLKPrescTable
                                     12 	.globl _HSIDivFactor
                                     13 	.globl _CLK_DeInit
                                     14 	.globl _CLK_FastHaltWakeUpCmd
                                     15 	.globl _CLK_HSECmd
                                     16 	.globl _CLK_HSICmd
                                     17 	.globl _CLK_LSICmd
                                     18 	.globl _CLK_CCOCmd
                                     19 	.globl _CLK_ClockSwitchCmd
                                     20 	.globl _CLK_SlowActiveHaltWakeUpCmd
                                     21 	.globl _CLK_PeripheralClockConfig
                                     22 	.globl _CLK_ClockSwitchConfig
                                     23 	.globl _CLK_HSIPrescalerConfig
                                     24 	.globl _CLK_CCOConfig
                                     25 	.globl _CLK_ITConfig
                                     26 	.globl _CLK_SYSCLKConfig
                                     27 	.globl _CLK_SWIMConfig
                                     28 	.globl _CLK_ClockSecuritySystemEnable
                                     29 	.globl _CLK_GetSYSCLKSource
                                     30 	.globl _CLK_GetClockFreq
                                     31 	.globl _CLK_AdjustHSICalibrationValue
                                     32 	.globl _CLK_SYSCLKEmergencyClear
                                     33 	.globl _CLK_GetFlagStatus
                                     34 	.globl _CLK_GetITStatus
                                     35 	.globl _CLK_ClearITPendingBit
                                     36 ;--------------------------------------------------------
                                     37 ; ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area DATA
                                     40 ;--------------------------------------------------------
                                     41 ; ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area INITIALIZED
                                     44 ;--------------------------------------------------------
                                     45 ; absolute external ram data
                                     46 ;--------------------------------------------------------
                                     47 	.area DABS (ABS)
                                     48 ;--------------------------------------------------------
                                     49 ; global & static initialisations
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
                                     52 	.area GSINIT
                                     53 	.area GSFINAL
                                     54 	.area GSINIT
                                     55 ;--------------------------------------------------------
                                     56 ; Home
                                     57 ;--------------------------------------------------------
                                     58 	.area HOME
                                     59 	.area HOME
                                     60 ;--------------------------------------------------------
                                     61 ; code
                                     62 ;--------------------------------------------------------
                                     63 	.area CODE
                                     64 ;	lib/stm8s_clk.c: 72: void CLK_DeInit(void)
                                     65 ;	-----------------------------------------
                                     66 ;	 function CLK_DeInit
                                     67 ;	-----------------------------------------
      009176                         68 _CLK_DeInit:
                                     69 ;	lib/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      009176 35 01 50 C0      [ 1]   70 	mov	0x50c0+0, #0x01
                                     71 ;	lib/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      00917A 35 00 50 C1      [ 1]   72 	mov	0x50c1+0, #0x00
                                     73 ;	lib/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      00917E 35 E1 50 C4      [ 1]   74 	mov	0x50c4+0, #0xe1
                                     75 ;	lib/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      009182 35 00 50 C5      [ 1]   76 	mov	0x50c5+0, #0x00
                                     77 ;	lib/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      009186 35 18 50 C6      [ 1]   78 	mov	0x50c6+0, #0x18
                                     79 ;	lib/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      00918A 35 FF 50 C7      [ 1]   80 	mov	0x50c7+0, #0xff
                                     81 ;	lib/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      00918E 35 FF 50 CA      [ 1]   82 	mov	0x50ca+0, #0xff
                                     83 ;	lib/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      009192 35 00 50 C8      [ 1]   84 	mov	0x50c8+0, #0x00
                                     85 ;	lib/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      009196 35 00 50 C9      [ 1]   86 	mov	0x50c9+0, #0x00
                                     87 ;	lib/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      00919A                         88 00101$:
      00919A AE 50 C9         [ 2]   89 	ldw	x, #0x50c9
      00919D F6               [ 1]   90 	ld	a, (x)
      00919E 44               [ 1]   91 	srl	a
      00919F 25 F9            [ 1]   92 	jrc	00101$
                                     93 ;	lib/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      0091A1 35 00 50 C9      [ 1]   94 	mov	0x50c9+0, #0x00
                                     95 ;	lib/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      0091A5 35 00 50 CC      [ 1]   96 	mov	0x50cc+0, #0x00
                                     97 ;	lib/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      0091A9 35 00 50 CD      [ 1]   98 	mov	0x50cd+0, #0x00
      0091AD 81               [ 4]   99 	ret
                                    100 ;	lib/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function CLK_FastHaltWakeUpCmd
                                    103 ;	-----------------------------------------
      0091AE                        104 _CLK_FastHaltWakeUpCmd:
                                    105 ;	lib/stm8s_clk.c: 102: if (NewState != DISABLE)
      0091AE 0D 03            [ 1]  106 	tnz	(0x03, sp)
      0091B0 27 08            [ 1]  107 	jreq	00102$
                                    108 ;	lib/stm8s_clk.c: 105: CLK->ICKR |= CLK_ICKR_FHWU;
      0091B2 AE 50 C0         [ 2]  109 	ldw	x, #0x50c0
      0091B5 F6               [ 1]  110 	ld	a, (x)
      0091B6 AA 04            [ 1]  111 	or	a, #0x04
      0091B8 F7               [ 1]  112 	ld	(x), a
      0091B9 81               [ 4]  113 	ret
      0091BA                        114 00102$:
                                    115 ;	lib/stm8s_clk.c: 110: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      0091BA AE 50 C0         [ 2]  116 	ldw	x, #0x50c0
      0091BD F6               [ 1]  117 	ld	a, (x)
      0091BE A4 FB            [ 1]  118 	and	a, #0xfb
      0091C0 F7               [ 1]  119 	ld	(x), a
      0091C1 81               [ 4]  120 	ret
                                    121 ;	lib/stm8s_clk.c: 119: void CLK_HSECmd(FunctionalState NewState)
                                    122 ;	-----------------------------------------
                                    123 ;	 function CLK_HSECmd
                                    124 ;	-----------------------------------------
      0091C2                        125 _CLK_HSECmd:
                                    126 ;	lib/stm8s_clk.c: 122: if (NewState != DISABLE)
      0091C2 0D 03            [ 1]  127 	tnz	(0x03, sp)
      0091C4 27 05            [ 1]  128 	jreq	00102$
                                    129 ;	lib/stm8s_clk.c: 125: CLK->ECKR |= CLK_ECKR_HSEEN;
      0091C6 72 10 50 C1      [ 1]  130 	bset	0x50c1, #0
      0091CA 81               [ 4]  131 	ret
      0091CB                        132 00102$:
                                    133 ;	lib/stm8s_clk.c: 130: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0091CB 72 11 50 C1      [ 1]  134 	bres	0x50c1, #0
      0091CF 81               [ 4]  135 	ret
                                    136 ;	lib/stm8s_clk.c: 139: void CLK_HSICmd(FunctionalState NewState)
                                    137 ;	-----------------------------------------
                                    138 ;	 function CLK_HSICmd
                                    139 ;	-----------------------------------------
      0091D0                        140 _CLK_HSICmd:
                                    141 ;	lib/stm8s_clk.c: 142: if (NewState != DISABLE)
      0091D0 0D 03            [ 1]  142 	tnz	(0x03, sp)
      0091D2 27 05            [ 1]  143 	jreq	00102$
                                    144 ;	lib/stm8s_clk.c: 145: CLK->ICKR |= CLK_ICKR_HSIEN;
      0091D4 72 10 50 C0      [ 1]  145 	bset	0x50c0, #0
      0091D8 81               [ 4]  146 	ret
      0091D9                        147 00102$:
                                    148 ;	lib/stm8s_clk.c: 150: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0091D9 72 11 50 C0      [ 1]  149 	bres	0x50c0, #0
      0091DD 81               [ 4]  150 	ret
                                    151 ;	lib/stm8s_clk.c: 160: void CLK_LSICmd(FunctionalState NewState)
                                    152 ;	-----------------------------------------
                                    153 ;	 function CLK_LSICmd
                                    154 ;	-----------------------------------------
      0091DE                        155 _CLK_LSICmd:
                                    156 ;	lib/stm8s_clk.c: 163: if (NewState != DISABLE)
      0091DE 0D 03            [ 1]  157 	tnz	(0x03, sp)
      0091E0 27 08            [ 1]  158 	jreq	00102$
                                    159 ;	lib/stm8s_clk.c: 166: CLK->ICKR |= CLK_ICKR_LSIEN;
      0091E2 AE 50 C0         [ 2]  160 	ldw	x, #0x50c0
      0091E5 F6               [ 1]  161 	ld	a, (x)
      0091E6 AA 08            [ 1]  162 	or	a, #0x08
      0091E8 F7               [ 1]  163 	ld	(x), a
      0091E9 81               [ 4]  164 	ret
      0091EA                        165 00102$:
                                    166 ;	lib/stm8s_clk.c: 171: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0091EA AE 50 C0         [ 2]  167 	ldw	x, #0x50c0
      0091ED F6               [ 1]  168 	ld	a, (x)
      0091EE A4 F7            [ 1]  169 	and	a, #0xf7
      0091F0 F7               [ 1]  170 	ld	(x), a
      0091F1 81               [ 4]  171 	ret
                                    172 ;	lib/stm8s_clk.c: 181: void CLK_CCOCmd(FunctionalState NewState)
                                    173 ;	-----------------------------------------
                                    174 ;	 function CLK_CCOCmd
                                    175 ;	-----------------------------------------
      0091F2                        176 _CLK_CCOCmd:
                                    177 ;	lib/stm8s_clk.c: 184: if (NewState != DISABLE)
      0091F2 0D 03            [ 1]  178 	tnz	(0x03, sp)
      0091F4 27 05            [ 1]  179 	jreq	00102$
                                    180 ;	lib/stm8s_clk.c: 187: CLK->CCOR |= CLK_CCOR_CCOEN;
      0091F6 72 10 50 C9      [ 1]  181 	bset	0x50c9, #0
      0091FA 81               [ 4]  182 	ret
      0091FB                        183 00102$:
                                    184 ;	lib/stm8s_clk.c: 192: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      0091FB 72 11 50 C9      [ 1]  185 	bres	0x50c9, #0
      0091FF 81               [ 4]  186 	ret
                                    187 ;	lib/stm8s_clk.c: 203: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    188 ;	-----------------------------------------
                                    189 ;	 function CLK_ClockSwitchCmd
                                    190 ;	-----------------------------------------
      009200                        191 _CLK_ClockSwitchCmd:
                                    192 ;	lib/stm8s_clk.c: 206: if (NewState != DISABLE )
      009200 0D 03            [ 1]  193 	tnz	(0x03, sp)
      009202 27 08            [ 1]  194 	jreq	00102$
                                    195 ;	lib/stm8s_clk.c: 209: CLK->SWCR |= CLK_SWCR_SWEN;
      009204 AE 50 C5         [ 2]  196 	ldw	x, #0x50c5
      009207 F6               [ 1]  197 	ld	a, (x)
      009208 AA 02            [ 1]  198 	or	a, #0x02
      00920A F7               [ 1]  199 	ld	(x), a
      00920B 81               [ 4]  200 	ret
      00920C                        201 00102$:
                                    202 ;	lib/stm8s_clk.c: 214: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      00920C AE 50 C5         [ 2]  203 	ldw	x, #0x50c5
      00920F F6               [ 1]  204 	ld	a, (x)
      009210 A4 FD            [ 1]  205 	and	a, #0xfd
      009212 F7               [ 1]  206 	ld	(x), a
      009213 81               [ 4]  207 	ret
                                    208 ;	lib/stm8s_clk.c: 226: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    209 ;	-----------------------------------------
                                    210 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    211 ;	-----------------------------------------
      009214                        212 _CLK_SlowActiveHaltWakeUpCmd:
                                    213 ;	lib/stm8s_clk.c: 229: if (NewState != DISABLE)
      009214 0D 03            [ 1]  214 	tnz	(0x03, sp)
      009216 27 08            [ 1]  215 	jreq	00102$
                                    216 ;	lib/stm8s_clk.c: 232: CLK->ICKR |= CLK_ICKR_SWUAH;
      009218 AE 50 C0         [ 2]  217 	ldw	x, #0x50c0
      00921B F6               [ 1]  218 	ld	a, (x)
      00921C AA 20            [ 1]  219 	or	a, #0x20
      00921E F7               [ 1]  220 	ld	(x), a
      00921F 81               [ 4]  221 	ret
      009220                        222 00102$:
                                    223 ;	lib/stm8s_clk.c: 237: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      009220 AE 50 C0         [ 2]  224 	ldw	x, #0x50c0
      009223 F6               [ 1]  225 	ld	a, (x)
      009224 A4 DF            [ 1]  226 	and	a, #0xdf
      009226 F7               [ 1]  227 	ld	(x), a
      009227 81               [ 4]  228 	ret
                                    229 ;	lib/stm8s_clk.c: 249: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    230 ;	-----------------------------------------
                                    231 ;	 function CLK_PeripheralClockConfig
                                    232 ;	-----------------------------------------
      009228                        233 _CLK_PeripheralClockConfig:
      009228 89               [ 2]  234 	pushw	x
                                    235 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009229 7B 05            [ 1]  236 	ld	a, (0x05, sp)
      00922B A4 0F            [ 1]  237 	and	a, #0x0f
      00922D 88               [ 1]  238 	push	a
      00922E A6 01            [ 1]  239 	ld	a, #0x01
      009230 6B 02            [ 1]  240 	ld	(0x02, sp), a
      009232 84               [ 1]  241 	pop	a
      009233 4D               [ 1]  242 	tnz	a
      009234 27 05            [ 1]  243 	jreq	00125$
      009236                        244 00124$:
      009236 08 01            [ 1]  245 	sll	(0x01, sp)
      009238 4A               [ 1]  246 	dec	a
      009239 26 FB            [ 1]  247 	jrne	00124$
      00923B                        248 00125$:
                                    249 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00923B 7B 01            [ 1]  250 	ld	a, (0x01, sp)
      00923D 43               [ 1]  251 	cpl	a
      00923E 6B 02            [ 1]  252 	ld	(0x02, sp), a
                                    253 ;	lib/stm8s_clk.c: 252: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      009240 7B 05            [ 1]  254 	ld	a, (0x05, sp)
      009242 A5 10            [ 1]  255 	bcp	a, #0x10
      009244 26 1C            [ 1]  256 	jrne	00108$
                                    257 ;	lib/stm8s_clk.c: 254: if (NewState != DISABLE)
      009246 0D 06            [ 1]  258 	tnz	(0x06, sp)
      009248 27 0C            [ 1]  259 	jreq	00102$
                                    260 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00924A AE 50 C7         [ 2]  261 	ldw	x, #0x50c7
      00924D F6               [ 1]  262 	ld	a, (x)
      00924E 1A 01            [ 1]  263 	or	a, (0x01, sp)
      009250 AE 50 C7         [ 2]  264 	ldw	x, #0x50c7
      009253 F7               [ 1]  265 	ld	(x), a
      009254 20 26            [ 2]  266 	jra	00110$
      009256                        267 00102$:
                                    268 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009256 AE 50 C7         [ 2]  269 	ldw	x, #0x50c7
      009259 F6               [ 1]  270 	ld	a, (x)
      00925A 14 02            [ 1]  271 	and	a, (0x02, sp)
      00925C AE 50 C7         [ 2]  272 	ldw	x, #0x50c7
      00925F F7               [ 1]  273 	ld	(x), a
      009260 20 1A            [ 2]  274 	jra	00110$
      009262                        275 00108$:
                                    276 ;	lib/stm8s_clk.c: 267: if (NewState != DISABLE)
      009262 0D 06            [ 1]  277 	tnz	(0x06, sp)
      009264 27 0C            [ 1]  278 	jreq	00105$
                                    279 ;	lib/stm8s_clk.c: 270: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009266 AE 50 CA         [ 2]  280 	ldw	x, #0x50ca
      009269 F6               [ 1]  281 	ld	a, (x)
      00926A 1A 01            [ 1]  282 	or	a, (0x01, sp)
      00926C AE 50 CA         [ 2]  283 	ldw	x, #0x50ca
      00926F F7               [ 1]  284 	ld	(x), a
      009270 20 0A            [ 2]  285 	jra	00110$
      009272                        286 00105$:
                                    287 ;	lib/stm8s_clk.c: 275: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009272 AE 50 CA         [ 2]  288 	ldw	x, #0x50ca
      009275 F6               [ 1]  289 	ld	a, (x)
      009276 14 02            [ 1]  290 	and	a, (0x02, sp)
      009278 AE 50 CA         [ 2]  291 	ldw	x, #0x50ca
      00927B F7               [ 1]  292 	ld	(x), a
      00927C                        293 00110$:
      00927C 85               [ 2]  294 	popw	x
      00927D 81               [ 4]  295 	ret
                                    296 ;	lib/stm8s_clk.c: 292: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    297 ;	-----------------------------------------
                                    298 ;	 function CLK_ClockSwitchConfig
                                    299 ;	-----------------------------------------
      00927E                        300 _CLK_ClockSwitchConfig:
      00927E 89               [ 2]  301 	pushw	x
                                    302 ;	lib/stm8s_clk.c: 299: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      00927F AE 50 C3         [ 2]  303 	ldw	x, #0x50c3
      009282 F6               [ 1]  304 	ld	a, (x)
      009283 6B 02            [ 1]  305 	ld	(0x02, sp), a
                                    306 ;	lib/stm8s_clk.c: 302: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      009285 7B 05            [ 1]  307 	ld	a, (0x05, sp)
      009287 A1 01            [ 1]  308 	cp	a, #0x01
      009289 26 40            [ 1]  309 	jrne	00122$
                                    310 ;	lib/stm8s_clk.c: 305: CLK->SWCR |= CLK_SWCR_SWEN;
      00928B AE 50 C5         [ 2]  311 	ldw	x, #0x50c5
      00928E F6               [ 1]  312 	ld	a, (x)
      00928F AA 02            [ 1]  313 	or	a, #0x02
      009291 F7               [ 1]  314 	ld	(x), a
                                    315 ;	lib/stm8s_clk.c: 308: if (ITState != DISABLE)
      009292 0D 07            [ 1]  316 	tnz	(0x07, sp)
      009294 27 09            [ 1]  317 	jreq	00102$
                                    318 ;	lib/stm8s_clk.c: 310: CLK->SWCR |= CLK_SWCR_SWIEN;
      009296 AE 50 C5         [ 2]  319 	ldw	x, #0x50c5
      009299 F6               [ 1]  320 	ld	a, (x)
      00929A AA 04            [ 1]  321 	or	a, #0x04
      00929C F7               [ 1]  322 	ld	(x), a
      00929D 20 07            [ 2]  323 	jra	00103$
      00929F                        324 00102$:
                                    325 ;	lib/stm8s_clk.c: 314: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      00929F AE 50 C5         [ 2]  326 	ldw	x, #0x50c5
      0092A2 F6               [ 1]  327 	ld	a, (x)
      0092A3 A4 FB            [ 1]  328 	and	a, #0xfb
      0092A5 F7               [ 1]  329 	ld	(x), a
      0092A6                        330 00103$:
                                    331 ;	lib/stm8s_clk.c: 318: CLK->SWR = (uint8_t)CLK_NewClock;
      0092A6 AE 50 C4         [ 2]  332 	ldw	x, #0x50c4
      0092A9 7B 06            [ 1]  333 	ld	a, (0x06, sp)
      0092AB F7               [ 1]  334 	ld	(x), a
                                    335 ;	lib/stm8s_clk.c: 321: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      0092AC AE FF FF         [ 2]  336 	ldw	x, #0xffff
      0092AF                        337 00105$:
      0092AF 90 AE 50 C5      [ 2]  338 	ldw	y, #0x50c5
      0092B3 90 F6            [ 1]  339 	ld	a, (y)
      0092B5 44               [ 1]  340 	srl	a
      0092B6 24 06            [ 1]  341 	jrnc	00107$
      0092B8 5D               [ 2]  342 	tnzw	x
      0092B9 27 03            [ 1]  343 	jreq	00107$
                                    344 ;	lib/stm8s_clk.c: 323: DownCounter--;
      0092BB 5A               [ 2]  345 	decw	x
      0092BC 20 F1            [ 2]  346 	jra	00105$
      0092BE                        347 00107$:
                                    348 ;	lib/stm8s_clk.c: 326: if(DownCounter != 0)
      0092BE 5D               [ 2]  349 	tnzw	x
      0092BF 27 06            [ 1]  350 	jreq	00109$
                                    351 ;	lib/stm8s_clk.c: 328: Swif = SUCCESS;
      0092C1 A6 01            [ 1]  352 	ld	a, #0x01
      0092C3 6B 01            [ 1]  353 	ld	(0x01, sp), a
      0092C5 20 43            [ 2]  354 	jra	00123$
      0092C7                        355 00109$:
                                    356 ;	lib/stm8s_clk.c: 332: Swif = ERROR;
      0092C7 0F 01            [ 1]  357 	clr	(0x01, sp)
      0092C9 20 3F            [ 2]  358 	jra	00123$
      0092CB                        359 00122$:
                                    360 ;	lib/stm8s_clk.c: 338: if (ITState != DISABLE)
      0092CB 0D 07            [ 1]  361 	tnz	(0x07, sp)
      0092CD 27 09            [ 1]  362 	jreq	00112$
                                    363 ;	lib/stm8s_clk.c: 340: CLK->SWCR |= CLK_SWCR_SWIEN;
      0092CF AE 50 C5         [ 2]  364 	ldw	x, #0x50c5
      0092D2 F6               [ 1]  365 	ld	a, (x)
      0092D3 AA 04            [ 1]  366 	or	a, #0x04
      0092D5 F7               [ 1]  367 	ld	(x), a
      0092D6 20 07            [ 2]  368 	jra	00113$
      0092D8                        369 00112$:
                                    370 ;	lib/stm8s_clk.c: 344: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      0092D8 AE 50 C5         [ 2]  371 	ldw	x, #0x50c5
      0092DB F6               [ 1]  372 	ld	a, (x)
      0092DC A4 FB            [ 1]  373 	and	a, #0xfb
      0092DE F7               [ 1]  374 	ld	(x), a
      0092DF                        375 00113$:
                                    376 ;	lib/stm8s_clk.c: 348: CLK->SWR = (uint8_t)CLK_NewClock;
      0092DF AE 50 C4         [ 2]  377 	ldw	x, #0x50c4
      0092E2 7B 06            [ 1]  378 	ld	a, (0x06, sp)
      0092E4 F7               [ 1]  379 	ld	(x), a
                                    380 ;	lib/stm8s_clk.c: 351: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      0092E5 AE FF FF         [ 2]  381 	ldw	x, #0xffff
      0092E8                        382 00115$:
      0092E8 90 AE 50 C5      [ 2]  383 	ldw	y, #0x50c5
      0092EC 90 F6            [ 1]  384 	ld	a, (y)
      0092EE A5 08            [ 1]  385 	bcp	a, #0x08
      0092F0 27 06            [ 1]  386 	jreq	00117$
      0092F2 5D               [ 2]  387 	tnzw	x
      0092F3 27 03            [ 1]  388 	jreq	00117$
                                    389 ;	lib/stm8s_clk.c: 353: DownCounter--;
      0092F5 5A               [ 2]  390 	decw	x
      0092F6 20 F0            [ 2]  391 	jra	00115$
      0092F8                        392 00117$:
                                    393 ;	lib/stm8s_clk.c: 356: if(DownCounter != 0)
      0092F8 5D               [ 2]  394 	tnzw	x
      0092F9 27 0D            [ 1]  395 	jreq	00119$
                                    396 ;	lib/stm8s_clk.c: 359: CLK->SWCR |= CLK_SWCR_SWEN;
      0092FB AE 50 C5         [ 2]  397 	ldw	x, #0x50c5
      0092FE F6               [ 1]  398 	ld	a, (x)
      0092FF AA 02            [ 1]  399 	or	a, #0x02
      009301 F7               [ 1]  400 	ld	(x), a
                                    401 ;	lib/stm8s_clk.c: 360: Swif = SUCCESS;
      009302 A6 01            [ 1]  402 	ld	a, #0x01
      009304 6B 01            [ 1]  403 	ld	(0x01, sp), a
      009306 20 02            [ 2]  404 	jra	00123$
      009308                        405 00119$:
                                    406 ;	lib/stm8s_clk.c: 364: Swif = ERROR;
      009308 0F 01            [ 1]  407 	clr	(0x01, sp)
      00930A                        408 00123$:
                                    409 ;	lib/stm8s_clk.c: 367: if(Swif != ERROR)
      00930A 0D 01            [ 1]  410 	tnz	(0x01, sp)
      00930C 27 31            [ 1]  411 	jreq	00136$
                                    412 ;	lib/stm8s_clk.c: 370: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      00930E 0D 08            [ 1]  413 	tnz	(0x08, sp)
      009310 26 0C            [ 1]  414 	jrne	00132$
      009312 7B 02            [ 1]  415 	ld	a, (0x02, sp)
      009314 A1 E1            [ 1]  416 	cp	a, #0xe1
      009316 26 06            [ 1]  417 	jrne	00132$
                                    418 ;	lib/stm8s_clk.c: 372: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      009318 72 11 50 C0      [ 1]  419 	bres	0x50c0, #0
      00931C 20 21            [ 2]  420 	jra	00136$
      00931E                        421 00132$:
                                    422 ;	lib/stm8s_clk.c: 374: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      00931E 0D 08            [ 1]  423 	tnz	(0x08, sp)
      009320 26 0F            [ 1]  424 	jrne	00128$
      009322 7B 02            [ 1]  425 	ld	a, (0x02, sp)
      009324 A1 D2            [ 1]  426 	cp	a, #0xd2
      009326 26 09            [ 1]  427 	jrne	00128$
                                    428 ;	lib/stm8s_clk.c: 376: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      009328 AE 50 C0         [ 2]  429 	ldw	x, #0x50c0
      00932B F6               [ 1]  430 	ld	a, (x)
      00932C A4 F7            [ 1]  431 	and	a, #0xf7
      00932E F7               [ 1]  432 	ld	(x), a
      00932F 20 0E            [ 2]  433 	jra	00136$
      009331                        434 00128$:
                                    435 ;	lib/stm8s_clk.c: 378: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      009331 0D 08            [ 1]  436 	tnz	(0x08, sp)
      009333 26 0A            [ 1]  437 	jrne	00136$
      009335 7B 02            [ 1]  438 	ld	a, (0x02, sp)
      009337 A1 B4            [ 1]  439 	cp	a, #0xb4
      009339 26 04            [ 1]  440 	jrne	00136$
                                    441 ;	lib/stm8s_clk.c: 380: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      00933B 72 11 50 C1      [ 1]  442 	bres	0x50c1, #0
      00933F                        443 00136$:
                                    444 ;	lib/stm8s_clk.c: 383: return(Swif);
      00933F 7B 01            [ 1]  445 	ld	a, (0x01, sp)
      009341 85               [ 2]  446 	popw	x
      009342 81               [ 4]  447 	ret
                                    448 ;	lib/stm8s_clk.c: 392: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    449 ;	-----------------------------------------
                                    450 ;	 function CLK_HSIPrescalerConfig
                                    451 ;	-----------------------------------------
      009343                        452 _CLK_HSIPrescalerConfig:
                                    453 ;	lib/stm8s_clk.c: 396: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      009343 AE 50 C6         [ 2]  454 	ldw	x, #0x50c6
      009346 F6               [ 1]  455 	ld	a, (x)
      009347 A4 E7            [ 1]  456 	and	a, #0xe7
      009349 F7               [ 1]  457 	ld	(x), a
                                    458 ;	lib/stm8s_clk.c: 399: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      00934A AE 50 C6         [ 2]  459 	ldw	x, #0x50c6
      00934D F6               [ 1]  460 	ld	a, (x)
      00934E 1A 03            [ 1]  461 	or	a, (0x03, sp)
      009350 AE 50 C6         [ 2]  462 	ldw	x, #0x50c6
      009353 F7               [ 1]  463 	ld	(x), a
      009354 81               [ 4]  464 	ret
                                    465 ;	lib/stm8s_clk.c: 411: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    466 ;	-----------------------------------------
                                    467 ;	 function CLK_CCOConfig
                                    468 ;	-----------------------------------------
      009355                        469 _CLK_CCOConfig:
                                    470 ;	lib/stm8s_clk.c: 415: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      009355 AE 50 C9         [ 2]  471 	ldw	x, #0x50c9
      009358 F6               [ 1]  472 	ld	a, (x)
      009359 A4 E1            [ 1]  473 	and	a, #0xe1
      00935B F7               [ 1]  474 	ld	(x), a
                                    475 ;	lib/stm8s_clk.c: 418: CLK->CCOR |= (uint8_t)CLK_CCO;
      00935C AE 50 C9         [ 2]  476 	ldw	x, #0x50c9
      00935F F6               [ 1]  477 	ld	a, (x)
      009360 1A 03            [ 1]  478 	or	a, (0x03, sp)
      009362 AE 50 C9         [ 2]  479 	ldw	x, #0x50c9
      009365 F7               [ 1]  480 	ld	(x), a
                                    481 ;	lib/stm8s_clk.c: 421: CLK->CCOR |= CLK_CCOR_CCOEN;
      009366 72 10 50 C9      [ 1]  482 	bset	0x50c9, #0
      00936A 81               [ 4]  483 	ret
                                    484 ;	lib/stm8s_clk.c: 432: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    485 ;	-----------------------------------------
                                    486 ;	 function CLK_ITConfig
                                    487 ;	-----------------------------------------
      00936B                        488 _CLK_ITConfig:
      00936B 88               [ 1]  489 	push	a
                                    490 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      00936C 7B 04            [ 1]  491 	ld	a, (0x04, sp)
      00936E A1 0C            [ 1]  492 	cp	a, #0x0c
      009370 26 06            [ 1]  493 	jrne	00135$
      009372 A6 01            [ 1]  494 	ld	a, #0x01
      009374 6B 01            [ 1]  495 	ld	(0x01, sp), a
      009376 20 02            [ 2]  496 	jra	00136$
      009378                        497 00135$:
      009378 0F 01            [ 1]  498 	clr	(0x01, sp)
      00937A                        499 00136$:
      00937A 7B 04            [ 1]  500 	ld	a, (0x04, sp)
      00937C A1 1C            [ 1]  501 	cp	a, #0x1c
      00937E 26 03            [ 1]  502 	jrne	00138$
      009380 A6 01            [ 1]  503 	ld	a, #0x01
      009382 21                     504 	.byte 0x21
      009383                        505 00138$:
      009383 4F               [ 1]  506 	clr	a
      009384                        507 00139$:
                                    508 ;	lib/stm8s_clk.c: 434: if (NewState != DISABLE)
      009384 0D 05            [ 1]  509 	tnz	(0x05, sp)
      009386 27 19            [ 1]  510 	jreq	00110$
                                    511 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      009388 0D 01            [ 1]  512 	tnz	(0x01, sp)
      00938A 26 0C            [ 1]  513 	jrne	00102$
      00938C 4D               [ 1]  514 	tnz	a
      00938D 27 29            [ 1]  515 	jreq	00112$
                                    516 ;	lib/stm8s_clk.c: 439: CLK->SWCR |= CLK_SWCR_SWIEN;
      00938F AE 50 C5         [ 2]  517 	ldw	x, #0x50c5
      009392 F6               [ 1]  518 	ld	a, (x)
      009393 AA 04            [ 1]  519 	or	a, #0x04
      009395 F7               [ 1]  520 	ld	(x), a
                                    521 ;	lib/stm8s_clk.c: 440: break;
      009396 20 20            [ 2]  522 	jra	00112$
                                    523 ;	lib/stm8s_clk.c: 441: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      009398                        524 00102$:
                                    525 ;	lib/stm8s_clk.c: 442: CLK->CSSR |= CLK_CSSR_CSSDIE;
      009398 AE 50 C8         [ 2]  526 	ldw	x, #0x50c8
      00939B F6               [ 1]  527 	ld	a, (x)
      00939C AA 04            [ 1]  528 	or	a, #0x04
      00939E F7               [ 1]  529 	ld	(x), a
                                    530 ;	lib/stm8s_clk.c: 443: break;
      00939F 20 17            [ 2]  531 	jra	00112$
                                    532 ;	lib/stm8s_clk.c: 446: }
      0093A1                        533 00110$:
                                    534 ;	lib/stm8s_clk.c: 450: switch (CLK_IT)
      0093A1 0D 01            [ 1]  535 	tnz	(0x01, sp)
      0093A3 26 0C            [ 1]  536 	jrne	00106$
      0093A5 4D               [ 1]  537 	tnz	a
      0093A6 27 10            [ 1]  538 	jreq	00112$
                                    539 ;	lib/stm8s_clk.c: 453: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      0093A8 AE 50 C5         [ 2]  540 	ldw	x, #0x50c5
      0093AB F6               [ 1]  541 	ld	a, (x)
      0093AC A4 FB            [ 1]  542 	and	a, #0xfb
      0093AE F7               [ 1]  543 	ld	(x), a
                                    544 ;	lib/stm8s_clk.c: 454: break;
      0093AF 20 07            [ 2]  545 	jra	00112$
                                    546 ;	lib/stm8s_clk.c: 455: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      0093B1                        547 00106$:
                                    548 ;	lib/stm8s_clk.c: 456: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      0093B1 AE 50 C8         [ 2]  549 	ldw	x, #0x50c8
      0093B4 F6               [ 1]  550 	ld	a, (x)
      0093B5 A4 FB            [ 1]  551 	and	a, #0xfb
      0093B7 F7               [ 1]  552 	ld	(x), a
                                    553 ;	lib/stm8s_clk.c: 460: }
      0093B8                        554 00112$:
      0093B8 84               [ 1]  555 	pop	a
      0093B9 81               [ 4]  556 	ret
                                    557 ;	lib/stm8s_clk.c: 469: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    558 ;	-----------------------------------------
                                    559 ;	 function CLK_SYSCLKConfig
                                    560 ;	-----------------------------------------
      0093BA                        561 _CLK_SYSCLKConfig:
      0093BA 89               [ 2]  562 	pushw	x
                                    563 ;	lib/stm8s_clk.c: 472: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      0093BB 0D 05            [ 1]  564 	tnz	(0x05, sp)
      0093BD 2B 19            [ 1]  565 	jrmi	00102$
                                    566 ;	lib/stm8s_clk.c: 474: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0093BF AE 50 C6         [ 2]  567 	ldw	x, #0x50c6
      0093C2 F6               [ 1]  568 	ld	a, (x)
      0093C3 A4 E7            [ 1]  569 	and	a, #0xe7
      0093C5 F7               [ 1]  570 	ld	(x), a
                                    571 ;	lib/stm8s_clk.c: 475: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      0093C6 AE 50 C6         [ 2]  572 	ldw	x, #0x50c6
      0093C9 F6               [ 1]  573 	ld	a, (x)
      0093CA 6B 02            [ 1]  574 	ld	(0x02, sp), a
      0093CC 7B 05            [ 1]  575 	ld	a, (0x05, sp)
      0093CE A4 18            [ 1]  576 	and	a, #0x18
      0093D0 1A 02            [ 1]  577 	or	a, (0x02, sp)
      0093D2 AE 50 C6         [ 2]  578 	ldw	x, #0x50c6
      0093D5 F7               [ 1]  579 	ld	(x), a
      0093D6 20 17            [ 2]  580 	jra	00104$
      0093D8                        581 00102$:
                                    582 ;	lib/stm8s_clk.c: 479: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      0093D8 AE 50 C6         [ 2]  583 	ldw	x, #0x50c6
      0093DB F6               [ 1]  584 	ld	a, (x)
      0093DC A4 F8            [ 1]  585 	and	a, #0xf8
      0093DE F7               [ 1]  586 	ld	(x), a
                                    587 ;	lib/stm8s_clk.c: 480: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      0093DF AE 50 C6         [ 2]  588 	ldw	x, #0x50c6
      0093E2 F6               [ 1]  589 	ld	a, (x)
      0093E3 6B 01            [ 1]  590 	ld	(0x01, sp), a
      0093E5 7B 05            [ 1]  591 	ld	a, (0x05, sp)
      0093E7 A4 07            [ 1]  592 	and	a, #0x07
      0093E9 1A 01            [ 1]  593 	or	a, (0x01, sp)
      0093EB AE 50 C6         [ 2]  594 	ldw	x, #0x50c6
      0093EE F7               [ 1]  595 	ld	(x), a
      0093EF                        596 00104$:
      0093EF 85               [ 2]  597 	popw	x
      0093F0 81               [ 4]  598 	ret
                                    599 ;	lib/stm8s_clk.c: 490: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    600 ;	-----------------------------------------
                                    601 ;	 function CLK_SWIMConfig
                                    602 ;	-----------------------------------------
      0093F1                        603 _CLK_SWIMConfig:
                                    604 ;	lib/stm8s_clk.c: 493: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      0093F1 0D 03            [ 1]  605 	tnz	(0x03, sp)
      0093F3 27 05            [ 1]  606 	jreq	00102$
                                    607 ;	lib/stm8s_clk.c: 496: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      0093F5 72 10 50 CD      [ 1]  608 	bset	0x50cd, #0
      0093F9 81               [ 4]  609 	ret
      0093FA                        610 00102$:
                                    611 ;	lib/stm8s_clk.c: 501: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      0093FA 72 11 50 CD      [ 1]  612 	bres	0x50cd, #0
      0093FE 81               [ 4]  613 	ret
                                    614 ;	lib/stm8s_clk.c: 512: void CLK_ClockSecuritySystemEnable(void)
                                    615 ;	-----------------------------------------
                                    616 ;	 function CLK_ClockSecuritySystemEnable
                                    617 ;	-----------------------------------------
      0093FF                        618 _CLK_ClockSecuritySystemEnable:
                                    619 ;	lib/stm8s_clk.c: 515: CLK->CSSR |= CLK_CSSR_CSSEN;
      0093FF 72 10 50 C8      [ 1]  620 	bset	0x50c8, #0
      009403 81               [ 4]  621 	ret
                                    622 ;	lib/stm8s_clk.c: 524: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    623 ;	-----------------------------------------
                                    624 ;	 function CLK_GetSYSCLKSource
                                    625 ;	-----------------------------------------
      009404                        626 _CLK_GetSYSCLKSource:
                                    627 ;	lib/stm8s_clk.c: 526: return((CLK_Source_TypeDef)CLK->CMSR);
      009404 AE 50 C3         [ 2]  628 	ldw	x, #0x50c3
      009407 F6               [ 1]  629 	ld	a, (x)
      009408 81               [ 4]  630 	ret
                                    631 ;	lib/stm8s_clk.c: 534: uint32_t CLK_GetClockFreq(void)
                                    632 ;	-----------------------------------------
                                    633 ;	 function CLK_GetClockFreq
                                    634 ;	-----------------------------------------
      009409                        635 _CLK_GetClockFreq:
      009409 52 07            [ 2]  636 	sub	sp, #7
                                    637 ;	lib/stm8s_clk.c: 541: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      00940B AE 50 C3         [ 2]  638 	ldw	x, #0x50c3
      00940E F6               [ 1]  639 	ld	a, (x)
      00940F 6B 05            [ 1]  640 	ld	(0x05, sp), a
                                    641 ;	lib/stm8s_clk.c: 543: if (clocksource == CLK_SOURCE_HSI)
      009411 7B 05            [ 1]  642 	ld	a, (0x05, sp)
      009413 A1 E1            [ 1]  643 	cp	a, #0xe1
      009415 26 2C            [ 1]  644 	jrne	00105$
                                    645 ;	lib/stm8s_clk.c: 545: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      009417 AE 50 C6         [ 2]  646 	ldw	x, #0x50c6
      00941A F6               [ 1]  647 	ld	a, (x)
      00941B A4 18            [ 1]  648 	and	a, #0x18
                                    649 ;	lib/stm8s_clk.c: 546: tmp = (uint8_t)(tmp >> 3);
      00941D 44               [ 1]  650 	srl	a
      00941E 44               [ 1]  651 	srl	a
      00941F 44               [ 1]  652 	srl	a
                                    653 ;	lib/stm8s_clk.c: 547: presc = HSIDivFactor[tmp];
      009420 AE 94 F6         [ 2]  654 	ldw	x, #_HSIDivFactor+0
      009423 1F 06            [ 2]  655 	ldw	(0x06, sp), x
      009425 5F               [ 1]  656 	clrw	x
      009426 97               [ 1]  657 	ld	xl, a
      009427 72 FB 06         [ 2]  658 	addw	x, (0x06, sp)
      00942A F6               [ 1]  659 	ld	a, (x)
                                    660 ;	lib/stm8s_clk.c: 548: clockfrequency = HSI_VALUE / presc;
      00942B 5F               [ 1]  661 	clrw	x
      00942C 97               [ 1]  662 	ld	xl, a
      00942D 90 5F            [ 1]  663 	clrw	y
      00942F 89               [ 2]  664 	pushw	x
      009430 90 89            [ 2]  665 	pushw	y
      009432 4B 00            [ 1]  666 	push	#0x00
      009434 4B 24            [ 1]  667 	push	#0x24
      009436 4B F4            [ 1]  668 	push	#0xf4
      009438 4B 00            [ 1]  669 	push	#0x00
      00943A CD 9B 19         [ 4]  670 	call	__divulong
      00943D 5B 08            [ 2]  671 	addw	sp, #8
      00943F 1F 03            [ 2]  672 	ldw	(0x03, sp), x
      009441 20 1A            [ 2]  673 	jra	00106$
      009443                        674 00105$:
                                    675 ;	lib/stm8s_clk.c: 550: else if ( clocksource == CLK_SOURCE_LSI)
      009443 7B 05            [ 1]  676 	ld	a, (0x05, sp)
      009445 A1 D2            [ 1]  677 	cp	a, #0xd2
      009447 26 0B            [ 1]  678 	jrne	00102$
                                    679 ;	lib/stm8s_clk.c: 552: clockfrequency = LSI_VALUE;
      009449 AE F4 00         [ 2]  680 	ldw	x, #0xf400
      00944C 1F 03            [ 2]  681 	ldw	(0x03, sp), x
      00944E 90 AE 00 01      [ 2]  682 	ldw	y, #0x0001
      009452 20 09            [ 2]  683 	jra	00106$
      009454                        684 00102$:
                                    685 ;	lib/stm8s_clk.c: 556: clockfrequency = HSE_VALUE;
      009454 AE 24 00         [ 2]  686 	ldw	x, #0x2400
      009457 1F 03            [ 2]  687 	ldw	(0x03, sp), x
      009459 90 AE 00 F4      [ 2]  688 	ldw	y, #0x00f4
      00945D                        689 00106$:
                                    690 ;	lib/stm8s_clk.c: 559: return((uint32_t)clockfrequency);
      00945D 1E 03            [ 2]  691 	ldw	x, (0x03, sp)
      00945F 5B 07            [ 2]  692 	addw	sp, #7
      009461 81               [ 4]  693 	ret
                                    694 ;	lib/stm8s_clk.c: 569: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    695 ;	-----------------------------------------
                                    696 ;	 function CLK_AdjustHSICalibrationValue
                                    697 ;	-----------------------------------------
      009462                        698 _CLK_AdjustHSICalibrationValue:
                                    699 ;	lib/stm8s_clk.c: 573: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      009462 AE 50 CC         [ 2]  700 	ldw	x, #0x50cc
      009465 F6               [ 1]  701 	ld	a, (x)
      009466 A4 F8            [ 1]  702 	and	a, #0xf8
      009468 1A 03            [ 1]  703 	or	a, (0x03, sp)
      00946A AE 50 CC         [ 2]  704 	ldw	x, #0x50cc
      00946D F7               [ 1]  705 	ld	(x), a
      00946E 81               [ 4]  706 	ret
                                    707 ;	lib/stm8s_clk.c: 585: void CLK_SYSCLKEmergencyClear(void)
                                    708 ;	-----------------------------------------
                                    709 ;	 function CLK_SYSCLKEmergencyClear
                                    710 ;	-----------------------------------------
      00946F                        711 _CLK_SYSCLKEmergencyClear:
                                    712 ;	lib/stm8s_clk.c: 587: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      00946F 72 11 50 C5      [ 1]  713 	bres	0x50c5, #0
      009473 81               [ 4]  714 	ret
                                    715 ;	lib/stm8s_clk.c: 597: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    716 ;	-----------------------------------------
                                    717 ;	 function CLK_GetFlagStatus
                                    718 ;	-----------------------------------------
      009474                        719 _CLK_GetFlagStatus:
      009474 88               [ 1]  720 	push	a
                                    721 ;	lib/stm8s_clk.c: 604: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      009475 4F               [ 1]  722 	clr	a
      009476 97               [ 1]  723 	ld	xl, a
      009477 7B 04            [ 1]  724 	ld	a, (0x04, sp)
      009479 95               [ 1]  725 	ld	xh, a
                                    726 ;	lib/stm8s_clk.c: 607: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      00947A A3 01 00         [ 2]  727 	cpw	x, #0x0100
      00947D 26 06            [ 1]  728 	jrne	00111$
                                    729 ;	lib/stm8s_clk.c: 609: tmpreg = CLK->ICKR;
      00947F AE 50 C0         [ 2]  730 	ldw	x, #0x50c0
      009482 F6               [ 1]  731 	ld	a, (x)
      009483 20 25            [ 2]  732 	jra	00112$
      009485                        733 00111$:
                                    734 ;	lib/stm8s_clk.c: 611: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      009485 A3 02 00         [ 2]  735 	cpw	x, #0x0200
      009488 26 06            [ 1]  736 	jrne	00108$
                                    737 ;	lib/stm8s_clk.c: 613: tmpreg = CLK->ECKR;
      00948A AE 50 C1         [ 2]  738 	ldw	x, #0x50c1
      00948D F6               [ 1]  739 	ld	a, (x)
      00948E 20 1A            [ 2]  740 	jra	00112$
      009490                        741 00108$:
                                    742 ;	lib/stm8s_clk.c: 615: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      009490 A3 03 00         [ 2]  743 	cpw	x, #0x0300
      009493 26 06            [ 1]  744 	jrne	00105$
                                    745 ;	lib/stm8s_clk.c: 617: tmpreg = CLK->SWCR;
      009495 AE 50 C5         [ 2]  746 	ldw	x, #0x50c5
      009498 F6               [ 1]  747 	ld	a, (x)
      009499 20 0F            [ 2]  748 	jra	00112$
      00949B                        749 00105$:
                                    750 ;	lib/stm8s_clk.c: 619: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      00949B A3 04 00         [ 2]  751 	cpw	x, #0x0400
      00949E 26 06            [ 1]  752 	jrne	00102$
                                    753 ;	lib/stm8s_clk.c: 621: tmpreg = CLK->CSSR;
      0094A0 AE 50 C8         [ 2]  754 	ldw	x, #0x50c8
      0094A3 F6               [ 1]  755 	ld	a, (x)
      0094A4 20 04            [ 2]  756 	jra	00112$
      0094A6                        757 00102$:
                                    758 ;	lib/stm8s_clk.c: 625: tmpreg = CLK->CCOR;
      0094A6 AE 50 C9         [ 2]  759 	ldw	x, #0x50c9
      0094A9 F6               [ 1]  760 	ld	a, (x)
      0094AA                        761 00112$:
                                    762 ;	lib/stm8s_clk.c: 628: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      0094AA 88               [ 1]  763 	push	a
      0094AB 7B 06            [ 1]  764 	ld	a, (0x06, sp)
      0094AD 6B 02            [ 1]  765 	ld	(0x02, sp), a
      0094AF 84               [ 1]  766 	pop	a
      0094B0 14 01            [ 1]  767 	and	a, (0x01, sp)
      0094B2 4D               [ 1]  768 	tnz	a
      0094B3 27 03            [ 1]  769 	jreq	00114$
                                    770 ;	lib/stm8s_clk.c: 630: bitstatus = SET;
      0094B5 A6 01            [ 1]  771 	ld	a, #0x01
                                    772 ;	lib/stm8s_clk.c: 634: bitstatus = RESET;
      0094B7 21                     773 	.byte 0x21
      0094B8                        774 00114$:
      0094B8 4F               [ 1]  775 	clr	a
      0094B9                        776 00115$:
                                    777 ;	lib/stm8s_clk.c: 638: return((FlagStatus)bitstatus);
      0094B9 5B 01            [ 2]  778 	addw	sp, #1
      0094BB 81               [ 4]  779 	ret
                                    780 ;	lib/stm8s_clk.c: 647: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    781 ;	-----------------------------------------
                                    782 ;	 function CLK_GetITStatus
                                    783 ;	-----------------------------------------
      0094BC                        784 _CLK_GetITStatus:
                                    785 ;	lib/stm8s_clk.c: 651: if (CLK_IT == CLK_IT_SWIF)
      0094BC 7B 03            [ 1]  786 	ld	a, (0x03, sp)
      0094BE A1 1C            [ 1]  787 	cp	a, #0x1c
      0094C0 26 0F            [ 1]  788 	jrne	00108$
                                    789 ;	lib/stm8s_clk.c: 654: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0094C2 AE 50 C5         [ 2]  790 	ldw	x, #0x50c5
      0094C5 F6               [ 1]  791 	ld	a, (x)
      0094C6 14 03            [ 1]  792 	and	a, (0x03, sp)
      0094C8 A1 0C            [ 1]  793 	cp	a, #0x0c
      0094CA 26 03            [ 1]  794 	jrne	00102$
                                    795 ;	lib/stm8s_clk.c: 656: bitstatus = SET;
      0094CC A6 01            [ 1]  796 	ld	a, #0x01
      0094CE 81               [ 4]  797 	ret
      0094CF                        798 00102$:
                                    799 ;	lib/stm8s_clk.c: 660: bitstatus = RESET;
      0094CF 4F               [ 1]  800 	clr	a
      0094D0 81               [ 4]  801 	ret
      0094D1                        802 00108$:
                                    803 ;	lib/stm8s_clk.c: 666: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0094D1 AE 50 C8         [ 2]  804 	ldw	x, #0x50c8
      0094D4 F6               [ 1]  805 	ld	a, (x)
      0094D5 14 03            [ 1]  806 	and	a, (0x03, sp)
      0094D7 A1 0C            [ 1]  807 	cp	a, #0x0c
      0094D9 26 03            [ 1]  808 	jrne	00105$
                                    809 ;	lib/stm8s_clk.c: 668: bitstatus = SET;
      0094DB A6 01            [ 1]  810 	ld	a, #0x01
      0094DD 81               [ 4]  811 	ret
      0094DE                        812 00105$:
                                    813 ;	lib/stm8s_clk.c: 672: bitstatus = RESET;
      0094DE 4F               [ 1]  814 	clr	a
                                    815 ;	lib/stm8s_clk.c: 677: return bitstatus;
      0094DF 81               [ 4]  816 	ret
                                    817 ;	lib/stm8s_clk.c: 686: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    818 ;	-----------------------------------------
                                    819 ;	 function CLK_ClearITPendingBit
                                    820 ;	-----------------------------------------
      0094E0                        821 _CLK_ClearITPendingBit:
                                    822 ;	lib/stm8s_clk.c: 689: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      0094E0 7B 03            [ 1]  823 	ld	a, (0x03, sp)
      0094E2 A1 0C            [ 1]  824 	cp	a, #0x0c
      0094E4 26 08            [ 1]  825 	jrne	00102$
                                    826 ;	lib/stm8s_clk.c: 692: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      0094E6 AE 50 C8         [ 2]  827 	ldw	x, #0x50c8
      0094E9 F6               [ 1]  828 	ld	a, (x)
      0094EA A4 F7            [ 1]  829 	and	a, #0xf7
      0094EC F7               [ 1]  830 	ld	(x), a
      0094ED 81               [ 4]  831 	ret
      0094EE                        832 00102$:
                                    833 ;	lib/stm8s_clk.c: 697: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      0094EE AE 50 C5         [ 2]  834 	ldw	x, #0x50c5
      0094F1 F6               [ 1]  835 	ld	a, (x)
      0094F2 A4 F7            [ 1]  836 	and	a, #0xf7
      0094F4 F7               [ 1]  837 	ld	(x), a
      0094F5 81               [ 4]  838 	ret
                                    839 	.area CODE
      0094F6                        840 _HSIDivFactor:
      0094F6 01                     841 	.db #0x01	; 1
      0094F7 02                     842 	.db #0x02	; 2
      0094F8 04                     843 	.db #0x04	; 4
      0094F9 08                     844 	.db #0x08	; 8
      0094FA                        845 _CLKPrescTable:
      0094FA 01                     846 	.db #0x01	; 1
      0094FB 02                     847 	.db #0x02	; 2
      0094FC 04                     848 	.db #0x04	; 4
      0094FD 08                     849 	.db #0x08	; 8
      0094FE 0A                     850 	.db #0x0a	; 10
      0094FF 10                     851 	.db #0x10	; 16
      009500 14                     852 	.db #0x14	; 20
      009501 28                     853 	.db #0x28	; 40
                                    854 	.area INITIALIZER
                                    855 	.area CABS (ABS)
