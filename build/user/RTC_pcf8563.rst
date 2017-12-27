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
                                     12 	.globl _ExitCriticalSection_UserCallback
                                     13 	.globl _EnterCriticalSection_UserCallback
                                     14 	.globl _I2C_setup
                                     15 	.globl _I2C_ClearFlag
                                     16 	.globl _I2C_GetFlagStatus
                                     17 	.globl _I2C_CheckEvent
                                     18 	.globl _I2C_SendData
                                     19 	.globl _I2C_Send7bitAddress
                                     20 	.globl _I2C_ReceiveData
                                     21 	.globl _I2C_AcknowledgeConfig
                                     22 	.globl _I2C_GenerateSTOP
                                     23 	.globl _I2C_GenerateSTART
                                     24 	.globl _I2C_Cmd
                                     25 	.globl _I2C_Init
                                     26 	.globl _I2C_DeInit
                                     27 	.globl _CLK_GetClockFreq
                                     28 	.globl _timeout
                                     29 	.globl _PCF_Write
                                     30 	.globl _PCF_Read
                                     31 	.globl _PCF_getDateTime
                                     32 	.globl _PCF_Init
                                     33 	.globl _PCF_setDateTime
                                     34 	.globl _PCF_setAlarm
                                     35 	.globl _PCF_setTimer
                                     36 	.globl _PCF_getTimer
                                     37 	.globl _PCF_getAlarm
                                     38 	.globl _PCF_setClockOut
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DATA
                                     43 ;--------------------------------------------------------
                                     44 ; ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area INITIALIZED
      00001E                         47 _timeout::
      00001E                         48 	.ds 4
                                     49 ;--------------------------------------------------------
                                     50 ; absolute external ram data
                                     51 ;--------------------------------------------------------
                                     52 	.area DABS (ABS)
                                     53 ;--------------------------------------------------------
                                     54 ; global & static initialisations
                                     55 ;--------------------------------------------------------
                                     56 	.area HOME
                                     57 	.area GSINIT
                                     58 	.area GSFINAL
                                     59 	.area GSINIT
                                     60 ;--------------------------------------------------------
                                     61 ; Home
                                     62 ;--------------------------------------------------------
                                     63 	.area HOME
                                     64 	.area HOME
                                     65 ;--------------------------------------------------------
                                     66 ; code
                                     67 ;--------------------------------------------------------
                                     68 	.area CODE
                                     69 ;	user/RTC_pcf8563.c: 11: void I2C_setup(void)
                                     70 ;	-----------------------------------------
                                     71 ;	 function I2C_setup
                                     72 ;	-----------------------------------------
      0080A0                         73 _I2C_setup:
                                     74 ;	user/RTC_pcf8563.c: 14: I2C_DeInit();
      0080A0 CD 92 D7         [ 4]   75 	call	_I2C_DeInit
                                     76 ;	user/RTC_pcf8563.c: 15: Input_Clock = CLK_GetClockFreq()/1000000;
      0080A3 CD 91 03         [ 4]   77 	call	_CLK_GetClockFreq
      0080A6 4B 40            [ 1]   78 	push	#0x40
      0080A8 4B 42            [ 1]   79 	push	#0x42
      0080AA 4B 0F            [ 1]   80 	push	#0x0f
      0080AC 4B 00            [ 1]   81 	push	#0x00
      0080AE 89               [ 2]   82 	pushw	x
      0080AF 90 89            [ 2]   83 	pushw	y
      0080B1 CD 98 13         [ 4]   84 	call	__divulong
      0080B4 5B 08            [ 2]   85 	addw	sp, #8
      0080B6 9F               [ 1]   86 	ld	a, xl
                                     87 ;	user/RTC_pcf8563.c: 16: I2C_Cmd(ENABLE);
      0080B7 88               [ 1]   88 	push	a
      0080B8 4B 01            [ 1]   89 	push	#0x01
      0080BA CD 94 2A         [ 4]   90 	call	_I2C_Cmd
      0080BD 84               [ 1]   91 	pop	a
      0080BE 84               [ 1]   92 	pop	a
                                     93 ;	user/RTC_pcf8563.c: 17: I2C_Init(100000, PCF8563_WRITE_ADDR, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, Input_Clock);
      0080BF 88               [ 1]   94 	push	a
      0080C0 4B 00            [ 1]   95 	push	#0x00
      0080C2 4B 01            [ 1]   96 	push	#0x01
      0080C4 4B 00            [ 1]   97 	push	#0x00
      0080C6 4B A2            [ 1]   98 	push	#0xa2
      0080C8 4B 00            [ 1]   99 	push	#0x00
      0080CA 4B A0            [ 1]  100 	push	#0xa0
      0080CC 4B 86            [ 1]  101 	push	#0x86
      0080CE 4B 01            [ 1]  102 	push	#0x01
      0080D0 4B 00            [ 1]  103 	push	#0x00
      0080D2 CD 92 FC         [ 4]  104 	call	_I2C_Init
      0080D5 5B 0A            [ 2]  105 	addw	sp, #10
      0080D7 81               [ 4]  106 	ret
                                    107 ;	user/RTC_pcf8563.c: 20: void EnterCriticalSection_UserCallback(void)
                                    108 ;	-----------------------------------------
                                    109 ;	 function EnterCriticalSection_UserCallback
                                    110 ;	-----------------------------------------
      0080D8                        111 _EnterCriticalSection_UserCallback:
                                    112 ;	user/RTC_pcf8563.c: 22: disableInterrupts();  
      0080D8 9B               [ 1]  113 	sim
      0080D9 81               [ 4]  114 	ret
                                    115 ;	user/RTC_pcf8563.c: 25: void ExitCriticalSection_UserCallback(void)
                                    116 ;	-----------------------------------------
                                    117 ;	 function ExitCriticalSection_UserCallback
                                    118 ;	-----------------------------------------
      0080DA                        119 _ExitCriticalSection_UserCallback:
                                    120 ;	user/RTC_pcf8563.c: 27: enableInterrupts();
      0080DA 9A               [ 1]  121 	rim
      0080DB 81               [ 4]  122 	ret
                                    123 ;	user/RTC_pcf8563.c: 43: uint8_t PCF_Write(uint8_t addr, uint8_t *data, uint8_t count)
                                    124 ;	-----------------------------------------
                                    125 ;	 function PCF_Write
                                    126 ;	-----------------------------------------
      0080DC                        127 _PCF_Write:
      0080DC 52 25            [ 2]  128 	sub	sp, #37
                                    129 ;	user/RTC_pcf8563.c: 45: uint8_t res = 1;
      0080DE A6 01            [ 1]  130 	ld	a, #0x01
      0080E0 6B 01            [ 1]  131 	ld	(0x01, sp), a
                                    132 ;	user/RTC_pcf8563.c: 48: I2C_AcknowledgeConfig(I2C_ACK_CURR);
      0080E2 4B 01            [ 1]  133 	push	#0x01
      0080E4 CD 94 8A         [ 4]  134 	call	_I2C_AcknowledgeConfig
      0080E7 84               [ 1]  135 	pop	a
                                    136 ;	user/RTC_pcf8563.c: 49: timeout = 0x0FFF;
      0080E8 AE 0F FF         [ 2]  137 	ldw	x, #0x0fff
      0080EB 1F 04            [ 2]  138 	ldw	(0x04, sp), x
      0080ED 5F               [ 1]  139 	clrw	x
      0080EE 1F 02            [ 2]  140 	ldw	(0x02, sp), x
                                    141 ;	user/RTC_pcf8563.c: 51: while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY))
      0080F0                        142 00103$:
      0080F0 4B 02            [ 1]  143 	push	#0x02
      0080F2 4B 03            [ 1]  144 	push	#0x03
      0080F4 CD 95 81         [ 4]  145 	call	_I2C_GetFlagStatus
      0080F7 85               [ 2]  146 	popw	x
      0080F8 4D               [ 1]  147 	tnz	a
      0080F9 27 2F            [ 1]  148 	jreq	00105$
                                    149 ;	user/RTC_pcf8563.c: 53: if(!timeout--)
      0080FB 16 04            [ 2]  150 	ldw	y, (0x04, sp)
      0080FD 17 17            [ 2]  151 	ldw	(0x17, sp), y
      0080FF 16 02            [ 2]  152 	ldw	y, (0x02, sp)
      008101 17 15            [ 2]  153 	ldw	(0x15, sp), y
      008103 1E 04            [ 2]  154 	ldw	x, (0x04, sp)
      008105 1D 00 01         [ 2]  155 	subw	x, #0x0001
      008108 1F 24            [ 2]  156 	ldw	(0x24, sp), x
      00810A 7B 03            [ 1]  157 	ld	a, (0x03, sp)
      00810C A2 00            [ 1]  158 	sbc	a, #0x00
      00810E 6B 23            [ 1]  159 	ld	(0x23, sp), a
      008110 7B 02            [ 1]  160 	ld	a, (0x02, sp)
      008112 A2 00            [ 1]  161 	sbc	a, #0x00
      008114 6B 22            [ 1]  162 	ld	(0x22, sp), a
      008116 16 24            [ 2]  163 	ldw	y, (0x24, sp)
      008118 17 04            [ 2]  164 	ldw	(0x04, sp), y
      00811A 16 22            [ 2]  165 	ldw	y, (0x22, sp)
      00811C 17 02            [ 2]  166 	ldw	(0x02, sp), y
      00811E 1E 17            [ 2]  167 	ldw	x, (0x17, sp)
      008120 26 CE            [ 1]  168 	jrne	00103$
      008122 1E 15            [ 2]  169 	ldw	x, (0x15, sp)
      008124 26 CA            [ 1]  170 	jrne	00103$
                                    171 ;	user/RTC_pcf8563.c: 56: return res;
      008126 4F               [ 1]  172 	clr	a
      008127 CC 82 6E         [ 2]  173 	jp	00133$
      00812A                        174 00105$:
                                    175 ;	user/RTC_pcf8563.c: 60: I2C_GenerateSTART(ENABLE);
      00812A 4B 01            [ 1]  176 	push	#0x01
      00812C CD 94 4C         [ 4]  177 	call	_I2C_GenerateSTART
      00812F 84               [ 1]  178 	pop	a
                                    179 ;	user/RTC_pcf8563.c: 62: timeout = 0x0FFF;
      008130 AE 0F FF         [ 2]  180 	ldw	x, #0x0fff
      008133 1F 04            [ 2]  181 	ldw	(0x04, sp), x
      008135 5F               [ 1]  182 	clrw	x
      008136 1F 02            [ 2]  183 	ldw	(0x02, sp), x
                                    184 ;	user/RTC_pcf8563.c: 64: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
      008138                        185 00108$:
      008138 4B 01            [ 1]  186 	push	#0x01
      00813A 4B 03            [ 1]  187 	push	#0x03
      00813C CD 95 06         [ 4]  188 	call	_I2C_CheckEvent
      00813F 85               [ 2]  189 	popw	x
      008140 6B 21            [ 1]  190 	ld	(0x21, sp), a
      008142 0D 21            [ 1]  191 	tnz	(0x21, sp)
      008144 26 29            [ 1]  192 	jrne	00110$
                                    193 ;	user/RTC_pcf8563.c: 66: if(!timeout--) 
      008146 16 04            [ 2]  194 	ldw	y, (0x04, sp)
      008148 17 11            [ 2]  195 	ldw	(0x11, sp), y
      00814A 16 02            [ 2]  196 	ldw	y, (0x02, sp)
      00814C 17 0F            [ 2]  197 	ldw	(0x0f, sp), y
      00814E 16 04            [ 2]  198 	ldw	y, (0x04, sp)
      008150 72 A2 00 01      [ 2]  199 	subw	y, #0x0001
      008154 7B 03            [ 1]  200 	ld	a, (0x03, sp)
      008156 A2 00            [ 1]  201 	sbc	a, #0x00
      008158 97               [ 1]  202 	ld	xl, a
      008159 7B 02            [ 1]  203 	ld	a, (0x02, sp)
      00815B A2 00            [ 1]  204 	sbc	a, #0x00
      00815D 95               [ 1]  205 	ld	xh, a
      00815E 17 04            [ 2]  206 	ldw	(0x04, sp), y
      008160 1F 02            [ 2]  207 	ldw	(0x02, sp), x
      008162 1E 11            [ 2]  208 	ldw	x, (0x11, sp)
      008164 26 D2            [ 1]  209 	jrne	00108$
      008166 1E 0F            [ 2]  210 	ldw	x, (0x0f, sp)
      008168 26 CE            [ 1]  211 	jrne	00108$
                                    212 ;	user/RTC_pcf8563.c: 68: res = 0;
      00816A 0F 01            [ 1]  213 	clr	(0x01, sp)
                                    214 ;	user/RTC_pcf8563.c: 69: goto stop;
      00816C CC 82 66         [ 2]  215 	jp	00132$
      00816F                        216 00110$:
                                    217 ;	user/RTC_pcf8563.c: 73: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
      00816F 4B 00            [ 1]  218 	push	#0x00
      008171 4B A2            [ 1]  219 	push	#0xa2
      008173 CD 94 F0         [ 4]  220 	call	_I2C_Send7bitAddress
      008176 85               [ 2]  221 	popw	x
                                    222 ;	user/RTC_pcf8563.c: 74: timeout = 0x0FFF;
      008177 AE 0F FF         [ 2]  223 	ldw	x, #0x0fff
      00817A 1F 04            [ 2]  224 	ldw	(0x04, sp), x
      00817C 5F               [ 1]  225 	clrw	x
      00817D 1F 02            [ 2]  226 	ldw	(0x02, sp), x
                                    227 ;	user/RTC_pcf8563.c: 76: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
      00817F                        228 00116$:
      00817F 4B 82            [ 1]  229 	push	#0x82
      008181 4B 07            [ 1]  230 	push	#0x07
      008183 CD 95 06         [ 4]  231 	call	_I2C_CheckEvent
      008186 85               [ 2]  232 	popw	x
      008187 4D               [ 1]  233 	tnz	a
      008188 26 42            [ 1]  234 	jrne	00118$
                                    235 ;	user/RTC_pcf8563.c: 78: if(!timeout--)
      00818A 16 02            [ 2]  236 	ldw	y, (0x02, sp)
      00818C 17 19            [ 2]  237 	ldw	(0x19, sp), y
      00818E 1E 04            [ 2]  238 	ldw	x, (0x04, sp)
      008190 16 04            [ 2]  239 	ldw	y, (0x04, sp)
      008192 72 A2 00 01      [ 2]  240 	subw	y, #0x0001
      008196 7B 03            [ 1]  241 	ld	a, (0x03, sp)
      008198 A2 00            [ 1]  242 	sbc	a, #0x00
      00819A 6B 1E            [ 1]  243 	ld	(0x1e, sp), a
      00819C 7B 02            [ 1]  244 	ld	a, (0x02, sp)
      00819E A2 00            [ 1]  245 	sbc	a, #0x00
      0081A0 17 04            [ 2]  246 	ldw	(0x04, sp), y
      0081A2 6B 02            [ 1]  247 	ld	(0x02, sp), a
      0081A4 7B 1E            [ 1]  248 	ld	a, (0x1e, sp)
      0081A6 6B 03            [ 1]  249 	ld	(0x03, sp), a
      0081A8 5D               [ 2]  250 	tnzw	x
      0081A9 26 09            [ 1]  251 	jrne	00114$
      0081AB 1E 19            [ 2]  252 	ldw	x, (0x19, sp)
      0081AD 26 05            [ 1]  253 	jrne	00114$
                                    254 ;	user/RTC_pcf8563.c: 80: res = 0;
      0081AF 0F 01            [ 1]  255 	clr	(0x01, sp)
                                    256 ;	user/RTC_pcf8563.c: 81: goto stop;
      0081B1 CC 82 66         [ 2]  257 	jp	00132$
      0081B4                        258 00114$:
                                    259 ;	user/RTC_pcf8563.c: 83: else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
      0081B4 4B 04            [ 1]  260 	push	#0x04
      0081B6 4B 02            [ 1]  261 	push	#0x02
      0081B8 CD 95 81         [ 4]  262 	call	_I2C_GetFlagStatus
      0081BB 85               [ 2]  263 	popw	x
      0081BC 4D               [ 1]  264 	tnz	a
      0081BD 27 C0            [ 1]  265 	jreq	00116$
                                    266 ;	user/RTC_pcf8563.c: 85: I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
      0081BF 4B 04            [ 1]  267 	push	#0x04
      0081C1 4B 02            [ 1]  268 	push	#0x02
      0081C3 CD 95 B8         [ 4]  269 	call	_I2C_ClearFlag
      0081C6 85               [ 2]  270 	popw	x
                                    271 ;	user/RTC_pcf8563.c: 86: res = 0;
      0081C7 0F 01            [ 1]  272 	clr	(0x01, sp)
                                    273 ;	user/RTC_pcf8563.c: 87: goto stop;
      0081C9 CC 82 66         [ 2]  274 	jp	00132$
      0081CC                        275 00118$:
                                    276 ;	user/RTC_pcf8563.c: 91: I2C_SendData(addr);
      0081CC 7B 28            [ 1]  277 	ld	a, (0x28, sp)
      0081CE 88               [ 1]  278 	push	a
      0081CF CD 94 FF         [ 4]  279 	call	_I2C_SendData
      0081D2 84               [ 1]  280 	pop	a
                                    281 ;	user/RTC_pcf8563.c: 92: timeout = 0x0FFF;
      0081D3 AE 0F FF         [ 2]  282 	ldw	x, #0x0fff
      0081D6 1F 04            [ 2]  283 	ldw	(0x04, sp), x
      0081D8 5F               [ 1]  284 	clrw	x
      0081D9 1F 02            [ 2]  285 	ldw	(0x02, sp), x
                                    286 ;	user/RTC_pcf8563.c: 94: while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
      0081DB                        287 00121$:
      0081DB 4B 84            [ 1]  288 	push	#0x84
      0081DD 4B 07            [ 1]  289 	push	#0x07
      0081DF CD 95 06         [ 4]  290 	call	_I2C_CheckEvent
      0081E2 85               [ 2]  291 	popw	x
      0081E3 4D               [ 1]  292 	tnz	a
      0081E4 26 28            [ 1]  293 	jrne	00152$
                                    294 ;	user/RTC_pcf8563.c: 96: if(!timeout--)
      0081E6 16 04            [ 2]  295 	ldw	y, (0x04, sp)
      0081E8 17 0C            [ 2]  296 	ldw	(0x0c, sp), y
      0081EA 16 02            [ 2]  297 	ldw	y, (0x02, sp)
      0081EC 17 0A            [ 2]  298 	ldw	(0x0a, sp), y
      0081EE 16 04            [ 2]  299 	ldw	y, (0x04, sp)
      0081F0 72 A2 00 01      [ 2]  300 	subw	y, #0x0001
      0081F4 7B 03            [ 1]  301 	ld	a, (0x03, sp)
      0081F6 A2 00            [ 1]  302 	sbc	a, #0x00
      0081F8 97               [ 1]  303 	ld	xl, a
      0081F9 7B 02            [ 1]  304 	ld	a, (0x02, sp)
      0081FB A2 00            [ 1]  305 	sbc	a, #0x00
      0081FD 95               [ 1]  306 	ld	xh, a
      0081FE 17 04            [ 2]  307 	ldw	(0x04, sp), y
      008200 1F 02            [ 2]  308 	ldw	(0x02, sp), x
      008202 1E 0C            [ 2]  309 	ldw	x, (0x0c, sp)
      008204 26 D5            [ 1]  310 	jrne	00121$
      008206 1E 0A            [ 2]  311 	ldw	x, (0x0a, sp)
      008208 26 D1            [ 1]  312 	jrne	00121$
                                    313 ;	user/RTC_pcf8563.c: 98: res = 0;
      00820A 0F 01            [ 1]  314 	clr	(0x01, sp)
                                    315 ;	user/RTC_pcf8563.c: 99: goto stop;
      00820C 20 58            [ 2]  316 	jra	00132$
                                    317 ;	user/RTC_pcf8563.c: 103: while(count)
      00820E                        318 00152$:
      00820E 16 29            [ 2]  319 	ldw	y, (0x29, sp)
      008210 17 13            [ 2]  320 	ldw	(0x13, sp), y
      008212 7B 2B            [ 1]  321 	ld	a, (0x2b, sp)
      008214 6B 0E            [ 1]  322 	ld	(0x0e, sp), a
      008216                        323 00129$:
      008216 0D 0E            [ 1]  324 	tnz	(0x0e, sp)
      008218 27 4C            [ 1]  325 	jreq	00132$
                                    326 ;	user/RTC_pcf8563.c: 105: I2C_SendData(*data);
      00821A 1E 13            [ 2]  327 	ldw	x, (0x13, sp)
      00821C F6               [ 1]  328 	ld	a, (x)
      00821D 88               [ 1]  329 	push	a
      00821E CD 94 FF         [ 4]  330 	call	_I2C_SendData
      008221 84               [ 1]  331 	pop	a
                                    332 ;	user/RTC_pcf8563.c: 106: timeout = 0x0FFF;
      008222 AE 0F FF         [ 2]  333 	ldw	x, #0x0fff
      008225 1F 04            [ 2]  334 	ldw	(0x04, sp), x
      008227 5F               [ 1]  335 	clrw	x
      008228 1F 02            [ 2]  336 	ldw	(0x02, sp), x
                                    337 ;	user/RTC_pcf8563.c: 108: while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
      00822A                        338 00126$:
      00822A 4B 84            [ 1]  339 	push	#0x84
      00822C 4B 07            [ 1]  340 	push	#0x07
      00822E CD 95 06         [ 4]  341 	call	_I2C_CheckEvent
      008231 85               [ 2]  342 	popw	x
      008232 4D               [ 1]  343 	tnz	a
      008233 26 28            [ 1]  344 	jrne	00128$
                                    345 ;	user/RTC_pcf8563.c: 110: if(!timeout--)
      008235 16 04            [ 2]  346 	ldw	y, (0x04, sp)
      008237 17 08            [ 2]  347 	ldw	(0x08, sp), y
      008239 16 02            [ 2]  348 	ldw	y, (0x02, sp)
      00823B 17 06            [ 2]  349 	ldw	(0x06, sp), y
      00823D 16 04            [ 2]  350 	ldw	y, (0x04, sp)
      00823F 72 A2 00 01      [ 2]  351 	subw	y, #0x0001
      008243 7B 03            [ 1]  352 	ld	a, (0x03, sp)
      008245 A2 00            [ 1]  353 	sbc	a, #0x00
      008247 97               [ 1]  354 	ld	xl, a
      008248 7B 02            [ 1]  355 	ld	a, (0x02, sp)
      00824A A2 00            [ 1]  356 	sbc	a, #0x00
      00824C 95               [ 1]  357 	ld	xh, a
      00824D 17 04            [ 2]  358 	ldw	(0x04, sp), y
      00824F 1F 02            [ 2]  359 	ldw	(0x02, sp), x
      008251 1E 08            [ 2]  360 	ldw	x, (0x08, sp)
      008253 26 D5            [ 1]  361 	jrne	00126$
      008255 1E 06            [ 2]  362 	ldw	x, (0x06, sp)
      008257 26 D1            [ 1]  363 	jrne	00126$
                                    364 ;	user/RTC_pcf8563.c: 112: res = 0;
      008259 0F 01            [ 1]  365 	clr	(0x01, sp)
                                    366 ;	user/RTC_pcf8563.c: 113: goto stop;
      00825B 20 09            [ 2]  367 	jra	00132$
      00825D                        368 00128$:
                                    369 ;	user/RTC_pcf8563.c: 116: data++;
      00825D 1E 13            [ 2]  370 	ldw	x, (0x13, sp)
      00825F 5C               [ 2]  371 	incw	x
      008260 1F 13            [ 2]  372 	ldw	(0x13, sp), x
                                    373 ;	user/RTC_pcf8563.c: 117: count--;
      008262 0A 0E            [ 1]  374 	dec	(0x0e, sp)
      008264 20 B0            [ 2]  375 	jra	00129$
                                    376 ;	user/RTC_pcf8563.c: 120: stop: I2C_GenerateSTOP(ENABLE);
      008266                        377 00132$:
      008266 4B 01            [ 1]  378 	push	#0x01
      008268 CD 94 5A         [ 4]  379 	call	_I2C_GenerateSTOP
      00826B 84               [ 1]  380 	pop	a
                                    381 ;	user/RTC_pcf8563.c: 121: return res;
      00826C 7B 01            [ 1]  382 	ld	a, (0x01, sp)
      00826E                        383 00133$:
      00826E 5B 25            [ 2]  384 	addw	sp, #37
      008270 81               [ 4]  385 	ret
                                    386 ;	user/RTC_pcf8563.c: 124: uint8_t PCF_Read(uint8_t addr, uint8_t *data, uint8_t count)
                                    387 ;	-----------------------------------------
                                    388 ;	 function PCF_Read
                                    389 ;	-----------------------------------------
      008271                        390 _PCF_Read:
      008271 52 25            [ 2]  391 	sub	sp, #37
                                    392 ;	user/RTC_pcf8563.c: 126: uint8_t res = 1;
      008273 A6 01            [ 1]  393 	ld	a, #0x01
      008275 6B 01            [ 1]  394 	ld	(0x01, sp), a
                                    395 ;	user/RTC_pcf8563.c: 128: timeout = 0x0FFF;
      008277 AE 0F FF         [ 2]  396 	ldw	x, #0x0fff
      00827A 1F 04            [ 2]  397 	ldw	(0x04, sp), x
      00827C 5F               [ 1]  398 	clrw	x
      00827D 1F 02            [ 2]  399 	ldw	(0x02, sp), x
                                    400 ;	user/RTC_pcf8563.c: 130: while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY))
      00827F                        401 00103$:
      00827F 4B 02            [ 1]  402 	push	#0x02
      008281 4B 03            [ 1]  403 	push	#0x03
      008283 CD 95 81         [ 4]  404 	call	_I2C_GetFlagStatus
      008286 85               [ 2]  405 	popw	x
      008287 4D               [ 1]  406 	tnz	a
      008288 27 2F            [ 1]  407 	jreq	00105$
                                    408 ;	user/RTC_pcf8563.c: 132: if(!timeout--)
      00828A 16 04            [ 2]  409 	ldw	y, (0x04, sp)
      00828C 17 09            [ 2]  410 	ldw	(0x09, sp), y
      00828E 16 02            [ 2]  411 	ldw	y, (0x02, sp)
      008290 17 07            [ 2]  412 	ldw	(0x07, sp), y
      008292 1E 04            [ 2]  413 	ldw	x, (0x04, sp)
      008294 1D 00 01         [ 2]  414 	subw	x, #0x0001
      008297 1F 0D            [ 2]  415 	ldw	(0x0d, sp), x
      008299 7B 03            [ 1]  416 	ld	a, (0x03, sp)
      00829B A2 00            [ 1]  417 	sbc	a, #0x00
      00829D 6B 0C            [ 1]  418 	ld	(0x0c, sp), a
      00829F 7B 02            [ 1]  419 	ld	a, (0x02, sp)
      0082A1 A2 00            [ 1]  420 	sbc	a, #0x00
      0082A3 6B 0B            [ 1]  421 	ld	(0x0b, sp), a
      0082A5 16 0D            [ 2]  422 	ldw	y, (0x0d, sp)
      0082A7 17 04            [ 2]  423 	ldw	(0x04, sp), y
      0082A9 16 0B            [ 2]  424 	ldw	y, (0x0b, sp)
      0082AB 17 02            [ 2]  425 	ldw	(0x02, sp), y
      0082AD 1E 09            [ 2]  426 	ldw	x, (0x09, sp)
      0082AF 26 CE            [ 1]  427 	jrne	00103$
      0082B1 1E 07            [ 2]  428 	ldw	x, (0x07, sp)
      0082B3 26 CA            [ 1]  429 	jrne	00103$
                                    430 ;	user/RTC_pcf8563.c: 135: return res;
      0082B5 4F               [ 1]  431 	clr	a
      0082B6 CC 84 EA         [ 2]  432 	jp	00155$
      0082B9                        433 00105$:
                                    434 ;	user/RTC_pcf8563.c: 139: I2C_GenerateSTART(ENABLE);
      0082B9 4B 01            [ 1]  435 	push	#0x01
      0082BB CD 94 4C         [ 4]  436 	call	_I2C_GenerateSTART
      0082BE 84               [ 1]  437 	pop	a
                                    438 ;	user/RTC_pcf8563.c: 140: timeout = 0x0FFF;
      0082BF AE 0F FF         [ 2]  439 	ldw	x, #0x0fff
      0082C2 1F 04            [ 2]  440 	ldw	(0x04, sp), x
      0082C4 5F               [ 1]  441 	clrw	x
      0082C5 1F 02            [ 2]  442 	ldw	(0x02, sp), x
                                    443 ;	user/RTC_pcf8563.c: 142: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
      0082C7                        444 00108$:
      0082C7 4B 01            [ 1]  445 	push	#0x01
      0082C9 4B 03            [ 1]  446 	push	#0x03
      0082CB CD 95 06         [ 4]  447 	call	_I2C_CheckEvent
      0082CE 85               [ 2]  448 	popw	x
      0082CF 6B 06            [ 1]  449 	ld	(0x06, sp), a
      0082D1 0D 06            [ 1]  450 	tnz	(0x06, sp)
      0082D3 26 29            [ 1]  451 	jrne	00110$
                                    452 ;	user/RTC_pcf8563.c: 144: if(!timeout--)
      0082D5 16 04            [ 2]  453 	ldw	y, (0x04, sp)
      0082D7 17 1A            [ 2]  454 	ldw	(0x1a, sp), y
      0082D9 16 02            [ 2]  455 	ldw	y, (0x02, sp)
      0082DB 17 18            [ 2]  456 	ldw	(0x18, sp), y
      0082DD 16 04            [ 2]  457 	ldw	y, (0x04, sp)
      0082DF 72 A2 00 01      [ 2]  458 	subw	y, #0x0001
      0082E3 7B 03            [ 1]  459 	ld	a, (0x03, sp)
      0082E5 A2 00            [ 1]  460 	sbc	a, #0x00
      0082E7 97               [ 1]  461 	ld	xl, a
      0082E8 7B 02            [ 1]  462 	ld	a, (0x02, sp)
      0082EA A2 00            [ 1]  463 	sbc	a, #0x00
      0082EC 95               [ 1]  464 	ld	xh, a
      0082ED 17 04            [ 2]  465 	ldw	(0x04, sp), y
      0082EF 1F 02            [ 2]  466 	ldw	(0x02, sp), x
      0082F1 1E 1A            [ 2]  467 	ldw	x, (0x1a, sp)
      0082F3 26 D2            [ 1]  468 	jrne	00108$
      0082F5 1E 18            [ 2]  469 	ldw	x, (0x18, sp)
      0082F7 26 CE            [ 1]  470 	jrne	00108$
                                    471 ;	user/RTC_pcf8563.c: 146: res = 0;
      0082F9 0F 01            [ 1]  472 	clr	(0x01, sp)
                                    473 ;	user/RTC_pcf8563.c: 147: goto stop;
      0082FB CC 84 E2         [ 2]  474 	jp	00154$
      0082FE                        475 00110$:
                                    476 ;	user/RTC_pcf8563.c: 151: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
      0082FE 4B 00            [ 1]  477 	push	#0x00
      008300 4B A2            [ 1]  478 	push	#0xa2
      008302 CD 94 F0         [ 4]  479 	call	_I2C_Send7bitAddress
      008305 85               [ 2]  480 	popw	x
                                    481 ;	user/RTC_pcf8563.c: 152: timeout = 0x0FFF;
      008306 AE 0F FF         [ 2]  482 	ldw	x, #0x0fff
      008309 1F 04            [ 2]  483 	ldw	(0x04, sp), x
      00830B 5F               [ 1]  484 	clrw	x
      00830C 1F 02            [ 2]  485 	ldw	(0x02, sp), x
                                    486 ;	user/RTC_pcf8563.c: 153: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
      00830E                        487 00116$:
      00830E 4B 82            [ 1]  488 	push	#0x82
      008310 4B 07            [ 1]  489 	push	#0x07
      008312 CD 95 06         [ 4]  490 	call	_I2C_CheckEvent
      008315 85               [ 2]  491 	popw	x
      008316 4D               [ 1]  492 	tnz	a
      008317 26 42            [ 1]  493 	jrne	00118$
                                    494 ;	user/RTC_pcf8563.c: 155: if(!timeout--)
      008319 16 02            [ 2]  495 	ldw	y, (0x02, sp)
      00831B 17 22            [ 2]  496 	ldw	(0x22, sp), y
      00831D 1E 04            [ 2]  497 	ldw	x, (0x04, sp)
      00831F 16 04            [ 2]  498 	ldw	y, (0x04, sp)
      008321 72 A2 00 01      [ 2]  499 	subw	y, #0x0001
      008325 7B 03            [ 1]  500 	ld	a, (0x03, sp)
      008327 A2 00            [ 1]  501 	sbc	a, #0x00
      008329 6B 1F            [ 1]  502 	ld	(0x1f, sp), a
      00832B 7B 02            [ 1]  503 	ld	a, (0x02, sp)
      00832D A2 00            [ 1]  504 	sbc	a, #0x00
      00832F 17 04            [ 2]  505 	ldw	(0x04, sp), y
      008331 6B 02            [ 1]  506 	ld	(0x02, sp), a
      008333 7B 1F            [ 1]  507 	ld	a, (0x1f, sp)
      008335 6B 03            [ 1]  508 	ld	(0x03, sp), a
      008337 5D               [ 2]  509 	tnzw	x
      008338 26 09            [ 1]  510 	jrne	00114$
      00833A 1E 22            [ 2]  511 	ldw	x, (0x22, sp)
      00833C 26 05            [ 1]  512 	jrne	00114$
                                    513 ;	user/RTC_pcf8563.c: 157: res = 0;
      00833E 0F 01            [ 1]  514 	clr	(0x01, sp)
                                    515 ;	user/RTC_pcf8563.c: 158: goto stop;
      008340 CC 84 E2         [ 2]  516 	jp	00154$
      008343                        517 00114$:
                                    518 ;	user/RTC_pcf8563.c: 160: else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
      008343 4B 04            [ 1]  519 	push	#0x04
      008345 4B 02            [ 1]  520 	push	#0x02
      008347 CD 95 81         [ 4]  521 	call	_I2C_GetFlagStatus
      00834A 85               [ 2]  522 	popw	x
      00834B 4D               [ 1]  523 	tnz	a
      00834C 27 C0            [ 1]  524 	jreq	00116$
                                    525 ;	user/RTC_pcf8563.c: 162: I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
      00834E 4B 04            [ 1]  526 	push	#0x04
      008350 4B 02            [ 1]  527 	push	#0x02
      008352 CD 95 B8         [ 4]  528 	call	_I2C_ClearFlag
      008355 85               [ 2]  529 	popw	x
                                    530 ;	user/RTC_pcf8563.c: 163: res = 0;
      008356 0F 01            [ 1]  531 	clr	(0x01, sp)
                                    532 ;	user/RTC_pcf8563.c: 164: goto stop;
      008358 CC 84 E2         [ 2]  533 	jp	00154$
      00835B                        534 00118$:
                                    535 ;	user/RTC_pcf8563.c: 168: I2C_SendData(addr);
      00835B 7B 28            [ 1]  536 	ld	a, (0x28, sp)
      00835D 88               [ 1]  537 	push	a
      00835E CD 94 FF         [ 4]  538 	call	_I2C_SendData
      008361 84               [ 1]  539 	pop	a
                                    540 ;	user/RTC_pcf8563.c: 169: timeout = 0x0FFF;
      008362 AE 0F FF         [ 2]  541 	ldw	x, #0x0fff
      008365 1F 04            [ 2]  542 	ldw	(0x04, sp), x
      008367 5F               [ 1]  543 	clrw	x
      008368 1F 02            [ 2]  544 	ldw	(0x02, sp), x
                                    545 ;	user/RTC_pcf8563.c: 170: while(!I2C_CheckEvent(I2C_FLAG_TRANSFERFINISHED))
      00836A                        546 00121$:
      00836A 4B 04            [ 1]  547 	push	#0x04
      00836C 4B 01            [ 1]  548 	push	#0x01
      00836E CD 95 06         [ 4]  549 	call	_I2C_CheckEvent
      008371 85               [ 2]  550 	popw	x
      008372 4D               [ 1]  551 	tnz	a
      008373 26 29            [ 1]  552 	jrne	00123$
                                    553 ;	user/RTC_pcf8563.c: 172: if(!timeout--)
      008375 16 04            [ 2]  554 	ldw	y, (0x04, sp)
      008377 17 11            [ 2]  555 	ldw	(0x11, sp), y
      008379 16 02            [ 2]  556 	ldw	y, (0x02, sp)
      00837B 17 0F            [ 2]  557 	ldw	(0x0f, sp), y
      00837D 16 04            [ 2]  558 	ldw	y, (0x04, sp)
      00837F 72 A2 00 01      [ 2]  559 	subw	y, #0x0001
      008383 7B 03            [ 1]  560 	ld	a, (0x03, sp)
      008385 A2 00            [ 1]  561 	sbc	a, #0x00
      008387 97               [ 1]  562 	ld	xl, a
      008388 7B 02            [ 1]  563 	ld	a, (0x02, sp)
      00838A A2 00            [ 1]  564 	sbc	a, #0x00
      00838C 95               [ 1]  565 	ld	xh, a
      00838D 17 04            [ 2]  566 	ldw	(0x04, sp), y
      00838F 1F 02            [ 2]  567 	ldw	(0x02, sp), x
      008391 1E 11            [ 2]  568 	ldw	x, (0x11, sp)
      008393 26 D5            [ 1]  569 	jrne	00121$
      008395 1E 0F            [ 2]  570 	ldw	x, (0x0f, sp)
      008397 26 D1            [ 1]  571 	jrne	00121$
                                    572 ;	user/RTC_pcf8563.c: 174: res = 0;
      008399 0F 01            [ 1]  573 	clr	(0x01, sp)
                                    574 ;	user/RTC_pcf8563.c: 175: goto stop;
      00839B CC 84 E2         [ 2]  575 	jp	00154$
      00839E                        576 00123$:
                                    577 ;	user/RTC_pcf8563.c: 180: I2C_GenerateSTART(ENABLE);
      00839E 4B 01            [ 1]  578 	push	#0x01
      0083A0 CD 94 4C         [ 4]  579 	call	_I2C_GenerateSTART
      0083A3 84               [ 1]  580 	pop	a
                                    581 ;	user/RTC_pcf8563.c: 181: timeout = 0x0FFF;
      0083A4 AE 0F FF         [ 2]  582 	ldw	x, #0x0fff
      0083A7 1F 04            [ 2]  583 	ldw	(0x04, sp), x
      0083A9 5F               [ 1]  584 	clrw	x
      0083AA 1F 02            [ 2]  585 	ldw	(0x02, sp), x
                                    586 ;	user/RTC_pcf8563.c: 182: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT))
      0083AC                        587 00126$:
      0083AC 4B 01            [ 1]  588 	push	#0x01
      0083AE 4B 03            [ 1]  589 	push	#0x03
      0083B0 CD 95 06         [ 4]  590 	call	_I2C_CheckEvent
      0083B3 85               [ 2]  591 	popw	x
      0083B4 4D               [ 1]  592 	tnz	a
      0083B5 26 29            [ 1]  593 	jrne	00128$
                                    594 ;	user/RTC_pcf8563.c: 184: if(!timeout--)
      0083B7 16 04            [ 2]  595 	ldw	y, (0x04, sp)
      0083B9 17 16            [ 2]  596 	ldw	(0x16, sp), y
      0083BB 16 02            [ 2]  597 	ldw	y, (0x02, sp)
      0083BD 17 14            [ 2]  598 	ldw	(0x14, sp), y
      0083BF 16 04            [ 2]  599 	ldw	y, (0x04, sp)
      0083C1 72 A2 00 01      [ 2]  600 	subw	y, #0x0001
      0083C5 7B 03            [ 1]  601 	ld	a, (0x03, sp)
      0083C7 A2 00            [ 1]  602 	sbc	a, #0x00
      0083C9 97               [ 1]  603 	ld	xl, a
      0083CA 7B 02            [ 1]  604 	ld	a, (0x02, sp)
      0083CC A2 00            [ 1]  605 	sbc	a, #0x00
      0083CE 95               [ 1]  606 	ld	xh, a
      0083CF 17 04            [ 2]  607 	ldw	(0x04, sp), y
      0083D1 1F 02            [ 2]  608 	ldw	(0x02, sp), x
      0083D3 1E 16            [ 2]  609 	ldw	x, (0x16, sp)
      0083D5 26 D5            [ 1]  610 	jrne	00126$
      0083D7 1E 14            [ 2]  611 	ldw	x, (0x14, sp)
      0083D9 26 D1            [ 1]  612 	jrne	00126$
                                    613 ;	user/RTC_pcf8563.c: 186: res = 0;
      0083DB 0F 01            [ 1]  614 	clr	(0x01, sp)
                                    615 ;	user/RTC_pcf8563.c: 187: goto stop;
      0083DD CC 84 E2         [ 2]  616 	jp	00154$
      0083E0                        617 00128$:
                                    618 ;	user/RTC_pcf8563.c: 191: I2C_Send7bitAddress(PCF8563_READ_ADDR, I2C_DIRECTION_RX);
      0083E0 4B 01            [ 1]  619 	push	#0x01
      0083E2 4B A3            [ 1]  620 	push	#0xa3
      0083E4 CD 94 F0         [ 4]  621 	call	_I2C_Send7bitAddress
      0083E7 85               [ 2]  622 	popw	x
                                    623 ;	user/RTC_pcf8563.c: 192: timeout = 0x0FFF;
      0083E8 AE 0F FF         [ 2]  624 	ldw	x, #0x0fff
      0083EB 1F 04            [ 2]  625 	ldw	(0x04, sp), x
      0083ED 5F               [ 1]  626 	clrw	x
      0083EE 1F 02            [ 2]  627 	ldw	(0x02, sp), x
                                    628 ;	user/RTC_pcf8563.c: 193: while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
      0083F0                        629 00134$:
      0083F0 4B 02            [ 1]  630 	push	#0x02
      0083F2 4B 03            [ 1]  631 	push	#0x03
      0083F4 CD 95 06         [ 4]  632 	call	_I2C_CheckEvent
      0083F7 85               [ 2]  633 	popw	x
      0083F8 4D               [ 1]  634 	tnz	a
      0083F9 26 25            [ 1]  635 	jrne	00185$
                                    636 ;	user/RTC_pcf8563.c: 195: if(!timeout)
      0083FB 1E 04            [ 2]  637 	ldw	x, (0x04, sp)
      0083FD 26 09            [ 1]  638 	jrne	00132$
      0083FF 1E 02            [ 2]  639 	ldw	x, (0x02, sp)
      008401 26 05            [ 1]  640 	jrne	00132$
                                    641 ;	user/RTC_pcf8563.c: 197: res = 0;
      008403 0F 01            [ 1]  642 	clr	(0x01, sp)
                                    643 ;	user/RTC_pcf8563.c: 198: goto stop;
      008405 CC 84 E2         [ 2]  644 	jp	00154$
      008408                        645 00132$:
                                    646 ;	user/RTC_pcf8563.c: 200: else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
      008408 4B 04            [ 1]  647 	push	#0x04
      00840A 4B 02            [ 1]  648 	push	#0x02
      00840C CD 95 81         [ 4]  649 	call	_I2C_GetFlagStatus
      00840F 85               [ 2]  650 	popw	x
      008410 4D               [ 1]  651 	tnz	a
      008411 27 DD            [ 1]  652 	jreq	00134$
                                    653 ;	user/RTC_pcf8563.c: 202: I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
      008413 4B 04            [ 1]  654 	push	#0x04
      008415 4B 02            [ 1]  655 	push	#0x02
      008417 CD 95 B8         [ 4]  656 	call	_I2C_ClearFlag
      00841A 85               [ 2]  657 	popw	x
                                    658 ;	user/RTC_pcf8563.c: 203: res = 0;
      00841B 0F 01            [ 1]  659 	clr	(0x01, sp)
                                    660 ;	user/RTC_pcf8563.c: 204: goto stop;
      00841D CC 84 E2         [ 2]  661 	jp	00154$
                                    662 ;	user/RTC_pcf8563.c: 207: while(count)
      008420                        663 00185$:
      008420 16 29            [ 2]  664 	ldw	y, (0x29, sp)
      008422 17 1C            [ 2]  665 	ldw	(0x1c, sp), y
      008424 7B 2B            [ 1]  666 	ld	a, (0x2b, sp)
      008426 6B 13            [ 1]  667 	ld	(0x13, sp), a
      008428                        668 00151$:
      008428 0D 13            [ 1]  669 	tnz	(0x13, sp)
      00842A 26 03            [ 1]  670 	jrne	00294$
      00842C CC 84 E2         [ 2]  671 	jp	00154$
      00842F                        672 00294$:
                                    673 ;	user/RTC_pcf8563.c: 209: timeout = 0x0FFF;
      00842F AE 0F FF         [ 2]  674 	ldw	x, #0x0fff
      008432 1F 04            [ 2]  675 	ldw	(0x04, sp), x
      008434 5F               [ 1]  676 	clrw	x
      008435 1F 02            [ 2]  677 	ldw	(0x02, sp), x
                                    678 ;	user/RTC_pcf8563.c: 210: while(--timeout && I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);
      008437                        679 00138$:
      008437 16 04            [ 2]  680 	ldw	y, (0x04, sp)
      008439 72 A2 00 01      [ 2]  681 	subw	y, #0x0001
      00843D 7B 03            [ 1]  682 	ld	a, (0x03, sp)
      00843F A2 00            [ 1]  683 	sbc	a, #0x00
      008441 97               [ 1]  684 	ld	xl, a
      008442 7B 02            [ 1]  685 	ld	a, (0x02, sp)
      008444 A2 00            [ 1]  686 	sbc	a, #0x00
      008446 95               [ 1]  687 	ld	xh, a
      008447 17 04            [ 2]  688 	ldw	(0x04, sp), y
      008449 1F 02            [ 2]  689 	ldw	(0x02, sp), x
      00844B 1E 04            [ 2]  690 	ldw	x, (0x04, sp)
      00844D 26 04            [ 1]  691 	jrne	00295$
      00844F 1E 02            [ 2]  692 	ldw	x, (0x02, sp)
      008451 27 0B            [ 1]  693 	jreq	00140$
      008453                        694 00295$:
      008453 4B 04            [ 1]  695 	push	#0x04
      008455 4B 01            [ 1]  696 	push	#0x01
      008457 CD 95 81         [ 4]  697 	call	_I2C_GetFlagStatus
      00845A 85               [ 2]  698 	popw	x
      00845B 4D               [ 1]  699 	tnz	a
      00845C 27 D9            [ 1]  700 	jreq	00138$
      00845E                        701 00140$:
                                    702 ;	user/RTC_pcf8563.c: 211: if(count == 0)
      00845E 0D 13            [ 1]  703 	tnz	(0x13, sp)
      008460 26 0C            [ 1]  704 	jrne	00142$
                                    705 ;	user/RTC_pcf8563.c: 213: I2C_AcknowledgeConfig(I2C_ACK_NONE);
      008462 4B 00            [ 1]  706 	push	#0x00
      008464 CD 94 8A         [ 4]  707 	call	_I2C_AcknowledgeConfig
      008467 84               [ 1]  708 	pop	a
                                    709 ;	user/RTC_pcf8563.c: 214: I2C_GenerateSTOP(ENABLE);
      008468 4B 01            [ 1]  710 	push	#0x01
      00846A CD 94 5A         [ 4]  711 	call	_I2C_GenerateSTOP
      00846D 84               [ 1]  712 	pop	a
      00846E                        713 00142$:
                                    714 ;	user/RTC_pcf8563.c: 216: I2C_AcknowledgeConfig(I2C_ACK_CURR);
      00846E 4B 01            [ 1]  715 	push	#0x01
      008470 CD 94 8A         [ 4]  716 	call	_I2C_AcknowledgeConfig
      008473 84               [ 1]  717 	pop	a
                                    718 ;	user/RTC_pcf8563.c: 220: timeout = 0x0FFF;
      008474 AE 0F FF         [ 2]  719 	ldw	x, #0x0fff
      008477 1F 04            [ 2]  720 	ldw	(0x04, sp), x
      008479 5F               [ 1]  721 	clrw	x
      00847A 1F 02            [ 2]  722 	ldw	(0x02, sp), x
                                    723 ;	user/RTC_pcf8563.c: 221: while (--timeout && I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) == RESET);
      00847C                        724 00144$:
      00847C 16 04            [ 2]  725 	ldw	y, (0x04, sp)
      00847E 72 A2 00 01      [ 2]  726 	subw	y, #0x0001
      008482 7B 03            [ 1]  727 	ld	a, (0x03, sp)
      008484 A2 00            [ 1]  728 	sbc	a, #0x00
      008486 97               [ 1]  729 	ld	xl, a
      008487 7B 02            [ 1]  730 	ld	a, (0x02, sp)
      008489 A2 00            [ 1]  731 	sbc	a, #0x00
      00848B 95               [ 1]  732 	ld	xh, a
      00848C 17 04            [ 2]  733 	ldw	(0x04, sp), y
      00848E 1F 02            [ 2]  734 	ldw	(0x02, sp), x
      008490 1E 04            [ 2]  735 	ldw	x, (0x04, sp)
      008492 26 04            [ 1]  736 	jrne	00298$
      008494 1E 02            [ 2]  737 	ldw	x, (0x02, sp)
      008496 27 0B            [ 1]  738 	jreq	00146$
      008498                        739 00298$:
      008498 4B 40            [ 1]  740 	push	#0x40
      00849A 4B 01            [ 1]  741 	push	#0x01
      00849C CD 95 81         [ 4]  742 	call	_I2C_GetFlagStatus
      00849F 85               [ 2]  743 	popw	x
      0084A0 4D               [ 1]  744 	tnz	a
      0084A1 27 D9            [ 1]  745 	jreq	00144$
      0084A3                        746 00146$:
                                    747 ;	user/RTC_pcf8563.c: 222: timeout = 0x0FFF;
      0084A3 AE 0F FF         [ 2]  748 	ldw	x, #0x0fff
      0084A6 1F 04            [ 2]  749 	ldw	(0x04, sp), x
      0084A8 5F               [ 1]  750 	clrw	x
      0084A9 1F 02            [ 2]  751 	ldw	(0x02, sp), x
                                    752 ;	user/RTC_pcf8563.c: 223: while(--timeout && !I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED));
      0084AB                        753 00148$:
      0084AB 16 04            [ 2]  754 	ldw	y, (0x04, sp)
      0084AD 72 A2 00 01      [ 2]  755 	subw	y, #0x0001
      0084B1 7B 03            [ 1]  756 	ld	a, (0x03, sp)
      0084B3 A2 00            [ 1]  757 	sbc	a, #0x00
      0084B5 97               [ 1]  758 	ld	xl, a
      0084B6 7B 02            [ 1]  759 	ld	a, (0x02, sp)
      0084B8 A2 00            [ 1]  760 	sbc	a, #0x00
      0084BA 95               [ 1]  761 	ld	xh, a
      0084BB 17 04            [ 2]  762 	ldw	(0x04, sp), y
      0084BD 1F 02            [ 2]  763 	ldw	(0x02, sp), x
      0084BF 1E 04            [ 2]  764 	ldw	x, (0x04, sp)
      0084C1 26 04            [ 1]  765 	jrne	00300$
      0084C3 1E 02            [ 2]  766 	ldw	x, (0x02, sp)
      0084C5 27 0B            [ 1]  767 	jreq	00150$
      0084C7                        768 00300$:
      0084C7 4B 40            [ 1]  769 	push	#0x40
      0084C9 4B 03            [ 1]  770 	push	#0x03
      0084CB CD 95 06         [ 4]  771 	call	_I2C_CheckEvent
      0084CE 85               [ 2]  772 	popw	x
      0084CF 4D               [ 1]  773 	tnz	a
      0084D0 27 D9            [ 1]  774 	jreq	00148$
      0084D2                        775 00150$:
                                    776 ;	user/RTC_pcf8563.c: 224: *data = I2C_ReceiveData();
      0084D2 CD 94 EB         [ 4]  777 	call	_I2C_ReceiveData
      0084D5 1E 1C            [ 2]  778 	ldw	x, (0x1c, sp)
      0084D7 F7               [ 1]  779 	ld	(x), a
                                    780 ;	user/RTC_pcf8563.c: 225: data++;
      0084D8 1E 1C            [ 2]  781 	ldw	x, (0x1c, sp)
      0084DA 5C               [ 2]  782 	incw	x
      0084DB 1F 1C            [ 2]  783 	ldw	(0x1c, sp), x
                                    784 ;	user/RTC_pcf8563.c: 226: count--;
      0084DD 0A 13            [ 1]  785 	dec	(0x13, sp)
      0084DF CC 84 28         [ 2]  786 	jp	00151$
                                    787 ;	user/RTC_pcf8563.c: 228: stop: I2C_GenerateSTOP(ENABLE);
      0084E2                        788 00154$:
      0084E2 4B 01            [ 1]  789 	push	#0x01
      0084E4 CD 94 5A         [ 4]  790 	call	_I2C_GenerateSTOP
      0084E7 84               [ 1]  791 	pop	a
                                    792 ;	user/RTC_pcf8563.c: 229: return res;
      0084E8 7B 01            [ 1]  793 	ld	a, (0x01, sp)
      0084EA                        794 00155$:
      0084EA 5B 25            [ 2]  795 	addw	sp, #37
      0084EC 81               [ 4]  796 	ret
                                    797 ;	user/RTC_pcf8563.c: 318: uint8_t PCF_getDateTime(PCF_DateTime *dateTime)
                                    798 ;	-----------------------------------------
                                    799 ;	 function PCF_getDateTime
                                    800 ;	-----------------------------------------
      0084ED                        801 _PCF_getDateTime:
      0084ED 52 1C            [ 2]  802 	sub	sp, #28
                                    803 ;	user/RTC_pcf8563.c: 322: PCF_Read(0x02, buffer, sizeof(buffer));
      0084EF 96               [ 1]  804 	ldw	x, sp
      0084F0 5C               [ 2]  805 	incw	x
      0084F1 1F 16            [ 2]  806 	ldw	(0x16, sp), x
      0084F3 1E 16            [ 2]  807 	ldw	x, (0x16, sp)
      0084F5 4B 07            [ 1]  808 	push	#0x07
      0084F7 89               [ 2]  809 	pushw	x
      0084F8 4B 02            [ 1]  810 	push	#0x02
      0084FA CD 82 71         [ 4]  811 	call	_PCF_Read
      0084FD 5B 04            [ 2]  812 	addw	sp, #4
                                    813 ;	user/RTC_pcf8563.c: 324: dateTime->second = (((buffer[0] >> 4) & 0x07) * 10) + (buffer[0] & 0x0F);
      0084FF 16 1F            [ 2]  814 	ldw	y, (0x1f, sp)
      008501 17 18            [ 2]  815 	ldw	(0x18, sp), y
      008503 1E 16            [ 2]  816 	ldw	x, (0x16, sp)
      008505 F6               [ 1]  817 	ld	a, (x)
      008506 6B 0A            [ 1]  818 	ld	(0x0a, sp), a
      008508 7B 0A            [ 1]  819 	ld	a, (0x0a, sp)
      00850A 4E               [ 1]  820 	swap	a
      00850B A4 0F            [ 1]  821 	and	a, #0x0f
      00850D A4 07            [ 1]  822 	and	a, #0x07
      00850F 97               [ 1]  823 	ld	xl, a
      008510 A6 0A            [ 1]  824 	ld	a, #0x0a
      008512 42               [ 4]  825 	mul	x, a
      008513 7B 0A            [ 1]  826 	ld	a, (0x0a, sp)
      008515 A4 0F            [ 1]  827 	and	a, #0x0f
      008517 6B 1A            [ 1]  828 	ld	(0x1a, sp), a
      008519 9F               [ 1]  829 	ld	a, xl
      00851A 1B 1A            [ 1]  830 	add	a, (0x1a, sp)
      00851C 1E 18            [ 2]  831 	ldw	x, (0x18, sp)
      00851E F7               [ 1]  832 	ld	(x), a
                                    833 ;	user/RTC_pcf8563.c: 325: dateTime->minute = (((buffer[1] >> 4) & 0x07) * 10) + (buffer[1] & 0x0F);
      00851F 1E 18            [ 2]  834 	ldw	x, (0x18, sp)
      008521 5C               [ 2]  835 	incw	x
      008522 1F 12            [ 2]  836 	ldw	(0x12, sp), x
      008524 1E 16            [ 2]  837 	ldw	x, (0x16, sp)
      008526 E6 01            [ 1]  838 	ld	a, (0x1, x)
      008528 6B 1C            [ 1]  839 	ld	(0x1c, sp), a
      00852A 7B 1C            [ 1]  840 	ld	a, (0x1c, sp)
      00852C 4E               [ 1]  841 	swap	a
      00852D A4 0F            [ 1]  842 	and	a, #0x0f
      00852F A4 07            [ 1]  843 	and	a, #0x07
      008531 97               [ 1]  844 	ld	xl, a
      008532 A6 0A            [ 1]  845 	ld	a, #0x0a
      008534 42               [ 4]  846 	mul	x, a
      008535 7B 1C            [ 1]  847 	ld	a, (0x1c, sp)
      008537 A4 0F            [ 1]  848 	and	a, #0x0f
      008539 6B 14            [ 1]  849 	ld	(0x14, sp), a
      00853B 9F               [ 1]  850 	ld	a, xl
      00853C 1B 14            [ 1]  851 	add	a, (0x14, sp)
      00853E 1E 12            [ 2]  852 	ldw	x, (0x12, sp)
      008540 F7               [ 1]  853 	ld	(x), a
                                    854 ;	user/RTC_pcf8563.c: 326: dateTime->hour = (((buffer[2] >> 4) & 0x03) * 10) + (buffer[2] & 0x0F);
      008541 16 18            [ 2]  855 	ldw	y, (0x18, sp)
      008543 72 A9 00 02      [ 2]  856 	addw	y, #0x0002
      008547 1E 16            [ 2]  857 	ldw	x, (0x16, sp)
      008549 E6 02            [ 1]  858 	ld	a, (0x2, x)
      00854B 6B 11            [ 1]  859 	ld	(0x11, sp), a
      00854D 7B 11            [ 1]  860 	ld	a, (0x11, sp)
      00854F 4E               [ 1]  861 	swap	a
      008550 A4 0F            [ 1]  862 	and	a, #0x0f
      008552 A4 03            [ 1]  863 	and	a, #0x03
      008554 97               [ 1]  864 	ld	xl, a
      008555 A6 0A            [ 1]  865 	ld	a, #0x0a
      008557 42               [ 4]  866 	mul	x, a
      008558 7B 11            [ 1]  867 	ld	a, (0x11, sp)
      00855A A4 0F            [ 1]  868 	and	a, #0x0f
      00855C 6B 0E            [ 1]  869 	ld	(0x0e, sp), a
      00855E 9F               [ 1]  870 	ld	a, xl
      00855F 1B 0E            [ 1]  871 	add	a, (0x0e, sp)
      008561 90 F7            [ 1]  872 	ld	(y), a
                                    873 ;	user/RTC_pcf8563.c: 327: dateTime->day = (((buffer[3] >> 4) & 0x03) * 10) + (buffer[3] & 0x0F);
      008563 16 18            [ 2]  874 	ldw	y, (0x18, sp)
      008565 72 A9 00 03      [ 2]  875 	addw	y, #0x0003
      008569 1E 16            [ 2]  876 	ldw	x, (0x16, sp)
      00856B E6 03            [ 1]  877 	ld	a, (0x3, x)
      00856D 6B 0B            [ 1]  878 	ld	(0x0b, sp), a
      00856F 7B 0B            [ 1]  879 	ld	a, (0x0b, sp)
      008571 4E               [ 1]  880 	swap	a
      008572 A4 0F            [ 1]  881 	and	a, #0x0f
      008574 A4 03            [ 1]  882 	and	a, #0x03
      008576 97               [ 1]  883 	ld	xl, a
      008577 A6 0A            [ 1]  884 	ld	a, #0x0a
      008579 42               [ 4]  885 	mul	x, a
      00857A 7B 0B            [ 1]  886 	ld	a, (0x0b, sp)
      00857C A4 0F            [ 1]  887 	and	a, #0x0f
      00857E 6B 1B            [ 1]  888 	ld	(0x1b, sp), a
      008580 9F               [ 1]  889 	ld	a, xl
      008581 1B 1B            [ 1]  890 	add	a, (0x1b, sp)
      008583 90 F7            [ 1]  891 	ld	(y), a
                                    892 ;	user/RTC_pcf8563.c: 328: dateTime->weekday = (buffer[4] & 0x07);
      008585 1E 18            [ 2]  893 	ldw	x, (0x18, sp)
      008587 1C 00 04         [ 2]  894 	addw	x, #0x0004
      00858A 16 16            [ 2]  895 	ldw	y, (0x16, sp)
      00858C 90 E6 04         [ 1]  896 	ld	a, (0x4, y)
      00858F A4 07            [ 1]  897 	and	a, #0x07
      008591 F7               [ 1]  898 	ld	(x), a
                                    899 ;	user/RTC_pcf8563.c: 329: dateTime->month = ((buffer[5] >> 4) & 0x01) * 10 + (buffer[5] & 0x0F);
      008592 16 18            [ 2]  900 	ldw	y, (0x18, sp)
      008594 72 A9 00 05      [ 2]  901 	addw	y, #0x0005
      008598 1E 16            [ 2]  902 	ldw	x, (0x16, sp)
      00859A 1C 00 05         [ 2]  903 	addw	x, #0x0005
      00859D 1F 0C            [ 2]  904 	ldw	(0x0c, sp), x
      00859F 1E 0C            [ 2]  905 	ldw	x, (0x0c, sp)
      0085A1 F6               [ 1]  906 	ld	a, (x)
      0085A2 88               [ 1]  907 	push	a
      0085A3 44               [ 1]  908 	srl	a
      0085A4 44               [ 1]  909 	srl	a
      0085A5 44               [ 1]  910 	srl	a
      0085A6 44               [ 1]  911 	srl	a
      0085A7 A4 01            [ 1]  912 	and	a, #0x01
      0085A9 97               [ 1]  913 	ld	xl, a
      0085AA A6 0A            [ 1]  914 	ld	a, #0x0a
      0085AC 42               [ 4]  915 	mul	x, a
      0085AD 84               [ 1]  916 	pop	a
      0085AE A4 0F            [ 1]  917 	and	a, #0x0f
      0085B0 6B 15            [ 1]  918 	ld	(0x15, sp), a
      0085B2 9F               [ 1]  919 	ld	a, xl
      0085B3 1B 15            [ 1]  920 	add	a, (0x15, sp)
      0085B5 90 F7            [ 1]  921 	ld	(y), a
                                    922 ;	user/RTC_pcf8563.c: 330: dateTime->year = 1900 + ((buffer[6] >> 4) & 0x0F) * 10 + (buffer[6] & 0x0F);
      0085B7 1E 18            [ 2]  923 	ldw	x, (0x18, sp)
      0085B9 1C 00 06         [ 2]  924 	addw	x, #0x0006
      0085BC 1F 08            [ 2]  925 	ldw	(0x08, sp), x
      0085BE 1E 16            [ 2]  926 	ldw	x, (0x16, sp)
      0085C0 E6 06            [ 1]  927 	ld	a, (0x6, x)
      0085C2 97               [ 1]  928 	ld	xl, a
      0085C3 4E               [ 1]  929 	swap	a
      0085C4 A4 0F            [ 1]  930 	and	a, #0x0f
      0085C6 A4 0F            [ 1]  931 	and	a, #0x0f
      0085C8 61               [ 1]  932 	exg	a, yl
      0085C9 A6 0A            [ 1]  933 	ld	a, #0x0a
      0085CB 61               [ 1]  934 	exg	a, yl
      0085CC 90 42            [ 4]  935 	mul	y, a
      0085CE 72 A9 07 6C      [ 2]  936 	addw	y, #0x076c
      0085D2 9F               [ 1]  937 	ld	a, xl
      0085D3 A4 0F            [ 1]  938 	and	a, #0x0f
      0085D5 6B 10            [ 1]  939 	ld	(0x10, sp), a
      0085D7 0F 0F            [ 1]  940 	clr	(0x0f, sp)
      0085D9 72 F9 0F         [ 2]  941 	addw	y, (0x0f, sp)
      0085DC 1E 08            [ 2]  942 	ldw	x, (0x08, sp)
      0085DE FF               [ 2]  943 	ldw	(x), y
                                    944 ;	user/RTC_pcf8563.c: 332: if (buffer[5] &  0x80)
      0085DF 1E 0C            [ 2]  945 	ldw	x, (0x0c, sp)
      0085E1 F6               [ 1]  946 	ld	a, (x)
      0085E2 4D               [ 1]  947 	tnz	a
      0085E3 2A 0A            [ 1]  948 	jrpl	00102$
                                    949 ;	user/RTC_pcf8563.c: 334: dateTime->year += 100;
      0085E5 1E 08            [ 2]  950 	ldw	x, (0x08, sp)
      0085E7 FE               [ 2]  951 	ldw	x, (x)
      0085E8 1C 00 64         [ 2]  952 	addw	x, #0x0064
      0085EB 16 08            [ 2]  953 	ldw	y, (0x08, sp)
      0085ED 90 FF            [ 2]  954 	ldw	(y), x
      0085EF                        955 00102$:
                                    956 ;	user/RTC_pcf8563.c: 337: if (buffer[0] & 0x80) //Clock integrity not guaranted
      0085EF 1E 16            [ 2]  957 	ldw	x, (0x16, sp)
      0085F1 F6               [ 1]  958 	ld	a, (x)
      0085F2 4D               [ 1]  959 	tnz	a
      0085F3 2A 03            [ 1]  960 	jrpl	00104$
                                    961 ;	user/RTC_pcf8563.c: 339: return 1;
      0085F5 A6 01            [ 1]  962 	ld	a, #0x01
                                    963 ;	user/RTC_pcf8563.c: 342: return 0;
      0085F7 21                     964 	.byte 0x21
      0085F8                        965 00104$:
      0085F8 4F               [ 1]  966 	clr	a
      0085F9                        967 00105$:
      0085F9 5B 1C            [ 2]  968 	addw	sp, #28
      0085FB 81               [ 4]  969 	ret
                                    970 ;	user/RTC_pcf8563.c: 347: void PCF_Init(uint8_t mode)
                                    971 ;	-----------------------------------------
                                    972 ;	 function PCF_Init
                                    973 ;	-----------------------------------------
      0085FC                        974 _PCF_Init:
      0085FC 88               [ 1]  975 	push	a
                                    976 ;	user/RTC_pcf8563.c: 349: uint8_t tmp = 0x00;
      0085FD 0F 01            [ 1]  977 	clr	(0x01, sp)
                                    978 ;	user/RTC_pcf8563.c: 350: I2C_setup();
      0085FF CD 80 A0         [ 4]  979 	call	_I2C_setup
                                    980 ;	user/RTC_pcf8563.c: 353: PCF_Write(0x00, &tmp, 1);
      008602 96               [ 1]  981 	ldw	x, sp
      008603 5C               [ 2]  982 	incw	x
      008604 4B 01            [ 1]  983 	push	#0x01
      008606 89               [ 2]  984 	pushw	x
      008607 4B 00            [ 1]  985 	push	#0x00
      008609 CD 80 DC         [ 4]  986 	call	_PCF_Write
      00860C 5B 04            [ 2]  987 	addw	sp, #4
                                    988 ;	user/RTC_pcf8563.c: 354: mode &= 0x13;
      00860E 7B 04            [ 1]  989 	ld	a, (0x04, sp)
      008610 A4 13            [ 1]  990 	and	a, #0x13
      008612 6B 04            [ 1]  991 	ld	(0x04, sp), a
                                    992 ;	user/RTC_pcf8563.c: 357: PCF_Write(0x00, &mode, 1);
      008614 96               [ 1]  993 	ldw	x, sp
      008615 1C 00 04         [ 2]  994 	addw	x, #4
      008618 4B 01            [ 1]  995 	push	#0x01
      00861A 89               [ 2]  996 	pushw	x
      00861B 4B 00            [ 1]  997 	push	#0x00
      00861D CD 80 DC         [ 4]  998 	call	_PCF_Write
      008620 5B 05            [ 2]  999 	addw	sp, #5
      008622 81               [ 4] 1000 	ret
                                   1001 ;	user/RTC_pcf8563.c: 360: uint8_t PCF_setDateTime(PCF_DateTime *dateTime)
                                   1002 ;	-----------------------------------------
                                   1003 ;	 function PCF_setDateTime
                                   1004 ;	-----------------------------------------
      008623                       1005 _PCF_setDateTime:
      008623 52 26            [ 2] 1006 	sub	sp, #38
                                   1007 ;	user/RTC_pcf8563.c: 363: if (dateTime->second >= 60 || dateTime->minute >= 60 || dateTime->hour >= 24 || dateTime->day > 32 || dateTime->weekday > 6 || dateTime->month > 12 || dateTime->year < 1900 || dateTime->year >= 2100)
      008625 16 29            [ 2] 1008 	ldw	y, (0x29, sp)
      008627 17 16            [ 2] 1009 	ldw	(0x16, sp), y
      008629 1E 16            [ 2] 1010 	ldw	x, (0x16, sp)
      00862B F6               [ 1] 1011 	ld	a, (x)
      00862C 6B 1F            [ 1] 1012 	ld	(0x1f, sp), a
      00862E 7B 1F            [ 1] 1013 	ld	a, (0x1f, sp)
      008630 A1 3C            [ 1] 1014 	cp	a, #0x3c
      008632 24 55            [ 1] 1015 	jrnc	00101$
      008634 16 16            [ 2] 1016 	ldw	y, (0x16, sp)
      008636 90 5C            [ 2] 1017 	incw	y
      008638 90 F6            [ 1] 1018 	ld	a, (y)
      00863A A1 3C            [ 1] 1019 	cp	a, #0x3c
      00863C 24 4B            [ 1] 1020 	jrnc	00101$
      00863E 1E 16            [ 2] 1021 	ldw	x, (0x16, sp)
      008640 5C               [ 2] 1022 	incw	x
      008641 5C               [ 2] 1023 	incw	x
      008642 1F 1D            [ 2] 1024 	ldw	(0x1d, sp), x
      008644 1E 1D            [ 2] 1025 	ldw	x, (0x1d, sp)
      008646 F6               [ 1] 1026 	ld	a, (x)
      008647 A1 18            [ 1] 1027 	cp	a, #0x18
      008649 24 3E            [ 1] 1028 	jrnc	00101$
      00864B 1E 16            [ 2] 1029 	ldw	x, (0x16, sp)
      00864D 1C 00 03         [ 2] 1030 	addw	x, #0x0003
      008650 1F 10            [ 2] 1031 	ldw	(0x10, sp), x
      008652 1E 10            [ 2] 1032 	ldw	x, (0x10, sp)
      008654 F6               [ 1] 1033 	ld	a, (x)
      008655 A1 20            [ 1] 1034 	cp	a, #0x20
      008657 22 30            [ 1] 1035 	jrugt	00101$
      008659 1E 16            [ 2] 1036 	ldw	x, (0x16, sp)
      00865B 1C 00 04         [ 2] 1037 	addw	x, #0x0004
      00865E 1F 18            [ 2] 1038 	ldw	(0x18, sp), x
      008660 1E 18            [ 2] 1039 	ldw	x, (0x18, sp)
      008662 F6               [ 1] 1040 	ld	a, (x)
      008663 A1 06            [ 1] 1041 	cp	a, #0x06
      008665 22 22            [ 1] 1042 	jrugt	00101$
      008667 1E 16            [ 2] 1043 	ldw	x, (0x16, sp)
      008669 1C 00 05         [ 2] 1044 	addw	x, #0x0005
      00866C 1F 20            [ 2] 1045 	ldw	(0x20, sp), x
      00866E 1E 20            [ 2] 1046 	ldw	x, (0x20, sp)
      008670 F6               [ 1] 1047 	ld	a, (x)
      008671 A1 0C            [ 1] 1048 	cp	a, #0x0c
      008673 22 14            [ 1] 1049 	jrugt	00101$
      008675 1E 16            [ 2] 1050 	ldw	x, (0x16, sp)
      008677 1C 00 06         [ 2] 1051 	addw	x, #0x0006
      00867A 1F 22            [ 2] 1052 	ldw	(0x22, sp), x
      00867C 1E 22            [ 2] 1053 	ldw	x, (0x22, sp)
      00867E FE               [ 2] 1054 	ldw	x, (x)
      00867F A3 07 6C         [ 2] 1055 	cpw	x, #0x076c
      008682 25 05            [ 1] 1056 	jrc	00101$
      008684 A3 08 34         [ 2] 1057 	cpw	x, #0x0834
      008687 25 05            [ 1] 1058 	jrc	00102$
      008689                       1059 00101$:
                                   1060 ;	user/RTC_pcf8563.c: 365: return 1;
      008689 A6 01            [ 1] 1061 	ld	a, #0x01
      00868B CC 87 BF         [ 2] 1062 	jp	00113$
      00868E                       1063 00102$:
                                   1064 ;	user/RTC_pcf8563.c: 368: buffer[0] = BinToBCD(dateTime->second) & 0x7F;
      00868E 96               [ 1] 1065 	ldw	x, sp
      00868F 5C               [ 2] 1066 	incw	x
      008690 1F 12            [ 2] 1067 	ldw	(0x12, sp), x
      008692 5F               [ 1] 1068 	clrw	x
      008693 7B 1F            [ 1] 1069 	ld	a, (0x1f, sp)
      008695 97               [ 1] 1070 	ld	xl, a
      008696 A6 0A            [ 1] 1071 	ld	a, #0x0a
      008698 62               [ 2] 1072 	div	x, a
      008699 9F               [ 1] 1073 	ld	a, xl
      00869A 4E               [ 1] 1074 	swap	a
      00869B A4 F0            [ 1] 1075 	and	a, #0xf0
      00869D 6B 1A            [ 1] 1076 	ld	(0x1a, sp), a
      00869F 5F               [ 1] 1077 	clrw	x
      0086A0 7B 1F            [ 1] 1078 	ld	a, (0x1f, sp)
      0086A2 97               [ 1] 1079 	ld	xl, a
      0086A3 A6 0A            [ 1] 1080 	ld	a, #0x0a
      0086A5 62               [ 2] 1081 	div	x, a
      0086A6 1B 1A            [ 1] 1082 	add	a, (0x1a, sp)
      0086A8 A4 7F            [ 1] 1083 	and	a, #0x7f
      0086AA 1E 12            [ 2] 1084 	ldw	x, (0x12, sp)
      0086AC F7               [ 1] 1085 	ld	(x), a
                                   1086 ;	user/RTC_pcf8563.c: 369: buffer[1] = BinToBCD(dateTime->minute) & 0x7F;
      0086AD 1E 12            [ 2] 1087 	ldw	x, (0x12, sp)
      0086AF 5C               [ 2] 1088 	incw	x
      0086B0 1F 14            [ 2] 1089 	ldw	(0x14, sp), x
      0086B2 90 F6            [ 1] 1090 	ld	a, (y)
      0086B4 97               [ 1] 1091 	ld	xl, a
      0086B5 89               [ 2] 1092 	pushw	x
      0086B6 4F               [ 1] 1093 	clr	a
      0086B7 95               [ 1] 1094 	ld	xh, a
      0086B8 A6 0A            [ 1] 1095 	ld	a, #0x0a
      0086BA 62               [ 2] 1096 	div	x, a
      0086BB 9F               [ 1] 1097 	ld	a, xl
      0086BC 85               [ 2] 1098 	popw	x
      0086BD 4E               [ 1] 1099 	swap	a
      0086BE A4 F0            [ 1] 1100 	and	a, #0xf0
      0086C0 6B 1B            [ 1] 1101 	ld	(0x1b, sp), a
      0086C2 4F               [ 1] 1102 	clr	a
      0086C3 95               [ 1] 1103 	ld	xh, a
      0086C4 A6 0A            [ 1] 1104 	ld	a, #0x0a
      0086C6 62               [ 2] 1105 	div	x, a
      0086C7 1B 1B            [ 1] 1106 	add	a, (0x1b, sp)
      0086C9 A4 7F            [ 1] 1107 	and	a, #0x7f
      0086CB 1E 14            [ 2] 1108 	ldw	x, (0x14, sp)
      0086CD F7               [ 1] 1109 	ld	(x), a
                                   1110 ;	user/RTC_pcf8563.c: 370: buffer[2] = BinToBCD(dateTime->hour) & 0x3F;
      0086CE 16 12            [ 2] 1111 	ldw	y, (0x12, sp)
      0086D0 72 A9 00 02      [ 2] 1112 	addw	y, #0x0002
      0086D4 1E 1D            [ 2] 1113 	ldw	x, (0x1d, sp)
      0086D6 F6               [ 1] 1114 	ld	a, (x)
      0086D7 97               [ 1] 1115 	ld	xl, a
      0086D8 89               [ 2] 1116 	pushw	x
      0086D9 4F               [ 1] 1117 	clr	a
      0086DA 95               [ 1] 1118 	ld	xh, a
      0086DB A6 0A            [ 1] 1119 	ld	a, #0x0a
      0086DD 62               [ 2] 1120 	div	x, a
      0086DE 9F               [ 1] 1121 	ld	a, xl
      0086DF 85               [ 2] 1122 	popw	x
      0086E0 4E               [ 1] 1123 	swap	a
      0086E1 A4 F0            [ 1] 1124 	and	a, #0xf0
      0086E3 6B 1C            [ 1] 1125 	ld	(0x1c, sp), a
      0086E5 4F               [ 1] 1126 	clr	a
      0086E6 95               [ 1] 1127 	ld	xh, a
      0086E7 A6 0A            [ 1] 1128 	ld	a, #0x0a
      0086E9 62               [ 2] 1129 	div	x, a
      0086EA 1B 1C            [ 1] 1130 	add	a, (0x1c, sp)
      0086EC A4 3F            [ 1] 1131 	and	a, #0x3f
      0086EE 90 F7            [ 1] 1132 	ld	(y), a
                                   1133 ;	user/RTC_pcf8563.c: 371: buffer[3] = BinToBCD(dateTime->day) & 0x3F;
      0086F0 16 12            [ 2] 1134 	ldw	y, (0x12, sp)
      0086F2 72 A9 00 03      [ 2] 1135 	addw	y, #0x0003
      0086F6 1E 10            [ 2] 1136 	ldw	x, (0x10, sp)
      0086F8 F6               [ 1] 1137 	ld	a, (x)
      0086F9 97               [ 1] 1138 	ld	xl, a
      0086FA 89               [ 2] 1139 	pushw	x
      0086FB 4F               [ 1] 1140 	clr	a
      0086FC 95               [ 1] 1141 	ld	xh, a
      0086FD A6 0A            [ 1] 1142 	ld	a, #0x0a
      0086FF 62               [ 2] 1143 	div	x, a
      008700 9F               [ 1] 1144 	ld	a, xl
      008701 85               [ 2] 1145 	popw	x
      008702 4E               [ 1] 1146 	swap	a
      008703 A4 F0            [ 1] 1147 	and	a, #0xf0
      008705 6B 0F            [ 1] 1148 	ld	(0x0f, sp), a
      008707 4F               [ 1] 1149 	clr	a
      008708 95               [ 1] 1150 	ld	xh, a
      008709 A6 0A            [ 1] 1151 	ld	a, #0x0a
      00870B 62               [ 2] 1152 	div	x, a
      00870C 1B 0F            [ 1] 1153 	add	a, (0x0f, sp)
      00870E A4 3F            [ 1] 1154 	and	a, #0x3f
      008710 90 F7            [ 1] 1155 	ld	(y), a
                                   1156 ;	user/RTC_pcf8563.c: 372: buffer[4] = BinToBCD(dateTime->weekday) & 0x07;
      008712 16 12            [ 2] 1157 	ldw	y, (0x12, sp)
      008714 72 A9 00 04      [ 2] 1158 	addw	y, #0x0004
      008718 1E 18            [ 2] 1159 	ldw	x, (0x18, sp)
      00871A F6               [ 1] 1160 	ld	a, (x)
      00871B 97               [ 1] 1161 	ld	xl, a
      00871C 89               [ 2] 1162 	pushw	x
      00871D 4F               [ 1] 1163 	clr	a
      00871E 95               [ 1] 1164 	ld	xh, a
      00871F A6 0A            [ 1] 1165 	ld	a, #0x0a
      008721 62               [ 2] 1166 	div	x, a
      008722 9F               [ 1] 1167 	ld	a, xl
      008723 85               [ 2] 1168 	popw	x
      008724 4E               [ 1] 1169 	swap	a
      008725 A4 F0            [ 1] 1170 	and	a, #0xf0
      008727 6B 0E            [ 1] 1171 	ld	(0x0e, sp), a
      008729 4F               [ 1] 1172 	clr	a
      00872A 95               [ 1] 1173 	ld	xh, a
      00872B A6 0A            [ 1] 1174 	ld	a, #0x0a
      00872D 62               [ 2] 1175 	div	x, a
      00872E 1B 0E            [ 1] 1176 	add	a, (0x0e, sp)
      008730 A4 07            [ 1] 1177 	and	a, #0x07
      008732 90 F7            [ 1] 1178 	ld	(y), a
                                   1179 ;	user/RTC_pcf8563.c: 373: buffer[5] = BinToBCD(dateTime->month) & 0x1F;
      008734 1E 12            [ 2] 1180 	ldw	x, (0x12, sp)
      008736 1C 00 05         [ 2] 1181 	addw	x, #0x0005
      008739 1F 0C            [ 2] 1182 	ldw	(0x0c, sp), x
      00873B 1E 20            [ 2] 1183 	ldw	x, (0x20, sp)
      00873D F6               [ 1] 1184 	ld	a, (x)
      00873E 97               [ 1] 1185 	ld	xl, a
      00873F 89               [ 2] 1186 	pushw	x
      008740 4F               [ 1] 1187 	clr	a
      008741 95               [ 1] 1188 	ld	xh, a
      008742 A6 0A            [ 1] 1189 	ld	a, #0x0a
      008744 62               [ 2] 1190 	div	x, a
      008745 9F               [ 1] 1191 	ld	a, xl
      008746 85               [ 2] 1192 	popw	x
      008747 4E               [ 1] 1193 	swap	a
      008748 A4 F0            [ 1] 1194 	and	a, #0xf0
      00874A 6B 0B            [ 1] 1195 	ld	(0x0b, sp), a
      00874C 4F               [ 1] 1196 	clr	a
      00874D 95               [ 1] 1197 	ld	xh, a
      00874E A6 0A            [ 1] 1198 	ld	a, #0x0a
      008750 62               [ 2] 1199 	div	x, a
      008751 1B 0B            [ 1] 1200 	add	a, (0x0b, sp)
      008753 A4 1F            [ 1] 1201 	and	a, #0x1f
      008755 1E 0C            [ 2] 1202 	ldw	x, (0x0c, sp)
      008757 F7               [ 1] 1203 	ld	(x), a
                                   1204 ;	user/RTC_pcf8563.c: 375: if (dateTime->year >= 2000)
      008758 1E 22            [ 2] 1205 	ldw	x, (0x22, sp)
      00875A FE               [ 2] 1206 	ldw	x, (x)
      00875B 1F 09            [ 2] 1207 	ldw	(0x09, sp), x
                                   1208 ;	user/RTC_pcf8563.c: 378: buffer[6] = BinToBCD(dateTime->year - 2000);
      00875D 1E 12            [ 2] 1209 	ldw	x, (0x12, sp)
      00875F 1C 00 06         [ 2] 1210 	addw	x, #0x0006
      008762 1F 25            [ 2] 1211 	ldw	(0x25, sp), x
                                   1212 ;	user/RTC_pcf8563.c: 375: if (dateTime->year >= 2000)
      008764 1E 09            [ 2] 1213 	ldw	x, (0x09, sp)
      008766 A3 07 D0         [ 2] 1214 	cpw	x, #0x07d0
      008769 25 29            [ 1] 1215 	jrc	00111$
                                   1216 ;	user/RTC_pcf8563.c: 377: buffer[5] |= 0x80;
      00876B 1E 0C            [ 2] 1217 	ldw	x, (0x0c, sp)
      00876D F6               [ 1] 1218 	ld	a, (x)
      00876E AA 80            [ 1] 1219 	or	a, #0x80
      008770 1E 0C            [ 2] 1220 	ldw	x, (0x0c, sp)
      008772 F7               [ 1] 1221 	ld	(x), a
                                   1222 ;	user/RTC_pcf8563.c: 378: buffer[6] = BinToBCD(dateTime->year - 2000);
      008773 1E 22            [ 2] 1223 	ldw	x, (0x22, sp)
      008775 FE               [ 2] 1224 	ldw	x, (x)
      008776 1D 07 D0         [ 2] 1225 	subw	x, #0x07d0
      008779 89               [ 2] 1226 	pushw	x
      00877A 90 AE 00 0A      [ 2] 1227 	ldw	y, #0x000a
      00877E 65               [ 2] 1228 	divw	x, y
      00877F 9F               [ 1] 1229 	ld	a, xl
      008780 85               [ 2] 1230 	popw	x
      008781 4E               [ 1] 1231 	swap	a
      008782 A4 F0            [ 1] 1232 	and	a, #0xf0
      008784 6B 08            [ 1] 1233 	ld	(0x08, sp), a
      008786 90 AE 00 0A      [ 2] 1234 	ldw	y, #0x000a
      00878A 65               [ 2] 1235 	divw	x, y
      00878B 90 9F            [ 1] 1236 	ld	a, yl
      00878D 1B 08            [ 1] 1237 	add	a, (0x08, sp)
      00878F 1E 25            [ 2] 1238 	ldw	x, (0x25, sp)
      008791 F7               [ 1] 1239 	ld	(x), a
      008792 20 1E            [ 2] 1240 	jra	00112$
      008794                       1241 00111$:
                                   1242 ;	user/RTC_pcf8563.c: 382: buffer[6] = BinToBCD(dateTime->year - 1900);
      008794 1E 09            [ 2] 1243 	ldw	x, (0x09, sp)
      008796 1D 07 6C         [ 2] 1244 	subw	x, #0x076c
      008799 89               [ 2] 1245 	pushw	x
      00879A 90 AE 00 0A      [ 2] 1246 	ldw	y, #0x000a
      00879E 65               [ 2] 1247 	divw	x, y
      00879F 9F               [ 1] 1248 	ld	a, xl
      0087A0 85               [ 2] 1249 	popw	x
      0087A1 4E               [ 1] 1250 	swap	a
      0087A2 A4 F0            [ 1] 1251 	and	a, #0xf0
      0087A4 90 AE 00 0A      [ 2] 1252 	ldw	y, #0x000a
      0087A8 65               [ 2] 1253 	divw	x, y
      0087A9 61               [ 1] 1254 	exg	a, yl
      0087AA 6B 24            [ 1] 1255 	ld	(0x24, sp), a
      0087AC 61               [ 1] 1256 	exg	a, yl
      0087AD 1B 24            [ 1] 1257 	add	a, (0x24, sp)
      0087AF 1E 25            [ 2] 1258 	ldw	x, (0x25, sp)
      0087B1 F7               [ 1] 1259 	ld	(x), a
      0087B2                       1260 00112$:
                                   1261 ;	user/RTC_pcf8563.c: 385: PCF_Write(0x02, buffer, sizeof(buffer));
      0087B2 1E 12            [ 2] 1262 	ldw	x, (0x12, sp)
      0087B4 4B 07            [ 1] 1263 	push	#0x07
      0087B6 89               [ 2] 1264 	pushw	x
      0087B7 4B 02            [ 1] 1265 	push	#0x02
      0087B9 CD 80 DC         [ 4] 1266 	call	_PCF_Write
      0087BC 5B 04            [ 2] 1267 	addw	sp, #4
                                   1268 ;	user/RTC_pcf8563.c: 387: return 0;
      0087BE 4F               [ 1] 1269 	clr	a
      0087BF                       1270 00113$:
      0087BF 5B 26            [ 2] 1271 	addw	sp, #38
      0087C1 81               [ 4] 1272 	ret
                                   1273 ;	user/RTC_pcf8563.c: 417: uint8_t PCF_setAlarm(PCF_Alarm *alarm)
                                   1274 ;	-----------------------------------------
                                   1275 ;	 function PCF_setAlarm
                                   1276 ;	-----------------------------------------
      0087C2                       1277 _PCF_setAlarm:
      0087C2 52 13            [ 2] 1278 	sub	sp, #19
                                   1279 ;	user/RTC_pcf8563.c: 420: if ((alarm->minute >= 60 && alarm->minute != 80) || (alarm->hour >= 24 && alarm->hour != 80) || (alarm->day > 32 && alarm->day != 80) || (alarm->weekday > 6 && alarm->weekday != 80))
      0087C4 16 16            [ 2] 1280 	ldw	y, (0x16, sp)
      0087C6 17 0E            [ 2] 1281 	ldw	(0x0e, sp), y
      0087C8 1E 0E            [ 2] 1282 	ldw	x, (0x0e, sp)
      0087CA F6               [ 1] 1283 	ld	a, (x)
      0087CB 6B 12            [ 1] 1284 	ld	(0x12, sp), a
      0087CD 7B 12            [ 1] 1285 	ld	a, (0x12, sp)
      0087CF A1 3C            [ 1] 1286 	cp	a, #0x3c
      0087D1 25 06            [ 1] 1287 	jrc	00105$
      0087D3 7B 12            [ 1] 1288 	ld	a, (0x12, sp)
      0087D5 A1 50            [ 1] 1289 	cp	a, #0x50
      0087D7 26 31            [ 1] 1290 	jrne	00101$
      0087D9                       1291 00105$:
      0087D9 16 0E            [ 2] 1292 	ldw	y, (0x0e, sp)
      0087DB 90 5C            [ 2] 1293 	incw	y
      0087DD 90 F6            [ 1] 1294 	ld	a, (y)
      0087DF A1 18            [ 1] 1295 	cp	a, #0x18
      0087E1 25 04            [ 1] 1296 	jrc	00107$
      0087E3 A1 50            [ 1] 1297 	cp	a, #0x50
      0087E5 26 23            [ 1] 1298 	jrne	00101$
      0087E7                       1299 00107$:
      0087E7 1E 0E            [ 2] 1300 	ldw	x, (0x0e, sp)
      0087E9 5C               [ 2] 1301 	incw	x
      0087EA 5C               [ 2] 1302 	incw	x
      0087EB 1F 0C            [ 2] 1303 	ldw	(0x0c, sp), x
      0087ED 1E 0C            [ 2] 1304 	ldw	x, (0x0c, sp)
      0087EF F6               [ 1] 1305 	ld	a, (x)
      0087F0 A1 20            [ 1] 1306 	cp	a, #0x20
      0087F2 23 04            [ 2] 1307 	jrule	00109$
      0087F4 A1 50            [ 1] 1308 	cp	a, #0x50
      0087F6 26 12            [ 1] 1309 	jrne	00101$
      0087F8                       1310 00109$:
      0087F8 1E 0E            [ 2] 1311 	ldw	x, (0x0e, sp)
      0087FA 1C 00 03         [ 2] 1312 	addw	x, #0x0003
      0087FD 1F 10            [ 2] 1313 	ldw	(0x10, sp), x
      0087FF 1E 10            [ 2] 1314 	ldw	x, (0x10, sp)
      008801 F6               [ 1] 1315 	ld	a, (x)
      008802 A1 06            [ 1] 1316 	cp	a, #0x06
      008804 23 09            [ 2] 1317 	jrule	00102$
      008806 A1 50            [ 1] 1318 	cp	a, #0x50
      008808 27 05            [ 1] 1319 	jreq	00102$
      00880A                       1320 00101$:
                                   1321 ;	user/RTC_pcf8563.c: 422: return 1;
      00880A A6 01            [ 1] 1322 	ld	a, #0x01
      00880C CC 88 9E         [ 2] 1323 	jp	00110$
      00880F                       1324 00102$:
                                   1325 ;	user/RTC_pcf8563.c: 425: buffer[0] = BinToBCD(alarm->minute) & 0xFF;
      00880F 96               [ 1] 1326 	ldw	x, sp
      008810 5C               [ 2] 1327 	incw	x
      008811 1F 06            [ 2] 1328 	ldw	(0x06, sp), x
      008813 5F               [ 1] 1329 	clrw	x
      008814 7B 12            [ 1] 1330 	ld	a, (0x12, sp)
      008816 97               [ 1] 1331 	ld	xl, a
      008817 A6 0A            [ 1] 1332 	ld	a, #0x0a
      008819 62               [ 2] 1333 	div	x, a
      00881A 9F               [ 1] 1334 	ld	a, xl
      00881B 4E               [ 1] 1335 	swap	a
      00881C A4 F0            [ 1] 1336 	and	a, #0xf0
      00881E 6B 0B            [ 1] 1337 	ld	(0x0b, sp), a
      008820 5F               [ 1] 1338 	clrw	x
      008821 7B 12            [ 1] 1339 	ld	a, (0x12, sp)
      008823 97               [ 1] 1340 	ld	xl, a
      008824 A6 0A            [ 1] 1341 	ld	a, #0x0a
      008826 62               [ 2] 1342 	div	x, a
      008827 1B 0B            [ 1] 1343 	add	a, (0x0b, sp)
      008829 1E 06            [ 2] 1344 	ldw	x, (0x06, sp)
      00882B F7               [ 1] 1345 	ld	(x), a
                                   1346 ;	user/RTC_pcf8563.c: 426: buffer[1] = BinToBCD(alarm->hour) & 0xBF;
      00882C 1E 06            [ 2] 1347 	ldw	x, (0x06, sp)
      00882E 5C               [ 2] 1348 	incw	x
      00882F 1F 09            [ 2] 1349 	ldw	(0x09, sp), x
      008831 90 F6            [ 1] 1350 	ld	a, (y)
      008833 97               [ 1] 1351 	ld	xl, a
      008834 89               [ 2] 1352 	pushw	x
      008835 4F               [ 1] 1353 	clr	a
      008836 95               [ 1] 1354 	ld	xh, a
      008837 A6 0A            [ 1] 1355 	ld	a, #0x0a
      008839 62               [ 2] 1356 	div	x, a
      00883A 9F               [ 1] 1357 	ld	a, xl
      00883B 85               [ 2] 1358 	popw	x
      00883C 4E               [ 1] 1359 	swap	a
      00883D A4 F0            [ 1] 1360 	and	a, #0xf0
      00883F 6B 13            [ 1] 1361 	ld	(0x13, sp), a
      008841 4F               [ 1] 1362 	clr	a
      008842 95               [ 1] 1363 	ld	xh, a
      008843 A6 0A            [ 1] 1364 	ld	a, #0x0a
      008845 62               [ 2] 1365 	div	x, a
      008846 1B 13            [ 1] 1366 	add	a, (0x13, sp)
      008848 A4 BF            [ 1] 1367 	and	a, #0xbf
      00884A 1E 09            [ 2] 1368 	ldw	x, (0x09, sp)
      00884C F7               [ 1] 1369 	ld	(x), a
                                   1370 ;	user/RTC_pcf8563.c: 427: buffer[2] = BinToBCD(alarm->day) & 0xBF;
      00884D 16 06            [ 2] 1371 	ldw	y, (0x06, sp)
      00884F 72 A9 00 02      [ 2] 1372 	addw	y, #0x0002
      008853 1E 0C            [ 2] 1373 	ldw	x, (0x0c, sp)
      008855 F6               [ 1] 1374 	ld	a, (x)
      008856 97               [ 1] 1375 	ld	xl, a
      008857 89               [ 2] 1376 	pushw	x
      008858 4F               [ 1] 1377 	clr	a
      008859 95               [ 1] 1378 	ld	xh, a
      00885A A6 0A            [ 1] 1379 	ld	a, #0x0a
      00885C 62               [ 2] 1380 	div	x, a
      00885D 9F               [ 1] 1381 	ld	a, xl
      00885E 85               [ 2] 1382 	popw	x
      00885F 4E               [ 1] 1383 	swap	a
      008860 A4 F0            [ 1] 1384 	and	a, #0xf0
      008862 6B 08            [ 1] 1385 	ld	(0x08, sp), a
      008864 4F               [ 1] 1386 	clr	a
      008865 95               [ 1] 1387 	ld	xh, a
      008866 A6 0A            [ 1] 1388 	ld	a, #0x0a
      008868 62               [ 2] 1389 	div	x, a
      008869 1B 08            [ 1] 1390 	add	a, (0x08, sp)
      00886B A4 BF            [ 1] 1391 	and	a, #0xbf
      00886D 90 F7            [ 1] 1392 	ld	(y), a
                                   1393 ;	user/RTC_pcf8563.c: 428: buffer[3] = BinToBCD(alarm->weekday) & 0x87;
      00886F 16 06            [ 2] 1394 	ldw	y, (0x06, sp)
      008871 72 A9 00 03      [ 2] 1395 	addw	y, #0x0003
      008875 1E 10            [ 2] 1396 	ldw	x, (0x10, sp)
      008877 F6               [ 1] 1397 	ld	a, (x)
      008878 97               [ 1] 1398 	ld	xl, a
      008879 89               [ 2] 1399 	pushw	x
      00887A 4F               [ 1] 1400 	clr	a
      00887B 95               [ 1] 1401 	ld	xh, a
      00887C A6 0A            [ 1] 1402 	ld	a, #0x0a
      00887E 62               [ 2] 1403 	div	x, a
      00887F 9F               [ 1] 1404 	ld	a, xl
      008880 85               [ 2] 1405 	popw	x
      008881 4E               [ 1] 1406 	swap	a
      008882 A4 F0            [ 1] 1407 	and	a, #0xf0
      008884 6B 05            [ 1] 1408 	ld	(0x05, sp), a
      008886 4F               [ 1] 1409 	clr	a
      008887 95               [ 1] 1410 	ld	xh, a
      008888 A6 0A            [ 1] 1411 	ld	a, #0x0a
      00888A 62               [ 2] 1412 	div	x, a
      00888B 1B 05            [ 1] 1413 	add	a, (0x05, sp)
      00888D A4 87            [ 1] 1414 	and	a, #0x87
      00888F 90 F7            [ 1] 1415 	ld	(y), a
                                   1416 ;	user/RTC_pcf8563.c: 430: PCF_Write(0x09, buffer, sizeof(buffer));
      008891 1E 06            [ 2] 1417 	ldw	x, (0x06, sp)
      008893 4B 04            [ 1] 1418 	push	#0x04
      008895 89               [ 2] 1419 	pushw	x
      008896 4B 09            [ 1] 1420 	push	#0x09
      008898 CD 80 DC         [ 4] 1421 	call	_PCF_Write
      00889B 5B 04            [ 2] 1422 	addw	sp, #4
                                   1423 ;	user/RTC_pcf8563.c: 432: return 0;
      00889D 4F               [ 1] 1424 	clr	a
      00889E                       1425 00110$:
      00889E 5B 13            [ 2] 1426 	addw	sp, #19
      0088A0 81               [ 4] 1427 	ret
                                   1428 ;	user/RTC_pcf8563.c: 435: void PCF_setTimer(uint8_t mode, uint8_t count)
                                   1429 ;	-----------------------------------------
                                   1430 ;	 function PCF_setTimer
                                   1431 ;	-----------------------------------------
      0088A1                       1432 _PCF_setTimer:
                                   1433 ;	user/RTC_pcf8563.c: 437: mode &= 0x13;
      0088A1 7B 03            [ 1] 1434 	ld	a, (0x03, sp)
      0088A3 A4 13            [ 1] 1435 	and	a, #0x13
      0088A5 6B 03            [ 1] 1436 	ld	(0x03, sp), a
                                   1437 ;	user/RTC_pcf8563.c: 438: PCF_Write(0x0E, &mode, 1);				//Timer_control
      0088A7 96               [ 1] 1438 	ldw	x, sp
      0088A8 1C 00 03         [ 2] 1439 	addw	x, #3
      0088AB 4B 01            [ 1] 1440 	push	#0x01
      0088AD 89               [ 2] 1441 	pushw	x
      0088AE 4B 0E            [ 1] 1442 	push	#0x0e
      0088B0 CD 80 DC         [ 4] 1443 	call	_PCF_Write
      0088B3 5B 04            [ 2] 1444 	addw	sp, #4
                                   1445 ;	user/RTC_pcf8563.c: 440: PCF_Write(0x0F, &count, 1);				//Timer
      0088B5 96               [ 1] 1446 	ldw	x, sp
      0088B6 1C 00 04         [ 2] 1447 	addw	x, #4
      0088B9 4B 01            [ 1] 1448 	push	#0x01
      0088BB 89               [ 2] 1449 	pushw	x
      0088BC 4B 0F            [ 1] 1450 	push	#0x0f
      0088BE CD 80 DC         [ 4] 1451 	call	_PCF_Write
      0088C1 5B 04            [ 2] 1452 	addw	sp, #4
      0088C3 81               [ 4] 1453 	ret
                                   1454 ;	user/RTC_pcf8563.c: 443: uint8_t PCF_getTimer()
                                   1455 ;	-----------------------------------------
                                   1456 ;	 function PCF_getTimer
                                   1457 ;	-----------------------------------------
      0088C4                       1458 _PCF_getTimer:
      0088C4 88               [ 1] 1459 	push	a
                                   1460 ;	user/RTC_pcf8563.c: 446: PCF_Read(0x0F, &count, 1);				//Timer
      0088C5 96               [ 1] 1461 	ldw	x, sp
      0088C6 5C               [ 2] 1462 	incw	x
      0088C7 4B 01            [ 1] 1463 	push	#0x01
      0088C9 89               [ 2] 1464 	pushw	x
      0088CA 4B 0F            [ 1] 1465 	push	#0x0f
      0088CC CD 82 71         [ 4] 1466 	call	_PCF_Read
      0088CF 5B 04            [ 2] 1467 	addw	sp, #4
                                   1468 ;	user/RTC_pcf8563.c: 448: return count;
      0088D1 7B 01            [ 1] 1469 	ld	a, (0x01, sp)
      0088D3 5B 01            [ 2] 1470 	addw	sp, #1
      0088D5 81               [ 4] 1471 	ret
                                   1472 ;	user/RTC_pcf8563.c: 451: uint8_t PCF_getAlarm(PCF_Alarm *alarm)
                                   1473 ;	-----------------------------------------
                                   1474 ;	 function PCF_getAlarm
                                   1475 ;	-----------------------------------------
      0088D6                       1476 _PCF_getAlarm:
      0088D6 52 0F            [ 2] 1477 	sub	sp, #15
                                   1478 ;	user/RTC_pcf8563.c: 455: PCF_Read(0x09, buffer, sizeof(buffer));
      0088D8 96               [ 1] 1479 	ldw	x, sp
      0088D9 5C               [ 2] 1480 	incw	x
      0088DA 1F 08            [ 2] 1481 	ldw	(0x08, sp), x
      0088DC 1E 08            [ 2] 1482 	ldw	x, (0x08, sp)
      0088DE 4B 04            [ 1] 1483 	push	#0x04
      0088E0 89               [ 2] 1484 	pushw	x
      0088E1 4B 09            [ 1] 1485 	push	#0x09
      0088E3 CD 82 71         [ 4] 1486 	call	_PCF_Read
      0088E6 5B 04            [ 2] 1487 	addw	sp, #4
                                   1488 ;	user/RTC_pcf8563.c: 457: alarm->minute = (((buffer[0] >> 4) & 0x0F) * 10) + (buffer[0] & 0x0F);
      0088E8 16 12            [ 2] 1489 	ldw	y, (0x12, sp)
      0088EA 17 0B            [ 2] 1490 	ldw	(0x0b, sp), y
      0088EC 1E 08            [ 2] 1491 	ldw	x, (0x08, sp)
      0088EE F6               [ 1] 1492 	ld	a, (x)
      0088EF 90 97            [ 1] 1493 	ld	yl, a
      0088F1 4E               [ 1] 1494 	swap	a
      0088F2 A4 0F            [ 1] 1495 	and	a, #0x0f
      0088F4 A4 0F            [ 1] 1496 	and	a, #0x0f
      0088F6 97               [ 1] 1497 	ld	xl, a
      0088F7 A6 0A            [ 1] 1498 	ld	a, #0x0a
      0088F9 42               [ 4] 1499 	mul	x, a
      0088FA 90 9F            [ 1] 1500 	ld	a, yl
      0088FC A4 0F            [ 1] 1501 	and	a, #0x0f
      0088FE 6B 07            [ 1] 1502 	ld	(0x07, sp), a
      008900 9F               [ 1] 1503 	ld	a, xl
      008901 1B 07            [ 1] 1504 	add	a, (0x07, sp)
      008903 1E 0B            [ 2] 1505 	ldw	x, (0x0b, sp)
      008905 F7               [ 1] 1506 	ld	(x), a
                                   1507 ;	user/RTC_pcf8563.c: 458: alarm->hour = (((buffer[1] >> 4) & 0x0B) * 10) + (buffer[1] & 0x0F);
      008906 16 0B            [ 2] 1508 	ldw	y, (0x0b, sp)
      008908 90 5C            [ 2] 1509 	incw	y
      00890A 1E 08            [ 2] 1510 	ldw	x, (0x08, sp)
      00890C E6 01            [ 1] 1511 	ld	a, (0x1, x)
      00890E 6B 05            [ 1] 1512 	ld	(0x05, sp), a
      008910 7B 05            [ 1] 1513 	ld	a, (0x05, sp)
      008912 4E               [ 1] 1514 	swap	a
      008913 A4 0F            [ 1] 1515 	and	a, #0x0f
      008915 A4 0B            [ 1] 1516 	and	a, #0x0b
      008917 97               [ 1] 1517 	ld	xl, a
      008918 A6 0A            [ 1] 1518 	ld	a, #0x0a
      00891A 42               [ 4] 1519 	mul	x, a
      00891B 7B 05            [ 1] 1520 	ld	a, (0x05, sp)
      00891D A4 0F            [ 1] 1521 	and	a, #0x0f
      00891F 6B 0F            [ 1] 1522 	ld	(0x0f, sp), a
      008921 9F               [ 1] 1523 	ld	a, xl
      008922 1B 0F            [ 1] 1524 	add	a, (0x0f, sp)
      008924 90 F7            [ 1] 1525 	ld	(y), a
                                   1526 ;	user/RTC_pcf8563.c: 459: alarm->day = (((buffer[2] >> 4) & 0x0B) * 10) + (buffer[2] & 0x0F);
      008926 16 0B            [ 2] 1527 	ldw	y, (0x0b, sp)
      008928 72 A9 00 02      [ 2] 1528 	addw	y, #0x0002
      00892C 1E 08            [ 2] 1529 	ldw	x, (0x08, sp)
      00892E E6 02            [ 1] 1530 	ld	a, (0x2, x)
      008930 6B 0A            [ 1] 1531 	ld	(0x0a, sp), a
      008932 7B 0A            [ 1] 1532 	ld	a, (0x0a, sp)
      008934 4E               [ 1] 1533 	swap	a
      008935 A4 0F            [ 1] 1534 	and	a, #0x0f
      008937 A4 0B            [ 1] 1535 	and	a, #0x0b
      008939 97               [ 1] 1536 	ld	xl, a
      00893A A6 0A            [ 1] 1537 	ld	a, #0x0a
      00893C 42               [ 4] 1538 	mul	x, a
      00893D 7B 0A            [ 1] 1539 	ld	a, (0x0a, sp)
      00893F A4 0F            [ 1] 1540 	and	a, #0x0f
      008941 6B 0E            [ 1] 1541 	ld	(0x0e, sp), a
      008943 9F               [ 1] 1542 	ld	a, xl
      008944 1B 0E            [ 1] 1543 	add	a, (0x0e, sp)
      008946 90 F7            [ 1] 1544 	ld	(y), a
                                   1545 ;	user/RTC_pcf8563.c: 460: alarm->weekday = (((buffer[3] >> 4) & 0x08) * 10) + (buffer[3] & 0x07);
      008948 16 0B            [ 2] 1546 	ldw	y, (0x0b, sp)
      00894A 72 A9 00 03      [ 2] 1547 	addw	y, #0x0003
      00894E 1E 08            [ 2] 1548 	ldw	x, (0x08, sp)
      008950 E6 03            [ 1] 1549 	ld	a, (0x3, x)
      008952 6B 06            [ 1] 1550 	ld	(0x06, sp), a
      008954 7B 06            [ 1] 1551 	ld	a, (0x06, sp)
      008956 4E               [ 1] 1552 	swap	a
      008957 A4 0F            [ 1] 1553 	and	a, #0x0f
      008959 A4 08            [ 1] 1554 	and	a, #0x08
      00895B 97               [ 1] 1555 	ld	xl, a
      00895C A6 0A            [ 1] 1556 	ld	a, #0x0a
      00895E 42               [ 4] 1557 	mul	x, a
      00895F 7B 06            [ 1] 1558 	ld	a, (0x06, sp)
      008961 A4 07            [ 1] 1559 	and	a, #0x07
      008963 6B 0D            [ 1] 1560 	ld	(0x0d, sp), a
      008965 9F               [ 1] 1561 	ld	a, xl
      008966 1B 0D            [ 1] 1562 	add	a, (0x0d, sp)
      008968 90 F7            [ 1] 1563 	ld	(y), a
                                   1564 ;	user/RTC_pcf8563.c: 462: return 0;
      00896A 4F               [ 1] 1565 	clr	a
      00896B 5B 0F            [ 2] 1566 	addw	sp, #15
      00896D 81               [ 4] 1567 	ret
                                   1568 ;	user/RTC_pcf8563.c: 465: uint8_t PCF_getAndClearFlags()
                                   1569 ;	-----------------------------------------
                                   1570 ;	 function PCF_getAndClearFlags
                                   1571 ;	-----------------------------------------
      00896E                       1572 _PCF_getAndClearFlags:
      00896E 89               [ 2] 1573 	pushw	x
                                   1574 ;	user/RTC_pcf8563.c: 469: PCF_Read(0x01, &flags, 1);				//Control_status_2
      00896F 96               [ 1] 1575 	ldw	x, sp
      008970 5C               [ 2] 1576 	incw	x
      008971 5C               [ 2] 1577 	incw	x
      008972 4B 01            [ 1] 1578 	push	#0x01
      008974 89               [ 2] 1579 	pushw	x
      008975 4B 01            [ 1] 1580 	push	#0x01
      008977 CD 82 71         [ 4] 1581 	call	_PCF_Read
      00897A 5B 04            [ 2] 1582 	addw	sp, #4
                                   1583 ;	user/RTC_pcf8563.c: 470: cleared = flags & 0x13;
      00897C 7B 02            [ 1] 1584 	ld	a, (0x02, sp)
      00897E A4 13            [ 1] 1585 	and	a, #0x13
      008980 6B 01            [ 1] 1586 	ld	(0x01, sp), a
                                   1587 ;	user/RTC_pcf8563.c: 471: PCF_Write(0x01, &cleared, 1);			//Control_status_2
      008982 96               [ 1] 1588 	ldw	x, sp
      008983 5C               [ 2] 1589 	incw	x
      008984 4B 01            [ 1] 1590 	push	#0x01
      008986 89               [ 2] 1591 	pushw	x
      008987 4B 01            [ 1] 1592 	push	#0x01
      008989 CD 80 DC         [ 4] 1593 	call	_PCF_Write
      00898C 5B 04            [ 2] 1594 	addw	sp, #4
                                   1595 ;	user/RTC_pcf8563.c: 473: return flags & 0x0C;					//Mask unnecessary bits
      00898E 7B 02            [ 1] 1596 	ld	a, (0x02, sp)
      008990 A4 0C            [ 1] 1597 	and	a, #0x0c
      008992 85               [ 2] 1598 	popw	x
      008993 81               [ 4] 1599 	ret
                                   1600 ;	user/RTC_pcf8563.c: 476: void PCF_setClockOut(uint8_t mode)
                                   1601 ;	-----------------------------------------
                                   1602 ;	 function PCF_setClockOut
                                   1603 ;	-----------------------------------------
      008994                       1604 _PCF_setClockOut:
                                   1605 ;	user/RTC_pcf8563.c: 478: mode &= 0x13;
      008994 7B 03            [ 1] 1606 	ld	a, (0x03, sp)
      008996 A4 13            [ 1] 1607 	and	a, #0x13
      008998 6B 03            [ 1] 1608 	ld	(0x03, sp), a
                                   1609 ;	user/RTC_pcf8563.c: 479: PCF_Write(0x0D, &mode, 1);				//CLKOUT_control
      00899A 96               [ 1] 1610 	ldw	x, sp
      00899B 1C 00 03         [ 2] 1611 	addw	x, #3
      00899E 4B 01            [ 1] 1612 	push	#0x01
      0089A0 89               [ 2] 1613 	pushw	x
      0089A1 4B 0D            [ 1] 1614 	push	#0x0d
      0089A3 CD 80 DC         [ 4] 1615 	call	_PCF_Write
      0089A6 5B 04            [ 2] 1616 	addw	sp, #4
      0089A8 81               [ 4] 1617 	ret
                                   1618 	.area CODE
                                   1619 	.area INITIALIZER
      00991E                       1620 __xinit__timeout:
      00991E 00 00 A0 00           1621 	.byte #0x00,#0x00,#0xa0,#0x00	; 40960
                                   1622 	.area CABS (ABS)
