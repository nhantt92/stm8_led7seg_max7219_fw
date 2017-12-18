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
      008564                         52 _GPIO_Init:
      008564 52 07            [ 2]   53 	sub	sp, #7
                                     54 ;	lib/stm8s_gpio.c: 16: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      008566 16 0A            [ 2]   55 	ldw	y, (0x0a, sp)
      008568 17 06            [ 2]   56 	ldw	(0x06, sp), y
      00856A 1E 06            [ 2]   57 	ldw	x, (0x06, sp)
      00856C 7F               [ 1]   58 	clr	(x)
                                     59 ;	lib/stm8s_gpio.c: 17: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      00856D 1E 06            [ 2]   60 	ldw	x, (0x06, sp)
      00856F 5C               [ 2]   61 	incw	x
      008570 5C               [ 2]   62 	incw	x
      008571 1F 04            [ 2]   63 	ldw	(0x04, sp), x
      008573 1E 04            [ 2]   64 	ldw	x, (0x04, sp)
      008575 7F               [ 1]   65 	clr	(x)
                                     66 ;	lib/stm8s_gpio.c: 18: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      008576 1E 06            [ 2]   67 	ldw	x, (0x06, sp)
      008578 1C 00 03         [ 2]   68 	addw	x, #0x0003
      00857B 1F 01            [ 2]   69 	ldw	(0x01, sp), x
      00857D 1E 01            [ 2]   70 	ldw	x, (0x01, sp)
      00857F 7F               [ 1]   71 	clr	(x)
                                     72 ;	lib/stm8s_gpio.c: 19: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      008580 16 06            [ 2]   73 	ldw	y, (0x06, sp)
      008582 72 A9 00 04      [ 2]   74 	addw	y, #0x0004
      008586 90 7F            [ 1]   75 	clr	(y)
                                     76 ;	lib/stm8s_gpio.c: 22: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin)); /* Reset corresponding bit to GPIO_Pin in CR2 register */
      008588 90 F6            [ 1]   77 	ld	a, (y)
      00858A 88               [ 1]   78 	push	a
      00858B 7B 0D            [ 1]   79 	ld	a, (0x0d, sp)
      00858D 43               [ 1]   80 	cpl	a
      00858E 6B 04            [ 1]   81 	ld	(0x04, sp), a
      008590 84               [ 1]   82 	pop	a
      008591 14 03            [ 1]   83 	and	a, (0x03, sp)
      008593 90 F7            [ 1]   84 	ld	(y), a
                                     85 ;	lib/stm8s_gpio.c: 27: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      008595 0D 0D            [ 1]   86 	tnz	(0x0d, sp)
      008597 2A 22            [ 1]   87 	jrpl	00105$
                                     88 ;	lib/stm8s_gpio.c: 29: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      008599 7B 0D            [ 1]   89 	ld	a, (0x0d, sp)
      00859B A5 10            [ 1]   90 	bcp	a, #0x10
      00859D 27 0A            [ 1]   91 	jreq	00102$
                                     92 ;	lib/stm8s_gpio.c: 31: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      00859F 1E 06            [ 2]   93 	ldw	x, (0x06, sp)
      0085A1 F6               [ 1]   94 	ld	a, (x)
      0085A2 1A 0C            [ 1]   95 	or	a, (0x0c, sp)
      0085A4 1E 06            [ 2]   96 	ldw	x, (0x06, sp)
      0085A6 F7               [ 1]   97 	ld	(x), a
      0085A7 20 08            [ 2]   98 	jra	00103$
      0085A9                         99 00102$:
                                    100 ;	lib/stm8s_gpio.c: 35: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      0085A9 1E 06            [ 2]  101 	ldw	x, (0x06, sp)
      0085AB F6               [ 1]  102 	ld	a, (x)
      0085AC 14 03            [ 1]  103 	and	a, (0x03, sp)
      0085AE 1E 06            [ 2]  104 	ldw	x, (0x06, sp)
      0085B0 F7               [ 1]  105 	ld	(x), a
      0085B1                        106 00103$:
                                    107 ;	lib/stm8s_gpio.c: 38: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      0085B1 1E 04            [ 2]  108 	ldw	x, (0x04, sp)
      0085B3 F6               [ 1]  109 	ld	a, (x)
      0085B4 1A 0C            [ 1]  110 	or	a, (0x0c, sp)
      0085B6 1E 04            [ 2]  111 	ldw	x, (0x04, sp)
      0085B8 F7               [ 1]  112 	ld	(x), a
      0085B9 20 08            [ 2]  113 	jra	00106$
      0085BB                        114 00105$:
                                    115 ;	lib/stm8s_gpio.c: 43: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      0085BB 1E 04            [ 2]  116 	ldw	x, (0x04, sp)
      0085BD F6               [ 1]  117 	ld	a, (x)
      0085BE 14 03            [ 1]  118 	and	a, (0x03, sp)
      0085C0 1E 04            [ 2]  119 	ldw	x, (0x04, sp)
      0085C2 F7               [ 1]  120 	ld	(x), a
      0085C3                        121 00106$:
                                    122 ;	lib/stm8s_gpio.c: 48: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      0085C3 7B 0D            [ 1]  123 	ld	a, (0x0d, sp)
      0085C5 A5 40            [ 1]  124 	bcp	a, #0x40
      0085C7 27 0A            [ 1]  125 	jreq	00108$
                                    126 ;	lib/stm8s_gpio.c: 50: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0085C9 1E 01            [ 2]  127 	ldw	x, (0x01, sp)
      0085CB F6               [ 1]  128 	ld	a, (x)
      0085CC 1A 0C            [ 1]  129 	or	a, (0x0c, sp)
      0085CE 1E 01            [ 2]  130 	ldw	x, (0x01, sp)
      0085D0 F7               [ 1]  131 	ld	(x), a
      0085D1 20 08            [ 2]  132 	jra	00109$
      0085D3                        133 00108$:
                                    134 ;	lib/stm8s_gpio.c: 54: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      0085D3 1E 01            [ 2]  135 	ldw	x, (0x01, sp)
      0085D5 F6               [ 1]  136 	ld	a, (x)
      0085D6 14 03            [ 1]  137 	and	a, (0x03, sp)
      0085D8 1E 01            [ 2]  138 	ldw	x, (0x01, sp)
      0085DA F7               [ 1]  139 	ld	(x), a
      0085DB                        140 00109$:
                                    141 ;	lib/stm8s_gpio.c: 59: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      0085DB 7B 0D            [ 1]  142 	ld	a, (0x0d, sp)
      0085DD A5 20            [ 1]  143 	bcp	a, #0x20
      0085DF 27 08            [ 1]  144 	jreq	00111$
                                    145 ;	lib/stm8s_gpio.c: 61: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      0085E1 90 F6            [ 1]  146 	ld	a, (y)
      0085E3 1A 0C            [ 1]  147 	or	a, (0x0c, sp)
      0085E5 90 F7            [ 1]  148 	ld	(y), a
      0085E7 20 06            [ 2]  149 	jra	00113$
      0085E9                        150 00111$:
                                    151 ;	lib/stm8s_gpio.c: 65: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      0085E9 90 F6            [ 1]  152 	ld	a, (y)
      0085EB 14 03            [ 1]  153 	and	a, (0x03, sp)
      0085ED 90 F7            [ 1]  154 	ld	(y), a
      0085EF                        155 00113$:
      0085EF 5B 07            [ 2]  156 	addw	sp, #7
      0085F1 81               [ 4]  157 	ret
                                    158 ;	lib/stm8s_gpio.c: 69: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    159 ;	-----------------------------------------
                                    160 ;	 function GPIO_Write
                                    161 ;	-----------------------------------------
      0085F2                        162 _GPIO_Write:
                                    163 ;	lib/stm8s_gpio.c: 71: GPIOx->ODR = PortVal;
      0085F2 1E 03            [ 2]  164 	ldw	x, (0x03, sp)
      0085F4 7B 05            [ 1]  165 	ld	a, (0x05, sp)
      0085F6 F7               [ 1]  166 	ld	(x), a
      0085F7 81               [ 4]  167 	ret
                                    168 ;	lib/stm8s_gpio.c: 74: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    169 ;	-----------------------------------------
                                    170 ;	 function GPIO_WriteHigh
                                    171 ;	-----------------------------------------
      0085F8                        172 _GPIO_WriteHigh:
                                    173 ;	lib/stm8s_gpio.c: 76: GPIOx->ODR |= (uint8_t)PortPins;
      0085F8 1E 03            [ 2]  174 	ldw	x, (0x03, sp)
      0085FA F6               [ 1]  175 	ld	a, (x)
      0085FB 1A 05            [ 1]  176 	or	a, (0x05, sp)
      0085FD F7               [ 1]  177 	ld	(x), a
      0085FE 81               [ 4]  178 	ret
                                    179 ;	lib/stm8s_gpio.c: 79: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    180 ;	-----------------------------------------
                                    181 ;	 function GPIO_WriteLow
                                    182 ;	-----------------------------------------
      0085FF                        183 _GPIO_WriteLow:
      0085FF 88               [ 1]  184 	push	a
                                    185 ;	lib/stm8s_gpio.c: 81: GPIOx->ODR &= (uint8_t)(~PortPins);
      008600 1E 04            [ 2]  186 	ldw	x, (0x04, sp)
      008602 F6               [ 1]  187 	ld	a, (x)
      008603 6B 01            [ 1]  188 	ld	(0x01, sp), a
      008605 7B 06            [ 1]  189 	ld	a, (0x06, sp)
      008607 43               [ 1]  190 	cpl	a
      008608 14 01            [ 1]  191 	and	a, (0x01, sp)
      00860A F7               [ 1]  192 	ld	(x), a
      00860B 84               [ 1]  193 	pop	a
      00860C 81               [ 4]  194 	ret
                                    195 ;	lib/stm8s_gpio.c: 84: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    196 ;	-----------------------------------------
                                    197 ;	 function GPIO_WriteReverse
                                    198 ;	-----------------------------------------
      00860D                        199 _GPIO_WriteReverse:
                                    200 ;	lib/stm8s_gpio.c: 86: GPIOx->ODR ^= (uint8_t)PortPins;
      00860D 1E 03            [ 2]  201 	ldw	x, (0x03, sp)
      00860F F6               [ 1]  202 	ld	a, (x)
      008610 18 05            [ 1]  203 	xor	a, (0x05, sp)
      008612 F7               [ 1]  204 	ld	(x), a
      008613 81               [ 4]  205 	ret
                                    206 ;	lib/stm8s_gpio.c: 89: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
                                    207 ;	-----------------------------------------
                                    208 ;	 function GPIO_ReadOutputData
                                    209 ;	-----------------------------------------
      008614                        210 _GPIO_ReadOutputData:
                                    211 ;	lib/stm8s_gpio.c: 91: return ((uint8_t)GPIOx->ODR);
      008614 1E 03            [ 2]  212 	ldw	x, (0x03, sp)
      008616 F6               [ 1]  213 	ld	a, (x)
      008617 81               [ 4]  214 	ret
                                    215 ;	lib/stm8s_gpio.c: 94: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    216 ;	-----------------------------------------
                                    217 ;	 function GPIO_ReadInputData
                                    218 ;	-----------------------------------------
      008618                        219 _GPIO_ReadInputData:
                                    220 ;	lib/stm8s_gpio.c: 96: return ((uint8_t)GPIOx->IDR);
      008618 1E 03            [ 2]  221 	ldw	x, (0x03, sp)
      00861A E6 01            [ 1]  222 	ld	a, (0x1, x)
      00861C 81               [ 4]  223 	ret
                                    224 ;	lib/stm8s_gpio.c: 99: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    225 ;	-----------------------------------------
                                    226 ;	 function GPIO_ReadInputPin
                                    227 ;	-----------------------------------------
      00861D                        228 _GPIO_ReadInputPin:
                                    229 ;	lib/stm8s_gpio.c: 101: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      00861D 1E 03            [ 2]  230 	ldw	x, (0x03, sp)
      00861F E6 01            [ 1]  231 	ld	a, (0x1, x)
      008621 14 05            [ 1]  232 	and	a, (0x05, sp)
      008623 81               [ 4]  233 	ret
                                    234 ;	lib/stm8s_gpio.c: 104: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    235 ;	-----------------------------------------
                                    236 ;	 function GPIO_ExternalPullUpConfig
                                    237 ;	-----------------------------------------
      008624                        238 _GPIO_ExternalPullUpConfig:
      008624 88               [ 1]  239 	push	a
                                    240 ;	lib/stm8s_gpio.c: 108: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008625 1E 04            [ 2]  241 	ldw	x, (0x04, sp)
      008627 1C 00 03         [ 2]  242 	addw	x, #0x0003
                                    243 ;	lib/stm8s_gpio.c: 106: if (NewState != DISABLE) /* External Pull-Up Set*/
      00862A 0D 07            [ 1]  244 	tnz	(0x07, sp)
      00862C 27 06            [ 1]  245 	jreq	00102$
                                    246 ;	lib/stm8s_gpio.c: 108: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      00862E F6               [ 1]  247 	ld	a, (x)
      00862F 1A 06            [ 1]  248 	or	a, (0x06, sp)
      008631 F7               [ 1]  249 	ld	(x), a
      008632 20 09            [ 2]  250 	jra	00104$
      008634                        251 00102$:
                                    252 ;	lib/stm8s_gpio.c: 111: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008634 F6               [ 1]  253 	ld	a, (x)
      008635 6B 01            [ 1]  254 	ld	(0x01, sp), a
      008637 7B 06            [ 1]  255 	ld	a, (0x06, sp)
      008639 43               [ 1]  256 	cpl	a
      00863A 14 01            [ 1]  257 	and	a, (0x01, sp)
      00863C F7               [ 1]  258 	ld	(x), a
      00863D                        259 00104$:
      00863D 84               [ 1]  260 	pop	a
      00863E 81               [ 4]  261 	ret
                                    262 	.area CODE
                                    263 	.area INITIALIZER
                                    264 	.area CABS (ABS)
