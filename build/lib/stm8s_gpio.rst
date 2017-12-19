                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_gpio
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_Init
                                     12 	.globl _GPIO_Write
                                     13 	.globl _GPIO_WriteHigh
                                     14 	.globl _GPIO_WriteLow
                                     15 	.globl _GPIO_WriteReverse
                                     16 	.globl _GPIO_ReadOutputData
                                     17 	.globl _GPIO_ReadInputData
                                     18 	.globl _GPIO_ReadInputPin
                                     19 	.globl _GPIO_ExternalPullUpConfig
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DATA
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area INITIALIZED
                                     28 ;--------------------------------------------------------
                                     29 ; absolute external ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DABS (ABS)
                                     32 ;--------------------------------------------------------
                                     33 ; global & static initialisations
                                     34 ;--------------------------------------------------------
                                     35 	.area HOME
                                     36 	.area GSINIT
                                     37 	.area GSFINAL
                                     38 	.area GSINIT
                                     39 ;--------------------------------------------------------
                                     40 ; Home
                                     41 ;--------------------------------------------------------
                                     42 	.area HOME
                                     43 	.area HOME
                                     44 ;--------------------------------------------------------
                                     45 ; code
                                     46 ;--------------------------------------------------------
                                     47 	.area CODE
                                     48 ;	lib/stm8s_gpio.c: 13: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     49 ;	-----------------------------------------
                                     50 ;	 function GPIO_Init
                                     51 ;	-----------------------------------------
      0085BD                         52 _GPIO_Init:
      0085BD 52 07            [ 2]   53 	sub	sp, #7
                                     54 ;	lib/stm8s_gpio.c: 16: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0085BF 16 0A            [ 2]   55 	ldw	y, (0x0a, sp)
      0085C1 17 06            [ 2]   56 	ldw	(0x06, sp), y
      0085C3 1E 06            [ 2]   57 	ldw	x, (0x06, sp)
      0085C5 7F               [ 1]   58 	clr	(x)
                                     59 ;	lib/stm8s_gpio.c: 17: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0085C6 1E 06            [ 2]   60 	ldw	x, (0x06, sp)
      0085C8 5C               [ 2]   61 	incw	x
      0085C9 5C               [ 2]   62 	incw	x
      0085CA 1F 04            [ 2]   63 	ldw	(0x04, sp), x
      0085CC 1E 04            [ 2]   64 	ldw	x, (0x04, sp)
      0085CE 7F               [ 1]   65 	clr	(x)
                                     66 ;	lib/stm8s_gpio.c: 18: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0085CF 1E 06            [ 2]   67 	ldw	x, (0x06, sp)
      0085D1 1C 00 03         [ 2]   68 	addw	x, #0x0003
      0085D4 1F 01            [ 2]   69 	ldw	(0x01, sp), x
      0085D6 1E 01            [ 2]   70 	ldw	x, (0x01, sp)
      0085D8 7F               [ 1]   71 	clr	(x)
                                     72 ;	lib/stm8s_gpio.c: 19: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0085D9 16 06            [ 2]   73 	ldw	y, (0x06, sp)
      0085DB 72 A9 00 04      [ 2]   74 	addw	y, #0x0004
      0085DF 90 7F            [ 1]   75 	clr	(y)
                                     76 ;	lib/stm8s_gpio.c: 22: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin)); /* Reset corresponding bit to GPIO_Pin in CR2 register */
      0085E1 90 F6            [ 1]   77 	ld	a, (y)
      0085E3 88               [ 1]   78 	push	a
      0085E4 7B 0D            [ 1]   79 	ld	a, (0x0d, sp)
      0085E6 43               [ 1]   80 	cpl	a
      0085E7 6B 04            [ 1]   81 	ld	(0x04, sp), a
      0085E9 84               [ 1]   82 	pop	a
      0085EA 14 03            [ 1]   83 	and	a, (0x03, sp)
      0085EC 90 F7            [ 1]   84 	ld	(y), a
                                     85 ;	lib/stm8s_gpio.c: 27: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      0085EE 0D 0D            [ 1]   86 	tnz	(0x0d, sp)
      0085F0 2A 22            [ 1]   87 	jrpl	00105$
                                     88 ;	lib/stm8s_gpio.c: 29: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      0085F2 7B 0D            [ 1]   89 	ld	a, (0x0d, sp)
      0085F4 A5 10            [ 1]   90 	bcp	a, #0x10
      0085F6 27 0A            [ 1]   91 	jreq	00102$
                                     92 ;	lib/stm8s_gpio.c: 31: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      0085F8 1E 06            [ 2]   93 	ldw	x, (0x06, sp)
      0085FA F6               [ 1]   94 	ld	a, (x)
      0085FB 1A 0C            [ 1]   95 	or	a, (0x0c, sp)
      0085FD 1E 06            [ 2]   96 	ldw	x, (0x06, sp)
      0085FF F7               [ 1]   97 	ld	(x), a
      008600 20 08            [ 2]   98 	jra	00103$
      008602                         99 00102$:
                                    100 ;	lib/stm8s_gpio.c: 35: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      008602 1E 06            [ 2]  101 	ldw	x, (0x06, sp)
      008604 F6               [ 1]  102 	ld	a, (x)
      008605 14 03            [ 1]  103 	and	a, (0x03, sp)
      008607 1E 06            [ 2]  104 	ldw	x, (0x06, sp)
      008609 F7               [ 1]  105 	ld	(x), a
      00860A                        106 00103$:
                                    107 ;	lib/stm8s_gpio.c: 38: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      00860A 1E 04            [ 2]  108 	ldw	x, (0x04, sp)
      00860C F6               [ 1]  109 	ld	a, (x)
      00860D 1A 0C            [ 1]  110 	or	a, (0x0c, sp)
      00860F 1E 04            [ 2]  111 	ldw	x, (0x04, sp)
      008611 F7               [ 1]  112 	ld	(x), a
      008612 20 08            [ 2]  113 	jra	00106$
      008614                        114 00105$:
                                    115 ;	lib/stm8s_gpio.c: 43: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      008614 1E 04            [ 2]  116 	ldw	x, (0x04, sp)
      008616 F6               [ 1]  117 	ld	a, (x)
      008617 14 03            [ 1]  118 	and	a, (0x03, sp)
      008619 1E 04            [ 2]  119 	ldw	x, (0x04, sp)
      00861B F7               [ 1]  120 	ld	(x), a
      00861C                        121 00106$:
                                    122 ;	lib/stm8s_gpio.c: 48: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      00861C 7B 0D            [ 1]  123 	ld	a, (0x0d, sp)
      00861E A5 40            [ 1]  124 	bcp	a, #0x40
      008620 27 0A            [ 1]  125 	jreq	00108$
                                    126 ;	lib/stm8s_gpio.c: 50: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008622 1E 01            [ 2]  127 	ldw	x, (0x01, sp)
      008624 F6               [ 1]  128 	ld	a, (x)
      008625 1A 0C            [ 1]  129 	or	a, (0x0c, sp)
      008627 1E 01            [ 2]  130 	ldw	x, (0x01, sp)
      008629 F7               [ 1]  131 	ld	(x), a
      00862A 20 08            [ 2]  132 	jra	00109$
      00862C                        133 00108$:
                                    134 ;	lib/stm8s_gpio.c: 54: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      00862C 1E 01            [ 2]  135 	ldw	x, (0x01, sp)
      00862E F6               [ 1]  136 	ld	a, (x)
      00862F 14 03            [ 1]  137 	and	a, (0x03, sp)
      008631 1E 01            [ 2]  138 	ldw	x, (0x01, sp)
      008633 F7               [ 1]  139 	ld	(x), a
      008634                        140 00109$:
                                    141 ;	lib/stm8s_gpio.c: 59: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      008634 7B 0D            [ 1]  142 	ld	a, (0x0d, sp)
      008636 A5 20            [ 1]  143 	bcp	a, #0x20
      008638 27 08            [ 1]  144 	jreq	00111$
                                    145 ;	lib/stm8s_gpio.c: 61: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      00863A 90 F6            [ 1]  146 	ld	a, (y)
      00863C 1A 0C            [ 1]  147 	or	a, (0x0c, sp)
      00863E 90 F7            [ 1]  148 	ld	(y), a
      008640 20 06            [ 2]  149 	jra	00113$
      008642                        150 00111$:
                                    151 ;	lib/stm8s_gpio.c: 65: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008642 90 F6            [ 1]  152 	ld	a, (y)
      008644 14 03            [ 1]  153 	and	a, (0x03, sp)
      008646 90 F7            [ 1]  154 	ld	(y), a
      008648                        155 00113$:
      008648 5B 07            [ 2]  156 	addw	sp, #7
      00864A 81               [ 4]  157 	ret
                                    158 ;	lib/stm8s_gpio.c: 69: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    159 ;	-----------------------------------------
                                    160 ;	 function GPIO_Write
                                    161 ;	-----------------------------------------
      00864B                        162 _GPIO_Write:
                                    163 ;	lib/stm8s_gpio.c: 71: GPIOx->ODR = PortVal;
      00864B 1E 03            [ 2]  164 	ldw	x, (0x03, sp)
      00864D 7B 05            [ 1]  165 	ld	a, (0x05, sp)
      00864F F7               [ 1]  166 	ld	(x), a
      008650 81               [ 4]  167 	ret
                                    168 ;	lib/stm8s_gpio.c: 74: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    169 ;	-----------------------------------------
                                    170 ;	 function GPIO_WriteHigh
                                    171 ;	-----------------------------------------
      008651                        172 _GPIO_WriteHigh:
                                    173 ;	lib/stm8s_gpio.c: 76: GPIOx->ODR |= (uint8_t)PortPins;
      008651 1E 03            [ 2]  174 	ldw	x, (0x03, sp)
      008653 F6               [ 1]  175 	ld	a, (x)
      008654 1A 05            [ 1]  176 	or	a, (0x05, sp)
      008656 F7               [ 1]  177 	ld	(x), a
      008657 81               [ 4]  178 	ret
                                    179 ;	lib/stm8s_gpio.c: 79: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    180 ;	-----------------------------------------
                                    181 ;	 function GPIO_WriteLow
                                    182 ;	-----------------------------------------
      008658                        183 _GPIO_WriteLow:
      008658 88               [ 1]  184 	push	a
                                    185 ;	lib/stm8s_gpio.c: 81: GPIOx->ODR &= (uint8_t)(~PortPins);
      008659 1E 04            [ 2]  186 	ldw	x, (0x04, sp)
      00865B F6               [ 1]  187 	ld	a, (x)
      00865C 6B 01            [ 1]  188 	ld	(0x01, sp), a
      00865E 7B 06            [ 1]  189 	ld	a, (0x06, sp)
      008660 43               [ 1]  190 	cpl	a
      008661 14 01            [ 1]  191 	and	a, (0x01, sp)
      008663 F7               [ 1]  192 	ld	(x), a
      008664 84               [ 1]  193 	pop	a
      008665 81               [ 4]  194 	ret
                                    195 ;	lib/stm8s_gpio.c: 84: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    196 ;	-----------------------------------------
                                    197 ;	 function GPIO_WriteReverse
                                    198 ;	-----------------------------------------
      008666                        199 _GPIO_WriteReverse:
                                    200 ;	lib/stm8s_gpio.c: 86: GPIOx->ODR ^= (uint8_t)PortPins;
      008666 1E 03            [ 2]  201 	ldw	x, (0x03, sp)
      008668 F6               [ 1]  202 	ld	a, (x)
      008669 18 05            [ 1]  203 	xor	a, (0x05, sp)
      00866B F7               [ 1]  204 	ld	(x), a
      00866C 81               [ 4]  205 	ret
                                    206 ;	lib/stm8s_gpio.c: 89: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
                                    207 ;	-----------------------------------------
                                    208 ;	 function GPIO_ReadOutputData
                                    209 ;	-----------------------------------------
      00866D                        210 _GPIO_ReadOutputData:
                                    211 ;	lib/stm8s_gpio.c: 91: return ((uint8_t)GPIOx->ODR);
      00866D 1E 03            [ 2]  212 	ldw	x, (0x03, sp)
      00866F F6               [ 1]  213 	ld	a, (x)
      008670 81               [ 4]  214 	ret
                                    215 ;	lib/stm8s_gpio.c: 94: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    216 ;	-----------------------------------------
                                    217 ;	 function GPIO_ReadInputData
                                    218 ;	-----------------------------------------
      008671                        219 _GPIO_ReadInputData:
                                    220 ;	lib/stm8s_gpio.c: 96: return ((uint8_t)GPIOx->IDR);
      008671 1E 03            [ 2]  221 	ldw	x, (0x03, sp)
      008673 E6 01            [ 1]  222 	ld	a, (0x1, x)
      008675 81               [ 4]  223 	ret
                                    224 ;	lib/stm8s_gpio.c: 99: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    225 ;	-----------------------------------------
                                    226 ;	 function GPIO_ReadInputPin
                                    227 ;	-----------------------------------------
      008676                        228 _GPIO_ReadInputPin:
                                    229 ;	lib/stm8s_gpio.c: 101: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      008676 1E 03            [ 2]  230 	ldw	x, (0x03, sp)
      008678 E6 01            [ 1]  231 	ld	a, (0x1, x)
      00867A 14 05            [ 1]  232 	and	a, (0x05, sp)
      00867C 81               [ 4]  233 	ret
                                    234 ;	lib/stm8s_gpio.c: 104: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    235 ;	-----------------------------------------
                                    236 ;	 function GPIO_ExternalPullUpConfig
                                    237 ;	-----------------------------------------
      00867D                        238 _GPIO_ExternalPullUpConfig:
      00867D 88               [ 1]  239 	push	a
                                    240 ;	lib/stm8s_gpio.c: 108: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      00867E 1E 04            [ 2]  241 	ldw	x, (0x04, sp)
      008680 1C 00 03         [ 2]  242 	addw	x, #0x0003
                                    243 ;	lib/stm8s_gpio.c: 106: if (NewState != DISABLE) /* External Pull-Up Set*/
      008683 0D 07            [ 1]  244 	tnz	(0x07, sp)
      008685 27 06            [ 1]  245 	jreq	00102$
                                    246 ;	lib/stm8s_gpio.c: 108: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008687 F6               [ 1]  247 	ld	a, (x)
      008688 1A 06            [ 1]  248 	or	a, (0x06, sp)
      00868A F7               [ 1]  249 	ld	(x), a
      00868B 20 09            [ 2]  250 	jra	00104$
      00868D                        251 00102$:
                                    252 ;	lib/stm8s_gpio.c: 111: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      00868D F6               [ 1]  253 	ld	a, (x)
      00868E 6B 01            [ 1]  254 	ld	(0x01, sp), a
      008690 7B 06            [ 1]  255 	ld	a, (0x06, sp)
      008692 43               [ 1]  256 	cpl	a
      008693 14 01            [ 1]  257 	and	a, (0x01, sp)
      008695 F7               [ 1]  258 	ld	(x), a
      008696                        259 00104$:
      008696 84               [ 1]  260 	pop	a
      008697 81               [ 4]  261 	ret
                                    262 	.area CODE
                                    263 	.area INITIALIZER
                                    264 	.area CABS (ABS)
