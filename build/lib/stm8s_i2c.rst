                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_i2c
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _I2C_DeInit
                                     12 	.globl _I2C_Init
                                     13 	.globl _I2C_Cmd
                                     14 	.globl _I2C_GeneralCallCmd
                                     15 	.globl _I2C_GenerateSTART
                                     16 	.globl _I2C_GenerateSTOP
                                     17 	.globl _I2C_SoftwareResetCmd
                                     18 	.globl _I2C_StretchClockCmd
                                     19 	.globl _I2C_AcknowledgeConfig
                                     20 	.globl _I2C_ITConfig
                                     21 	.globl _I2C_FastModeDutyCycleConfig
                                     22 	.globl _I2C_ReceiveData
                                     23 	.globl _I2C_Send7bitAddress
                                     24 	.globl _I2C_SendData
                                     25 	.globl _I2C_CheckEvent
                                     26 	.globl _I2C_GetLastEvent
                                     27 	.globl _I2C_GetFlagStatus
                                     28 	.globl _I2C_ClearFlag
                                     29 	.globl _I2C_GetITStatus
                                     30 	.globl _I2C_ClearITPendingBit
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DATA
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area INITIALIZED
                                     39 ;--------------------------------------------------------
                                     40 ; absolute external ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DABS (ABS)
                                     43 ;--------------------------------------------------------
                                     44 ; global & static initialisations
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area GSINIT
                                     48 	.area GSFINAL
                                     49 	.area GSINIT
                                     50 ;--------------------------------------------------------
                                     51 ; Home
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
                                     54 	.area HOME
                                     55 ;--------------------------------------------------------
                                     56 ; code
                                     57 ;--------------------------------------------------------
                                     58 	.area CODE
                                     59 ;	lib/stm8s_i2c.c: 41: void I2C_DeInit(void)
                                     60 ;	-----------------------------------------
                                     61 ;	 function I2C_DeInit
                                     62 ;	-----------------------------------------
      0095DD                         63 _I2C_DeInit:
                                     64 ;	lib/stm8s_i2c.c: 43: I2C->CR1 = I2C_CR1_RESET_VALUE;
      0095DD 35 00 52 10      [ 1]   65 	mov	0x5210+0, #0x00
                                     66 ;	lib/stm8s_i2c.c: 44: I2C->CR2 = I2C_CR2_RESET_VALUE;
      0095E1 35 00 52 11      [ 1]   67 	mov	0x5211+0, #0x00
                                     68 ;	lib/stm8s_i2c.c: 45: I2C->FREQR = I2C_FREQR_RESET_VALUE;
      0095E5 35 00 52 12      [ 1]   69 	mov	0x5212+0, #0x00
                                     70 ;	lib/stm8s_i2c.c: 46: I2C->OARL = I2C_OARL_RESET_VALUE;
      0095E9 35 00 52 13      [ 1]   71 	mov	0x5213+0, #0x00
                                     72 ;	lib/stm8s_i2c.c: 47: I2C->OARH = I2C_OARH_RESET_VALUE;
      0095ED 35 00 52 14      [ 1]   73 	mov	0x5214+0, #0x00
                                     74 ;	lib/stm8s_i2c.c: 48: I2C->ITR = I2C_ITR_RESET_VALUE;
      0095F1 35 00 52 1A      [ 1]   75 	mov	0x521a+0, #0x00
                                     76 ;	lib/stm8s_i2c.c: 49: I2C->CCRL = I2C_CCRL_RESET_VALUE;
      0095F5 35 00 52 1B      [ 1]   77 	mov	0x521b+0, #0x00
                                     78 ;	lib/stm8s_i2c.c: 50: I2C->CCRH = I2C_CCRH_RESET_VALUE;
      0095F9 35 00 52 1C      [ 1]   79 	mov	0x521c+0, #0x00
                                     80 ;	lib/stm8s_i2c.c: 51: I2C->TRISER = I2C_TRISER_RESET_VALUE;
      0095FD 35 02 52 1D      [ 1]   81 	mov	0x521d+0, #0x02
      009601 81               [ 4]   82 	ret
                                     83 ;	lib/stm8s_i2c.c: 70: void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
                                     84 ;	-----------------------------------------
                                     85 ;	 function I2C_Init
                                     86 ;	-----------------------------------------
      009602                         87 _I2C_Init:
      009602 52 0A            [ 2]   88 	sub	sp, #10
                                     89 ;	lib/stm8s_i2c.c: 76: uint8_t tmpccrh = 0;
      009604 0F 01            [ 1]   90 	clr	(0x01, sp)
                                     91 ;	lib/stm8s_i2c.c: 82: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
      009606 AE 52 12         [ 2]   92 	ldw	x, #0x5212
      009609 F6               [ 1]   93 	ld	a, (x)
      00960A A4 C0            [ 1]   94 	and	a, #0xc0
      00960C F7               [ 1]   95 	ld	(x), a
                                     96 ;	lib/stm8s_i2c.c: 84: I2C->FREQR |= InputClockFrequencyMHz;
      00960D AE 52 12         [ 2]   97 	ldw	x, #0x5212
      009610 F6               [ 1]   98 	ld	a, (x)
      009611 1A 16            [ 1]   99 	or	a, (0x16, sp)
      009613 AE 52 12         [ 2]  100 	ldw	x, #0x5212
      009616 F7               [ 1]  101 	ld	(x), a
                                    102 ;	lib/stm8s_i2c.c: 88: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      009617 72 11 52 10      [ 1]  103 	bres	0x5210, #0
                                    104 ;	lib/stm8s_i2c.c: 91: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
      00961B AE 52 1C         [ 2]  105 	ldw	x, #0x521c
      00961E F6               [ 1]  106 	ld	a, (x)
      00961F A4 30            [ 1]  107 	and	a, #0x30
      009621 F7               [ 1]  108 	ld	(x), a
                                    109 ;	lib/stm8s_i2c.c: 92: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
      009622 AE 52 1B         [ 2]  110 	ldw	x, #0x521b
      009625 F6               [ 1]  111 	ld	a, (x)
      009626 35 00 52 1B      [ 1]  112 	mov	0x521b+0, #0x00
                                    113 ;	lib/stm8s_i2c.c: 103: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      00962A 5F               [ 1]  114 	clrw	x
      00962B 7B 16            [ 1]  115 	ld	a, (0x16, sp)
      00962D 97               [ 1]  116 	ld	xl, a
      00962E 90 5F            [ 1]  117 	clrw	y
      009630 89               [ 2]  118 	pushw	x
      009631 90 89            [ 2]  119 	pushw	y
      009633 4B 40            [ 1]  120 	push	#0x40
      009635 4B 42            [ 1]  121 	push	#0x42
      009637 4B 0F            [ 1]  122 	push	#0x0f
      009639 4B 00            [ 1]  123 	push	#0x00
      00963B CD 9B 94         [ 4]  124 	call	__mullong
      00963E 5B 08            [ 2]  125 	addw	sp, #8
      009640 1F 09            [ 2]  126 	ldw	(0x09, sp), x
      009642 17 07            [ 2]  127 	ldw	(0x07, sp), y
                                    128 ;	lib/stm8s_i2c.c: 95: if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
      009644 AE 86 A0         [ 2]  129 	ldw	x, #0x86a0
      009647 13 0F            [ 2]  130 	cpw	x, (0x0f, sp)
      009649 A6 01            [ 1]  131 	ld	a, #0x01
      00964B 12 0E            [ 1]  132 	sbc	a, (0x0e, sp)
      00964D 4F               [ 1]  133 	clr	a
      00964E 12 0D            [ 1]  134 	sbc	a, (0x0d, sp)
      009650 24 77            [ 1]  135 	jrnc	00109$
                                    136 ;	lib/stm8s_i2c.c: 98: tmpccrh = I2C_CCRH_FS;
      009652 A6 80            [ 1]  137 	ld	a, #0x80
      009654 6B 01            [ 1]  138 	ld	(0x01, sp), a
                                    139 ;	lib/stm8s_i2c.c: 100: if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
      009656 0D 13            [ 1]  140 	tnz	(0x13, sp)
      009658 26 23            [ 1]  141 	jrne	00102$
                                    142 ;	lib/stm8s_i2c.c: 103: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      00965A 1E 0F            [ 2]  143 	ldw	x, (0x0f, sp)
      00965C 89               [ 2]  144 	pushw	x
      00965D 1E 0F            [ 2]  145 	ldw	x, (0x0f, sp)
      00965F 89               [ 2]  146 	pushw	x
      009660 4B 03            [ 1]  147 	push	#0x03
      009662 5F               [ 1]  148 	clrw	x
      009663 89               [ 2]  149 	pushw	x
      009664 4B 00            [ 1]  150 	push	#0x00
      009666 CD 9B 94         [ 4]  151 	call	__mullong
      009669 5B 08            [ 2]  152 	addw	sp, #8
      00966B 89               [ 2]  153 	pushw	x
      00966C 90 89            [ 2]  154 	pushw	y
      00966E 1E 0D            [ 2]  155 	ldw	x, (0x0d, sp)
      009670 89               [ 2]  156 	pushw	x
      009671 1E 0D            [ 2]  157 	ldw	x, (0x0d, sp)
      009673 89               [ 2]  158 	pushw	x
      009674 CD 9B 19         [ 4]  159 	call	__divulong
      009677 5B 08            [ 2]  160 	addw	sp, #8
      009679 1F 02            [ 2]  161 	ldw	(0x02, sp), x
      00967B 20 28            [ 2]  162 	jra	00103$
      00967D                        163 00102$:
                                    164 ;	lib/stm8s_i2c.c: 108: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
      00967D 1E 0F            [ 2]  165 	ldw	x, (0x0f, sp)
      00967F 89               [ 2]  166 	pushw	x
      009680 1E 0F            [ 2]  167 	ldw	x, (0x0f, sp)
      009682 89               [ 2]  168 	pushw	x
      009683 4B 19            [ 1]  169 	push	#0x19
      009685 5F               [ 1]  170 	clrw	x
      009686 89               [ 2]  171 	pushw	x
      009687 4B 00            [ 1]  172 	push	#0x00
      009689 CD 9B 94         [ 4]  173 	call	__mullong
      00968C 5B 08            [ 2]  174 	addw	sp, #8
      00968E 9F               [ 1]  175 	ld	a, xl
      00968F 88               [ 1]  176 	push	a
      009690 9E               [ 1]  177 	ld	a, xh
      009691 88               [ 1]  178 	push	a
      009692 90 89            [ 2]  179 	pushw	y
      009694 1E 0D            [ 2]  180 	ldw	x, (0x0d, sp)
      009696 89               [ 2]  181 	pushw	x
      009697 1E 0D            [ 2]  182 	ldw	x, (0x0d, sp)
      009699 89               [ 2]  183 	pushw	x
      00969A CD 9B 19         [ 4]  184 	call	__divulong
      00969D 5B 08            [ 2]  185 	addw	sp, #8
      00969F 1F 02            [ 2]  186 	ldw	(0x02, sp), x
                                    187 ;	lib/stm8s_i2c.c: 110: tmpccrh |= I2C_CCRH_DUTY;
      0096A1 A6 C0            [ 1]  188 	ld	a, #0xc0
      0096A3 6B 01            [ 1]  189 	ld	(0x01, sp), a
      0096A5                        190 00103$:
                                    191 ;	lib/stm8s_i2c.c: 114: if (result < (uint16_t)0x01)
      0096A5 1E 02            [ 2]  192 	ldw	x, (0x02, sp)
      0096A7 A3 00 01         [ 2]  193 	cpw	x, #0x0001
      0096AA 24 05            [ 1]  194 	jrnc	00105$
                                    195 ;	lib/stm8s_i2c.c: 117: result = (uint16_t)0x0001;
      0096AC AE 00 01         [ 2]  196 	ldw	x, #0x0001
      0096AF 1F 02            [ 2]  197 	ldw	(0x02, sp), x
      0096B1                        198 00105$:
                                    199 ;	lib/stm8s_i2c.c: 123: tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
      0096B1 7B 16            [ 1]  200 	ld	a, (0x16, sp)
      0096B3 97               [ 1]  201 	ld	xl, a
      0096B4 A6 03            [ 1]  202 	ld	a, #0x03
      0096B6 42               [ 4]  203 	mul	x, a
      0096B7 4B 0A            [ 1]  204 	push	#0x0a
      0096B9 4B 00            [ 1]  205 	push	#0x00
      0096BB 89               [ 2]  206 	pushw	x
      0096BC CD 9C 10         [ 4]  207 	call	__divsint
      0096BF 5B 04            [ 2]  208 	addw	sp, #4
      0096C1 5C               [ 2]  209 	incw	x
      0096C2 9F               [ 1]  210 	ld	a, xl
                                    211 ;	lib/stm8s_i2c.c: 124: I2C->TRISER = (uint8_t)tmpval;
      0096C3 AE 52 1D         [ 2]  212 	ldw	x, #0x521d
      0096C6 F7               [ 1]  213 	ld	(x), a
      0096C7 20 2A            [ 2]  214 	jra	00110$
      0096C9                        215 00109$:
                                    216 ;	lib/stm8s_i2c.c: 131: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
      0096C9 1E 0F            [ 2]  217 	ldw	x, (0x0f, sp)
      0096CB 16 0D            [ 2]  218 	ldw	y, (0x0d, sp)
      0096CD 58               [ 2]  219 	sllw	x
      0096CE 90 59            [ 2]  220 	rlcw	y
      0096D0 89               [ 2]  221 	pushw	x
      0096D1 90 89            [ 2]  222 	pushw	y
      0096D3 1E 0D            [ 2]  223 	ldw	x, (0x0d, sp)
      0096D5 89               [ 2]  224 	pushw	x
      0096D6 1E 0D            [ 2]  225 	ldw	x, (0x0d, sp)
      0096D8 89               [ 2]  226 	pushw	x
      0096D9 CD 9B 19         [ 4]  227 	call	__divulong
      0096DC 5B 08            [ 2]  228 	addw	sp, #8
      0096DE 1F 02            [ 2]  229 	ldw	(0x02, sp), x
                                    230 ;	lib/stm8s_i2c.c: 134: if (result < (uint16_t)0x0004)
      0096E0 1E 02            [ 2]  231 	ldw	x, (0x02, sp)
      0096E2 A3 00 04         [ 2]  232 	cpw	x, #0x0004
      0096E5 24 05            [ 1]  233 	jrnc	00107$
                                    234 ;	lib/stm8s_i2c.c: 137: result = (uint16_t)0x0004;
      0096E7 AE 00 04         [ 2]  235 	ldw	x, #0x0004
      0096EA 1F 02            [ 2]  236 	ldw	(0x02, sp), x
      0096EC                        237 00107$:
                                    238 ;	lib/stm8s_i2c.c: 143: I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
      0096EC 7B 16            [ 1]  239 	ld	a, (0x16, sp)
      0096EE 4C               [ 1]  240 	inc	a
      0096EF AE 52 1D         [ 2]  241 	ldw	x, #0x521d
      0096F2 F7               [ 1]  242 	ld	(x), a
      0096F3                        243 00110$:
                                    244 ;	lib/stm8s_i2c.c: 148: I2C->CCRL = (uint8_t)result;
      0096F3 7B 03            [ 1]  245 	ld	a, (0x03, sp)
      0096F5 AE 52 1B         [ 2]  246 	ldw	x, #0x521b
      0096F8 F7               [ 1]  247 	ld	(x), a
                                    248 ;	lib/stm8s_i2c.c: 149: I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
      0096F9 7B 02            [ 1]  249 	ld	a, (0x02, sp)
      0096FB 0F 05            [ 1]  250 	clr	(0x05, sp)
      0096FD A4 0F            [ 1]  251 	and	a, #0x0f
      0096FF 1A 01            [ 1]  252 	or	a, (0x01, sp)
      009701 AE 52 1C         [ 2]  253 	ldw	x, #0x521c
      009704 F7               [ 1]  254 	ld	(x), a
                                    255 ;	lib/stm8s_i2c.c: 152: I2C->CR1 |= I2C_CR1_PE;
      009705 72 10 52 10      [ 1]  256 	bset	0x5210, #0
                                    257 ;	lib/stm8s_i2c.c: 155: I2C_AcknowledgeConfig(Ack);
      009709 7B 14            [ 1]  258 	ld	a, (0x14, sp)
      00970B 88               [ 1]  259 	push	a
      00970C CD 97 90         [ 4]  260 	call	_I2C_AcknowledgeConfig
      00970F 84               [ 1]  261 	pop	a
                                    262 ;	lib/stm8s_i2c.c: 158: I2C->OARL = (uint8_t)(OwnAddress);
      009710 7B 12            [ 1]  263 	ld	a, (0x12, sp)
      009712 AE 52 13         [ 2]  264 	ldw	x, #0x5213
      009715 F7               [ 1]  265 	ld	(x), a
                                    266 ;	lib/stm8s_i2c.c: 159: I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
      009716 7B 15            [ 1]  267 	ld	a, (0x15, sp)
      009718 AA 40            [ 1]  268 	or	a, #0x40
      00971A 6B 04            [ 1]  269 	ld	(0x04, sp), a
                                    270 ;	lib/stm8s_i2c.c: 160: (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
      00971C 4F               [ 1]  271 	clr	a
      00971D 97               [ 1]  272 	ld	xl, a
      00971E 7B 11            [ 1]  273 	ld	a, (0x11, sp)
      009720 A4 03            [ 1]  274 	and	a, #0x03
      009722 95               [ 1]  275 	ld	xh, a
      009723 A6 80            [ 1]  276 	ld	a, #0x80
      009725 62               [ 2]  277 	div	x, a
      009726 9F               [ 1]  278 	ld	a, xl
      009727 1A 04            [ 1]  279 	or	a, (0x04, sp)
      009729 AE 52 14         [ 2]  280 	ldw	x, #0x5214
      00972C F7               [ 1]  281 	ld	(x), a
      00972D 5B 0A            [ 2]  282 	addw	sp, #10
      00972F 81               [ 4]  283 	ret
                                    284 ;	lib/stm8s_i2c.c: 169: void I2C_Cmd(FunctionalState NewState)
                                    285 ;	-----------------------------------------
                                    286 ;	 function I2C_Cmd
                                    287 ;	-----------------------------------------
      009730                        288 _I2C_Cmd:
                                    289 ;	lib/stm8s_i2c.c: 171: if (NewState != DISABLE)
      009730 0D 03            [ 1]  290 	tnz	(0x03, sp)
      009732 27 05            [ 1]  291 	jreq	00102$
                                    292 ;	lib/stm8s_i2c.c: 174: I2C->CR1 |= I2C_CR1_PE;
      009734 72 10 52 10      [ 1]  293 	bset	0x5210, #0
      009738 81               [ 4]  294 	ret
      009739                        295 00102$:
                                    296 ;	lib/stm8s_i2c.c: 179: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      009739 72 11 52 10      [ 1]  297 	bres	0x5210, #0
      00973D 81               [ 4]  298 	ret
                                    299 ;	lib/stm8s_i2c.c: 189: void I2C_GeneralCallCmd(FunctionalState NewState)
                                    300 ;	-----------------------------------------
                                    301 ;	 function I2C_GeneralCallCmd
                                    302 ;	-----------------------------------------
      00973E                        303 _I2C_GeneralCallCmd:
                                    304 ;	lib/stm8s_i2c.c: 191: if (NewState != DISABLE)
      00973E 0D 03            [ 1]  305 	tnz	(0x03, sp)
      009740 27 08            [ 1]  306 	jreq	00102$
                                    307 ;	lib/stm8s_i2c.c: 194: I2C->CR1 |= I2C_CR1_ENGC;
      009742 AE 52 10         [ 2]  308 	ldw	x, #0x5210
      009745 F6               [ 1]  309 	ld	a, (x)
      009746 AA 40            [ 1]  310 	or	a, #0x40
      009748 F7               [ 1]  311 	ld	(x), a
      009749 81               [ 4]  312 	ret
      00974A                        313 00102$:
                                    314 ;	lib/stm8s_i2c.c: 199: I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
      00974A AE 52 10         [ 2]  315 	ldw	x, #0x5210
      00974D F6               [ 1]  316 	ld	a, (x)
      00974E A4 BF            [ 1]  317 	and	a, #0xbf
      009750 F7               [ 1]  318 	ld	(x), a
      009751 81               [ 4]  319 	ret
                                    320 ;	lib/stm8s_i2c.c: 211: void I2C_GenerateSTART(FunctionalState NewState)
                                    321 ;	-----------------------------------------
                                    322 ;	 function I2C_GenerateSTART
                                    323 ;	-----------------------------------------
      009752                        324 _I2C_GenerateSTART:
                                    325 ;	lib/stm8s_i2c.c: 214: if (NewState != DISABLE)
      009752 0D 03            [ 1]  326 	tnz	(0x03, sp)
      009754 27 05            [ 1]  327 	jreq	00102$
                                    328 ;	lib/stm8s_i2c.c: 217: I2C->CR2 |= I2C_CR2_START;
      009756 72 10 52 11      [ 1]  329 	bset	0x5211, #0
      00975A 81               [ 4]  330 	ret
      00975B                        331 00102$:
                                    332 ;	lib/stm8s_i2c.c: 222: I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
      00975B 72 11 52 11      [ 1]  333 	bres	0x5211, #0
      00975F 81               [ 4]  334 	ret
                                    335 ;	lib/stm8s_i2c.c: 232: void I2C_GenerateSTOP(FunctionalState NewState)
                                    336 ;	-----------------------------------------
                                    337 ;	 function I2C_GenerateSTOP
                                    338 ;	-----------------------------------------
      009760                        339 _I2C_GenerateSTOP:
                                    340 ;	lib/stm8s_i2c.c: 234: if (NewState != DISABLE)
      009760 0D 03            [ 1]  341 	tnz	(0x03, sp)
      009762 27 08            [ 1]  342 	jreq	00102$
                                    343 ;	lib/stm8s_i2c.c: 237: I2C->CR2 |= I2C_CR2_STOP;
      009764 AE 52 11         [ 2]  344 	ldw	x, #0x5211
      009767 F6               [ 1]  345 	ld	a, (x)
      009768 AA 02            [ 1]  346 	or	a, #0x02
      00976A F7               [ 1]  347 	ld	(x), a
      00976B 81               [ 4]  348 	ret
      00976C                        349 00102$:
                                    350 ;	lib/stm8s_i2c.c: 242: I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
      00976C AE 52 11         [ 2]  351 	ldw	x, #0x5211
      00976F F6               [ 1]  352 	ld	a, (x)
      009770 A4 FD            [ 1]  353 	and	a, #0xfd
      009772 F7               [ 1]  354 	ld	(x), a
      009773 81               [ 4]  355 	ret
                                    356 ;	lib/stm8s_i2c.c: 252: void I2C_SoftwareResetCmd(FunctionalState NewState)
                                    357 ;	-----------------------------------------
                                    358 ;	 function I2C_SoftwareResetCmd
                                    359 ;	-----------------------------------------
      009774                        360 _I2C_SoftwareResetCmd:
                                    361 ;	lib/stm8s_i2c.c: 255: if (NewState != DISABLE)
      009774 0D 03            [ 1]  362 	tnz	(0x03, sp)
      009776 27 05            [ 1]  363 	jreq	00102$
                                    364 ;	lib/stm8s_i2c.c: 258: I2C->CR2 |= I2C_CR2_SWRST;
      009778 72 1E 52 11      [ 1]  365 	bset	0x5211, #7
      00977C 81               [ 4]  366 	ret
      00977D                        367 00102$:
                                    368 ;	lib/stm8s_i2c.c: 263: I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
      00977D 72 1F 52 11      [ 1]  369 	bres	0x5211, #7
      009781 81               [ 4]  370 	ret
                                    371 ;	lib/stm8s_i2c.c: 274: void I2C_StretchClockCmd(FunctionalState NewState)
                                    372 ;	-----------------------------------------
                                    373 ;	 function I2C_StretchClockCmd
                                    374 ;	-----------------------------------------
      009782                        375 _I2C_StretchClockCmd:
                                    376 ;	lib/stm8s_i2c.c: 276: if (NewState != DISABLE)
      009782 0D 03            [ 1]  377 	tnz	(0x03, sp)
      009784 27 05            [ 1]  378 	jreq	00102$
                                    379 ;	lib/stm8s_i2c.c: 279: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
      009786 72 1F 52 10      [ 1]  380 	bres	0x5210, #7
      00978A 81               [ 4]  381 	ret
      00978B                        382 00102$:
                                    383 ;	lib/stm8s_i2c.c: 285: I2C->CR1 |= I2C_CR1_NOSTRETCH;
      00978B 72 1E 52 10      [ 1]  384 	bset	0x5210, #7
      00978F 81               [ 4]  385 	ret
                                    386 ;	lib/stm8s_i2c.c: 296: void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
                                    387 ;	-----------------------------------------
                                    388 ;	 function I2C_AcknowledgeConfig
                                    389 ;	-----------------------------------------
      009790                        390 _I2C_AcknowledgeConfig:
                                    391 ;	lib/stm8s_i2c.c: 298: if (Ack == I2C_ACK_NONE)
      009790 0D 03            [ 1]  392 	tnz	(0x03, sp)
      009792 26 08            [ 1]  393 	jrne	00105$
                                    394 ;	lib/stm8s_i2c.c: 301: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      009794 AE 52 11         [ 2]  395 	ldw	x, #0x5211
      009797 F6               [ 1]  396 	ld	a, (x)
      009798 A4 FB            [ 1]  397 	and	a, #0xfb
      00979A F7               [ 1]  398 	ld	(x), a
      00979B 81               [ 4]  399 	ret
      00979C                        400 00105$:
                                    401 ;	lib/stm8s_i2c.c: 306: I2C->CR2 |= I2C_CR2_ACK;
      00979C AE 52 11         [ 2]  402 	ldw	x, #0x5211
      00979F F6               [ 1]  403 	ld	a, (x)
      0097A0 AA 04            [ 1]  404 	or	a, #0x04
      0097A2 F7               [ 1]  405 	ld	(x), a
                                    406 ;	lib/stm8s_i2c.c: 308: if (Ack == I2C_ACK_CURR)
      0097A3 7B 03            [ 1]  407 	ld	a, (0x03, sp)
      0097A5 A1 01            [ 1]  408 	cp	a, #0x01
      0097A7 26 08            [ 1]  409 	jrne	00102$
                                    410 ;	lib/stm8s_i2c.c: 311: I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
      0097A9 AE 52 11         [ 2]  411 	ldw	x, #0x5211
      0097AC F6               [ 1]  412 	ld	a, (x)
      0097AD A4 F7            [ 1]  413 	and	a, #0xf7
      0097AF F7               [ 1]  414 	ld	(x), a
      0097B0 81               [ 4]  415 	ret
      0097B1                        416 00102$:
                                    417 ;	lib/stm8s_i2c.c: 316: I2C->CR2 |= I2C_CR2_POS;
      0097B1 AE 52 11         [ 2]  418 	ldw	x, #0x5211
      0097B4 F6               [ 1]  419 	ld	a, (x)
      0097B5 AA 08            [ 1]  420 	or	a, #0x08
      0097B7 F7               [ 1]  421 	ld	(x), a
      0097B8 81               [ 4]  422 	ret
                                    423 ;	lib/stm8s_i2c.c: 329: void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
                                    424 ;	-----------------------------------------
                                    425 ;	 function I2C_ITConfig
                                    426 ;	-----------------------------------------
      0097B9                        427 _I2C_ITConfig:
      0097B9 88               [ 1]  428 	push	a
                                    429 ;	lib/stm8s_i2c.c: 331: if (NewState != DISABLE)
      0097BA 0D 05            [ 1]  430 	tnz	(0x05, sp)
      0097BC 27 0C            [ 1]  431 	jreq	00102$
                                    432 ;	lib/stm8s_i2c.c: 334: I2C->ITR |= (uint8_t)I2C_IT;
      0097BE AE 52 1A         [ 2]  433 	ldw	x, #0x521a
      0097C1 F6               [ 1]  434 	ld	a, (x)
      0097C2 1A 04            [ 1]  435 	or	a, (0x04, sp)
      0097C4 AE 52 1A         [ 2]  436 	ldw	x, #0x521a
      0097C7 F7               [ 1]  437 	ld	(x), a
      0097C8 20 0F            [ 2]  438 	jra	00104$
      0097CA                        439 00102$:
                                    440 ;	lib/stm8s_i2c.c: 339: I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
      0097CA AE 52 1A         [ 2]  441 	ldw	x, #0x521a
      0097CD F6               [ 1]  442 	ld	a, (x)
      0097CE 6B 01            [ 1]  443 	ld	(0x01, sp), a
      0097D0 7B 04            [ 1]  444 	ld	a, (0x04, sp)
      0097D2 43               [ 1]  445 	cpl	a
      0097D3 14 01            [ 1]  446 	and	a, (0x01, sp)
      0097D5 AE 52 1A         [ 2]  447 	ldw	x, #0x521a
      0097D8 F7               [ 1]  448 	ld	(x), a
      0097D9                        449 00104$:
      0097D9 84               [ 1]  450 	pop	a
      0097DA 81               [ 4]  451 	ret
                                    452 ;	lib/stm8s_i2c.c: 349: void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
                                    453 ;	-----------------------------------------
                                    454 ;	 function I2C_FastModeDutyCycleConfig
                                    455 ;	-----------------------------------------
      0097DB                        456 _I2C_FastModeDutyCycleConfig:
                                    457 ;	lib/stm8s_i2c.c: 351: if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
      0097DB 7B 03            [ 1]  458 	ld	a, (0x03, sp)
      0097DD A1 40            [ 1]  459 	cp	a, #0x40
      0097DF 26 08            [ 1]  460 	jrne	00102$
                                    461 ;	lib/stm8s_i2c.c: 354: I2C->CCRH |= I2C_CCRH_DUTY;
      0097E1 AE 52 1C         [ 2]  462 	ldw	x, #0x521c
      0097E4 F6               [ 1]  463 	ld	a, (x)
      0097E5 AA 40            [ 1]  464 	or	a, #0x40
      0097E7 F7               [ 1]  465 	ld	(x), a
      0097E8 81               [ 4]  466 	ret
      0097E9                        467 00102$:
                                    468 ;	lib/stm8s_i2c.c: 359: I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
      0097E9 AE 52 1C         [ 2]  469 	ldw	x, #0x521c
      0097EC F6               [ 1]  470 	ld	a, (x)
      0097ED A4 BF            [ 1]  471 	and	a, #0xbf
      0097EF F7               [ 1]  472 	ld	(x), a
      0097F0 81               [ 4]  473 	ret
                                    474 ;	lib/stm8s_i2c.c: 368: uint8_t I2C_ReceiveData(void)
                                    475 ;	-----------------------------------------
                                    476 ;	 function I2C_ReceiveData
                                    477 ;	-----------------------------------------
      0097F1                        478 _I2C_ReceiveData:
                                    479 ;	lib/stm8s_i2c.c: 371: return ((uint8_t)I2C->DR);
      0097F1 AE 52 16         [ 2]  480 	ldw	x, #0x5216
      0097F4 F6               [ 1]  481 	ld	a, (x)
      0097F5 81               [ 4]  482 	ret
                                    483 ;	lib/stm8s_i2c.c: 381: void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
                                    484 ;	-----------------------------------------
                                    485 ;	 function I2C_Send7bitAddress
                                    486 ;	-----------------------------------------
      0097F6                        487 _I2C_Send7bitAddress:
                                    488 ;	lib/stm8s_i2c.c: 384: Address &= (uint8_t)0xFE;
      0097F6 7B 03            [ 1]  489 	ld	a, (0x03, sp)
      0097F8 A4 FE            [ 1]  490 	and	a, #0xfe
      0097FA 6B 03            [ 1]  491 	ld	(0x03, sp), a
                                    492 ;	lib/stm8s_i2c.c: 387: I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
      0097FC 7B 03            [ 1]  493 	ld	a, (0x03, sp)
      0097FE 1A 04            [ 1]  494 	or	a, (0x04, sp)
      009800 AE 52 16         [ 2]  495 	ldw	x, #0x5216
      009803 F7               [ 1]  496 	ld	(x), a
      009804 81               [ 4]  497 	ret
                                    498 ;	lib/stm8s_i2c.c: 395: void I2C_SendData(uint8_t Data)
                                    499 ;	-----------------------------------------
                                    500 ;	 function I2C_SendData
                                    501 ;	-----------------------------------------
      009805                        502 _I2C_SendData:
                                    503 ;	lib/stm8s_i2c.c: 398: I2C->DR = Data;
      009805 AE 52 16         [ 2]  504 	ldw	x, #0x5216
      009808 7B 03            [ 1]  505 	ld	a, (0x03, sp)
      00980A F7               [ 1]  506 	ld	(x), a
      00980B 81               [ 4]  507 	ret
                                    508 ;	lib/stm8s_i2c.c: 515: ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
                                    509 ;	-----------------------------------------
                                    510 ;	 function I2C_CheckEvent
                                    511 ;	-----------------------------------------
      00980C                        512 _I2C_CheckEvent:
      00980C 52 0A            [ 2]  513 	sub	sp, #10
                                    514 ;	lib/stm8s_i2c.c: 517: __IO uint16_t lastevent = 0x00;
      00980E 5F               [ 1]  515 	clrw	x
      00980F 1F 01            [ 2]  516 	ldw	(0x01, sp), x
                                    517 ;	lib/stm8s_i2c.c: 522: if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
      009811 1E 0D            [ 2]  518 	ldw	x, (0x0d, sp)
      009813 A3 00 04         [ 2]  519 	cpw	x, #0x0004
      009816 26 0C            [ 1]  520 	jrne	00102$
                                    521 ;	lib/stm8s_i2c.c: 524: lastevent = I2C->SR2 & I2C_SR2_AF;
      009818 AE 52 18         [ 2]  522 	ldw	x, #0x5218
      00981B F6               [ 1]  523 	ld	a, (x)
      00981C A4 04            [ 1]  524 	and	a, #0x04
      00981E 5F               [ 1]  525 	clrw	x
      00981F 97               [ 1]  526 	ld	xl, a
      009820 1F 01            [ 2]  527 	ldw	(0x01, sp), x
      009822 20 1E            [ 2]  528 	jra	00103$
      009824                        529 00102$:
                                    530 ;	lib/stm8s_i2c.c: 528: flag1 = I2C->SR1;
      009824 AE 52 17         [ 2]  531 	ldw	x, #0x5217
      009827 F6               [ 1]  532 	ld	a, (x)
                                    533 ;	lib/stm8s_i2c.c: 529: flag2 = I2C->SR3;
      009828 AE 52 19         [ 2]  534 	ldw	x, #0x5219
      00982B 88               [ 1]  535 	push	a
      00982C F6               [ 1]  536 	ld	a, (x)
      00982D 97               [ 1]  537 	ld	xl, a
      00982E 84               [ 1]  538 	pop	a
                                    539 ;	lib/stm8s_i2c.c: 530: lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
      00982F 0F 05            [ 1]  540 	clr	(0x05, sp)
      009831 0F 04            [ 1]  541 	clr	(0x04, sp)
      009833 0F 07            [ 1]  542 	clr	(0x07, sp)
      009835 1A 04            [ 1]  543 	or	a, (0x04, sp)
      009837 6B 0A            [ 1]  544 	ld	(0x0a, sp), a
      009839 9F               [ 1]  545 	ld	a, xl
      00983A 1A 07            [ 1]  546 	or	a, (0x07, sp)
      00983C 6B 09            [ 1]  547 	ld	(0x09, sp), a
      00983E 16 09            [ 2]  548 	ldw	y, (0x09, sp)
      009840 17 01            [ 2]  549 	ldw	(0x01, sp), y
      009842                        550 00103$:
                                    551 ;	lib/stm8s_i2c.c: 533: if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
      009842 7B 02            [ 1]  552 	ld	a, (0x02, sp)
      009844 14 0E            [ 1]  553 	and	a, (0x0e, sp)
      009846 97               [ 1]  554 	ld	xl, a
      009847 7B 01            [ 1]  555 	ld	a, (0x01, sp)
      009849 14 0D            [ 1]  556 	and	a, (0x0d, sp)
      00984B 95               [ 1]  557 	ld	xh, a
      00984C 13 0D            [ 2]  558 	cpw	x, (0x0d, sp)
      00984E 26 03            [ 1]  559 	jrne	00105$
                                    560 ;	lib/stm8s_i2c.c: 536: status = SUCCESS;
      009850 A6 01            [ 1]  561 	ld	a, #0x01
                                    562 ;	lib/stm8s_i2c.c: 541: status = ERROR;
      009852 21                     563 	.byte 0x21
      009853                        564 00105$:
      009853 4F               [ 1]  565 	clr	a
      009854                        566 00106$:
                                    567 ;	lib/stm8s_i2c.c: 545: return status;
      009854 5B 0A            [ 2]  568 	addw	sp, #10
      009856 81               [ 4]  569 	ret
                                    570 ;	lib/stm8s_i2c.c: 562: I2C_Event_TypeDef I2C_GetLastEvent(void)
                                    571 ;	-----------------------------------------
                                    572 ;	 function I2C_GetLastEvent
                                    573 ;	-----------------------------------------
      009857                        574 _I2C_GetLastEvent:
      009857 52 04            [ 2]  575 	sub	sp, #4
                                    576 ;	lib/stm8s_i2c.c: 564: __IO uint16_t lastevent = 0;
      009859 5F               [ 1]  577 	clrw	x
      00985A 1F 03            [ 2]  578 	ldw	(0x03, sp), x
                                    579 ;	lib/stm8s_i2c.c: 568: if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
      00985C AE 52 18         [ 2]  580 	ldw	x, #0x5218
      00985F F6               [ 1]  581 	ld	a, (x)
      009860 A5 04            [ 1]  582 	bcp	a, #0x04
      009862 27 07            [ 1]  583 	jreq	00102$
                                    584 ;	lib/stm8s_i2c.c: 570: lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
      009864 AE 00 04         [ 2]  585 	ldw	x, #0x0004
      009867 1F 03            [ 2]  586 	ldw	(0x03, sp), x
      009869 20 17            [ 2]  587 	jra	00103$
      00986B                        588 00102$:
                                    589 ;	lib/stm8s_i2c.c: 575: flag1 = I2C->SR1;
      00986B AE 52 17         [ 2]  590 	ldw	x, #0x5217
      00986E F6               [ 1]  591 	ld	a, (x)
      00986F 5F               [ 1]  592 	clrw	x
      009870 97               [ 1]  593 	ld	xl, a
      009871 1F 01            [ 2]  594 	ldw	(0x01, sp), x
                                    595 ;	lib/stm8s_i2c.c: 576: flag2 = I2C->SR3;
      009873 AE 52 19         [ 2]  596 	ldw	x, #0x5219
      009876 F6               [ 1]  597 	ld	a, (x)
      009877 95               [ 1]  598 	ld	xh, a
      009878 4F               [ 1]  599 	clr	a
                                    600 ;	lib/stm8s_i2c.c: 579: lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
      009879 4F               [ 1]  601 	clr	a
      00987A 1A 02            [ 1]  602 	or	a, (0x02, sp)
      00987C 02               [ 1]  603 	rlwa	x
      00987D 1A 01            [ 1]  604 	or	a, (0x01, sp)
      00987F 95               [ 1]  605 	ld	xh, a
      009880 1F 03            [ 2]  606 	ldw	(0x03, sp), x
      009882                        607 00103$:
                                    608 ;	lib/stm8s_i2c.c: 582: return (I2C_Event_TypeDef)lastevent;
      009882 1E 03            [ 2]  609 	ldw	x, (0x03, sp)
      009884 5B 04            [ 2]  610 	addw	sp, #4
      009886 81               [ 4]  611 	ret
                                    612 ;	lib/stm8s_i2c.c: 613: FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
                                    613 ;	-----------------------------------------
                                    614 ;	 function I2C_GetFlagStatus
                                    615 ;	-----------------------------------------
      009887                        616 _I2C_GetFlagStatus:
      009887 89               [ 2]  617 	pushw	x
                                    618 ;	lib/stm8s_i2c.c: 615: uint8_t tempreg = 0;
      009888 4F               [ 1]  619 	clr	a
      009889 97               [ 1]  620 	ld	xl, a
                                    621 ;	lib/stm8s_i2c.c: 619: regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
      00988A 7B 05            [ 1]  622 	ld	a, (0x05, sp)
      00988C 0F 01            [ 1]  623 	clr	(0x01, sp)
                                    624 ;	lib/stm8s_i2c.c: 621: switch (regindex)
      00988E A1 01            [ 1]  625 	cp	a, #0x01
      009890 27 0A            [ 1]  626 	jreq	00101$
      009892 A1 02            [ 1]  627 	cp	a, #0x02
      009894 27 0D            [ 1]  628 	jreq	00102$
      009896 A1 03            [ 1]  629 	cp	a, #0x03
      009898 27 10            [ 1]  630 	jreq	00103$
      00989A 20 13            [ 2]  631 	jra	00105$
                                    632 ;	lib/stm8s_i2c.c: 624: case 0x01:
      00989C                        633 00101$:
                                    634 ;	lib/stm8s_i2c.c: 625: tempreg = (uint8_t)I2C->SR1;
      00989C AE 52 17         [ 2]  635 	ldw	x, #0x5217
      00989F F6               [ 1]  636 	ld	a, (x)
      0098A0 97               [ 1]  637 	ld	xl, a
                                    638 ;	lib/stm8s_i2c.c: 626: break;
      0098A1 20 0C            [ 2]  639 	jra	00105$
                                    640 ;	lib/stm8s_i2c.c: 629: case 0x02:
      0098A3                        641 00102$:
                                    642 ;	lib/stm8s_i2c.c: 630: tempreg = (uint8_t)I2C->SR2;
      0098A3 AE 52 18         [ 2]  643 	ldw	x, #0x5218
      0098A6 F6               [ 1]  644 	ld	a, (x)
      0098A7 97               [ 1]  645 	ld	xl, a
                                    646 ;	lib/stm8s_i2c.c: 631: break;
      0098A8 20 05            [ 2]  647 	jra	00105$
                                    648 ;	lib/stm8s_i2c.c: 634: case 0x03:
      0098AA                        649 00103$:
                                    650 ;	lib/stm8s_i2c.c: 635: tempreg = (uint8_t)I2C->SR3;
      0098AA AE 52 19         [ 2]  651 	ldw	x, #0x5219
      0098AD F6               [ 1]  652 	ld	a, (x)
      0098AE 97               [ 1]  653 	ld	xl, a
                                    654 ;	lib/stm8s_i2c.c: 640: }
      0098AF                        655 00105$:
                                    656 ;	lib/stm8s_i2c.c: 643: if ((tempreg & (uint8_t)I2C_Flag ) != 0)
      0098AF 7B 06            [ 1]  657 	ld	a, (0x06, sp)
      0098B1 89               [ 2]  658 	pushw	x
      0098B2 14 02            [ 1]  659 	and	a, (2, sp)
      0098B4 85               [ 2]  660 	popw	x
      0098B5 4D               [ 1]  661 	tnz	a
      0098B6 27 03            [ 1]  662 	jreq	00107$
                                    663 ;	lib/stm8s_i2c.c: 646: bitstatus = SET;
      0098B8 A6 01            [ 1]  664 	ld	a, #0x01
                                    665 ;	lib/stm8s_i2c.c: 651: bitstatus = RESET;
      0098BA 21                     666 	.byte 0x21
      0098BB                        667 00107$:
      0098BB 4F               [ 1]  668 	clr	a
      0098BC                        669 00108$:
                                    670 ;	lib/stm8s_i2c.c: 654: return bitstatus;
      0098BC 85               [ 2]  671 	popw	x
      0098BD 81               [ 4]  672 	ret
                                    673 ;	lib/stm8s_i2c.c: 689: void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
                                    674 ;	-----------------------------------------
                                    675 ;	 function I2C_ClearFlag
                                    676 ;	-----------------------------------------
      0098BE                        677 _I2C_ClearFlag:
                                    678 ;	lib/stm8s_i2c.c: 694: flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
      0098BE 7B 04            [ 1]  679 	ld	a, (0x04, sp)
      0098C0 97               [ 1]  680 	ld	xl, a
      0098C1 4F               [ 1]  681 	clr	a
                                    682 ;	lib/stm8s_i2c.c: 696: I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
      0098C2 95               [ 1]  683 	ld	xh, a
      0098C3 53               [ 2]  684 	cplw	x
      0098C4 9F               [ 1]  685 	ld	a, xl
      0098C5 AE 52 18         [ 2]  686 	ldw	x, #0x5218
      0098C8 F7               [ 1]  687 	ld	(x), a
      0098C9 81               [ 4]  688 	ret
                                    689 ;	lib/stm8s_i2c.c: 719: ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    690 ;	-----------------------------------------
                                    691 ;	 function I2C_GetITStatus
                                    692 ;	-----------------------------------------
      0098CA                        693 _I2C_GetITStatus:
      0098CA 89               [ 2]  694 	pushw	x
                                    695 ;	lib/stm8s_i2c.c: 722: __IO uint8_t enablestatus = 0;
      0098CB 0F 01            [ 1]  696 	clr	(0x01, sp)
                                    697 ;	lib/stm8s_i2c.c: 725: tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
      0098CD 4F               [ 1]  698 	clr	a
      0098CE 7B 05            [ 1]  699 	ld	a, (0x05, sp)
      0098D0 A4 07            [ 1]  700 	and	a, #0x07
      0098D2 97               [ 1]  701 	ld	xl, a
      0098D3 4F               [ 1]  702 	clr	a
      0098D4 4F               [ 1]  703 	clr	a
      0098D5 95               [ 1]  704 	ld	xh, a
                                    705 ;	lib/stm8s_i2c.c: 728: enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
      0098D6 90 AE 52 1A      [ 2]  706 	ldw	y, #0x521a
      0098DA 90 F6            [ 1]  707 	ld	a, (y)
      0098DC 89               [ 2]  708 	pushw	x
      0098DD 14 02            [ 1]  709 	and	a, (2, sp)
      0098DF 85               [ 2]  710 	popw	x
      0098E0 6B 01            [ 1]  711 	ld	(0x01, sp), a
                                    712 ;	lib/stm8s_i2c.c: 730: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      0098E2 4F               [ 1]  713 	clr	a
      0098E3 97               [ 1]  714 	ld	xl, a
      0098E4 7B 05            [ 1]  715 	ld	a, (0x05, sp)
      0098E6 A4 30            [ 1]  716 	and	a, #0x30
      0098E8 95               [ 1]  717 	ld	xh, a
                                    718 ;	lib/stm8s_i2c.c: 733: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      0098E9 7B 06            [ 1]  719 	ld	a, (0x06, sp)
      0098EB 6B 02            [ 1]  720 	ld	(0x02, sp), a
                                    721 ;	lib/stm8s_i2c.c: 730: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      0098ED A3 01 00         [ 2]  722 	cpw	x, #0x0100
      0098F0 26 14            [ 1]  723 	jrne	00110$
                                    724 ;	lib/stm8s_i2c.c: 733: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      0098F2 AE 52 17         [ 2]  725 	ldw	x, #0x5217
      0098F5 F6               [ 1]  726 	ld	a, (x)
      0098F6 14 02            [ 1]  727 	and	a, (0x02, sp)
      0098F8 4D               [ 1]  728 	tnz	a
      0098F9 27 08            [ 1]  729 	jreq	00102$
      0098FB 0D 01            [ 1]  730 	tnz	(0x01, sp)
      0098FD 27 04            [ 1]  731 	jreq	00102$
                                    732 ;	lib/stm8s_i2c.c: 736: bitstatus = SET;
      0098FF A6 01            [ 1]  733 	ld	a, #0x01
      009901 20 14            [ 2]  734 	jra	00111$
      009903                        735 00102$:
                                    736 ;	lib/stm8s_i2c.c: 741: bitstatus = RESET;
      009903 4F               [ 1]  737 	clr	a
      009904 20 11            [ 2]  738 	jra	00111$
      009906                        739 00110$:
                                    740 ;	lib/stm8s_i2c.c: 747: if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      009906 AE 52 18         [ 2]  741 	ldw	x, #0x5218
      009909 F6               [ 1]  742 	ld	a, (x)
      00990A 14 02            [ 1]  743 	and	a, (0x02, sp)
      00990C 4D               [ 1]  744 	tnz	a
      00990D 27 07            [ 1]  745 	jreq	00106$
      00990F 0D 01            [ 1]  746 	tnz	(0x01, sp)
      009911 27 03            [ 1]  747 	jreq	00106$
                                    748 ;	lib/stm8s_i2c.c: 750: bitstatus = SET;
      009913 A6 01            [ 1]  749 	ld	a, #0x01
                                    750 ;	lib/stm8s_i2c.c: 755: bitstatus = RESET;
      009915 21                     751 	.byte 0x21
      009916                        752 00106$:
      009916 4F               [ 1]  753 	clr	a
      009917                        754 00111$:
                                    755 ;	lib/stm8s_i2c.c: 759: return  bitstatus;
      009917 85               [ 2]  756 	popw	x
      009918 81               [ 4]  757 	ret
                                    758 ;	lib/stm8s_i2c.c: 797: void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    759 ;	-----------------------------------------
                                    760 ;	 function I2C_ClearITPendingBit
                                    761 ;	-----------------------------------------
      009919                        762 _I2C_ClearITPendingBit:
                                    763 ;	lib/stm8s_i2c.c: 802: flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
      009919 7B 04            [ 1]  764 	ld	a, (0x04, sp)
      00991B 97               [ 1]  765 	ld	xl, a
      00991C 4F               [ 1]  766 	clr	a
                                    767 ;	lib/stm8s_i2c.c: 805: I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
      00991D 95               [ 1]  768 	ld	xh, a
      00991E 53               [ 2]  769 	cplw	x
      00991F 9F               [ 1]  770 	ld	a, xl
      009920 AE 52 18         [ 2]  771 	ldw	x, #0x5218
      009923 F7               [ 1]  772 	ld	(x), a
      009924 81               [ 4]  773 	ret
                                    774 	.area CODE
                                    775 	.area INITIALIZER
                                    776 	.area CABS (ABS)
