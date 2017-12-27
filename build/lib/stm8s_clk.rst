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
      008E70                         68 _CLK_DeInit:
                                     69 ;	lib/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      008E70 35 01 50 C0      [ 1]   70 	mov	0x50c0+0, #0x01
                                     71 ;	lib/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      008E74 35 00 50 C1      [ 1]   72 	mov	0x50c1+0, #0x00
                                     73 ;	lib/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      008E78 35 E1 50 C4      [ 1]   74 	mov	0x50c4+0, #0xe1
                                     75 ;	lib/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      008E7C 35 00 50 C5      [ 1]   76 	mov	0x50c5+0, #0x00
                                     77 ;	lib/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      008E80 35 18 50 C6      [ 1]   78 	mov	0x50c6+0, #0x18
                                     79 ;	lib/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      008E84 35 FF 50 C7      [ 1]   80 	mov	0x50c7+0, #0xff
                                     81 ;	lib/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      008E88 35 FF 50 CA      [ 1]   82 	mov	0x50ca+0, #0xff
                                     83 ;	lib/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      008E8C 35 00 50 C8      [ 1]   84 	mov	0x50c8+0, #0x00
                                     85 ;	lib/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008E90 35 00 50 C9      [ 1]   86 	mov	0x50c9+0, #0x00
                                     87 ;	lib/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      008E94                         88 00101$:
      008E94 AE 50 C9         [ 2]   89 	ldw	x, #0x50c9
      008E97 F6               [ 1]   90 	ld	a, (x)
      008E98 44               [ 1]   91 	srl	a
      008E99 25 F9            [ 1]   92 	jrc	00101$
                                     93 ;	lib/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008E9B 35 00 50 C9      [ 1]   94 	mov	0x50c9+0, #0x00
                                     95 ;	lib/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      008E9F 35 00 50 CC      [ 1]   96 	mov	0x50cc+0, #0x00
                                     97 ;	lib/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      008EA3 35 00 50 CD      [ 1]   98 	mov	0x50cd+0, #0x00
      008EA7 81               [ 4]   99 	ret
                                    100 ;	lib/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function CLK_FastHaltWakeUpCmd
                                    103 ;	-----------------------------------------
      008EA8                        104 _CLK_FastHaltWakeUpCmd:
                                    105 ;	lib/stm8s_clk.c: 102: if (NewState != DISABLE)
      008EA8 0D 03            [ 1]  106 	tnz	(0x03, sp)
      008EAA 27 08            [ 1]  107 	jreq	00102$
                                    108 ;	lib/stm8s_clk.c: 105: CLK->ICKR |= CLK_ICKR_FHWU;
      008EAC AE 50 C0         [ 2]  109 	ldw	x, #0x50c0
      008EAF F6               [ 1]  110 	ld	a, (x)
      008EB0 AA 04            [ 1]  111 	or	a, #0x04
      008EB2 F7               [ 1]  112 	ld	(x), a
      008EB3 81               [ 4]  113 	ret
      008EB4                        114 00102$:
                                    115 ;	lib/stm8s_clk.c: 110: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      008EB4 AE 50 C0         [ 2]  116 	ldw	x, #0x50c0
      008EB7 F6               [ 1]  117 	ld	a, (x)
      008EB8 A4 FB            [ 1]  118 	and	a, #0xfb
      008EBA F7               [ 1]  119 	ld	(x), a
      008EBB 81               [ 4]  120 	ret
                                    121 ;	lib/stm8s_clk.c: 119: void CLK_HSECmd(FunctionalState NewState)
                                    122 ;	-----------------------------------------
                                    123 ;	 function CLK_HSECmd
                                    124 ;	-----------------------------------------
      008EBC                        125 _CLK_HSECmd:
                                    126 ;	lib/stm8s_clk.c: 122: if (NewState != DISABLE)
      008EBC 0D 03            [ 1]  127 	tnz	(0x03, sp)
      008EBE 27 05            [ 1]  128 	jreq	00102$
                                    129 ;	lib/stm8s_clk.c: 125: CLK->ECKR |= CLK_ECKR_HSEEN;
      008EC0 72 10 50 C1      [ 1]  130 	bset	0x50c1, #0
      008EC4 81               [ 4]  131 	ret
      008EC5                        132 00102$:
                                    133 ;	lib/stm8s_clk.c: 130: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      008EC5 72 11 50 C1      [ 1]  134 	bres	0x50c1, #0
      008EC9 81               [ 4]  135 	ret
                                    136 ;	lib/stm8s_clk.c: 139: void CLK_HSICmd(FunctionalState NewState)
                                    137 ;	-----------------------------------------
                                    138 ;	 function CLK_HSICmd
                                    139 ;	-----------------------------------------
      008ECA                        140 _CLK_HSICmd:
                                    141 ;	lib/stm8s_clk.c: 142: if (NewState != DISABLE)
      008ECA 0D 03            [ 1]  142 	tnz	(0x03, sp)
      008ECC 27 05            [ 1]  143 	jreq	00102$
                                    144 ;	lib/stm8s_clk.c: 145: CLK->ICKR |= CLK_ICKR_HSIEN;
      008ECE 72 10 50 C0      [ 1]  145 	bset	0x50c0, #0
      008ED2 81               [ 4]  146 	ret
      008ED3                        147 00102$:
                                    148 ;	lib/stm8s_clk.c: 150: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      008ED3 72 11 50 C0      [ 1]  149 	bres	0x50c0, #0
      008ED7 81               [ 4]  150 	ret
                                    151 ;	lib/stm8s_clk.c: 160: void CLK_LSICmd(FunctionalState NewState)
                                    152 ;	-----------------------------------------
                                    153 ;	 function CLK_LSICmd
                                    154 ;	-----------------------------------------
      008ED8                        155 _CLK_LSICmd:
                                    156 ;	lib/stm8s_clk.c: 163: if (NewState != DISABLE)
      008ED8 0D 03            [ 1]  157 	tnz	(0x03, sp)
      008EDA 27 08            [ 1]  158 	jreq	00102$
                                    159 ;	lib/stm8s_clk.c: 166: CLK->ICKR |= CLK_ICKR_LSIEN;
      008EDC AE 50 C0         [ 2]  160 	ldw	x, #0x50c0
      008EDF F6               [ 1]  161 	ld	a, (x)
      008EE0 AA 08            [ 1]  162 	or	a, #0x08
      008EE2 F7               [ 1]  163 	ld	(x), a
      008EE3 81               [ 4]  164 	ret
      008EE4                        165 00102$:
                                    166 ;	lib/stm8s_clk.c: 171: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      008EE4 AE 50 C0         [ 2]  167 	ldw	x, #0x50c0
      008EE7 F6               [ 1]  168 	ld	a, (x)
      008EE8 A4 F7            [ 1]  169 	and	a, #0xf7
      008EEA F7               [ 1]  170 	ld	(x), a
      008EEB 81               [ 4]  171 	ret
                                    172 ;	lib/stm8s_clk.c: 181: void CLK_CCOCmd(FunctionalState NewState)
                                    173 ;	-----------------------------------------
                                    174 ;	 function CLK_CCOCmd
                                    175 ;	-----------------------------------------
      008EEC                        176 _CLK_CCOCmd:
                                    177 ;	lib/stm8s_clk.c: 184: if (NewState != DISABLE)
      008EEC 0D 03            [ 1]  178 	tnz	(0x03, sp)
      008EEE 27 05            [ 1]  179 	jreq	00102$
                                    180 ;	lib/stm8s_clk.c: 187: CLK->CCOR |= CLK_CCOR_CCOEN;
      008EF0 72 10 50 C9      [ 1]  181 	bset	0x50c9, #0
      008EF4 81               [ 4]  182 	ret
      008EF5                        183 00102$:
                                    184 ;	lib/stm8s_clk.c: 192: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      008EF5 72 11 50 C9      [ 1]  185 	bres	0x50c9, #0
      008EF9 81               [ 4]  186 	ret
                                    187 ;	lib/stm8s_clk.c: 203: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    188 ;	-----------------------------------------
                                    189 ;	 function CLK_ClockSwitchCmd
                                    190 ;	-----------------------------------------
      008EFA                        191 _CLK_ClockSwitchCmd:
                                    192 ;	lib/stm8s_clk.c: 206: if (NewState != DISABLE )
      008EFA 0D 03            [ 1]  193 	tnz	(0x03, sp)
      008EFC 27 08            [ 1]  194 	jreq	00102$
                                    195 ;	lib/stm8s_clk.c: 209: CLK->SWCR |= CLK_SWCR_SWEN;
      008EFE AE 50 C5         [ 2]  196 	ldw	x, #0x50c5
      008F01 F6               [ 1]  197 	ld	a, (x)
      008F02 AA 02            [ 1]  198 	or	a, #0x02
      008F04 F7               [ 1]  199 	ld	(x), a
      008F05 81               [ 4]  200 	ret
      008F06                        201 00102$:
                                    202 ;	lib/stm8s_clk.c: 214: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      008F06 AE 50 C5         [ 2]  203 	ldw	x, #0x50c5
      008F09 F6               [ 1]  204 	ld	a, (x)
      008F0A A4 FD            [ 1]  205 	and	a, #0xfd
      008F0C F7               [ 1]  206 	ld	(x), a
      008F0D 81               [ 4]  207 	ret
                                    208 ;	lib/stm8s_clk.c: 226: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    209 ;	-----------------------------------------
                                    210 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    211 ;	-----------------------------------------
      008F0E                        212 _CLK_SlowActiveHaltWakeUpCmd:
                                    213 ;	lib/stm8s_clk.c: 229: if (NewState != DISABLE)
      008F0E 0D 03            [ 1]  214 	tnz	(0x03, sp)
      008F10 27 08            [ 1]  215 	jreq	00102$
                                    216 ;	lib/stm8s_clk.c: 232: CLK->ICKR |= CLK_ICKR_SWUAH;
      008F12 AE 50 C0         [ 2]  217 	ldw	x, #0x50c0
      008F15 F6               [ 1]  218 	ld	a, (x)
      008F16 AA 20            [ 1]  219 	or	a, #0x20
      008F18 F7               [ 1]  220 	ld	(x), a
      008F19 81               [ 4]  221 	ret
      008F1A                        222 00102$:
                                    223 ;	lib/stm8s_clk.c: 237: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      008F1A AE 50 C0         [ 2]  224 	ldw	x, #0x50c0
      008F1D F6               [ 1]  225 	ld	a, (x)
      008F1E A4 DF            [ 1]  226 	and	a, #0xdf
      008F20 F7               [ 1]  227 	ld	(x), a
      008F21 81               [ 4]  228 	ret
                                    229 ;	lib/stm8s_clk.c: 249: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    230 ;	-----------------------------------------
                                    231 ;	 function CLK_PeripheralClockConfig
                                    232 ;	-----------------------------------------
      008F22                        233 _CLK_PeripheralClockConfig:
      008F22 89               [ 2]  234 	pushw	x
                                    235 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008F23 7B 05            [ 1]  236 	ld	a, (0x05, sp)
      008F25 A4 0F            [ 1]  237 	and	a, #0x0f
      008F27 88               [ 1]  238 	push	a
      008F28 A6 01            [ 1]  239 	ld	a, #0x01
      008F2A 6B 02            [ 1]  240 	ld	(0x02, sp), a
      008F2C 84               [ 1]  241 	pop	a
      008F2D 4D               [ 1]  242 	tnz	a
      008F2E 27 05            [ 1]  243 	jreq	00125$
      008F30                        244 00124$:
      008F30 08 01            [ 1]  245 	sll	(0x01, sp)
      008F32 4A               [ 1]  246 	dec	a
      008F33 26 FB            [ 1]  247 	jrne	00124$
      008F35                        248 00125$:
                                    249 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008F35 7B 01            [ 1]  250 	ld	a, (0x01, sp)
      008F37 43               [ 1]  251 	cpl	a
      008F38 6B 02            [ 1]  252 	ld	(0x02, sp), a
                                    253 ;	lib/stm8s_clk.c: 252: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      008F3A 7B 05            [ 1]  254 	ld	a, (0x05, sp)
      008F3C A5 10            [ 1]  255 	bcp	a, #0x10
      008F3E 26 1C            [ 1]  256 	jrne	00108$
                                    257 ;	lib/stm8s_clk.c: 254: if (NewState != DISABLE)
      008F40 0D 06            [ 1]  258 	tnz	(0x06, sp)
      008F42 27 0C            [ 1]  259 	jreq	00102$
                                    260 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008F44 AE 50 C7         [ 2]  261 	ldw	x, #0x50c7
      008F47 F6               [ 1]  262 	ld	a, (x)
      008F48 1A 01            [ 1]  263 	or	a, (0x01, sp)
      008F4A AE 50 C7         [ 2]  264 	ldw	x, #0x50c7
      008F4D F7               [ 1]  265 	ld	(x), a
      008F4E 20 26            [ 2]  266 	jra	00110$
      008F50                        267 00102$:
                                    268 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008F50 AE 50 C7         [ 2]  269 	ldw	x, #0x50c7
      008F53 F6               [ 1]  270 	ld	a, (x)
      008F54 14 02            [ 1]  271 	and	a, (0x02, sp)
      008F56 AE 50 C7         [ 2]  272 	ldw	x, #0x50c7
      008F59 F7               [ 1]  273 	ld	(x), a
      008F5A 20 1A            [ 2]  274 	jra	00110$
      008F5C                        275 00108$:
                                    276 ;	lib/stm8s_clk.c: 267: if (NewState != DISABLE)
      008F5C 0D 06            [ 1]  277 	tnz	(0x06, sp)
      008F5E 27 0C            [ 1]  278 	jreq	00105$
                                    279 ;	lib/stm8s_clk.c: 270: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008F60 AE 50 CA         [ 2]  280 	ldw	x, #0x50ca
      008F63 F6               [ 1]  281 	ld	a, (x)
      008F64 1A 01            [ 1]  282 	or	a, (0x01, sp)
      008F66 AE 50 CA         [ 2]  283 	ldw	x, #0x50ca
      008F69 F7               [ 1]  284 	ld	(x), a
      008F6A 20 0A            [ 2]  285 	jra	00110$
      008F6C                        286 00105$:
                                    287 ;	lib/stm8s_clk.c: 275: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008F6C AE 50 CA         [ 2]  288 	ldw	x, #0x50ca
      008F6F F6               [ 1]  289 	ld	a, (x)
      008F70 14 02            [ 1]  290 	and	a, (0x02, sp)
      008F72 AE 50 CA         [ 2]  291 	ldw	x, #0x50ca
      008F75 F7               [ 1]  292 	ld	(x), a
      008F76                        293 00110$:
      008F76 85               [ 2]  294 	popw	x
      008F77 81               [ 4]  295 	ret
                                    296 ;	lib/stm8s_clk.c: 292: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    297 ;	-----------------------------------------
                                    298 ;	 function CLK_ClockSwitchConfig
                                    299 ;	-----------------------------------------
      008F78                        300 _CLK_ClockSwitchConfig:
      008F78 89               [ 2]  301 	pushw	x
                                    302 ;	lib/stm8s_clk.c: 299: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      008F79 AE 50 C3         [ 2]  303 	ldw	x, #0x50c3
      008F7C F6               [ 1]  304 	ld	a, (x)
      008F7D 6B 01            [ 1]  305 	ld	(0x01, sp), a
                                    306 ;	lib/stm8s_clk.c: 302: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      008F7F 7B 05            [ 1]  307 	ld	a, (0x05, sp)
      008F81 A1 01            [ 1]  308 	cp	a, #0x01
      008F83 26 40            [ 1]  309 	jrne	00122$
                                    310 ;	lib/stm8s_clk.c: 305: CLK->SWCR |= CLK_SWCR_SWEN;
      008F85 AE 50 C5         [ 2]  311 	ldw	x, #0x50c5
      008F88 F6               [ 1]  312 	ld	a, (x)
      008F89 AA 02            [ 1]  313 	or	a, #0x02
      008F8B F7               [ 1]  314 	ld	(x), a
                                    315 ;	lib/stm8s_clk.c: 308: if (ITState != DISABLE)
      008F8C 0D 07            [ 1]  316 	tnz	(0x07, sp)
      008F8E 27 09            [ 1]  317 	jreq	00102$
                                    318 ;	lib/stm8s_clk.c: 310: CLK->SWCR |= CLK_SWCR_SWIEN;
      008F90 AE 50 C5         [ 2]  319 	ldw	x, #0x50c5
      008F93 F6               [ 1]  320 	ld	a, (x)
      008F94 AA 04            [ 1]  321 	or	a, #0x04
      008F96 F7               [ 1]  322 	ld	(x), a
      008F97 20 07            [ 2]  323 	jra	00103$
      008F99                        324 00102$:
                                    325 ;	lib/stm8s_clk.c: 314: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      008F99 AE 50 C5         [ 2]  326 	ldw	x, #0x50c5
      008F9C F6               [ 1]  327 	ld	a, (x)
      008F9D A4 FB            [ 1]  328 	and	a, #0xfb
      008F9F F7               [ 1]  329 	ld	(x), a
      008FA0                        330 00103$:
                                    331 ;	lib/stm8s_clk.c: 318: CLK->SWR = (uint8_t)CLK_NewClock;
      008FA0 AE 50 C4         [ 2]  332 	ldw	x, #0x50c4
      008FA3 7B 06            [ 1]  333 	ld	a, (0x06, sp)
      008FA5 F7               [ 1]  334 	ld	(x), a
                                    335 ;	lib/stm8s_clk.c: 321: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      008FA6 AE FF FF         [ 2]  336 	ldw	x, #0xffff
      008FA9                        337 00105$:
      008FA9 90 AE 50 C5      [ 2]  338 	ldw	y, #0x50c5
      008FAD 90 F6            [ 1]  339 	ld	a, (y)
      008FAF 44               [ 1]  340 	srl	a
      008FB0 24 06            [ 1]  341 	jrnc	00107$
      008FB2 5D               [ 2]  342 	tnzw	x
      008FB3 27 03            [ 1]  343 	jreq	00107$
                                    344 ;	lib/stm8s_clk.c: 323: DownCounter--;
      008FB5 5A               [ 2]  345 	decw	x
      008FB6 20 F1            [ 2]  346 	jra	00105$
      008FB8                        347 00107$:
                                    348 ;	lib/stm8s_clk.c: 326: if(DownCounter != 0)
      008FB8 5D               [ 2]  349 	tnzw	x
      008FB9 27 06            [ 1]  350 	jreq	00109$
                                    351 ;	lib/stm8s_clk.c: 328: Swif = SUCCESS;
      008FBB A6 01            [ 1]  352 	ld	a, #0x01
      008FBD 6B 02            [ 1]  353 	ld	(0x02, sp), a
      008FBF 20 43            [ 2]  354 	jra	00123$
      008FC1                        355 00109$:
                                    356 ;	lib/stm8s_clk.c: 332: Swif = ERROR;
      008FC1 0F 02            [ 1]  357 	clr	(0x02, sp)
      008FC3 20 3F            [ 2]  358 	jra	00123$
      008FC5                        359 00122$:
                                    360 ;	lib/stm8s_clk.c: 338: if (ITState != DISABLE)
      008FC5 0D 07            [ 1]  361 	tnz	(0x07, sp)
      008FC7 27 09            [ 1]  362 	jreq	00112$
                                    363 ;	lib/stm8s_clk.c: 340: CLK->SWCR |= CLK_SWCR_SWIEN;
      008FC9 AE 50 C5         [ 2]  364 	ldw	x, #0x50c5
      008FCC F6               [ 1]  365 	ld	a, (x)
      008FCD AA 04            [ 1]  366 	or	a, #0x04
      008FCF F7               [ 1]  367 	ld	(x), a
      008FD0 20 07            [ 2]  368 	jra	00113$
      008FD2                        369 00112$:
                                    370 ;	lib/stm8s_clk.c: 344: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      008FD2 AE 50 C5         [ 2]  371 	ldw	x, #0x50c5
      008FD5 F6               [ 1]  372 	ld	a, (x)
      008FD6 A4 FB            [ 1]  373 	and	a, #0xfb
      008FD8 F7               [ 1]  374 	ld	(x), a
      008FD9                        375 00113$:
                                    376 ;	lib/stm8s_clk.c: 348: CLK->SWR = (uint8_t)CLK_NewClock;
      008FD9 AE 50 C4         [ 2]  377 	ldw	x, #0x50c4
      008FDC 7B 06            [ 1]  378 	ld	a, (0x06, sp)
      008FDE F7               [ 1]  379 	ld	(x), a
                                    380 ;	lib/stm8s_clk.c: 351: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      008FDF AE FF FF         [ 2]  381 	ldw	x, #0xffff
      008FE2                        382 00115$:
      008FE2 90 AE 50 C5      [ 2]  383 	ldw	y, #0x50c5
      008FE6 90 F6            [ 1]  384 	ld	a, (y)
      008FE8 A5 08            [ 1]  385 	bcp	a, #0x08
      008FEA 27 06            [ 1]  386 	jreq	00117$
      008FEC 5D               [ 2]  387 	tnzw	x
      008FED 27 03            [ 1]  388 	jreq	00117$
                                    389 ;	lib/stm8s_clk.c: 353: DownCounter--;
      008FEF 5A               [ 2]  390 	decw	x
      008FF0 20 F0            [ 2]  391 	jra	00115$
      008FF2                        392 00117$:
                                    393 ;	lib/stm8s_clk.c: 356: if(DownCounter != 0)
      008FF2 5D               [ 2]  394 	tnzw	x
      008FF3 27 0D            [ 1]  395 	jreq	00119$
                                    396 ;	lib/stm8s_clk.c: 359: CLK->SWCR |= CLK_SWCR_SWEN;
      008FF5 AE 50 C5         [ 2]  397 	ldw	x, #0x50c5
      008FF8 F6               [ 1]  398 	ld	a, (x)
      008FF9 AA 02            [ 1]  399 	or	a, #0x02
      008FFB F7               [ 1]  400 	ld	(x), a
                                    401 ;	lib/stm8s_clk.c: 360: Swif = SUCCESS;
      008FFC A6 01            [ 1]  402 	ld	a, #0x01
      008FFE 6B 02            [ 1]  403 	ld	(0x02, sp), a
      009000 20 02            [ 2]  404 	jra	00123$
      009002                        405 00119$:
                                    406 ;	lib/stm8s_clk.c: 364: Swif = ERROR;
      009002 0F 02            [ 1]  407 	clr	(0x02, sp)
      009004                        408 00123$:
                                    409 ;	lib/stm8s_clk.c: 367: if(Swif != ERROR)
      009004 0D 02            [ 1]  410 	tnz	(0x02, sp)
      009006 27 31            [ 1]  411 	jreq	00136$
                                    412 ;	lib/stm8s_clk.c: 370: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      009008 0D 08            [ 1]  413 	tnz	(0x08, sp)
      00900A 26 0C            [ 1]  414 	jrne	00132$
      00900C 7B 01            [ 1]  415 	ld	a, (0x01, sp)
      00900E A1 E1            [ 1]  416 	cp	a, #0xe1
      009010 26 06            [ 1]  417 	jrne	00132$
                                    418 ;	lib/stm8s_clk.c: 372: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      009012 72 11 50 C0      [ 1]  419 	bres	0x50c0, #0
      009016 20 21            [ 2]  420 	jra	00136$
      009018                        421 00132$:
                                    422 ;	lib/stm8s_clk.c: 374: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      009018 0D 08            [ 1]  423 	tnz	(0x08, sp)
      00901A 26 0F            [ 1]  424 	jrne	00128$
      00901C 7B 01            [ 1]  425 	ld	a, (0x01, sp)
      00901E A1 D2            [ 1]  426 	cp	a, #0xd2
      009020 26 09            [ 1]  427 	jrne	00128$
                                    428 ;	lib/stm8s_clk.c: 376: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      009022 AE 50 C0         [ 2]  429 	ldw	x, #0x50c0
      009025 F6               [ 1]  430 	ld	a, (x)
      009026 A4 F7            [ 1]  431 	and	a, #0xf7
      009028 F7               [ 1]  432 	ld	(x), a
      009029 20 0E            [ 2]  433 	jra	00136$
      00902B                        434 00128$:
                                    435 ;	lib/stm8s_clk.c: 378: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      00902B 0D 08            [ 1]  436 	tnz	(0x08, sp)
      00902D 26 0A            [ 1]  437 	jrne	00136$
      00902F 7B 01            [ 1]  438 	ld	a, (0x01, sp)
      009031 A1 B4            [ 1]  439 	cp	a, #0xb4
      009033 26 04            [ 1]  440 	jrne	00136$
                                    441 ;	lib/stm8s_clk.c: 380: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      009035 72 11 50 C1      [ 1]  442 	bres	0x50c1, #0
      009039                        443 00136$:
                                    444 ;	lib/stm8s_clk.c: 383: return(Swif);
      009039 7B 02            [ 1]  445 	ld	a, (0x02, sp)
      00903B 85               [ 2]  446 	popw	x
      00903C 81               [ 4]  447 	ret
                                    448 ;	lib/stm8s_clk.c: 392: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    449 ;	-----------------------------------------
                                    450 ;	 function CLK_HSIPrescalerConfig
                                    451 ;	-----------------------------------------
      00903D                        452 _CLK_HSIPrescalerConfig:
                                    453 ;	lib/stm8s_clk.c: 396: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      00903D AE 50 C6         [ 2]  454 	ldw	x, #0x50c6
      009040 F6               [ 1]  455 	ld	a, (x)
      009041 A4 E7            [ 1]  456 	and	a, #0xe7
      009043 F7               [ 1]  457 	ld	(x), a
                                    458 ;	lib/stm8s_clk.c: 399: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      009044 AE 50 C6         [ 2]  459 	ldw	x, #0x50c6
      009047 F6               [ 1]  460 	ld	a, (x)
      009048 1A 03            [ 1]  461 	or	a, (0x03, sp)
      00904A AE 50 C6         [ 2]  462 	ldw	x, #0x50c6
      00904D F7               [ 1]  463 	ld	(x), a
      00904E 81               [ 4]  464 	ret
                                    465 ;	lib/stm8s_clk.c: 411: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    466 ;	-----------------------------------------
                                    467 ;	 function CLK_CCOConfig
                                    468 ;	-----------------------------------------
      00904F                        469 _CLK_CCOConfig:
                                    470 ;	lib/stm8s_clk.c: 415: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      00904F AE 50 C9         [ 2]  471 	ldw	x, #0x50c9
      009052 F6               [ 1]  472 	ld	a, (x)
      009053 A4 E1            [ 1]  473 	and	a, #0xe1
      009055 F7               [ 1]  474 	ld	(x), a
                                    475 ;	lib/stm8s_clk.c: 418: CLK->CCOR |= (uint8_t)CLK_CCO;
      009056 AE 50 C9         [ 2]  476 	ldw	x, #0x50c9
      009059 F6               [ 1]  477 	ld	a, (x)
      00905A 1A 03            [ 1]  478 	or	a, (0x03, sp)
      00905C AE 50 C9         [ 2]  479 	ldw	x, #0x50c9
      00905F F7               [ 1]  480 	ld	(x), a
                                    481 ;	lib/stm8s_clk.c: 421: CLK->CCOR |= CLK_CCOR_CCOEN;
      009060 72 10 50 C9      [ 1]  482 	bset	0x50c9, #0
      009064 81               [ 4]  483 	ret
                                    484 ;	lib/stm8s_clk.c: 432: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    485 ;	-----------------------------------------
                                    486 ;	 function CLK_ITConfig
                                    487 ;	-----------------------------------------
      009065                        488 _CLK_ITConfig:
      009065 88               [ 1]  489 	push	a
                                    490 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      009066 7B 04            [ 1]  491 	ld	a, (0x04, sp)
      009068 A1 0C            [ 1]  492 	cp	a, #0x0c
      00906A 26 06            [ 1]  493 	jrne	00135$
      00906C A6 01            [ 1]  494 	ld	a, #0x01
      00906E 6B 01            [ 1]  495 	ld	(0x01, sp), a
      009070 20 02            [ 2]  496 	jra	00136$
      009072                        497 00135$:
      009072 0F 01            [ 1]  498 	clr	(0x01, sp)
      009074                        499 00136$:
      009074 7B 04            [ 1]  500 	ld	a, (0x04, sp)
      009076 A1 1C            [ 1]  501 	cp	a, #0x1c
      009078 26 03            [ 1]  502 	jrne	00138$
      00907A A6 01            [ 1]  503 	ld	a, #0x01
      00907C 21                     504 	.byte 0x21
      00907D                        505 00138$:
      00907D 4F               [ 1]  506 	clr	a
      00907E                        507 00139$:
                                    508 ;	lib/stm8s_clk.c: 434: if (NewState != DISABLE)
      00907E 0D 05            [ 1]  509 	tnz	(0x05, sp)
      009080 27 19            [ 1]  510 	jreq	00110$
                                    511 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      009082 0D 01            [ 1]  512 	tnz	(0x01, sp)
      009084 26 0C            [ 1]  513 	jrne	00102$
      009086 4D               [ 1]  514 	tnz	a
      009087 27 29            [ 1]  515 	jreq	00112$
                                    516 ;	lib/stm8s_clk.c: 439: CLK->SWCR |= CLK_SWCR_SWIEN;
      009089 AE 50 C5         [ 2]  517 	ldw	x, #0x50c5
      00908C F6               [ 1]  518 	ld	a, (x)
      00908D AA 04            [ 1]  519 	or	a, #0x04
      00908F F7               [ 1]  520 	ld	(x), a
                                    521 ;	lib/stm8s_clk.c: 440: break;
      009090 20 20            [ 2]  522 	jra	00112$
                                    523 ;	lib/stm8s_clk.c: 441: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      009092                        524 00102$:
                                    525 ;	lib/stm8s_clk.c: 442: CLK->CSSR |= CLK_CSSR_CSSDIE;
      009092 AE 50 C8         [ 2]  526 	ldw	x, #0x50c8
      009095 F6               [ 1]  527 	ld	a, (x)
      009096 AA 04            [ 1]  528 	or	a, #0x04
      009098 F7               [ 1]  529 	ld	(x), a
                                    530 ;	lib/stm8s_clk.c: 443: break;
      009099 20 17            [ 2]  531 	jra	00112$
                                    532 ;	lib/stm8s_clk.c: 446: }
      00909B                        533 00110$:
                                    534 ;	lib/stm8s_clk.c: 450: switch (CLK_IT)
      00909B 0D 01            [ 1]  535 	tnz	(0x01, sp)
      00909D 26 0C            [ 1]  536 	jrne	00106$
      00909F 4D               [ 1]  537 	tnz	a
      0090A0 27 10            [ 1]  538 	jreq	00112$
                                    539 ;	lib/stm8s_clk.c: 453: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      0090A2 AE 50 C5         [ 2]  540 	ldw	x, #0x50c5
      0090A5 F6               [ 1]  541 	ld	a, (x)
      0090A6 A4 FB            [ 1]  542 	and	a, #0xfb
      0090A8 F7               [ 1]  543 	ld	(x), a
                                    544 ;	lib/stm8s_clk.c: 454: break;
      0090A9 20 07            [ 2]  545 	jra	00112$
                                    546 ;	lib/stm8s_clk.c: 455: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      0090AB                        547 00106$:
                                    548 ;	lib/stm8s_clk.c: 456: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      0090AB AE 50 C8         [ 2]  549 	ldw	x, #0x50c8
      0090AE F6               [ 1]  550 	ld	a, (x)
      0090AF A4 FB            [ 1]  551 	and	a, #0xfb
      0090B1 F7               [ 1]  552 	ld	(x), a
                                    553 ;	lib/stm8s_clk.c: 460: }
      0090B2                        554 00112$:
      0090B2 84               [ 1]  555 	pop	a
      0090B3 81               [ 4]  556 	ret
                                    557 ;	lib/stm8s_clk.c: 469: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    558 ;	-----------------------------------------
                                    559 ;	 function CLK_SYSCLKConfig
                                    560 ;	-----------------------------------------
      0090B4                        561 _CLK_SYSCLKConfig:
      0090B4 89               [ 2]  562 	pushw	x
                                    563 ;	lib/stm8s_clk.c: 472: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      0090B5 0D 05            [ 1]  564 	tnz	(0x05, sp)
      0090B7 2B 19            [ 1]  565 	jrmi	00102$
                                    566 ;	lib/stm8s_clk.c: 474: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0090B9 AE 50 C6         [ 2]  567 	ldw	x, #0x50c6
      0090BC F6               [ 1]  568 	ld	a, (x)
      0090BD A4 E7            [ 1]  569 	and	a, #0xe7
      0090BF F7               [ 1]  570 	ld	(x), a
                                    571 ;	lib/stm8s_clk.c: 475: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      0090C0 AE 50 C6         [ 2]  572 	ldw	x, #0x50c6
      0090C3 F6               [ 1]  573 	ld	a, (x)
      0090C4 6B 01            [ 1]  574 	ld	(0x01, sp), a
      0090C6 7B 05            [ 1]  575 	ld	a, (0x05, sp)
      0090C8 A4 18            [ 1]  576 	and	a, #0x18
      0090CA 1A 01            [ 1]  577 	or	a, (0x01, sp)
      0090CC AE 50 C6         [ 2]  578 	ldw	x, #0x50c6
      0090CF F7               [ 1]  579 	ld	(x), a
      0090D0 20 17            [ 2]  580 	jra	00104$
      0090D2                        581 00102$:
                                    582 ;	lib/stm8s_clk.c: 479: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      0090D2 AE 50 C6         [ 2]  583 	ldw	x, #0x50c6
      0090D5 F6               [ 1]  584 	ld	a, (x)
      0090D6 A4 F8            [ 1]  585 	and	a, #0xf8
      0090D8 F7               [ 1]  586 	ld	(x), a
                                    587 ;	lib/stm8s_clk.c: 480: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      0090D9 AE 50 C6         [ 2]  588 	ldw	x, #0x50c6
      0090DC F6               [ 1]  589 	ld	a, (x)
      0090DD 6B 02            [ 1]  590 	ld	(0x02, sp), a
      0090DF 7B 05            [ 1]  591 	ld	a, (0x05, sp)
      0090E1 A4 07            [ 1]  592 	and	a, #0x07
      0090E3 1A 02            [ 1]  593 	or	a, (0x02, sp)
      0090E5 AE 50 C6         [ 2]  594 	ldw	x, #0x50c6
      0090E8 F7               [ 1]  595 	ld	(x), a
      0090E9                        596 00104$:
      0090E9 85               [ 2]  597 	popw	x
      0090EA 81               [ 4]  598 	ret
                                    599 ;	lib/stm8s_clk.c: 490: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    600 ;	-----------------------------------------
                                    601 ;	 function CLK_SWIMConfig
                                    602 ;	-----------------------------------------
      0090EB                        603 _CLK_SWIMConfig:
                                    604 ;	lib/stm8s_clk.c: 493: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      0090EB 0D 03            [ 1]  605 	tnz	(0x03, sp)
      0090ED 27 05            [ 1]  606 	jreq	00102$
                                    607 ;	lib/stm8s_clk.c: 496: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      0090EF 72 10 50 CD      [ 1]  608 	bset	0x50cd, #0
      0090F3 81               [ 4]  609 	ret
      0090F4                        610 00102$:
                                    611 ;	lib/stm8s_clk.c: 501: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      0090F4 72 11 50 CD      [ 1]  612 	bres	0x50cd, #0
      0090F8 81               [ 4]  613 	ret
                                    614 ;	lib/stm8s_clk.c: 512: void CLK_ClockSecuritySystemEnable(void)
                                    615 ;	-----------------------------------------
                                    616 ;	 function CLK_ClockSecuritySystemEnable
                                    617 ;	-----------------------------------------
      0090F9                        618 _CLK_ClockSecuritySystemEnable:
                                    619 ;	lib/stm8s_clk.c: 515: CLK->CSSR |= CLK_CSSR_CSSEN;
      0090F9 72 10 50 C8      [ 1]  620 	bset	0x50c8, #0
      0090FD 81               [ 4]  621 	ret
                                    622 ;	lib/stm8s_clk.c: 524: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    623 ;	-----------------------------------------
                                    624 ;	 function CLK_GetSYSCLKSource
                                    625 ;	-----------------------------------------
      0090FE                        626 _CLK_GetSYSCLKSource:
                                    627 ;	lib/stm8s_clk.c: 526: return((CLK_Source_TypeDef)CLK->CMSR);
      0090FE AE 50 C3         [ 2]  628 	ldw	x, #0x50c3
      009101 F6               [ 1]  629 	ld	a, (x)
      009102 81               [ 4]  630 	ret
                                    631 ;	lib/stm8s_clk.c: 534: uint32_t CLK_GetClockFreq(void)
                                    632 ;	-----------------------------------------
                                    633 ;	 function CLK_GetClockFreq
                                    634 ;	-----------------------------------------
      009103                        635 _CLK_GetClockFreq:
      009103 52 07            [ 2]  636 	sub	sp, #7
                                    637 ;	lib/stm8s_clk.c: 541: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      009105 AE 50 C3         [ 2]  638 	ldw	x, #0x50c3
      009108 F6               [ 1]  639 	ld	a, (x)
      009109 6B 05            [ 1]  640 	ld	(0x05, sp), a
                                    641 ;	lib/stm8s_clk.c: 543: if (clocksource == CLK_SOURCE_HSI)
      00910B 7B 05            [ 1]  642 	ld	a, (0x05, sp)
      00910D A1 E1            [ 1]  643 	cp	a, #0xe1
      00910F 26 2C            [ 1]  644 	jrne	00105$
                                    645 ;	lib/stm8s_clk.c: 545: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      009111 AE 50 C6         [ 2]  646 	ldw	x, #0x50c6
      009114 F6               [ 1]  647 	ld	a, (x)
      009115 A4 18            [ 1]  648 	and	a, #0x18
                                    649 ;	lib/stm8s_clk.c: 546: tmp = (uint8_t)(tmp >> 3);
      009117 44               [ 1]  650 	srl	a
      009118 44               [ 1]  651 	srl	a
      009119 44               [ 1]  652 	srl	a
                                    653 ;	lib/stm8s_clk.c: 547: presc = HSIDivFactor[tmp];
      00911A AE 91 F0         [ 2]  654 	ldw	x, #_HSIDivFactor+0
      00911D 1F 06            [ 2]  655 	ldw	(0x06, sp), x
      00911F 5F               [ 1]  656 	clrw	x
      009120 97               [ 1]  657 	ld	xl, a
      009121 72 FB 06         [ 2]  658 	addw	x, (0x06, sp)
      009124 F6               [ 1]  659 	ld	a, (x)
                                    660 ;	lib/stm8s_clk.c: 548: clockfrequency = HSI_VALUE / presc;
      009125 5F               [ 1]  661 	clrw	x
      009126 97               [ 1]  662 	ld	xl, a
      009127 90 5F            [ 1]  663 	clrw	y
      009129 89               [ 2]  664 	pushw	x
      00912A 90 89            [ 2]  665 	pushw	y
      00912C 4B 00            [ 1]  666 	push	#0x00
      00912E 4B 24            [ 1]  667 	push	#0x24
      009130 4B F4            [ 1]  668 	push	#0xf4
      009132 4B 00            [ 1]  669 	push	#0x00
      009134 CD 98 13         [ 4]  670 	call	__divulong
      009137 5B 08            [ 2]  671 	addw	sp, #8
      009139 1F 03            [ 2]  672 	ldw	(0x03, sp), x
      00913B 20 1A            [ 2]  673 	jra	00106$
      00913D                        674 00105$:
                                    675 ;	lib/stm8s_clk.c: 550: else if ( clocksource == CLK_SOURCE_LSI)
      00913D 7B 05            [ 1]  676 	ld	a, (0x05, sp)
      00913F A1 D2            [ 1]  677 	cp	a, #0xd2
      009141 26 0B            [ 1]  678 	jrne	00102$
                                    679 ;	lib/stm8s_clk.c: 552: clockfrequency = LSI_VALUE;
      009143 AE F4 00         [ 2]  680 	ldw	x, #0xf400
      009146 1F 03            [ 2]  681 	ldw	(0x03, sp), x
      009148 90 AE 00 01      [ 2]  682 	ldw	y, #0x0001
      00914C 20 09            [ 2]  683 	jra	00106$
      00914E                        684 00102$:
                                    685 ;	lib/stm8s_clk.c: 556: clockfrequency = HSE_VALUE;
      00914E AE 24 00         [ 2]  686 	ldw	x, #0x2400
      009151 1F 03            [ 2]  687 	ldw	(0x03, sp), x
      009153 90 AE 00 F4      [ 2]  688 	ldw	y, #0x00f4
      009157                        689 00106$:
                                    690 ;	lib/stm8s_clk.c: 559: return((uint32_t)clockfrequency);
      009157 1E 03            [ 2]  691 	ldw	x, (0x03, sp)
      009159 5B 07            [ 2]  692 	addw	sp, #7
      00915B 81               [ 4]  693 	ret
                                    694 ;	lib/stm8s_clk.c: 569: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    695 ;	-----------------------------------------
                                    696 ;	 function CLK_AdjustHSICalibrationValue
                                    697 ;	-----------------------------------------
      00915C                        698 _CLK_AdjustHSICalibrationValue:
                                    699 ;	lib/stm8s_clk.c: 573: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      00915C AE 50 CC         [ 2]  700 	ldw	x, #0x50cc
      00915F F6               [ 1]  701 	ld	a, (x)
      009160 A4 F8            [ 1]  702 	and	a, #0xf8
      009162 1A 03            [ 1]  703 	or	a, (0x03, sp)
      009164 AE 50 CC         [ 2]  704 	ldw	x, #0x50cc
      009167 F7               [ 1]  705 	ld	(x), a
      009168 81               [ 4]  706 	ret
                                    707 ;	lib/stm8s_clk.c: 585: void CLK_SYSCLKEmergencyClear(void)
                                    708 ;	-----------------------------------------
                                    709 ;	 function CLK_SYSCLKEmergencyClear
                                    710 ;	-----------------------------------------
      009169                        711 _CLK_SYSCLKEmergencyClear:
                                    712 ;	lib/stm8s_clk.c: 587: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      009169 72 11 50 C5      [ 1]  713 	bres	0x50c5, #0
      00916D 81               [ 4]  714 	ret
                                    715 ;	lib/stm8s_clk.c: 597: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    716 ;	-----------------------------------------
                                    717 ;	 function CLK_GetFlagStatus
                                    718 ;	-----------------------------------------
      00916E                        719 _CLK_GetFlagStatus:
      00916E 88               [ 1]  720 	push	a
                                    721 ;	lib/stm8s_clk.c: 604: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      00916F 4F               [ 1]  722 	clr	a
      009170 97               [ 1]  723 	ld	xl, a
      009171 7B 04            [ 1]  724 	ld	a, (0x04, sp)
      009173 95               [ 1]  725 	ld	xh, a
                                    726 ;	lib/stm8s_clk.c: 607: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      009174 A3 01 00         [ 2]  727 	cpw	x, #0x0100
      009177 26 06            [ 1]  728 	jrne	00111$
                                    729 ;	lib/stm8s_clk.c: 609: tmpreg = CLK->ICKR;
      009179 AE 50 C0         [ 2]  730 	ldw	x, #0x50c0
      00917C F6               [ 1]  731 	ld	a, (x)
      00917D 20 25            [ 2]  732 	jra	00112$
      00917F                        733 00111$:
                                    734 ;	lib/stm8s_clk.c: 611: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      00917F A3 02 00         [ 2]  735 	cpw	x, #0x0200
      009182 26 06            [ 1]  736 	jrne	00108$
                                    737 ;	lib/stm8s_clk.c: 613: tmpreg = CLK->ECKR;
      009184 AE 50 C1         [ 2]  738 	ldw	x, #0x50c1
      009187 F6               [ 1]  739 	ld	a, (x)
      009188 20 1A            [ 2]  740 	jra	00112$
      00918A                        741 00108$:
                                    742 ;	lib/stm8s_clk.c: 615: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      00918A A3 03 00         [ 2]  743 	cpw	x, #0x0300
      00918D 26 06            [ 1]  744 	jrne	00105$
                                    745 ;	lib/stm8s_clk.c: 617: tmpreg = CLK->SWCR;
      00918F AE 50 C5         [ 2]  746 	ldw	x, #0x50c5
      009192 F6               [ 1]  747 	ld	a, (x)
      009193 20 0F            [ 2]  748 	jra	00112$
      009195                        749 00105$:
                                    750 ;	lib/stm8s_clk.c: 619: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      009195 A3 04 00         [ 2]  751 	cpw	x, #0x0400
      009198 26 06            [ 1]  752 	jrne	00102$
                                    753 ;	lib/stm8s_clk.c: 621: tmpreg = CLK->CSSR;
      00919A AE 50 C8         [ 2]  754 	ldw	x, #0x50c8
      00919D F6               [ 1]  755 	ld	a, (x)
      00919E 20 04            [ 2]  756 	jra	00112$
      0091A0                        757 00102$:
                                    758 ;	lib/stm8s_clk.c: 625: tmpreg = CLK->CCOR;
      0091A0 AE 50 C9         [ 2]  759 	ldw	x, #0x50c9
      0091A3 F6               [ 1]  760 	ld	a, (x)
      0091A4                        761 00112$:
                                    762 ;	lib/stm8s_clk.c: 628: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      0091A4 88               [ 1]  763 	push	a
      0091A5 7B 06            [ 1]  764 	ld	a, (0x06, sp)
      0091A7 6B 02            [ 1]  765 	ld	(0x02, sp), a
      0091A9 84               [ 1]  766 	pop	a
      0091AA 14 01            [ 1]  767 	and	a, (0x01, sp)
      0091AC 4D               [ 1]  768 	tnz	a
      0091AD 27 03            [ 1]  769 	jreq	00114$
                                    770 ;	lib/stm8s_clk.c: 630: bitstatus = SET;
      0091AF A6 01            [ 1]  771 	ld	a, #0x01
                                    772 ;	lib/stm8s_clk.c: 634: bitstatus = RESET;
      0091B1 21                     773 	.byte 0x21
      0091B2                        774 00114$:
      0091B2 4F               [ 1]  775 	clr	a
      0091B3                        776 00115$:
                                    777 ;	lib/stm8s_clk.c: 638: return((FlagStatus)bitstatus);
      0091B3 5B 01            [ 2]  778 	addw	sp, #1
      0091B5 81               [ 4]  779 	ret
                                    780 ;	lib/stm8s_clk.c: 647: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    781 ;	-----------------------------------------
                                    782 ;	 function CLK_GetITStatus
                                    783 ;	-----------------------------------------
      0091B6                        784 _CLK_GetITStatus:
                                    785 ;	lib/stm8s_clk.c: 651: if (CLK_IT == CLK_IT_SWIF)
      0091B6 7B 03            [ 1]  786 	ld	a, (0x03, sp)
      0091B8 A1 1C            [ 1]  787 	cp	a, #0x1c
      0091BA 26 0F            [ 1]  788 	jrne	00108$
                                    789 ;	lib/stm8s_clk.c: 654: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0091BC AE 50 C5         [ 2]  790 	ldw	x, #0x50c5
      0091BF F6               [ 1]  791 	ld	a, (x)
      0091C0 14 03            [ 1]  792 	and	a, (0x03, sp)
      0091C2 A1 0C            [ 1]  793 	cp	a, #0x0c
      0091C4 26 03            [ 1]  794 	jrne	00102$
                                    795 ;	lib/stm8s_clk.c: 656: bitstatus = SET;
      0091C6 A6 01            [ 1]  796 	ld	a, #0x01
      0091C8 81               [ 4]  797 	ret
      0091C9                        798 00102$:
                                    799 ;	lib/stm8s_clk.c: 660: bitstatus = RESET;
      0091C9 4F               [ 1]  800 	clr	a
      0091CA 81               [ 4]  801 	ret
      0091CB                        802 00108$:
                                    803 ;	lib/stm8s_clk.c: 666: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0091CB AE 50 C8         [ 2]  804 	ldw	x, #0x50c8
      0091CE F6               [ 1]  805 	ld	a, (x)
      0091CF 14 03            [ 1]  806 	and	a, (0x03, sp)
      0091D1 A1 0C            [ 1]  807 	cp	a, #0x0c
      0091D3 26 03            [ 1]  808 	jrne	00105$
                                    809 ;	lib/stm8s_clk.c: 668: bitstatus = SET;
      0091D5 A6 01            [ 1]  810 	ld	a, #0x01
      0091D7 81               [ 4]  811 	ret
      0091D8                        812 00105$:
                                    813 ;	lib/stm8s_clk.c: 672: bitstatus = RESET;
      0091D8 4F               [ 1]  814 	clr	a
                                    815 ;	lib/stm8s_clk.c: 677: return bitstatus;
      0091D9 81               [ 4]  816 	ret
                                    817 ;	lib/stm8s_clk.c: 686: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    818 ;	-----------------------------------------
                                    819 ;	 function CLK_ClearITPendingBit
                                    820 ;	-----------------------------------------
      0091DA                        821 _CLK_ClearITPendingBit:
                                    822 ;	lib/stm8s_clk.c: 689: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      0091DA 7B 03            [ 1]  823 	ld	a, (0x03, sp)
      0091DC A1 0C            [ 1]  824 	cp	a, #0x0c
      0091DE 26 08            [ 1]  825 	jrne	00102$
                                    826 ;	lib/stm8s_clk.c: 692: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      0091E0 AE 50 C8         [ 2]  827 	ldw	x, #0x50c8
      0091E3 F6               [ 1]  828 	ld	a, (x)
      0091E4 A4 F7            [ 1]  829 	and	a, #0xf7
      0091E6 F7               [ 1]  830 	ld	(x), a
      0091E7 81               [ 4]  831 	ret
      0091E8                        832 00102$:
                                    833 ;	lib/stm8s_clk.c: 697: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      0091E8 AE 50 C5         [ 2]  834 	ldw	x, #0x50c5
      0091EB F6               [ 1]  835 	ld	a, (x)
      0091EC A4 F7            [ 1]  836 	and	a, #0xf7
      0091EE F7               [ 1]  837 	ld	(x), a
      0091EF 81               [ 4]  838 	ret
                                    839 	.area CODE
      0091F0                        840 _HSIDivFactor:
      0091F0 01                     841 	.db #0x01	; 1
      0091F1 02                     842 	.db #0x02	; 2
      0091F2 04                     843 	.db #0x04	; 4
      0091F3 08                     844 	.db #0x08	; 8
      0091F4                        845 _CLKPrescTable:
      0091F4 01                     846 	.db #0x01	; 1
      0091F5 02                     847 	.db #0x02	; 2
      0091F6 04                     848 	.db #0x04	; 4
      0091F7 08                     849 	.db #0x08	; 8
      0091F8 0A                     850 	.db #0x0a	; 10
      0091F9 10                     851 	.db #0x10	; 16
      0091FA 14                     852 	.db #0x14	; 20
      0091FB 28                     853 	.db #0x28	; 40
                                    854 	.area INITIALIZER
                                    855 	.area CABS (ABS)
