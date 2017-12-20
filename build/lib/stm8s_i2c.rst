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
      008698                         63 _I2C_DeInit:
                                     64 ;	lib/stm8s_i2c.c: 43: I2C->CR1 = I2C_CR1_RESET_VALUE;
      008698 35 00 52 10      [ 1]   65 	mov	0x5210+0, #0x00
                                     66 ;	lib/stm8s_i2c.c: 44: I2C->CR2 = I2C_CR2_RESET_VALUE;
      00869C 35 00 52 11      [ 1]   67 	mov	0x5211+0, #0x00
                                     68 ;	lib/stm8s_i2c.c: 45: I2C->FREQR = I2C_FREQR_RESET_VALUE;
      0086A0 35 00 52 12      [ 1]   69 	mov	0x5212+0, #0x00
                                     70 ;	lib/stm8s_i2c.c: 46: I2C->OARL = I2C_OARL_RESET_VALUE;
      0086A4 35 00 52 13      [ 1]   71 	mov	0x5213+0, #0x00
                                     72 ;	lib/stm8s_i2c.c: 47: I2C->OARH = I2C_OARH_RESET_VALUE;
      0086A8 35 00 52 14      [ 1]   73 	mov	0x5214+0, #0x00
                                     74 ;	lib/stm8s_i2c.c: 48: I2C->ITR = I2C_ITR_RESET_VALUE;
      0086AC 35 00 52 1A      [ 1]   75 	mov	0x521a+0, #0x00
                                     76 ;	lib/stm8s_i2c.c: 49: I2C->CCRL = I2C_CCRL_RESET_VALUE;
      0086B0 35 00 52 1B      [ 1]   77 	mov	0x521b+0, #0x00
                                     78 ;	lib/stm8s_i2c.c: 50: I2C->CCRH = I2C_CCRH_RESET_VALUE;
      0086B4 35 00 52 1C      [ 1]   79 	mov	0x521c+0, #0x00
                                     80 ;	lib/stm8s_i2c.c: 51: I2C->TRISER = I2C_TRISER_RESET_VALUE;
      0086B8 35 02 52 1D      [ 1]   81 	mov	0x521d+0, #0x02
      0086BC 81               [ 4]   82 	ret
                                     83 ;	lib/stm8s_i2c.c: 70: void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
                                     84 ;	-----------------------------------------
                                     85 ;	 function I2C_Init
                                     86 ;	-----------------------------------------
      0086BD                         87 _I2C_Init:
      0086BD 52 0A            [ 2]   88 	sub	sp, #10
                                     89 ;	lib/stm8s_i2c.c: 76: uint8_t tmpccrh = 0;
      0086BF 0F 01            [ 1]   90 	clr	(0x01, sp)
                                     91 ;	lib/stm8s_i2c.c: 82: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
      0086C1 AE 52 12         [ 2]   92 	ldw	x, #0x5212
      0086C4 F6               [ 1]   93 	ld	a, (x)
      0086C5 A4 C0            [ 1]   94 	and	a, #0xc0
      0086C7 F7               [ 1]   95 	ld	(x), a
                                     96 ;	lib/stm8s_i2c.c: 84: I2C->FREQR |= InputClockFrequencyMHz;
      0086C8 AE 52 12         [ 2]   97 	ldw	x, #0x5212
      0086CB F6               [ 1]   98 	ld	a, (x)
      0086CC 1A 16            [ 1]   99 	or	a, (0x16, sp)
      0086CE AE 52 12         [ 2]  100 	ldw	x, #0x5212
      0086D1 F7               [ 1]  101 	ld	(x), a
                                    102 ;	lib/stm8s_i2c.c: 88: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      0086D2 72 11 52 10      [ 1]  103 	bres	0x5210, #0
                                    104 ;	lib/stm8s_i2c.c: 91: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
      0086D6 AE 52 1C         [ 2]  105 	ldw	x, #0x521c
      0086D9 F6               [ 1]  106 	ld	a, (x)
      0086DA A4 30            [ 1]  107 	and	a, #0x30
      0086DC F7               [ 1]  108 	ld	(x), a
                                    109 ;	lib/stm8s_i2c.c: 92: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
      0086DD AE 52 1B         [ 2]  110 	ldw	x, #0x521b
      0086E0 F6               [ 1]  111 	ld	a, (x)
      0086E1 35 00 52 1B      [ 1]  112 	mov	0x521b+0, #0x00
                                    113 ;	lib/stm8s_i2c.c: 103: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      0086E5 5F               [ 1]  114 	clrw	x
      0086E6 7B 16            [ 1]  115 	ld	a, (0x16, sp)
      0086E8 97               [ 1]  116 	ld	xl, a
      0086E9 90 5F            [ 1]  117 	clrw	y
      0086EB 89               [ 2]  118 	pushw	x
      0086EC 90 89            [ 2]  119 	pushw	y
      0086EE 4B 40            [ 1]  120 	push	#0x40
      0086F0 4B 42            [ 1]  121 	push	#0x42
      0086F2 4B 0F            [ 1]  122 	push	#0x0f
      0086F4 4B 00            [ 1]  123 	push	#0x00
      0086F6 CD 8C 4F         [ 4]  124 	call	__mullong
      0086F9 5B 08            [ 2]  125 	addw	sp, #8
      0086FB 1F 09            [ 2]  126 	ldw	(0x09, sp), x
      0086FD 17 07            [ 2]  127 	ldw	(0x07, sp), y
                                    128 ;	lib/stm8s_i2c.c: 95: if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
      0086FF AE 86 A0         [ 2]  129 	ldw	x, #0x86a0
      008702 13 0F            [ 2]  130 	cpw	x, (0x0f, sp)
      008704 A6 01            [ 1]  131 	ld	a, #0x01
      008706 12 0E            [ 1]  132 	sbc	a, (0x0e, sp)
      008708 4F               [ 1]  133 	clr	a
      008709 12 0D            [ 1]  134 	sbc	a, (0x0d, sp)
      00870B 24 77            [ 1]  135 	jrnc	00109$
                                    136 ;	lib/stm8s_i2c.c: 98: tmpccrh = I2C_CCRH_FS;
      00870D A6 80            [ 1]  137 	ld	a, #0x80
      00870F 6B 01            [ 1]  138 	ld	(0x01, sp), a
                                    139 ;	lib/stm8s_i2c.c: 100: if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
      008711 0D 13            [ 1]  140 	tnz	(0x13, sp)
      008713 26 23            [ 1]  141 	jrne	00102$
                                    142 ;	lib/stm8s_i2c.c: 103: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      008715 1E 0F            [ 2]  143 	ldw	x, (0x0f, sp)
      008717 89               [ 2]  144 	pushw	x
      008718 1E 0F            [ 2]  145 	ldw	x, (0x0f, sp)
      00871A 89               [ 2]  146 	pushw	x
      00871B 4B 03            [ 1]  147 	push	#0x03
      00871D 5F               [ 1]  148 	clrw	x
      00871E 89               [ 2]  149 	pushw	x
      00871F 4B 00            [ 1]  150 	push	#0x00
      008721 CD 8C 4F         [ 4]  151 	call	__mullong
      008724 5B 08            [ 2]  152 	addw	sp, #8
      008726 89               [ 2]  153 	pushw	x
      008727 90 89            [ 2]  154 	pushw	y
      008729 1E 0D            [ 2]  155 	ldw	x, (0x0d, sp)
      00872B 89               [ 2]  156 	pushw	x
      00872C 1E 0D            [ 2]  157 	ldw	x, (0x0d, sp)
      00872E 89               [ 2]  158 	pushw	x
      00872F CD 8B D4         [ 4]  159 	call	__divulong
      008732 5B 08            [ 2]  160 	addw	sp, #8
      008734 1F 02            [ 2]  161 	ldw	(0x02, sp), x
      008736 20 28            [ 2]  162 	jra	00103$
      008738                        163 00102$:
                                    164 ;	lib/stm8s_i2c.c: 108: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
      008738 1E 0F            [ 2]  165 	ldw	x, (0x0f, sp)
      00873A 89               [ 2]  166 	pushw	x
      00873B 1E 0F            [ 2]  167 	ldw	x, (0x0f, sp)
      00873D 89               [ 2]  168 	pushw	x
      00873E 4B 19            [ 1]  169 	push	#0x19
      008740 5F               [ 1]  170 	clrw	x
      008741 89               [ 2]  171 	pushw	x
      008742 4B 00            [ 1]  172 	push	#0x00
      008744 CD 8C 4F         [ 4]  173 	call	__mullong
      008747 5B 08            [ 2]  174 	addw	sp, #8
      008749 9F               [ 1]  175 	ld	a, xl
      00874A 88               [ 1]  176 	push	a
      00874B 9E               [ 1]  177 	ld	a, xh
      00874C 88               [ 1]  178 	push	a
      00874D 90 89            [ 2]  179 	pushw	y
      00874F 1E 0D            [ 2]  180 	ldw	x, (0x0d, sp)
      008751 89               [ 2]  181 	pushw	x
      008752 1E 0D            [ 2]  182 	ldw	x, (0x0d, sp)
      008754 89               [ 2]  183 	pushw	x
      008755 CD 8B D4         [ 4]  184 	call	__divulong
      008758 5B 08            [ 2]  185 	addw	sp, #8
      00875A 1F 02            [ 2]  186 	ldw	(0x02, sp), x
                                    187 ;	lib/stm8s_i2c.c: 110: tmpccrh |= I2C_CCRH_DUTY;
      00875C A6 C0            [ 1]  188 	ld	a, #0xc0
      00875E 6B 01            [ 1]  189 	ld	(0x01, sp), a
      008760                        190 00103$:
                                    191 ;	lib/stm8s_i2c.c: 114: if (result < (uint16_t)0x01)
      008760 1E 02            [ 2]  192 	ldw	x, (0x02, sp)
      008762 A3 00 01         [ 2]  193 	cpw	x, #0x0001
      008765 24 05            [ 1]  194 	jrnc	00105$
                                    195 ;	lib/stm8s_i2c.c: 117: result = (uint16_t)0x0001;
      008767 AE 00 01         [ 2]  196 	ldw	x, #0x0001
      00876A 1F 02            [ 2]  197 	ldw	(0x02, sp), x
      00876C                        198 00105$:
                                    199 ;	lib/stm8s_i2c.c: 123: tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
      00876C 7B 16            [ 1]  200 	ld	a, (0x16, sp)
      00876E 97               [ 1]  201 	ld	xl, a
      00876F A6 03            [ 1]  202 	ld	a, #0x03
      008771 42               [ 4]  203 	mul	x, a
      008772 4B 0A            [ 1]  204 	push	#0x0a
      008774 4B 00            [ 1]  205 	push	#0x00
      008776 89               [ 2]  206 	pushw	x
      008777 CD 8C CB         [ 4]  207 	call	__divsint
      00877A 5B 04            [ 2]  208 	addw	sp, #4
      00877C 5C               [ 2]  209 	incw	x
      00877D 9F               [ 1]  210 	ld	a, xl
                                    211 ;	lib/stm8s_i2c.c: 124: I2C->TRISER = (uint8_t)tmpval;
      00877E AE 52 1D         [ 2]  212 	ldw	x, #0x521d
      008781 F7               [ 1]  213 	ld	(x), a
      008782 20 2A            [ 2]  214 	jra	00110$
      008784                        215 00109$:
                                    216 ;	lib/stm8s_i2c.c: 131: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
      008784 1E 0F            [ 2]  217 	ldw	x, (0x0f, sp)
      008786 16 0D            [ 2]  218 	ldw	y, (0x0d, sp)
      008788 58               [ 2]  219 	sllw	x
      008789 90 59            [ 2]  220 	rlcw	y
      00878B 89               [ 2]  221 	pushw	x
      00878C 90 89            [ 2]  222 	pushw	y
      00878E 1E 0D            [ 2]  223 	ldw	x, (0x0d, sp)
      008790 89               [ 2]  224 	pushw	x
      008791 1E 0D            [ 2]  225 	ldw	x, (0x0d, sp)
      008793 89               [ 2]  226 	pushw	x
      008794 CD 8B D4         [ 4]  227 	call	__divulong
      008797 5B 08            [ 2]  228 	addw	sp, #8
      008799 1F 02            [ 2]  229 	ldw	(0x02, sp), x
                                    230 ;	lib/stm8s_i2c.c: 134: if (result < (uint16_t)0x0004)
      00879B 1E 02            [ 2]  231 	ldw	x, (0x02, sp)
      00879D A3 00 04         [ 2]  232 	cpw	x, #0x0004
      0087A0 24 05            [ 1]  233 	jrnc	00107$
                                    234 ;	lib/stm8s_i2c.c: 137: result = (uint16_t)0x0004;
      0087A2 AE 00 04         [ 2]  235 	ldw	x, #0x0004
      0087A5 1F 02            [ 2]  236 	ldw	(0x02, sp), x
      0087A7                        237 00107$:
                                    238 ;	lib/stm8s_i2c.c: 143: I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
      0087A7 7B 16            [ 1]  239 	ld	a, (0x16, sp)
      0087A9 4C               [ 1]  240 	inc	a
      0087AA AE 52 1D         [ 2]  241 	ldw	x, #0x521d
      0087AD F7               [ 1]  242 	ld	(x), a
      0087AE                        243 00110$:
                                    244 ;	lib/stm8s_i2c.c: 148: I2C->CCRL = (uint8_t)result;
      0087AE 7B 03            [ 1]  245 	ld	a, (0x03, sp)
      0087B0 AE 52 1B         [ 2]  246 	ldw	x, #0x521b
      0087B3 F7               [ 1]  247 	ld	(x), a
                                    248 ;	lib/stm8s_i2c.c: 149: I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
      0087B4 7B 02            [ 1]  249 	ld	a, (0x02, sp)
      0087B6 0F 04            [ 1]  250 	clr	(0x04, sp)
      0087B8 A4 0F            [ 1]  251 	and	a, #0x0f
      0087BA 1A 01            [ 1]  252 	or	a, (0x01, sp)
      0087BC AE 52 1C         [ 2]  253 	ldw	x, #0x521c
      0087BF F7               [ 1]  254 	ld	(x), a
                                    255 ;	lib/stm8s_i2c.c: 152: I2C->CR1 |= I2C_CR1_PE;
      0087C0 72 10 52 10      [ 1]  256 	bset	0x5210, #0
                                    257 ;	lib/stm8s_i2c.c: 155: I2C_AcknowledgeConfig(Ack);
      0087C4 7B 14            [ 1]  258 	ld	a, (0x14, sp)
      0087C6 88               [ 1]  259 	push	a
      0087C7 CD 88 4B         [ 4]  260 	call	_I2C_AcknowledgeConfig
      0087CA 84               [ 1]  261 	pop	a
                                    262 ;	lib/stm8s_i2c.c: 158: I2C->OARL = (uint8_t)(OwnAddress);
      0087CB 7B 12            [ 1]  263 	ld	a, (0x12, sp)
      0087CD AE 52 13         [ 2]  264 	ldw	x, #0x5213
      0087D0 F7               [ 1]  265 	ld	(x), a
                                    266 ;	lib/stm8s_i2c.c: 159: I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
      0087D1 7B 15            [ 1]  267 	ld	a, (0x15, sp)
      0087D3 AA 40            [ 1]  268 	or	a, #0x40
      0087D5 6B 06            [ 1]  269 	ld	(0x06, sp), a
                                    270 ;	lib/stm8s_i2c.c: 160: (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
      0087D7 4F               [ 1]  271 	clr	a
      0087D8 97               [ 1]  272 	ld	xl, a
      0087D9 7B 11            [ 1]  273 	ld	a, (0x11, sp)
      0087DB A4 03            [ 1]  274 	and	a, #0x03
      0087DD 95               [ 1]  275 	ld	xh, a
      0087DE A6 80            [ 1]  276 	ld	a, #0x80
      0087E0 62               [ 2]  277 	div	x, a
      0087E1 9F               [ 1]  278 	ld	a, xl
      0087E2 1A 06            [ 1]  279 	or	a, (0x06, sp)
      0087E4 AE 52 14         [ 2]  280 	ldw	x, #0x5214
      0087E7 F7               [ 1]  281 	ld	(x), a
      0087E8 5B 0A            [ 2]  282 	addw	sp, #10
      0087EA 81               [ 4]  283 	ret
                                    284 ;	lib/stm8s_i2c.c: 169: void I2C_Cmd(FunctionalState NewState)
                                    285 ;	-----------------------------------------
                                    286 ;	 function I2C_Cmd
                                    287 ;	-----------------------------------------
      0087EB                        288 _I2C_Cmd:
                                    289 ;	lib/stm8s_i2c.c: 171: if (NewState != DISABLE)
      0087EB 0D 03            [ 1]  290 	tnz	(0x03, sp)
      0087ED 27 05            [ 1]  291 	jreq	00102$
                                    292 ;	lib/stm8s_i2c.c: 174: I2C->CR1 |= I2C_CR1_PE;
      0087EF 72 10 52 10      [ 1]  293 	bset	0x5210, #0
      0087F3 81               [ 4]  294 	ret
      0087F4                        295 00102$:
                                    296 ;	lib/stm8s_i2c.c: 179: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      0087F4 72 11 52 10      [ 1]  297 	bres	0x5210, #0
      0087F8 81               [ 4]  298 	ret
                                    299 ;	lib/stm8s_i2c.c: 189: void I2C_GeneralCallCmd(FunctionalState NewState)
                                    300 ;	-----------------------------------------
                                    301 ;	 function I2C_GeneralCallCmd
                                    302 ;	-----------------------------------------
      0087F9                        303 _I2C_GeneralCallCmd:
                                    304 ;	lib/stm8s_i2c.c: 191: if (NewState != DISABLE)
      0087F9 0D 03            [ 1]  305 	tnz	(0x03, sp)
      0087FB 27 08            [ 1]  306 	jreq	00102$
                                    307 ;	lib/stm8s_i2c.c: 194: I2C->CR1 |= I2C_CR1_ENGC;
      0087FD AE 52 10         [ 2]  308 	ldw	x, #0x5210
      008800 F6               [ 1]  309 	ld	a, (x)
      008801 AA 40            [ 1]  310 	or	a, #0x40
      008803 F7               [ 1]  311 	ld	(x), a
      008804 81               [ 4]  312 	ret
      008805                        313 00102$:
                                    314 ;	lib/stm8s_i2c.c: 199: I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
      008805 AE 52 10         [ 2]  315 	ldw	x, #0x5210
      008808 F6               [ 1]  316 	ld	a, (x)
      008809 A4 BF            [ 1]  317 	and	a, #0xbf
      00880B F7               [ 1]  318 	ld	(x), a
      00880C 81               [ 4]  319 	ret
                                    320 ;	lib/stm8s_i2c.c: 211: void I2C_GenerateSTART(FunctionalState NewState)
                                    321 ;	-----------------------------------------
                                    322 ;	 function I2C_GenerateSTART
                                    323 ;	-----------------------------------------
      00880D                        324 _I2C_GenerateSTART:
                                    325 ;	lib/stm8s_i2c.c: 214: if (NewState != DISABLE)
      00880D 0D 03            [ 1]  326 	tnz	(0x03, sp)
      00880F 27 05            [ 1]  327 	jreq	00102$
                                    328 ;	lib/stm8s_i2c.c: 217: I2C->CR2 |= I2C_CR2_START;
      008811 72 10 52 11      [ 1]  329 	bset	0x5211, #0
      008815 81               [ 4]  330 	ret
      008816                        331 00102$:
                                    332 ;	lib/stm8s_i2c.c: 222: I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
      008816 72 11 52 11      [ 1]  333 	bres	0x5211, #0
      00881A 81               [ 4]  334 	ret
                                    335 ;	lib/stm8s_i2c.c: 232: void I2C_GenerateSTOP(FunctionalState NewState)
                                    336 ;	-----------------------------------------
                                    337 ;	 function I2C_GenerateSTOP
                                    338 ;	-----------------------------------------
      00881B                        339 _I2C_GenerateSTOP:
                                    340 ;	lib/stm8s_i2c.c: 234: if (NewState != DISABLE)
      00881B 0D 03            [ 1]  341 	tnz	(0x03, sp)
      00881D 27 08            [ 1]  342 	jreq	00102$
                                    343 ;	lib/stm8s_i2c.c: 237: I2C->CR2 |= I2C_CR2_STOP;
      00881F AE 52 11         [ 2]  344 	ldw	x, #0x5211
      008822 F6               [ 1]  345 	ld	a, (x)
      008823 AA 02            [ 1]  346 	or	a, #0x02
      008825 F7               [ 1]  347 	ld	(x), a
      008826 81               [ 4]  348 	ret
      008827                        349 00102$:
                                    350 ;	lib/stm8s_i2c.c: 242: I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
      008827 AE 52 11         [ 2]  351 	ldw	x, #0x5211
      00882A F6               [ 1]  352 	ld	a, (x)
      00882B A4 FD            [ 1]  353 	and	a, #0xfd
      00882D F7               [ 1]  354 	ld	(x), a
      00882E 81               [ 4]  355 	ret
                                    356 ;	lib/stm8s_i2c.c: 252: void I2C_SoftwareResetCmd(FunctionalState NewState)
                                    357 ;	-----------------------------------------
                                    358 ;	 function I2C_SoftwareResetCmd
                                    359 ;	-----------------------------------------
      00882F                        360 _I2C_SoftwareResetCmd:
                                    361 ;	lib/stm8s_i2c.c: 255: if (NewState != DISABLE)
      00882F 0D 03            [ 1]  362 	tnz	(0x03, sp)
      008831 27 05            [ 1]  363 	jreq	00102$
                                    364 ;	lib/stm8s_i2c.c: 258: I2C->CR2 |= I2C_CR2_SWRST;
      008833 72 1E 52 11      [ 1]  365 	bset	0x5211, #7
      008837 81               [ 4]  366 	ret
      008838                        367 00102$:
                                    368 ;	lib/stm8s_i2c.c: 263: I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
      008838 72 1F 52 11      [ 1]  369 	bres	0x5211, #7
      00883C 81               [ 4]  370 	ret
                                    371 ;	lib/stm8s_i2c.c: 274: void I2C_StretchClockCmd(FunctionalState NewState)
                                    372 ;	-----------------------------------------
                                    373 ;	 function I2C_StretchClockCmd
                                    374 ;	-----------------------------------------
      00883D                        375 _I2C_StretchClockCmd:
                                    376 ;	lib/stm8s_i2c.c: 276: if (NewState != DISABLE)
      00883D 0D 03            [ 1]  377 	tnz	(0x03, sp)
      00883F 27 05            [ 1]  378 	jreq	00102$
                                    379 ;	lib/stm8s_i2c.c: 279: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
      008841 72 1F 52 10      [ 1]  380 	bres	0x5210, #7
      008845 81               [ 4]  381 	ret
      008846                        382 00102$:
                                    383 ;	lib/stm8s_i2c.c: 285: I2C->CR1 |= I2C_CR1_NOSTRETCH;
      008846 72 1E 52 10      [ 1]  384 	bset	0x5210, #7
      00884A 81               [ 4]  385 	ret
                                    386 ;	lib/stm8s_i2c.c: 296: void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
                                    387 ;	-----------------------------------------
                                    388 ;	 function I2C_AcknowledgeConfig
                                    389 ;	-----------------------------------------
      00884B                        390 _I2C_AcknowledgeConfig:
                                    391 ;	lib/stm8s_i2c.c: 298: if (Ack == I2C_ACK_NONE)
      00884B 0D 03            [ 1]  392 	tnz	(0x03, sp)
      00884D 26 08            [ 1]  393 	jrne	00105$
                                    394 ;	lib/stm8s_i2c.c: 301: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      00884F AE 52 11         [ 2]  395 	ldw	x, #0x5211
      008852 F6               [ 1]  396 	ld	a, (x)
      008853 A4 FB            [ 1]  397 	and	a, #0xfb
      008855 F7               [ 1]  398 	ld	(x), a
      008856 81               [ 4]  399 	ret
      008857                        400 00105$:
                                    401 ;	lib/stm8s_i2c.c: 306: I2C->CR2 |= I2C_CR2_ACK;
      008857 AE 52 11         [ 2]  402 	ldw	x, #0x5211
      00885A F6               [ 1]  403 	ld	a, (x)
      00885B AA 04            [ 1]  404 	or	a, #0x04
      00885D F7               [ 1]  405 	ld	(x), a
                                    406 ;	lib/stm8s_i2c.c: 308: if (Ack == I2C_ACK_CURR)
      00885E 7B 03            [ 1]  407 	ld	a, (0x03, sp)
      008860 A1 01            [ 1]  408 	cp	a, #0x01
      008862 26 08            [ 1]  409 	jrne	00102$
                                    410 ;	lib/stm8s_i2c.c: 311: I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
      008864 AE 52 11         [ 2]  411 	ldw	x, #0x5211
      008867 F6               [ 1]  412 	ld	a, (x)
      008868 A4 F7            [ 1]  413 	and	a, #0xf7
      00886A F7               [ 1]  414 	ld	(x), a
      00886B 81               [ 4]  415 	ret
      00886C                        416 00102$:
                                    417 ;	lib/stm8s_i2c.c: 316: I2C->CR2 |= I2C_CR2_POS;
      00886C AE 52 11         [ 2]  418 	ldw	x, #0x5211
      00886F F6               [ 1]  419 	ld	a, (x)
      008870 AA 08            [ 1]  420 	or	a, #0x08
      008872 F7               [ 1]  421 	ld	(x), a
      008873 81               [ 4]  422 	ret
                                    423 ;	lib/stm8s_i2c.c: 329: void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
                                    424 ;	-----------------------------------------
                                    425 ;	 function I2C_ITConfig
                                    426 ;	-----------------------------------------
      008874                        427 _I2C_ITConfig:
      008874 88               [ 1]  428 	push	a
                                    429 ;	lib/stm8s_i2c.c: 331: if (NewState != DISABLE)
      008875 0D 05            [ 1]  430 	tnz	(0x05, sp)
      008877 27 0C            [ 1]  431 	jreq	00102$
                                    432 ;	lib/stm8s_i2c.c: 334: I2C->ITR |= (uint8_t)I2C_IT;
      008879 AE 52 1A         [ 2]  433 	ldw	x, #0x521a
      00887C F6               [ 1]  434 	ld	a, (x)
      00887D 1A 04            [ 1]  435 	or	a, (0x04, sp)
      00887F AE 52 1A         [ 2]  436 	ldw	x, #0x521a
      008882 F7               [ 1]  437 	ld	(x), a
      008883 20 0F            [ 2]  438 	jra	00104$
      008885                        439 00102$:
                                    440 ;	lib/stm8s_i2c.c: 339: I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
      008885 AE 52 1A         [ 2]  441 	ldw	x, #0x521a
      008888 F6               [ 1]  442 	ld	a, (x)
      008889 6B 01            [ 1]  443 	ld	(0x01, sp), a
      00888B 7B 04            [ 1]  444 	ld	a, (0x04, sp)
      00888D 43               [ 1]  445 	cpl	a
      00888E 14 01            [ 1]  446 	and	a, (0x01, sp)
      008890 AE 52 1A         [ 2]  447 	ldw	x, #0x521a
      008893 F7               [ 1]  448 	ld	(x), a
      008894                        449 00104$:
      008894 84               [ 1]  450 	pop	a
      008895 81               [ 4]  451 	ret
                                    452 ;	lib/stm8s_i2c.c: 349: void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
                                    453 ;	-----------------------------------------
                                    454 ;	 function I2C_FastModeDutyCycleConfig
                                    455 ;	-----------------------------------------
      008896                        456 _I2C_FastModeDutyCycleConfig:
                                    457 ;	lib/stm8s_i2c.c: 351: if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
      008896 7B 03            [ 1]  458 	ld	a, (0x03, sp)
      008898 A1 40            [ 1]  459 	cp	a, #0x40
      00889A 26 08            [ 1]  460 	jrne	00102$
                                    461 ;	lib/stm8s_i2c.c: 354: I2C->CCRH |= I2C_CCRH_DUTY;
      00889C AE 52 1C         [ 2]  462 	ldw	x, #0x521c
      00889F F6               [ 1]  463 	ld	a, (x)
      0088A0 AA 40            [ 1]  464 	or	a, #0x40
      0088A2 F7               [ 1]  465 	ld	(x), a
      0088A3 81               [ 4]  466 	ret
      0088A4                        467 00102$:
                                    468 ;	lib/stm8s_i2c.c: 359: I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
      0088A4 AE 52 1C         [ 2]  469 	ldw	x, #0x521c
      0088A7 F6               [ 1]  470 	ld	a, (x)
      0088A8 A4 BF            [ 1]  471 	and	a, #0xbf
      0088AA F7               [ 1]  472 	ld	(x), a
      0088AB 81               [ 4]  473 	ret
                                    474 ;	lib/stm8s_i2c.c: 368: uint8_t I2C_ReceiveData(void)
                                    475 ;	-----------------------------------------
                                    476 ;	 function I2C_ReceiveData
                                    477 ;	-----------------------------------------
      0088AC                        478 _I2C_ReceiveData:
                                    479 ;	lib/stm8s_i2c.c: 371: return ((uint8_t)I2C->DR);
      0088AC AE 52 16         [ 2]  480 	ldw	x, #0x5216
      0088AF F6               [ 1]  481 	ld	a, (x)
      0088B0 81               [ 4]  482 	ret
                                    483 ;	lib/stm8s_i2c.c: 381: void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
                                    484 ;	-----------------------------------------
                                    485 ;	 function I2C_Send7bitAddress
                                    486 ;	-----------------------------------------
      0088B1                        487 _I2C_Send7bitAddress:
                                    488 ;	lib/stm8s_i2c.c: 384: Address &= (uint8_t)0xFE;
      0088B1 7B 03            [ 1]  489 	ld	a, (0x03, sp)
      0088B3 A4 FE            [ 1]  490 	and	a, #0xfe
      0088B5 6B 03            [ 1]  491 	ld	(0x03, sp), a
                                    492 ;	lib/stm8s_i2c.c: 387: I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
      0088B7 7B 03            [ 1]  493 	ld	a, (0x03, sp)
      0088B9 1A 04            [ 1]  494 	or	a, (0x04, sp)
      0088BB AE 52 16         [ 2]  495 	ldw	x, #0x5216
      0088BE F7               [ 1]  496 	ld	(x), a
      0088BF 81               [ 4]  497 	ret
                                    498 ;	lib/stm8s_i2c.c: 395: void I2C_SendData(uint8_t Data)
                                    499 ;	-----------------------------------------
                                    500 ;	 function I2C_SendData
                                    501 ;	-----------------------------------------
      0088C0                        502 _I2C_SendData:
                                    503 ;	lib/stm8s_i2c.c: 398: I2C->DR = Data;
      0088C0 AE 52 16         [ 2]  504 	ldw	x, #0x5216
      0088C3 7B 03            [ 1]  505 	ld	a, (0x03, sp)
      0088C5 F7               [ 1]  506 	ld	(x), a
      0088C6 81               [ 4]  507 	ret
                                    508 ;	lib/stm8s_i2c.c: 515: ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
                                    509 ;	-----------------------------------------
                                    510 ;	 function I2C_CheckEvent
                                    511 ;	-----------------------------------------
      0088C7                        512 _I2C_CheckEvent:
      0088C7 52 0A            [ 2]  513 	sub	sp, #10
                                    514 ;	lib/stm8s_i2c.c: 517: __IO uint16_t lastevent = 0x00;
      0088C9 5F               [ 1]  515 	clrw	x
      0088CA 1F 01            [ 2]  516 	ldw	(0x01, sp), x
                                    517 ;	lib/stm8s_i2c.c: 522: if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
      0088CC 1E 0D            [ 2]  518 	ldw	x, (0x0d, sp)
      0088CE A3 00 04         [ 2]  519 	cpw	x, #0x0004
      0088D1 26 0C            [ 1]  520 	jrne	00102$
                                    521 ;	lib/stm8s_i2c.c: 524: lastevent = I2C->SR2 & I2C_SR2_AF;
      0088D3 AE 52 18         [ 2]  522 	ldw	x, #0x5218
      0088D6 F6               [ 1]  523 	ld	a, (x)
      0088D7 A4 04            [ 1]  524 	and	a, #0x04
      0088D9 5F               [ 1]  525 	clrw	x
      0088DA 97               [ 1]  526 	ld	xl, a
      0088DB 1F 01            [ 2]  527 	ldw	(0x01, sp), x
      0088DD 20 1E            [ 2]  528 	jra	00103$
      0088DF                        529 00102$:
                                    530 ;	lib/stm8s_i2c.c: 528: flag1 = I2C->SR1;
      0088DF AE 52 17         [ 2]  531 	ldw	x, #0x5217
      0088E2 F6               [ 1]  532 	ld	a, (x)
                                    533 ;	lib/stm8s_i2c.c: 529: flag2 = I2C->SR3;
      0088E3 AE 52 19         [ 2]  534 	ldw	x, #0x5219
      0088E6 88               [ 1]  535 	push	a
      0088E7 F6               [ 1]  536 	ld	a, (x)
      0088E8 97               [ 1]  537 	ld	xl, a
      0088E9 84               [ 1]  538 	pop	a
                                    539 ;	lib/stm8s_i2c.c: 530: lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
      0088EA 0F 05            [ 1]  540 	clr	(0x05, sp)
      0088EC 0F 04            [ 1]  541 	clr	(0x04, sp)
      0088EE 0F 09            [ 1]  542 	clr	(0x09, sp)
      0088F0 1A 04            [ 1]  543 	or	a, (0x04, sp)
      0088F2 6B 08            [ 1]  544 	ld	(0x08, sp), a
      0088F4 9F               [ 1]  545 	ld	a, xl
      0088F5 1A 09            [ 1]  546 	or	a, (0x09, sp)
      0088F7 6B 07            [ 1]  547 	ld	(0x07, sp), a
      0088F9 16 07            [ 2]  548 	ldw	y, (0x07, sp)
      0088FB 17 01            [ 2]  549 	ldw	(0x01, sp), y
      0088FD                        550 00103$:
                                    551 ;	lib/stm8s_i2c.c: 533: if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
      0088FD 7B 02            [ 1]  552 	ld	a, (0x02, sp)
      0088FF 14 0E            [ 1]  553 	and	a, (0x0e, sp)
      008901 97               [ 1]  554 	ld	xl, a
      008902 7B 01            [ 1]  555 	ld	a, (0x01, sp)
      008904 14 0D            [ 1]  556 	and	a, (0x0d, sp)
      008906 95               [ 1]  557 	ld	xh, a
      008907 13 0D            [ 2]  558 	cpw	x, (0x0d, sp)
      008909 26 03            [ 1]  559 	jrne	00105$
                                    560 ;	lib/stm8s_i2c.c: 536: status = SUCCESS;
      00890B A6 01            [ 1]  561 	ld	a, #0x01
                                    562 ;	lib/stm8s_i2c.c: 541: status = ERROR;
      00890D 21                     563 	.byte 0x21
      00890E                        564 00105$:
      00890E 4F               [ 1]  565 	clr	a
      00890F                        566 00106$:
                                    567 ;	lib/stm8s_i2c.c: 545: return status;
      00890F 5B 0A            [ 2]  568 	addw	sp, #10
      008911 81               [ 4]  569 	ret
                                    570 ;	lib/stm8s_i2c.c: 562: I2C_Event_TypeDef I2C_GetLastEvent(void)
                                    571 ;	-----------------------------------------
                                    572 ;	 function I2C_GetLastEvent
                                    573 ;	-----------------------------------------
      008912                        574 _I2C_GetLastEvent:
      008912 52 04            [ 2]  575 	sub	sp, #4
                                    576 ;	lib/stm8s_i2c.c: 564: __IO uint16_t lastevent = 0;
      008914 5F               [ 1]  577 	clrw	x
      008915 1F 01            [ 2]  578 	ldw	(0x01, sp), x
                                    579 ;	lib/stm8s_i2c.c: 568: if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
      008917 AE 52 18         [ 2]  580 	ldw	x, #0x5218
      00891A F6               [ 1]  581 	ld	a, (x)
      00891B A5 04            [ 1]  582 	bcp	a, #0x04
      00891D 27 07            [ 1]  583 	jreq	00102$
                                    584 ;	lib/stm8s_i2c.c: 570: lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
      00891F AE 00 04         [ 2]  585 	ldw	x, #0x0004
      008922 1F 01            [ 2]  586 	ldw	(0x01, sp), x
      008924 20 17            [ 2]  587 	jra	00103$
      008926                        588 00102$:
                                    589 ;	lib/stm8s_i2c.c: 575: flag1 = I2C->SR1;
      008926 AE 52 17         [ 2]  590 	ldw	x, #0x5217
      008929 F6               [ 1]  591 	ld	a, (x)
      00892A 5F               [ 1]  592 	clrw	x
      00892B 97               [ 1]  593 	ld	xl, a
      00892C 1F 03            [ 2]  594 	ldw	(0x03, sp), x
                                    595 ;	lib/stm8s_i2c.c: 576: flag2 = I2C->SR3;
      00892E AE 52 19         [ 2]  596 	ldw	x, #0x5219
      008931 F6               [ 1]  597 	ld	a, (x)
      008932 95               [ 1]  598 	ld	xh, a
      008933 4F               [ 1]  599 	clr	a
                                    600 ;	lib/stm8s_i2c.c: 579: lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
      008934 4F               [ 1]  601 	clr	a
      008935 1A 04            [ 1]  602 	or	a, (0x04, sp)
      008937 02               [ 1]  603 	rlwa	x
      008938 1A 03            [ 1]  604 	or	a, (0x03, sp)
      00893A 95               [ 1]  605 	ld	xh, a
      00893B 1F 01            [ 2]  606 	ldw	(0x01, sp), x
      00893D                        607 00103$:
                                    608 ;	lib/stm8s_i2c.c: 582: return (I2C_Event_TypeDef)lastevent;
      00893D 1E 01            [ 2]  609 	ldw	x, (0x01, sp)
      00893F 5B 04            [ 2]  610 	addw	sp, #4
      008941 81               [ 4]  611 	ret
                                    612 ;	lib/stm8s_i2c.c: 613: FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
                                    613 ;	-----------------------------------------
                                    614 ;	 function I2C_GetFlagStatus
                                    615 ;	-----------------------------------------
      008942                        616 _I2C_GetFlagStatus:
      008942 89               [ 2]  617 	pushw	x
                                    618 ;	lib/stm8s_i2c.c: 615: uint8_t tempreg = 0;
      008943 4F               [ 1]  619 	clr	a
      008944 97               [ 1]  620 	ld	xl, a
                                    621 ;	lib/stm8s_i2c.c: 619: regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
      008945 7B 05            [ 1]  622 	ld	a, (0x05, sp)
      008947 0F 01            [ 1]  623 	clr	(0x01, sp)
                                    624 ;	lib/stm8s_i2c.c: 621: switch (regindex)
      008949 A1 01            [ 1]  625 	cp	a, #0x01
      00894B 27 0A            [ 1]  626 	jreq	00101$
      00894D A1 02            [ 1]  627 	cp	a, #0x02
      00894F 27 0D            [ 1]  628 	jreq	00102$
      008951 A1 03            [ 1]  629 	cp	a, #0x03
      008953 27 10            [ 1]  630 	jreq	00103$
      008955 20 13            [ 2]  631 	jra	00105$
                                    632 ;	lib/stm8s_i2c.c: 624: case 0x01:
      008957                        633 00101$:
                                    634 ;	lib/stm8s_i2c.c: 625: tempreg = (uint8_t)I2C->SR1;
      008957 AE 52 17         [ 2]  635 	ldw	x, #0x5217
      00895A F6               [ 1]  636 	ld	a, (x)
      00895B 97               [ 1]  637 	ld	xl, a
                                    638 ;	lib/stm8s_i2c.c: 626: break;
      00895C 20 0C            [ 2]  639 	jra	00105$
                                    640 ;	lib/stm8s_i2c.c: 629: case 0x02:
      00895E                        641 00102$:
                                    642 ;	lib/stm8s_i2c.c: 630: tempreg = (uint8_t)I2C->SR2;
      00895E AE 52 18         [ 2]  643 	ldw	x, #0x5218
      008961 F6               [ 1]  644 	ld	a, (x)
      008962 97               [ 1]  645 	ld	xl, a
                                    646 ;	lib/stm8s_i2c.c: 631: break;
      008963 20 05            [ 2]  647 	jra	00105$
                                    648 ;	lib/stm8s_i2c.c: 634: case 0x03:
      008965                        649 00103$:
                                    650 ;	lib/stm8s_i2c.c: 635: tempreg = (uint8_t)I2C->SR3;
      008965 AE 52 19         [ 2]  651 	ldw	x, #0x5219
      008968 F6               [ 1]  652 	ld	a, (x)
      008969 97               [ 1]  653 	ld	xl, a
                                    654 ;	lib/stm8s_i2c.c: 640: }
      00896A                        655 00105$:
                                    656 ;	lib/stm8s_i2c.c: 643: if ((tempreg & (uint8_t)I2C_Flag ) != 0)
      00896A 7B 06            [ 1]  657 	ld	a, (0x06, sp)
      00896C 89               [ 2]  658 	pushw	x
      00896D 14 02            [ 1]  659 	and	a, (2, sp)
      00896F 85               [ 2]  660 	popw	x
      008970 4D               [ 1]  661 	tnz	a
      008971 27 03            [ 1]  662 	jreq	00107$
                                    663 ;	lib/stm8s_i2c.c: 646: bitstatus = SET;
      008973 A6 01            [ 1]  664 	ld	a, #0x01
                                    665 ;	lib/stm8s_i2c.c: 651: bitstatus = RESET;
      008975 21                     666 	.byte 0x21
      008976                        667 00107$:
      008976 4F               [ 1]  668 	clr	a
      008977                        669 00108$:
                                    670 ;	lib/stm8s_i2c.c: 654: return bitstatus;
      008977 85               [ 2]  671 	popw	x
      008978 81               [ 4]  672 	ret
                                    673 ;	lib/stm8s_i2c.c: 689: void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
                                    674 ;	-----------------------------------------
                                    675 ;	 function I2C_ClearFlag
                                    676 ;	-----------------------------------------
      008979                        677 _I2C_ClearFlag:
                                    678 ;	lib/stm8s_i2c.c: 694: flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
      008979 7B 04            [ 1]  679 	ld	a, (0x04, sp)
      00897B 97               [ 1]  680 	ld	xl, a
      00897C 4F               [ 1]  681 	clr	a
                                    682 ;	lib/stm8s_i2c.c: 696: I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
      00897D 95               [ 1]  683 	ld	xh, a
      00897E 53               [ 2]  684 	cplw	x
      00897F 9F               [ 1]  685 	ld	a, xl
      008980 AE 52 18         [ 2]  686 	ldw	x, #0x5218
      008983 F7               [ 1]  687 	ld	(x), a
      008984 81               [ 4]  688 	ret
                                    689 ;	lib/stm8s_i2c.c: 719: ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    690 ;	-----------------------------------------
                                    691 ;	 function I2C_GetITStatus
                                    692 ;	-----------------------------------------
      008985                        693 _I2C_GetITStatus:
      008985 89               [ 2]  694 	pushw	x
                                    695 ;	lib/stm8s_i2c.c: 722: __IO uint8_t enablestatus = 0;
      008986 0F 01            [ 1]  696 	clr	(0x01, sp)
                                    697 ;	lib/stm8s_i2c.c: 725: tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
      008988 4F               [ 1]  698 	clr	a
      008989 7B 05            [ 1]  699 	ld	a, (0x05, sp)
      00898B A4 07            [ 1]  700 	and	a, #0x07
      00898D 97               [ 1]  701 	ld	xl, a
      00898E 4F               [ 1]  702 	clr	a
      00898F 4F               [ 1]  703 	clr	a
      008990 95               [ 1]  704 	ld	xh, a
                                    705 ;	lib/stm8s_i2c.c: 728: enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
      008991 90 AE 52 1A      [ 2]  706 	ldw	y, #0x521a
      008995 90 F6            [ 1]  707 	ld	a, (y)
      008997 89               [ 2]  708 	pushw	x
      008998 14 02            [ 1]  709 	and	a, (2, sp)
      00899A 85               [ 2]  710 	popw	x
      00899B 6B 01            [ 1]  711 	ld	(0x01, sp), a
                                    712 ;	lib/stm8s_i2c.c: 730: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      00899D 4F               [ 1]  713 	clr	a
      00899E 97               [ 1]  714 	ld	xl, a
      00899F 7B 05            [ 1]  715 	ld	a, (0x05, sp)
      0089A1 A4 30            [ 1]  716 	and	a, #0x30
      0089A3 95               [ 1]  717 	ld	xh, a
                                    718 ;	lib/stm8s_i2c.c: 733: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      0089A4 7B 06            [ 1]  719 	ld	a, (0x06, sp)
      0089A6 6B 02            [ 1]  720 	ld	(0x02, sp), a
                                    721 ;	lib/stm8s_i2c.c: 730: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      0089A8 A3 01 00         [ 2]  722 	cpw	x, #0x0100
      0089AB 26 14            [ 1]  723 	jrne	00110$
                                    724 ;	lib/stm8s_i2c.c: 733: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      0089AD AE 52 17         [ 2]  725 	ldw	x, #0x5217
      0089B0 F6               [ 1]  726 	ld	a, (x)
      0089B1 14 02            [ 1]  727 	and	a, (0x02, sp)
      0089B3 4D               [ 1]  728 	tnz	a
      0089B4 27 08            [ 1]  729 	jreq	00102$
      0089B6 0D 01            [ 1]  730 	tnz	(0x01, sp)
      0089B8 27 04            [ 1]  731 	jreq	00102$
                                    732 ;	lib/stm8s_i2c.c: 736: bitstatus = SET;
      0089BA A6 01            [ 1]  733 	ld	a, #0x01
      0089BC 20 14            [ 2]  734 	jra	00111$
      0089BE                        735 00102$:
                                    736 ;	lib/stm8s_i2c.c: 741: bitstatus = RESET;
      0089BE 4F               [ 1]  737 	clr	a
      0089BF 20 11            [ 2]  738 	jra	00111$
      0089C1                        739 00110$:
                                    740 ;	lib/stm8s_i2c.c: 747: if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
      0089C1 AE 52 18         [ 2]  741 	ldw	x, #0x5218
      0089C4 F6               [ 1]  742 	ld	a, (x)
      0089C5 14 02            [ 1]  743 	and	a, (0x02, sp)
      0089C7 4D               [ 1]  744 	tnz	a
      0089C8 27 07            [ 1]  745 	jreq	00106$
      0089CA 0D 01            [ 1]  746 	tnz	(0x01, sp)
      0089CC 27 03            [ 1]  747 	jreq	00106$
                                    748 ;	lib/stm8s_i2c.c: 750: bitstatus = SET;
      0089CE A6 01            [ 1]  749 	ld	a, #0x01
                                    750 ;	lib/stm8s_i2c.c: 755: bitstatus = RESET;
      0089D0 21                     751 	.byte 0x21
      0089D1                        752 00106$:
      0089D1 4F               [ 1]  753 	clr	a
      0089D2                        754 00111$:
                                    755 ;	lib/stm8s_i2c.c: 759: return  bitstatus;
      0089D2 85               [ 2]  756 	popw	x
      0089D3 81               [ 4]  757 	ret
                                    758 ;	lib/stm8s_i2c.c: 797: void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    759 ;	-----------------------------------------
                                    760 ;	 function I2C_ClearITPendingBit
                                    761 ;	-----------------------------------------
      0089D4                        762 _I2C_ClearITPendingBit:
                                    763 ;	lib/stm8s_i2c.c: 802: flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
      0089D4 7B 04            [ 1]  764 	ld	a, (0x04, sp)
      0089D6 97               [ 1]  765 	ld	xl, a
      0089D7 4F               [ 1]  766 	clr	a
                                    767 ;	lib/stm8s_i2c.c: 805: I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
      0089D8 95               [ 1]  768 	ld	xh, a
      0089D9 53               [ 2]  769 	cplw	x
      0089DA 9F               [ 1]  770 	ld	a, xl
      0089DB AE 52 18         [ 2]  771 	ldw	x, #0x5218
      0089DE F7               [ 1]  772 	ld	(x), a
      0089DF 81               [ 4]  773 	ret
                                    774 	.area CODE
                                    775 	.area INITIALIZER
                                    776 	.area CABS (ABS)
