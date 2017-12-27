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
      008CA5                         68 _CLK_DeInit:
                                     69 ;	lib/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      008CA5 35 01 50 C0      [ 1]   70 	mov	0x50c0+0, #0x01
                                     71 ;	lib/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      008CA9 35 00 50 C1      [ 1]   72 	mov	0x50c1+0, #0x00
                                     73 ;	lib/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      008CAD 35 E1 50 C4      [ 1]   74 	mov	0x50c4+0, #0xe1
                                     75 ;	lib/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      008CB1 35 00 50 C5      [ 1]   76 	mov	0x50c5+0, #0x00
                                     77 ;	lib/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      008CB5 35 18 50 C6      [ 1]   78 	mov	0x50c6+0, #0x18
                                     79 ;	lib/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      008CB9 35 FF 50 C7      [ 1]   80 	mov	0x50c7+0, #0xff
                                     81 ;	lib/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      008CBD 35 FF 50 CA      [ 1]   82 	mov	0x50ca+0, #0xff
                                     83 ;	lib/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      008CC1 35 00 50 C8      [ 1]   84 	mov	0x50c8+0, #0x00
                                     85 ;	lib/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008CC5 35 00 50 C9      [ 1]   86 	mov	0x50c9+0, #0x00
                                     87 ;	lib/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      008CC9                         88 00101$:
      008CC9 AE 50 C9         [ 2]   89 	ldw	x, #0x50c9
      008CCC F6               [ 1]   90 	ld	a, (x)
      008CCD 44               [ 1]   91 	srl	a
      008CCE 25 F9            [ 1]   92 	jrc	00101$
                                     93 ;	lib/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008CD0 35 00 50 C9      [ 1]   94 	mov	0x50c9+0, #0x00
                                     95 ;	lib/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      008CD4 35 00 50 CC      [ 1]   96 	mov	0x50cc+0, #0x00
                                     97 ;	lib/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      008CD8 35 00 50 CD      [ 1]   98 	mov	0x50cd+0, #0x00
      008CDC 81               [ 4]   99 	ret
                                    100 ;	lib/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function CLK_FastHaltWakeUpCmd
                                    103 ;	-----------------------------------------
      008CDD                        104 _CLK_FastHaltWakeUpCmd:
                                    105 ;	lib/stm8s_clk.c: 102: if (NewState != DISABLE)
      008CDD 0D 03            [ 1]  106 	tnz	(0x03, sp)
      008CDF 27 08            [ 1]  107 	jreq	00102$
                                    108 ;	lib/stm8s_clk.c: 105: CLK->ICKR |= CLK_ICKR_FHWU;
      008CE1 AE 50 C0         [ 2]  109 	ldw	x, #0x50c0
      008CE4 F6               [ 1]  110 	ld	a, (x)
      008CE5 AA 04            [ 1]  111 	or	a, #0x04
      008CE7 F7               [ 1]  112 	ld	(x), a
      008CE8 81               [ 4]  113 	ret
      008CE9                        114 00102$:
                                    115 ;	lib/stm8s_clk.c: 110: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      008CE9 AE 50 C0         [ 2]  116 	ldw	x, #0x50c0
      008CEC F6               [ 1]  117 	ld	a, (x)
      008CED A4 FB            [ 1]  118 	and	a, #0xfb
      008CEF F7               [ 1]  119 	ld	(x), a
      008CF0 81               [ 4]  120 	ret
                                    121 ;	lib/stm8s_clk.c: 119: void CLK_HSECmd(FunctionalState NewState)
                                    122 ;	-----------------------------------------
                                    123 ;	 function CLK_HSECmd
                                    124 ;	-----------------------------------------
      008CF1                        125 _CLK_HSECmd:
                                    126 ;	lib/stm8s_clk.c: 122: if (NewState != DISABLE)
      008CF1 0D 03            [ 1]  127 	tnz	(0x03, sp)
      008CF3 27 05            [ 1]  128 	jreq	00102$
                                    129 ;	lib/stm8s_clk.c: 125: CLK->ECKR |= CLK_ECKR_HSEEN;
      008CF5 72 10 50 C1      [ 1]  130 	bset	0x50c1, #0
      008CF9 81               [ 4]  131 	ret
      008CFA                        132 00102$:
                                    133 ;	lib/stm8s_clk.c: 130: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      008CFA 72 11 50 C1      [ 1]  134 	bres	0x50c1, #0
      008CFE 81               [ 4]  135 	ret
                                    136 ;	lib/stm8s_clk.c: 139: void CLK_HSICmd(FunctionalState NewState)
                                    137 ;	-----------------------------------------
                                    138 ;	 function CLK_HSICmd
                                    139 ;	-----------------------------------------
      008CFF                        140 _CLK_HSICmd:
                                    141 ;	lib/stm8s_clk.c: 142: if (NewState != DISABLE)
      008CFF 0D 03            [ 1]  142 	tnz	(0x03, sp)
      008D01 27 05            [ 1]  143 	jreq	00102$
                                    144 ;	lib/stm8s_clk.c: 145: CLK->ICKR |= CLK_ICKR_HSIEN;
      008D03 72 10 50 C0      [ 1]  145 	bset	0x50c0, #0
      008D07 81               [ 4]  146 	ret
      008D08                        147 00102$:
                                    148 ;	lib/stm8s_clk.c: 150: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      008D08 72 11 50 C0      [ 1]  149 	bres	0x50c0, #0
      008D0C 81               [ 4]  150 	ret
                                    151 ;	lib/stm8s_clk.c: 160: void CLK_LSICmd(FunctionalState NewState)
                                    152 ;	-----------------------------------------
                                    153 ;	 function CLK_LSICmd
                                    154 ;	-----------------------------------------
      008D0D                        155 _CLK_LSICmd:
                                    156 ;	lib/stm8s_clk.c: 163: if (NewState != DISABLE)
      008D0D 0D 03            [ 1]  157 	tnz	(0x03, sp)
      008D0F 27 08            [ 1]  158 	jreq	00102$
                                    159 ;	lib/stm8s_clk.c: 166: CLK->ICKR |= CLK_ICKR_LSIEN;
      008D11 AE 50 C0         [ 2]  160 	ldw	x, #0x50c0
      008D14 F6               [ 1]  161 	ld	a, (x)
      008D15 AA 08            [ 1]  162 	or	a, #0x08
      008D17 F7               [ 1]  163 	ld	(x), a
      008D18 81               [ 4]  164 	ret
      008D19                        165 00102$:
                                    166 ;	lib/stm8s_clk.c: 171: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      008D19 AE 50 C0         [ 2]  167 	ldw	x, #0x50c0
      008D1C F6               [ 1]  168 	ld	a, (x)
      008D1D A4 F7            [ 1]  169 	and	a, #0xf7
      008D1F F7               [ 1]  170 	ld	(x), a
      008D20 81               [ 4]  171 	ret
                                    172 ;	lib/stm8s_clk.c: 181: void CLK_CCOCmd(FunctionalState NewState)
                                    173 ;	-----------------------------------------
                                    174 ;	 function CLK_CCOCmd
                                    175 ;	-----------------------------------------
      008D21                        176 _CLK_CCOCmd:
                                    177 ;	lib/stm8s_clk.c: 184: if (NewState != DISABLE)
      008D21 0D 03            [ 1]  178 	tnz	(0x03, sp)
      008D23 27 05            [ 1]  179 	jreq	00102$
                                    180 ;	lib/stm8s_clk.c: 187: CLK->CCOR |= CLK_CCOR_CCOEN;
      008D25 72 10 50 C9      [ 1]  181 	bset	0x50c9, #0
      008D29 81               [ 4]  182 	ret
      008D2A                        183 00102$:
                                    184 ;	lib/stm8s_clk.c: 192: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      008D2A 72 11 50 C9      [ 1]  185 	bres	0x50c9, #0
      008D2E 81               [ 4]  186 	ret
                                    187 ;	lib/stm8s_clk.c: 203: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    188 ;	-----------------------------------------
                                    189 ;	 function CLK_ClockSwitchCmd
                                    190 ;	-----------------------------------------
      008D2F                        191 _CLK_ClockSwitchCmd:
                                    192 ;	lib/stm8s_clk.c: 206: if (NewState != DISABLE )
      008D2F 0D 03            [ 1]  193 	tnz	(0x03, sp)
      008D31 27 08            [ 1]  194 	jreq	00102$
                                    195 ;	lib/stm8s_clk.c: 209: CLK->SWCR |= CLK_SWCR_SWEN;
      008D33 AE 50 C5         [ 2]  196 	ldw	x, #0x50c5
      008D36 F6               [ 1]  197 	ld	a, (x)
      008D37 AA 02            [ 1]  198 	or	a, #0x02
      008D39 F7               [ 1]  199 	ld	(x), a
      008D3A 81               [ 4]  200 	ret
      008D3B                        201 00102$:
                                    202 ;	lib/stm8s_clk.c: 214: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      008D3B AE 50 C5         [ 2]  203 	ldw	x, #0x50c5
      008D3E F6               [ 1]  204 	ld	a, (x)
      008D3F A4 FD            [ 1]  205 	and	a, #0xfd
      008D41 F7               [ 1]  206 	ld	(x), a
      008D42 81               [ 4]  207 	ret
                                    208 ;	lib/stm8s_clk.c: 226: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    209 ;	-----------------------------------------
                                    210 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    211 ;	-----------------------------------------
      008D43                        212 _CLK_SlowActiveHaltWakeUpCmd:
                                    213 ;	lib/stm8s_clk.c: 229: if (NewState != DISABLE)
      008D43 0D 03            [ 1]  214 	tnz	(0x03, sp)
      008D45 27 08            [ 1]  215 	jreq	00102$
                                    216 ;	lib/stm8s_clk.c: 232: CLK->ICKR |= CLK_ICKR_SWUAH;
      008D47 AE 50 C0         [ 2]  217 	ldw	x, #0x50c0
      008D4A F6               [ 1]  218 	ld	a, (x)
      008D4B AA 20            [ 1]  219 	or	a, #0x20
      008D4D F7               [ 1]  220 	ld	(x), a
      008D4E 81               [ 4]  221 	ret
      008D4F                        222 00102$:
                                    223 ;	lib/stm8s_clk.c: 237: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      008D4F AE 50 C0         [ 2]  224 	ldw	x, #0x50c0
      008D52 F6               [ 1]  225 	ld	a, (x)
      008D53 A4 DF            [ 1]  226 	and	a, #0xdf
      008D55 F7               [ 1]  227 	ld	(x), a
      008D56 81               [ 4]  228 	ret
                                    229 ;	lib/stm8s_clk.c: 249: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    230 ;	-----------------------------------------
                                    231 ;	 function CLK_PeripheralClockConfig
                                    232 ;	-----------------------------------------
      008D57                        233 _CLK_PeripheralClockConfig:
      008D57 89               [ 2]  234 	pushw	x
                                    235 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008D58 7B 05            [ 1]  236 	ld	a, (0x05, sp)
      008D5A A4 0F            [ 1]  237 	and	a, #0x0f
      008D5C 88               [ 1]  238 	push	a
      008D5D A6 01            [ 1]  239 	ld	a, #0x01
      008D5F 6B 02            [ 1]  240 	ld	(0x02, sp), a
      008D61 84               [ 1]  241 	pop	a
      008D62 4D               [ 1]  242 	tnz	a
      008D63 27 05            [ 1]  243 	jreq	00125$
      008D65                        244 00124$:
      008D65 08 01            [ 1]  245 	sll	(0x01, sp)
      008D67 4A               [ 1]  246 	dec	a
      008D68 26 FB            [ 1]  247 	jrne	00124$
      008D6A                        248 00125$:
                                    249 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008D6A 7B 01            [ 1]  250 	ld	a, (0x01, sp)
      008D6C 43               [ 1]  251 	cpl	a
      008D6D 6B 02            [ 1]  252 	ld	(0x02, sp), a
                                    253 ;	lib/stm8s_clk.c: 252: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      008D6F 7B 05            [ 1]  254 	ld	a, (0x05, sp)
      008D71 A5 10            [ 1]  255 	bcp	a, #0x10
      008D73 26 1C            [ 1]  256 	jrne	00108$
                                    257 ;	lib/stm8s_clk.c: 254: if (NewState != DISABLE)
      008D75 0D 06            [ 1]  258 	tnz	(0x06, sp)
      008D77 27 0C            [ 1]  259 	jreq	00102$
                                    260 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008D79 AE 50 C7         [ 2]  261 	ldw	x, #0x50c7
      008D7C F6               [ 1]  262 	ld	a, (x)
      008D7D 1A 01            [ 1]  263 	or	a, (0x01, sp)
      008D7F AE 50 C7         [ 2]  264 	ldw	x, #0x50c7
      008D82 F7               [ 1]  265 	ld	(x), a
      008D83 20 26            [ 2]  266 	jra	00110$
      008D85                        267 00102$:
                                    268 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008D85 AE 50 C7         [ 2]  269 	ldw	x, #0x50c7
      008D88 F6               [ 1]  270 	ld	a, (x)
      008D89 14 02            [ 1]  271 	and	a, (0x02, sp)
      008D8B AE 50 C7         [ 2]  272 	ldw	x, #0x50c7
      008D8E F7               [ 1]  273 	ld	(x), a
      008D8F 20 1A            [ 2]  274 	jra	00110$
      008D91                        275 00108$:
                                    276 ;	lib/stm8s_clk.c: 267: if (NewState != DISABLE)
      008D91 0D 06            [ 1]  277 	tnz	(0x06, sp)
      008D93 27 0C            [ 1]  278 	jreq	00105$
                                    279 ;	lib/stm8s_clk.c: 270: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008D95 AE 50 CA         [ 2]  280 	ldw	x, #0x50ca
      008D98 F6               [ 1]  281 	ld	a, (x)
      008D99 1A 01            [ 1]  282 	or	a, (0x01, sp)
      008D9B AE 50 CA         [ 2]  283 	ldw	x, #0x50ca
      008D9E F7               [ 1]  284 	ld	(x), a
      008D9F 20 0A            [ 2]  285 	jra	00110$
      008DA1                        286 00105$:
                                    287 ;	lib/stm8s_clk.c: 275: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008DA1 AE 50 CA         [ 2]  288 	ldw	x, #0x50ca
      008DA4 F6               [ 1]  289 	ld	a, (x)
      008DA5 14 02            [ 1]  290 	and	a, (0x02, sp)
      008DA7 AE 50 CA         [ 2]  291 	ldw	x, #0x50ca
      008DAA F7               [ 1]  292 	ld	(x), a
      008DAB                        293 00110$:
      008DAB 85               [ 2]  294 	popw	x
      008DAC 81               [ 4]  295 	ret
                                    296 ;	lib/stm8s_clk.c: 292: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    297 ;	-----------------------------------------
                                    298 ;	 function CLK_ClockSwitchConfig
                                    299 ;	-----------------------------------------
      008DAD                        300 _CLK_ClockSwitchConfig:
      008DAD 89               [ 2]  301 	pushw	x
                                    302 ;	lib/stm8s_clk.c: 299: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      008DAE AE 50 C3         [ 2]  303 	ldw	x, #0x50c3
      008DB1 F6               [ 1]  304 	ld	a, (x)
      008DB2 6B 01            [ 1]  305 	ld	(0x01, sp), a
                                    306 ;	lib/stm8s_clk.c: 302: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      008DB4 7B 05            [ 1]  307 	ld	a, (0x05, sp)
      008DB6 A1 01            [ 1]  308 	cp	a, #0x01
      008DB8 26 40            [ 1]  309 	jrne	00122$
                                    310 ;	lib/stm8s_clk.c: 305: CLK->SWCR |= CLK_SWCR_SWEN;
      008DBA AE 50 C5         [ 2]  311 	ldw	x, #0x50c5
      008DBD F6               [ 1]  312 	ld	a, (x)
      008DBE AA 02            [ 1]  313 	or	a, #0x02
      008DC0 F7               [ 1]  314 	ld	(x), a
                                    315 ;	lib/stm8s_clk.c: 308: if (ITState != DISABLE)
      008DC1 0D 07            [ 1]  316 	tnz	(0x07, sp)
      008DC3 27 09            [ 1]  317 	jreq	00102$
                                    318 ;	lib/stm8s_clk.c: 310: CLK->SWCR |= CLK_SWCR_SWIEN;
      008DC5 AE 50 C5         [ 2]  319 	ldw	x, #0x50c5
      008DC8 F6               [ 1]  320 	ld	a, (x)
      008DC9 AA 04            [ 1]  321 	or	a, #0x04
      008DCB F7               [ 1]  322 	ld	(x), a
      008DCC 20 07            [ 2]  323 	jra	00103$
      008DCE                        324 00102$:
                                    325 ;	lib/stm8s_clk.c: 314: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      008DCE AE 50 C5         [ 2]  326 	ldw	x, #0x50c5
      008DD1 F6               [ 1]  327 	ld	a, (x)
      008DD2 A4 FB            [ 1]  328 	and	a, #0xfb
      008DD4 F7               [ 1]  329 	ld	(x), a
      008DD5                        330 00103$:
                                    331 ;	lib/stm8s_clk.c: 318: CLK->SWR = (uint8_t)CLK_NewClock;
      008DD5 AE 50 C4         [ 2]  332 	ldw	x, #0x50c4
      008DD8 7B 06            [ 1]  333 	ld	a, (0x06, sp)
      008DDA F7               [ 1]  334 	ld	(x), a
                                    335 ;	lib/stm8s_clk.c: 321: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      008DDB AE FF FF         [ 2]  336 	ldw	x, #0xffff
      008DDE                        337 00105$:
      008DDE 90 AE 50 C5      [ 2]  338 	ldw	y, #0x50c5
      008DE2 90 F6            [ 1]  339 	ld	a, (y)
      008DE4 44               [ 1]  340 	srl	a
      008DE5 24 06            [ 1]  341 	jrnc	00107$
      008DE7 5D               [ 2]  342 	tnzw	x
      008DE8 27 03            [ 1]  343 	jreq	00107$
                                    344 ;	lib/stm8s_clk.c: 323: DownCounter--;
      008DEA 5A               [ 2]  345 	decw	x
      008DEB 20 F1            [ 2]  346 	jra	00105$
      008DED                        347 00107$:
                                    348 ;	lib/stm8s_clk.c: 326: if(DownCounter != 0)
      008DED 5D               [ 2]  349 	tnzw	x
      008DEE 27 06            [ 1]  350 	jreq	00109$
                                    351 ;	lib/stm8s_clk.c: 328: Swif = SUCCESS;
      008DF0 A6 01            [ 1]  352 	ld	a, #0x01
      008DF2 6B 02            [ 1]  353 	ld	(0x02, sp), a
      008DF4 20 43            [ 2]  354 	jra	00123$
      008DF6                        355 00109$:
                                    356 ;	lib/stm8s_clk.c: 332: Swif = ERROR;
      008DF6 0F 02            [ 1]  357 	clr	(0x02, sp)
      008DF8 20 3F            [ 2]  358 	jra	00123$
      008DFA                        359 00122$:
                                    360 ;	lib/stm8s_clk.c: 338: if (ITState != DISABLE)
      008DFA 0D 07            [ 1]  361 	tnz	(0x07, sp)
      008DFC 27 09            [ 1]  362 	jreq	00112$
                                    363 ;	lib/stm8s_clk.c: 340: CLK->SWCR |= CLK_SWCR_SWIEN;
      008DFE AE 50 C5         [ 2]  364 	ldw	x, #0x50c5
      008E01 F6               [ 1]  365 	ld	a, (x)
      008E02 AA 04            [ 1]  366 	or	a, #0x04
      008E04 F7               [ 1]  367 	ld	(x), a
      008E05 20 07            [ 2]  368 	jra	00113$
      008E07                        369 00112$:
                                    370 ;	lib/stm8s_clk.c: 344: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      008E07 AE 50 C5         [ 2]  371 	ldw	x, #0x50c5
      008E0A F6               [ 1]  372 	ld	a, (x)
      008E0B A4 FB            [ 1]  373 	and	a, #0xfb
      008E0D F7               [ 1]  374 	ld	(x), a
      008E0E                        375 00113$:
                                    376 ;	lib/stm8s_clk.c: 348: CLK->SWR = (uint8_t)CLK_NewClock;
      008E0E AE 50 C4         [ 2]  377 	ldw	x, #0x50c4
      008E11 7B 06            [ 1]  378 	ld	a, (0x06, sp)
      008E13 F7               [ 1]  379 	ld	(x), a
                                    380 ;	lib/stm8s_clk.c: 351: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      008E14 AE FF FF         [ 2]  381 	ldw	x, #0xffff
      008E17                        382 00115$:
      008E17 90 AE 50 C5      [ 2]  383 	ldw	y, #0x50c5
      008E1B 90 F6            [ 1]  384 	ld	a, (y)
      008E1D A5 08            [ 1]  385 	bcp	a, #0x08
      008E1F 27 06            [ 1]  386 	jreq	00117$
      008E21 5D               [ 2]  387 	tnzw	x
      008E22 27 03            [ 1]  388 	jreq	00117$
                                    389 ;	lib/stm8s_clk.c: 353: DownCounter--;
      008E24 5A               [ 2]  390 	decw	x
      008E25 20 F0            [ 2]  391 	jra	00115$
      008E27                        392 00117$:
                                    393 ;	lib/stm8s_clk.c: 356: if(DownCounter != 0)
      008E27 5D               [ 2]  394 	tnzw	x
      008E28 27 0D            [ 1]  395 	jreq	00119$
                                    396 ;	lib/stm8s_clk.c: 359: CLK->SWCR |= CLK_SWCR_SWEN;
      008E2A AE 50 C5         [ 2]  397 	ldw	x, #0x50c5
      008E2D F6               [ 1]  398 	ld	a, (x)
      008E2E AA 02            [ 1]  399 	or	a, #0x02
      008E30 F7               [ 1]  400 	ld	(x), a
                                    401 ;	lib/stm8s_clk.c: 360: Swif = SUCCESS;
      008E31 A6 01            [ 1]  402 	ld	a, #0x01
      008E33 6B 02            [ 1]  403 	ld	(0x02, sp), a
      008E35 20 02            [ 2]  404 	jra	00123$
      008E37                        405 00119$:
                                    406 ;	lib/stm8s_clk.c: 364: Swif = ERROR;
      008E37 0F 02            [ 1]  407 	clr	(0x02, sp)
      008E39                        408 00123$:
                                    409 ;	lib/stm8s_clk.c: 367: if(Swif != ERROR)
      008E39 0D 02            [ 1]  410 	tnz	(0x02, sp)
      008E3B 27 31            [ 1]  411 	jreq	00136$
                                    412 ;	lib/stm8s_clk.c: 370: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      008E3D 0D 08            [ 1]  413 	tnz	(0x08, sp)
      008E3F 26 0C            [ 1]  414 	jrne	00132$
      008E41 7B 01            [ 1]  415 	ld	a, (0x01, sp)
      008E43 A1 E1            [ 1]  416 	cp	a, #0xe1
      008E45 26 06            [ 1]  417 	jrne	00132$
                                    418 ;	lib/stm8s_clk.c: 372: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      008E47 72 11 50 C0      [ 1]  419 	bres	0x50c0, #0
      008E4B 20 21            [ 2]  420 	jra	00136$
      008E4D                        421 00132$:
                                    422 ;	lib/stm8s_clk.c: 374: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      008E4D 0D 08            [ 1]  423 	tnz	(0x08, sp)
      008E4F 26 0F            [ 1]  424 	jrne	00128$
      008E51 7B 01            [ 1]  425 	ld	a, (0x01, sp)
      008E53 A1 D2            [ 1]  426 	cp	a, #0xd2
      008E55 26 09            [ 1]  427 	jrne	00128$
                                    428 ;	lib/stm8s_clk.c: 376: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      008E57 AE 50 C0         [ 2]  429 	ldw	x, #0x50c0
      008E5A F6               [ 1]  430 	ld	a, (x)
      008E5B A4 F7            [ 1]  431 	and	a, #0xf7
      008E5D F7               [ 1]  432 	ld	(x), a
      008E5E 20 0E            [ 2]  433 	jra	00136$
      008E60                        434 00128$:
                                    435 ;	lib/stm8s_clk.c: 378: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      008E60 0D 08            [ 1]  436 	tnz	(0x08, sp)
      008E62 26 0A            [ 1]  437 	jrne	00136$
      008E64 7B 01            [ 1]  438 	ld	a, (0x01, sp)
      008E66 A1 B4            [ 1]  439 	cp	a, #0xb4
      008E68 26 04            [ 1]  440 	jrne	00136$
                                    441 ;	lib/stm8s_clk.c: 380: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      008E6A 72 11 50 C1      [ 1]  442 	bres	0x50c1, #0
      008E6E                        443 00136$:
                                    444 ;	lib/stm8s_clk.c: 383: return(Swif);
      008E6E 7B 02            [ 1]  445 	ld	a, (0x02, sp)
      008E70 85               [ 2]  446 	popw	x
      008E71 81               [ 4]  447 	ret
                                    448 ;	lib/stm8s_clk.c: 392: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    449 ;	-----------------------------------------
                                    450 ;	 function CLK_HSIPrescalerConfig
                                    451 ;	-----------------------------------------
      008E72                        452 _CLK_HSIPrescalerConfig:
                                    453 ;	lib/stm8s_clk.c: 396: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008E72 AE 50 C6         [ 2]  454 	ldw	x, #0x50c6
      008E75 F6               [ 1]  455 	ld	a, (x)
      008E76 A4 E7            [ 1]  456 	and	a, #0xe7
      008E78 F7               [ 1]  457 	ld	(x), a
                                    458 ;	lib/stm8s_clk.c: 399: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      008E79 AE 50 C6         [ 2]  459 	ldw	x, #0x50c6
      008E7C F6               [ 1]  460 	ld	a, (x)
      008E7D 1A 03            [ 1]  461 	or	a, (0x03, sp)
      008E7F AE 50 C6         [ 2]  462 	ldw	x, #0x50c6
      008E82 F7               [ 1]  463 	ld	(x), a
      008E83 81               [ 4]  464 	ret
                                    465 ;	lib/stm8s_clk.c: 411: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    466 ;	-----------------------------------------
                                    467 ;	 function CLK_CCOConfig
                                    468 ;	-----------------------------------------
      008E84                        469 _CLK_CCOConfig:
                                    470 ;	lib/stm8s_clk.c: 415: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      008E84 AE 50 C9         [ 2]  471 	ldw	x, #0x50c9
      008E87 F6               [ 1]  472 	ld	a, (x)
      008E88 A4 E1            [ 1]  473 	and	a, #0xe1
      008E8A F7               [ 1]  474 	ld	(x), a
                                    475 ;	lib/stm8s_clk.c: 418: CLK->CCOR |= (uint8_t)CLK_CCO;
      008E8B AE 50 C9         [ 2]  476 	ldw	x, #0x50c9
      008E8E F6               [ 1]  477 	ld	a, (x)
      008E8F 1A 03            [ 1]  478 	or	a, (0x03, sp)
      008E91 AE 50 C9         [ 2]  479 	ldw	x, #0x50c9
      008E94 F7               [ 1]  480 	ld	(x), a
                                    481 ;	lib/stm8s_clk.c: 421: CLK->CCOR |= CLK_CCOR_CCOEN;
      008E95 72 10 50 C9      [ 1]  482 	bset	0x50c9, #0
      008E99 81               [ 4]  483 	ret
                                    484 ;	lib/stm8s_clk.c: 432: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    485 ;	-----------------------------------------
                                    486 ;	 function CLK_ITConfig
                                    487 ;	-----------------------------------------
      008E9A                        488 _CLK_ITConfig:
      008E9A 88               [ 1]  489 	push	a
                                    490 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      008E9B 7B 04            [ 1]  491 	ld	a, (0x04, sp)
      008E9D A1 0C            [ 1]  492 	cp	a, #0x0c
      008E9F 26 06            [ 1]  493 	jrne	00135$
      008EA1 A6 01            [ 1]  494 	ld	a, #0x01
      008EA3 6B 01            [ 1]  495 	ld	(0x01, sp), a
      008EA5 20 02            [ 2]  496 	jra	00136$
      008EA7                        497 00135$:
      008EA7 0F 01            [ 1]  498 	clr	(0x01, sp)
      008EA9                        499 00136$:
      008EA9 7B 04            [ 1]  500 	ld	a, (0x04, sp)
      008EAB A1 1C            [ 1]  501 	cp	a, #0x1c
      008EAD 26 03            [ 1]  502 	jrne	00138$
      008EAF A6 01            [ 1]  503 	ld	a, #0x01
      008EB1 21                     504 	.byte 0x21
      008EB2                        505 00138$:
      008EB2 4F               [ 1]  506 	clr	a
      008EB3                        507 00139$:
                                    508 ;	lib/stm8s_clk.c: 434: if (NewState != DISABLE)
      008EB3 0D 05            [ 1]  509 	tnz	(0x05, sp)
      008EB5 27 19            [ 1]  510 	jreq	00110$
                                    511 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      008EB7 0D 01            [ 1]  512 	tnz	(0x01, sp)
      008EB9 26 0C            [ 1]  513 	jrne	00102$
      008EBB 4D               [ 1]  514 	tnz	a
      008EBC 27 29            [ 1]  515 	jreq	00112$
                                    516 ;	lib/stm8s_clk.c: 439: CLK->SWCR |= CLK_SWCR_SWIEN;
      008EBE AE 50 C5         [ 2]  517 	ldw	x, #0x50c5
      008EC1 F6               [ 1]  518 	ld	a, (x)
      008EC2 AA 04            [ 1]  519 	or	a, #0x04
      008EC4 F7               [ 1]  520 	ld	(x), a
                                    521 ;	lib/stm8s_clk.c: 440: break;
      008EC5 20 20            [ 2]  522 	jra	00112$
                                    523 ;	lib/stm8s_clk.c: 441: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      008EC7                        524 00102$:
                                    525 ;	lib/stm8s_clk.c: 442: CLK->CSSR |= CLK_CSSR_CSSDIE;
      008EC7 AE 50 C8         [ 2]  526 	ldw	x, #0x50c8
      008ECA F6               [ 1]  527 	ld	a, (x)
      008ECB AA 04            [ 1]  528 	or	a, #0x04
      008ECD F7               [ 1]  529 	ld	(x), a
                                    530 ;	lib/stm8s_clk.c: 443: break;
      008ECE 20 17            [ 2]  531 	jra	00112$
                                    532 ;	lib/stm8s_clk.c: 446: }
      008ED0                        533 00110$:
                                    534 ;	lib/stm8s_clk.c: 450: switch (CLK_IT)
      008ED0 0D 01            [ 1]  535 	tnz	(0x01, sp)
      008ED2 26 0C            [ 1]  536 	jrne	00106$
      008ED4 4D               [ 1]  537 	tnz	a
      008ED5 27 10            [ 1]  538 	jreq	00112$
                                    539 ;	lib/stm8s_clk.c: 453: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      008ED7 AE 50 C5         [ 2]  540 	ldw	x, #0x50c5
      008EDA F6               [ 1]  541 	ld	a, (x)
      008EDB A4 FB            [ 1]  542 	and	a, #0xfb
      008EDD F7               [ 1]  543 	ld	(x), a
                                    544 ;	lib/stm8s_clk.c: 454: break;
      008EDE 20 07            [ 2]  545 	jra	00112$
                                    546 ;	lib/stm8s_clk.c: 455: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      008EE0                        547 00106$:
                                    548 ;	lib/stm8s_clk.c: 456: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      008EE0 AE 50 C8         [ 2]  549 	ldw	x, #0x50c8
      008EE3 F6               [ 1]  550 	ld	a, (x)
      008EE4 A4 FB            [ 1]  551 	and	a, #0xfb
      008EE6 F7               [ 1]  552 	ld	(x), a
                                    553 ;	lib/stm8s_clk.c: 460: }
      008EE7                        554 00112$:
      008EE7 84               [ 1]  555 	pop	a
      008EE8 81               [ 4]  556 	ret
                                    557 ;	lib/stm8s_clk.c: 469: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    558 ;	-----------------------------------------
                                    559 ;	 function CLK_SYSCLKConfig
                                    560 ;	-----------------------------------------
      008EE9                        561 _CLK_SYSCLKConfig:
      008EE9 89               [ 2]  562 	pushw	x
                                    563 ;	lib/stm8s_clk.c: 472: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      008EEA 0D 05            [ 1]  564 	tnz	(0x05, sp)
      008EEC 2B 19            [ 1]  565 	jrmi	00102$
                                    566 ;	lib/stm8s_clk.c: 474: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008EEE AE 50 C6         [ 2]  567 	ldw	x, #0x50c6
      008EF1 F6               [ 1]  568 	ld	a, (x)
      008EF2 A4 E7            [ 1]  569 	and	a, #0xe7
      008EF4 F7               [ 1]  570 	ld	(x), a
                                    571 ;	lib/stm8s_clk.c: 475: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      008EF5 AE 50 C6         [ 2]  572 	ldw	x, #0x50c6
      008EF8 F6               [ 1]  573 	ld	a, (x)
      008EF9 6B 01            [ 1]  574 	ld	(0x01, sp), a
      008EFB 7B 05            [ 1]  575 	ld	a, (0x05, sp)
      008EFD A4 18            [ 1]  576 	and	a, #0x18
      008EFF 1A 01            [ 1]  577 	or	a, (0x01, sp)
      008F01 AE 50 C6         [ 2]  578 	ldw	x, #0x50c6
      008F04 F7               [ 1]  579 	ld	(x), a
      008F05 20 17            [ 2]  580 	jra	00104$
      008F07                        581 00102$:
                                    582 ;	lib/stm8s_clk.c: 479: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      008F07 AE 50 C6         [ 2]  583 	ldw	x, #0x50c6
      008F0A F6               [ 1]  584 	ld	a, (x)
      008F0B A4 F8            [ 1]  585 	and	a, #0xf8
      008F0D F7               [ 1]  586 	ld	(x), a
                                    587 ;	lib/stm8s_clk.c: 480: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      008F0E AE 50 C6         [ 2]  588 	ldw	x, #0x50c6
      008F11 F6               [ 1]  589 	ld	a, (x)
      008F12 6B 02            [ 1]  590 	ld	(0x02, sp), a
      008F14 7B 05            [ 1]  591 	ld	a, (0x05, sp)
      008F16 A4 07            [ 1]  592 	and	a, #0x07
      008F18 1A 02            [ 1]  593 	or	a, (0x02, sp)
      008F1A AE 50 C6         [ 2]  594 	ldw	x, #0x50c6
      008F1D F7               [ 1]  595 	ld	(x), a
      008F1E                        596 00104$:
      008F1E 85               [ 2]  597 	popw	x
      008F1F 81               [ 4]  598 	ret
                                    599 ;	lib/stm8s_clk.c: 490: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    600 ;	-----------------------------------------
                                    601 ;	 function CLK_SWIMConfig
                                    602 ;	-----------------------------------------
      008F20                        603 _CLK_SWIMConfig:
                                    604 ;	lib/stm8s_clk.c: 493: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      008F20 0D 03            [ 1]  605 	tnz	(0x03, sp)
      008F22 27 05            [ 1]  606 	jreq	00102$
                                    607 ;	lib/stm8s_clk.c: 496: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      008F24 72 10 50 CD      [ 1]  608 	bset	0x50cd, #0
      008F28 81               [ 4]  609 	ret
      008F29                        610 00102$:
                                    611 ;	lib/stm8s_clk.c: 501: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      008F29 72 11 50 CD      [ 1]  612 	bres	0x50cd, #0
      008F2D 81               [ 4]  613 	ret
                                    614 ;	lib/stm8s_clk.c: 512: void CLK_ClockSecuritySystemEnable(void)
                                    615 ;	-----------------------------------------
                                    616 ;	 function CLK_ClockSecuritySystemEnable
                                    617 ;	-----------------------------------------
      008F2E                        618 _CLK_ClockSecuritySystemEnable:
                                    619 ;	lib/stm8s_clk.c: 515: CLK->CSSR |= CLK_CSSR_CSSEN;
      008F2E 72 10 50 C8      [ 1]  620 	bset	0x50c8, #0
      008F32 81               [ 4]  621 	ret
                                    622 ;	lib/stm8s_clk.c: 524: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    623 ;	-----------------------------------------
                                    624 ;	 function CLK_GetSYSCLKSource
                                    625 ;	-----------------------------------------
      008F33                        626 _CLK_GetSYSCLKSource:
                                    627 ;	lib/stm8s_clk.c: 526: return((CLK_Source_TypeDef)CLK->CMSR);
      008F33 AE 50 C3         [ 2]  628 	ldw	x, #0x50c3
      008F36 F6               [ 1]  629 	ld	a, (x)
      008F37 81               [ 4]  630 	ret
                                    631 ;	lib/stm8s_clk.c: 534: uint32_t CLK_GetClockFreq(void)
                                    632 ;	-----------------------------------------
                                    633 ;	 function CLK_GetClockFreq
                                    634 ;	-----------------------------------------
      008F38                        635 _CLK_GetClockFreq:
      008F38 52 07            [ 2]  636 	sub	sp, #7
                                    637 ;	lib/stm8s_clk.c: 541: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      008F3A AE 50 C3         [ 2]  638 	ldw	x, #0x50c3
      008F3D F6               [ 1]  639 	ld	a, (x)
      008F3E 6B 05            [ 1]  640 	ld	(0x05, sp), a
                                    641 ;	lib/stm8s_clk.c: 543: if (clocksource == CLK_SOURCE_HSI)
      008F40 7B 05            [ 1]  642 	ld	a, (0x05, sp)
      008F42 A1 E1            [ 1]  643 	cp	a, #0xe1
      008F44 26 2C            [ 1]  644 	jrne	00105$
                                    645 ;	lib/stm8s_clk.c: 545: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      008F46 AE 50 C6         [ 2]  646 	ldw	x, #0x50c6
      008F49 F6               [ 1]  647 	ld	a, (x)
      008F4A A4 18            [ 1]  648 	and	a, #0x18
                                    649 ;	lib/stm8s_clk.c: 546: tmp = (uint8_t)(tmp >> 3);
      008F4C 44               [ 1]  650 	srl	a
      008F4D 44               [ 1]  651 	srl	a
      008F4E 44               [ 1]  652 	srl	a
                                    653 ;	lib/stm8s_clk.c: 547: presc = HSIDivFactor[tmp];
      008F4F AE 90 25         [ 2]  654 	ldw	x, #_HSIDivFactor+0
      008F52 1F 06            [ 2]  655 	ldw	(0x06, sp), x
      008F54 5F               [ 1]  656 	clrw	x
      008F55 97               [ 1]  657 	ld	xl, a
      008F56 72 FB 06         [ 2]  658 	addw	x, (0x06, sp)
      008F59 F6               [ 1]  659 	ld	a, (x)
                                    660 ;	lib/stm8s_clk.c: 548: clockfrequency = HSI_VALUE / presc;
      008F5A 5F               [ 1]  661 	clrw	x
      008F5B 97               [ 1]  662 	ld	xl, a
      008F5C 90 5F            [ 1]  663 	clrw	y
      008F5E 89               [ 2]  664 	pushw	x
      008F5F 90 89            [ 2]  665 	pushw	y
      008F61 4B 00            [ 1]  666 	push	#0x00
      008F63 4B 24            [ 1]  667 	push	#0x24
      008F65 4B F4            [ 1]  668 	push	#0xf4
      008F67 4B 00            [ 1]  669 	push	#0x00
      008F69 CD 96 48         [ 4]  670 	call	__divulong
      008F6C 5B 08            [ 2]  671 	addw	sp, #8
      008F6E 1F 03            [ 2]  672 	ldw	(0x03, sp), x
      008F70 20 1A            [ 2]  673 	jra	00106$
      008F72                        674 00105$:
                                    675 ;	lib/stm8s_clk.c: 550: else if ( clocksource == CLK_SOURCE_LSI)
      008F72 7B 05            [ 1]  676 	ld	a, (0x05, sp)
      008F74 A1 D2            [ 1]  677 	cp	a, #0xd2
      008F76 26 0B            [ 1]  678 	jrne	00102$
                                    679 ;	lib/stm8s_clk.c: 552: clockfrequency = LSI_VALUE;
      008F78 AE F4 00         [ 2]  680 	ldw	x, #0xf400
      008F7B 1F 03            [ 2]  681 	ldw	(0x03, sp), x
      008F7D 90 AE 00 01      [ 2]  682 	ldw	y, #0x0001
      008F81 20 09            [ 2]  683 	jra	00106$
      008F83                        684 00102$:
                                    685 ;	lib/stm8s_clk.c: 556: clockfrequency = HSE_VALUE;
      008F83 AE 24 00         [ 2]  686 	ldw	x, #0x2400
      008F86 1F 03            [ 2]  687 	ldw	(0x03, sp), x
      008F88 90 AE 00 F4      [ 2]  688 	ldw	y, #0x00f4
      008F8C                        689 00106$:
                                    690 ;	lib/stm8s_clk.c: 559: return((uint32_t)clockfrequency);
      008F8C 1E 03            [ 2]  691 	ldw	x, (0x03, sp)
      008F8E 5B 07            [ 2]  692 	addw	sp, #7
      008F90 81               [ 4]  693 	ret
                                    694 ;	lib/stm8s_clk.c: 569: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    695 ;	-----------------------------------------
                                    696 ;	 function CLK_AdjustHSICalibrationValue
                                    697 ;	-----------------------------------------
      008F91                        698 _CLK_AdjustHSICalibrationValue:
                                    699 ;	lib/stm8s_clk.c: 573: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      008F91 AE 50 CC         [ 2]  700 	ldw	x, #0x50cc
      008F94 F6               [ 1]  701 	ld	a, (x)
      008F95 A4 F8            [ 1]  702 	and	a, #0xf8
      008F97 1A 03            [ 1]  703 	or	a, (0x03, sp)
      008F99 AE 50 CC         [ 2]  704 	ldw	x, #0x50cc
      008F9C F7               [ 1]  705 	ld	(x), a
      008F9D 81               [ 4]  706 	ret
                                    707 ;	lib/stm8s_clk.c: 585: void CLK_SYSCLKEmergencyClear(void)
                                    708 ;	-----------------------------------------
                                    709 ;	 function CLK_SYSCLKEmergencyClear
                                    710 ;	-----------------------------------------
      008F9E                        711 _CLK_SYSCLKEmergencyClear:
                                    712 ;	lib/stm8s_clk.c: 587: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      008F9E 72 11 50 C5      [ 1]  713 	bres	0x50c5, #0
      008FA2 81               [ 4]  714 	ret
                                    715 ;	lib/stm8s_clk.c: 597: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    716 ;	-----------------------------------------
                                    717 ;	 function CLK_GetFlagStatus
                                    718 ;	-----------------------------------------
      008FA3                        719 _CLK_GetFlagStatus:
      008FA3 88               [ 1]  720 	push	a
                                    721 ;	lib/stm8s_clk.c: 604: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      008FA4 4F               [ 1]  722 	clr	a
      008FA5 97               [ 1]  723 	ld	xl, a
      008FA6 7B 04            [ 1]  724 	ld	a, (0x04, sp)
      008FA8 95               [ 1]  725 	ld	xh, a
                                    726 ;	lib/stm8s_clk.c: 607: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      008FA9 A3 01 00         [ 2]  727 	cpw	x, #0x0100
      008FAC 26 06            [ 1]  728 	jrne	00111$
                                    729 ;	lib/stm8s_clk.c: 609: tmpreg = CLK->ICKR;
      008FAE AE 50 C0         [ 2]  730 	ldw	x, #0x50c0
      008FB1 F6               [ 1]  731 	ld	a, (x)
      008FB2 20 25            [ 2]  732 	jra	00112$
      008FB4                        733 00111$:
                                    734 ;	lib/stm8s_clk.c: 611: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      008FB4 A3 02 00         [ 2]  735 	cpw	x, #0x0200
      008FB7 26 06            [ 1]  736 	jrne	00108$
                                    737 ;	lib/stm8s_clk.c: 613: tmpreg = CLK->ECKR;
      008FB9 AE 50 C1         [ 2]  738 	ldw	x, #0x50c1
      008FBC F6               [ 1]  739 	ld	a, (x)
      008FBD 20 1A            [ 2]  740 	jra	00112$
      008FBF                        741 00108$:
                                    742 ;	lib/stm8s_clk.c: 615: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      008FBF A3 03 00         [ 2]  743 	cpw	x, #0x0300
      008FC2 26 06            [ 1]  744 	jrne	00105$
                                    745 ;	lib/stm8s_clk.c: 617: tmpreg = CLK->SWCR;
      008FC4 AE 50 C5         [ 2]  746 	ldw	x, #0x50c5
      008FC7 F6               [ 1]  747 	ld	a, (x)
      008FC8 20 0F            [ 2]  748 	jra	00112$
      008FCA                        749 00105$:
                                    750 ;	lib/stm8s_clk.c: 619: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      008FCA A3 04 00         [ 2]  751 	cpw	x, #0x0400
      008FCD 26 06            [ 1]  752 	jrne	00102$
                                    753 ;	lib/stm8s_clk.c: 621: tmpreg = CLK->CSSR;
      008FCF AE 50 C8         [ 2]  754 	ldw	x, #0x50c8
      008FD2 F6               [ 1]  755 	ld	a, (x)
      008FD3 20 04            [ 2]  756 	jra	00112$
      008FD5                        757 00102$:
                                    758 ;	lib/stm8s_clk.c: 625: tmpreg = CLK->CCOR;
      008FD5 AE 50 C9         [ 2]  759 	ldw	x, #0x50c9
      008FD8 F6               [ 1]  760 	ld	a, (x)
      008FD9                        761 00112$:
                                    762 ;	lib/stm8s_clk.c: 628: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      008FD9 88               [ 1]  763 	push	a
      008FDA 7B 06            [ 1]  764 	ld	a, (0x06, sp)
      008FDC 6B 02            [ 1]  765 	ld	(0x02, sp), a
      008FDE 84               [ 1]  766 	pop	a
      008FDF 14 01            [ 1]  767 	and	a, (0x01, sp)
      008FE1 4D               [ 1]  768 	tnz	a
      008FE2 27 03            [ 1]  769 	jreq	00114$
                                    770 ;	lib/stm8s_clk.c: 630: bitstatus = SET;
      008FE4 A6 01            [ 1]  771 	ld	a, #0x01
                                    772 ;	lib/stm8s_clk.c: 634: bitstatus = RESET;
      008FE6 21                     773 	.byte 0x21
      008FE7                        774 00114$:
      008FE7 4F               [ 1]  775 	clr	a
      008FE8                        776 00115$:
                                    777 ;	lib/stm8s_clk.c: 638: return((FlagStatus)bitstatus);
      008FE8 5B 01            [ 2]  778 	addw	sp, #1
      008FEA 81               [ 4]  779 	ret
                                    780 ;	lib/stm8s_clk.c: 647: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    781 ;	-----------------------------------------
                                    782 ;	 function CLK_GetITStatus
                                    783 ;	-----------------------------------------
      008FEB                        784 _CLK_GetITStatus:
                                    785 ;	lib/stm8s_clk.c: 651: if (CLK_IT == CLK_IT_SWIF)
      008FEB 7B 03            [ 1]  786 	ld	a, (0x03, sp)
      008FED A1 1C            [ 1]  787 	cp	a, #0x1c
      008FEF 26 0F            [ 1]  788 	jrne	00108$
                                    789 ;	lib/stm8s_clk.c: 654: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008FF1 AE 50 C5         [ 2]  790 	ldw	x, #0x50c5
      008FF4 F6               [ 1]  791 	ld	a, (x)
      008FF5 14 03            [ 1]  792 	and	a, (0x03, sp)
      008FF7 A1 0C            [ 1]  793 	cp	a, #0x0c
      008FF9 26 03            [ 1]  794 	jrne	00102$
                                    795 ;	lib/stm8s_clk.c: 656: bitstatus = SET;
      008FFB A6 01            [ 1]  796 	ld	a, #0x01
      008FFD 81               [ 4]  797 	ret
      008FFE                        798 00102$:
                                    799 ;	lib/stm8s_clk.c: 660: bitstatus = RESET;
      008FFE 4F               [ 1]  800 	clr	a
      008FFF 81               [ 4]  801 	ret
      009000                        802 00108$:
                                    803 ;	lib/stm8s_clk.c: 666: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      009000 AE 50 C8         [ 2]  804 	ldw	x, #0x50c8
      009003 F6               [ 1]  805 	ld	a, (x)
      009004 14 03            [ 1]  806 	and	a, (0x03, sp)
      009006 A1 0C            [ 1]  807 	cp	a, #0x0c
      009008 26 03            [ 1]  808 	jrne	00105$
                                    809 ;	lib/stm8s_clk.c: 668: bitstatus = SET;
      00900A A6 01            [ 1]  810 	ld	a, #0x01
      00900C 81               [ 4]  811 	ret
      00900D                        812 00105$:
                                    813 ;	lib/stm8s_clk.c: 672: bitstatus = RESET;
      00900D 4F               [ 1]  814 	clr	a
                                    815 ;	lib/stm8s_clk.c: 677: return bitstatus;
      00900E 81               [ 4]  816 	ret
                                    817 ;	lib/stm8s_clk.c: 686: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    818 ;	-----------------------------------------
                                    819 ;	 function CLK_ClearITPendingBit
                                    820 ;	-----------------------------------------
      00900F                        821 _CLK_ClearITPendingBit:
                                    822 ;	lib/stm8s_clk.c: 689: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      00900F 7B 03            [ 1]  823 	ld	a, (0x03, sp)
      009011 A1 0C            [ 1]  824 	cp	a, #0x0c
      009013 26 08            [ 1]  825 	jrne	00102$
                                    826 ;	lib/stm8s_clk.c: 692: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      009015 AE 50 C8         [ 2]  827 	ldw	x, #0x50c8
      009018 F6               [ 1]  828 	ld	a, (x)
      009019 A4 F7            [ 1]  829 	and	a, #0xf7
      00901B F7               [ 1]  830 	ld	(x), a
      00901C 81               [ 4]  831 	ret
      00901D                        832 00102$:
                                    833 ;	lib/stm8s_clk.c: 697: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      00901D AE 50 C5         [ 2]  834 	ldw	x, #0x50c5
      009020 F6               [ 1]  835 	ld	a, (x)
      009021 A4 F7            [ 1]  836 	and	a, #0xf7
      009023 F7               [ 1]  837 	ld	(x), a
      009024 81               [ 4]  838 	ret
                                    839 	.area CODE
      009025                        840 _HSIDivFactor:
      009025 01                     841 	.db #0x01	; 1
      009026 02                     842 	.db #0x02	; 2
      009027 04                     843 	.db #0x04	; 4
      009028 08                     844 	.db #0x08	; 8
      009029                        845 _CLKPrescTable:
      009029 01                     846 	.db #0x01	; 1
      00902A 02                     847 	.db #0x02	; 2
      00902B 04                     848 	.db #0x04	; 4
      00902C 08                     849 	.db #0x08	; 8
      00902D 0A                     850 	.db #0x0a	; 10
      00902E 10                     851 	.db #0x10	; 16
      00902F 14                     852 	.db #0x14	; 20
      009030 28                     853 	.db #0x28	; 40
                                    854 	.area INITIALIZER
                                    855 	.area CABS (ABS)
