                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module RTC_pcf8563
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _PCF_getAndClearFlags
                                     12 	.globl _I2C_GetFlagStatus
                                     13 	.globl _I2C_CheckEvent
                                     14 	.globl _I2C_SendData
                                     15 	.globl _I2C_Send7bitAddress
                                     16 	.globl _I2C_ReceiveData
                                     17 	.globl _I2C_AcknowledgeConfig
                                     18 	.globl _I2C_GenerateSTOP
                                     19 	.globl _I2C_GenerateSTART
                                     20 	.globl _I2C_Cmd
                                     21 	.globl _I2C_Init
                                     22 	.globl _I2C_DeInit
                                     23 	.globl _CLK_GetClockFreq
                                     24 	.globl _CLK_PeripheralClockConfig
                                     25 	.globl _PCF_Write
                                     26 	.globl _PCF_Read
                                     27 	.globl _PCF_Init
                                     28 	.globl _PCF_setDateTime
                                     29 	.globl _PCF_getDateTime
                                     30 	.globl _PCF_setAlarm
                                     31 	.globl _PCF_setTimer
                                     32 	.globl _PCF_getTimer
                                     33 	.globl _PCF_getAlarm
                                     34 	.globl _PCF_setClockOut
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area DATA
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area INITIALIZED
                                     43 ;--------------------------------------------------------
                                     44 ; absolute external ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area DABS (ABS)
                                     47 ;--------------------------------------------------------
                                     48 ; global & static initialisations
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area GSINIT
                                     54 ;--------------------------------------------------------
                                     55 ; Home
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area HOME
                                     59 ;--------------------------------------------------------
                                     60 ; code
                                     61 ;--------------------------------------------------------
                                     62 	.area CODE
                                     63 ;	user/RTC_pcf8563.c: 7: static void IIC_Init(uint32_t clock_frequency, uint16_t own_addr)
                                     64 ;	-----------------------------------------
                                     65 ;	 function IIC_Init
                                     66 ;	-----------------------------------------
      0080A0                         67 _IIC_Init:
                                     68 ;	user/RTC_pcf8563.c: 9: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
      0080A0 4B 01            [ 1]   69 	push	#0x01
      0080A2 4B 00            [ 1]   70 	push	#0x00
      0080A4 CD 8F FA         [ 4]   71 	call	_CLK_PeripheralClockConfig
      0080A7 85               [ 2]   72 	popw	x
                                     73 ;	user/RTC_pcf8563.c: 10: I2C_DeInit();
      0080A8 CD 91 BF         [ 4]   74 	call	_I2C_DeInit
                                     75 ;	user/RTC_pcf8563.c: 11: I2C_Init(clock_frequency, own_addr, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, (CLK_GetClockFreq()/1000000));
      0080AB CD 90 87         [ 4]   76 	call	_CLK_GetClockFreq
      0080AE 4B 40            [ 1]   77 	push	#0x40
      0080B0 4B 42            [ 1]   78 	push	#0x42
      0080B2 4B 0F            [ 1]   79 	push	#0x0f
      0080B4 4B 00            [ 1]   80 	push	#0x00
      0080B6 89               [ 2]   81 	pushw	x
      0080B7 90 89            [ 2]   82 	pushw	y
      0080B9 CD 96 FB         [ 4]   83 	call	__divulong
      0080BC 5B 08            [ 2]   84 	addw	sp, #8
      0080BE 9F               [ 1]   85 	ld	a, xl
      0080BF 88               [ 1]   86 	push	a
      0080C0 4B 00            [ 1]   87 	push	#0x00
      0080C2 4B 01            [ 1]   88 	push	#0x01
      0080C4 4B 00            [ 1]   89 	push	#0x00
      0080C6 1E 0B            [ 2]   90 	ldw	x, (0x0b, sp)
      0080C8 89               [ 2]   91 	pushw	x
      0080C9 1E 0B            [ 2]   92 	ldw	x, (0x0b, sp)
      0080CB 89               [ 2]   93 	pushw	x
      0080CC 1E 0B            [ 2]   94 	ldw	x, (0x0b, sp)
      0080CE 89               [ 2]   95 	pushw	x
      0080CF CD 91 E4         [ 4]   96 	call	_I2C_Init
      0080D2 5B 0A            [ 2]   97 	addw	sp, #10
                                     98 ;	user/RTC_pcf8563.c: 12: I2C_Cmd(ENABLE);
      0080D4 4B 01            [ 1]   99 	push	#0x01
      0080D6 CD 93 12         [ 4]  100 	call	_I2C_Cmd
      0080D9 84               [ 1]  101 	pop	a
      0080DA 81               [ 4]  102 	ret
                                    103 ;	user/RTC_pcf8563.c: 15: void PCF_Write(uint8_t addr, uint8_t *data, uint8_t count)
                                    104 ;	-----------------------------------------
                                    105 ;	 function PCF_Write
                                    106 ;	-----------------------------------------
      0080DB                        107 _PCF_Write:
      0080DB 88               [ 1]  108 	push	a
                                    109 ;	user/RTC_pcf8563.c: 19: I2C_GenerateSTART(ENABLE);
      0080DC 4B 01            [ 1]  110 	push	#0x01
      0080DE CD 93 34         [ 4]  111 	call	_I2C_GenerateSTART
      0080E1 84               [ 1]  112 	pop	a
                                    113 ;	user/RTC_pcf8563.c: 23: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
      0080E2 4B 00            [ 1]  114 	push	#0x00
      0080E4 4B A2            [ 1]  115 	push	#0xa2
      0080E6 CD 93 D8         [ 4]  116 	call	_I2C_Send7bitAddress
      0080E9 85               [ 2]  117 	popw	x
                                    118 ;	user/RTC_pcf8563.c: 26: I2C_SendData(addr);
      0080EA 7B 04            [ 1]  119 	ld	a, (0x04, sp)
      0080EC 88               [ 1]  120 	push	a
      0080ED CD 93 E7         [ 4]  121 	call	_I2C_SendData
      0080F0 84               [ 1]  122 	pop	a
                                    123 ;	user/RTC_pcf8563.c: 29: while(count){
      0080F1 7B 07            [ 1]  124 	ld	a, (0x07, sp)
      0080F3 6B 01            [ 1]  125 	ld	(0x01, sp), a
      0080F5 1E 05            [ 2]  126 	ldw	x, (0x05, sp)
      0080F7                        127 00101$:
      0080F7 0D 01            [ 1]  128 	tnz	(0x01, sp)
      0080F9 27 0D            [ 1]  129 	jreq	00103$
                                    130 ;	user/RTC_pcf8563.c: 30: count--;
      0080FB 0A 01            [ 1]  131 	dec	(0x01, sp)
                                    132 ;	user/RTC_pcf8563.c: 31: I2C_SendData(*data);
      0080FD F6               [ 1]  133 	ld	a, (x)
      0080FE 89               [ 2]  134 	pushw	x
      0080FF 88               [ 1]  135 	push	a
      008100 CD 93 E7         [ 4]  136 	call	_I2C_SendData
      008103 84               [ 1]  137 	pop	a
      008104 85               [ 2]  138 	popw	x
                                    139 ;	user/RTC_pcf8563.c: 32: data++;
      008105 5C               [ 2]  140 	incw	x
      008106 20 EF            [ 2]  141 	jra	00101$
      008108                        142 00103$:
                                    143 ;	user/RTC_pcf8563.c: 35: I2C_GenerateSTOP(ENABLE);
      008108 4B 01            [ 1]  144 	push	#0x01
      00810A CD 93 42         [ 4]  145 	call	_I2C_GenerateSTOP
      00810D 84               [ 1]  146 	pop	a
      00810E 84               [ 1]  147 	pop	a
      00810F 81               [ 4]  148 	ret
                                    149 ;	user/RTC_pcf8563.c: 38: void PCF_Read(uint8_t addr, uint8_t *data, uint8_t count)
                                    150 ;	-----------------------------------------
                                    151 ;	 function PCF_Read
                                    152 ;	-----------------------------------------
      008110                        153 _PCF_Read:
      008110 52 03            [ 2]  154 	sub	sp, #3
                                    155 ;	user/RTC_pcf8563.c: 40: while(!I2C_GetFlagStatus( I2C_FLAG_BUSBUSY));
      008112                        156 00101$:
      008112 4B 02            [ 1]  157 	push	#0x02
      008114 4B 03            [ 1]  158 	push	#0x03
      008116 CD 94 69         [ 4]  159 	call	_I2C_GetFlagStatus
      008119 85               [ 2]  160 	popw	x
      00811A 4D               [ 1]  161 	tnz	a
      00811B 27 F5            [ 1]  162 	jreq	00101$
                                    163 ;	user/RTC_pcf8563.c: 41: I2C_GenerateSTART(ENABLE);
      00811D 4B 01            [ 1]  164 	push	#0x01
      00811F CD 93 34         [ 4]  165 	call	_I2C_GenerateSTART
      008122 84               [ 1]  166 	pop	a
                                    167 ;	user/RTC_pcf8563.c: 43: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
      008123                        168 00104$:
      008123 4B 01            [ 1]  169 	push	#0x01
      008125 4B 03            [ 1]  170 	push	#0x03
      008127 CD 93 EE         [ 4]  171 	call	_I2C_CheckEvent
      00812A 85               [ 2]  172 	popw	x
      00812B 4D               [ 1]  173 	tnz	a
      00812C 27 F5            [ 1]  174 	jreq	00104$
                                    175 ;	user/RTC_pcf8563.c: 44: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
      00812E 4B 00            [ 1]  176 	push	#0x00
      008130 4B A2            [ 1]  177 	push	#0xa2
      008132 CD 93 D8         [ 4]  178 	call	_I2C_Send7bitAddress
      008135 85               [ 2]  179 	popw	x
                                    180 ;	user/RTC_pcf8563.c: 45: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
      008136                        181 00107$:
      008136 4B 82            [ 1]  182 	push	#0x82
      008138 4B 07            [ 1]  183 	push	#0x07
      00813A CD 93 EE         [ 4]  184 	call	_I2C_CheckEvent
      00813D 85               [ 2]  185 	popw	x
      00813E 4D               [ 1]  186 	tnz	a
      00813F 27 F5            [ 1]  187 	jreq	00107$
                                    188 ;	user/RTC_pcf8563.c: 47: I2C_SendData(addr);
      008141 7B 06            [ 1]  189 	ld	a, (0x06, sp)
      008143 88               [ 1]  190 	push	a
      008144 CD 93 E7         [ 4]  191 	call	_I2C_SendData
      008147 84               [ 1]  192 	pop	a
                                    193 ;	user/RTC_pcf8563.c: 48: while(!I2C_CheckEvent(I2C_FLAG_TRANSFERFINISHED));
      008148                        194 00110$:
      008148 4B 04            [ 1]  195 	push	#0x04
      00814A 4B 01            [ 1]  196 	push	#0x01
      00814C CD 93 EE         [ 4]  197 	call	_I2C_CheckEvent
      00814F 85               [ 2]  198 	popw	x
      008150 4D               [ 1]  199 	tnz	a
      008151 27 F5            [ 1]  200 	jreq	00110$
                                    201 ;	user/RTC_pcf8563.c: 51: I2C_GenerateSTART(ENABLE);
      008153 4B 01            [ 1]  202 	push	#0x01
      008155 CD 93 34         [ 4]  203 	call	_I2C_GenerateSTART
      008158 84               [ 1]  204 	pop	a
                                    205 ;	user/RTC_pcf8563.c: 52: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
      008159                        206 00113$:
      008159 4B 01            [ 1]  207 	push	#0x01
      00815B 4B 03            [ 1]  208 	push	#0x03
      00815D CD 93 EE         [ 4]  209 	call	_I2C_CheckEvent
      008160 85               [ 2]  210 	popw	x
      008161 4D               [ 1]  211 	tnz	a
      008162 27 F5            [ 1]  212 	jreq	00113$
                                    213 ;	user/RTC_pcf8563.c: 54: I2C_Send7bitAddress(PCF8563_READ_ADDR, I2C_DIRECTION_RX);
      008164 4B 01            [ 1]  214 	push	#0x01
      008166 4B A3            [ 1]  215 	push	#0xa3
      008168 CD 93 D8         [ 4]  216 	call	_I2C_Send7bitAddress
      00816B 85               [ 2]  217 	popw	x
                                    218 ;	user/RTC_pcf8563.c: 56: while(I2C_GetFlagStatus(I2C_FLAG_ADDRESSSENTMATCHED) == RESET);
      00816C                        219 00116$:
      00816C 4B 02            [ 1]  220 	push	#0x02
      00816E 4B 01            [ 1]  221 	push	#0x01
      008170 CD 94 69         [ 4]  222 	call	_I2C_GetFlagStatus
      008173 85               [ 2]  223 	popw	x
      008174 4D               [ 1]  224 	tnz	a
      008175 27 F5            [ 1]  225 	jreq	00116$
                                    226 ;	user/RTC_pcf8563.c: 57: while(count)
      008177 7B 09            [ 1]  227 	ld	a, (0x09, sp)
      008179 6B 03            [ 1]  228 	ld	(0x03, sp), a
      00817B 16 07            [ 2]  229 	ldw	y, (0x07, sp)
      00817D 17 01            [ 2]  230 	ldw	(0x01, sp), y
      00817F                        231 00122$:
      00817F 0D 03            [ 1]  232 	tnz	(0x03, sp)
      008181 27 2E            [ 1]  233 	jreq	00124$
                                    234 ;	user/RTC_pcf8563.c: 59: count--;
      008183 0A 03            [ 1]  235 	dec	(0x03, sp)
                                    236 ;	user/RTC_pcf8563.c: 60: I2C_AcknowledgeConfig(I2C_ACK_NONE);
      008185 4B 00            [ 1]  237 	push	#0x00
      008187 CD 93 72         [ 4]  238 	call	_I2C_AcknowledgeConfig
      00818A 84               [ 1]  239 	pop	a
                                    240 ;	user/RTC_pcf8563.c: 63: I2C->SR1;        I2C->SR3;
      00818B AE 52 17         [ 2]  241 	ldw	x, #0x5217
      00818E F6               [ 1]  242 	ld	a, (x)
      00818F AE 52 19         [ 2]  243 	ldw	x, #0x5219
      008192 F6               [ 1]  244 	ld	a, (x)
                                    245 ;	user/RTC_pcf8563.c: 64: while (I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
      008193                        246 00119$:
      008193 4B 40            [ 1]  247 	push	#0x40
      008195 4B 01            [ 1]  248 	push	#0x01
      008197 CD 94 69         [ 4]  249 	call	_I2C_GetFlagStatus
      00819A 85               [ 2]  250 	popw	x
      00819B 4D               [ 1]  251 	tnz	a
      00819C 27 F5            [ 1]  252 	jreq	00119$
                                    253 ;	user/RTC_pcf8563.c: 65: *data = I2C_ReceiveData();
      00819E CD 93 D3         [ 4]  254 	call	_I2C_ReceiveData
      0081A1 1E 01            [ 2]  255 	ldw	x, (0x01, sp)
      0081A3 F7               [ 1]  256 	ld	(x), a
                                    257 ;	user/RTC_pcf8563.c: 66: data++;
      0081A4 1E 01            [ 2]  258 	ldw	x, (0x01, sp)
      0081A6 5C               [ 2]  259 	incw	x
      0081A7 1F 01            [ 2]  260 	ldw	(0x01, sp), x
                                    261 ;	user/RTC_pcf8563.c: 67: I2C_AcknowledgeConfig( I2C_ACK_CURR);
      0081A9 4B 01            [ 1]  262 	push	#0x01
      0081AB CD 93 72         [ 4]  263 	call	_I2C_AcknowledgeConfig
      0081AE 84               [ 1]  264 	pop	a
      0081AF 20 CE            [ 2]  265 	jra	00122$
      0081B1                        266 00124$:
                                    267 ;	user/RTC_pcf8563.c: 69: I2C_GenerateSTOP(ENABLE);
      0081B1 4B 01            [ 1]  268 	push	#0x01
      0081B3 CD 93 42         [ 4]  269 	call	_I2C_GenerateSTOP
      0081B6 5B 04            [ 2]  270 	addw	sp, #4
      0081B8 81               [ 4]  271 	ret
                                    272 ;	user/RTC_pcf8563.c: 72: void PCF_Init(uint8_t mode)
                                    273 ;	-----------------------------------------
                                    274 ;	 function PCF_Init
                                    275 ;	-----------------------------------------
      0081B9                        276 _PCF_Init:
      0081B9 88               [ 1]  277 	push	a
                                    278 ;	user/RTC_pcf8563.c: 74: uint8_t tmp = 0x00;
      0081BA 0F 01            [ 1]  279 	clr	(0x01, sp)
                                    280 ;	user/RTC_pcf8563.c: 75: IIC_Init(100000, 0xA2);
      0081BC 4B A2            [ 1]  281 	push	#0xa2
      0081BE 4B 00            [ 1]  282 	push	#0x00
      0081C0 4B A0            [ 1]  283 	push	#0xa0
      0081C2 4B 86            [ 1]  284 	push	#0x86
      0081C4 4B 01            [ 1]  285 	push	#0x01
      0081C6 4B 00            [ 1]  286 	push	#0x00
      0081C8 CD 80 A0         [ 4]  287 	call	_IIC_Init
      0081CB 5B 06            [ 2]  288 	addw	sp, #6
                                    289 ;	user/RTC_pcf8563.c: 76: PCF_Write(0x00, &tmp, 1);
      0081CD 96               [ 1]  290 	ldw	x, sp
      0081CE 5C               [ 2]  291 	incw	x
      0081CF 4B 01            [ 1]  292 	push	#0x01
      0081D1 89               [ 2]  293 	pushw	x
      0081D2 4B 00            [ 1]  294 	push	#0x00
      0081D4 CD 80 DB         [ 4]  295 	call	_PCF_Write
      0081D7 5B 05            [ 2]  296 	addw	sp, #5
      0081D9 81               [ 4]  297 	ret
                                    298 ;	user/RTC_pcf8563.c: 81: uint8_t PCF_setDateTime(PCF_DateTime *dateTime)
                                    299 ;	-----------------------------------------
                                    300 ;	 function PCF_setDateTime
                                    301 ;	-----------------------------------------
      0081DA                        302 _PCF_setDateTime:
      0081DA 52 26            [ 2]  303 	sub	sp, #38
                                    304 ;	user/RTC_pcf8563.c: 84: if (dateTime->second >= 60 || dateTime->minute >= 60 || dateTime->hour >= 24 || dateTime->day > 32 || dateTime->weekday > 6 || dateTime->month > 12 || dateTime->year < 1900 || dateTime->year >= 2100)
      0081DC 16 29            [ 2]  305 	ldw	y, (0x29, sp)
      0081DE 17 16            [ 2]  306 	ldw	(0x16, sp), y
      0081E0 1E 16            [ 2]  307 	ldw	x, (0x16, sp)
      0081E2 F6               [ 1]  308 	ld	a, (x)
      0081E3 6B 23            [ 1]  309 	ld	(0x23, sp), a
      0081E5 7B 23            [ 1]  310 	ld	a, (0x23, sp)
      0081E7 A1 3C            [ 1]  311 	cp	a, #0x3c
      0081E9 24 55            [ 1]  312 	jrnc	00101$
      0081EB 16 16            [ 2]  313 	ldw	y, (0x16, sp)
      0081ED 90 5C            [ 2]  314 	incw	y
      0081EF 90 F6            [ 1]  315 	ld	a, (y)
      0081F1 A1 3C            [ 1]  316 	cp	a, #0x3c
      0081F3 24 4B            [ 1]  317 	jrnc	00101$
      0081F5 1E 16            [ 2]  318 	ldw	x, (0x16, sp)
      0081F7 5C               [ 2]  319 	incw	x
      0081F8 5C               [ 2]  320 	incw	x
      0081F9 1F 14            [ 2]  321 	ldw	(0x14, sp), x
      0081FB 1E 14            [ 2]  322 	ldw	x, (0x14, sp)
      0081FD F6               [ 1]  323 	ld	a, (x)
      0081FE A1 18            [ 1]  324 	cp	a, #0x18
      008200 24 3E            [ 1]  325 	jrnc	00101$
      008202 1E 16            [ 2]  326 	ldw	x, (0x16, sp)
      008204 1C 00 03         [ 2]  327 	addw	x, #0x0003
      008207 1F 20            [ 2]  328 	ldw	(0x20, sp), x
      008209 1E 20            [ 2]  329 	ldw	x, (0x20, sp)
      00820B F6               [ 1]  330 	ld	a, (x)
      00820C A1 20            [ 1]  331 	cp	a, #0x20
      00820E 22 30            [ 1]  332 	jrugt	00101$
      008210 1E 16            [ 2]  333 	ldw	x, (0x16, sp)
      008212 1C 00 04         [ 2]  334 	addw	x, #0x0004
      008215 1F 1E            [ 2]  335 	ldw	(0x1e, sp), x
      008217 1E 1E            [ 2]  336 	ldw	x, (0x1e, sp)
      008219 F6               [ 1]  337 	ld	a, (x)
      00821A A1 06            [ 1]  338 	cp	a, #0x06
      00821C 22 22            [ 1]  339 	jrugt	00101$
      00821E 1E 16            [ 2]  340 	ldw	x, (0x16, sp)
      008220 1C 00 05         [ 2]  341 	addw	x, #0x0005
      008223 1F 0E            [ 2]  342 	ldw	(0x0e, sp), x
      008225 1E 0E            [ 2]  343 	ldw	x, (0x0e, sp)
      008227 F6               [ 1]  344 	ld	a, (x)
      008228 A1 0C            [ 1]  345 	cp	a, #0x0c
      00822A 22 14            [ 1]  346 	jrugt	00101$
      00822C 1E 16            [ 2]  347 	ldw	x, (0x16, sp)
      00822E 1C 00 06         [ 2]  348 	addw	x, #0x0006
      008231 1F 0A            [ 2]  349 	ldw	(0x0a, sp), x
      008233 1E 0A            [ 2]  350 	ldw	x, (0x0a, sp)
      008235 FE               [ 2]  351 	ldw	x, (x)
      008236 A3 07 6C         [ 2]  352 	cpw	x, #0x076c
      008239 25 05            [ 1]  353 	jrc	00101$
      00823B A3 08 34         [ 2]  354 	cpw	x, #0x0834
      00823E 25 05            [ 1]  355 	jrc	00102$
      008240                        356 00101$:
                                    357 ;	user/RTC_pcf8563.c: 86: return 1;
      008240 A6 01            [ 1]  358 	ld	a, #0x01
      008242 CC 83 76         [ 2]  359 	jp	00113$
      008245                        360 00102$:
                                    361 ;	user/RTC_pcf8563.c: 89: buffer[0] = BinToBCD(dateTime->second) & 0x7F;
      008245 96               [ 1]  362 	ldw	x, sp
      008246 5C               [ 2]  363 	incw	x
      008247 1F 10            [ 2]  364 	ldw	(0x10, sp), x
      008249 5F               [ 1]  365 	clrw	x
      00824A 7B 23            [ 1]  366 	ld	a, (0x23, sp)
      00824C 97               [ 1]  367 	ld	xl, a
      00824D A6 0A            [ 1]  368 	ld	a, #0x0a
      00824F 62               [ 2]  369 	div	x, a
      008250 9F               [ 1]  370 	ld	a, xl
      008251 4E               [ 1]  371 	swap	a
      008252 A4 F0            [ 1]  372 	and	a, #0xf0
      008254 6B 0D            [ 1]  373 	ld	(0x0d, sp), a
      008256 5F               [ 1]  374 	clrw	x
      008257 7B 23            [ 1]  375 	ld	a, (0x23, sp)
      008259 97               [ 1]  376 	ld	xl, a
      00825A A6 0A            [ 1]  377 	ld	a, #0x0a
      00825C 62               [ 2]  378 	div	x, a
      00825D 1B 0D            [ 1]  379 	add	a, (0x0d, sp)
      00825F A4 7F            [ 1]  380 	and	a, #0x7f
      008261 1E 10            [ 2]  381 	ldw	x, (0x10, sp)
      008263 F7               [ 1]  382 	ld	(x), a
                                    383 ;	user/RTC_pcf8563.c: 90: buffer[1] = BinToBCD(dateTime->minute) & 0x7F;
      008264 1E 10            [ 2]  384 	ldw	x, (0x10, sp)
      008266 5C               [ 2]  385 	incw	x
      008267 1F 12            [ 2]  386 	ldw	(0x12, sp), x
      008269 90 F6            [ 1]  387 	ld	a, (y)
      00826B 97               [ 1]  388 	ld	xl, a
      00826C 89               [ 2]  389 	pushw	x
      00826D 4F               [ 1]  390 	clr	a
      00826E 95               [ 1]  391 	ld	xh, a
      00826F A6 0A            [ 1]  392 	ld	a, #0x0a
      008271 62               [ 2]  393 	div	x, a
      008272 9F               [ 1]  394 	ld	a, xl
      008273 85               [ 2]  395 	popw	x
      008274 4E               [ 1]  396 	swap	a
      008275 A4 F0            [ 1]  397 	and	a, #0xf0
      008277 6B 1D            [ 1]  398 	ld	(0x1d, sp), a
      008279 4F               [ 1]  399 	clr	a
      00827A 95               [ 1]  400 	ld	xh, a
      00827B A6 0A            [ 1]  401 	ld	a, #0x0a
      00827D 62               [ 2]  402 	div	x, a
      00827E 1B 1D            [ 1]  403 	add	a, (0x1d, sp)
      008280 A4 7F            [ 1]  404 	and	a, #0x7f
      008282 1E 12            [ 2]  405 	ldw	x, (0x12, sp)
      008284 F7               [ 1]  406 	ld	(x), a
                                    407 ;	user/RTC_pcf8563.c: 91: buffer[2] = BinToBCD(dateTime->hour) & 0x3F;
      008285 16 10            [ 2]  408 	ldw	y, (0x10, sp)
      008287 72 A9 00 02      [ 2]  409 	addw	y, #0x0002
      00828B 1E 14            [ 2]  410 	ldw	x, (0x14, sp)
      00828D F6               [ 1]  411 	ld	a, (x)
      00828E 97               [ 1]  412 	ld	xl, a
      00828F 89               [ 2]  413 	pushw	x
      008290 4F               [ 1]  414 	clr	a
      008291 95               [ 1]  415 	ld	xh, a
      008292 A6 0A            [ 1]  416 	ld	a, #0x0a
      008294 62               [ 2]  417 	div	x, a
      008295 9F               [ 1]  418 	ld	a, xl
      008296 85               [ 2]  419 	popw	x
      008297 4E               [ 1]  420 	swap	a
      008298 A4 F0            [ 1]  421 	and	a, #0xf0
      00829A 6B 0C            [ 1]  422 	ld	(0x0c, sp), a
      00829C 4F               [ 1]  423 	clr	a
      00829D 95               [ 1]  424 	ld	xh, a
      00829E A6 0A            [ 1]  425 	ld	a, #0x0a
      0082A0 62               [ 2]  426 	div	x, a
      0082A1 1B 0C            [ 1]  427 	add	a, (0x0c, sp)
      0082A3 A4 3F            [ 1]  428 	and	a, #0x3f
      0082A5 90 F7            [ 1]  429 	ld	(y), a
                                    430 ;	user/RTC_pcf8563.c: 92: buffer[3] = BinToBCD(dateTime->day) & 0x3F;
      0082A7 16 10            [ 2]  431 	ldw	y, (0x10, sp)
      0082A9 72 A9 00 03      [ 2]  432 	addw	y, #0x0003
      0082AD 1E 20            [ 2]  433 	ldw	x, (0x20, sp)
      0082AF F6               [ 1]  434 	ld	a, (x)
      0082B0 97               [ 1]  435 	ld	xl, a
      0082B1 89               [ 2]  436 	pushw	x
      0082B2 4F               [ 1]  437 	clr	a
      0082B3 95               [ 1]  438 	ld	xh, a
      0082B4 A6 0A            [ 1]  439 	ld	a, #0x0a
      0082B6 62               [ 2]  440 	div	x, a
      0082B7 9F               [ 1]  441 	ld	a, xl
      0082B8 85               [ 2]  442 	popw	x
      0082B9 4E               [ 1]  443 	swap	a
      0082BA A4 F0            [ 1]  444 	and	a, #0xf0
      0082BC 6B 09            [ 1]  445 	ld	(0x09, sp), a
      0082BE 4F               [ 1]  446 	clr	a
      0082BF 95               [ 1]  447 	ld	xh, a
      0082C0 A6 0A            [ 1]  448 	ld	a, #0x0a
      0082C2 62               [ 2]  449 	div	x, a
      0082C3 1B 09            [ 1]  450 	add	a, (0x09, sp)
      0082C5 A4 3F            [ 1]  451 	and	a, #0x3f
      0082C7 90 F7            [ 1]  452 	ld	(y), a
                                    453 ;	user/RTC_pcf8563.c: 93: buffer[4] = BinToBCD(dateTime->weekday) & 0x07;
      0082C9 16 10            [ 2]  454 	ldw	y, (0x10, sp)
      0082CB 72 A9 00 04      [ 2]  455 	addw	y, #0x0004
      0082CF 1E 1E            [ 2]  456 	ldw	x, (0x1e, sp)
      0082D1 F6               [ 1]  457 	ld	a, (x)
      0082D2 97               [ 1]  458 	ld	xl, a
      0082D3 89               [ 2]  459 	pushw	x
      0082D4 4F               [ 1]  460 	clr	a
      0082D5 95               [ 1]  461 	ld	xh, a
      0082D6 A6 0A            [ 1]  462 	ld	a, #0x0a
      0082D8 62               [ 2]  463 	div	x, a
      0082D9 9F               [ 1]  464 	ld	a, xl
      0082DA 85               [ 2]  465 	popw	x
      0082DB 4E               [ 1]  466 	swap	a
      0082DC A4 F0            [ 1]  467 	and	a, #0xf0
      0082DE 6B 18            [ 1]  468 	ld	(0x18, sp), a
      0082E0 4F               [ 1]  469 	clr	a
      0082E1 95               [ 1]  470 	ld	xh, a
      0082E2 A6 0A            [ 1]  471 	ld	a, #0x0a
      0082E4 62               [ 2]  472 	div	x, a
      0082E5 1B 18            [ 1]  473 	add	a, (0x18, sp)
      0082E7 A4 07            [ 1]  474 	and	a, #0x07
      0082E9 90 F7            [ 1]  475 	ld	(y), a
                                    476 ;	user/RTC_pcf8563.c: 94: buffer[5] = BinToBCD(dateTime->month) & 0x1F;
      0082EB 1E 10            [ 2]  477 	ldw	x, (0x10, sp)
      0082ED 1C 00 05         [ 2]  478 	addw	x, #0x0005
      0082F0 1F 24            [ 2]  479 	ldw	(0x24, sp), x
      0082F2 1E 0E            [ 2]  480 	ldw	x, (0x0e, sp)
      0082F4 F6               [ 1]  481 	ld	a, (x)
      0082F5 97               [ 1]  482 	ld	xl, a
      0082F6 89               [ 2]  483 	pushw	x
      0082F7 4F               [ 1]  484 	clr	a
      0082F8 95               [ 1]  485 	ld	xh, a
      0082F9 A6 0A            [ 1]  486 	ld	a, #0x0a
      0082FB 62               [ 2]  487 	div	x, a
      0082FC 9F               [ 1]  488 	ld	a, xl
      0082FD 85               [ 2]  489 	popw	x
      0082FE 4E               [ 1]  490 	swap	a
      0082FF A4 F0            [ 1]  491 	and	a, #0xf0
      008301 6B 22            [ 1]  492 	ld	(0x22, sp), a
      008303 4F               [ 1]  493 	clr	a
      008304 95               [ 1]  494 	ld	xh, a
      008305 A6 0A            [ 1]  495 	ld	a, #0x0a
      008307 62               [ 2]  496 	div	x, a
      008308 1B 22            [ 1]  497 	add	a, (0x22, sp)
      00830A A4 1F            [ 1]  498 	and	a, #0x1f
      00830C 1E 24            [ 2]  499 	ldw	x, (0x24, sp)
      00830E F7               [ 1]  500 	ld	(x), a
                                    501 ;	user/RTC_pcf8563.c: 96: if (dateTime->year >= 2000)
      00830F 1E 0A            [ 2]  502 	ldw	x, (0x0a, sp)
      008311 FE               [ 2]  503 	ldw	x, (x)
      008312 1F 19            [ 2]  504 	ldw	(0x19, sp), x
                                    505 ;	user/RTC_pcf8563.c: 99: buffer[6] = BinToBCD(dateTime->year - 2000);
      008314 1E 10            [ 2]  506 	ldw	x, (0x10, sp)
      008316 1C 00 06         [ 2]  507 	addw	x, #0x0006
      008319 1F 1B            [ 2]  508 	ldw	(0x1b, sp), x
                                    509 ;	user/RTC_pcf8563.c: 96: if (dateTime->year >= 2000)
      00831B 1E 19            [ 2]  510 	ldw	x, (0x19, sp)
      00831D A3 07 D0         [ 2]  511 	cpw	x, #0x07d0
      008320 25 29            [ 1]  512 	jrc	00111$
                                    513 ;	user/RTC_pcf8563.c: 98: buffer[5] |= 0x80;
      008322 1E 24            [ 2]  514 	ldw	x, (0x24, sp)
      008324 F6               [ 1]  515 	ld	a, (x)
      008325 AA 80            [ 1]  516 	or	a, #0x80
      008327 1E 24            [ 2]  517 	ldw	x, (0x24, sp)
      008329 F7               [ 1]  518 	ld	(x), a
                                    519 ;	user/RTC_pcf8563.c: 99: buffer[6] = BinToBCD(dateTime->year - 2000);
      00832A 1E 0A            [ 2]  520 	ldw	x, (0x0a, sp)
      00832C FE               [ 2]  521 	ldw	x, (x)
      00832D 1D 07 D0         [ 2]  522 	subw	x, #0x07d0
      008330 89               [ 2]  523 	pushw	x
      008331 90 AE 00 0A      [ 2]  524 	ldw	y, #0x000a
      008335 65               [ 2]  525 	divw	x, y
      008336 9F               [ 1]  526 	ld	a, xl
      008337 85               [ 2]  527 	popw	x
      008338 4E               [ 1]  528 	swap	a
      008339 A4 F0            [ 1]  529 	and	a, #0xf0
      00833B 6B 08            [ 1]  530 	ld	(0x08, sp), a
      00833D 90 AE 00 0A      [ 2]  531 	ldw	y, #0x000a
      008341 65               [ 2]  532 	divw	x, y
      008342 90 9F            [ 1]  533 	ld	a, yl
      008344 1B 08            [ 1]  534 	add	a, (0x08, sp)
      008346 1E 1B            [ 2]  535 	ldw	x, (0x1b, sp)
      008348 F7               [ 1]  536 	ld	(x), a
      008349 20 1E            [ 2]  537 	jra	00112$
      00834B                        538 00111$:
                                    539 ;	user/RTC_pcf8563.c: 103: buffer[6] = BinToBCD(dateTime->year - 1900);
      00834B 1E 19            [ 2]  540 	ldw	x, (0x19, sp)
      00834D 1D 07 6C         [ 2]  541 	subw	x, #0x076c
      008350 89               [ 2]  542 	pushw	x
      008351 90 AE 00 0A      [ 2]  543 	ldw	y, #0x000a
      008355 65               [ 2]  544 	divw	x, y
      008356 9F               [ 1]  545 	ld	a, xl
      008357 85               [ 2]  546 	popw	x
      008358 4E               [ 1]  547 	swap	a
      008359 A4 F0            [ 1]  548 	and	a, #0xf0
      00835B 90 AE 00 0A      [ 2]  549 	ldw	y, #0x000a
      00835F 65               [ 2]  550 	divw	x, y
      008360 61               [ 1]  551 	exg	a, yl
      008361 6B 26            [ 1]  552 	ld	(0x26, sp), a
      008363 61               [ 1]  553 	exg	a, yl
      008364 1B 26            [ 1]  554 	add	a, (0x26, sp)
      008366 1E 1B            [ 2]  555 	ldw	x, (0x1b, sp)
      008368 F7               [ 1]  556 	ld	(x), a
      008369                        557 00112$:
                                    558 ;	user/RTC_pcf8563.c: 106: PCF_Write(0x02, buffer, sizeof(buffer));
      008369 1E 10            [ 2]  559 	ldw	x, (0x10, sp)
      00836B 4B 07            [ 1]  560 	push	#0x07
      00836D 89               [ 2]  561 	pushw	x
      00836E 4B 02            [ 1]  562 	push	#0x02
      008370 CD 80 DB         [ 4]  563 	call	_PCF_Write
      008373 5B 04            [ 2]  564 	addw	sp, #4
                                    565 ;	user/RTC_pcf8563.c: 108: return 0;
      008375 4F               [ 1]  566 	clr	a
      008376                        567 00113$:
      008376 5B 26            [ 2]  568 	addw	sp, #38
      008378 81               [ 4]  569 	ret
                                    570 ;	user/RTC_pcf8563.c: 111: uint8_t PCF_getDateTime(PCF_DateTime *dateTime)
                                    571 ;	-----------------------------------------
                                    572 ;	 function PCF_getDateTime
                                    573 ;	-----------------------------------------
      008379                        574 _PCF_getDateTime:
      008379 52 1C            [ 2]  575 	sub	sp, #28
                                    576 ;	user/RTC_pcf8563.c: 115: PCF_Read(0x02, buffer, sizeof(buffer));
      00837B 96               [ 1]  577 	ldw	x, sp
      00837C 5C               [ 2]  578 	incw	x
      00837D 1F 12            [ 2]  579 	ldw	(0x12, sp), x
      00837F 1E 12            [ 2]  580 	ldw	x, (0x12, sp)
      008381 4B 07            [ 1]  581 	push	#0x07
      008383 89               [ 2]  582 	pushw	x
      008384 4B 02            [ 1]  583 	push	#0x02
      008386 CD 81 10         [ 4]  584 	call	_PCF_Read
      008389 5B 04            [ 2]  585 	addw	sp, #4
                                    586 ;	user/RTC_pcf8563.c: 117: dateTime->second = (((buffer[0] >> 4) & 0x07) * 10) + (buffer[0] & 0x0F);
      00838B 16 1F            [ 2]  587 	ldw	y, (0x1f, sp)
      00838D 17 0B            [ 2]  588 	ldw	(0x0b, sp), y
      00838F 1E 12            [ 2]  589 	ldw	x, (0x12, sp)
      008391 F6               [ 1]  590 	ld	a, (x)
      008392 6B 14            [ 1]  591 	ld	(0x14, sp), a
      008394 7B 14            [ 1]  592 	ld	a, (0x14, sp)
      008396 4E               [ 1]  593 	swap	a
      008397 A4 0F            [ 1]  594 	and	a, #0x0f
      008399 A4 07            [ 1]  595 	and	a, #0x07
      00839B 97               [ 1]  596 	ld	xl, a
      00839C A6 0A            [ 1]  597 	ld	a, #0x0a
      00839E 42               [ 4]  598 	mul	x, a
      00839F 7B 14            [ 1]  599 	ld	a, (0x14, sp)
      0083A1 A4 0F            [ 1]  600 	and	a, #0x0f
      0083A3 6B 15            [ 1]  601 	ld	(0x15, sp), a
      0083A5 9F               [ 1]  602 	ld	a, xl
      0083A6 1B 15            [ 1]  603 	add	a, (0x15, sp)
      0083A8 1E 0B            [ 2]  604 	ldw	x, (0x0b, sp)
      0083AA F7               [ 1]  605 	ld	(x), a
                                    606 ;	user/RTC_pcf8563.c: 118: dateTime->minute = (((buffer[1] >> 4) & 0x07) * 10) + (buffer[1] & 0x0F);
      0083AB 1E 0B            [ 2]  607 	ldw	x, (0x0b, sp)
      0083AD 5C               [ 2]  608 	incw	x
      0083AE 1F 0F            [ 2]  609 	ldw	(0x0f, sp), x
      0083B0 1E 12            [ 2]  610 	ldw	x, (0x12, sp)
      0083B2 E6 01            [ 1]  611 	ld	a, (0x1, x)
      0083B4 6B 11            [ 1]  612 	ld	(0x11, sp), a
      0083B6 7B 11            [ 1]  613 	ld	a, (0x11, sp)
      0083B8 4E               [ 1]  614 	swap	a
      0083B9 A4 0F            [ 1]  615 	and	a, #0x0f
      0083BB A4 07            [ 1]  616 	and	a, #0x07
      0083BD 97               [ 1]  617 	ld	xl, a
      0083BE A6 0A            [ 1]  618 	ld	a, #0x0a
      0083C0 42               [ 4]  619 	mul	x, a
      0083C1 7B 11            [ 1]  620 	ld	a, (0x11, sp)
      0083C3 A4 0F            [ 1]  621 	and	a, #0x0f
      0083C5 6B 18            [ 1]  622 	ld	(0x18, sp), a
      0083C7 9F               [ 1]  623 	ld	a, xl
      0083C8 1B 18            [ 1]  624 	add	a, (0x18, sp)
      0083CA 1E 0F            [ 2]  625 	ldw	x, (0x0f, sp)
      0083CC F7               [ 1]  626 	ld	(x), a
                                    627 ;	user/RTC_pcf8563.c: 119: dateTime->hour = (((buffer[2] >> 4) & 0x03) * 10) + (buffer[2] & 0x0F);
      0083CD 16 0B            [ 2]  628 	ldw	y, (0x0b, sp)
      0083CF 72 A9 00 02      [ 2]  629 	addw	y, #0x0002
      0083D3 1E 12            [ 2]  630 	ldw	x, (0x12, sp)
      0083D5 E6 02            [ 1]  631 	ld	a, (0x2, x)
      0083D7 6B 0A            [ 1]  632 	ld	(0x0a, sp), a
      0083D9 7B 0A            [ 1]  633 	ld	a, (0x0a, sp)
      0083DB 4E               [ 1]  634 	swap	a
      0083DC A4 0F            [ 1]  635 	and	a, #0x0f
      0083DE A4 03            [ 1]  636 	and	a, #0x03
      0083E0 97               [ 1]  637 	ld	xl, a
      0083E1 A6 0A            [ 1]  638 	ld	a, #0x0a
      0083E3 42               [ 4]  639 	mul	x, a
      0083E4 7B 0A            [ 1]  640 	ld	a, (0x0a, sp)
      0083E6 A4 0F            [ 1]  641 	and	a, #0x0f
      0083E8 6B 0E            [ 1]  642 	ld	(0x0e, sp), a
      0083EA 9F               [ 1]  643 	ld	a, xl
      0083EB 1B 0E            [ 1]  644 	add	a, (0x0e, sp)
      0083ED 90 F7            [ 1]  645 	ld	(y), a
                                    646 ;	user/RTC_pcf8563.c: 120: dateTime->day = (((buffer[3] >> 4) & 0x03) * 10) + (buffer[3] & 0x0F);
      0083EF 16 0B            [ 2]  647 	ldw	y, (0x0b, sp)
      0083F1 72 A9 00 03      [ 2]  648 	addw	y, #0x0003
      0083F5 1E 12            [ 2]  649 	ldw	x, (0x12, sp)
      0083F7 E6 03            [ 1]  650 	ld	a, (0x3, x)
      0083F9 6B 1A            [ 1]  651 	ld	(0x1a, sp), a
      0083FB 7B 1A            [ 1]  652 	ld	a, (0x1a, sp)
      0083FD 4E               [ 1]  653 	swap	a
      0083FE A4 0F            [ 1]  654 	and	a, #0x0f
      008400 A4 03            [ 1]  655 	and	a, #0x03
      008402 97               [ 1]  656 	ld	xl, a
      008403 A6 0A            [ 1]  657 	ld	a, #0x0a
      008405 42               [ 4]  658 	mul	x, a
      008406 7B 1A            [ 1]  659 	ld	a, (0x1a, sp)
      008408 A4 0F            [ 1]  660 	and	a, #0x0f
      00840A 6B 19            [ 1]  661 	ld	(0x19, sp), a
      00840C 9F               [ 1]  662 	ld	a, xl
      00840D 1B 19            [ 1]  663 	add	a, (0x19, sp)
      00840F 90 F7            [ 1]  664 	ld	(y), a
                                    665 ;	user/RTC_pcf8563.c: 121: dateTime->weekday = (buffer[4] & 0x07);
      008411 1E 0B            [ 2]  666 	ldw	x, (0x0b, sp)
      008413 1C 00 04         [ 2]  667 	addw	x, #0x0004
      008416 16 12            [ 2]  668 	ldw	y, (0x12, sp)
      008418 90 E6 04         [ 1]  669 	ld	a, (0x4, y)
      00841B A4 07            [ 1]  670 	and	a, #0x07
      00841D F7               [ 1]  671 	ld	(x), a
                                    672 ;	user/RTC_pcf8563.c: 122: dateTime->month = ((buffer[5] >> 4) & 0x01) * 10 + (buffer[5] & 0x0F);
      00841E 16 0B            [ 2]  673 	ldw	y, (0x0b, sp)
      008420 72 A9 00 05      [ 2]  674 	addw	y, #0x0005
      008424 1E 12            [ 2]  675 	ldw	x, (0x12, sp)
      008426 1C 00 05         [ 2]  676 	addw	x, #0x0005
      008429 1F 08            [ 2]  677 	ldw	(0x08, sp), x
      00842B 1E 08            [ 2]  678 	ldw	x, (0x08, sp)
      00842D F6               [ 1]  679 	ld	a, (x)
      00842E 88               [ 1]  680 	push	a
      00842F 44               [ 1]  681 	srl	a
      008430 44               [ 1]  682 	srl	a
      008431 44               [ 1]  683 	srl	a
      008432 44               [ 1]  684 	srl	a
      008433 A4 01            [ 1]  685 	and	a, #0x01
      008435 97               [ 1]  686 	ld	xl, a
      008436 A6 0A            [ 1]  687 	ld	a, #0x0a
      008438 42               [ 4]  688 	mul	x, a
      008439 84               [ 1]  689 	pop	a
      00843A A4 0F            [ 1]  690 	and	a, #0x0f
      00843C 6B 0D            [ 1]  691 	ld	(0x0d, sp), a
      00843E 9F               [ 1]  692 	ld	a, xl
      00843F 1B 0D            [ 1]  693 	add	a, (0x0d, sp)
      008441 90 F7            [ 1]  694 	ld	(y), a
                                    695 ;	user/RTC_pcf8563.c: 123: dateTime->year = 1900 + ((buffer[6] >> 4) & 0x0F) * 10 + (buffer[6] & 0x0F);
      008443 1E 0B            [ 2]  696 	ldw	x, (0x0b, sp)
      008445 1C 00 06         [ 2]  697 	addw	x, #0x0006
      008448 1F 1B            [ 2]  698 	ldw	(0x1b, sp), x
      00844A 1E 12            [ 2]  699 	ldw	x, (0x12, sp)
      00844C E6 06            [ 1]  700 	ld	a, (0x6, x)
      00844E 97               [ 1]  701 	ld	xl, a
      00844F 4E               [ 1]  702 	swap	a
      008450 A4 0F            [ 1]  703 	and	a, #0x0f
      008452 A4 0F            [ 1]  704 	and	a, #0x0f
      008454 61               [ 1]  705 	exg	a, yl
      008455 A6 0A            [ 1]  706 	ld	a, #0x0a
      008457 61               [ 1]  707 	exg	a, yl
      008458 90 42            [ 4]  708 	mul	y, a
      00845A 72 A9 07 6C      [ 2]  709 	addw	y, #0x076c
      00845E 9F               [ 1]  710 	ld	a, xl
      00845F A4 0F            [ 1]  711 	and	a, #0x0f
      008461 6B 17            [ 1]  712 	ld	(0x17, sp), a
      008463 0F 16            [ 1]  713 	clr	(0x16, sp)
      008465 72 F9 16         [ 2]  714 	addw	y, (0x16, sp)
      008468 1E 1B            [ 2]  715 	ldw	x, (0x1b, sp)
      00846A FF               [ 2]  716 	ldw	(x), y
                                    717 ;	user/RTC_pcf8563.c: 125: if (buffer[5] &  0x80)
      00846B 1E 08            [ 2]  718 	ldw	x, (0x08, sp)
      00846D F6               [ 1]  719 	ld	a, (x)
      00846E 4D               [ 1]  720 	tnz	a
      00846F 2A 0A            [ 1]  721 	jrpl	00102$
                                    722 ;	user/RTC_pcf8563.c: 127: dateTime->year += 100;
      008471 1E 1B            [ 2]  723 	ldw	x, (0x1b, sp)
      008473 FE               [ 2]  724 	ldw	x, (x)
      008474 1C 00 64         [ 2]  725 	addw	x, #0x0064
      008477 16 1B            [ 2]  726 	ldw	y, (0x1b, sp)
      008479 90 FF            [ 2]  727 	ldw	(y), x
      00847B                        728 00102$:
                                    729 ;	user/RTC_pcf8563.c: 130: if (buffer[0] & 0x80) //Clock integrity not guaranted
      00847B 1E 12            [ 2]  730 	ldw	x, (0x12, sp)
      00847D F6               [ 1]  731 	ld	a, (x)
      00847E 4D               [ 1]  732 	tnz	a
      00847F 2A 03            [ 1]  733 	jrpl	00104$
                                    734 ;	user/RTC_pcf8563.c: 132: return 1;
      008481 A6 01            [ 1]  735 	ld	a, #0x01
                                    736 ;	user/RTC_pcf8563.c: 135: return 0;
      008483 21                     737 	.byte 0x21
      008484                        738 00104$:
      008484 4F               [ 1]  739 	clr	a
      008485                        740 00105$:
      008485 5B 1C            [ 2]  741 	addw	sp, #28
      008487 81               [ 4]  742 	ret
                                    743 ;	user/RTC_pcf8563.c: 138: uint8_t PCF_setAlarm(PCF_Alarm *alarm)
                                    744 ;	-----------------------------------------
                                    745 ;	 function PCF_setAlarm
                                    746 ;	-----------------------------------------
      008488                        747 _PCF_setAlarm:
      008488 52 13            [ 2]  748 	sub	sp, #19
                                    749 ;	user/RTC_pcf8563.c: 141: if ((alarm->minute >= 60 && alarm->minute != 80) || (alarm->hour >= 24 && alarm->hour != 80) || (alarm->day > 32 && alarm->day != 80) || (alarm->weekday > 6 && alarm->weekday != 80))
      00848A 16 16            [ 2]  750 	ldw	y, (0x16, sp)
      00848C 17 0A            [ 2]  751 	ldw	(0x0a, sp), y
      00848E 1E 0A            [ 2]  752 	ldw	x, (0x0a, sp)
      008490 F6               [ 1]  753 	ld	a, (x)
      008491 6B 0F            [ 1]  754 	ld	(0x0f, sp), a
      008493 7B 0F            [ 1]  755 	ld	a, (0x0f, sp)
      008495 A1 3C            [ 1]  756 	cp	a, #0x3c
      008497 25 06            [ 1]  757 	jrc	00105$
      008499 7B 0F            [ 1]  758 	ld	a, (0x0f, sp)
      00849B A1 50            [ 1]  759 	cp	a, #0x50
      00849D 26 31            [ 1]  760 	jrne	00101$
      00849F                        761 00105$:
      00849F 16 0A            [ 2]  762 	ldw	y, (0x0a, sp)
      0084A1 90 5C            [ 2]  763 	incw	y
      0084A3 90 F6            [ 1]  764 	ld	a, (y)
      0084A5 A1 18            [ 1]  765 	cp	a, #0x18
      0084A7 25 04            [ 1]  766 	jrc	00107$
      0084A9 A1 50            [ 1]  767 	cp	a, #0x50
      0084AB 26 23            [ 1]  768 	jrne	00101$
      0084AD                        769 00107$:
      0084AD 1E 0A            [ 2]  770 	ldw	x, (0x0a, sp)
      0084AF 5C               [ 2]  771 	incw	x
      0084B0 5C               [ 2]  772 	incw	x
      0084B1 1F 08            [ 2]  773 	ldw	(0x08, sp), x
      0084B3 1E 08            [ 2]  774 	ldw	x, (0x08, sp)
      0084B5 F6               [ 1]  775 	ld	a, (x)
      0084B6 A1 20            [ 1]  776 	cp	a, #0x20
      0084B8 23 04            [ 2]  777 	jrule	00109$
      0084BA A1 50            [ 1]  778 	cp	a, #0x50
      0084BC 26 12            [ 1]  779 	jrne	00101$
      0084BE                        780 00109$:
      0084BE 1E 0A            [ 2]  781 	ldw	x, (0x0a, sp)
      0084C0 1C 00 03         [ 2]  782 	addw	x, #0x0003
      0084C3 1F 06            [ 2]  783 	ldw	(0x06, sp), x
      0084C5 1E 06            [ 2]  784 	ldw	x, (0x06, sp)
      0084C7 F6               [ 1]  785 	ld	a, (x)
      0084C8 A1 06            [ 1]  786 	cp	a, #0x06
      0084CA 23 09            [ 2]  787 	jrule	00102$
      0084CC A1 50            [ 1]  788 	cp	a, #0x50
      0084CE 27 05            [ 1]  789 	jreq	00102$
      0084D0                        790 00101$:
                                    791 ;	user/RTC_pcf8563.c: 143: return 1;
      0084D0 A6 01            [ 1]  792 	ld	a, #0x01
      0084D2 CC 85 64         [ 2]  793 	jp	00110$
      0084D5                        794 00102$:
                                    795 ;	user/RTC_pcf8563.c: 146: buffer[0] = BinToBCD(alarm->minute) & 0xFF;
      0084D5 96               [ 1]  796 	ldw	x, sp
      0084D6 5C               [ 2]  797 	incw	x
      0084D7 1F 0D            [ 2]  798 	ldw	(0x0d, sp), x
      0084D9 5F               [ 1]  799 	clrw	x
      0084DA 7B 0F            [ 1]  800 	ld	a, (0x0f, sp)
      0084DC 97               [ 1]  801 	ld	xl, a
      0084DD A6 0A            [ 1]  802 	ld	a, #0x0a
      0084DF 62               [ 2]  803 	div	x, a
      0084E0 9F               [ 1]  804 	ld	a, xl
      0084E1 4E               [ 1]  805 	swap	a
      0084E2 A4 F0            [ 1]  806 	and	a, #0xf0
      0084E4 6B 10            [ 1]  807 	ld	(0x10, sp), a
      0084E6 5F               [ 1]  808 	clrw	x
      0084E7 7B 0F            [ 1]  809 	ld	a, (0x0f, sp)
      0084E9 97               [ 1]  810 	ld	xl, a
      0084EA A6 0A            [ 1]  811 	ld	a, #0x0a
      0084EC 62               [ 2]  812 	div	x, a
      0084ED 1B 10            [ 1]  813 	add	a, (0x10, sp)
      0084EF 1E 0D            [ 2]  814 	ldw	x, (0x0d, sp)
      0084F1 F7               [ 1]  815 	ld	(x), a
                                    816 ;	user/RTC_pcf8563.c: 147: buffer[1] = BinToBCD(alarm->hour) & 0xBF;
      0084F2 1E 0D            [ 2]  817 	ldw	x, (0x0d, sp)
      0084F4 5C               [ 2]  818 	incw	x
      0084F5 1F 11            [ 2]  819 	ldw	(0x11, sp), x
      0084F7 90 F6            [ 1]  820 	ld	a, (y)
      0084F9 97               [ 1]  821 	ld	xl, a
      0084FA 89               [ 2]  822 	pushw	x
      0084FB 4F               [ 1]  823 	clr	a
      0084FC 95               [ 1]  824 	ld	xh, a
      0084FD A6 0A            [ 1]  825 	ld	a, #0x0a
      0084FF 62               [ 2]  826 	div	x, a
      008500 9F               [ 1]  827 	ld	a, xl
      008501 85               [ 2]  828 	popw	x
      008502 4E               [ 1]  829 	swap	a
      008503 A4 F0            [ 1]  830 	and	a, #0xf0
      008505 6B 05            [ 1]  831 	ld	(0x05, sp), a
      008507 4F               [ 1]  832 	clr	a
      008508 95               [ 1]  833 	ld	xh, a
      008509 A6 0A            [ 1]  834 	ld	a, #0x0a
      00850B 62               [ 2]  835 	div	x, a
      00850C 1B 05            [ 1]  836 	add	a, (0x05, sp)
      00850E A4 BF            [ 1]  837 	and	a, #0xbf
      008510 1E 11            [ 2]  838 	ldw	x, (0x11, sp)
      008512 F7               [ 1]  839 	ld	(x), a
                                    840 ;	user/RTC_pcf8563.c: 148: buffer[2] = BinToBCD(alarm->day) & 0xBF;
      008513 16 0D            [ 2]  841 	ldw	y, (0x0d, sp)
      008515 72 A9 00 02      [ 2]  842 	addw	y, #0x0002
      008519 1E 08            [ 2]  843 	ldw	x, (0x08, sp)
      00851B F6               [ 1]  844 	ld	a, (x)
      00851C 97               [ 1]  845 	ld	xl, a
      00851D 89               [ 2]  846 	pushw	x
      00851E 4F               [ 1]  847 	clr	a
      00851F 95               [ 1]  848 	ld	xh, a
      008520 A6 0A            [ 1]  849 	ld	a, #0x0a
      008522 62               [ 2]  850 	div	x, a
      008523 9F               [ 1]  851 	ld	a, xl
      008524 85               [ 2]  852 	popw	x
      008525 4E               [ 1]  853 	swap	a
      008526 A4 F0            [ 1]  854 	and	a, #0xf0
      008528 6B 13            [ 1]  855 	ld	(0x13, sp), a
      00852A 4F               [ 1]  856 	clr	a
      00852B 95               [ 1]  857 	ld	xh, a
      00852C A6 0A            [ 1]  858 	ld	a, #0x0a
      00852E 62               [ 2]  859 	div	x, a
      00852F 1B 13            [ 1]  860 	add	a, (0x13, sp)
      008531 A4 BF            [ 1]  861 	and	a, #0xbf
      008533 90 F7            [ 1]  862 	ld	(y), a
                                    863 ;	user/RTC_pcf8563.c: 149: buffer[3] = BinToBCD(alarm->weekday) & 0x87;
      008535 16 0D            [ 2]  864 	ldw	y, (0x0d, sp)
      008537 72 A9 00 03      [ 2]  865 	addw	y, #0x0003
      00853B 1E 06            [ 2]  866 	ldw	x, (0x06, sp)
      00853D F6               [ 1]  867 	ld	a, (x)
      00853E 97               [ 1]  868 	ld	xl, a
      00853F 89               [ 2]  869 	pushw	x
      008540 4F               [ 1]  870 	clr	a
      008541 95               [ 1]  871 	ld	xh, a
      008542 A6 0A            [ 1]  872 	ld	a, #0x0a
      008544 62               [ 2]  873 	div	x, a
      008545 9F               [ 1]  874 	ld	a, xl
      008546 85               [ 2]  875 	popw	x
      008547 4E               [ 1]  876 	swap	a
      008548 A4 F0            [ 1]  877 	and	a, #0xf0
      00854A 6B 0C            [ 1]  878 	ld	(0x0c, sp), a
      00854C 4F               [ 1]  879 	clr	a
      00854D 95               [ 1]  880 	ld	xh, a
      00854E A6 0A            [ 1]  881 	ld	a, #0x0a
      008550 62               [ 2]  882 	div	x, a
      008551 1B 0C            [ 1]  883 	add	a, (0x0c, sp)
      008553 A4 87            [ 1]  884 	and	a, #0x87
      008555 90 F7            [ 1]  885 	ld	(y), a
                                    886 ;	user/RTC_pcf8563.c: 151: PCF_Write(0x09, buffer, sizeof(buffer));
      008557 1E 0D            [ 2]  887 	ldw	x, (0x0d, sp)
      008559 4B 04            [ 1]  888 	push	#0x04
      00855B 89               [ 2]  889 	pushw	x
      00855C 4B 09            [ 1]  890 	push	#0x09
      00855E CD 80 DB         [ 4]  891 	call	_PCF_Write
      008561 5B 04            [ 2]  892 	addw	sp, #4
                                    893 ;	user/RTC_pcf8563.c: 153: return 0;
      008563 4F               [ 1]  894 	clr	a
      008564                        895 00110$:
      008564 5B 13            [ 2]  896 	addw	sp, #19
      008566 81               [ 4]  897 	ret
                                    898 ;	user/RTC_pcf8563.c: 156: void PCF_setTimer(uint8_t mode, uint8_t count)
                                    899 ;	-----------------------------------------
                                    900 ;	 function PCF_setTimer
                                    901 ;	-----------------------------------------
      008567                        902 _PCF_setTimer:
                                    903 ;	user/RTC_pcf8563.c: 158: mode &= 0x13;
      008567 7B 03            [ 1]  904 	ld	a, (0x03, sp)
      008569 A4 13            [ 1]  905 	and	a, #0x13
      00856B 6B 03            [ 1]  906 	ld	(0x03, sp), a
                                    907 ;	user/RTC_pcf8563.c: 159: PCF_Write(0x0E, &mode, 1);				//Timer_control
      00856D 96               [ 1]  908 	ldw	x, sp
      00856E 1C 00 03         [ 2]  909 	addw	x, #3
      008571 4B 01            [ 1]  910 	push	#0x01
      008573 89               [ 2]  911 	pushw	x
      008574 4B 0E            [ 1]  912 	push	#0x0e
      008576 CD 80 DB         [ 4]  913 	call	_PCF_Write
      008579 5B 04            [ 2]  914 	addw	sp, #4
                                    915 ;	user/RTC_pcf8563.c: 161: PCF_Write(0x0F, &count, 1);				//Timer
      00857B 96               [ 1]  916 	ldw	x, sp
      00857C 1C 00 04         [ 2]  917 	addw	x, #4
      00857F 4B 01            [ 1]  918 	push	#0x01
      008581 89               [ 2]  919 	pushw	x
      008582 4B 0F            [ 1]  920 	push	#0x0f
      008584 CD 80 DB         [ 4]  921 	call	_PCF_Write
      008587 5B 04            [ 2]  922 	addw	sp, #4
      008589 81               [ 4]  923 	ret
                                    924 ;	user/RTC_pcf8563.c: 164: uint8_t PCF_getTimer()
                                    925 ;	-----------------------------------------
                                    926 ;	 function PCF_getTimer
                                    927 ;	-----------------------------------------
      00858A                        928 _PCF_getTimer:
      00858A 88               [ 1]  929 	push	a
                                    930 ;	user/RTC_pcf8563.c: 167: PCF_Read(0x0F, &count, 1);				//Timer
      00858B 96               [ 1]  931 	ldw	x, sp
      00858C 5C               [ 2]  932 	incw	x
      00858D 4B 01            [ 1]  933 	push	#0x01
      00858F 89               [ 2]  934 	pushw	x
      008590 4B 0F            [ 1]  935 	push	#0x0f
      008592 CD 81 10         [ 4]  936 	call	_PCF_Read
      008595 5B 04            [ 2]  937 	addw	sp, #4
                                    938 ;	user/RTC_pcf8563.c: 169: return count;
      008597 7B 01            [ 1]  939 	ld	a, (0x01, sp)
      008599 5B 01            [ 2]  940 	addw	sp, #1
      00859B 81               [ 4]  941 	ret
                                    942 ;	user/RTC_pcf8563.c: 172: uint8_t PCF_getAlarm(PCF_Alarm *alarm)
                                    943 ;	-----------------------------------------
                                    944 ;	 function PCF_getAlarm
                                    945 ;	-----------------------------------------
      00859C                        946 _PCF_getAlarm:
      00859C 52 0F            [ 2]  947 	sub	sp, #15
                                    948 ;	user/RTC_pcf8563.c: 176: PCF_Read(0x09, buffer, sizeof(buffer));
      00859E 96               [ 1]  949 	ldw	x, sp
      00859F 5C               [ 2]  950 	incw	x
      0085A0 1F 0D            [ 2]  951 	ldw	(0x0d, sp), x
      0085A2 1E 0D            [ 2]  952 	ldw	x, (0x0d, sp)
      0085A4 4B 04            [ 1]  953 	push	#0x04
      0085A6 89               [ 2]  954 	pushw	x
      0085A7 4B 09            [ 1]  955 	push	#0x09
      0085A9 CD 81 10         [ 4]  956 	call	_PCF_Read
      0085AC 5B 04            [ 2]  957 	addw	sp, #4
                                    958 ;	user/RTC_pcf8563.c: 178: alarm->minute = (((buffer[0] >> 4) & 0x0F) * 10) + (buffer[0] & 0x0F);
      0085AE 16 12            [ 2]  959 	ldw	y, (0x12, sp)
      0085B0 17 0B            [ 2]  960 	ldw	(0x0b, sp), y
      0085B2 1E 0D            [ 2]  961 	ldw	x, (0x0d, sp)
      0085B4 F6               [ 1]  962 	ld	a, (x)
      0085B5 90 97            [ 1]  963 	ld	yl, a
      0085B7 4E               [ 1]  964 	swap	a
      0085B8 A4 0F            [ 1]  965 	and	a, #0x0f
      0085BA A4 0F            [ 1]  966 	and	a, #0x0f
      0085BC 97               [ 1]  967 	ld	xl, a
      0085BD A6 0A            [ 1]  968 	ld	a, #0x0a
      0085BF 42               [ 4]  969 	mul	x, a
      0085C0 90 9F            [ 1]  970 	ld	a, yl
      0085C2 A4 0F            [ 1]  971 	and	a, #0x0f
      0085C4 6B 0A            [ 1]  972 	ld	(0x0a, sp), a
      0085C6 9F               [ 1]  973 	ld	a, xl
      0085C7 1B 0A            [ 1]  974 	add	a, (0x0a, sp)
      0085C9 1E 0B            [ 2]  975 	ldw	x, (0x0b, sp)
      0085CB F7               [ 1]  976 	ld	(x), a
                                    977 ;	user/RTC_pcf8563.c: 179: alarm->hour = (((buffer[1] >> 4) & 0x0B) * 10) + (buffer[1] & 0x0F);
      0085CC 16 0B            [ 2]  978 	ldw	y, (0x0b, sp)
      0085CE 90 5C            [ 2]  979 	incw	y
      0085D0 1E 0D            [ 2]  980 	ldw	x, (0x0d, sp)
      0085D2 E6 01            [ 1]  981 	ld	a, (0x1, x)
      0085D4 6B 08            [ 1]  982 	ld	(0x08, sp), a
      0085D6 7B 08            [ 1]  983 	ld	a, (0x08, sp)
      0085D8 4E               [ 1]  984 	swap	a
      0085D9 A4 0F            [ 1]  985 	and	a, #0x0f
      0085DB A4 0B            [ 1]  986 	and	a, #0x0b
      0085DD 97               [ 1]  987 	ld	xl, a
      0085DE A6 0A            [ 1]  988 	ld	a, #0x0a
      0085E0 42               [ 4]  989 	mul	x, a
      0085E1 7B 08            [ 1]  990 	ld	a, (0x08, sp)
      0085E3 A4 0F            [ 1]  991 	and	a, #0x0f
      0085E5 6B 0F            [ 1]  992 	ld	(0x0f, sp), a
      0085E7 9F               [ 1]  993 	ld	a, xl
      0085E8 1B 0F            [ 1]  994 	add	a, (0x0f, sp)
      0085EA 90 F7            [ 1]  995 	ld	(y), a
                                    996 ;	user/RTC_pcf8563.c: 180: alarm->day = (((buffer[2] >> 4) & 0x0B) * 10) + (buffer[2] & 0x0F);
      0085EC 16 0B            [ 2]  997 	ldw	y, (0x0b, sp)
      0085EE 72 A9 00 02      [ 2]  998 	addw	y, #0x0002
      0085F2 1E 0D            [ 2]  999 	ldw	x, (0x0d, sp)
      0085F4 E6 02            [ 1] 1000 	ld	a, (0x2, x)
      0085F6 6B 07            [ 1] 1001 	ld	(0x07, sp), a
      0085F8 7B 07            [ 1] 1002 	ld	a, (0x07, sp)
      0085FA 4E               [ 1] 1003 	swap	a
      0085FB A4 0F            [ 1] 1004 	and	a, #0x0f
      0085FD A4 0B            [ 1] 1005 	and	a, #0x0b
      0085FF 97               [ 1] 1006 	ld	xl, a
      008600 A6 0A            [ 1] 1007 	ld	a, #0x0a
      008602 42               [ 4] 1008 	mul	x, a
      008603 7B 07            [ 1] 1009 	ld	a, (0x07, sp)
      008605 A4 0F            [ 1] 1010 	and	a, #0x0f
      008607 6B 06            [ 1] 1011 	ld	(0x06, sp), a
      008609 9F               [ 1] 1012 	ld	a, xl
      00860A 1B 06            [ 1] 1013 	add	a, (0x06, sp)
      00860C 90 F7            [ 1] 1014 	ld	(y), a
                                   1015 ;	user/RTC_pcf8563.c: 181: alarm->weekday = (((buffer[3] >> 4) & 0x08) * 10) + (buffer[3] & 0x07);
      00860E 16 0B            [ 2] 1016 	ldw	y, (0x0b, sp)
      008610 72 A9 00 03      [ 2] 1017 	addw	y, #0x0003
      008614 1E 0D            [ 2] 1018 	ldw	x, (0x0d, sp)
      008616 E6 03            [ 1] 1019 	ld	a, (0x3, x)
      008618 6B 05            [ 1] 1020 	ld	(0x05, sp), a
      00861A 7B 05            [ 1] 1021 	ld	a, (0x05, sp)
      00861C 4E               [ 1] 1022 	swap	a
      00861D A4 0F            [ 1] 1023 	and	a, #0x0f
      00861F A4 08            [ 1] 1024 	and	a, #0x08
      008621 97               [ 1] 1025 	ld	xl, a
      008622 A6 0A            [ 1] 1026 	ld	a, #0x0a
      008624 42               [ 4] 1027 	mul	x, a
      008625 7B 05            [ 1] 1028 	ld	a, (0x05, sp)
      008627 A4 07            [ 1] 1029 	and	a, #0x07
      008629 6B 09            [ 1] 1030 	ld	(0x09, sp), a
      00862B 9F               [ 1] 1031 	ld	a, xl
      00862C 1B 09            [ 1] 1032 	add	a, (0x09, sp)
      00862E 90 F7            [ 1] 1033 	ld	(y), a
                                   1034 ;	user/RTC_pcf8563.c: 183: return 0;
      008630 4F               [ 1] 1035 	clr	a
      008631 5B 0F            [ 2] 1036 	addw	sp, #15
      008633 81               [ 4] 1037 	ret
                                   1038 ;	user/RTC_pcf8563.c: 186: uint8_t PCF_getAndClearFlags()
                                   1039 ;	-----------------------------------------
                                   1040 ;	 function PCF_getAndClearFlags
                                   1041 ;	-----------------------------------------
      008634                       1042 _PCF_getAndClearFlags:
      008634 89               [ 2] 1043 	pushw	x
                                   1044 ;	user/RTC_pcf8563.c: 190: PCF_Read(0x01, &flags, 1);				//Control_status_2
      008635 96               [ 1] 1045 	ldw	x, sp
      008636 5C               [ 2] 1046 	incw	x
      008637 5C               [ 2] 1047 	incw	x
      008638 4B 01            [ 1] 1048 	push	#0x01
      00863A 89               [ 2] 1049 	pushw	x
      00863B 4B 01            [ 1] 1050 	push	#0x01
      00863D CD 81 10         [ 4] 1051 	call	_PCF_Read
      008640 5B 04            [ 2] 1052 	addw	sp, #4
                                   1053 ;	user/RTC_pcf8563.c: 191: cleared = flags & 0x13;
      008642 7B 02            [ 1] 1054 	ld	a, (0x02, sp)
      008644 A4 13            [ 1] 1055 	and	a, #0x13
      008646 6B 01            [ 1] 1056 	ld	(0x01, sp), a
                                   1057 ;	user/RTC_pcf8563.c: 192: PCF_Write(0x01, &cleared, 1);			//Control_status_2
      008648 96               [ 1] 1058 	ldw	x, sp
      008649 5C               [ 2] 1059 	incw	x
      00864A 4B 01            [ 1] 1060 	push	#0x01
      00864C 89               [ 2] 1061 	pushw	x
      00864D 4B 01            [ 1] 1062 	push	#0x01
      00864F CD 80 DB         [ 4] 1063 	call	_PCF_Write
      008652 5B 04            [ 2] 1064 	addw	sp, #4
                                   1065 ;	user/RTC_pcf8563.c: 194: return flags & 0x0C;					//Mask unnecessary bits
      008654 7B 02            [ 1] 1066 	ld	a, (0x02, sp)
      008656 A4 0C            [ 1] 1067 	and	a, #0x0c
      008658 85               [ 2] 1068 	popw	x
      008659 81               [ 4] 1069 	ret
                                   1070 ;	user/RTC_pcf8563.c: 197: void PCF_setClockOut(uint8_t mode)
                                   1071 ;	-----------------------------------------
                                   1072 ;	 function PCF_setClockOut
                                   1073 ;	-----------------------------------------
      00865A                       1074 _PCF_setClockOut:
                                   1075 ;	user/RTC_pcf8563.c: 199: mode &= 0x13;
      00865A 7B 03            [ 1] 1076 	ld	a, (0x03, sp)
      00865C A4 13            [ 1] 1077 	and	a, #0x13
      00865E 6B 03            [ 1] 1078 	ld	(0x03, sp), a
                                   1079 ;	user/RTC_pcf8563.c: 200: PCF_Write(0x0D, &mode, 1);				//CLKOUT_control
      008660 96               [ 1] 1080 	ldw	x, sp
      008661 1C 00 03         [ 2] 1081 	addw	x, #3
      008664 4B 01            [ 1] 1082 	push	#0x01
      008666 89               [ 2] 1083 	pushw	x
      008667 4B 0D            [ 1] 1084 	push	#0x0d
      008669 CD 80 DB         [ 4] 1085 	call	_PCF_Write
      00866C 5B 04            [ 2] 1086 	addw	sp, #4
      00866E 81               [ 4] 1087 	ret
                                   1088 	.area CODE
                                   1089 	.area INITIALIZER
                                   1090 	.area CABS (ABS)
