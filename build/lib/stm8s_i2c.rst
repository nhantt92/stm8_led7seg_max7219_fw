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
      0092D7                         63 _I2C_DeInit:
                                     64 ;	lib/stm8s_i2c.c: 43: I2C->CR1 = I2C_CR1_RESET_VALUE;
      0092D7 35 00 52 10      [ 1]   65 	mov	0x5210+0, #0x00
                                     66 ;	lib/stm8s_i2c.c: 44: I2C->CR2 = I2C_CR2_RESET_VALUE;
      0092DB 35 00 52 11      [ 1]   67 	mov	0x5211+0, #0x00
                                     68 ;	lib/stm8s_i2c.c: 45: I2C->FREQR = I2C_FREQR_RESET_VALUE;
      0092DF 35 00 52 12      [ 1]   69 	mov	0x5212+0, #0x00
                                     70 ;	lib/stm8s_i2c.c: 46: I2C->OARL = I2C_OARL_RESET_VALUE;
      0092E3 35 00 52 13      [ 1]   71 	mov	0x5213+0, #0x00
                                     72 ;	lib/stm8s_i2c.c: 47: I2C->OARH = I2C_OARH_RESET_VALUE;
      0092E7 35 00 52 14      [ 1]   73 	mov	0x5214+0, #0x00
                                     74 ;	lib/stm8s_i2c.c: 48: I2C->ITR = I2C_ITR_RESET_VALUE;
      0092EB 35 00 52 1A      [ 1]   75 	mov	0x521a+0, #0x00
                                     76 ;	lib/stm8s_i2c.c: 49: I2C->CCRL = I2C_CCRL_RESET_VALUE;
      0092EF 35 00 52 1B      [ 1]   77 	mov	0x521b+0, #0x00
                                     78 ;	lib/stm8s_i2c.c: 50: I2C->CCRH = I2C_CCRH_RESET_VALUE;
      0092F3 35 00 52 1C      [ 1]   79 	mov	0x521c+0, #0x00
                                     80 ;	lib/stm8s_i2c.c: 51: I2C->TRISER = I2C_TRISER_RESET_VALUE;
      0092F7 35 02 52 1D      [ 1]   81 	mov	0x521d+0, #0x02
      0092FB 81               [ 4]   82 	ret
                                     83 ;	lib/stm8s_i2c.c: 70: void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
                                     84 ;	-----------------------------------------
                                     85 ;	 function I2C_Init
                                     86 ;	-----------------------------------------
      0092FC                         87 _I2C_Init:
      0092FC 52 0A            [ 2]   88 	sub	sp, #10
                                     89 ;	lib/stm8s_i2c.c: 76: uint8_t tmpccrh = 0;
      0092FE 0F 03            [ 1]   90 	clr	(0x03, sp)
                                     91 ;	lib/stm8s_i2c.c: 82: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
      009300 AE 52 12         [ 2]   92 	ldw	x, #0x5212
      009303 F6               [ 1]   93 	ld	a, (x)
      009304 A4 C0            [ 1]   94 	and	a, #0xc0
      009306 F7               [ 1]   95 	ld	(x), a
                                     96 ;	lib/stm8s_i2c.c: 84: I2C->FREQR |= InputClockFrequencyMHz;
      009307 AE 52 12         [ 2]   97 	ldw	x, #0x5212
      00930A F6               [ 1]   98 	ld	a, (x)
      00930B 1A 16            [ 1]   99 	or	a, (0x16, sp)
      00930D AE 52 12         [ 2]  100 	ldw	x, #0x5212
      009310 F7               [ 1]  101 	ld	(x), a
                                    102 ;	lib/stm8s_i2c.c: 88: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      009311 72 11 52 10      [ 1]  103 	bres	0x5210, #0
                                    104 ;	lib/stm8s_i2c.c: 91: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
      009315 AE 52 1C         [ 2]  105 	ldw	x, #0x521c
      009318 F6               [ 1]  106 	ld	a, (x)
      009319 A4 30            [ 1]  107 	and	a, #0x30
      00931B F7               [ 1]  108 	ld	(x), a
                                    109 ;	lib/stm8s_i2c.c: 92: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
      00931C AE 52 1B         [ 2]  110 	ldw	x, #0x521b
      00931F F6               [ 1]  111 	ld	a, (x)
      009320 35 00 52 1B      [ 1]  112 	mov	0x521b+0, #0x00
                                    113 ;	lib/stm8s_i2c.c: 103: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      009324 5F               [ 1]  114 	clrw	x
      009325 7B 16            [ 1]  115 	ld	a, (0x16, sp)
      009327 97               [ 1]  116 	ld	xl, a
      009328 90 5F            [ 1]  117 	clrw	y
      00932A 89               [ 2]  118 	pushw	x
      00932B 90 89            [ 2]  119 	pushw	y
      00932D 4B 40            [ 1]  120 	push	#0x40
      00932F 4B 42            [ 1]  121 	push	#0x42
      009331 4B 0F            [ 1]  122 	push	#0x0f
      009333 4B 00            [ 1]  123 	push	#0x00
      009335 CD 98 8E         [ 4]  124 	call	__mullong
      009338 5B 08            [ 2]  125 	addw	sp, #8
      00933A 1F 06            [ 2]  126 	ldw	(0x06, sp), x
      00933C 17 04            [ 2]  127 	ldw	(0x04, sp), y
                                    128 ;	lib/stm8s_i2c.c: 95: if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
      00933E AE 86 A0         [ 2]  129 	ldw	x, #0x86a0
      009341 13 0F            [ 2]  130 	cpw	x, (0x0f, sp)
      009343 A6 01            [ 1]  131 	ld	a, #0x01
      009345 12 0E            [ 1]  132 	sbc	a, (0x0e, sp)
      009347 4F               [ 1]  133 	clr	a
      009348 12 0D            [ 1]  134 	sbc	a, (0x0d, sp)
      00934A 24 77            [ 1]  135 	jrnc	00109$
                                    136 ;	lib/stm8s_i2c.c: 98: tmpccrh = I2C_CCRH_FS;
      00934C A6 80            [ 1]  137 	ld	a, #0x80
      00934E 6B 03            [ 1]  138 	ld	(0x03, sp), a
                                    139 ;	lib/stm8s_i2c.c: 100: if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
      009350 0D 13            [ 1]  140 	tnz	(0x13, sp)
      009352 26 23            [ 1]  141 	jrne	00102$
                                    142 ;	lib/stm8s_i2c.c: 103: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      009354 1E 0F            [ 2]  143 	ldw	x, (0x0f, sp)
      009356 89               [ 2]  144 	pushw	x
      009357 1E 0F            [ 2]  145 	ldw	x, (0x0f, sp)
      009359 89               [ 2]  146 	pushw	x
      00935A 4B 03            [ 1]  147 	push	#0x03
      00935C 5F               [ 1]  148 	clrw	x
      00935D 89               [ 2]  149 	pushw	x
      00935E 4B 00            [ 1]  150 	push	#0x00
      009360 CD 98 8E         [ 4]  151 	call	__mullong
      009363 5B 08            [ 2]  152 	addw	sp, #8
      009365 89               [ 2]  153 	pushw	x
      009366 90 89            [ 2]  154 	pushw	y
      009368 1E 0A            [ 2]  155 	ldw	x, (0x0a, sp)
      00936A 89               [ 2]  156 	pushw	x
      00936B 1E 0A            [ 2]  157 	ldw	x, (0x0a, sp)
      00936D 89               [ 2]  158 	pushw	x
      00936E CD 98 13         [ 4]  159 	call	__divulong
      009371 5B 08            [ 2]  160 	addw	sp, #8
      009373 1F 01            [ 2]  161 	ldw	(0x01, sp), x
      009375 20 28            [ 2]  162 	jra	00103$
      009377                        163 00102$:
                                    164 ;	lib/stm8s_i2c.c: 108: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
      009377 1E 0F            [ 2]  165 	ldw	x, (0x0f, sp)
      009379 89               [ 2]  166 	pushw	x
      00937A 1E 0F            [ 2]  167 	ldw	x, (0x0f, sp)
      00937C 89               [ 2]  168 	pushw	x
      00937D 4B 19            [ 1]  169 	push	#0x19
      00937F 5F               [ 1]  170 	clrw	x
      009380 89               [ 2]  171 	pushw	x
      009381 4B 00            [ 1]  172 	push	#0x00
      009383 CD 98 8E         [ 4]  173 	call	__mullong
      009386 5B 08            [ 2]  174 	addw	sp, #8
      009388 9F               [ 1]  175 	ld	a, xl
      009389 88               [ 1]  176 	push	a
      00938A 9E               [ 1]  177 	ld	a, xh
      00938B 88               [ 1]  178 	push	a
      00938C 90 89            [ 2]  179 	pushw	y
      00938E 1E 0A            [ 2]  180 	ldw	x, (0x0a, sp)
      009390 89               [ 2]  181 	pushw	x
      009391 1E 0A            [ 2]  182 	ldw	x, (0x0a, sp)
      009393 89               [ 2]  183 	pushw	x
      009394 CD 98 13         [ 4]  184 	call	__divulong
      009397 5B 08            [ 2]  185 	addw	sp, #8
      009399 1F 01            [ 2]  186 	ldw	(0x01, sp), x
                                    187 ;	lib/stm8s_i2c.c: 110: tmpccrh |= I2C_CCRH_DUTY;
      00939B A6 C0            [ 1]  188 	ld	a, #0xc0
      00939D 6B 03            [ 1]  189 	ld	(0x03, sp), a
      00939F                        190 00103$:
                                    191 ;	lib/stm8s_i2c.c: 114: if (result < (uint16_t)0x01)
      00939F 1E 01            [ 2]  192 	ldw	x, (0x01, sp)
      0093A1 A3 00 01         [ 2]  193 	cpw	x, #0x0001
      0093A4 24 05            [ 1]  194 	jrnc	00105$
                                    195 ;	lib/stm8s_i2c.c: 117: result = (uint16_t)0x0001;
      0093A6 AE 00 01         [ 2]  196 	ldw	x, #0x0001
      0093A9 1F 01            [ 2]  197 	ldw	(0x01, sp), x
      0093AB                        198 00105$:
                                    199 ;	lib/stm8s_i2c.c: 123: tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
      0093AB 7B 16            [ 1]  200 	ld	a, (0x16, sp)
      0093AD 97               [ 1]  201 	ld	xl, a
      0093AE A6 03            [ 1]  202 	ld	a, #0x03
      0093B0 42               [ 4]  203 	mul	x, a
      0093B1 4B 0A            [ 1]  204 	push	#0x0a
      0093B3 4B 00            [ 1]  205 	push	#0x00
      0093B5 89               [ 2]  206 	pushw	x
      0093B6 CD 99 0A         [ 4]  207 	call	__divsint
      0093B9 5B 04            [ 2]  208 	addw	sp, #4
      0093BB 5C               [ 2]  209 	incw	x
      0093BC 9F               [ 1]  210 	ld	a, xl
                                    211 ;	lib/stm8s_i2c.c: 124: I2C->TRISER = (uint8_t)tmpval;
      0093BD AE 52 1D         [ 2]  212 	ldw	x, #0x521d
      0093C0 F7               [ 1]  213 	ld	(x), a
      0093C1 20 2A            [ 2]  214 	jra	00110$
      0093C3                        215 00109$:
                                    216 ;	lib/stm8s_i2c.c: 131: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
      0093C3 1E 0F            [ 2]  217 	ldw	x, (0x0f, sp)
      0093C5 16 0D            [ 2]  218 	ldw	y, (0x0d, sp)
      0093C7 58               [ 2]  219 	sllw	x
      0093C8 90 59            [ 2]  220 	rlcw	y
      0093CA 89               [ 2]  221 	pushw	x
      0093CB 90 89            [ 2]  222 	pushw	y
      0093CD 1E 0A            [ 2]  223 	ldw	x, (0x0a, sp)
      0093CF 89               [ 2]  224 	pushw	x
      0093D0 1E 0A            [ 2]  225 	ldw	x, (0x0a, sp)
      0093D2 89               [ 2]  226 	pushw	x
      0093D3 CD 98 13         [ 4]  227 	call	__divulong
      0093D6 5B 08            [ 2]  228 	addw	sp, #8
      0093D8 1F 01            [ 2]  229 	ldw	(0x01, sp), x
                                    230 ;	lib/stm8s_i2c.c: 134: if (result < (uint16_t)0x0004)
      0093DA 1E 01            [ 2]  231 	ldw	x, (0x01, sp)
      0093DC A3 00 04         [ 2]  232 	cpw	x, #0x0004
      0093DF 24 05            [ 1]  233 	jrnc	00107$
                                    234 ;	lib/stm8s_i2c.c: 137: result = (uint16_t)0x0004;
      0093E1 AE 00 04         [ 2]  235 	ldw	x, #0x0004
      0093E4 1F 01            [ 2]  236 	ldw	(0x01, sp), x
      0093E6                        237 00107$:
                                    238 ;	lib/stm8s_i2c.c: 143: I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
      0093E6 7B 16            [ 1]  239 	ld	a, (0x16, sp)
      0093E8 4C               [ 1]  240 	inc	a
      0093E9 AE 52 1D         [ 2]  241 	ldw	x, #0x521d
      0093EC F7               [ 1]  242 	ld	(x), a
      0093ED                        243 00110$:
                                    244 ;	lib/stm8s_i2c.c: 148: I2C->CCRL = (uint8_t)result;
      0093ED 7B 02            [ 1]  245 	ld	a, (0x02, sp)
      0093EF AE 52 1B         [ 2]  246 	ldw	x, #0x521b
      0093F2 F7               [ 1]  247 	ld	(x), a
                                    248 ;	lib/stm8s_i2c.c: 149: I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
      0093F3 7B 01            [ 1]  249 	ld	a, (0x01, sp)
      0093F5 0F 09            [ 1]  250 	clr	(0x09, sp)
      0093F7 A4 0F            [ 1]  251 	and	a, #0x0f
      0093F9 1A 03            [ 1]  252 	or	a, (0x03, sp)
      0093FB AE 52 1C         [ 2]  253 	ldw	x, #0x521c
      0093FE F7               [ 1]  254 	ld	(x), a
                                    255 ;	lib/stm8s_i2c.c: 152: I2C->CR1 |= I2C_CR1_PE;
      0093FF 72 10 52 10      [ 1]  256 	bset	0x5210, #0
                                    257 ;	lib/stm8s_i2c.c: 155: I2C_AcknowledgeConfig(Ack);
      009403 7B 14            [ 1]  258 	ld	a, (0x14, sp)
      009405 88               [ 1]  259 	push	a
      009406 CD 94 8A         [ 4]  260 	call	_I2C_AcknowledgeConfig
      009409 84               [ 1]  261 	pop	a
                                    262 ;	lib/stm8s_i2c.c: 158: I2C->OARL = (uint8_t)(OwnAddress);
      00940A 7B 12            [ 1]  263 	ld	a, (0x12, sp)
      00940C AE 52 13         [ 2]  264 	ldw	x, #0x5213
      00940F F7               [ 1]  265 	ld	(x), a
                                    266 ;	lib/stm8s_i2c.c: 159: I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
      009410 7B 15            [ 1]  267 	ld	a, (0x15, sp)
      009412 AA 40            [ 1]  268 	or	a, #0x40
      009414 6B 08            [ 1]  269 	ld	(0x08, sp), a
                                    270 ;	lib/stm8s_i2c.c: 160: (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
      009416 4F               [ 1]  271 	clr	a
      009417 97               [ 1]  272 	ld	xl, a
      009418 7B 11            [ 1]  273 	ld	a, (0x11, sp)
      00941A A4 03            [ 1]  274 	and	a, #0x03
      00941C 95               [ 1]  275 	ld	xh, a
      00941D A6 80            [ 1]  276 	ld	a, #0x80
      00941F 62               [ 2]  277 	div	x, a
      009420 9F               [ 1]  278 	ld	a, xl
      009421 1A 08            [ 1]  279 	or	a, (0x08, sp)
      009423 AE 52 14         [ 2]  280 	ldw	x, #0x5214
      009426 F7               [ 1]  281 	ld	(x), a
      009427 5B 0A            [ 2]  282 	addw	sp, #10
      009429 81               [ 4]  283 	ret
                                    284 ;	lib/stm8s_i2c.c: 169: void I2C_Cmd(FunctionalState NewState)
                                    285 ;	-----------------------------------------
                                    286 ;	 function I2C_Cmd
                                    287 ;	-----------------------------------------
      00942A                        288 _I2C_Cmd:
                                    289 ;	lib/stm8s_i2c.c: 171: if (NewState != DISABLE)
      00942A 0D 03            [ 1]  290 	tnz	(0x03, sp)
      00942C 27 05            [ 1]  291 	jreq	00102$
                                    292 ;	lib/stm8s_i2c.c: 174: I2C->CR1 |= I2C_CR1_PE;
      00942E 72 10 52 10      [ 1]  293 	bset	0x5210, #0
      009432 81               [ 4]  294 	ret
      009433                        295 00102$:
                                    296 ;	lib/stm8s_i2c.c: 179: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      009433 72 11 52 10      [ 1]  297 	bres	0x5210, #0
      009437 81               [ 4]  298 	ret
                                    299 ;	lib/stm8s_i2c.c: 189: void I2C_GeneralCallCmd(FunctionalState NewState)
                                    300 ;	-----------------------------------------
                                    301 ;	 function I2C_GeneralCallCmd
                                    302 ;	-----------------------------------------
      009438                        303 _I2C_GeneralCallCmd:
                                    304 ;	lib/stm8s_i2c.c: 191: if (NewState != DISABLE)
      009438 0D 03            [ 1]  305 	tnz	(0x03, sp)
      00943A 27 08            [ 1]  306 	jreq	00102$
                                    307 ;	lib/stm8s_i2c.c: 194: I2C->CR1 |= I2C_CR1_ENGC;
      00943C AE 52 10         [ 2]  308 	ldw	x, #0x5210
      00943F F6               [ 1]  309 	ld	a, (x)
      009440 AA 40            [ 1]  310 	or	a, #0x40
      009442 F7               [ 1]  311 	ld	(x), a
      009443 81               [ 4]  312 	ret
      009444                        313 00102$:
                                    314 ;	lib/stm8s_i2c.c: 199: I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
      009444 AE 52 10         [ 2]  315 	ldw	x, #0x5210
      009447 F6               [ 1]  316 	ld	a, (x)
      009448 A4 BF            [ 1]  317 	and	a, #0xbf
      00944A F7               [ 1]  318 	ld	(x), a
      00944B 81               [ 4]  319 	ret
                                    320 ;	lib/stm8s_i2c.c: 211: void I2C_GenerateSTART(FunctionalState NewState)
                                    321 ;	-----------------------------------------
                                    322 ;	 function I2C_GenerateSTART
                                    323 ;	-----------------------------------------
      00944C                        324 _I2C_GenerateSTART:
                                    325 ;	lib/stm8s_i2c.c: 214: if (NewState != DISABLE)
      00944C 0D 03            [ 1]  326 	tnz	(0x03, sp)
      00944E 27 05            [ 1]  327 	jreq	00102$
                                    328 ;	lib/stm8s_i2c.c: 217: I2C->CR2 |= I2C_CR2_START;
      009450 72 10 52 11      [ 1]  329 	bset	0x5211, #0
      009454 81               [ 4]  330 	ret
      009455                        331 00102$:
                                    332 ;	lib/stm8s_i2c.c: 222: I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
      009455 72 11 52 11      [ 1]  333 	bres	0x5211, #0
      009459 81               [ 4]  334 	ret
                                    335 ;	lib/stm8s_i2c.c: 232: void I2C_GenerateSTOP(FunctionalState NewState)
                                    336 ;	-----------------------------------------
                                    337 ;	 function I2C_GenerateSTOP
                                    338 ;	-----------------------------------------
      00945A                        339 _I2C_GenerateSTOP:
                                    340 ;	lib/stm8s_i2c.c: 234: if (NewState != DISABLE)
      00945A 0D 03            [ 1]  341 	tnz	(0x03, sp)
      00945C 27 08            [ 1]  342 	jreq	00102$
                                    343 ;	lib/stm8s_i2c.c: 237: I2C->CR2 |= I2C_CR2_STOP;
      00945E AE 52 11         [ 2]  344 	ldw	x, #0x5211
      009461 F6               [ 1]  345 	ld	a, (x)
      009462 AA 02            [ 1]  346 	or	a, #0x02
      009464 F7               [ 1]  347 	ld	(x), a
      009465 81               [ 4]  348 	ret
      009466                        349 00102$:
                                    350 ;	lib/stm8s_i2c.c: 242: I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
      009466 AE 52 11         [ 2]  351 	ldw	x, #0x5211
      009469 F6               [ 1]  352 	ld	a, (x)
      00946A A4 FD            [ 1]  353 	and	a, #0xfd
      00946C F7               [ 1]  354 	ld	(x), a
      00946D 81               [ 4]  355 	ret
                                    356 ;	lib/stm8s_i2c.c: 252: void I2C_SoftwareResetCmd(FunctionalState NewState)
                                    357 ;	-----------------------------------------
                                    358 ;	 function I2C_SoftwareResetCmd
                                    359 ;	-----------------------------------------
      00946E                        360 _I2C_SoftwareResetCmd:
                                    361 ;	lib/stm8s_i2c.c: 255: if (NewState != DISABLE)
      00946E 0D 03            [ 1]  362 	tnz	(0x03, sp)
      009470 27 05            [ 1]  363 	jreq	00102$
                                    364 ;	lib/stm8s_i2c.c: 258: I2C->CR2 |= I2C_CR2_SWRST;
      009472 72 1E 52 11      [ 1]  365 	bset	0x5211, #7
      009476 81               [ 4]  366 	ret
      009477                        367 00102$:
                                    368 ;	lib/stm8s_i2c.c: 263: I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
      009477 72 1F 52 11      [ 1]  369 	bres	0x5211, #7
      00947B 81               [ 4]  370 	ret
                                    371 ;	lib/stm8s_i2c.c: 274: void I2C_StretchClockCmd(FunctionalState NewState)
                                    372 ;	-----------------------------------------
                                    373 ;	 function I2C_StretchClockCmd
                                    374 ;	-----------------------------------------
      00947C                        375 _I2C_StretchClockCmd:
                                    376 ;	lib/stm8s_i2c.c: 276: if (NewState != DISABLE)
      00947C 0D 03            [ 1]  377 	tnz	(0x03, sp)
      00947E 27 05            [ 1]  378 	jreq	00102$
                                    379 ;	lib/stm8s_i2c.c: 279: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
      009480 72 1F 52 10      [ 1]  380 	bres	0x5210, #7
      009484 81               [ 4]  381 	ret
      009485                        382 00102$:
                                    383 ;	lib/stm8s_i2c.c: 285: I2C->CR1 |= I2C_CR1_NOSTRETCH;
      009485 72 1E 52 10      [ 1]  384 	bset	0x5210, #7
      009489 81               [ 4]  385 	ret
                                    386 ;	lib/stm8s_i2c.c: 296: void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
                                    387 ;	-----------------------------------------
                                    388 ;	 function I2C_AcknowledgeConfig
                                    389 ;	-----------------------------------------
      00948A                        390 _I2C_AcknowledgeConfig:
                                    391 ;	lib/stm8s_i2c.c: 298: if (Ack == I2C_ACK_NONE)
      00948A 0D 03            [ 1]  392 	tnz	(0x03, sp)
      00948C 26 08            [ 1]  393 	jrne	00105$
                                    394 ;	lib/stm8s_i2c.c: 301: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      00948E AE 52 11         [ 2]  395 	ldw	x, #0x5211
      009491 F6               [ 1]  396 	ld	a, (x)
      009492 A4 FB            [ 1]  397 	and	a, #0xfb
      009494 F7               [ 1]  398 	ld	(x), a
      009495 81               [ 4]  399 	ret
      009496                        400 00105$:
                                    401 ;	lib/stm8s_i2c.c: 306: I2C->CR2 |= I2C_CR2_ACK;
      009496 AE 52 11         [ 2]  402 	ldw	x, #0x5211
      009499 F6               [ 1]  403 	ld	a, (x)
      00949A AA 04            [ 1]  404 	or	a, #0x04
      00949C F7               [ 1]  405 	ld	(x), a
                                    406 ;	lib/stm8s_i2c.c: 308: if (Ack == I2C_ACK_CURR)
      00949D 7B 03            [ 1]  407 	ld	a, (0x03, sp)
      00949F A1 01            [ 1]  408 	cp	a, #0x01
      0094A1 26 08            [ 1]  409 	jrne	00102$
                                    410 ;	lib/stm8s_i2c.c: 311: I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
      0094A3 AE 52 11         [ 2]  411 	ldw	x, #0x5211
      0094A6 F6               [ 1]  412 	ld	a, (x)
      0094A7 A4 F7            [ 1]  413 	and	a, #0xf7
      0094A9 F7               [ 1]  414 	ld	(x), a
      0094AA 81               [ 4]  415 	ret
      0094AB                        416 00102$:
                                    417 ;	lib/stm8s_i2c.c: 316: I2C->CR2 |= I2C_CR2_POS;
      0094AB AE 52 11         [ 2]  418 	ldw	x, #0x5211
      0094AE F6               [ 1]  419 	ld	a, (x)
      0094AF AA 08            [ 1]  420 	or	a, #0x08
      0094B1 F7               [ 1]  421 	ld	(x), a
      0094B2 81               [ 4]  422 	ret
                                    423 ;	lib/stm8s_i2c.c: 329: void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
                                    424 ;	-----------------------------------------
                                    425 ;	 function I2C_ITConfig
                                    426 ;	-----------------------------------------
      0094B3                        427 _I2C_ITConfig:
      0094B3 88               [ 1]  428 	push	a
                                    429 ;	lib/stm8s_i2c.c: 331: if (NewState != DISABLE)
      0094B4 0D 05            [ 1]  430 	tnz	(0x05, sp)
      0094B6 27 0C            [ 1]  431 	jreq	00102$
                                    432 ;	lib/stm8s_i2c.c: 334: I2C->ITR |= (uint8_t)I2C_IT;
      0094B8 AE 52 1A         [ 2]  433 	ldw	x, #0x521a
      0094BB F6               [ 1]  434 	ld	a, (x)
      0094BC 1A 04            [ 1]  435 	or	a, (0x04, sp)
      0094BE AE 52 1A         [ 2]  436 	ldw	x, #0x521a
      0094C1 F7               [ 1]  437 	ld	(x), a
      0094C2 20 0F            [ 2]  438 	jra	00104$
      0094C4                        439 00102$:
                                    440 ;	lib/stm8s_i2c.c: 339: I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
      0094C4 AE 52 1A         [ 2]  441 	ldw	x, #0x521a
      0094C7 F6               [ 1]  442 	ld	a, (x)
      0094C8 6B 01            [ 1]  443 	ld	(0x01, sp), a
      0094CA 7B 04            [ 1]  444 	ld	a, (0x04, sp)
      0094CC 43               [ 1]  445 	cpl	a
      0094CD 14 01            [ 1]  446 	and	a, (0x01, sp)
      0094CF AE 52 1A         [ 2]  447 	ldw	x, #0x521a
      0094D2 F7               [ 1]  448 	ld	(x), a
      0094D3                        449 00104$:
      0094D3 84               [ 1]  450 	pop	a
      0094D4 81               [ 4]  451 	ret
                                    452 ;	lib/stm8s_i2c.c: 349: void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
                                    453 ;	-----------------------------------------
                                    454 ;	 function I2C_FastModeDutyCycleConfig
                                    455 ;	-----------------------------------------
      0094D5                        456 _I2C_FastModeDutyCycleConfig:
                                    457 ;	lib/stm8s_i2c.c: 351: if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
      0094D5 7B 03            [ 1]  458 	ld	a, (0x03, sp)
      0094D7 A1 40            [ 1]  459 	cp	a, #0x40
      0094D9 26 08            [ 1]  460 	jrne	00102$
                                    461 ;	lib/stm8s_i2c.c: 354: I2C->CCRH |= I2C_CCRH_DUTY;
      0094DB AE 52 1C         [ 2]  462 	ldw	x, #0x521c
      0094DE F6               [ 1]  463 	ld	a, (x)
      0094DF AA 40            [ 1]  464 	or	a, #0x40
      0094E1 F7               [ 1]  465 	ld	(x), a
      0094E2 81               [ 4]  466 	ret
      0094E3                        467 00102$:
                                    468 ;	lib/stm8s_i2c.c: 359: I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
      0094E3 AE 52 1C         [ 2]  469 	ldw	x, #0x521c
      0094E6 F6               [ 1]  470 	ld	a, (x)
      0094E7 A4 BF            [ 1]  471 	and	a, #0xbf
      0094E9 F7               [ 1]  472 	ld	(x), a
      0094EA 81               [ 4]  473 	ret
                                    474 ;	lib/stm8s_i2c.c: 368: uint8_t I2C_ReceiveData(void)
                                    475 ;	-----------------------------------------
                                    476 ;	 function I2C_ReceiveData
                                    477 ;	-----------------------------------------
      0094EB                        478 _I2C_ReceiveData:
                                    479 ;	lib/stm8s_i2c.c: 371: return ((uint8_t)I2C->DR);
      0094EB AE 52 16         [ 2]  480 	ldw	x, #0x5216
      0094EE F6               [ 1]  481 	ld	a, (x)
      0094EF 81               [ 4]  482 	ret
                                    483 ;	lib/stm8s_i2c.c: 381: void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
                                    484 ;	-----------------------------------------
                                    485 ;	 function I2C_Send7bitAddress
                                    486 ;	-----------------------------------------
      0094F0                        487 _I2C_Send7bitAddress:
                                    488 ;	lib/stm8s_i2c.c: 384: Address &= (uint8_t)0xFE;
      0094F0 7B 03            [ 1]  489 	ld	a, (0x03, sp)
      0094F2 A4 FE            [ 1]  490 	and	a, #0xfe
      0094F4 6B 03            [ 1]  491 	ld	(0x03, sp), a
                                    492 ;	lib/stm8s_i2c.c: 387: I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
      0094F6 7B 03            [ 1]  493 	ld	a, (0x03, sp)
      0094F8 1A 04            [ 1]  494 	or	a, (0x04, sp)
      0094FA AE 52 16         [ 2]  495 	ldw	x, #0x5216
      0094FD F7               [ 1]  496 	ld	(x), a
      0094FE 81               [ 4]  497 	ret
                                    498 ;	lib/stm8s_i2c.c: 395: void I2C_SendData(uint8_t Data)
                                    499 ;	-----------------------------------------
                                    500 ;	 function I2C_SendData
                                    501 ;	-----------------------------------------
      0094FF                        502 _I2C_SendData:
                                    503 ;	lib/stm8s_i2c.c: 398: I2C->DR = Data;
      0094FF AE 52 16         [ 2]  504 	ldw	x, #0x5216
      009502 7B 03            [ 1]  505 	ld	a, (0x03, sp)
      009504 F7               [ 1]  506 	ld	(x), a
      009505 81               [ 4]  507 	ret
                                    508 ;	lib/stm8s_i2c.c: 515: ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
                                    509 ;	-----------------------------------------
                                    510 ;	 function I2C_CheckEvent
                                    511 ;	-----------------------------------------
      009506                        512 _I2C_CheckEvent:
      009506 52 0A            [ 2]  513 	sub	sp, #10
                                    514 ;	lib/stm8s_i2c.c: 517: __IO uint16_t lastevent = 0x00;
      009508 5F               [ 1]  515 	clrw	x
      009509 1F 01            [ 2]  516 	ldw	(0x01, sp), x
                                    517 ;	lib/stm8s_i2c.c: 522: if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
      00950B 1E 0D            [ 2]  518 	ldw	x, (0x0d, sp)
      00950D A3 00 04         [ 2]  519 	cpw	x, #0x0004
      009510 26 0C            [ 1]  520 	jrne	00102$
                                    521 ;	lib/stm8s_i2c.c: 524: lastevent = I2C->SR2 & I2C_SR2_AF;
      009512 AE 52 18         [ 2]  522 	ldw	x, #0x5218
      009515 F6               [ 1]  523 	ld	a, (x)
      009516 A4 04            [ 1]  524 	and	a, #0x04
      009518 5F               [ 1]  525 	clrw	x
      009519 97               [ 1]  526 	ld	xl, a
      00951A 1F 01            [ 2]  527 	ldw	(0x01, sp), x
      00951C 20 1E            [ 2]  528 	jra	00103$
      00951E                        529 00102$:
                                    530 ;	lib/stm8s_i2c.c: 528: flag1 = I2C->SR1;
      00951E AE 52 17         [ 2]  531 	ldw	x, #0x5217
      009521 F6               [ 1]  532 	ld	a, (x)
                                    533 ;	lib/stm8s_i2c.c: 529: flag2 = I2C->SR3;
      009522 AE 52 19         [ 2]  534 	ldw	x, #0x5219
      009525 88               [ 1]  535 	push	a
      009526 F6               [ 1]  536 	ld	a, (x)
      009527 97               [ 1]  537 	ld	xl, a
      009528 84               [ 1]  538 	pop	a
                                    539 ;	lib/stm8s_i2c.c: 530: lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
      009529 0F 03            [ 1]  540 	clr	(0x03, sp)
      00952B 0F 08            [ 1]  541 	clr	(0x08, sp)
      00952D 0F 05            [ 1]  542 	clr	(0x05, sp)
      00952F 1A 08            [ 1]  543 	or	a, (0x08, sp)
      009531 6B 0A            [ 1]  544 	ld	(0x0a, sp), a
      009533 9F               [ 1]  545 	ld	a, xl
      009534 1A 05            [ 1]  546 	or	a, (0x05, sp)
      009536 6B 09            [ 1]  547 	ld	(0x09, sp), a
      009538 16 09            [ 2]  548 	ldw	y, (0x09, sp)
      00953A 17 01            [ 2]  549 	ldw	(0x01, sp), y
      00953C                        550 00103$:
                                    551 ;	lib/stm8s_i2c.c: 533: if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
      00953C 7B 02            [ 1]  552 	ld	a, (0x02, sp)
      00953E 14 0E            [ 1]  553 	and	a, (0x0e, sp)
      009540 97               [ 1]  554 	ld	xl, a
      009541 7B 01            [ 1]  555 	ld	a, (0x01, sp)
      009543 14 0D            [ 1]  556 	and	a, (0x0d, sp)
      009545 95               [ 1]  557 	ld	xh, a
      009546 13 0D            [ 2]  558 	cpw	x, (0x0d, sp)
      009548 26 03            [ 1]  559 	jrne	00105$
                                    560 ;	lib/stm8s_i2c.c: 536: status = SUCCESS;
      00954A A6 01            [ 1]  561 	ld	a, #0x01
                                    562 ;	lib/stm8s_i2c.c: 541: status = ERROR;
      00954C 21                     563 	.byte 0x21
      00954D                        564 00105$:
      00954D 4F               [ 1]  565 	clr	a
      00954E                        566 00106$:
                                    567 ;	lib/stm8s_i2c.c: 545: return status;
      00954E 5B 0A            [ 2]  568 	addw	sp, #10
      009550 81               [ 4]  569 	ret
                                    570 ;	lib/stm8s_i2c.c: 562: I2C_Event_TypeDef I2C_GetLastEvent(void)
                                    571 ;	-----------------------------------------
                                    572 ;	 function I2C_GetLastEvent
                                    573 ;	-----------------------------------------
      009551                        574 _I2C_GetLastEvent:
      009551 52 04            [ 2]  575 	sub	sp, #4
                                    576 ;	lib/stm8s_i2c.c: 564: __IO uint16_t lastevent = 0;
      009553 5F               [ 1]  577 	clrw	x
      009554 1F 03            [ 2]  578 	ldw	(0x03, sp), x
                                    579 ;	lib/stm8s_i2c.c: 568: if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
      009556 AE 52 18         [ 2]  580 	ldw	x, #0x5218
      009559 F6               [ 1]  581 	ld	a, (x)
      00955A A5 04            [ 1]  582 	bcp	a, #0x04
      00955C 27 07            [ 1]  583 	jreq	00102$
                                    584 ;	lib/stm8s_i2c.c: 570: lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
      00955E AE 00 04         [ 2]  585 	ldw	x, #0x0004
      009561 1F 03            [ 2]  586 	ldw	(0x03, sp), x
      009563 20 17            [ 2]  587 	jra	00103$
      009565                        588 00102$:
                                    589 ;	lib/stm8s_i2c.c: 575: flag1 = I2C->SR1;
      009565 AE 52 17         [ 2]  590 	ldw	x, #0x5217
      009568 F6               [ 1]  591 	ld	a, (x)
      009569 5F               [ 1]  592 	clrw	x
      00956A 97               [ 1]  593 	ld	xl, a
      00956B 1F 01            [ 2]  594 	ldw	(0x01, sp), x
                                    595 ;	lib/stm8s_i2c.c: 576: flag2 = I2C->SR3;
      00956D AE 52 19         [ 2]  596 	ldw	x, #0x5219
      009570 F6               [ 1]  597 	ld	a, (x)
      009571 95               [ 1]  598 	ld	xh, a
      009572 4F               [ 1]  599 	clr	a
                                    600 ;	lib/stm8s_i2c.c: 579: lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
      009573 4F               [ 1]  601 	clr	a
      009574 1A 02            [ 1]  602 	or	a, (0x02, sp)
      009576 02               [ 1]  603 	rlwa	x
      009577 1A 01            [ 1]  604 	or	a, (0x01, sp)
      009579 95               [ 1]  605 	ld	xh, a
      00957A 1F 03            [ 2]  606 	ldw	(0x03, sp), x
      00957C                        607 00103$:
                                    608 ;	lib/stm8s_i2c.c: 582: return (I2C_Event_TypeDef)lastevent;
      00957C 1E 03            [ 2]  609 	ldw	x, (0x03, sp)
      00957E 5B 04            [ 2]  610 	addw	sp, #4
      009580 81               [ 4]  611 	ret
                                    612 ;	lib/stm8s_i2c.c: 613: FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
                                    613 ;	-----------------------------------------
                                    614 ;	 function I2C_GetFlagStatus
                                    615 ;	-----------------------------------------
      009581                        616 _I2C_GetFlagStatus:
      009581 89               [ 2]  617 	pushw	x
                                    618 ;	lib/stm8s_i2c.c: 615: uint8_t tempreg = 0;
      009582 4F               [ 1]  619 	clr	a
      009583 97               [ 1]  620 	ld	xl, a
                                    621 ;	lib/stm8s_i2c.c: 619: regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
      009584 7B 05            [ 1]  622 	ld	a, (0x05, sp)
      009586 0F 01            [ 1]  623 	clr	(0x01, sp)
                                    624 ;	lib/stm8s_i2c.c: 621: switch (regindex)
      009588 A1 01            [ 1]  625 	cp	a, #0x01
      00958A 27 0A            [ 1]  626 	jreq	00101$
      00958C A1 02            [ 1]  627 	cp	a, #0x02
      00958E 27 0D            [ 1]  628 	jreq	00102$
      009590 A1 03            [ 1]  629 	cp	a, #0x03
      009592 27 10            [ 1]  630 	jreq	00103$
      009594 20 13            [ 2]  631 	jra	00105$
                                    632 ;	lib/stm8s_i2c.c: 624: case 0x01:
      009596                        633 00101$:
                                    634 ;	lib/stm8s_i2c.c: 625: tempreg = (uint8_t)I2C->SR1;
      009596 AE 52 17         [ 2]  635 	ldw	x, #0x5217
      009599 F6               [ 1]  636 	ld	a, (x)
      00959A 97               [ 1]  637 	ld	xl, a
                                    638 ;	lib/stm8s_i2c.c: 626: break;
      00959B 20 0C            [ 2]  639 	jra	00105$
                                    640 ;	lib/stm8s_i2c.c: 629: case 0x02:
      00959D                        641 00102$:
                                    642 ;	lib/stm8s_i2c.c: 630: tempreg = (uint8_t)I2C->SR2;
      00959D AE 52 18         [ 2]  643 	ldw	x, #0x5218
      0095A0 F6               [ 1]  644 	ld	a, (x)
      0095A1 97               [ 1]  645 	ld	xl, a
                                    646 ;	lib/stm8s_i2c.c: 631: break;
      0095A2 20 05            [ 2]  647 	jra	00105$
                                    648 ;	lib/stm8s_i2c.c: 634: case 0x03:
      0095A4                        649 00103$:
                                    650 ;	lib/stm8s_i2c.c: 635: tempreg = (uint8_t)I2C->SR3;
      0095A4 AE 52 19         [ 2]  651 	ldw	x, #0x5219
      0095A7 F6               [ 1]  652 	ld	a, (x)
      0095A8 97               [ 1]  653 	ld	xl, a
                                    654 ;	lib/stm8s_i2c.c: 640: }
      0095A9                        655 00105$:
                                    656 ;	lib/stm8s_i2c.c: 643: if ((tempreg & (uint8_t)I2C_Flag ) != 0)
      0095A9 7B 06            [ 1]  657 	ld	a, (0x06, sp)
      0095AB 89               [ 2]  658 	pushw	x
      0095AC 14 02            [ 1]  659 	and	a, (2, sp)
      0095AE 85               [ 2]  660 	popw	x
      0095AF 4D               [ 1]  661 	tnz	a
      0095B0 27 03            [ 1]  662 	jreq	00107$
                                    663 ;	lib/stm8s_i2c.c: 646: bitstatus = SET;
      0095B2 A6 01            [ 1]  664 	ld	a, #0x01
                                    665 ;	lib/stm8s_i2c.c: 651: bitstatus = RESET;
      0095B4 21                     666 	.byte 0x21
      0095B5                        667 00107$:
      0095B5 4F               [ 1]  668 	clr	a
      0095B6                        669 00108$:
                                    670 ;	lib/stm8s_i2c.c: 654: return bitstatus;
      0095B6 85               [ 2]  671 	popw	x
      0095B7 81               [ 4]  672 	ret
                                    673 ;	lib/stm8s_i2c.c: 689: void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
                                    674 ;	-----------------------------------------
                                    675 ;	 function I2C_ClearFlag
                                    676 ;	-----------------------------------------
      0095B8                        677 _I2C_ClearFlag:
                                    678 ;	lib/stm8s_i2c.c: 694: flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
      0095B8 7B 04            [ 1]  679 	ld	a, (0x04, sp)
      0095BA 97               [ 1]  680 	ld	xl, a
      0095BB 4F               [ 1]  681 	clr	a
                                    682 ;	lib/stm8s_i2c.c: 696: I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
      0095BC 95               [ 1]  683 	ld	xh, a
      0095BD 53               [ 2]  684 	cplw	x
      0095BE 9F               [ 1]  685 	ld	a, xl
      0095BF AE 52 18         [ 2]  686 	ldw	x, #0x5218
      0095C2 F7               [ 1]  687 	ld	(x), a
      0095C3 81               [ 4]  688 	ret
                                    689 ;	lib/stm8s_i2c.c: 719: ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    690 ;	-----------------------------------------
                                    691 ;	 function I2C_GetITStatus
                                    692 ;	-----------------------------------------
      0095C4                        693 _I2C_GetITStatus:
      0095C4 89               [ 2]  694 	pushw	x
                                    695 ;	lib/stm8s_i2c.c: 722: __IO uint8_t enablestatus = 0;
      0095C5 0F 01            [ 1]  696 	clr	(0x01, sp)
                                    697 ;	lib/stm8s_i2c.c: 725: tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
      0095C7 4F               [ 1]  698 	clr	a
      0095C8 7B 05            [ 1]  699 	ld	a, (0x05, sp)
      0095CA A4 07            [ 1]  700 	and	a, #0x07
      0095CC 97               [ 1]  701 	ld	xl, a
      0095CD 4F               [ 1]  702 	clr	a
      0095CE 4F               [ 1]  703 	clr	a
      0095CF 95               [ 1]  704 	ld	xh, a
                                    705 ;	lib/stm8s_i2c.c: 728: enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
      0095D0 90 AE 52 1A      [ 2]  706 	ldw	y, #0x521a
      0095D4 90 F6            [ 1]  707 	ld	a, (y)
      0095D6 89               [ 2]  708 	pushw	x
      0095D7 14 02            [ 1]  709 	and	a, (2, sp)
      0095D9 85               [ 2]  710 	popw	x
      0095DA 6B 01            [ 1]  711 	ld	(0x01, sp), a
                                    712 ;	lib/stm8s_i2c.c: 730: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      0095DC 4F               [ 1]  713 	clr	a
      0095DD 97               [ 1]  714 	ld	xl, a
      0095DE 7B 05            [ 1]  715 	ld	a, (0x05, sp)
      0095E0 A4 30            [ 1]  716 	and	a, #0x30
      0095E2 95               [ 1]  717 	ld	xh, a
                                    718 ;	lib/stm8s_i2c.c: 733: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      0095E3 7B 06            [ 1]  719 	ld	a, (0x06, sp)
      0095E5 6B 02            [ 1]  720 	ld	(0x02, sp), a
                                    721 ;	lib/stm8s_i2c.c: 730: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      0095E7 A3 01 00         [ 2]  722 	cpw	x, #0x0100
      0095EA 26 14            [ 1]  723 	jrne	00110$
                                    724 ;	lib/stm8s_i2c.c: 733: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      0095EC AE 52 17         [ 2]  725 	ldw	x, #0x5217
      0095EF F6               [ 1]  726 	ld	a, (x)
      0095F0 14 02            [ 1]  727 	and	a, (0x02, sp)
      0095F2 4D               [ 1]  728 	tnz	a
      0095F3 27 08            [ 1]  729 	jreq	00102$
      0095F5 0D 01            [ 1]  730 	tnz	(0x01, sp)
      0095F7 27 04            [ 1]  731 	jreq	00102$
                                    732 ;	lib/stm8s_i2c.c: 736: bitstatus = SET;
      0095F9 A6 01            [ 1]  733 	ld	a, #0x01
      0095FB 20 14            [ 2]  734 	jra	00111$
      0095FD                        735 00102$:
                                    736 ;	lib/stm8s_i2c.c: 741: bitstatus = RESET;
      0095FD 4F               [ 1]  737 	clr	a
      0095FE 20 11            [ 2]  738 	jra	00111$
      009600                        739 00110$:
                                    740 ;	lib/stm8s_i2c.c: 747: if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      009600 AE 52 18         [ 2]  741 	ldw	x, #0x5218
      009603 F6               [ 1]  742 	ld	a, (x)
      009604 14 02            [ 1]  743 	and	a, (0x02, sp)
      009606 4D               [ 1]  744 	tnz	a
      009607 27 07            [ 1]  745 	jreq	00106$
      009609 0D 01            [ 1]  746 	tnz	(0x01, sp)
      00960B 27 03            [ 1]  747 	jreq	00106$
                                    748 ;	lib/stm8s_i2c.c: 750: bitstatus = SET;
      00960D A6 01            [ 1]  749 	ld	a, #0x01
                                    750 ;	lib/stm8s_i2c.c: 755: bitstatus = RESET;
      00960F 21                     751 	.byte 0x21
      009610                        752 00106$:
      009610 4F               [ 1]  753 	clr	a
      009611                        754 00111$:
                                    755 ;	lib/stm8s_i2c.c: 759: return  bitstatus;
      009611 85               [ 2]  756 	popw	x
      009612 81               [ 4]  757 	ret
                                    758 ;	lib/stm8s_i2c.c: 797: void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    759 ;	-----------------------------------------
                                    760 ;	 function I2C_ClearITPendingBit
                                    761 ;	-----------------------------------------
      009613                        762 _I2C_ClearITPendingBit:
                                    763 ;	lib/stm8s_i2c.c: 802: flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
      009613 7B 04            [ 1]  764 	ld	a, (0x04, sp)
      009615 97               [ 1]  765 	ld	xl, a
      009616 4F               [ 1]  766 	clr	a
                                    767 ;	lib/stm8s_i2c.c: 805: I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
      009617 95               [ 1]  768 	ld	xh, a
      009618 53               [ 2]  769 	cplw	x
      009619 9F               [ 1]  770 	ld	a, xl
      00961A AE 52 18         [ 2]  771 	ldw	x, #0x5218
      00961D F7               [ 1]  772 	ld	(x), a
      00961E 81               [ 4]  773 	ret
                                    774 	.area CODE
                                    775 	.area INITIALIZER
                                    776 	.area CABS (ABS)
