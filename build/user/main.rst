                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _TIM4_UPD_OVF_IRQHandler
                                     13 	.globl _delay
                                     14 	.globl _TIMER_Inc
                                     15 	.globl _TIMER_Init
                                     16 	.globl _Init
                                     17 	.globl _max7Seg
                                     18 	.globl _Max7219_Write_Byte
                                     19 	.globl _TIM4_ClearITPendingBit
                                     20 	.globl _IWDG_Enable
                                     21 	.globl _IWDG_ReloadCounter
                                     22 	.globl _IWDG_SetReload
                                     23 	.globl _IWDG_SetPrescaler
                                     24 	.globl _IWDG_WriteAccessCmd
                                     25 	.globl _GPIO_WriteLow
                                     26 	.globl _GPIO_WriteHigh
                                     27 	.globl _CLK_Config
                                     28 	.globl _IWDG_Config
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DATA
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area INITIALIZED
                                     37 ;--------------------------------------------------------
                                     38 ; Stack segment in internal ram 
                                     39 ;--------------------------------------------------------
                                     40 	.area	SSEG
      000018                         41 __start__stack:
      000018                         42 	.ds	1
                                     43 
                                     44 ;--------------------------------------------------------
                                     45 ; absolute external ram data
                                     46 ;--------------------------------------------------------
                                     47 	.area DABS (ABS)
                                     48 ;--------------------------------------------------------
                                     49 ; interrupt vector 
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
      008000                         52 __interrupt_vect:
      008000 82 00 80 83             53 	int s_GSINIT ;reset
      008004 82 00 00 00             54 	int 0x0000 ;trap
      008008 82 00 00 00             55 	int 0x0000 ;int0
      00800C 82 00 00 00             56 	int 0x0000 ;int1
      008010 82 00 00 00             57 	int 0x0000 ;int2
      008014 82 00 00 00             58 	int 0x0000 ;int3
      008018 82 00 00 00             59 	int 0x0000 ;int4
      00801C 82 00 00 00             60 	int 0x0000 ;int5
      008020 82 00 00 00             61 	int 0x0000 ;int6
      008024 82 00 00 00             62 	int 0x0000 ;int7
      008028 82 00 00 00             63 	int 0x0000 ;int8
      00802C 82 00 00 00             64 	int 0x0000 ;int9
      008030 82 00 00 00             65 	int 0x0000 ;int10
      008034 82 00 00 00             66 	int 0x0000 ;int11
      008038 82 00 00 00             67 	int 0x0000 ;int12
      00803C 82 00 00 00             68 	int 0x0000 ;int13
      008040 82 00 00 00             69 	int 0x0000 ;int14
      008044 82 00 00 00             70 	int 0x0000 ;int15
      008048 82 00 00 00             71 	int 0x0000 ;int16
      00804C 82 00 00 00             72 	int 0x0000 ;int17
      008050 82 00 00 00             73 	int 0x0000 ;int18
      008054 82 00 00 00             74 	int 0x0000 ;int19
      008058 82 00 00 00             75 	int 0x0000 ;int20
      00805C 82 00 00 00             76 	int 0x0000 ;int21
      008060 82 00 00 00             77 	int 0x0000 ;int22
      008064 82 00 80 AC             78 	int _TIM4_UPD_OVF_IRQHandler ;int23
      008068 82 00 00 00             79 	int 0x0000 ;int24
      00806C 82 00 00 00             80 	int 0x0000 ;int25
      008070 82 00 00 00             81 	int 0x0000 ;int26
      008074 82 00 00 00             82 	int 0x0000 ;int27
      008078 82 00 00 00             83 	int 0x0000 ;int28
      00807C 82 00 00 00             84 	int 0x0000 ;int29
                                     85 ;--------------------------------------------------------
                                     86 ; global & static initialisations
                                     87 ;--------------------------------------------------------
                                     88 	.area HOME
                                     89 	.area GSINIT
                                     90 	.area GSFINAL
                                     91 	.area GSINIT
      008083                         92 __sdcc_gs_init_startup:
      008083                         93 __sdcc_init_data:
                                     94 ; stm8_genXINIT() start
      008083 AE 00 17         [ 2]   95 	ldw x, #l_DATA
      008086 27 07            [ 1]   96 	jreq	00002$
      008088                         97 00001$:
      008088 72 4F 00 00      [ 1]   98 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]   99 	decw x
      00808D 26 F9            [ 1]  100 	jrne	00001$
      00808F                        101 00002$:
      00808F AE 00 00         [ 2]  102 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  103 	jreq	00004$
      008094                        104 00003$:
      008094 D6 88 AD         [ 1]  105 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 17         [ 1]  106 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  107 	decw	x
      00809B 26 F7            [ 1]  108 	jrne	00003$
      00809D                        109 00004$:
                                    110 ; stm8_genXINIT() end
                                    111 	.area GSFINAL
      00809D CC 80 80         [ 2]  112 	jp	__sdcc_program_startup
                                    113 ;--------------------------------------------------------
                                    114 ; Home
                                    115 ;--------------------------------------------------------
                                    116 	.area HOME
                                    117 	.area HOME
      008080                        118 __sdcc_program_startup:
      008080 CC 80 D2         [ 2]  119 	jp	_main
                                    120 ;	return from main will return to caller
                                    121 ;--------------------------------------------------------
                                    122 ; code
                                    123 ;--------------------------------------------------------
                                    124 	.area CODE
                                    125 ;	user/main.c: 25: void delay(uint16_t x)
                                    126 ;	-----------------------------------------
                                    127 ;	 function delay
                                    128 ;	-----------------------------------------
      0080A0                        129 _delay:
      0080A0 89               [ 2]  130 	pushw	x
                                    131 ;	user/main.c: 27: while(x--);
      0080A1 1E 05            [ 2]  132 	ldw	x, (0x05, sp)
      0080A3                        133 00101$:
      0080A3 1F 01            [ 2]  134 	ldw	(0x01, sp), x
      0080A5 5A               [ 2]  135 	decw	x
      0080A6 16 01            [ 2]  136 	ldw	y, (0x01, sp)
      0080A8 26 F9            [ 1]  137 	jrne	00101$
      0080AA 85               [ 2]  138 	popw	x
      0080AB 81               [ 4]  139 	ret
                                    140 ;	user/main.c: 30: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    141 ;	-----------------------------------------
                                    142 ;	 function TIM4_UPD_OVF_IRQHandler
                                    143 ;	-----------------------------------------
      0080AC                        144 _TIM4_UPD_OVF_IRQHandler:
      0080AC 62               [ 2]  145 	div	x, a
                                    146 ;	user/main.c: 32: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
      0080AD 4B 01            [ 1]  147 	push	#0x01
      0080AF CD 88 2B         [ 4]  148 	call	_TIM4_ClearITPendingBit
      0080B2 84               [ 1]  149 	pop	a
                                    150 ;	user/main.c: 33: TIMER_Inc();
      0080B3 CD 83 30         [ 4]  151 	call	_TIMER_Inc
                                    152 ;	user/main.c: 34: IWDG_ReloadCounter();
      0080B6 CD 86 54         [ 4]  153 	call	_IWDG_ReloadCounter
      0080B9 80               [11]  154 	iret
                                    155 ;	user/main.c: 37: void IWDG_Config(void)
                                    156 ;	-----------------------------------------
                                    157 ;	 function IWDG_Config
                                    158 ;	-----------------------------------------
      0080BA                        159 _IWDG_Config:
                                    160 ;	user/main.c: 41: IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
      0080BA 4B 55            [ 1]  161 	push	#0x55
      0080BC CD 86 3F         [ 4]  162 	call	_IWDG_WriteAccessCmd
      0080BF 84               [ 1]  163 	pop	a
                                    164 ;	user/main.c: 43: IWDG_SetPrescaler(IWDG_Prescaler_256);
      0080C0 4B 06            [ 1]  165 	push	#0x06
      0080C2 CD 86 46         [ 4]  166 	call	_IWDG_SetPrescaler
      0080C5 84               [ 1]  167 	pop	a
                                    168 ;	user/main.c: 47: IWDG_SetReload(250);
      0080C6 4B FA            [ 1]  169 	push	#0xfa
      0080C8 CD 86 4D         [ 4]  170 	call	_IWDG_SetReload
      0080CB 84               [ 1]  171 	pop	a
                                    172 ;	user/main.c: 49: IWDG_ReloadCounter();
      0080CC CD 86 54         [ 4]  173 	call	_IWDG_ReloadCounter
                                    174 ;	user/main.c: 51: IWDG_Enable();
      0080CF CC 86 59         [ 2]  175 	jp	_IWDG_Enable
                                    176 ;	user/main.c: 55: void main() 
                                    177 ;	-----------------------------------------
                                    178 ;	 function main
                                    179 ;	-----------------------------------------
      0080D2                        180 _main:
      0080D2 52 11            [ 2]  181 	sub	sp, #17
                                    182 ;	user/main.c: 58: const unsigned char data[11] = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70,0x7F, 0x7B, 0x00}; 
      0080D4 96               [ 1]  183 	ldw	x, sp
      0080D5 5C               [ 2]  184 	incw	x
      0080D6 1F 10            [ 2]  185 	ldw	(0x10, sp), x
      0080D8 1E 10            [ 2]  186 	ldw	x, (0x10, sp)
      0080DA A6 7E            [ 1]  187 	ld	a, #0x7e
      0080DC F7               [ 1]  188 	ld	(x), a
      0080DD 1E 10            [ 2]  189 	ldw	x, (0x10, sp)
      0080DF 5C               [ 2]  190 	incw	x
      0080E0 A6 30            [ 1]  191 	ld	a, #0x30
      0080E2 F7               [ 1]  192 	ld	(x), a
      0080E3 1E 10            [ 2]  193 	ldw	x, (0x10, sp)
      0080E5 5C               [ 2]  194 	incw	x
      0080E6 5C               [ 2]  195 	incw	x
      0080E7 A6 6D            [ 1]  196 	ld	a, #0x6d
      0080E9 F7               [ 1]  197 	ld	(x), a
      0080EA 1E 10            [ 2]  198 	ldw	x, (0x10, sp)
      0080EC A6 79            [ 1]  199 	ld	a, #0x79
      0080EE E7 03            [ 1]  200 	ld	(0x0003, x), a
      0080F0 1E 10            [ 2]  201 	ldw	x, (0x10, sp)
      0080F2 A6 33            [ 1]  202 	ld	a, #0x33
      0080F4 E7 04            [ 1]  203 	ld	(0x0004, x), a
      0080F6 1E 10            [ 2]  204 	ldw	x, (0x10, sp)
      0080F8 A6 5B            [ 1]  205 	ld	a, #0x5b
      0080FA E7 05            [ 1]  206 	ld	(0x0005, x), a
      0080FC 1E 10            [ 2]  207 	ldw	x, (0x10, sp)
      0080FE A6 5F            [ 1]  208 	ld	a, #0x5f
      008100 E7 06            [ 1]  209 	ld	(0x0006, x), a
      008102 1E 10            [ 2]  210 	ldw	x, (0x10, sp)
      008104 A6 70            [ 1]  211 	ld	a, #0x70
      008106 E7 07            [ 1]  212 	ld	(0x0007, x), a
      008108 1E 10            [ 2]  213 	ldw	x, (0x10, sp)
      00810A A6 7F            [ 1]  214 	ld	a, #0x7f
      00810C E7 08            [ 1]  215 	ld	(0x0008, x), a
      00810E 1E 10            [ 2]  216 	ldw	x, (0x10, sp)
      008110 A6 7B            [ 1]  217 	ld	a, #0x7b
      008112 E7 09            [ 1]  218 	ld	(0x0009, x), a
      008114 1E 10            [ 2]  219 	ldw	x, (0x10, sp)
      008116 1C 00 0A         [ 2]  220 	addw	x, #0x000a
      008119 7F               [ 1]  221 	clr	(x)
                                    222 ;	user/main.c: 59: CLK_Config();
      00811A CD 84 29         [ 4]  223 	call	_CLK_Config
                                    224 ;	user/main.c: 62: max7Seg(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 8);
      00811D 4B 08            [ 1]  225 	push	#0x08
      00811F 4B 20            [ 1]  226 	push	#0x20
      008121 4B 10            [ 1]  227 	push	#0x10
      008123 4B 40            [ 1]  228 	push	#0x40
      008125 4B 0A            [ 1]  229 	push	#0x0a
      008127 4B 50            [ 1]  230 	push	#0x50
      008129 CD 81 8A         [ 4]  231 	call	_max7Seg
      00812C 5B 06            [ 2]  232 	addw	sp, #6
                                    233 ;	user/main.c: 63: Init();
      00812E CD 82 5E         [ 4]  234 	call	_Init
                                    235 ;	user/main.c: 64: TIMER_Init();
      008131 CD 82 FD         [ 4]  236 	call	_TIMER_Init
                                    237 ;	user/main.c: 65: IWDG_Config();
      008134 CD 80 BA         [ 4]  238 	call	_IWDG_Config
                                    239 ;	user/main.c: 66: enableInterrupts();
      008137 9A               [ 1]  240 	rim
                                    241 ;	user/main.c: 67: GPIO_WriteLow(max7seg.port, max7seg.cs);
      008138 AE 00 01         [ 2]  242 	ldw	x, #_max7seg+0
      00813B 1F 0E            [ 2]  243 	ldw	(0x0e, sp), x
      00813D 1E 0E            [ 2]  244 	ldw	x, (0x0e, sp)
      00813F 1C 00 03         [ 2]  245 	addw	x, #0x0003
      008142 1F 0C            [ 2]  246 	ldw	(0x0c, sp), x
      008144 1E 0C            [ 2]  247 	ldw	x, (0x0c, sp)
      008146 F6               [ 1]  248 	ld	a, (x)
      008147 1E 0E            [ 2]  249 	ldw	x, (0x0e, sp)
      008149 FE               [ 2]  250 	ldw	x, (x)
      00814A 88               [ 1]  251 	push	a
      00814B 89               [ 2]  252 	pushw	x
      00814C CD 85 FF         [ 4]  253 	call	_GPIO_WriteLow
      00814F 5B 03            [ 2]  254 	addw	sp, #3
                                    255 ;	user/main.c: 68: Max7219_Write_Byte(DIG0);
      008151 4B 01            [ 1]  256 	push	#0x01
      008153 CD 81 C3         [ 4]  257 	call	_Max7219_Write_Byte
      008156 84               [ 1]  258 	pop	a
                                    259 ;	user/main.c: 69: Max7219_Write_Byte(data[0]);
      008157 1E 10            [ 2]  260 	ldw	x, (0x10, sp)
      008159 F6               [ 1]  261 	ld	a, (x)
      00815A 88               [ 1]  262 	push	a
      00815B CD 81 C3         [ 4]  263 	call	_Max7219_Write_Byte
      00815E 84               [ 1]  264 	pop	a
                                    265 ;	user/main.c: 70: GPIO_WriteLow(max7seg.port, max7seg.cs);
      00815F 1E 0C            [ 2]  266 	ldw	x, (0x0c, sp)
      008161 F6               [ 1]  267 	ld	a, (x)
      008162 1E 0E            [ 2]  268 	ldw	x, (0x0e, sp)
      008164 FE               [ 2]  269 	ldw	x, (x)
      008165 88               [ 1]  270 	push	a
      008166 89               [ 2]  271 	pushw	x
      008167 CD 85 FF         [ 4]  272 	call	_GPIO_WriteLow
      00816A 5B 03            [ 2]  273 	addw	sp, #3
                                    274 ;	user/main.c: 71: GPIO_WriteHigh(max7seg.port, max7seg.cs);
      00816C 1E 0C            [ 2]  275 	ldw	x, (0x0c, sp)
      00816E F6               [ 1]  276 	ld	a, (x)
      00816F 1E 0E            [ 2]  277 	ldw	x, (0x0e, sp)
      008171 FE               [ 2]  278 	ldw	x, (x)
      008172 88               [ 1]  279 	push	a
      008173 89               [ 2]  280 	pushw	x
      008174 CD 85 F8         [ 4]  281 	call	_GPIO_WriteHigh
      008177 5B 03            [ 2]  282 	addw	sp, #3
                                    283 ;	user/main.c: 72: while(TRUE) 
      008179                        284 00102$:
      008179 20 FE            [ 2]  285 	jra	00102$
      00817B 5B 11            [ 2]  286 	addw	sp, #17
      00817D 81               [ 4]  287 	ret
                                    288 	.area CODE
                                    289 	.area INITIALIZER
                                    290 	.area CABS (ABS)
