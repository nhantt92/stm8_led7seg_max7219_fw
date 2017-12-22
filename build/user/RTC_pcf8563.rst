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
                                     12 	.globl _read_pcf
                                     13 	.globl _I2C_GetFlagStatus
                                     14 	.globl _I2C_CheckEvent
                                     15 	.globl _I2C_SendData
                                     16 	.globl _I2C_Send7bitAddress
                                     17 	.globl _I2C_ReceiveData
                                     18 	.globl _I2C_AcknowledgeConfig
                                     19 	.globl _I2C_GenerateSTOP
                                     20 	.globl _I2C_GenerateSTART
                                     21 	.globl _I2C_Cmd
                                     22 	.globl _I2C_Init
                                     23 	.globl _I2C_DeInit
                                     24 	.globl _CLK_GetClockFreq
                                     25 	.globl _I2C_setup
                                     26 	.globl _I2C_Write_Byte
                                     27 	.globl _PCF_Write
                                     28 	.globl _PCF_Read
                                     29 	.globl _PCF_getDateTime
                                     30 	.globl _PCF_Init
                                     31 	.globl _PCF_setDateTime
                                     32 	.globl _PCF_setAlarm
                                     33 	.globl _PCF_setTimer
                                     34 	.globl _PCF_getTimer
                                     35 	.globl _PCF_getAlarm
                                     36 	.globl _PCF_setClockOut
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DATA
                                     41 ;--------------------------------------------------------
                                     42 ; ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area INITIALIZED
                                     45 ;--------------------------------------------------------
                                     46 ; absolute external ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area DABS (ABS)
                                     49 ;--------------------------------------------------------
                                     50 ; global & static initialisations
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area GSINIT
                                     54 	.area GSFINAL
                                     55 	.area GSINIT
                                     56 ;--------------------------------------------------------
                                     57 ; Home
                                     58 ;--------------------------------------------------------
                                     59 	.area HOME
                                     60 	.area HOME
                                     61 ;--------------------------------------------------------
                                     62 ; code
                                     63 ;--------------------------------------------------------
                                     64 	.area CODE
                                     65 ;	user/RTC_pcf8563.c: 8: void I2C_setup(void)
                                     66 ;	-----------------------------------------
                                     67 ;	 function I2C_setup
                                     68 ;	-----------------------------------------
      0080A0                         69 _I2C_setup:
                                     70 ;	user/RTC_pcf8563.c: 11: I2C_DeInit();
      0080A0 CD 95 DD         [ 4]   71 	call	_I2C_DeInit
                                     72 ;	user/RTC_pcf8563.c: 12: Input_Clock = CLK_GetClockFreq()/1000000;
      0080A3 CD 94 09         [ 4]   73 	call	_CLK_GetClockFreq
      0080A6 4B 40            [ 1]   74 	push	#0x40
      0080A8 4B 42            [ 1]   75 	push	#0x42
      0080AA 4B 0F            [ 1]   76 	push	#0x0f
      0080AC 4B 00            [ 1]   77 	push	#0x00
      0080AE 89               [ 2]   78 	pushw	x
      0080AF 90 89            [ 2]   79 	pushw	y
      0080B1 CD 9B 19         [ 4]   80 	call	__divulong
      0080B4 5B 08            [ 2]   81 	addw	sp, #8
      0080B6 9F               [ 1]   82 	ld	a, xl
                                     83 ;	user/RTC_pcf8563.c: 13: I2C_Cmd(ENABLE);
      0080B7 88               [ 1]   84 	push	a
      0080B8 4B 01            [ 1]   85 	push	#0x01
      0080BA CD 97 30         [ 4]   86 	call	_I2C_Cmd
      0080BD 84               [ 1]   87 	pop	a
      0080BE 84               [ 1]   88 	pop	a
                                     89 ;	user/RTC_pcf8563.c: 14: I2C_Init(100000, PCF8563_WRITE_ADDR, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, Input_Clock);
      0080BF 88               [ 1]   90 	push	a
      0080C0 4B 00            [ 1]   91 	push	#0x00
      0080C2 4B 01            [ 1]   92 	push	#0x01
      0080C4 4B 00            [ 1]   93 	push	#0x00
      0080C6 4B A2            [ 1]   94 	push	#0xa2
      0080C8 4B 00            [ 1]   95 	push	#0x00
      0080CA 4B A0            [ 1]   96 	push	#0xa0
      0080CC 4B 86            [ 1]   97 	push	#0x86
      0080CE 4B 01            [ 1]   98 	push	#0x01
      0080D0 4B 00            [ 1]   99 	push	#0x00
      0080D2 CD 96 02         [ 4]  100 	call	_I2C_Init
      0080D5 5B 0A            [ 2]  101 	addw	sp, #10
      0080D7 81               [ 4]  102 	ret
                                    103 ;	user/RTC_pcf8563.c: 17: void I2C_Write_Byte(uint8_t data)
                                    104 ;	-----------------------------------------
                                    105 ;	 function I2C_Write_Byte
                                    106 ;	-----------------------------------------
      0080D8                        107 _I2C_Write_Byte:
                                    108 ;	user/RTC_pcf8563.c: 19: I2C_GenerateSTART(ENABLE);
      0080D8 4B 01            [ 1]  109 	push	#0x01
      0080DA CD 97 52         [ 4]  110 	call	_I2C_GenerateSTART
      0080DD 84               [ 1]  111 	pop	a
                                    112 ;	user/RTC_pcf8563.c: 20: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
      0080DE                        113 00101$:
      0080DE 4B 01            [ 1]  114 	push	#0x01
      0080E0 4B 03            [ 1]  115 	push	#0x03
      0080E2 CD 98 0C         [ 4]  116 	call	_I2C_CheckEvent
      0080E5 85               [ 2]  117 	popw	x
      0080E6 4D               [ 1]  118 	tnz	a
      0080E7 27 F5            [ 1]  119 	jreq	00101$
                                    120 ;	user/RTC_pcf8563.c: 21: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
      0080E9 4B 00            [ 1]  121 	push	#0x00
      0080EB 4B A2            [ 1]  122 	push	#0xa2
      0080ED CD 97 F6         [ 4]  123 	call	_I2C_Send7bitAddress
      0080F0 85               [ 2]  124 	popw	x
                                    125 ;	user/RTC_pcf8563.c: 22: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
      0080F1                        126 00104$:
      0080F1 4B 82            [ 1]  127 	push	#0x82
      0080F3 4B 07            [ 1]  128 	push	#0x07
      0080F5 CD 98 0C         [ 4]  129 	call	_I2C_CheckEvent
      0080F8 85               [ 2]  130 	popw	x
      0080F9 4D               [ 1]  131 	tnz	a
      0080FA 27 F5            [ 1]  132 	jreq	00104$
                                    133 ;	user/RTC_pcf8563.c: 23: I2C_SendData(data);
      0080FC 7B 03            [ 1]  134 	ld	a, (0x03, sp)
      0080FE 88               [ 1]  135 	push	a
      0080FF CD 98 05         [ 4]  136 	call	_I2C_SendData
      008102 84               [ 1]  137 	pop	a
                                    138 ;	user/RTC_pcf8563.c: 24: while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
      008103                        139 00107$:
      008103 4B 84            [ 1]  140 	push	#0x84
      008105 4B 07            [ 1]  141 	push	#0x07
      008107 CD 98 0C         [ 4]  142 	call	_I2C_CheckEvent
      00810A 85               [ 2]  143 	popw	x
      00810B 4D               [ 1]  144 	tnz	a
      00810C 27 F5            [ 1]  145 	jreq	00107$
                                    146 ;	user/RTC_pcf8563.c: 25: I2C_GenerateSTOP(ENABLE);
      00810E 4B 01            [ 1]  147 	push	#0x01
      008110 CD 97 60         [ 4]  148 	call	_I2C_GenerateSTOP
      008113 84               [ 1]  149 	pop	a
      008114 81               [ 4]  150 	ret
                                    151 ;	user/RTC_pcf8563.c: 28: void PCF_Write(uint8_t addr, uint8_t *data, uint8_t count)
                                    152 ;	-----------------------------------------
                                    153 ;	 function PCF_Write
                                    154 ;	-----------------------------------------
      008115                        155 _PCF_Write:
      008115 88               [ 1]  156 	push	a
                                    157 ;	user/RTC_pcf8563.c: 31: I2C_GenerateSTART(ENABLE);
      008116 4B 01            [ 1]  158 	push	#0x01
      008118 CD 97 52         [ 4]  159 	call	_I2C_GenerateSTART
      00811B 84               [ 1]  160 	pop	a
                                    161 ;	user/RTC_pcf8563.c: 33: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
      00811C                        162 00101$:
      00811C 4B 01            [ 1]  163 	push	#0x01
      00811E 4B 03            [ 1]  164 	push	#0x03
      008120 CD 98 0C         [ 4]  165 	call	_I2C_CheckEvent
      008123 85               [ 2]  166 	popw	x
      008124 4D               [ 1]  167 	tnz	a
      008125 27 F5            [ 1]  168 	jreq	00101$
                                    169 ;	user/RTC_pcf8563.c: 35: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
      008127 4B 00            [ 1]  170 	push	#0x00
      008129 4B A2            [ 1]  171 	push	#0xa2
      00812B CD 97 F6         [ 4]  172 	call	_I2C_Send7bitAddress
      00812E 85               [ 2]  173 	popw	x
                                    174 ;	user/RTC_pcf8563.c: 36: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
      00812F                        175 00104$:
      00812F 4B 82            [ 1]  176 	push	#0x82
      008131 4B 07            [ 1]  177 	push	#0x07
      008133 CD 98 0C         [ 4]  178 	call	_I2C_CheckEvent
      008136 85               [ 2]  179 	popw	x
      008137 4D               [ 1]  180 	tnz	a
      008138 27 F5            [ 1]  181 	jreq	00104$
                                    182 ;	user/RTC_pcf8563.c: 38: I2C_SendData(addr);
      00813A 7B 04            [ 1]  183 	ld	a, (0x04, sp)
      00813C 88               [ 1]  184 	push	a
      00813D CD 98 05         [ 4]  185 	call	_I2C_SendData
      008140 84               [ 1]  186 	pop	a
                                    187 ;	user/RTC_pcf8563.c: 39: while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
      008141                        188 00107$:
      008141 4B 84            [ 1]  189 	push	#0x84
      008143 4B 07            [ 1]  190 	push	#0x07
      008145 CD 98 0C         [ 4]  191 	call	_I2C_CheckEvent
      008148 85               [ 2]  192 	popw	x
      008149 4D               [ 1]  193 	tnz	a
      00814A 27 F5            [ 1]  194 	jreq	00107$
                                    195 ;	user/RTC_pcf8563.c: 41: while(count){
      00814C 7B 07            [ 1]  196 	ld	a, (0x07, sp)
      00814E 6B 01            [ 1]  197 	ld	(0x01, sp), a
      008150 1E 05            [ 2]  198 	ldw	x, (0x05, sp)
      008152                        199 00113$:
      008152 0D 01            [ 1]  200 	tnz	(0x01, sp)
      008154 27 1A            [ 1]  201 	jreq	00115$
                                    202 ;	user/RTC_pcf8563.c: 42: count--;
      008156 0A 01            [ 1]  203 	dec	(0x01, sp)
                                    204 ;	user/RTC_pcf8563.c: 43: I2C_SendData(*data);
      008158 F6               [ 1]  205 	ld	a, (x)
      008159 89               [ 2]  206 	pushw	x
      00815A 88               [ 1]  207 	push	a
      00815B CD 98 05         [ 4]  208 	call	_I2C_SendData
      00815E 84               [ 1]  209 	pop	a
      00815F 85               [ 2]  210 	popw	x
                                    211 ;	user/RTC_pcf8563.c: 44: while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
      008160                        212 00110$:
      008160 89               [ 2]  213 	pushw	x
      008161 4B 84            [ 1]  214 	push	#0x84
      008163 4B 07            [ 1]  215 	push	#0x07
      008165 CD 98 0C         [ 4]  216 	call	_I2C_CheckEvent
      008168 85               [ 2]  217 	popw	x
      008169 85               [ 2]  218 	popw	x
      00816A 4D               [ 1]  219 	tnz	a
      00816B 27 F3            [ 1]  220 	jreq	00110$
                                    221 ;	user/RTC_pcf8563.c: 45: data++;
      00816D 5C               [ 2]  222 	incw	x
      00816E 20 E2            [ 2]  223 	jra	00113$
      008170                        224 00115$:
                                    225 ;	user/RTC_pcf8563.c: 47: I2C_GenerateSTOP(ENABLE);
      008170 4B 01            [ 1]  226 	push	#0x01
      008172 CD 97 60         [ 4]  227 	call	_I2C_GenerateSTOP
      008175 84               [ 1]  228 	pop	a
      008176 84               [ 1]  229 	pop	a
      008177 81               [ 4]  230 	ret
                                    231 ;	user/RTC_pcf8563.c: 50: void PCF_Read(uint8_t addr, uint8_t *data, uint8_t count)
                                    232 ;	-----------------------------------------
                                    233 ;	 function PCF_Read
                                    234 ;	-----------------------------------------
      008178                        235 _PCF_Read:
      008178 52 03            [ 2]  236 	sub	sp, #3
                                    237 ;	user/RTC_pcf8563.c: 53: I2C_GenerateSTART(ENABLE);
      00817A 4B 01            [ 1]  238 	push	#0x01
      00817C CD 97 52         [ 4]  239 	call	_I2C_GenerateSTART
      00817F 84               [ 1]  240 	pop	a
                                    241 ;	user/RTC_pcf8563.c: 55: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
      008180                        242 00101$:
      008180 4B 01            [ 1]  243 	push	#0x01
      008182 4B 03            [ 1]  244 	push	#0x03
      008184 CD 98 0C         [ 4]  245 	call	_I2C_CheckEvent
      008187 85               [ 2]  246 	popw	x
      008188 4D               [ 1]  247 	tnz	a
      008189 27 F5            [ 1]  248 	jreq	00101$
                                    249 ;	user/RTC_pcf8563.c: 57: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
      00818B 4B 00            [ 1]  250 	push	#0x00
      00818D 4B A2            [ 1]  251 	push	#0xa2
      00818F CD 97 F6         [ 4]  252 	call	_I2C_Send7bitAddress
      008192 85               [ 2]  253 	popw	x
                                    254 ;	user/RTC_pcf8563.c: 58: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
      008193                        255 00104$:
      008193 4B 82            [ 1]  256 	push	#0x82
      008195 4B 07            [ 1]  257 	push	#0x07
      008197 CD 98 0C         [ 4]  258 	call	_I2C_CheckEvent
      00819A 85               [ 2]  259 	popw	x
      00819B 4D               [ 1]  260 	tnz	a
      00819C 27 F5            [ 1]  261 	jreq	00104$
                                    262 ;	user/RTC_pcf8563.c: 60: I2C_SendData(addr);
      00819E 7B 06            [ 1]  263 	ld	a, (0x06, sp)
      0081A0 88               [ 1]  264 	push	a
      0081A1 CD 98 05         [ 4]  265 	call	_I2C_SendData
      0081A4 84               [ 1]  266 	pop	a
                                    267 ;	user/RTC_pcf8563.c: 61: while(!I2C_CheckEvent(I2C_FLAG_TRANSFERFINISHED));
      0081A5                        268 00107$:
      0081A5 4B 04            [ 1]  269 	push	#0x04
      0081A7 4B 01            [ 1]  270 	push	#0x01
      0081A9 CD 98 0C         [ 4]  271 	call	_I2C_CheckEvent
      0081AC 85               [ 2]  272 	popw	x
      0081AD 4D               [ 1]  273 	tnz	a
      0081AE 27 F5            [ 1]  274 	jreq	00107$
                                    275 ;	user/RTC_pcf8563.c: 64: I2C_GenerateSTART(ENABLE);
      0081B0 4B 01            [ 1]  276 	push	#0x01
      0081B2 CD 97 52         [ 4]  277 	call	_I2C_GenerateSTART
      0081B5 84               [ 1]  278 	pop	a
                                    279 ;	user/RTC_pcf8563.c: 65: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
      0081B6                        280 00110$:
      0081B6 4B 01            [ 1]  281 	push	#0x01
      0081B8 4B 03            [ 1]  282 	push	#0x03
      0081BA CD 98 0C         [ 4]  283 	call	_I2C_CheckEvent
      0081BD 85               [ 2]  284 	popw	x
      0081BE 4D               [ 1]  285 	tnz	a
      0081BF 27 F5            [ 1]  286 	jreq	00110$
                                    287 ;	user/RTC_pcf8563.c: 67: I2C_Send7bitAddress(PCF8563_READ_ADDR, I2C_DIRECTION_RX);
      0081C1 4B 01            [ 1]  288 	push	#0x01
      0081C3 4B A3            [ 1]  289 	push	#0xa3
      0081C5 CD 97 F6         [ 4]  290 	call	_I2C_Send7bitAddress
      0081C8 85               [ 2]  291 	popw	x
                                    292 ;	user/RTC_pcf8563.c: 69: while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
      0081C9                        293 00113$:
      0081C9 4B 02            [ 1]  294 	push	#0x02
      0081CB 4B 03            [ 1]  295 	push	#0x03
      0081CD CD 98 0C         [ 4]  296 	call	_I2C_CheckEvent
      0081D0 85               [ 2]  297 	popw	x
      0081D1 4D               [ 1]  298 	tnz	a
      0081D2 27 F5            [ 1]  299 	jreq	00113$
                                    300 ;	user/RTC_pcf8563.c: 70: while(count)
      0081D4 7B 09            [ 1]  301 	ld	a, (0x09, sp)
      0081D6 6B 01            [ 1]  302 	ld	(0x01, sp), a
      0081D8 16 07            [ 2]  303 	ldw	y, (0x07, sp)
      0081DA 17 02            [ 2]  304 	ldw	(0x02, sp), y
      0081DC                        305 00119$:
      0081DC 0D 01            [ 1]  306 	tnz	(0x01, sp)
      0081DE 27 2E            [ 1]  307 	jreq	00121$
                                    308 ;	user/RTC_pcf8563.c: 73: count--;
      0081E0 0A 01            [ 1]  309 	dec	(0x01, sp)
                                    310 ;	user/RTC_pcf8563.c: 74: I2C_AcknowledgeConfig(I2C_ACK_NONE);
      0081E2 4B 00            [ 1]  311 	push	#0x00
      0081E4 CD 97 90         [ 4]  312 	call	_I2C_AcknowledgeConfig
      0081E7 84               [ 1]  313 	pop	a
                                    314 ;	user/RTC_pcf8563.c: 77: I2C->SR1;        
      0081E8 AE 52 17         [ 2]  315 	ldw	x, #0x5217
      0081EB F6               [ 1]  316 	ld	a, (x)
                                    317 ;	user/RTC_pcf8563.c: 78: I2C->SR3;
      0081EC AE 52 19         [ 2]  318 	ldw	x, #0x5219
      0081EF F6               [ 1]  319 	ld	a, (x)
                                    320 ;	user/RTC_pcf8563.c: 79: while (I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) == RESET);
      0081F0                        321 00116$:
      0081F0 4B 40            [ 1]  322 	push	#0x40
      0081F2 4B 01            [ 1]  323 	push	#0x01
      0081F4 CD 98 87         [ 4]  324 	call	_I2C_GetFlagStatus
      0081F7 85               [ 2]  325 	popw	x
      0081F8 4D               [ 1]  326 	tnz	a
      0081F9 27 F5            [ 1]  327 	jreq	00116$
                                    328 ;	user/RTC_pcf8563.c: 80: *data = I2C_ReceiveData();
      0081FB CD 97 F1         [ 4]  329 	call	_I2C_ReceiveData
      0081FE 1E 02            [ 2]  330 	ldw	x, (0x02, sp)
      008200 F7               [ 1]  331 	ld	(x), a
                                    332 ;	user/RTC_pcf8563.c: 81: I2C_AcknowledgeConfig(I2C_ACK_CURR);
      008201 4B 01            [ 1]  333 	push	#0x01
      008203 CD 97 90         [ 4]  334 	call	_I2C_AcknowledgeConfig
      008206 84               [ 1]  335 	pop	a
                                    336 ;	user/RTC_pcf8563.c: 82: data++;
      008207 1E 02            [ 2]  337 	ldw	x, (0x02, sp)
      008209 5C               [ 2]  338 	incw	x
      00820A 1F 02            [ 2]  339 	ldw	(0x02, sp), x
      00820C 20 CE            [ 2]  340 	jra	00119$
      00820E                        341 00121$:
                                    342 ;	user/RTC_pcf8563.c: 84: I2C_GenerateSTOP(ENABLE);
      00820E 4B 01            [ 1]  343 	push	#0x01
      008210 CD 97 60         [ 4]  344 	call	_I2C_GenerateSTOP
      008213 5B 04            [ 2]  345 	addw	sp, #4
      008215 81               [ 4]  346 	ret
                                    347 ;	user/RTC_pcf8563.c: 88: uint8_t read_pcf(uint8_t regadd)
                                    348 ;	-----------------------------------------
                                    349 ;	 function read_pcf
                                    350 ;	-----------------------------------------
      008216                        351 _read_pcf:
      008216 88               [ 1]  352 	push	a
                                    353 ;	user/RTC_pcf8563.c: 92: while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY)==SET);
      008217                        354 00101$:
      008217 4B 02            [ 1]  355 	push	#0x02
      008219 4B 03            [ 1]  356 	push	#0x03
      00821B CD 98 87         [ 4]  357 	call	_I2C_GetFlagStatus
      00821E 85               [ 2]  358 	popw	x
      00821F A1 01            [ 1]  359 	cp	a, #0x01
      008221 27 F4            [ 1]  360 	jreq	00101$
                                    361 ;	user/RTC_pcf8563.c: 94: I2C_GenerateSTART(ENABLE);
      008223 4B 01            [ 1]  362 	push	#0x01
      008225 CD 97 52         [ 4]  363 	call	_I2C_GenerateSTART
      008228 84               [ 1]  364 	pop	a
                                    365 ;	user/RTC_pcf8563.c: 97: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
      008229                        366 00104$:
      008229 4B 01            [ 1]  367 	push	#0x01
      00822B 4B 03            [ 1]  368 	push	#0x03
      00822D CD 98 0C         [ 4]  369 	call	_I2C_CheckEvent
      008230 85               [ 2]  370 	popw	x
      008231 4D               [ 1]  371 	tnz	a
      008232 27 F5            [ 1]  372 	jreq	00104$
                                    373 ;	user/RTC_pcf8563.c: 100: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
      008234 4B 00            [ 1]  374 	push	#0x00
      008236 4B A2            [ 1]  375 	push	#0xa2
      008238 CD 97 F6         [ 4]  376 	call	_I2C_Send7bitAddress
      00823B 85               [ 2]  377 	popw	x
                                    378 ;	user/RTC_pcf8563.c: 101: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
      00823C                        379 00107$:
      00823C 4B 82            [ 1]  380 	push	#0x82
      00823E 4B 07            [ 1]  381 	push	#0x07
      008240 CD 98 0C         [ 4]  382 	call	_I2C_CheckEvent
      008243 85               [ 2]  383 	popw	x
      008244 4D               [ 1]  384 	tnz	a
      008245 27 F5            [ 1]  385 	jreq	00107$
                                    386 ;	user/RTC_pcf8563.c: 104: I2C_SendData(regadd);
      008247 7B 04            [ 1]  387 	ld	a, (0x04, sp)
      008249 88               [ 1]  388 	push	a
      00824A CD 98 05         [ 4]  389 	call	_I2C_SendData
      00824D 84               [ 1]  390 	pop	a
                                    391 ;	user/RTC_pcf8563.c: 105: while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);
      00824E                        392 00110$:
      00824E 4B 04            [ 1]  393 	push	#0x04
      008250 4B 01            [ 1]  394 	push	#0x01
      008252 CD 98 87         [ 4]  395 	call	_I2C_GetFlagStatus
      008255 85               [ 2]  396 	popw	x
      008256 4D               [ 1]  397 	tnz	a
      008257 27 F5            [ 1]  398 	jreq	00110$
                                    399 ;	user/RTC_pcf8563.c: 108: I2C_GenerateSTART( ENABLE);
      008259 4B 01            [ 1]  400 	push	#0x01
      00825B CD 97 52         [ 4]  401 	call	_I2C_GenerateSTART
      00825E 84               [ 1]  402 	pop	a
                                    403 ;	user/RTC_pcf8563.c: 109: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
      00825F                        404 00113$:
      00825F 4B 01            [ 1]  405 	push	#0x01
      008261 4B 03            [ 1]  406 	push	#0x03
      008263 CD 98 0C         [ 4]  407 	call	_I2C_CheckEvent
      008266 85               [ 2]  408 	popw	x
      008267 4D               [ 1]  409 	tnz	a
      008268 27 F5            [ 1]  410 	jreq	00113$
                                    411 ;	user/RTC_pcf8563.c: 112: I2C_Send7bitAddress(PCF8563_READ_ADDR,I2C_DIRECTION_RX);
      00826A 4B 01            [ 1]  412 	push	#0x01
      00826C 4B A3            [ 1]  413 	push	#0xa3
      00826E CD 97 F6         [ 4]  414 	call	_I2C_Send7bitAddress
      008271 85               [ 2]  415 	popw	x
                                    416 ;	user/RTC_pcf8563.c: 115: while(I2C_GetFlagStatus(I2C_FLAG_ADDRESSSENTMATCHED) == RESET);
      008272                        417 00116$:
      008272 4B 02            [ 1]  418 	push	#0x02
      008274 4B 01            [ 1]  419 	push	#0x01
      008276 CD 98 87         [ 4]  420 	call	_I2C_GetFlagStatus
      008279 85               [ 2]  421 	popw	x
      00827A 4D               [ 1]  422 	tnz	a
      00827B 27 F5            [ 1]  423 	jreq	00116$
                                    424 ;	user/RTC_pcf8563.c: 118: I2C_AcknowledgeConfig(I2C_ACK_NONE);
      00827D 4B 00            [ 1]  425 	push	#0x00
      00827F CD 97 90         [ 4]  426 	call	_I2C_AcknowledgeConfig
      008282 84               [ 1]  427 	pop	a
                                    428 ;	user/RTC_pcf8563.c: 121: I2C->SR1;        I2C->SR3;
      008283 AE 52 17         [ 2]  429 	ldw	x, #0x5217
      008286 F6               [ 1]  430 	ld	a, (x)
      008287 AE 52 19         [ 2]  431 	ldw	x, #0x5219
      00828A F6               [ 1]  432 	ld	a, (x)
                                    433 ;	user/RTC_pcf8563.c: 123: I2C_GenerateSTOP(ENABLE);
      00828B 4B 01            [ 1]  434 	push	#0x01
      00828D CD 97 60         [ 4]  435 	call	_I2C_GenerateSTOP
      008290 84               [ 1]  436 	pop	a
                                    437 ;	user/RTC_pcf8563.c: 126: while (I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
      008291                        438 00119$:
      008291 4B 40            [ 1]  439 	push	#0x40
      008293 4B 01            [ 1]  440 	push	#0x01
      008295 CD 98 87         [ 4]  441 	call	_I2C_GetFlagStatus
      008298 85               [ 2]  442 	popw	x
      008299 4D               [ 1]  443 	tnz	a
      00829A 27 F5            [ 1]  444 	jreq	00119$
                                    445 ;	user/RTC_pcf8563.c: 129: data=I2C_ReceiveData();
      00829C CD 97 F1         [ 4]  446 	call	_I2C_ReceiveData
      00829F 6B 01            [ 1]  447 	ld	(0x01, sp), a
                                    448 ;	user/RTC_pcf8563.c: 132: while(I2C->CR2 & I2C_CR2_STOP);
      0082A1                        449 00122$:
      0082A1 AE 52 11         [ 2]  450 	ldw	x, #0x5211
      0082A4 F6               [ 1]  451 	ld	a, (x)
      0082A5 A5 02            [ 1]  452 	bcp	a, #0x02
      0082A7 26 F8            [ 1]  453 	jrne	00122$
                                    454 ;	user/RTC_pcf8563.c: 134: I2C_AcknowledgeConfig( I2C_ACK_CURR);
      0082A9 4B 01            [ 1]  455 	push	#0x01
      0082AB CD 97 90         [ 4]  456 	call	_I2C_AcknowledgeConfig
      0082AE 84               [ 1]  457 	pop	a
                                    458 ;	user/RTC_pcf8563.c: 135: return (data);
      0082AF 7B 01            [ 1]  459 	ld	a, (0x01, sp)
      0082B1 5B 01            [ 2]  460 	addw	sp, #1
      0082B3 81               [ 4]  461 	ret
                                    462 ;	user/RTC_pcf8563.c: 138: uint8_t PCF_getDateTime(PCF_DateTime *dateTime)
                                    463 ;	-----------------------------------------
                                    464 ;	 function PCF_getDateTime
                                    465 ;	-----------------------------------------
      0082B4                        466 _PCF_getDateTime:
      0082B4 52 1B            [ 2]  467 	sub	sp, #27
                                    468 ;	user/RTC_pcf8563.c: 143: buffer[0] = read_pcf(0x02);
      0082B6 96               [ 1]  469 	ldw	x, sp
      0082B7 5C               [ 2]  470 	incw	x
      0082B8 1F 10            [ 2]  471 	ldw	(0x10, sp), x
      0082BA 4B 02            [ 1]  472 	push	#0x02
      0082BC CD 82 16         [ 4]  473 	call	_read_pcf
      0082BF 5B 01            [ 2]  474 	addw	sp, #1
      0082C1 6B 14            [ 1]  475 	ld	(0x14, sp), a
      0082C3 1E 10            [ 2]  476 	ldw	x, (0x10, sp)
      0082C5 7B 14            [ 1]  477 	ld	a, (0x14, sp)
      0082C7 F7               [ 1]  478 	ld	(x), a
                                    479 ;	user/RTC_pcf8563.c: 145: dateTime->second = (((buffer[0] >> 4) & 0x07) * 10) + (buffer[0] & 0x0F);
      0082C8 16 1E            [ 2]  480 	ldw	y, (0x1e, sp)
      0082CA 17 15            [ 2]  481 	ldw	(0x15, sp), y
      0082CC 7B 14            [ 1]  482 	ld	a, (0x14, sp)
      0082CE 4E               [ 1]  483 	swap	a
      0082CF A4 0F            [ 1]  484 	and	a, #0x0f
      0082D1 A4 07            [ 1]  485 	and	a, #0x07
      0082D3 97               [ 1]  486 	ld	xl, a
      0082D4 A6 0A            [ 1]  487 	ld	a, #0x0a
      0082D6 42               [ 4]  488 	mul	x, a
      0082D7 7B 14            [ 1]  489 	ld	a, (0x14, sp)
      0082D9 A4 0F            [ 1]  490 	and	a, #0x0f
      0082DB 6B 0F            [ 1]  491 	ld	(0x0f, sp), a
      0082DD 9F               [ 1]  492 	ld	a, xl
      0082DE 1B 0F            [ 1]  493 	add	a, (0x0f, sp)
      0082E0 1E 15            [ 2]  494 	ldw	x, (0x15, sp)
      0082E2 F7               [ 1]  495 	ld	(x), a
                                    496 ;	user/RTC_pcf8563.c: 146: buffer[1] = read_pcf(0x03);
      0082E3 1E 10            [ 2]  497 	ldw	x, (0x10, sp)
      0082E5 5C               [ 2]  498 	incw	x
      0082E6 89               [ 2]  499 	pushw	x
      0082E7 4B 03            [ 1]  500 	push	#0x03
      0082E9 CD 82 16         [ 4]  501 	call	_read_pcf
      0082EC 5B 01            [ 2]  502 	addw	sp, #1
      0082EE 6B 1A            [ 1]  503 	ld	(0x1a, sp), a
      0082F0 85               [ 2]  504 	popw	x
      0082F1 7B 18            [ 1]  505 	ld	a, (0x18, sp)
      0082F3 F7               [ 1]  506 	ld	(x), a
                                    507 ;	user/RTC_pcf8563.c: 147: dateTime->minute = (((buffer[1] >> 4) & 0x07) * 10) + (buffer[1] & 0x0F);
      0082F4 1E 15            [ 2]  508 	ldw	x, (0x15, sp)
      0082F6 5C               [ 2]  509 	incw	x
      0082F7 1F 0A            [ 2]  510 	ldw	(0x0a, sp), x
      0082F9 7B 18            [ 1]  511 	ld	a, (0x18, sp)
      0082FB 4E               [ 1]  512 	swap	a
      0082FC A4 0F            [ 1]  513 	and	a, #0x0f
      0082FE A4 07            [ 1]  514 	and	a, #0x07
      008300 97               [ 1]  515 	ld	xl, a
      008301 A6 0A            [ 1]  516 	ld	a, #0x0a
      008303 42               [ 4]  517 	mul	x, a
      008304 7B 18            [ 1]  518 	ld	a, (0x18, sp)
      008306 A4 0F            [ 1]  519 	and	a, #0x0f
      008308 6B 12            [ 1]  520 	ld	(0x12, sp), a
      00830A 9F               [ 1]  521 	ld	a, xl
      00830B 1B 12            [ 1]  522 	add	a, (0x12, sp)
      00830D 1E 0A            [ 2]  523 	ldw	x, (0x0a, sp)
      00830F F7               [ 1]  524 	ld	(x), a
                                    525 ;	user/RTC_pcf8563.c: 148: buffer[2] = read_pcf(0x04);
      008310 1E 10            [ 2]  526 	ldw	x, (0x10, sp)
      008312 5C               [ 2]  527 	incw	x
      008313 5C               [ 2]  528 	incw	x
      008314 89               [ 2]  529 	pushw	x
      008315 4B 04            [ 1]  530 	push	#0x04
      008317 CD 82 16         [ 4]  531 	call	_read_pcf
      00831A 5B 01            [ 2]  532 	addw	sp, #1
      00831C 6B 10            [ 1]  533 	ld	(0x10, sp), a
      00831E 85               [ 2]  534 	popw	x
      00831F 7B 0E            [ 1]  535 	ld	a, (0x0e, sp)
      008321 F7               [ 1]  536 	ld	(x), a
                                    537 ;	user/RTC_pcf8563.c: 149: dateTime->hour = (((buffer[2] >> 4) & 0x03) * 10) + (buffer[2] & 0x0F);
      008322 16 15            [ 2]  538 	ldw	y, (0x15, sp)
      008324 72 A9 00 02      [ 2]  539 	addw	y, #0x0002
      008328 7B 0E            [ 1]  540 	ld	a, (0x0e, sp)
      00832A 4E               [ 1]  541 	swap	a
      00832B A4 0F            [ 1]  542 	and	a, #0x0f
      00832D A4 03            [ 1]  543 	and	a, #0x03
      00832F 97               [ 1]  544 	ld	xl, a
      008330 A6 0A            [ 1]  545 	ld	a, #0x0a
      008332 42               [ 4]  546 	mul	x, a
      008333 7B 0E            [ 1]  547 	ld	a, (0x0e, sp)
      008335 A4 0F            [ 1]  548 	and	a, #0x0f
      008337 6B 19            [ 1]  549 	ld	(0x19, sp), a
      008339 9F               [ 1]  550 	ld	a, xl
      00833A 1B 19            [ 1]  551 	add	a, (0x19, sp)
      00833C 90 F7            [ 1]  552 	ld	(y), a
                                    553 ;	user/RTC_pcf8563.c: 150: buffer[3] = read_pcf(0x05);
      00833E 1E 10            [ 2]  554 	ldw	x, (0x10, sp)
      008340 1C 00 03         [ 2]  555 	addw	x, #0x0003
      008343 89               [ 2]  556 	pushw	x
      008344 4B 05            [ 1]  557 	push	#0x05
      008346 CD 82 16         [ 4]  558 	call	_read_pcf
      008349 5B 01            [ 2]  559 	addw	sp, #1
      00834B 6B 19            [ 1]  560 	ld	(0x19, sp), a
      00834D 85               [ 2]  561 	popw	x
      00834E 7B 17            [ 1]  562 	ld	a, (0x17, sp)
      008350 F7               [ 1]  563 	ld	(x), a
                                    564 ;	user/RTC_pcf8563.c: 151: dateTime->day = (((buffer[3] >> 4) & 0x03) * 10) + (buffer[3] & 0x0F);
      008351 16 15            [ 2]  565 	ldw	y, (0x15, sp)
      008353 72 A9 00 03      [ 2]  566 	addw	y, #0x0003
      008357 7B 17            [ 1]  567 	ld	a, (0x17, sp)
      008359 4E               [ 1]  568 	swap	a
      00835A A4 0F            [ 1]  569 	and	a, #0x0f
      00835C A4 03            [ 1]  570 	and	a, #0x03
      00835E 97               [ 1]  571 	ld	xl, a
      00835F A6 0A            [ 1]  572 	ld	a, #0x0a
      008361 42               [ 4]  573 	mul	x, a
      008362 7B 17            [ 1]  574 	ld	a, (0x17, sp)
      008364 A4 0F            [ 1]  575 	and	a, #0x0f
      008366 6B 09            [ 1]  576 	ld	(0x09, sp), a
      008368 9F               [ 1]  577 	ld	a, xl
      008369 1B 09            [ 1]  578 	add	a, (0x09, sp)
      00836B 90 F7            [ 1]  579 	ld	(y), a
                                    580 ;	user/RTC_pcf8563.c: 152: buffer[4] = read_pcf(0x06);
      00836D 1E 10            [ 2]  581 	ldw	x, (0x10, sp)
      00836F 1C 00 04         [ 2]  582 	addw	x, #0x0004
      008372 89               [ 2]  583 	pushw	x
      008373 4B 06            [ 1]  584 	push	#0x06
      008375 CD 82 16         [ 4]  585 	call	_read_pcf
      008378 5B 01            [ 2]  586 	addw	sp, #1
      00837A 85               [ 2]  587 	popw	x
      00837B F7               [ 1]  588 	ld	(x), a
                                    589 ;	user/RTC_pcf8563.c: 153: dateTime->weekday = (buffer[4] & 0x07);
      00837C 1E 15            [ 2]  590 	ldw	x, (0x15, sp)
      00837E 1C 00 04         [ 2]  591 	addw	x, #0x0004
      008381 A4 07            [ 1]  592 	and	a, #0x07
      008383 F7               [ 1]  593 	ld	(x), a
                                    594 ;	user/RTC_pcf8563.c: 154: buffer[5] = read_pcf(0x07);
      008384 1E 10            [ 2]  595 	ldw	x, (0x10, sp)
      008386 1C 00 05         [ 2]  596 	addw	x, #0x0005
      008389 1F 0C            [ 2]  597 	ldw	(0x0c, sp), x
      00838B 4B 07            [ 1]  598 	push	#0x07
      00838D CD 82 16         [ 4]  599 	call	_read_pcf
      008390 5B 01            [ 2]  600 	addw	sp, #1
      008392 1E 0C            [ 2]  601 	ldw	x, (0x0c, sp)
      008394 F7               [ 1]  602 	ld	(x), a
                                    603 ;	user/RTC_pcf8563.c: 155: dateTime->month = ((buffer[5] >> 4) & 0x01) * 10 + (buffer[5] & 0x0F);
      008395 16 15            [ 2]  604 	ldw	y, (0x15, sp)
      008397 72 A9 00 05      [ 2]  605 	addw	y, #0x0005
      00839B 88               [ 1]  606 	push	a
      00839C 44               [ 1]  607 	srl	a
      00839D 44               [ 1]  608 	srl	a
      00839E 44               [ 1]  609 	srl	a
      00839F 44               [ 1]  610 	srl	a
      0083A0 A4 01            [ 1]  611 	and	a, #0x01
      0083A2 97               [ 1]  612 	ld	xl, a
      0083A3 A6 0A            [ 1]  613 	ld	a, #0x0a
      0083A5 42               [ 4]  614 	mul	x, a
      0083A6 84               [ 1]  615 	pop	a
      0083A7 A4 0F            [ 1]  616 	and	a, #0x0f
      0083A9 6B 08            [ 1]  617 	ld	(0x08, sp), a
      0083AB 9F               [ 1]  618 	ld	a, xl
      0083AC 1B 08            [ 1]  619 	add	a, (0x08, sp)
      0083AE 90 F7            [ 1]  620 	ld	(y), a
                                    621 ;	user/RTC_pcf8563.c: 156: buffer[6] = read_pcf(0x08);
      0083B0 1E 10            [ 2]  622 	ldw	x, (0x10, sp)
      0083B2 1C 00 06         [ 2]  623 	addw	x, #0x0006
      0083B5 89               [ 2]  624 	pushw	x
      0083B6 4B 08            [ 1]  625 	push	#0x08
      0083B8 CD 82 16         [ 4]  626 	call	_read_pcf
      0083BB 5B 01            [ 2]  627 	addw	sp, #1
      0083BD 6B 15            [ 1]  628 	ld	(0x15, sp), a
      0083BF 85               [ 2]  629 	popw	x
      0083C0 7B 13            [ 1]  630 	ld	a, (0x13, sp)
      0083C2 F7               [ 1]  631 	ld	(x), a
                                    632 ;	user/RTC_pcf8563.c: 157: dateTime->year = 1900 + ((buffer[6] >> 4) & 0x0F) * 10 + (buffer[6] & 0x0F);
      0083C3 1E 15            [ 2]  633 	ldw	x, (0x15, sp)
      0083C5 1C 00 06         [ 2]  634 	addw	x, #0x0006
      0083C8 7B 13            [ 1]  635 	ld	a, (0x13, sp)
      0083CA 4E               [ 1]  636 	swap	a
      0083CB A4 0F            [ 1]  637 	and	a, #0x0f
      0083CD A4 0F            [ 1]  638 	and	a, #0x0f
      0083CF 61               [ 1]  639 	exg	a, yl
      0083D0 A6 0A            [ 1]  640 	ld	a, #0x0a
      0083D2 61               [ 1]  641 	exg	a, yl
      0083D3 90 42            [ 4]  642 	mul	y, a
      0083D5 72 A9 07 6C      [ 2]  643 	addw	y, #0x076c
      0083D9 7B 13            [ 1]  644 	ld	a, (0x13, sp)
      0083DB A4 0F            [ 1]  645 	and	a, #0x0f
      0083DD 6B 1B            [ 1]  646 	ld	(0x1b, sp), a
      0083DF 0F 1A            [ 1]  647 	clr	(0x1a, sp)
      0083E1 72 F9 1A         [ 2]  648 	addw	y, (0x1a, sp)
      0083E4 FF               [ 2]  649 	ldw	(x), y
                                    650 ;	user/RTC_pcf8563.c: 159: if (buffer[5] &  0x80)
      0083E5 16 0C            [ 2]  651 	ldw	y, (0x0c, sp)
      0083E7 90 F6            [ 1]  652 	ld	a, (y)
      0083E9 4D               [ 1]  653 	tnz	a
      0083EA 2A 09            [ 1]  654 	jrpl	00102$
                                    655 ;	user/RTC_pcf8563.c: 161: dateTime->year += 100;
      0083EC 89               [ 2]  656 	pushw	x
      0083ED FE               [ 2]  657 	ldw	x, (x)
      0083EE 51               [ 1]  658 	exgw	x, y
      0083EF 85               [ 2]  659 	popw	x
      0083F0 72 A9 00 64      [ 2]  660 	addw	y, #0x0064
      0083F4 FF               [ 2]  661 	ldw	(x), y
      0083F5                        662 00102$:
                                    663 ;	user/RTC_pcf8563.c: 164: if (buffer[0] & 0x80) //Clock integrity not guaranted
      0083F5 1E 10            [ 2]  664 	ldw	x, (0x10, sp)
      0083F7 F6               [ 1]  665 	ld	a, (x)
      0083F8 4D               [ 1]  666 	tnz	a
      0083F9 2A 03            [ 1]  667 	jrpl	00104$
                                    668 ;	user/RTC_pcf8563.c: 166: return 1;
      0083FB A6 01            [ 1]  669 	ld	a, #0x01
                                    670 ;	user/RTC_pcf8563.c: 169: return 0;
      0083FD 21                     671 	.byte 0x21
      0083FE                        672 00104$:
      0083FE 4F               [ 1]  673 	clr	a
      0083FF                        674 00105$:
      0083FF 5B 1B            [ 2]  675 	addw	sp, #27
      008401 81               [ 4]  676 	ret
                                    677 ;	user/RTC_pcf8563.c: 173: void PCF_Init(uint8_t mode)
                                    678 ;	-----------------------------------------
                                    679 ;	 function PCF_Init
                                    680 ;	-----------------------------------------
      008402                        681 _PCF_Init:
      008402 88               [ 1]  682 	push	a
                                    683 ;	user/RTC_pcf8563.c: 175: uint8_t tmp = 0x00;
      008403 0F 01            [ 1]  684 	clr	(0x01, sp)
                                    685 ;	user/RTC_pcf8563.c: 176: I2C_setup();
      008405 CD 80 A0         [ 4]  686 	call	_I2C_setup
                                    687 ;	user/RTC_pcf8563.c: 179: PCF_Write(0x00, &tmp, 1);
      008408 96               [ 1]  688 	ldw	x, sp
      008409 5C               [ 2]  689 	incw	x
      00840A 4B 01            [ 1]  690 	push	#0x01
      00840C 89               [ 2]  691 	pushw	x
      00840D 4B 00            [ 1]  692 	push	#0x00
      00840F CD 81 15         [ 4]  693 	call	_PCF_Write
      008412 5B 04            [ 2]  694 	addw	sp, #4
                                    695 ;	user/RTC_pcf8563.c: 180: mode &= 0x13;
      008414 7B 04            [ 1]  696 	ld	a, (0x04, sp)
      008416 A4 13            [ 1]  697 	and	a, #0x13
      008418 6B 04            [ 1]  698 	ld	(0x04, sp), a
                                    699 ;	user/RTC_pcf8563.c: 183: PCF_Write(0x00, &mode, 1);
      00841A 96               [ 1]  700 	ldw	x, sp
      00841B 1C 00 04         [ 2]  701 	addw	x, #4
      00841E 4B 01            [ 1]  702 	push	#0x01
      008420 89               [ 2]  703 	pushw	x
      008421 4B 00            [ 1]  704 	push	#0x00
      008423 CD 81 15         [ 4]  705 	call	_PCF_Write
      008426 5B 05            [ 2]  706 	addw	sp, #5
      008428 81               [ 4]  707 	ret
                                    708 ;	user/RTC_pcf8563.c: 186: uint8_t PCF_setDateTime(PCF_DateTime *dateTime)
                                    709 ;	-----------------------------------------
                                    710 ;	 function PCF_setDateTime
                                    711 ;	-----------------------------------------
      008429                        712 _PCF_setDateTime:
      008429 52 26            [ 2]  713 	sub	sp, #38
                                    714 ;	user/RTC_pcf8563.c: 189: if (dateTime->second >= 60 || dateTime->minute >= 60 || dateTime->hour >= 24 || dateTime->day > 32 || dateTime->weekday > 6 || dateTime->month > 12 || dateTime->year < 1900 || dateTime->year >= 2100)
      00842B 16 29            [ 2]  715 	ldw	y, (0x29, sp)
      00842D 17 1E            [ 2]  716 	ldw	(0x1e, sp), y
      00842F 1E 1E            [ 2]  717 	ldw	x, (0x1e, sp)
      008431 F6               [ 1]  718 	ld	a, (x)
      008432 6B 1D            [ 1]  719 	ld	(0x1d, sp), a
      008434 7B 1D            [ 1]  720 	ld	a, (0x1d, sp)
      008436 A1 3C            [ 1]  721 	cp	a, #0x3c
      008438 24 55            [ 1]  722 	jrnc	00101$
      00843A 16 1E            [ 2]  723 	ldw	y, (0x1e, sp)
      00843C 90 5C            [ 2]  724 	incw	y
      00843E 90 F6            [ 1]  725 	ld	a, (y)
      008440 A1 3C            [ 1]  726 	cp	a, #0x3c
      008442 24 4B            [ 1]  727 	jrnc	00101$
      008444 1E 1E            [ 2]  728 	ldw	x, (0x1e, sp)
      008446 5C               [ 2]  729 	incw	x
      008447 5C               [ 2]  730 	incw	x
      008448 1F 0E            [ 2]  731 	ldw	(0x0e, sp), x
      00844A 1E 0E            [ 2]  732 	ldw	x, (0x0e, sp)
      00844C F6               [ 1]  733 	ld	a, (x)
      00844D A1 18            [ 1]  734 	cp	a, #0x18
      00844F 24 3E            [ 1]  735 	jrnc	00101$
      008451 1E 1E            [ 2]  736 	ldw	x, (0x1e, sp)
      008453 1C 00 03         [ 2]  737 	addw	x, #0x0003
      008456 1F 12            [ 2]  738 	ldw	(0x12, sp), x
      008458 1E 12            [ 2]  739 	ldw	x, (0x12, sp)
      00845A F6               [ 1]  740 	ld	a, (x)
      00845B A1 20            [ 1]  741 	cp	a, #0x20
      00845D 22 30            [ 1]  742 	jrugt	00101$
      00845F 1E 1E            [ 2]  743 	ldw	x, (0x1e, sp)
      008461 1C 00 04         [ 2]  744 	addw	x, #0x0004
      008464 1F 1B            [ 2]  745 	ldw	(0x1b, sp), x
      008466 1E 1B            [ 2]  746 	ldw	x, (0x1b, sp)
      008468 F6               [ 1]  747 	ld	a, (x)
      008469 A1 06            [ 1]  748 	cp	a, #0x06
      00846B 22 22            [ 1]  749 	jrugt	00101$
      00846D 1E 1E            [ 2]  750 	ldw	x, (0x1e, sp)
      00846F 1C 00 05         [ 2]  751 	addw	x, #0x0005
      008472 1F 22            [ 2]  752 	ldw	(0x22, sp), x
      008474 1E 22            [ 2]  753 	ldw	x, (0x22, sp)
      008476 F6               [ 1]  754 	ld	a, (x)
      008477 A1 0C            [ 1]  755 	cp	a, #0x0c
      008479 22 14            [ 1]  756 	jrugt	00101$
      00847B 1E 1E            [ 2]  757 	ldw	x, (0x1e, sp)
      00847D 1C 00 06         [ 2]  758 	addw	x, #0x0006
      008480 1F 20            [ 2]  759 	ldw	(0x20, sp), x
      008482 1E 20            [ 2]  760 	ldw	x, (0x20, sp)
      008484 FE               [ 2]  761 	ldw	x, (x)
      008485 A3 07 6C         [ 2]  762 	cpw	x, #0x076c
      008488 25 05            [ 1]  763 	jrc	00101$
      00848A A3 08 34         [ 2]  764 	cpw	x, #0x0834
      00848D 25 05            [ 1]  765 	jrc	00102$
      00848F                        766 00101$:
                                    767 ;	user/RTC_pcf8563.c: 191: return 1;
      00848F A6 01            [ 1]  768 	ld	a, #0x01
      008491 CC 85 C5         [ 2]  769 	jp	00113$
      008494                        770 00102$:
                                    771 ;	user/RTC_pcf8563.c: 194: buffer[0] = BinToBCD(dateTime->second) & 0x7F;
      008494 96               [ 1]  772 	ldw	x, sp
      008495 5C               [ 2]  773 	incw	x
      008496 1F 19            [ 2]  774 	ldw	(0x19, sp), x
      008498 5F               [ 1]  775 	clrw	x
      008499 7B 1D            [ 1]  776 	ld	a, (0x1d, sp)
      00849B 97               [ 1]  777 	ld	xl, a
      00849C A6 0A            [ 1]  778 	ld	a, #0x0a
      00849E 62               [ 2]  779 	div	x, a
      00849F 9F               [ 1]  780 	ld	a, xl
      0084A0 4E               [ 1]  781 	swap	a
      0084A1 A4 F0            [ 1]  782 	and	a, #0xf0
      0084A3 6B 11            [ 1]  783 	ld	(0x11, sp), a
      0084A5 5F               [ 1]  784 	clrw	x
      0084A6 7B 1D            [ 1]  785 	ld	a, (0x1d, sp)
      0084A8 97               [ 1]  786 	ld	xl, a
      0084A9 A6 0A            [ 1]  787 	ld	a, #0x0a
      0084AB 62               [ 2]  788 	div	x, a
      0084AC 1B 11            [ 1]  789 	add	a, (0x11, sp)
      0084AE A4 7F            [ 1]  790 	and	a, #0x7f
      0084B0 1E 19            [ 2]  791 	ldw	x, (0x19, sp)
      0084B2 F7               [ 1]  792 	ld	(x), a
                                    793 ;	user/RTC_pcf8563.c: 195: buffer[1] = BinToBCD(dateTime->minute) & 0x7F;
      0084B3 1E 19            [ 2]  794 	ldw	x, (0x19, sp)
      0084B5 5C               [ 2]  795 	incw	x
      0084B6 1F 17            [ 2]  796 	ldw	(0x17, sp), x
      0084B8 90 F6            [ 1]  797 	ld	a, (y)
      0084BA 97               [ 1]  798 	ld	xl, a
      0084BB 89               [ 2]  799 	pushw	x
      0084BC 4F               [ 1]  800 	clr	a
      0084BD 95               [ 1]  801 	ld	xh, a
      0084BE A6 0A            [ 1]  802 	ld	a, #0x0a
      0084C0 62               [ 2]  803 	div	x, a
      0084C1 9F               [ 1]  804 	ld	a, xl
      0084C2 85               [ 2]  805 	popw	x
      0084C3 4E               [ 1]  806 	swap	a
      0084C4 A4 F0            [ 1]  807 	and	a, #0xf0
      0084C6 6B 24            [ 1]  808 	ld	(0x24, sp), a
      0084C8 4F               [ 1]  809 	clr	a
      0084C9 95               [ 1]  810 	ld	xh, a
      0084CA A6 0A            [ 1]  811 	ld	a, #0x0a
      0084CC 62               [ 2]  812 	div	x, a
      0084CD 1B 24            [ 1]  813 	add	a, (0x24, sp)
      0084CF A4 7F            [ 1]  814 	and	a, #0x7f
      0084D1 1E 17            [ 2]  815 	ldw	x, (0x17, sp)
      0084D3 F7               [ 1]  816 	ld	(x), a
                                    817 ;	user/RTC_pcf8563.c: 196: buffer[2] = BinToBCD(dateTime->hour) & 0x3F;
      0084D4 16 19            [ 2]  818 	ldw	y, (0x19, sp)
      0084D6 72 A9 00 02      [ 2]  819 	addw	y, #0x0002
      0084DA 1E 0E            [ 2]  820 	ldw	x, (0x0e, sp)
      0084DC F6               [ 1]  821 	ld	a, (x)
      0084DD 97               [ 1]  822 	ld	xl, a
      0084DE 89               [ 2]  823 	pushw	x
      0084DF 4F               [ 1]  824 	clr	a
      0084E0 95               [ 1]  825 	ld	xh, a
      0084E1 A6 0A            [ 1]  826 	ld	a, #0x0a
      0084E3 62               [ 2]  827 	div	x, a
      0084E4 9F               [ 1]  828 	ld	a, xl
      0084E5 85               [ 2]  829 	popw	x
      0084E6 4E               [ 1]  830 	swap	a
      0084E7 A4 F0            [ 1]  831 	and	a, #0xf0
      0084E9 6B 10            [ 1]  832 	ld	(0x10, sp), a
      0084EB 4F               [ 1]  833 	clr	a
      0084EC 95               [ 1]  834 	ld	xh, a
      0084ED A6 0A            [ 1]  835 	ld	a, #0x0a
      0084EF 62               [ 2]  836 	div	x, a
      0084F0 1B 10            [ 1]  837 	add	a, (0x10, sp)
      0084F2 A4 3F            [ 1]  838 	and	a, #0x3f
      0084F4 90 F7            [ 1]  839 	ld	(y), a
                                    840 ;	user/RTC_pcf8563.c: 197: buffer[3] = BinToBCD(dateTime->day) & 0x3F;
      0084F6 16 19            [ 2]  841 	ldw	y, (0x19, sp)
      0084F8 72 A9 00 03      [ 2]  842 	addw	y, #0x0003
      0084FC 1E 12            [ 2]  843 	ldw	x, (0x12, sp)
      0084FE F6               [ 1]  844 	ld	a, (x)
      0084FF 97               [ 1]  845 	ld	xl, a
      008500 89               [ 2]  846 	pushw	x
      008501 4F               [ 1]  847 	clr	a
      008502 95               [ 1]  848 	ld	xh, a
      008503 A6 0A            [ 1]  849 	ld	a, #0x0a
      008505 62               [ 2]  850 	div	x, a
      008506 9F               [ 1]  851 	ld	a, xl
      008507 85               [ 2]  852 	popw	x
      008508 4E               [ 1]  853 	swap	a
      008509 A4 F0            [ 1]  854 	and	a, #0xf0
      00850B 6B 0D            [ 1]  855 	ld	(0x0d, sp), a
      00850D 4F               [ 1]  856 	clr	a
      00850E 95               [ 1]  857 	ld	xh, a
      00850F A6 0A            [ 1]  858 	ld	a, #0x0a
      008511 62               [ 2]  859 	div	x, a
      008512 1B 0D            [ 1]  860 	add	a, (0x0d, sp)
      008514 A4 3F            [ 1]  861 	and	a, #0x3f
      008516 90 F7            [ 1]  862 	ld	(y), a
                                    863 ;	user/RTC_pcf8563.c: 198: buffer[4] = BinToBCD(dateTime->weekday) & 0x07;
      008518 16 19            [ 2]  864 	ldw	y, (0x19, sp)
      00851A 72 A9 00 04      [ 2]  865 	addw	y, #0x0004
      00851E 1E 1B            [ 2]  866 	ldw	x, (0x1b, sp)
      008520 F6               [ 1]  867 	ld	a, (x)
      008521 97               [ 1]  868 	ld	xl, a
      008522 89               [ 2]  869 	pushw	x
      008523 4F               [ 1]  870 	clr	a
      008524 95               [ 1]  871 	ld	xh, a
      008525 A6 0A            [ 1]  872 	ld	a, #0x0a
      008527 62               [ 2]  873 	div	x, a
      008528 9F               [ 1]  874 	ld	a, xl
      008529 85               [ 2]  875 	popw	x
      00852A 4E               [ 1]  876 	swap	a
      00852B A4 F0            [ 1]  877 	and	a, #0xf0
      00852D 6B 16            [ 1]  878 	ld	(0x16, sp), a
      00852F 4F               [ 1]  879 	clr	a
      008530 95               [ 1]  880 	ld	xh, a
      008531 A6 0A            [ 1]  881 	ld	a, #0x0a
      008533 62               [ 2]  882 	div	x, a
      008534 1B 16            [ 1]  883 	add	a, (0x16, sp)
      008536 A4 07            [ 1]  884 	and	a, #0x07
      008538 90 F7            [ 1]  885 	ld	(y), a
                                    886 ;	user/RTC_pcf8563.c: 199: buffer[5] = BinToBCD(dateTime->month) & 0x1F;
      00853A 1E 19            [ 2]  887 	ldw	x, (0x19, sp)
      00853C 1C 00 05         [ 2]  888 	addw	x, #0x0005
      00853F 1F 14            [ 2]  889 	ldw	(0x14, sp), x
      008541 1E 22            [ 2]  890 	ldw	x, (0x22, sp)
      008543 F6               [ 1]  891 	ld	a, (x)
      008544 97               [ 1]  892 	ld	xl, a
      008545 89               [ 2]  893 	pushw	x
      008546 4F               [ 1]  894 	clr	a
      008547 95               [ 1]  895 	ld	xh, a
      008548 A6 0A            [ 1]  896 	ld	a, #0x0a
      00854A 62               [ 2]  897 	div	x, a
      00854B 9F               [ 1]  898 	ld	a, xl
      00854C 85               [ 2]  899 	popw	x
      00854D 4E               [ 1]  900 	swap	a
      00854E A4 F0            [ 1]  901 	and	a, #0xf0
      008550 6B 26            [ 1]  902 	ld	(0x26, sp), a
      008552 4F               [ 1]  903 	clr	a
      008553 95               [ 1]  904 	ld	xh, a
      008554 A6 0A            [ 1]  905 	ld	a, #0x0a
      008556 62               [ 2]  906 	div	x, a
      008557 1B 26            [ 1]  907 	add	a, (0x26, sp)
      008559 A4 1F            [ 1]  908 	and	a, #0x1f
      00855B 1E 14            [ 2]  909 	ldw	x, (0x14, sp)
      00855D F7               [ 1]  910 	ld	(x), a
                                    911 ;	user/RTC_pcf8563.c: 201: if (dateTime->year >= 2000)
      00855E 1E 20            [ 2]  912 	ldw	x, (0x20, sp)
      008560 FE               [ 2]  913 	ldw	x, (x)
      008561 1F 0B            [ 2]  914 	ldw	(0x0b, sp), x
                                    915 ;	user/RTC_pcf8563.c: 204: buffer[6] = BinToBCD(dateTime->year - 2000);
      008563 1E 19            [ 2]  916 	ldw	x, (0x19, sp)
      008565 1C 00 06         [ 2]  917 	addw	x, #0x0006
      008568 1F 09            [ 2]  918 	ldw	(0x09, sp), x
                                    919 ;	user/RTC_pcf8563.c: 201: if (dateTime->year >= 2000)
      00856A 1E 0B            [ 2]  920 	ldw	x, (0x0b, sp)
      00856C A3 07 D0         [ 2]  921 	cpw	x, #0x07d0
      00856F 25 29            [ 1]  922 	jrc	00111$
                                    923 ;	user/RTC_pcf8563.c: 203: buffer[5] |= 0x80;
      008571 1E 14            [ 2]  924 	ldw	x, (0x14, sp)
      008573 F6               [ 1]  925 	ld	a, (x)
      008574 AA 80            [ 1]  926 	or	a, #0x80
      008576 1E 14            [ 2]  927 	ldw	x, (0x14, sp)
      008578 F7               [ 1]  928 	ld	(x), a
                                    929 ;	user/RTC_pcf8563.c: 204: buffer[6] = BinToBCD(dateTime->year - 2000);
      008579 1E 20            [ 2]  930 	ldw	x, (0x20, sp)
      00857B FE               [ 2]  931 	ldw	x, (x)
      00857C 1D 07 D0         [ 2]  932 	subw	x, #0x07d0
      00857F 89               [ 2]  933 	pushw	x
      008580 90 AE 00 0A      [ 2]  934 	ldw	y, #0x000a
      008584 65               [ 2]  935 	divw	x, y
      008585 9F               [ 1]  936 	ld	a, xl
      008586 85               [ 2]  937 	popw	x
      008587 4E               [ 1]  938 	swap	a
      008588 A4 F0            [ 1]  939 	and	a, #0xf0
      00858A 6B 25            [ 1]  940 	ld	(0x25, sp), a
      00858C 90 AE 00 0A      [ 2]  941 	ldw	y, #0x000a
      008590 65               [ 2]  942 	divw	x, y
      008591 90 9F            [ 1]  943 	ld	a, yl
      008593 1B 25            [ 1]  944 	add	a, (0x25, sp)
      008595 1E 09            [ 2]  945 	ldw	x, (0x09, sp)
      008597 F7               [ 1]  946 	ld	(x), a
      008598 20 1E            [ 2]  947 	jra	00112$
      00859A                        948 00111$:
                                    949 ;	user/RTC_pcf8563.c: 208: buffer[6] = BinToBCD(dateTime->year - 1900);
      00859A 1E 0B            [ 2]  950 	ldw	x, (0x0b, sp)
      00859C 1D 07 6C         [ 2]  951 	subw	x, #0x076c
      00859F 89               [ 2]  952 	pushw	x
      0085A0 90 AE 00 0A      [ 2]  953 	ldw	y, #0x000a
      0085A4 65               [ 2]  954 	divw	x, y
      0085A5 9F               [ 1]  955 	ld	a, xl
      0085A6 85               [ 2]  956 	popw	x
      0085A7 4E               [ 1]  957 	swap	a
      0085A8 A4 F0            [ 1]  958 	and	a, #0xf0
      0085AA 90 AE 00 0A      [ 2]  959 	ldw	y, #0x000a
      0085AE 65               [ 2]  960 	divw	x, y
      0085AF 61               [ 1]  961 	exg	a, yl
      0085B0 6B 08            [ 1]  962 	ld	(0x08, sp), a
      0085B2 61               [ 1]  963 	exg	a, yl
      0085B3 1B 08            [ 1]  964 	add	a, (0x08, sp)
      0085B5 1E 09            [ 2]  965 	ldw	x, (0x09, sp)
      0085B7 F7               [ 1]  966 	ld	(x), a
      0085B8                        967 00112$:
                                    968 ;	user/RTC_pcf8563.c: 211: PCF_Write(0x02, buffer, sizeof(buffer));
      0085B8 1E 19            [ 2]  969 	ldw	x, (0x19, sp)
      0085BA 4B 07            [ 1]  970 	push	#0x07
      0085BC 89               [ 2]  971 	pushw	x
      0085BD 4B 02            [ 1]  972 	push	#0x02
      0085BF CD 81 15         [ 4]  973 	call	_PCF_Write
      0085C2 5B 04            [ 2]  974 	addw	sp, #4
                                    975 ;	user/RTC_pcf8563.c: 213: return 0;
      0085C4 4F               [ 1]  976 	clr	a
      0085C5                        977 00113$:
      0085C5 5B 26            [ 2]  978 	addw	sp, #38
      0085C7 81               [ 4]  979 	ret
                                    980 ;	user/RTC_pcf8563.c: 243: uint8_t PCF_setAlarm(PCF_Alarm *alarm)
                                    981 ;	-----------------------------------------
                                    982 ;	 function PCF_setAlarm
                                    983 ;	-----------------------------------------
      0085C8                        984 _PCF_setAlarm:
      0085C8 52 13            [ 2]  985 	sub	sp, #19
                                    986 ;	user/RTC_pcf8563.c: 246: if ((alarm->minute >= 60 && alarm->minute != 80) || (alarm->hour >= 24 && alarm->hour != 80) || (alarm->day > 32 && alarm->day != 80) || (alarm->weekday > 6 && alarm->weekday != 80))
      0085CA 16 16            [ 2]  987 	ldw	y, (0x16, sp)
      0085CC 17 0E            [ 2]  988 	ldw	(0x0e, sp), y
      0085CE 1E 0E            [ 2]  989 	ldw	x, (0x0e, sp)
      0085D0 F6               [ 1]  990 	ld	a, (x)
      0085D1 6B 06            [ 1]  991 	ld	(0x06, sp), a
      0085D3 7B 06            [ 1]  992 	ld	a, (0x06, sp)
      0085D5 A1 3C            [ 1]  993 	cp	a, #0x3c
      0085D7 25 06            [ 1]  994 	jrc	00105$
      0085D9 7B 06            [ 1]  995 	ld	a, (0x06, sp)
      0085DB A1 50            [ 1]  996 	cp	a, #0x50
      0085DD 26 31            [ 1]  997 	jrne	00101$
      0085DF                        998 00105$:
      0085DF 16 0E            [ 2]  999 	ldw	y, (0x0e, sp)
      0085E1 90 5C            [ 2] 1000 	incw	y
      0085E3 90 F6            [ 1] 1001 	ld	a, (y)
      0085E5 A1 18            [ 1] 1002 	cp	a, #0x18
      0085E7 25 04            [ 1] 1003 	jrc	00107$
      0085E9 A1 50            [ 1] 1004 	cp	a, #0x50
      0085EB 26 23            [ 1] 1005 	jrne	00101$
      0085ED                       1006 00107$:
      0085ED 1E 0E            [ 2] 1007 	ldw	x, (0x0e, sp)
      0085EF 5C               [ 2] 1008 	incw	x
      0085F0 5C               [ 2] 1009 	incw	x
      0085F1 1F 10            [ 2] 1010 	ldw	(0x10, sp), x
      0085F3 1E 10            [ 2] 1011 	ldw	x, (0x10, sp)
      0085F5 F6               [ 1] 1012 	ld	a, (x)
      0085F6 A1 20            [ 1] 1013 	cp	a, #0x20
      0085F8 23 04            [ 2] 1014 	jrule	00109$
      0085FA A1 50            [ 1] 1015 	cp	a, #0x50
      0085FC 26 12            [ 1] 1016 	jrne	00101$
      0085FE                       1017 00109$:
      0085FE 1E 0E            [ 2] 1018 	ldw	x, (0x0e, sp)
      008600 1C 00 03         [ 2] 1019 	addw	x, #0x0003
      008603 1F 0C            [ 2] 1020 	ldw	(0x0c, sp), x
      008605 1E 0C            [ 2] 1021 	ldw	x, (0x0c, sp)
      008607 F6               [ 1] 1022 	ld	a, (x)
      008608 A1 06            [ 1] 1023 	cp	a, #0x06
      00860A 23 09            [ 2] 1024 	jrule	00102$
      00860C A1 50            [ 1] 1025 	cp	a, #0x50
      00860E 27 05            [ 1] 1026 	jreq	00102$
      008610                       1027 00101$:
                                   1028 ;	user/RTC_pcf8563.c: 248: return 1;
      008610 A6 01            [ 1] 1029 	ld	a, #0x01
      008612 CC 86 A4         [ 2] 1030 	jp	00110$
      008615                       1031 00102$:
                                   1032 ;	user/RTC_pcf8563.c: 251: buffer[0] = BinToBCD(alarm->minute) & 0xFF;
      008615 96               [ 1] 1033 	ldw	x, sp
      008616 5C               [ 2] 1034 	incw	x
      008617 1F 07            [ 2] 1035 	ldw	(0x07, sp), x
      008619 5F               [ 1] 1036 	clrw	x
      00861A 7B 06            [ 1] 1037 	ld	a, (0x06, sp)
      00861C 97               [ 1] 1038 	ld	xl, a
      00861D A6 0A            [ 1] 1039 	ld	a, #0x0a
      00861F 62               [ 2] 1040 	div	x, a
      008620 9F               [ 1] 1041 	ld	a, xl
      008621 4E               [ 1] 1042 	swap	a
      008622 A4 F0            [ 1] 1043 	and	a, #0xf0
      008624 6B 0B            [ 1] 1044 	ld	(0x0b, sp), a
      008626 5F               [ 1] 1045 	clrw	x
      008627 7B 06            [ 1] 1046 	ld	a, (0x06, sp)
      008629 97               [ 1] 1047 	ld	xl, a
      00862A A6 0A            [ 1] 1048 	ld	a, #0x0a
      00862C 62               [ 2] 1049 	div	x, a
      00862D 1B 0B            [ 1] 1050 	add	a, (0x0b, sp)
      00862F 1E 07            [ 2] 1051 	ldw	x, (0x07, sp)
      008631 F7               [ 1] 1052 	ld	(x), a
                                   1053 ;	user/RTC_pcf8563.c: 252: buffer[1] = BinToBCD(alarm->hour) & 0xBF;
      008632 1E 07            [ 2] 1054 	ldw	x, (0x07, sp)
      008634 5C               [ 2] 1055 	incw	x
      008635 1F 09            [ 2] 1056 	ldw	(0x09, sp), x
      008637 90 F6            [ 1] 1057 	ld	a, (y)
      008639 97               [ 1] 1058 	ld	xl, a
      00863A 89               [ 2] 1059 	pushw	x
      00863B 4F               [ 1] 1060 	clr	a
      00863C 95               [ 1] 1061 	ld	xh, a
      00863D A6 0A            [ 1] 1062 	ld	a, #0x0a
      00863F 62               [ 2] 1063 	div	x, a
      008640 9F               [ 1] 1064 	ld	a, xl
      008641 85               [ 2] 1065 	popw	x
      008642 4E               [ 1] 1066 	swap	a
      008643 A4 F0            [ 1] 1067 	and	a, #0xf0
      008645 6B 05            [ 1] 1068 	ld	(0x05, sp), a
      008647 4F               [ 1] 1069 	clr	a
      008648 95               [ 1] 1070 	ld	xh, a
      008649 A6 0A            [ 1] 1071 	ld	a, #0x0a
      00864B 62               [ 2] 1072 	div	x, a
      00864C 1B 05            [ 1] 1073 	add	a, (0x05, sp)
      00864E A4 BF            [ 1] 1074 	and	a, #0xbf
      008650 1E 09            [ 2] 1075 	ldw	x, (0x09, sp)
      008652 F7               [ 1] 1076 	ld	(x), a
                                   1077 ;	user/RTC_pcf8563.c: 253: buffer[2] = BinToBCD(alarm->day) & 0xBF;
      008653 16 07            [ 2] 1078 	ldw	y, (0x07, sp)
      008655 72 A9 00 02      [ 2] 1079 	addw	y, #0x0002
      008659 1E 10            [ 2] 1080 	ldw	x, (0x10, sp)
      00865B F6               [ 1] 1081 	ld	a, (x)
      00865C 97               [ 1] 1082 	ld	xl, a
      00865D 89               [ 2] 1083 	pushw	x
      00865E 4F               [ 1] 1084 	clr	a
      00865F 95               [ 1] 1085 	ld	xh, a
      008660 A6 0A            [ 1] 1086 	ld	a, #0x0a
      008662 62               [ 2] 1087 	div	x, a
      008663 9F               [ 1] 1088 	ld	a, xl
      008664 85               [ 2] 1089 	popw	x
      008665 4E               [ 1] 1090 	swap	a
      008666 A4 F0            [ 1] 1091 	and	a, #0xf0
      008668 6B 13            [ 1] 1092 	ld	(0x13, sp), a
      00866A 4F               [ 1] 1093 	clr	a
      00866B 95               [ 1] 1094 	ld	xh, a
      00866C A6 0A            [ 1] 1095 	ld	a, #0x0a
      00866E 62               [ 2] 1096 	div	x, a
      00866F 1B 13            [ 1] 1097 	add	a, (0x13, sp)
      008671 A4 BF            [ 1] 1098 	and	a, #0xbf
      008673 90 F7            [ 1] 1099 	ld	(y), a
                                   1100 ;	user/RTC_pcf8563.c: 254: buffer[3] = BinToBCD(alarm->weekday) & 0x87;
      008675 16 07            [ 2] 1101 	ldw	y, (0x07, sp)
      008677 72 A9 00 03      [ 2] 1102 	addw	y, #0x0003
      00867B 1E 0C            [ 2] 1103 	ldw	x, (0x0c, sp)
      00867D F6               [ 1] 1104 	ld	a, (x)
      00867E 97               [ 1] 1105 	ld	xl, a
      00867F 89               [ 2] 1106 	pushw	x
      008680 4F               [ 1] 1107 	clr	a
      008681 95               [ 1] 1108 	ld	xh, a
      008682 A6 0A            [ 1] 1109 	ld	a, #0x0a
      008684 62               [ 2] 1110 	div	x, a
      008685 9F               [ 1] 1111 	ld	a, xl
      008686 85               [ 2] 1112 	popw	x
      008687 4E               [ 1] 1113 	swap	a
      008688 A4 F0            [ 1] 1114 	and	a, #0xf0
      00868A 6B 12            [ 1] 1115 	ld	(0x12, sp), a
      00868C 4F               [ 1] 1116 	clr	a
      00868D 95               [ 1] 1117 	ld	xh, a
      00868E A6 0A            [ 1] 1118 	ld	a, #0x0a
      008690 62               [ 2] 1119 	div	x, a
      008691 1B 12            [ 1] 1120 	add	a, (0x12, sp)
      008693 A4 87            [ 1] 1121 	and	a, #0x87
      008695 90 F7            [ 1] 1122 	ld	(y), a
                                   1123 ;	user/RTC_pcf8563.c: 256: PCF_Write(0x09, buffer, sizeof(buffer));
      008697 1E 07            [ 2] 1124 	ldw	x, (0x07, sp)
      008699 4B 04            [ 1] 1125 	push	#0x04
      00869B 89               [ 2] 1126 	pushw	x
      00869C 4B 09            [ 1] 1127 	push	#0x09
      00869E CD 81 15         [ 4] 1128 	call	_PCF_Write
      0086A1 5B 04            [ 2] 1129 	addw	sp, #4
                                   1130 ;	user/RTC_pcf8563.c: 258: return 0;
      0086A3 4F               [ 1] 1131 	clr	a
      0086A4                       1132 00110$:
      0086A4 5B 13            [ 2] 1133 	addw	sp, #19
      0086A6 81               [ 4] 1134 	ret
                                   1135 ;	user/RTC_pcf8563.c: 261: void PCF_setTimer(uint8_t mode, uint8_t count)
                                   1136 ;	-----------------------------------------
                                   1137 ;	 function PCF_setTimer
                                   1138 ;	-----------------------------------------
      0086A7                       1139 _PCF_setTimer:
                                   1140 ;	user/RTC_pcf8563.c: 263: mode &= 0x13;
      0086A7 7B 03            [ 1] 1141 	ld	a, (0x03, sp)
      0086A9 A4 13            [ 1] 1142 	and	a, #0x13
      0086AB 6B 03            [ 1] 1143 	ld	(0x03, sp), a
                                   1144 ;	user/RTC_pcf8563.c: 264: PCF_Write(0x0E, &mode, 1);				//Timer_control
      0086AD 96               [ 1] 1145 	ldw	x, sp
      0086AE 1C 00 03         [ 2] 1146 	addw	x, #3
      0086B1 4B 01            [ 1] 1147 	push	#0x01
      0086B3 89               [ 2] 1148 	pushw	x
      0086B4 4B 0E            [ 1] 1149 	push	#0x0e
      0086B6 CD 81 15         [ 4] 1150 	call	_PCF_Write
      0086B9 5B 04            [ 2] 1151 	addw	sp, #4
                                   1152 ;	user/RTC_pcf8563.c: 266: PCF_Write(0x0F, &count, 1);				//Timer
      0086BB 96               [ 1] 1153 	ldw	x, sp
      0086BC 1C 00 04         [ 2] 1154 	addw	x, #4
      0086BF 4B 01            [ 1] 1155 	push	#0x01
      0086C1 89               [ 2] 1156 	pushw	x
      0086C2 4B 0F            [ 1] 1157 	push	#0x0f
      0086C4 CD 81 15         [ 4] 1158 	call	_PCF_Write
      0086C7 5B 04            [ 2] 1159 	addw	sp, #4
      0086C9 81               [ 4] 1160 	ret
                                   1161 ;	user/RTC_pcf8563.c: 269: uint8_t PCF_getTimer()
                                   1162 ;	-----------------------------------------
                                   1163 ;	 function PCF_getTimer
                                   1164 ;	-----------------------------------------
      0086CA                       1165 _PCF_getTimer:
      0086CA 88               [ 1] 1166 	push	a
                                   1167 ;	user/RTC_pcf8563.c: 272: PCF_Read(0x0F, &count, 1);				//Timer
      0086CB 96               [ 1] 1168 	ldw	x, sp
      0086CC 5C               [ 2] 1169 	incw	x
      0086CD 4B 01            [ 1] 1170 	push	#0x01
      0086CF 89               [ 2] 1171 	pushw	x
      0086D0 4B 0F            [ 1] 1172 	push	#0x0f
      0086D2 CD 81 78         [ 4] 1173 	call	_PCF_Read
      0086D5 5B 04            [ 2] 1174 	addw	sp, #4
                                   1175 ;	user/RTC_pcf8563.c: 274: return count;
      0086D7 7B 01            [ 1] 1176 	ld	a, (0x01, sp)
      0086D9 5B 01            [ 2] 1177 	addw	sp, #1
      0086DB 81               [ 4] 1178 	ret
                                   1179 ;	user/RTC_pcf8563.c: 277: uint8_t PCF_getAlarm(PCF_Alarm *alarm)
                                   1180 ;	-----------------------------------------
                                   1181 ;	 function PCF_getAlarm
                                   1182 ;	-----------------------------------------
      0086DC                       1183 _PCF_getAlarm:
      0086DC 52 0F            [ 2] 1184 	sub	sp, #15
                                   1185 ;	user/RTC_pcf8563.c: 281: PCF_Read(0x09, buffer, sizeof(buffer));
      0086DE 96               [ 1] 1186 	ldw	x, sp
      0086DF 5C               [ 2] 1187 	incw	x
      0086E0 1F 0E            [ 2] 1188 	ldw	(0x0e, sp), x
      0086E2 1E 0E            [ 2] 1189 	ldw	x, (0x0e, sp)
      0086E4 4B 04            [ 1] 1190 	push	#0x04
      0086E6 89               [ 2] 1191 	pushw	x
      0086E7 4B 09            [ 1] 1192 	push	#0x09
      0086E9 CD 81 78         [ 4] 1193 	call	_PCF_Read
      0086EC 5B 04            [ 2] 1194 	addw	sp, #4
                                   1195 ;	user/RTC_pcf8563.c: 283: alarm->minute = (((buffer[0] >> 4) & 0x0F) * 10) + (buffer[0] & 0x0F);
      0086EE 16 12            [ 2] 1196 	ldw	y, (0x12, sp)
      0086F0 17 09            [ 2] 1197 	ldw	(0x09, sp), y
      0086F2 1E 0E            [ 2] 1198 	ldw	x, (0x0e, sp)
      0086F4 F6               [ 1] 1199 	ld	a, (x)
      0086F5 90 97            [ 1] 1200 	ld	yl, a
      0086F7 4E               [ 1] 1201 	swap	a
      0086F8 A4 0F            [ 1] 1202 	and	a, #0x0f
      0086FA A4 0F            [ 1] 1203 	and	a, #0x0f
      0086FC 97               [ 1] 1204 	ld	xl, a
      0086FD A6 0A            [ 1] 1205 	ld	a, #0x0a
      0086FF 42               [ 4] 1206 	mul	x, a
      008700 90 9F            [ 1] 1207 	ld	a, yl
      008702 A4 0F            [ 1] 1208 	and	a, #0x0f
      008704 6B 0C            [ 1] 1209 	ld	(0x0c, sp), a
      008706 9F               [ 1] 1210 	ld	a, xl
      008707 1B 0C            [ 1] 1211 	add	a, (0x0c, sp)
      008709 1E 09            [ 2] 1212 	ldw	x, (0x09, sp)
      00870B F7               [ 1] 1213 	ld	(x), a
                                   1214 ;	user/RTC_pcf8563.c: 284: alarm->hour = (((buffer[1] >> 4) & 0x0B) * 10) + (buffer[1] & 0x0F);
      00870C 16 09            [ 2] 1215 	ldw	y, (0x09, sp)
      00870E 90 5C            [ 2] 1216 	incw	y
      008710 1E 0E            [ 2] 1217 	ldw	x, (0x0e, sp)
      008712 E6 01            [ 1] 1218 	ld	a, (0x1, x)
      008714 6B 06            [ 1] 1219 	ld	(0x06, sp), a
      008716 7B 06            [ 1] 1220 	ld	a, (0x06, sp)
      008718 4E               [ 1] 1221 	swap	a
      008719 A4 0F            [ 1] 1222 	and	a, #0x0f
      00871B A4 0B            [ 1] 1223 	and	a, #0x0b
      00871D 97               [ 1] 1224 	ld	xl, a
      00871E A6 0A            [ 1] 1225 	ld	a, #0x0a
      008720 42               [ 4] 1226 	mul	x, a
      008721 7B 06            [ 1] 1227 	ld	a, (0x06, sp)
      008723 A4 0F            [ 1] 1228 	and	a, #0x0f
      008725 6B 08            [ 1] 1229 	ld	(0x08, sp), a
      008727 9F               [ 1] 1230 	ld	a, xl
      008728 1B 08            [ 1] 1231 	add	a, (0x08, sp)
      00872A 90 F7            [ 1] 1232 	ld	(y), a
                                   1233 ;	user/RTC_pcf8563.c: 285: alarm->day = (((buffer[2] >> 4) & 0x0B) * 10) + (buffer[2] & 0x0F);
      00872C 16 09            [ 2] 1234 	ldw	y, (0x09, sp)
      00872E 72 A9 00 02      [ 2] 1235 	addw	y, #0x0002
      008732 1E 0E            [ 2] 1236 	ldw	x, (0x0e, sp)
      008734 E6 02            [ 1] 1237 	ld	a, (0x2, x)
      008736 6B 0B            [ 1] 1238 	ld	(0x0b, sp), a
      008738 7B 0B            [ 1] 1239 	ld	a, (0x0b, sp)
      00873A 4E               [ 1] 1240 	swap	a
      00873B A4 0F            [ 1] 1241 	and	a, #0x0f
      00873D A4 0B            [ 1] 1242 	and	a, #0x0b
      00873F 97               [ 1] 1243 	ld	xl, a
      008740 A6 0A            [ 1] 1244 	ld	a, #0x0a
      008742 42               [ 4] 1245 	mul	x, a
      008743 7B 0B            [ 1] 1246 	ld	a, (0x0b, sp)
      008745 A4 0F            [ 1] 1247 	and	a, #0x0f
      008747 6B 0D            [ 1] 1248 	ld	(0x0d, sp), a
      008749 9F               [ 1] 1249 	ld	a, xl
      00874A 1B 0D            [ 1] 1250 	add	a, (0x0d, sp)
      00874C 90 F7            [ 1] 1251 	ld	(y), a
                                   1252 ;	user/RTC_pcf8563.c: 286: alarm->weekday = (((buffer[3] >> 4) & 0x08) * 10) + (buffer[3] & 0x07);
      00874E 16 09            [ 2] 1253 	ldw	y, (0x09, sp)
      008750 72 A9 00 03      [ 2] 1254 	addw	y, #0x0003
      008754 1E 0E            [ 2] 1255 	ldw	x, (0x0e, sp)
      008756 E6 03            [ 1] 1256 	ld	a, (0x3, x)
      008758 6B 07            [ 1] 1257 	ld	(0x07, sp), a
      00875A 7B 07            [ 1] 1258 	ld	a, (0x07, sp)
      00875C 4E               [ 1] 1259 	swap	a
      00875D A4 0F            [ 1] 1260 	and	a, #0x0f
      00875F A4 08            [ 1] 1261 	and	a, #0x08
      008761 97               [ 1] 1262 	ld	xl, a
      008762 A6 0A            [ 1] 1263 	ld	a, #0x0a
      008764 42               [ 4] 1264 	mul	x, a
      008765 7B 07            [ 1] 1265 	ld	a, (0x07, sp)
      008767 A4 07            [ 1] 1266 	and	a, #0x07
      008769 6B 05            [ 1] 1267 	ld	(0x05, sp), a
      00876B 9F               [ 1] 1268 	ld	a, xl
      00876C 1B 05            [ 1] 1269 	add	a, (0x05, sp)
      00876E 90 F7            [ 1] 1270 	ld	(y), a
                                   1271 ;	user/RTC_pcf8563.c: 288: return 0;
      008770 4F               [ 1] 1272 	clr	a
      008771 5B 0F            [ 2] 1273 	addw	sp, #15
      008773 81               [ 4] 1274 	ret
                                   1275 ;	user/RTC_pcf8563.c: 291: uint8_t PCF_getAndClearFlags()
                                   1276 ;	-----------------------------------------
                                   1277 ;	 function PCF_getAndClearFlags
                                   1278 ;	-----------------------------------------
      008774                       1279 _PCF_getAndClearFlags:
      008774 89               [ 2] 1280 	pushw	x
                                   1281 ;	user/RTC_pcf8563.c: 295: PCF_Read(0x01, &flags, 1);				//Control_status_2
      008775 96               [ 1] 1282 	ldw	x, sp
      008776 5C               [ 2] 1283 	incw	x
      008777 4B 01            [ 1] 1284 	push	#0x01
      008779 89               [ 2] 1285 	pushw	x
      00877A 4B 01            [ 1] 1286 	push	#0x01
      00877C CD 81 78         [ 4] 1287 	call	_PCF_Read
      00877F 5B 04            [ 2] 1288 	addw	sp, #4
                                   1289 ;	user/RTC_pcf8563.c: 296: cleared = flags & 0x13;
      008781 7B 01            [ 1] 1290 	ld	a, (0x01, sp)
      008783 A4 13            [ 1] 1291 	and	a, #0x13
      008785 6B 02            [ 1] 1292 	ld	(0x02, sp), a
                                   1293 ;	user/RTC_pcf8563.c: 297: PCF_Write(0x01, &cleared, 1);			//Control_status_2
      008787 96               [ 1] 1294 	ldw	x, sp
      008788 5C               [ 2] 1295 	incw	x
      008789 5C               [ 2] 1296 	incw	x
      00878A 4B 01            [ 1] 1297 	push	#0x01
      00878C 89               [ 2] 1298 	pushw	x
      00878D 4B 01            [ 1] 1299 	push	#0x01
      00878F CD 81 15         [ 4] 1300 	call	_PCF_Write
      008792 5B 04            [ 2] 1301 	addw	sp, #4
                                   1302 ;	user/RTC_pcf8563.c: 299: return flags & 0x0C;					//Mask unnecessary bits
      008794 7B 01            [ 1] 1303 	ld	a, (0x01, sp)
      008796 A4 0C            [ 1] 1304 	and	a, #0x0c
      008798 85               [ 2] 1305 	popw	x
      008799 81               [ 4] 1306 	ret
                                   1307 ;	user/RTC_pcf8563.c: 302: void PCF_setClockOut(uint8_t mode)
                                   1308 ;	-----------------------------------------
                                   1309 ;	 function PCF_setClockOut
                                   1310 ;	-----------------------------------------
      00879A                       1311 _PCF_setClockOut:
                                   1312 ;	user/RTC_pcf8563.c: 304: mode &= 0x13;
      00879A 7B 03            [ 1] 1313 	ld	a, (0x03, sp)
      00879C A4 13            [ 1] 1314 	and	a, #0x13
      00879E 6B 03            [ 1] 1315 	ld	(0x03, sp), a
                                   1316 ;	user/RTC_pcf8563.c: 305: PCF_Write(0x0D, &mode, 1);				//CLKOUT_control
      0087A0 96               [ 1] 1317 	ldw	x, sp
      0087A1 1C 00 03         [ 2] 1318 	addw	x, #3
      0087A4 4B 01            [ 1] 1319 	push	#0x01
      0087A6 89               [ 2] 1320 	pushw	x
      0087A7 4B 0D            [ 1] 1321 	push	#0x0d
      0087A9 CD 81 15         [ 4] 1322 	call	_PCF_Write
      0087AC 5B 04            [ 2] 1323 	addw	sp, #4
      0087AE 81               [ 4] 1324 	ret
                                   1325 	.area CODE
                                   1326 	.area INITIALIZER
                                   1327 	.area CABS (ABS)
