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
      00910C                         63 _I2C_DeInit:
                                     64 ;	lib/stm8s_i2c.c: 43: I2C->CR1 = I2C_CR1_RESET_VALUE;
      00910C 35 00 52 10      [ 1]   65 	mov	0x5210+0, #0x00
                                     66 ;	lib/stm8s_i2c.c: 44: I2C->CR2 = I2C_CR2_RESET_VALUE;
      009110 35 00 52 11      [ 1]   67 	mov	0x5211+0, #0x00
                                     68 ;	lib/stm8s_i2c.c: 45: I2C->FREQR = I2C_FREQR_RESET_VALUE;
      009114 35 00 52 12      [ 1]   69 	mov	0x5212+0, #0x00
                                     70 ;	lib/stm8s_i2c.c: 46: I2C->OARL = I2C_OARL_RESET_VALUE;
      009118 35 00 52 13      [ 1]   71 	mov	0x5213+0, #0x00
                                     72 ;	lib/stm8s_i2c.c: 47: I2C->OARH = I2C_OARH_RESET_VALUE;
      00911C 35 00 52 14      [ 1]   73 	mov	0x5214+0, #0x00
                                     74 ;	lib/stm8s_i2c.c: 48: I2C->ITR = I2C_ITR_RESET_VALUE;
      009120 35 00 52 1A      [ 1]   75 	mov	0x521a+0, #0x00
                                     76 ;	lib/stm8s_i2c.c: 49: I2C->CCRL = I2C_CCRL_RESET_VALUE;
      009124 35 00 52 1B      [ 1]   77 	mov	0x521b+0, #0x00
                                     78 ;	lib/stm8s_i2c.c: 50: I2C->CCRH = I2C_CCRH_RESET_VALUE;
      009128 35 00 52 1C      [ 1]   79 	mov	0x521c+0, #0x00
                                     80 ;	lib/stm8s_i2c.c: 51: I2C->TRISER = I2C_TRISER_RESET_VALUE;
      00912C 35 02 52 1D      [ 1]   81 	mov	0x521d+0, #0x02
      009130 81               [ 4]   82 	ret
                                     83 ;	lib/stm8s_i2c.c: 70: void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
                                     84 ;	-----------------------------------------
                                     85 ;	 function I2C_Init
                                     86 ;	-----------------------------------------
      009131                         87 _I2C_Init:
      009131 52 0A            [ 2]   88 	sub	sp, #10
                                     89 ;	lib/stm8s_i2c.c: 76: uint8_t tmpccrh = 0;
      009133 0F 03            [ 1]   90 	clr	(0x03, sp)
                                     91 ;	lib/stm8s_i2c.c: 82: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
      009135 AE 52 12         [ 2]   92 	ldw	x, #0x5212
      009138 F6               [ 1]   93 	ld	a, (x)
      009139 A4 C0            [ 1]   94 	and	a, #0xc0
      00913B F7               [ 1]   95 	ld	(x), a
                                     96 ;	lib/stm8s_i2c.c: 84: I2C->FREQR |= InputClockFrequencyMHz;
      00913C AE 52 12         [ 2]   97 	ldw	x, #0x5212
      00913F F6               [ 1]   98 	ld	a, (x)
      009140 1A 16            [ 1]   99 	or	a, (0x16, sp)
      009142 AE 52 12         [ 2]  100 	ldw	x, #0x5212
      009145 F7               [ 1]  101 	ld	(x), a
                                    102 ;	lib/stm8s_i2c.c: 88: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      009146 72 11 52 10      [ 1]  103 	bres	0x5210, #0
                                    104 ;	lib/stm8s_i2c.c: 91: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
      00914A AE 52 1C         [ 2]  105 	ldw	x, #0x521c
      00914D F6               [ 1]  106 	ld	a, (x)
      00914E A4 30            [ 1]  107 	and	a, #0x30
      009150 F7               [ 1]  108 	ld	(x), a
                                    109 ;	lib/stm8s_i2c.c: 92: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
      009151 AE 52 1B         [ 2]  110 	ldw	x, #0x521b
      009154 F6               [ 1]  111 	ld	a, (x)
      009155 35 00 52 1B      [ 1]  112 	mov	0x521b+0, #0x00
                                    113 ;	lib/stm8s_i2c.c: 103: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      009159 5F               [ 1]  114 	clrw	x
      00915A 7B 16            [ 1]  115 	ld	a, (0x16, sp)
      00915C 97               [ 1]  116 	ld	xl, a
      00915D 90 5F            [ 1]  117 	clrw	y
      00915F 89               [ 2]  118 	pushw	x
      009160 90 89            [ 2]  119 	pushw	y
      009162 4B 40            [ 1]  120 	push	#0x40
      009164 4B 42            [ 1]  121 	push	#0x42
      009166 4B 0F            [ 1]  122 	push	#0x0f
      009168 4B 00            [ 1]  123 	push	#0x00
      00916A CD 96 C3         [ 4]  124 	call	__mullong
      00916D 5B 08            [ 2]  125 	addw	sp, #8
      00916F 1F 06            [ 2]  126 	ldw	(0x06, sp), x
      009171 17 04            [ 2]  127 	ldw	(0x04, sp), y
                                    128 ;	lib/stm8s_i2c.c: 95: if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
      009173 AE 86 A0         [ 2]  129 	ldw	x, #0x86a0
      009176 13 0F            [ 2]  130 	cpw	x, (0x0f, sp)
      009178 A6 01            [ 1]  131 	ld	a, #0x01
      00917A 12 0E            [ 1]  132 	sbc	a, (0x0e, sp)
      00917C 4F               [ 1]  133 	clr	a
      00917D 12 0D            [ 1]  134 	sbc	a, (0x0d, sp)
      00917F 24 77            [ 1]  135 	jrnc	00109$
                                    136 ;	lib/stm8s_i2c.c: 98: tmpccrh = I2C_CCRH_FS;
      009181 A6 80            [ 1]  137 	ld	a, #0x80
      009183 6B 03            [ 1]  138 	ld	(0x03, sp), a
                                    139 ;	lib/stm8s_i2c.c: 100: if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
      009185 0D 13            [ 1]  140 	tnz	(0x13, sp)
      009187 26 23            [ 1]  141 	jrne	00102$
                                    142 ;	lib/stm8s_i2c.c: 103: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      009189 1E 0F            [ 2]  143 	ldw	x, (0x0f, sp)
      00918B 89               [ 2]  144 	pushw	x
      00918C 1E 0F            [ 2]  145 	ldw	x, (0x0f, sp)
      00918E 89               [ 2]  146 	pushw	x
      00918F 4B 03            [ 1]  147 	push	#0x03
      009191 5F               [ 1]  148 	clrw	x
      009192 89               [ 2]  149 	pushw	x
      009193 4B 00            [ 1]  150 	push	#0x00
      009195 CD 96 C3         [ 4]  151 	call	__mullong
      009198 5B 08            [ 2]  152 	addw	sp, #8
      00919A 89               [ 2]  153 	pushw	x
      00919B 90 89            [ 2]  154 	pushw	y
      00919D 1E 0A            [ 2]  155 	ldw	x, (0x0a, sp)
      00919F 89               [ 2]  156 	pushw	x
      0091A0 1E 0A            [ 2]  157 	ldw	x, (0x0a, sp)
      0091A2 89               [ 2]  158 	pushw	x
      0091A3 CD 96 48         [ 4]  159 	call	__divulong
      0091A6 5B 08            [ 2]  160 	addw	sp, #8
      0091A8 1F 01            [ 2]  161 	ldw	(0x01, sp), x
      0091AA 20 28            [ 2]  162 	jra	00103$
      0091AC                        163 00102$:
                                    164 ;	lib/stm8s_i2c.c: 108: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
      0091AC 1E 0F            [ 2]  165 	ldw	x, (0x0f, sp)
      0091AE 89               [ 2]  166 	pushw	x
      0091AF 1E 0F            [ 2]  167 	ldw	x, (0x0f, sp)
      0091B1 89               [ 2]  168 	pushw	x
      0091B2 4B 19            [ 1]  169 	push	#0x19
      0091B4 5F               [ 1]  170 	clrw	x
      0091B5 89               [ 2]  171 	pushw	x
      0091B6 4B 00            [ 1]  172 	push	#0x00
      0091B8 CD 96 C3         [ 4]  173 	call	__mullong
      0091BB 5B 08            [ 2]  174 	addw	sp, #8
      0091BD 9F               [ 1]  175 	ld	a, xl
      0091BE 88               [ 1]  176 	push	a
      0091BF 9E               [ 1]  177 	ld	a, xh
      0091C0 88               [ 1]  178 	push	a
      0091C1 90 89            [ 2]  179 	pushw	y
      0091C3 1E 0A            [ 2]  180 	ldw	x, (0x0a, sp)
      0091C5 89               [ 2]  181 	pushw	x
      0091C6 1E 0A            [ 2]  182 	ldw	x, (0x0a, sp)
      0091C8 89               [ 2]  183 	pushw	x
      0091C9 CD 96 48         [ 4]  184 	call	__divulong
      0091CC 5B 08            [ 2]  185 	addw	sp, #8
      0091CE 1F 01            [ 2]  186 	ldw	(0x01, sp), x
                                    187 ;	lib/stm8s_i2c.c: 110: tmpccrh |= I2C_CCRH_DUTY;
      0091D0 A6 C0            [ 1]  188 	ld	a, #0xc0
      0091D2 6B 03            [ 1]  189 	ld	(0x03, sp), a
      0091D4                        190 00103$:
                                    191 ;	lib/stm8s_i2c.c: 114: if (result < (uint16_t)0x01)
      0091D4 1E 01            [ 2]  192 	ldw	x, (0x01, sp)
      0091D6 A3 00 01         [ 2]  193 	cpw	x, #0x0001
      0091D9 24 05            [ 1]  194 	jrnc	00105$
                                    195 ;	lib/stm8s_i2c.c: 117: result = (uint16_t)0x0001;
      0091DB AE 00 01         [ 2]  196 	ldw	x, #0x0001
      0091DE 1F 01            [ 2]  197 	ldw	(0x01, sp), x
      0091E0                        198 00105$:
                                    199 ;	lib/stm8s_i2c.c: 123: tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
      0091E0 7B 16            [ 1]  200 	ld	a, (0x16, sp)
      0091E2 97               [ 1]  201 	ld	xl, a
      0091E3 A6 03            [ 1]  202 	ld	a, #0x03
      0091E5 42               [ 4]  203 	mul	x, a
      0091E6 4B 0A            [ 1]  204 	push	#0x0a
      0091E8 4B 00            [ 1]  205 	push	#0x00
      0091EA 89               [ 2]  206 	pushw	x
      0091EB CD 97 3F         [ 4]  207 	call	__divsint
      0091EE 5B 04            [ 2]  208 	addw	sp, #4
      0091F0 5C               [ 2]  209 	incw	x
      0091F1 9F               [ 1]  210 	ld	a, xl
                                    211 ;	lib/stm8s_i2c.c: 124: I2C->TRISER = (uint8_t)tmpval;
      0091F2 AE 52 1D         [ 2]  212 	ldw	x, #0x521d
      0091F5 F7               [ 1]  213 	ld	(x), a
      0091F6 20 2A            [ 2]  214 	jra	00110$
      0091F8                        215 00109$:
                                    216 ;	lib/stm8s_i2c.c: 131: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
      0091F8 1E 0F            [ 2]  217 	ldw	x, (0x0f, sp)
      0091FA 16 0D            [ 2]  218 	ldw	y, (0x0d, sp)
      0091FC 58               [ 2]  219 	sllw	x
      0091FD 90 59            [ 2]  220 	rlcw	y
      0091FF 89               [ 2]  221 	pushw	x
      009200 90 89            [ 2]  222 	pushw	y
      009202 1E 0A            [ 2]  223 	ldw	x, (0x0a, sp)
      009204 89               [ 2]  224 	pushw	x
      009205 1E 0A            [ 2]  225 	ldw	x, (0x0a, sp)
      009207 89               [ 2]  226 	pushw	x
      009208 CD 96 48         [ 4]  227 	call	__divulong
      00920B 5B 08            [ 2]  228 	addw	sp, #8
      00920D 1F 01            [ 2]  229 	ldw	(0x01, sp), x
                                    230 ;	lib/stm8s_i2c.c: 134: if (result < (uint16_t)0x0004)
      00920F 1E 01            [ 2]  231 	ldw	x, (0x01, sp)
      009211 A3 00 04         [ 2]  232 	cpw	x, #0x0004
      009214 24 05            [ 1]  233 	jrnc	00107$
                                    234 ;	lib/stm8s_i2c.c: 137: result = (uint16_t)0x0004;
      009216 AE 00 04         [ 2]  235 	ldw	x, #0x0004
      009219 1F 01            [ 2]  236 	ldw	(0x01, sp), x
      00921B                        237 00107$:
                                    238 ;	lib/stm8s_i2c.c: 143: I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
      00921B 7B 16            [ 1]  239 	ld	a, (0x16, sp)
      00921D 4C               [ 1]  240 	inc	a
      00921E AE 52 1D         [ 2]  241 	ldw	x, #0x521d
      009221 F7               [ 1]  242 	ld	(x), a
      009222                        243 00110$:
                                    244 ;	lib/stm8s_i2c.c: 148: I2C->CCRL = (uint8_t)result;
      009222 7B 02            [ 1]  245 	ld	a, (0x02, sp)
      009224 AE 52 1B         [ 2]  246 	ldw	x, #0x521b
      009227 F7               [ 1]  247 	ld	(x), a
                                    248 ;	lib/stm8s_i2c.c: 149: I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
      009228 7B 01            [ 1]  249 	ld	a, (0x01, sp)
      00922A 0F 09            [ 1]  250 	clr	(0x09, sp)
      00922C A4 0F            [ 1]  251 	and	a, #0x0f
      00922E 1A 03            [ 1]  252 	or	a, (0x03, sp)
      009230 AE 52 1C         [ 2]  253 	ldw	x, #0x521c
      009233 F7               [ 1]  254 	ld	(x), a
                                    255 ;	lib/stm8s_i2c.c: 152: I2C->CR1 |= I2C_CR1_PE;
      009234 72 10 52 10      [ 1]  256 	bset	0x5210, #0
                                    257 ;	lib/stm8s_i2c.c: 155: I2C_AcknowledgeConfig(Ack);
      009238 7B 14            [ 1]  258 	ld	a, (0x14, sp)
      00923A 88               [ 1]  259 	push	a
      00923B CD 92 BF         [ 4]  260 	call	_I2C_AcknowledgeConfig
      00923E 84               [ 1]  261 	pop	a
                                    262 ;	lib/stm8s_i2c.c: 158: I2C->OARL = (uint8_t)(OwnAddress);
      00923F 7B 12            [ 1]  263 	ld	a, (0x12, sp)
      009241 AE 52 13         [ 2]  264 	ldw	x, #0x5213
      009244 F7               [ 1]  265 	ld	(x), a
                                    266 ;	lib/stm8s_i2c.c: 159: I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
      009245 7B 15            [ 1]  267 	ld	a, (0x15, sp)
      009247 AA 40            [ 1]  268 	or	a, #0x40
      009249 6B 08            [ 1]  269 	ld	(0x08, sp), a
                                    270 ;	lib/stm8s_i2c.c: 160: (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
      00924B 4F               [ 1]  271 	clr	a
      00924C 97               [ 1]  272 	ld	xl, a
      00924D 7B 11            [ 1]  273 	ld	a, (0x11, sp)
      00924F A4 03            [ 1]  274 	and	a, #0x03
      009251 95               [ 1]  275 	ld	xh, a
      009252 A6 80            [ 1]  276 	ld	a, #0x80
      009254 62               [ 2]  277 	div	x, a
      009255 9F               [ 1]  278 	ld	a, xl
      009256 1A 08            [ 1]  279 	or	a, (0x08, sp)
      009258 AE 52 14         [ 2]  280 	ldw	x, #0x5214
      00925B F7               [ 1]  281 	ld	(x), a
      00925C 5B 0A            [ 2]  282 	addw	sp, #10
      00925E 81               [ 4]  283 	ret
                                    284 ;	lib/stm8s_i2c.c: 169: void I2C_Cmd(FunctionalState NewState)
                                    285 ;	-----------------------------------------
                                    286 ;	 function I2C_Cmd
                                    287 ;	-----------------------------------------
      00925F                        288 _I2C_Cmd:
                                    289 ;	lib/stm8s_i2c.c: 171: if (NewState != DISABLE)
      00925F 0D 03            [ 1]  290 	tnz	(0x03, sp)
      009261 27 05            [ 1]  291 	jreq	00102$
                                    292 ;	lib/stm8s_i2c.c: 174: I2C->CR1 |= I2C_CR1_PE;
      009263 72 10 52 10      [ 1]  293 	bset	0x5210, #0
      009267 81               [ 4]  294 	ret
      009268                        295 00102$:
                                    296 ;	lib/stm8s_i2c.c: 179: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      009268 72 11 52 10      [ 1]  297 	bres	0x5210, #0
      00926C 81               [ 4]  298 	ret
                                    299 ;	lib/stm8s_i2c.c: 189: void I2C_GeneralCallCmd(FunctionalState NewState)
                                    300 ;	-----------------------------------------
                                    301 ;	 function I2C_GeneralCallCmd
                                    302 ;	-----------------------------------------
      00926D                        303 _I2C_GeneralCallCmd:
                                    304 ;	lib/stm8s_i2c.c: 191: if (NewState != DISABLE)
      00926D 0D 03            [ 1]  305 	tnz	(0x03, sp)
      00926F 27 08            [ 1]  306 	jreq	00102$
                                    307 ;	lib/stm8s_i2c.c: 194: I2C->CR1 |= I2C_CR1_ENGC;
      009271 AE 52 10         [ 2]  308 	ldw	x, #0x5210
      009274 F6               [ 1]  309 	ld	a, (x)
      009275 AA 40            [ 1]  310 	or	a, #0x40
      009277 F7               [ 1]  311 	ld	(x), a
      009278 81               [ 4]  312 	ret
      009279                        313 00102$:
                                    314 ;	lib/stm8s_i2c.c: 199: I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
      009279 AE 52 10         [ 2]  315 	ldw	x, #0x5210
      00927C F6               [ 1]  316 	ld	a, (x)
      00927D A4 BF            [ 1]  317 	and	a, #0xbf
      00927F F7               [ 1]  318 	ld	(x), a
      009280 81               [ 4]  319 	ret
                                    320 ;	lib/stm8s_i2c.c: 211: void I2C_GenerateSTART(FunctionalState NewState)
                                    321 ;	-----------------------------------------
                                    322 ;	 function I2C_GenerateSTART
                                    323 ;	-----------------------------------------
      009281                        324 _I2C_GenerateSTART:
                                    325 ;	lib/stm8s_i2c.c: 214: if (NewState != DISABLE)
      009281 0D 03            [ 1]  326 	tnz	(0x03, sp)
      009283 27 05            [ 1]  327 	jreq	00102$
                                    328 ;	lib/stm8s_i2c.c: 217: I2C->CR2 |= I2C_CR2_START;
      009285 72 10 52 11      [ 1]  329 	bset	0x5211, #0
      009289 81               [ 4]  330 	ret
      00928A                        331 00102$:
                                    332 ;	lib/stm8s_i2c.c: 222: I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
      00928A 72 11 52 11      [ 1]  333 	bres	0x5211, #0
      00928E 81               [ 4]  334 	ret
                                    335 ;	lib/stm8s_i2c.c: 232: void I2C_GenerateSTOP(FunctionalState NewState)
                                    336 ;	-----------------------------------------
                                    337 ;	 function I2C_GenerateSTOP
                                    338 ;	-----------------------------------------
      00928F                        339 _I2C_GenerateSTOP:
                                    340 ;	lib/stm8s_i2c.c: 234: if (NewState != DISABLE)
      00928F 0D 03            [ 1]  341 	tnz	(0x03, sp)
      009291 27 08            [ 1]  342 	jreq	00102$
                                    343 ;	lib/stm8s_i2c.c: 237: I2C->CR2 |= I2C_CR2_STOP;
      009293 AE 52 11         [ 2]  344 	ldw	x, #0x5211
      009296 F6               [ 1]  345 	ld	a, (x)
      009297 AA 02            [ 1]  346 	or	a, #0x02
      009299 F7               [ 1]  347 	ld	(x), a
      00929A 81               [ 4]  348 	ret
      00929B                        349 00102$:
                                    350 ;	lib/stm8s_i2c.c: 242: I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
      00929B AE 52 11         [ 2]  351 	ldw	x, #0x5211
      00929E F6               [ 1]  352 	ld	a, (x)
      00929F A4 FD            [ 1]  353 	and	a, #0xfd
      0092A1 F7               [ 1]  354 	ld	(x), a
      0092A2 81               [ 4]  355 	ret
                                    356 ;	lib/stm8s_i2c.c: 252: void I2C_SoftwareResetCmd(FunctionalState NewState)
                                    357 ;	-----------------------------------------
                                    358 ;	 function I2C_SoftwareResetCmd
                                    359 ;	-----------------------------------------
      0092A3                        360 _I2C_SoftwareResetCmd:
                                    361 ;	lib/stm8s_i2c.c: 255: if (NewState != DISABLE)
      0092A3 0D 03            [ 1]  362 	tnz	(0x03, sp)
      0092A5 27 05            [ 1]  363 	jreq	00102$
                                    364 ;	lib/stm8s_i2c.c: 258: I2C->CR2 |= I2C_CR2_SWRST;
      0092A7 72 1E 52 11      [ 1]  365 	bset	0x5211, #7
      0092AB 81               [ 4]  366 	ret
      0092AC                        367 00102$:
                                    368 ;	lib/stm8s_i2c.c: 263: I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
      0092AC 72 1F 52 11      [ 1]  369 	bres	0x5211, #7
      0092B0 81               [ 4]  370 	ret
                                    371 ;	lib/stm8s_i2c.c: 274: void I2C_StretchClockCmd(FunctionalState NewState)
                                    372 ;	-----------------------------------------
                                    373 ;	 function I2C_StretchClockCmd
                                    374 ;	-----------------------------------------
      0092B1                        375 _I2C_StretchClockCmd:
                                    376 ;	lib/stm8s_i2c.c: 276: if (NewState != DISABLE)
      0092B1 0D 03            [ 1]  377 	tnz	(0x03, sp)
      0092B3 27 05            [ 1]  378 	jreq	00102$
                                    379 ;	lib/stm8s_i2c.c: 279: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
      0092B5 72 1F 52 10      [ 1]  380 	bres	0x5210, #7
      0092B9 81               [ 4]  381 	ret
      0092BA                        382 00102$:
                                    383 ;	lib/stm8s_i2c.c: 285: I2C->CR1 |= I2C_CR1_NOSTRETCH;
      0092BA 72 1E 52 10      [ 1]  384 	bset	0x5210, #7
      0092BE 81               [ 4]  385 	ret
                                    386 ;	lib/stm8s_i2c.c: 296: void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
                                    387 ;	-----------------------------------------
                                    388 ;	 function I2C_AcknowledgeConfig
                                    389 ;	-----------------------------------------
      0092BF                        390 _I2C_AcknowledgeConfig:
                                    391 ;	lib/stm8s_i2c.c: 298: if (Ack == I2C_ACK_NONE)
      0092BF 0D 03            [ 1]  392 	tnz	(0x03, sp)
      0092C1 26 08            [ 1]  393 	jrne	00105$
                                    394 ;	lib/stm8s_i2c.c: 301: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      0092C3 AE 52 11         [ 2]  395 	ldw	x, #0x5211
      0092C6 F6               [ 1]  396 	ld	a, (x)
      0092C7 A4 FB            [ 1]  397 	and	a, #0xfb
      0092C9 F7               [ 1]  398 	ld	(x), a
      0092CA 81               [ 4]  399 	ret
      0092CB                        400 00105$:
                                    401 ;	lib/stm8s_i2c.c: 306: I2C->CR2 |= I2C_CR2_ACK;
      0092CB AE 52 11         [ 2]  402 	ldw	x, #0x5211
      0092CE F6               [ 1]  403 	ld	a, (x)
      0092CF AA 04            [ 1]  404 	or	a, #0x04
      0092D1 F7               [ 1]  405 	ld	(x), a
                                    406 ;	lib/stm8s_i2c.c: 308: if (Ack == I2C_ACK_CURR)
      0092D2 7B 03            [ 1]  407 	ld	a, (0x03, sp)
      0092D4 A1 01            [ 1]  408 	cp	a, #0x01
      0092D6 26 08            [ 1]  409 	jrne	00102$
                                    410 ;	lib/stm8s_i2c.c: 311: I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
      0092D8 AE 52 11         [ 2]  411 	ldw	x, #0x5211
      0092DB F6               [ 1]  412 	ld	a, (x)
      0092DC A4 F7            [ 1]  413 	and	a, #0xf7
      0092DE F7               [ 1]  414 	ld	(x), a
      0092DF 81               [ 4]  415 	ret
      0092E0                        416 00102$:
                                    417 ;	lib/stm8s_i2c.c: 316: I2C->CR2 |= I2C_CR2_POS;
      0092E0 AE 52 11         [ 2]  418 	ldw	x, #0x5211
      0092E3 F6               [ 1]  419 	ld	a, (x)
      0092E4 AA 08            [ 1]  420 	or	a, #0x08
      0092E6 F7               [ 1]  421 	ld	(x), a
      0092E7 81               [ 4]  422 	ret
                                    423 ;	lib/stm8s_i2c.c: 329: void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
                                    424 ;	-----------------------------------------
                                    425 ;	 function I2C_ITConfig
                                    426 ;	-----------------------------------------
      0092E8                        427 _I2C_ITConfig:
      0092E8 88               [ 1]  428 	push	a
                                    429 ;	lib/stm8s_i2c.c: 331: if (NewState != DISABLE)
      0092E9 0D 05            [ 1]  430 	tnz	(0x05, sp)
      0092EB 27 0C            [ 1]  431 	jreq	00102$
                                    432 ;	lib/stm8s_i2c.c: 334: I2C->ITR |= (uint8_t)I2C_IT;
      0092ED AE 52 1A         [ 2]  433 	ldw	x, #0x521a
      0092F0 F6               [ 1]  434 	ld	a, (x)
      0092F1 1A 04            [ 1]  435 	or	a, (0x04, sp)
      0092F3 AE 52 1A         [ 2]  436 	ldw	x, #0x521a
      0092F6 F7               [ 1]  437 	ld	(x), a
      0092F7 20 0F            [ 2]  438 	jra	00104$
      0092F9                        439 00102$:
                                    440 ;	lib/stm8s_i2c.c: 339: I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
      0092F9 AE 52 1A         [ 2]  441 	ldw	x, #0x521a
      0092FC F6               [ 1]  442 	ld	a, (x)
      0092FD 6B 01            [ 1]  443 	ld	(0x01, sp), a
      0092FF 7B 04            [ 1]  444 	ld	a, (0x04, sp)
      009301 43               [ 1]  445 	cpl	a
      009302 14 01            [ 1]  446 	and	a, (0x01, sp)
      009304 AE 52 1A         [ 2]  447 	ldw	x, #0x521a
      009307 F7               [ 1]  448 	ld	(x), a
      009308                        449 00104$:
      009308 84               [ 1]  450 	pop	a
      009309 81               [ 4]  451 	ret
                                    452 ;	lib/stm8s_i2c.c: 349: void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
                                    453 ;	-----------------------------------------
                                    454 ;	 function I2C_FastModeDutyCycleConfig
                                    455 ;	-----------------------------------------
      00930A                        456 _I2C_FastModeDutyCycleConfig:
                                    457 ;	lib/stm8s_i2c.c: 351: if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
      00930A 7B 03            [ 1]  458 	ld	a, (0x03, sp)
      00930C A1 40            [ 1]  459 	cp	a, #0x40
      00930E 26 08            [ 1]  460 	jrne	00102$
                                    461 ;	lib/stm8s_i2c.c: 354: I2C->CCRH |= I2C_CCRH_DUTY;
      009310 AE 52 1C         [ 2]  462 	ldw	x, #0x521c
      009313 F6               [ 1]  463 	ld	a, (x)
      009314 AA 40            [ 1]  464 	or	a, #0x40
      009316 F7               [ 1]  465 	ld	(x), a
      009317 81               [ 4]  466 	ret
      009318                        467 00102$:
                                    468 ;	lib/stm8s_i2c.c: 359: I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
      009318 AE 52 1C         [ 2]  469 	ldw	x, #0x521c
      00931B F6               [ 1]  470 	ld	a, (x)
      00931C A4 BF            [ 1]  471 	and	a, #0xbf
      00931E F7               [ 1]  472 	ld	(x), a
      00931F 81               [ 4]  473 	ret
                                    474 ;	lib/stm8s_i2c.c: 368: uint8_t I2C_ReceiveData(void)
                                    475 ;	-----------------------------------------
                                    476 ;	 function I2C_ReceiveData
                                    477 ;	-----------------------------------------
      009320                        478 _I2C_ReceiveData:
                                    479 ;	lib/stm8s_i2c.c: 371: return ((uint8_t)I2C->DR);
      009320 AE 52 16         [ 2]  480 	ldw	x, #0x5216
      009323 F6               [ 1]  481 	ld	a, (x)
      009324 81               [ 4]  482 	ret
                                    483 ;	lib/stm8s_i2c.c: 381: void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
                                    484 ;	-----------------------------------------
                                    485 ;	 function I2C_Send7bitAddress
                                    486 ;	-----------------------------------------
      009325                        487 _I2C_Send7bitAddress:
                                    488 ;	lib/stm8s_i2c.c: 384: Address &= (uint8_t)0xFE;
      009325 7B 03            [ 1]  489 	ld	a, (0x03, sp)
      009327 A4 FE            [ 1]  490 	and	a, #0xfe
      009329 6B 03            [ 1]  491 	ld	(0x03, sp), a
                                    492 ;	lib/stm8s_i2c.c: 387: I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
      00932B 7B 03            [ 1]  493 	ld	a, (0x03, sp)
      00932D 1A 04            [ 1]  494 	or	a, (0x04, sp)
      00932F AE 52 16         [ 2]  495 	ldw	x, #0x5216
      009332 F7               [ 1]  496 	ld	(x), a
      009333 81               [ 4]  497 	ret
                                    498 ;	lib/stm8s_i2c.c: 395: void I2C_SendData(uint8_t Data)
                                    499 ;	-----------------------------------------
                                    500 ;	 function I2C_SendData
                                    501 ;	-----------------------------------------
      009334                        502 _I2C_SendData:
                                    503 ;	lib/stm8s_i2c.c: 398: I2C->DR = Data;
      009334 AE 52 16         [ 2]  504 	ldw	x, #0x5216
      009337 7B 03            [ 1]  505 	ld	a, (0x03, sp)
      009339 F7               [ 1]  506 	ld	(x), a
      00933A 81               [ 4]  507 	ret
                                    508 ;	lib/stm8s_i2c.c: 515: ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
                                    509 ;	-----------------------------------------
                                    510 ;	 function I2C_CheckEvent
                                    511 ;	-----------------------------------------
      00933B                        512 _I2C_CheckEvent:
      00933B 52 0A            [ 2]  513 	sub	sp, #10
                                    514 ;	lib/stm8s_i2c.c: 517: __IO uint16_t lastevent = 0x00;
      00933D 5F               [ 1]  515 	clrw	x
      00933E 1F 01            [ 2]  516 	ldw	(0x01, sp), x
                                    517 ;	lib/stm8s_i2c.c: 522: if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
      009340 1E 0D            [ 2]  518 	ldw	x, (0x0d, sp)
      009342 A3 00 04         [ 2]  519 	cpw	x, #0x0004
      009345 26 0C            [ 1]  520 	jrne	00102$
                                    521 ;	lib/stm8s_i2c.c: 524: lastevent = I2C->SR2 & I2C_SR2_AF;
      009347 AE 52 18         [ 2]  522 	ldw	x, #0x5218
      00934A F6               [ 1]  523 	ld	a, (x)
      00934B A4 04            [ 1]  524 	and	a, #0x04
      00934D 5F               [ 1]  525 	clrw	x
      00934E 97               [ 1]  526 	ld	xl, a
      00934F 1F 01            [ 2]  527 	ldw	(0x01, sp), x
      009351 20 1E            [ 2]  528 	jra	00103$
      009353                        529 00102$:
                                    530 ;	lib/stm8s_i2c.c: 528: flag1 = I2C->SR1;
      009353 AE 52 17         [ 2]  531 	ldw	x, #0x5217
      009356 F6               [ 1]  532 	ld	a, (x)
                                    533 ;	lib/stm8s_i2c.c: 529: flag2 = I2C->SR3;
      009357 AE 52 19         [ 2]  534 	ldw	x, #0x5219
      00935A 88               [ 1]  535 	push	a
      00935B F6               [ 1]  536 	ld	a, (x)
      00935C 97               [ 1]  537 	ld	xl, a
      00935D 84               [ 1]  538 	pop	a
                                    539 ;	lib/stm8s_i2c.c: 530: lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
      00935E 0F 03            [ 1]  540 	clr	(0x03, sp)
      009360 0F 08            [ 1]  541 	clr	(0x08, sp)
      009362 0F 05            [ 1]  542 	clr	(0x05, sp)
      009364 1A 08            [ 1]  543 	or	a, (0x08, sp)
      009366 6B 0A            [ 1]  544 	ld	(0x0a, sp), a
      009368 9F               [ 1]  545 	ld	a, xl
      009369 1A 05            [ 1]  546 	or	a, (0x05, sp)
      00936B 6B 09            [ 1]  547 	ld	(0x09, sp), a
      00936D 16 09            [ 2]  548 	ldw	y, (0x09, sp)
      00936F 17 01            [ 2]  549 	ldw	(0x01, sp), y
      009371                        550 00103$:
                                    551 ;	lib/stm8s_i2c.c: 533: if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
      009371 7B 02            [ 1]  552 	ld	a, (0x02, sp)
      009373 14 0E            [ 1]  553 	and	a, (0x0e, sp)
      009375 97               [ 1]  554 	ld	xl, a
      009376 7B 01            [ 1]  555 	ld	a, (0x01, sp)
      009378 14 0D            [ 1]  556 	and	a, (0x0d, sp)
      00937A 95               [ 1]  557 	ld	xh, a
      00937B 13 0D            [ 2]  558 	cpw	x, (0x0d, sp)
      00937D 26 03            [ 1]  559 	jrne	00105$
                                    560 ;	lib/stm8s_i2c.c: 536: status = SUCCESS;
      00937F A6 01            [ 1]  561 	ld	a, #0x01
                                    562 ;	lib/stm8s_i2c.c: 541: status = ERROR;
      009381 21                     563 	.byte 0x21
      009382                        564 00105$:
      009382 4F               [ 1]  565 	clr	a
      009383                        566 00106$:
                                    567 ;	lib/stm8s_i2c.c: 545: return status;
      009383 5B 0A            [ 2]  568 	addw	sp, #10
      009385 81               [ 4]  569 	ret
                                    570 ;	lib/stm8s_i2c.c: 562: I2C_Event_TypeDef I2C_GetLastEvent(void)
                                    571 ;	-----------------------------------------
                                    572 ;	 function I2C_GetLastEvent
                                    573 ;	-----------------------------------------
      009386                        574 _I2C_GetLastEvent:
      009386 52 04            [ 2]  575 	sub	sp, #4
                                    576 ;	lib/stm8s_i2c.c: 564: __IO uint16_t lastevent = 0;
      009388 5F               [ 1]  577 	clrw	x
      009389 1F 03            [ 2]  578 	ldw	(0x03, sp), x
                                    579 ;	lib/stm8s_i2c.c: 568: if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
      00938B AE 52 18         [ 2]  580 	ldw	x, #0x5218
      00938E F6               [ 1]  581 	ld	a, (x)
      00938F A5 04            [ 1]  582 	bcp	a, #0x04
      009391 27 07            [ 1]  583 	jreq	00102$
                                    584 ;	lib/stm8s_i2c.c: 570: lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
      009393 AE 00 04         [ 2]  585 	ldw	x, #0x0004
      009396 1F 03            [ 2]  586 	ldw	(0x03, sp), x
      009398 20 17            [ 2]  587 	jra	00103$
      00939A                        588 00102$:
                                    589 ;	lib/stm8s_i2c.c: 575: flag1 = I2C->SR1;
      00939A AE 52 17         [ 2]  590 	ldw	x, #0x5217
      00939D F6               [ 1]  591 	ld	a, (x)
      00939E 5F               [ 1]  592 	clrw	x
      00939F 97               [ 1]  593 	ld	xl, a
      0093A0 1F 01            [ 2]  594 	ldw	(0x01, sp), x
                                    595 ;	lib/stm8s_i2c.c: 576: flag2 = I2C->SR3;
      0093A2 AE 52 19         [ 2]  596 	ldw	x, #0x5219
      0093A5 F6               [ 1]  597 	ld	a, (x)
      0093A6 95               [ 1]  598 	ld	xh, a
      0093A7 4F               [ 1]  599 	clr	a
                                    600 ;	lib/stm8s_i2c.c: 579: lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
      0093A8 4F               [ 1]  601 	clr	a
      0093A9 1A 02            [ 1]  602 	or	a, (0x02, sp)
      0093AB 02               [ 1]  603 	rlwa	x
      0093AC 1A 01            [ 1]  604 	or	a, (0x01, sp)
      0093AE 95               [ 1]  605 	ld	xh, a
      0093AF 1F 03            [ 2]  606 	ldw	(0x03, sp), x
      0093B1                        607 00103$:
                                    608 ;	lib/stm8s_i2c.c: 582: return (I2C_Event_TypeDef)lastevent;
      0093B1 1E 03            [ 2]  609 	ldw	x, (0x03, sp)
      0093B3 5B 04            [ 2]  610 	addw	sp, #4
      0093B5 81               [ 4]  611 	ret
                                    612 ;	lib/stm8s_i2c.c: 613: FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
                                    613 ;	-----------------------------------------
                                    614 ;	 function I2C_GetFlagStatus
                                    615 ;	-----------------------------------------
      0093B6                        616 _I2C_GetFlagStatus:
      0093B6 89               [ 2]  617 	pushw	x
                                    618 ;	lib/stm8s_i2c.c: 615: uint8_t tempreg = 0;
      0093B7 4F               [ 1]  619 	clr	a
      0093B8 97               [ 1]  620 	ld	xl, a
                                    621 ;	lib/stm8s_i2c.c: 619: regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
      0093B9 7B 05            [ 1]  622 	ld	a, (0x05, sp)
      0093BB 0F 01            [ 1]  623 	clr	(0x01, sp)
                                    624 ;	lib/stm8s_i2c.c: 621: switch (regindex)
      0093BD A1 01            [ 1]  625 	cp	a, #0x01
      0093BF 27 0A            [ 1]  626 	jreq	00101$
      0093C1 A1 02            [ 1]  627 	cp	a, #0x02
      0093C3 27 0D            [ 1]  628 	jreq	00102$
      0093C5 A1 03            [ 1]  629 	cp	a, #0x03
      0093C7 27 10            [ 1]  630 	jreq	00103$
      0093C9 20 13            [ 2]  631 	jra	00105$
                                    632 ;	lib/stm8s_i2c.c: 624: case 0x01:
      0093CB                        633 00101$:
                                    634 ;	lib/stm8s_i2c.c: 625: tempreg = (uint8_t)I2C->SR1;
      0093CB AE 52 17         [ 2]  635 	ldw	x, #0x5217
      0093CE F6               [ 1]  636 	ld	a, (x)
      0093CF 97               [ 1]  637 	ld	xl, a
                                    638 ;	lib/stm8s_i2c.c: 626: break;
      0093D0 20 0C            [ 2]  639 	jra	00105$
                                    640 ;	lib/stm8s_i2c.c: 629: case 0x02:
      0093D2                        641 00102$:
                                    642 ;	lib/stm8s_i2c.c: 630: tempreg = (uint8_t)I2C->SR2;
      0093D2 AE 52 18         [ 2]  643 	ldw	x, #0x5218
      0093D5 F6               [ 1]  644 	ld	a, (x)
      0093D6 97               [ 1]  645 	ld	xl, a
                                    646 ;	lib/stm8s_i2c.c: 631: break;
      0093D7 20 05            [ 2]  647 	jra	00105$
                                    648 ;	lib/stm8s_i2c.c: 634: case 0x03:
      0093D9                        649 00103$:
                                    650 ;	lib/stm8s_i2c.c: 635: tempreg = (uint8_t)I2C->SR3;
      0093D9 AE 52 19         [ 2]  651 	ldw	x, #0x5219
      0093DC F6               [ 1]  652 	ld	a, (x)
      0093DD 97               [ 1]  653 	ld	xl, a
                                    654 ;	lib/stm8s_i2c.c: 640: }
      0093DE                        655 00105$:
                                    656 ;	lib/stm8s_i2c.c: 643: if ((tempreg & (uint8_t)I2C_Flag ) != 0)
      0093DE 7B 06            [ 1]  657 	ld	a, (0x06, sp)
      0093E0 89               [ 2]  658 	pushw	x
      0093E1 14 02            [ 1]  659 	and	a, (2, sp)
      0093E3 85               [ 2]  660 	popw	x
      0093E4 4D               [ 1]  661 	tnz	a
      0093E5 27 03            [ 1]  662 	jreq	00107$
                                    663 ;	lib/stm8s_i2c.c: 646: bitstatus = SET;
      0093E7 A6 01            [ 1]  664 	ld	a, #0x01
                                    665 ;	lib/stm8s_i2c.c: 651: bitstatus = RESET;
      0093E9 21                     666 	.byte 0x21
      0093EA                        667 00107$:
      0093EA 4F               [ 1]  668 	clr	a
      0093EB                        669 00108$:
                                    670 ;	lib/stm8s_i2c.c: 654: return bitstatus;
      0093EB 85               [ 2]  671 	popw	x
      0093EC 81               [ 4]  672 	ret
                                    673 ;	lib/stm8s_i2c.c: 689: void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
                                    674 ;	-----------------------------------------
                                    675 ;	 function I2C_ClearFlag
                                    676 ;	-----------------------------------------
      0093ED                        677 _I2C_ClearFlag:
                                    678 ;	lib/stm8s_i2c.c: 694: flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
      0093ED 7B 04            [ 1]  679 	ld	a, (0x04, sp)
      0093EF 97               [ 1]  680 	ld	xl, a
      0093F0 4F               [ 1]  681 	clr	a
                                    682 ;	lib/stm8s_i2c.c: 696: I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
      0093F1 95               [ 1]  683 	ld	xh, a
      0093F2 53               [ 2]  684 	cplw	x
      0093F3 9F               [ 1]  685 	ld	a, xl
      0093F4 AE 52 18         [ 2]  686 	ldw	x, #0x5218
      0093F7 F7               [ 1]  687 	ld	(x), a
      0093F8 81               [ 4]  688 	ret
                                    689 ;	lib/stm8s_i2c.c: 719: ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    690 ;	-----------------------------------------
                                    691 ;	 function I2C_GetITStatus
                                    692 ;	-----------------------------------------
      0093F9                        693 _I2C_GetITStatus:
      0093F9 89               [ 2]  694 	pushw	x
                                    695 ;	lib/stm8s_i2c.c: 722: __IO uint8_t enablestatus = 0;
      0093FA 0F 01            [ 1]  696 	clr	(0x01, sp)
                                    697 ;	lib/stm8s_i2c.c: 725: tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
      0093FC 4F               [ 1]  698 	clr	a
      0093FD 7B 05            [ 1]  699 	ld	a, (0x05, sp)
      0093FF A4 07            [ 1]  700 	and	a, #0x07
      009401 97               [ 1]  701 	ld	xl, a
      009402 4F               [ 1]  702 	clr	a
      009403 4F               [ 1]  703 	clr	a
      009404 95               [ 1]  704 	ld	xh, a
                                    705 ;	lib/stm8s_i2c.c: 728: enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
      009405 90 AE 52 1A      [ 2]  706 	ldw	y, #0x521a
      009409 90 F6            [ 1]  707 	ld	a, (y)
      00940B 89               [ 2]  708 	pushw	x
      00940C 14 02            [ 1]  709 	and	a, (2, sp)
      00940E 85               [ 2]  710 	popw	x
      00940F 6B 01            [ 1]  711 	ld	(0x01, sp), a
                                    712 ;	lib/stm8s_i2c.c: 730: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      009411 4F               [ 1]  713 	clr	a
      009412 97               [ 1]  714 	ld	xl, a
      009413 7B 05            [ 1]  715 	ld	a, (0x05, sp)
      009415 A4 30            [ 1]  716 	and	a, #0x30
      009417 95               [ 1]  717 	ld	xh, a
                                    718 ;	lib/stm8s_i2c.c: 733: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      009418 7B 06            [ 1]  719 	ld	a, (0x06, sp)
      00941A 6B 02            [ 1]  720 	ld	(0x02, sp), a
                                    721 ;	lib/stm8s_i2c.c: 730: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      00941C A3 01 00         [ 2]  722 	cpw	x, #0x0100
      00941F 26 14            [ 1]  723 	jrne	00110$
                                    724 ;	lib/stm8s_i2c.c: 733: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      009421 AE 52 17         [ 2]  725 	ldw	x, #0x5217
      009424 F6               [ 1]  726 	ld	a, (x)
      009425 14 02            [ 1]  727 	and	a, (0x02, sp)
      009427 4D               [ 1]  728 	tnz	a
      009428 27 08            [ 1]  729 	jreq	00102$
      00942A 0D 01            [ 1]  730 	tnz	(0x01, sp)
      00942C 27 04            [ 1]  731 	jreq	00102$
                                    732 ;	lib/stm8s_i2c.c: 736: bitstatus = SET;
      00942E A6 01            [ 1]  733 	ld	a, #0x01
      009430 20 14            [ 2]  734 	jra	00111$
      009432                        735 00102$:
                                    736 ;	lib/stm8s_i2c.c: 741: bitstatus = RESET;
      009432 4F               [ 1]  737 	clr	a
      009433 20 11            [ 2]  738 	jra	00111$
      009435                        739 00110$:
                                    740 ;	lib/stm8s_i2c.c: 747: if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      009435 AE 52 18         [ 2]  741 	ldw	x, #0x5218
      009438 F6               [ 1]  742 	ld	a, (x)
      009439 14 02            [ 1]  743 	and	a, (0x02, sp)
      00943B 4D               [ 1]  744 	tnz	a
      00943C 27 07            [ 1]  745 	jreq	00106$
      00943E 0D 01            [ 1]  746 	tnz	(0x01, sp)
      009440 27 03            [ 1]  747 	jreq	00106$
                                    748 ;	lib/stm8s_i2c.c: 750: bitstatus = SET;
      009442 A6 01            [ 1]  749 	ld	a, #0x01
                                    750 ;	lib/stm8s_i2c.c: 755: bitstatus = RESET;
      009444 21                     751 	.byte 0x21
      009445                        752 00106$:
      009445 4F               [ 1]  753 	clr	a
      009446                        754 00111$:
                                    755 ;	lib/stm8s_i2c.c: 759: return  bitstatus;
      009446 85               [ 2]  756 	popw	x
      009447 81               [ 4]  757 	ret
                                    758 ;	lib/stm8s_i2c.c: 797: void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    759 ;	-----------------------------------------
                                    760 ;	 function I2C_ClearITPendingBit
                                    761 ;	-----------------------------------------
      009448                        762 _I2C_ClearITPendingBit:
                                    763 ;	lib/stm8s_i2c.c: 802: flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
      009448 7B 04            [ 1]  764 	ld	a, (0x04, sp)
      00944A 97               [ 1]  765 	ld	xl, a
      00944B 4F               [ 1]  766 	clr	a
                                    767 ;	lib/stm8s_i2c.c: 805: I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
      00944C 95               [ 1]  768 	ld	xh, a
      00944D 53               [ 2]  769 	cplw	x
      00944E 9F               [ 1]  770 	ld	a, xl
      00944F AE 52 18         [ 2]  771 	ldw	x, #0x5218
      009452 F7               [ 1]  772 	ld	(x), a
      009453 81               [ 4]  773 	ret
                                    774 	.area CODE
                                    775 	.area INITIALIZER
                                    776 	.area CABS (ABS)
