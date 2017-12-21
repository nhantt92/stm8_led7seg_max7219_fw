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
      0091BF                         63 _I2C_DeInit:
                                     64 ;	lib/stm8s_i2c.c: 43: I2C->CR1 = I2C_CR1_RESET_VALUE;
      0091BF 35 00 52 10      [ 1]   65 	mov	0x5210+0, #0x00
                                     66 ;	lib/stm8s_i2c.c: 44: I2C->CR2 = I2C_CR2_RESET_VALUE;
      0091C3 35 00 52 11      [ 1]   67 	mov	0x5211+0, #0x00
                                     68 ;	lib/stm8s_i2c.c: 45: I2C->FREQR = I2C_FREQR_RESET_VALUE;
      0091C7 35 00 52 12      [ 1]   69 	mov	0x5212+0, #0x00
                                     70 ;	lib/stm8s_i2c.c: 46: I2C->OARL = I2C_OARL_RESET_VALUE;
      0091CB 35 00 52 13      [ 1]   71 	mov	0x5213+0, #0x00
                                     72 ;	lib/stm8s_i2c.c: 47: I2C->OARH = I2C_OARH_RESET_VALUE;
      0091CF 35 00 52 14      [ 1]   73 	mov	0x5214+0, #0x00
                                     74 ;	lib/stm8s_i2c.c: 48: I2C->ITR = I2C_ITR_RESET_VALUE;
      0091D3 35 00 52 1A      [ 1]   75 	mov	0x521a+0, #0x00
                                     76 ;	lib/stm8s_i2c.c: 49: I2C->CCRL = I2C_CCRL_RESET_VALUE;
      0091D7 35 00 52 1B      [ 1]   77 	mov	0x521b+0, #0x00
                                     78 ;	lib/stm8s_i2c.c: 50: I2C->CCRH = I2C_CCRH_RESET_VALUE;
      0091DB 35 00 52 1C      [ 1]   79 	mov	0x521c+0, #0x00
                                     80 ;	lib/stm8s_i2c.c: 51: I2C->TRISER = I2C_TRISER_RESET_VALUE;
      0091DF 35 02 52 1D      [ 1]   81 	mov	0x521d+0, #0x02
      0091E3 81               [ 4]   82 	ret
                                     83 ;	lib/stm8s_i2c.c: 70: void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
                                     84 ;	-----------------------------------------
                                     85 ;	 function I2C_Init
                                     86 ;	-----------------------------------------
      0091E4                         87 _I2C_Init:
      0091E4 52 0A            [ 2]   88 	sub	sp, #10
                                     89 ;	lib/stm8s_i2c.c: 76: uint8_t tmpccrh = 0;
      0091E6 0F 01            [ 1]   90 	clr	(0x01, sp)
                                     91 ;	lib/stm8s_i2c.c: 82: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
      0091E8 AE 52 12         [ 2]   92 	ldw	x, #0x5212
      0091EB F6               [ 1]   93 	ld	a, (x)
      0091EC A4 C0            [ 1]   94 	and	a, #0xc0
      0091EE F7               [ 1]   95 	ld	(x), a
                                     96 ;	lib/stm8s_i2c.c: 84: I2C->FREQR |= InputClockFrequencyMHz;
      0091EF AE 52 12         [ 2]   97 	ldw	x, #0x5212
      0091F2 F6               [ 1]   98 	ld	a, (x)
      0091F3 1A 16            [ 1]   99 	or	a, (0x16, sp)
      0091F5 AE 52 12         [ 2]  100 	ldw	x, #0x5212
      0091F8 F7               [ 1]  101 	ld	(x), a
                                    102 ;	lib/stm8s_i2c.c: 88: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      0091F9 72 11 52 10      [ 1]  103 	bres	0x5210, #0
                                    104 ;	lib/stm8s_i2c.c: 91: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
      0091FD AE 52 1C         [ 2]  105 	ldw	x, #0x521c
      009200 F6               [ 1]  106 	ld	a, (x)
      009201 A4 30            [ 1]  107 	and	a, #0x30
      009203 F7               [ 1]  108 	ld	(x), a
                                    109 ;	lib/stm8s_i2c.c: 92: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
      009204 AE 52 1B         [ 2]  110 	ldw	x, #0x521b
      009207 F6               [ 1]  111 	ld	a, (x)
      009208 35 00 52 1B      [ 1]  112 	mov	0x521b+0, #0x00
                                    113 ;	lib/stm8s_i2c.c: 103: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      00920C 5F               [ 1]  114 	clrw	x
      00920D 7B 16            [ 1]  115 	ld	a, (0x16, sp)
      00920F 97               [ 1]  116 	ld	xl, a
      009210 90 5F            [ 1]  117 	clrw	y
      009212 89               [ 2]  118 	pushw	x
      009213 90 89            [ 2]  119 	pushw	y
      009215 4B 40            [ 1]  120 	push	#0x40
      009217 4B 42            [ 1]  121 	push	#0x42
      009219 4B 0F            [ 1]  122 	push	#0x0f
      00921B 4B 00            [ 1]  123 	push	#0x00
      00921D CD 97 76         [ 4]  124 	call	__mullong
      009220 5B 08            [ 2]  125 	addw	sp, #8
      009222 1F 09            [ 2]  126 	ldw	(0x09, sp), x
      009224 17 07            [ 2]  127 	ldw	(0x07, sp), y
                                    128 ;	lib/stm8s_i2c.c: 95: if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
      009226 AE 86 A0         [ 2]  129 	ldw	x, #0x86a0
      009229 13 0F            [ 2]  130 	cpw	x, (0x0f, sp)
      00922B A6 01            [ 1]  131 	ld	a, #0x01
      00922D 12 0E            [ 1]  132 	sbc	a, (0x0e, sp)
      00922F 4F               [ 1]  133 	clr	a
      009230 12 0D            [ 1]  134 	sbc	a, (0x0d, sp)
      009232 24 77            [ 1]  135 	jrnc	00109$
                                    136 ;	lib/stm8s_i2c.c: 98: tmpccrh = I2C_CCRH_FS;
      009234 A6 80            [ 1]  137 	ld	a, #0x80
      009236 6B 01            [ 1]  138 	ld	(0x01, sp), a
                                    139 ;	lib/stm8s_i2c.c: 100: if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
      009238 0D 13            [ 1]  140 	tnz	(0x13, sp)
      00923A 26 23            [ 1]  141 	jrne	00102$
                                    142 ;	lib/stm8s_i2c.c: 103: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      00923C 1E 0F            [ 2]  143 	ldw	x, (0x0f, sp)
      00923E 89               [ 2]  144 	pushw	x
      00923F 1E 0F            [ 2]  145 	ldw	x, (0x0f, sp)
      009241 89               [ 2]  146 	pushw	x
      009242 4B 03            [ 1]  147 	push	#0x03
      009244 5F               [ 1]  148 	clrw	x
      009245 89               [ 2]  149 	pushw	x
      009246 4B 00            [ 1]  150 	push	#0x00
      009248 CD 97 76         [ 4]  151 	call	__mullong
      00924B 5B 08            [ 2]  152 	addw	sp, #8
      00924D 89               [ 2]  153 	pushw	x
      00924E 90 89            [ 2]  154 	pushw	y
      009250 1E 0D            [ 2]  155 	ldw	x, (0x0d, sp)
      009252 89               [ 2]  156 	pushw	x
      009253 1E 0D            [ 2]  157 	ldw	x, (0x0d, sp)
      009255 89               [ 2]  158 	pushw	x
      009256 CD 96 FB         [ 4]  159 	call	__divulong
      009259 5B 08            [ 2]  160 	addw	sp, #8
      00925B 1F 02            [ 2]  161 	ldw	(0x02, sp), x
      00925D 20 28            [ 2]  162 	jra	00103$
      00925F                        163 00102$:
                                    164 ;	lib/stm8s_i2c.c: 108: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
      00925F 1E 0F            [ 2]  165 	ldw	x, (0x0f, sp)
      009261 89               [ 2]  166 	pushw	x
      009262 1E 0F            [ 2]  167 	ldw	x, (0x0f, sp)
      009264 89               [ 2]  168 	pushw	x
      009265 4B 19            [ 1]  169 	push	#0x19
      009267 5F               [ 1]  170 	clrw	x
      009268 89               [ 2]  171 	pushw	x
      009269 4B 00            [ 1]  172 	push	#0x00
      00926B CD 97 76         [ 4]  173 	call	__mullong
      00926E 5B 08            [ 2]  174 	addw	sp, #8
      009270 9F               [ 1]  175 	ld	a, xl
      009271 88               [ 1]  176 	push	a
      009272 9E               [ 1]  177 	ld	a, xh
      009273 88               [ 1]  178 	push	a
      009274 90 89            [ 2]  179 	pushw	y
      009276 1E 0D            [ 2]  180 	ldw	x, (0x0d, sp)
      009278 89               [ 2]  181 	pushw	x
      009279 1E 0D            [ 2]  182 	ldw	x, (0x0d, sp)
      00927B 89               [ 2]  183 	pushw	x
      00927C CD 96 FB         [ 4]  184 	call	__divulong
      00927F 5B 08            [ 2]  185 	addw	sp, #8
      009281 1F 02            [ 2]  186 	ldw	(0x02, sp), x
                                    187 ;	lib/stm8s_i2c.c: 110: tmpccrh |= I2C_CCRH_DUTY;
      009283 A6 C0            [ 1]  188 	ld	a, #0xc0
      009285 6B 01            [ 1]  189 	ld	(0x01, sp), a
      009287                        190 00103$:
                                    191 ;	lib/stm8s_i2c.c: 114: if (result < (uint16_t)0x01)
      009287 1E 02            [ 2]  192 	ldw	x, (0x02, sp)
      009289 A3 00 01         [ 2]  193 	cpw	x, #0x0001
      00928C 24 05            [ 1]  194 	jrnc	00105$
                                    195 ;	lib/stm8s_i2c.c: 117: result = (uint16_t)0x0001;
      00928E AE 00 01         [ 2]  196 	ldw	x, #0x0001
      009291 1F 02            [ 2]  197 	ldw	(0x02, sp), x
      009293                        198 00105$:
                                    199 ;	lib/stm8s_i2c.c: 123: tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
      009293 7B 16            [ 1]  200 	ld	a, (0x16, sp)
      009295 97               [ 1]  201 	ld	xl, a
      009296 A6 03            [ 1]  202 	ld	a, #0x03
      009298 42               [ 4]  203 	mul	x, a
      009299 4B 0A            [ 1]  204 	push	#0x0a
      00929B 4B 00            [ 1]  205 	push	#0x00
      00929D 89               [ 2]  206 	pushw	x
      00929E CD 97 F2         [ 4]  207 	call	__divsint
      0092A1 5B 04            [ 2]  208 	addw	sp, #4
      0092A3 5C               [ 2]  209 	incw	x
      0092A4 9F               [ 1]  210 	ld	a, xl
                                    211 ;	lib/stm8s_i2c.c: 124: I2C->TRISER = (uint8_t)tmpval;
      0092A5 AE 52 1D         [ 2]  212 	ldw	x, #0x521d
      0092A8 F7               [ 1]  213 	ld	(x), a
      0092A9 20 2A            [ 2]  214 	jra	00110$
      0092AB                        215 00109$:
                                    216 ;	lib/stm8s_i2c.c: 131: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
      0092AB 1E 0F            [ 2]  217 	ldw	x, (0x0f, sp)
      0092AD 16 0D            [ 2]  218 	ldw	y, (0x0d, sp)
      0092AF 58               [ 2]  219 	sllw	x
      0092B0 90 59            [ 2]  220 	rlcw	y
      0092B2 89               [ 2]  221 	pushw	x
      0092B3 90 89            [ 2]  222 	pushw	y
      0092B5 1E 0D            [ 2]  223 	ldw	x, (0x0d, sp)
      0092B7 89               [ 2]  224 	pushw	x
      0092B8 1E 0D            [ 2]  225 	ldw	x, (0x0d, sp)
      0092BA 89               [ 2]  226 	pushw	x
      0092BB CD 96 FB         [ 4]  227 	call	__divulong
      0092BE 5B 08            [ 2]  228 	addw	sp, #8
      0092C0 1F 02            [ 2]  229 	ldw	(0x02, sp), x
                                    230 ;	lib/stm8s_i2c.c: 134: if (result < (uint16_t)0x0004)
      0092C2 1E 02            [ 2]  231 	ldw	x, (0x02, sp)
      0092C4 A3 00 04         [ 2]  232 	cpw	x, #0x0004
      0092C7 24 05            [ 1]  233 	jrnc	00107$
                                    234 ;	lib/stm8s_i2c.c: 137: result = (uint16_t)0x0004;
      0092C9 AE 00 04         [ 2]  235 	ldw	x, #0x0004
      0092CC 1F 02            [ 2]  236 	ldw	(0x02, sp), x
      0092CE                        237 00107$:
                                    238 ;	lib/stm8s_i2c.c: 143: I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
      0092CE 7B 16            [ 1]  239 	ld	a, (0x16, sp)
      0092D0 4C               [ 1]  240 	inc	a
      0092D1 AE 52 1D         [ 2]  241 	ldw	x, #0x521d
      0092D4 F7               [ 1]  242 	ld	(x), a
      0092D5                        243 00110$:
                                    244 ;	lib/stm8s_i2c.c: 148: I2C->CCRL = (uint8_t)result;
      0092D5 7B 03            [ 1]  245 	ld	a, (0x03, sp)
      0092D7 AE 52 1B         [ 2]  246 	ldw	x, #0x521b
      0092DA F7               [ 1]  247 	ld	(x), a
                                    248 ;	lib/stm8s_i2c.c: 149: I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
      0092DB 7B 02            [ 1]  249 	ld	a, (0x02, sp)
      0092DD 0F 05            [ 1]  250 	clr	(0x05, sp)
      0092DF A4 0F            [ 1]  251 	and	a, #0x0f
      0092E1 1A 01            [ 1]  252 	or	a, (0x01, sp)
      0092E3 AE 52 1C         [ 2]  253 	ldw	x, #0x521c
      0092E6 F7               [ 1]  254 	ld	(x), a
                                    255 ;	lib/stm8s_i2c.c: 152: I2C->CR1 |= I2C_CR1_PE;
      0092E7 72 10 52 10      [ 1]  256 	bset	0x5210, #0
                                    257 ;	lib/stm8s_i2c.c: 155: I2C_AcknowledgeConfig(Ack);
      0092EB 7B 14            [ 1]  258 	ld	a, (0x14, sp)
      0092ED 88               [ 1]  259 	push	a
      0092EE CD 93 72         [ 4]  260 	call	_I2C_AcknowledgeConfig
      0092F1 84               [ 1]  261 	pop	a
                                    262 ;	lib/stm8s_i2c.c: 158: I2C->OARL = (uint8_t)(OwnAddress);
      0092F2 7B 12            [ 1]  263 	ld	a, (0x12, sp)
      0092F4 AE 52 13         [ 2]  264 	ldw	x, #0x5213
      0092F7 F7               [ 1]  265 	ld	(x), a
                                    266 ;	lib/stm8s_i2c.c: 159: I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
      0092F8 7B 15            [ 1]  267 	ld	a, (0x15, sp)
      0092FA AA 40            [ 1]  268 	or	a, #0x40
      0092FC 6B 04            [ 1]  269 	ld	(0x04, sp), a
                                    270 ;	lib/stm8s_i2c.c: 160: (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
      0092FE 4F               [ 1]  271 	clr	a
      0092FF 97               [ 1]  272 	ld	xl, a
      009300 7B 11            [ 1]  273 	ld	a, (0x11, sp)
      009302 A4 03            [ 1]  274 	and	a, #0x03
      009304 95               [ 1]  275 	ld	xh, a
      009305 A6 80            [ 1]  276 	ld	a, #0x80
      009307 62               [ 2]  277 	div	x, a
      009308 9F               [ 1]  278 	ld	a, xl
      009309 1A 04            [ 1]  279 	or	a, (0x04, sp)
      00930B AE 52 14         [ 2]  280 	ldw	x, #0x5214
      00930E F7               [ 1]  281 	ld	(x), a
      00930F 5B 0A            [ 2]  282 	addw	sp, #10
      009311 81               [ 4]  283 	ret
                                    284 ;	lib/stm8s_i2c.c: 169: void I2C_Cmd(FunctionalState NewState)
                                    285 ;	-----------------------------------------
                                    286 ;	 function I2C_Cmd
                                    287 ;	-----------------------------------------
      009312                        288 _I2C_Cmd:
                                    289 ;	lib/stm8s_i2c.c: 171: if (NewState != DISABLE)
      009312 0D 03            [ 1]  290 	tnz	(0x03, sp)
      009314 27 05            [ 1]  291 	jreq	00102$
                                    292 ;	lib/stm8s_i2c.c: 174: I2C->CR1 |= I2C_CR1_PE;
      009316 72 10 52 10      [ 1]  293 	bset	0x5210, #0
      00931A 81               [ 4]  294 	ret
      00931B                        295 00102$:
                                    296 ;	lib/stm8s_i2c.c: 179: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      00931B 72 11 52 10      [ 1]  297 	bres	0x5210, #0
      00931F 81               [ 4]  298 	ret
                                    299 ;	lib/stm8s_i2c.c: 189: void I2C_GeneralCallCmd(FunctionalState NewState)
                                    300 ;	-----------------------------------------
                                    301 ;	 function I2C_GeneralCallCmd
                                    302 ;	-----------------------------------------
      009320                        303 _I2C_GeneralCallCmd:
                                    304 ;	lib/stm8s_i2c.c: 191: if (NewState != DISABLE)
      009320 0D 03            [ 1]  305 	tnz	(0x03, sp)
      009322 27 08            [ 1]  306 	jreq	00102$
                                    307 ;	lib/stm8s_i2c.c: 194: I2C->CR1 |= I2C_CR1_ENGC;
      009324 AE 52 10         [ 2]  308 	ldw	x, #0x5210
      009327 F6               [ 1]  309 	ld	a, (x)
      009328 AA 40            [ 1]  310 	or	a, #0x40
      00932A F7               [ 1]  311 	ld	(x), a
      00932B 81               [ 4]  312 	ret
      00932C                        313 00102$:
                                    314 ;	lib/stm8s_i2c.c: 199: I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
      00932C AE 52 10         [ 2]  315 	ldw	x, #0x5210
      00932F F6               [ 1]  316 	ld	a, (x)
      009330 A4 BF            [ 1]  317 	and	a, #0xbf
      009332 F7               [ 1]  318 	ld	(x), a
      009333 81               [ 4]  319 	ret
                                    320 ;	lib/stm8s_i2c.c: 211: void I2C_GenerateSTART(FunctionalState NewState)
                                    321 ;	-----------------------------------------
                                    322 ;	 function I2C_GenerateSTART
                                    323 ;	-----------------------------------------
      009334                        324 _I2C_GenerateSTART:
                                    325 ;	lib/stm8s_i2c.c: 214: if (NewState != DISABLE)
      009334 0D 03            [ 1]  326 	tnz	(0x03, sp)
      009336 27 05            [ 1]  327 	jreq	00102$
                                    328 ;	lib/stm8s_i2c.c: 217: I2C->CR2 |= I2C_CR2_START;
      009338 72 10 52 11      [ 1]  329 	bset	0x5211, #0
      00933C 81               [ 4]  330 	ret
      00933D                        331 00102$:
                                    332 ;	lib/stm8s_i2c.c: 222: I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
      00933D 72 11 52 11      [ 1]  333 	bres	0x5211, #0
      009341 81               [ 4]  334 	ret
                                    335 ;	lib/stm8s_i2c.c: 232: void I2C_GenerateSTOP(FunctionalState NewState)
                                    336 ;	-----------------------------------------
                                    337 ;	 function I2C_GenerateSTOP
                                    338 ;	-----------------------------------------
      009342                        339 _I2C_GenerateSTOP:
                                    340 ;	lib/stm8s_i2c.c: 234: if (NewState != DISABLE)
      009342 0D 03            [ 1]  341 	tnz	(0x03, sp)
      009344 27 08            [ 1]  342 	jreq	00102$
                                    343 ;	lib/stm8s_i2c.c: 237: I2C->CR2 |= I2C_CR2_STOP;
      009346 AE 52 11         [ 2]  344 	ldw	x, #0x5211
      009349 F6               [ 1]  345 	ld	a, (x)
      00934A AA 02            [ 1]  346 	or	a, #0x02
      00934C F7               [ 1]  347 	ld	(x), a
      00934D 81               [ 4]  348 	ret
      00934E                        349 00102$:
                                    350 ;	lib/stm8s_i2c.c: 242: I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
      00934E AE 52 11         [ 2]  351 	ldw	x, #0x5211
      009351 F6               [ 1]  352 	ld	a, (x)
      009352 A4 FD            [ 1]  353 	and	a, #0xfd
      009354 F7               [ 1]  354 	ld	(x), a
      009355 81               [ 4]  355 	ret
                                    356 ;	lib/stm8s_i2c.c: 252: void I2C_SoftwareResetCmd(FunctionalState NewState)
                                    357 ;	-----------------------------------------
                                    358 ;	 function I2C_SoftwareResetCmd
                                    359 ;	-----------------------------------------
      009356                        360 _I2C_SoftwareResetCmd:
                                    361 ;	lib/stm8s_i2c.c: 255: if (NewState != DISABLE)
      009356 0D 03            [ 1]  362 	tnz	(0x03, sp)
      009358 27 05            [ 1]  363 	jreq	00102$
                                    364 ;	lib/stm8s_i2c.c: 258: I2C->CR2 |= I2C_CR2_SWRST;
      00935A 72 1E 52 11      [ 1]  365 	bset	0x5211, #7
      00935E 81               [ 4]  366 	ret
      00935F                        367 00102$:
                                    368 ;	lib/stm8s_i2c.c: 263: I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
      00935F 72 1F 52 11      [ 1]  369 	bres	0x5211, #7
      009363 81               [ 4]  370 	ret
                                    371 ;	lib/stm8s_i2c.c: 274: void I2C_StretchClockCmd(FunctionalState NewState)
                                    372 ;	-----------------------------------------
                                    373 ;	 function I2C_StretchClockCmd
                                    374 ;	-----------------------------------------
      009364                        375 _I2C_StretchClockCmd:
                                    376 ;	lib/stm8s_i2c.c: 276: if (NewState != DISABLE)
      009364 0D 03            [ 1]  377 	tnz	(0x03, sp)
      009366 27 05            [ 1]  378 	jreq	00102$
                                    379 ;	lib/stm8s_i2c.c: 279: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
      009368 72 1F 52 10      [ 1]  380 	bres	0x5210, #7
      00936C 81               [ 4]  381 	ret
      00936D                        382 00102$:
                                    383 ;	lib/stm8s_i2c.c: 285: I2C->CR1 |= I2C_CR1_NOSTRETCH;
      00936D 72 1E 52 10      [ 1]  384 	bset	0x5210, #7
      009371 81               [ 4]  385 	ret
                                    386 ;	lib/stm8s_i2c.c: 296: void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
                                    387 ;	-----------------------------------------
                                    388 ;	 function I2C_AcknowledgeConfig
                                    389 ;	-----------------------------------------
      009372                        390 _I2C_AcknowledgeConfig:
                                    391 ;	lib/stm8s_i2c.c: 298: if (Ack == I2C_ACK_NONE)
      009372 0D 03            [ 1]  392 	tnz	(0x03, sp)
      009374 26 08            [ 1]  393 	jrne	00105$
                                    394 ;	lib/stm8s_i2c.c: 301: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      009376 AE 52 11         [ 2]  395 	ldw	x, #0x5211
      009379 F6               [ 1]  396 	ld	a, (x)
      00937A A4 FB            [ 1]  397 	and	a, #0xfb
      00937C F7               [ 1]  398 	ld	(x), a
      00937D 81               [ 4]  399 	ret
      00937E                        400 00105$:
                                    401 ;	lib/stm8s_i2c.c: 306: I2C->CR2 |= I2C_CR2_ACK;
      00937E AE 52 11         [ 2]  402 	ldw	x, #0x5211
      009381 F6               [ 1]  403 	ld	a, (x)
      009382 AA 04            [ 1]  404 	or	a, #0x04
      009384 F7               [ 1]  405 	ld	(x), a
                                    406 ;	lib/stm8s_i2c.c: 308: if (Ack == I2C_ACK_CURR)
      009385 7B 03            [ 1]  407 	ld	a, (0x03, sp)
      009387 A1 01            [ 1]  408 	cp	a, #0x01
      009389 26 08            [ 1]  409 	jrne	00102$
                                    410 ;	lib/stm8s_i2c.c: 311: I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
      00938B AE 52 11         [ 2]  411 	ldw	x, #0x5211
      00938E F6               [ 1]  412 	ld	a, (x)
      00938F A4 F7            [ 1]  413 	and	a, #0xf7
      009391 F7               [ 1]  414 	ld	(x), a
      009392 81               [ 4]  415 	ret
      009393                        416 00102$:
                                    417 ;	lib/stm8s_i2c.c: 316: I2C->CR2 |= I2C_CR2_POS;
      009393 AE 52 11         [ 2]  418 	ldw	x, #0x5211
      009396 F6               [ 1]  419 	ld	a, (x)
      009397 AA 08            [ 1]  420 	or	a, #0x08
      009399 F7               [ 1]  421 	ld	(x), a
      00939A 81               [ 4]  422 	ret
                                    423 ;	lib/stm8s_i2c.c: 329: void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
                                    424 ;	-----------------------------------------
                                    425 ;	 function I2C_ITConfig
                                    426 ;	-----------------------------------------
      00939B                        427 _I2C_ITConfig:
      00939B 88               [ 1]  428 	push	a
                                    429 ;	lib/stm8s_i2c.c: 331: if (NewState != DISABLE)
      00939C 0D 05            [ 1]  430 	tnz	(0x05, sp)
      00939E 27 0C            [ 1]  431 	jreq	00102$
                                    432 ;	lib/stm8s_i2c.c: 334: I2C->ITR |= (uint8_t)I2C_IT;
      0093A0 AE 52 1A         [ 2]  433 	ldw	x, #0x521a
      0093A3 F6               [ 1]  434 	ld	a, (x)
      0093A4 1A 04            [ 1]  435 	or	a, (0x04, sp)
      0093A6 AE 52 1A         [ 2]  436 	ldw	x, #0x521a
      0093A9 F7               [ 1]  437 	ld	(x), a
      0093AA 20 0F            [ 2]  438 	jra	00104$
      0093AC                        439 00102$:
                                    440 ;	lib/stm8s_i2c.c: 339: I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
      0093AC AE 52 1A         [ 2]  441 	ldw	x, #0x521a
      0093AF F6               [ 1]  442 	ld	a, (x)
      0093B0 6B 01            [ 1]  443 	ld	(0x01, sp), a
      0093B2 7B 04            [ 1]  444 	ld	a, (0x04, sp)
      0093B4 43               [ 1]  445 	cpl	a
      0093B5 14 01            [ 1]  446 	and	a, (0x01, sp)
      0093B7 AE 52 1A         [ 2]  447 	ldw	x, #0x521a
      0093BA F7               [ 1]  448 	ld	(x), a
      0093BB                        449 00104$:
      0093BB 84               [ 1]  450 	pop	a
      0093BC 81               [ 4]  451 	ret
                                    452 ;	lib/stm8s_i2c.c: 349: void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
                                    453 ;	-----------------------------------------
                                    454 ;	 function I2C_FastModeDutyCycleConfig
                                    455 ;	-----------------------------------------
      0093BD                        456 _I2C_FastModeDutyCycleConfig:
                                    457 ;	lib/stm8s_i2c.c: 351: if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
      0093BD 7B 03            [ 1]  458 	ld	a, (0x03, sp)
      0093BF A1 40            [ 1]  459 	cp	a, #0x40
      0093C1 26 08            [ 1]  460 	jrne	00102$
                                    461 ;	lib/stm8s_i2c.c: 354: I2C->CCRH |= I2C_CCRH_DUTY;
      0093C3 AE 52 1C         [ 2]  462 	ldw	x, #0x521c
      0093C6 F6               [ 1]  463 	ld	a, (x)
      0093C7 AA 40            [ 1]  464 	or	a, #0x40
      0093C9 F7               [ 1]  465 	ld	(x), a
      0093CA 81               [ 4]  466 	ret
      0093CB                        467 00102$:
                                    468 ;	lib/stm8s_i2c.c: 359: I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
      0093CB AE 52 1C         [ 2]  469 	ldw	x, #0x521c
      0093CE F6               [ 1]  470 	ld	a, (x)
      0093CF A4 BF            [ 1]  471 	and	a, #0xbf
      0093D1 F7               [ 1]  472 	ld	(x), a
      0093D2 81               [ 4]  473 	ret
                                    474 ;	lib/stm8s_i2c.c: 368: uint8_t I2C_ReceiveData(void)
                                    475 ;	-----------------------------------------
                                    476 ;	 function I2C_ReceiveData
                                    477 ;	-----------------------------------------
      0093D3                        478 _I2C_ReceiveData:
                                    479 ;	lib/stm8s_i2c.c: 371: return ((uint8_t)I2C->DR);
      0093D3 AE 52 16         [ 2]  480 	ldw	x, #0x5216
      0093D6 F6               [ 1]  481 	ld	a, (x)
      0093D7 81               [ 4]  482 	ret
                                    483 ;	lib/stm8s_i2c.c: 381: void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
                                    484 ;	-----------------------------------------
                                    485 ;	 function I2C_Send7bitAddress
                                    486 ;	-----------------------------------------
      0093D8                        487 _I2C_Send7bitAddress:
                                    488 ;	lib/stm8s_i2c.c: 384: Address &= (uint8_t)0xFE;
      0093D8 7B 03            [ 1]  489 	ld	a, (0x03, sp)
      0093DA A4 FE            [ 1]  490 	and	a, #0xfe
      0093DC 6B 03            [ 1]  491 	ld	(0x03, sp), a
                                    492 ;	lib/stm8s_i2c.c: 387: I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
      0093DE 7B 03            [ 1]  493 	ld	a, (0x03, sp)
      0093E0 1A 04            [ 1]  494 	or	a, (0x04, sp)
      0093E2 AE 52 16         [ 2]  495 	ldw	x, #0x5216
      0093E5 F7               [ 1]  496 	ld	(x), a
      0093E6 81               [ 4]  497 	ret
                                    498 ;	lib/stm8s_i2c.c: 395: void I2C_SendData(uint8_t Data)
                                    499 ;	-----------------------------------------
                                    500 ;	 function I2C_SendData
                                    501 ;	-----------------------------------------
      0093E7                        502 _I2C_SendData:
                                    503 ;	lib/stm8s_i2c.c: 398: I2C->DR = Data;
      0093E7 AE 52 16         [ 2]  504 	ldw	x, #0x5216
      0093EA 7B 03            [ 1]  505 	ld	a, (0x03, sp)
      0093EC F7               [ 1]  506 	ld	(x), a
      0093ED 81               [ 4]  507 	ret
                                    508 ;	lib/stm8s_i2c.c: 515: ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
                                    509 ;	-----------------------------------------
                                    510 ;	 function I2C_CheckEvent
                                    511 ;	-----------------------------------------
      0093EE                        512 _I2C_CheckEvent:
      0093EE 52 0A            [ 2]  513 	sub	sp, #10
                                    514 ;	lib/stm8s_i2c.c: 517: __IO uint16_t lastevent = 0x00;
      0093F0 5F               [ 1]  515 	clrw	x
      0093F1 1F 01            [ 2]  516 	ldw	(0x01, sp), x
                                    517 ;	lib/stm8s_i2c.c: 522: if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
      0093F3 1E 0D            [ 2]  518 	ldw	x, (0x0d, sp)
      0093F5 A3 00 04         [ 2]  519 	cpw	x, #0x0004
      0093F8 26 0C            [ 1]  520 	jrne	00102$
                                    521 ;	lib/stm8s_i2c.c: 524: lastevent = I2C->SR2 & I2C_SR2_AF;
      0093FA AE 52 18         [ 2]  522 	ldw	x, #0x5218
      0093FD F6               [ 1]  523 	ld	a, (x)
      0093FE A4 04            [ 1]  524 	and	a, #0x04
      009400 5F               [ 1]  525 	clrw	x
      009401 97               [ 1]  526 	ld	xl, a
      009402 1F 01            [ 2]  527 	ldw	(0x01, sp), x
      009404 20 1E            [ 2]  528 	jra	00103$
      009406                        529 00102$:
                                    530 ;	lib/stm8s_i2c.c: 528: flag1 = I2C->SR1;
      009406 AE 52 17         [ 2]  531 	ldw	x, #0x5217
      009409 F6               [ 1]  532 	ld	a, (x)
                                    533 ;	lib/stm8s_i2c.c: 529: flag2 = I2C->SR3;
      00940A AE 52 19         [ 2]  534 	ldw	x, #0x5219
      00940D 88               [ 1]  535 	push	a
      00940E F6               [ 1]  536 	ld	a, (x)
      00940F 97               [ 1]  537 	ld	xl, a
      009410 84               [ 1]  538 	pop	a
                                    539 ;	lib/stm8s_i2c.c: 530: lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
      009411 0F 07            [ 1]  540 	clr	(0x07, sp)
      009413 0F 06            [ 1]  541 	clr	(0x06, sp)
      009415 0F 09            [ 1]  542 	clr	(0x09, sp)
      009417 1A 06            [ 1]  543 	or	a, (0x06, sp)
      009419 6B 04            [ 1]  544 	ld	(0x04, sp), a
      00941B 9F               [ 1]  545 	ld	a, xl
      00941C 1A 09            [ 1]  546 	or	a, (0x09, sp)
      00941E 6B 03            [ 1]  547 	ld	(0x03, sp), a
      009420 16 03            [ 2]  548 	ldw	y, (0x03, sp)
      009422 17 01            [ 2]  549 	ldw	(0x01, sp), y
      009424                        550 00103$:
                                    551 ;	lib/stm8s_i2c.c: 533: if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
      009424 7B 02            [ 1]  552 	ld	a, (0x02, sp)
      009426 14 0E            [ 1]  553 	and	a, (0x0e, sp)
      009428 97               [ 1]  554 	ld	xl, a
      009429 7B 01            [ 1]  555 	ld	a, (0x01, sp)
      00942B 14 0D            [ 1]  556 	and	a, (0x0d, sp)
      00942D 95               [ 1]  557 	ld	xh, a
      00942E 13 0D            [ 2]  558 	cpw	x, (0x0d, sp)
      009430 26 03            [ 1]  559 	jrne	00105$
                                    560 ;	lib/stm8s_i2c.c: 536: status = SUCCESS;
      009432 A6 01            [ 1]  561 	ld	a, #0x01
                                    562 ;	lib/stm8s_i2c.c: 541: status = ERROR;
      009434 21                     563 	.byte 0x21
      009435                        564 00105$:
      009435 4F               [ 1]  565 	clr	a
      009436                        566 00106$:
                                    567 ;	lib/stm8s_i2c.c: 545: return status;
      009436 5B 0A            [ 2]  568 	addw	sp, #10
      009438 81               [ 4]  569 	ret
                                    570 ;	lib/stm8s_i2c.c: 562: I2C_Event_TypeDef I2C_GetLastEvent(void)
                                    571 ;	-----------------------------------------
                                    572 ;	 function I2C_GetLastEvent
                                    573 ;	-----------------------------------------
      009439                        574 _I2C_GetLastEvent:
      009439 52 04            [ 2]  575 	sub	sp, #4
                                    576 ;	lib/stm8s_i2c.c: 564: __IO uint16_t lastevent = 0;
      00943B 5F               [ 1]  577 	clrw	x
      00943C 1F 01            [ 2]  578 	ldw	(0x01, sp), x
                                    579 ;	lib/stm8s_i2c.c: 568: if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
      00943E AE 52 18         [ 2]  580 	ldw	x, #0x5218
      009441 F6               [ 1]  581 	ld	a, (x)
      009442 A5 04            [ 1]  582 	bcp	a, #0x04
      009444 27 07            [ 1]  583 	jreq	00102$
                                    584 ;	lib/stm8s_i2c.c: 570: lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
      009446 AE 00 04         [ 2]  585 	ldw	x, #0x0004
      009449 1F 01            [ 2]  586 	ldw	(0x01, sp), x
      00944B 20 17            [ 2]  587 	jra	00103$
      00944D                        588 00102$:
                                    589 ;	lib/stm8s_i2c.c: 575: flag1 = I2C->SR1;
      00944D AE 52 17         [ 2]  590 	ldw	x, #0x5217
      009450 F6               [ 1]  591 	ld	a, (x)
      009451 5F               [ 1]  592 	clrw	x
      009452 97               [ 1]  593 	ld	xl, a
      009453 1F 03            [ 2]  594 	ldw	(0x03, sp), x
                                    595 ;	lib/stm8s_i2c.c: 576: flag2 = I2C->SR3;
      009455 AE 52 19         [ 2]  596 	ldw	x, #0x5219
      009458 F6               [ 1]  597 	ld	a, (x)
      009459 95               [ 1]  598 	ld	xh, a
      00945A 4F               [ 1]  599 	clr	a
                                    600 ;	lib/stm8s_i2c.c: 579: lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
      00945B 4F               [ 1]  601 	clr	a
      00945C 1A 04            [ 1]  602 	or	a, (0x04, sp)
      00945E 02               [ 1]  603 	rlwa	x
      00945F 1A 03            [ 1]  604 	or	a, (0x03, sp)
      009461 95               [ 1]  605 	ld	xh, a
      009462 1F 01            [ 2]  606 	ldw	(0x01, sp), x
      009464                        607 00103$:
                                    608 ;	lib/stm8s_i2c.c: 582: return (I2C_Event_TypeDef)lastevent;
      009464 1E 01            [ 2]  609 	ldw	x, (0x01, sp)
      009466 5B 04            [ 2]  610 	addw	sp, #4
      009468 81               [ 4]  611 	ret
                                    612 ;	lib/stm8s_i2c.c: 613: FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
                                    613 ;	-----------------------------------------
                                    614 ;	 function I2C_GetFlagStatus
                                    615 ;	-----------------------------------------
      009469                        616 _I2C_GetFlagStatus:
      009469 89               [ 2]  617 	pushw	x
                                    618 ;	lib/stm8s_i2c.c: 615: uint8_t tempreg = 0;
      00946A 4F               [ 1]  619 	clr	a
      00946B 97               [ 1]  620 	ld	xl, a
                                    621 ;	lib/stm8s_i2c.c: 619: regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
      00946C 7B 05            [ 1]  622 	ld	a, (0x05, sp)
      00946E 0F 01            [ 1]  623 	clr	(0x01, sp)
                                    624 ;	lib/stm8s_i2c.c: 621: switch (regindex)
      009470 A1 01            [ 1]  625 	cp	a, #0x01
      009472 27 0A            [ 1]  626 	jreq	00101$
      009474 A1 02            [ 1]  627 	cp	a, #0x02
      009476 27 0D            [ 1]  628 	jreq	00102$
      009478 A1 03            [ 1]  629 	cp	a, #0x03
      00947A 27 10            [ 1]  630 	jreq	00103$
      00947C 20 13            [ 2]  631 	jra	00105$
                                    632 ;	lib/stm8s_i2c.c: 624: case 0x01:
      00947E                        633 00101$:
                                    634 ;	lib/stm8s_i2c.c: 625: tempreg = (uint8_t)I2C->SR1;
      00947E AE 52 17         [ 2]  635 	ldw	x, #0x5217
      009481 F6               [ 1]  636 	ld	a, (x)
      009482 97               [ 1]  637 	ld	xl, a
                                    638 ;	lib/stm8s_i2c.c: 626: break;
      009483 20 0C            [ 2]  639 	jra	00105$
                                    640 ;	lib/stm8s_i2c.c: 629: case 0x02:
      009485                        641 00102$:
                                    642 ;	lib/stm8s_i2c.c: 630: tempreg = (uint8_t)I2C->SR2;
      009485 AE 52 18         [ 2]  643 	ldw	x, #0x5218
      009488 F6               [ 1]  644 	ld	a, (x)
      009489 97               [ 1]  645 	ld	xl, a
                                    646 ;	lib/stm8s_i2c.c: 631: break;
      00948A 20 05            [ 2]  647 	jra	00105$
                                    648 ;	lib/stm8s_i2c.c: 634: case 0x03:
      00948C                        649 00103$:
                                    650 ;	lib/stm8s_i2c.c: 635: tempreg = (uint8_t)I2C->SR3;
      00948C AE 52 19         [ 2]  651 	ldw	x, #0x5219
      00948F F6               [ 1]  652 	ld	a, (x)
      009490 97               [ 1]  653 	ld	xl, a
                                    654 ;	lib/stm8s_i2c.c: 640: }
      009491                        655 00105$:
                                    656 ;	lib/stm8s_i2c.c: 643: if ((tempreg & (uint8_t)I2C_Flag ) != 0)
      009491 7B 06            [ 1]  657 	ld	a, (0x06, sp)
      009493 89               [ 2]  658 	pushw	x
      009494 14 02            [ 1]  659 	and	a, (2, sp)
      009496 85               [ 2]  660 	popw	x
      009497 4D               [ 1]  661 	tnz	a
      009498 27 03            [ 1]  662 	jreq	00107$
                                    663 ;	lib/stm8s_i2c.c: 646: bitstatus = SET;
      00949A A6 01            [ 1]  664 	ld	a, #0x01
                                    665 ;	lib/stm8s_i2c.c: 651: bitstatus = RESET;
      00949C 21                     666 	.byte 0x21
      00949D                        667 00107$:
      00949D 4F               [ 1]  668 	clr	a
      00949E                        669 00108$:
                                    670 ;	lib/stm8s_i2c.c: 654: return bitstatus;
      00949E 85               [ 2]  671 	popw	x
      00949F 81               [ 4]  672 	ret
                                    673 ;	lib/stm8s_i2c.c: 689: void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
                                    674 ;	-----------------------------------------
                                    675 ;	 function I2C_ClearFlag
                                    676 ;	-----------------------------------------
      0094A0                        677 _I2C_ClearFlag:
                                    678 ;	lib/stm8s_i2c.c: 694: flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
      0094A0 7B 04            [ 1]  679 	ld	a, (0x04, sp)
      0094A2 97               [ 1]  680 	ld	xl, a
      0094A3 4F               [ 1]  681 	clr	a
                                    682 ;	lib/stm8s_i2c.c: 696: I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
      0094A4 95               [ 1]  683 	ld	xh, a
      0094A5 53               [ 2]  684 	cplw	x
      0094A6 9F               [ 1]  685 	ld	a, xl
      0094A7 AE 52 18         [ 2]  686 	ldw	x, #0x5218
      0094AA F7               [ 1]  687 	ld	(x), a
      0094AB 81               [ 4]  688 	ret
                                    689 ;	lib/stm8s_i2c.c: 719: ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    690 ;	-----------------------------------------
                                    691 ;	 function I2C_GetITStatus
                                    692 ;	-----------------------------------------
      0094AC                        693 _I2C_GetITStatus:
      0094AC 89               [ 2]  694 	pushw	x
                                    695 ;	lib/stm8s_i2c.c: 722: __IO uint8_t enablestatus = 0;
      0094AD 0F 01            [ 1]  696 	clr	(0x01, sp)
                                    697 ;	lib/stm8s_i2c.c: 725: tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
      0094AF 4F               [ 1]  698 	clr	a
      0094B0 7B 05            [ 1]  699 	ld	a, (0x05, sp)
      0094B2 A4 07            [ 1]  700 	and	a, #0x07
      0094B4 97               [ 1]  701 	ld	xl, a
      0094B5 4F               [ 1]  702 	clr	a
      0094B6 4F               [ 1]  703 	clr	a
      0094B7 95               [ 1]  704 	ld	xh, a
                                    705 ;	lib/stm8s_i2c.c: 728: enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
      0094B8 90 AE 52 1A      [ 2]  706 	ldw	y, #0x521a
      0094BC 90 F6            [ 1]  707 	ld	a, (y)
      0094BE 89               [ 2]  708 	pushw	x
      0094BF 14 02            [ 1]  709 	and	a, (2, sp)
      0094C1 85               [ 2]  710 	popw	x
      0094C2 6B 01            [ 1]  711 	ld	(0x01, sp), a
                                    712 ;	lib/stm8s_i2c.c: 730: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      0094C4 4F               [ 1]  713 	clr	a
      0094C5 97               [ 1]  714 	ld	xl, a
      0094C6 7B 05            [ 1]  715 	ld	a, (0x05, sp)
      0094C8 A4 30            [ 1]  716 	and	a, #0x30
      0094CA 95               [ 1]  717 	ld	xh, a
                                    718 ;	lib/stm8s_i2c.c: 733: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      0094CB 7B 06            [ 1]  719 	ld	a, (0x06, sp)
      0094CD 6B 02            [ 1]  720 	ld	(0x02, sp), a
                                    721 ;	lib/stm8s_i2c.c: 730: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      0094CF A3 01 00         [ 2]  722 	cpw	x, #0x0100
      0094D2 26 14            [ 1]  723 	jrne	00110$
                                    724 ;	lib/stm8s_i2c.c: 733: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      0094D4 AE 52 17         [ 2]  725 	ldw	x, #0x5217
      0094D7 F6               [ 1]  726 	ld	a, (x)
      0094D8 14 02            [ 1]  727 	and	a, (0x02, sp)
      0094DA 4D               [ 1]  728 	tnz	a
      0094DB 27 08            [ 1]  729 	jreq	00102$
      0094DD 0D 01            [ 1]  730 	tnz	(0x01, sp)
      0094DF 27 04            [ 1]  731 	jreq	00102$
                                    732 ;	lib/stm8s_i2c.c: 736: bitstatus = SET;
      0094E1 A6 01            [ 1]  733 	ld	a, #0x01
      0094E3 20 14            [ 2]  734 	jra	00111$
      0094E5                        735 00102$:
                                    736 ;	lib/stm8s_i2c.c: 741: bitstatus = RESET;
      0094E5 4F               [ 1]  737 	clr	a
      0094E6 20 11            [ 2]  738 	jra	00111$
      0094E8                        739 00110$:
                                    740 ;	lib/stm8s_i2c.c: 747: if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      0094E8 AE 52 18         [ 2]  741 	ldw	x, #0x5218
      0094EB F6               [ 1]  742 	ld	a, (x)
      0094EC 14 02            [ 1]  743 	and	a, (0x02, sp)
      0094EE 4D               [ 1]  744 	tnz	a
      0094EF 27 07            [ 1]  745 	jreq	00106$
      0094F1 0D 01            [ 1]  746 	tnz	(0x01, sp)
      0094F3 27 03            [ 1]  747 	jreq	00106$
                                    748 ;	lib/stm8s_i2c.c: 750: bitstatus = SET;
      0094F5 A6 01            [ 1]  749 	ld	a, #0x01
                                    750 ;	lib/stm8s_i2c.c: 755: bitstatus = RESET;
      0094F7 21                     751 	.byte 0x21
      0094F8                        752 00106$:
      0094F8 4F               [ 1]  753 	clr	a
      0094F9                        754 00111$:
                                    755 ;	lib/stm8s_i2c.c: 759: return  bitstatus;
      0094F9 85               [ 2]  756 	popw	x
      0094FA 81               [ 4]  757 	ret
                                    758 ;	lib/stm8s_i2c.c: 797: void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    759 ;	-----------------------------------------
                                    760 ;	 function I2C_ClearITPendingBit
                                    761 ;	-----------------------------------------
      0094FB                        762 _I2C_ClearITPendingBit:
                                    763 ;	lib/stm8s_i2c.c: 802: flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
      0094FB 7B 04            [ 1]  764 	ld	a, (0x04, sp)
      0094FD 97               [ 1]  765 	ld	xl, a
      0094FE 4F               [ 1]  766 	clr	a
                                    767 ;	lib/stm8s_i2c.c: 805: I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
      0094FF 95               [ 1]  768 	ld	xh, a
      009500 53               [ 2]  769 	cplw	x
      009501 9F               [ 1]  770 	ld	a, xl
      009502 AE 52 18         [ 2]  771 	ldw	x, #0x5218
      009505 F7               [ 1]  772 	ld	(x), a
      009506 81               [ 4]  773 	ret
                                    774 	.area CODE
                                    775 	.area INITIALIZER
                                    776 	.area CABS (ABS)
