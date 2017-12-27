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
      0080A0 CD 91 0C         [ 4]   75 	call	_I2C_DeInit
                                     76 ;	user/RTC_pcf8563.c: 15: Input_Clock = CLK_GetClockFreq()/1000000;
      0080A3 CD 8F 38         [ 4]   77 	call	_CLK_GetClockFreq
      0080A6 4B 40            [ 1]   78 	push	#0x40
      0080A8 4B 42            [ 1]   79 	push	#0x42
      0080AA 4B 0F            [ 1]   80 	push	#0x0f
      0080AC 4B 00            [ 1]   81 	push	#0x00
      0080AE 89               [ 2]   82 	pushw	x
      0080AF 90 89            [ 2]   83 	pushw	y
      0080B1 CD 96 48         [ 4]   84 	call	__divulong
      0080B4 5B 08            [ 2]   85 	addw	sp, #8
      0080B6 9F               [ 1]   86 	ld	a, xl
                                     87 ;	user/RTC_pcf8563.c: 16: I2C_Cmd(ENABLE);
      0080B7 88               [ 1]   88 	push	a
      0080B8 4B 01            [ 1]   89 	push	#0x01
      0080BA CD 92 5F         [ 4]   90 	call	_I2C_Cmd
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
      0080D2 CD 91 31         [ 4]  104 	call	_I2C_Init
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
      0080E4 CD 92 BF         [ 4]  134 	call	_I2C_AcknowledgeConfig
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
      0080F4 CD 93 B6         [ 4]  145 	call	_I2C_GetFlagStatus
      0080F7 85               [ 2]  146 	popw	x
      0080F8 4D               [ 1]  147 	tnz	a
      0080F9 27 2F            [ 1]  148 	jreq	00105$
                                    149 ;	user/RTC_pcf8563.c: 53: if(!timeout--)
      0080FB 16 04            [ 2]  150 	ldw	y, (0x04, sp)
      0080FD 17 14            [ 2]  151 	ldw	(0x14, sp), y
      0080FF 16 02            [ 2]  152 	ldw	y, (0x02, sp)
      008101 17 12            [ 2]  153 	ldw	(0x12, sp), y
      008103 1E 04            [ 2]  154 	ldw	x, (0x04, sp)
      008105 1D 00 01         [ 2]  155 	subw	x, #0x0001
      008108 1F 1B            [ 2]  156 	ldw	(0x1b, sp), x
      00810A 7B 03            [ 1]  157 	ld	a, (0x03, sp)
      00810C A2 00            [ 1]  158 	sbc	a, #0x00
      00810E 6B 1A            [ 1]  159 	ld	(0x1a, sp), a
      008110 7B 02            [ 1]  160 	ld	a, (0x02, sp)
      008112 A2 00            [ 1]  161 	sbc	a, #0x00
      008114 6B 19            [ 1]  162 	ld	(0x19, sp), a
      008116 16 1B            [ 2]  163 	ldw	y, (0x1b, sp)
      008118 17 04            [ 2]  164 	ldw	(0x04, sp), y
      00811A 16 19            [ 2]  165 	ldw	y, (0x19, sp)
      00811C 17 02            [ 2]  166 	ldw	(0x02, sp), y
      00811E 1E 14            [ 2]  167 	ldw	x, (0x14, sp)
      008120 26 CE            [ 1]  168 	jrne	00103$
      008122 1E 12            [ 2]  169 	ldw	x, (0x12, sp)
      008124 26 CA            [ 1]  170 	jrne	00103$
                                    171 ;	user/RTC_pcf8563.c: 56: return res;
      008126 4F               [ 1]  172 	clr	a
      008127 CC 82 6E         [ 2]  173 	jp	00133$
      00812A                        174 00105$:
                                    175 ;	user/RTC_pcf8563.c: 60: I2C_GenerateSTART(ENABLE);
      00812A 4B 01            [ 1]  176 	push	#0x01
      00812C CD 92 81         [ 4]  177 	call	_I2C_GenerateSTART
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
      00813C CD 93 3B         [ 4]  188 	call	_I2C_CheckEvent
      00813F 85               [ 2]  189 	popw	x
      008140 6B 18            [ 1]  190 	ld	(0x18, sp), a
      008142 0D 18            [ 1]  191 	tnz	(0x18, sp)
      008144 26 29            [ 1]  192 	jrne	00110$
                                    193 ;	user/RTC_pcf8563.c: 66: if(!timeout--) 
      008146 16 04            [ 2]  194 	ldw	y, (0x04, sp)
      008148 17 23            [ 2]  195 	ldw	(0x23, sp), y
      00814A 16 02            [ 2]  196 	ldw	y, (0x02, sp)
      00814C 17 21            [ 2]  197 	ldw	(0x21, sp), y
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
      008162 1E 23            [ 2]  208 	ldw	x, (0x23, sp)
      008164 26 D2            [ 1]  209 	jrne	00108$
      008166 1E 21            [ 2]  210 	ldw	x, (0x21, sp)
      008168 26 CE            [ 1]  211 	jrne	00108$
                                    212 ;	user/RTC_pcf8563.c: 68: res = 0;
      00816A 0F 01            [ 1]  213 	clr	(0x01, sp)
                                    214 ;	user/RTC_pcf8563.c: 69: goto stop;
      00816C CC 82 66         [ 2]  215 	jp	00132$
      00816F                        216 00110$:
                                    217 ;	user/RTC_pcf8563.c: 73: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
      00816F 4B 00            [ 1]  218 	push	#0x00
      008171 4B A2            [ 1]  219 	push	#0xa2
      008173 CD 93 25         [ 4]  220 	call	_I2C_Send7bitAddress
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
      008183 CD 93 3B         [ 4]  231 	call	_I2C_CheckEvent
      008186 85               [ 2]  232 	popw	x
      008187 4D               [ 1]  233 	tnz	a
      008188 26 42            [ 1]  234 	jrne	00118$
                                    235 ;	user/RTC_pcf8563.c: 78: if(!timeout--)
      00818A 16 02            [ 2]  236 	ldw	y, (0x02, sp)
      00818C 17 0E            [ 2]  237 	ldw	(0x0e, sp), y
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
      0081AB 1E 0E            [ 2]  252 	ldw	x, (0x0e, sp)
      0081AD 26 05            [ 1]  253 	jrne	00114$
                                    254 ;	user/RTC_pcf8563.c: 80: res = 0;
      0081AF 0F 01            [ 1]  255 	clr	(0x01, sp)
                                    256 ;	user/RTC_pcf8563.c: 81: goto stop;
      0081B1 CC 82 66         [ 2]  257 	jp	00132$
      0081B4                        258 00114$:
                                    259 ;	user/RTC_pcf8563.c: 83: else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
      0081B4 4B 04            [ 1]  260 	push	#0x04
      0081B6 4B 02            [ 1]  261 	push	#0x02
      0081B8 CD 93 B6         [ 4]  262 	call	_I2C_GetFlagStatus
      0081BB 85               [ 2]  263 	popw	x
      0081BC 4D               [ 1]  264 	tnz	a
      0081BD 27 C0            [ 1]  265 	jreq	00116$
                                    266 ;	user/RTC_pcf8563.c: 85: I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
      0081BF 4B 04            [ 1]  267 	push	#0x04
      0081C1 4B 02            [ 1]  268 	push	#0x02
      0081C3 CD 93 ED         [ 4]  269 	call	_I2C_ClearFlag
      0081C6 85               [ 2]  270 	popw	x
                                    271 ;	user/RTC_pcf8563.c: 86: res = 0;
      0081C7 0F 01            [ 1]  272 	clr	(0x01, sp)
                                    273 ;	user/RTC_pcf8563.c: 87: goto stop;
      0081C9 CC 82 66         [ 2]  274 	jp	00132$
      0081CC                        275 00118$:
                                    276 ;	user/RTC_pcf8563.c: 91: I2C_SendData(addr);
      0081CC 7B 28            [ 1]  277 	ld	a, (0x28, sp)
      0081CE 88               [ 1]  278 	push	a
      0081CF CD 93 34         [ 4]  279 	call	_I2C_SendData
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
      0081DF CD 93 3B         [ 4]  290 	call	_I2C_CheckEvent
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
      008210 17 16            [ 2]  320 	ldw	(0x16, sp), y
      008212 7B 2B            [ 1]  321 	ld	a, (0x2b, sp)
      008214 6B 25            [ 1]  322 	ld	(0x25, sp), a
      008216                        323 00129$:
      008216 0D 25            [ 1]  324 	tnz	(0x25, sp)
      008218 27 4C            [ 1]  325 	jreq	00132$
                                    326 ;	user/RTC_pcf8563.c: 105: I2C_SendData(*data);
      00821A 1E 16            [ 2]  327 	ldw	x, (0x16, sp)
      00821C F6               [ 1]  328 	ld	a, (x)
      00821D 88               [ 1]  329 	push	a
      00821E CD 93 34         [ 4]  330 	call	_I2C_SendData
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
      00822E CD 93 3B         [ 4]  341 	call	_I2C_CheckEvent
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
      00825D 1E 16            [ 2]  370 	ldw	x, (0x16, sp)
      00825F 5C               [ 2]  371 	incw	x
      008260 1F 16            [ 2]  372 	ldw	(0x16, sp), x
                                    373 ;	user/RTC_pcf8563.c: 117: count--;
      008262 0A 25            [ 1]  374 	dec	(0x25, sp)
      008264 20 B0            [ 2]  375 	jra	00129$
                                    376 ;	user/RTC_pcf8563.c: 120: stop: I2C_GenerateSTOP(ENABLE);
      008266                        377 00132$:
      008266 4B 01            [ 1]  378 	push	#0x01
      008268 CD 92 8F         [ 4]  379 	call	_I2C_GenerateSTOP
      00826B 84               [ 1]  380 	pop	a
                                    381 ;	user/RTC_pcf8563.c: 121: return res;
      00826C 7B 01            [ 1]  382 	ld	a, (0x01, sp)
      00826E                        383 00133$:
      00826E 5B 25            [ 2]  384 	addw	sp, #37
      008270 81               [ 4]  385 	ret
                                    386 ;	user/RTC_pcf8563.c: 124: void PCF_Read(uint8_t addr, uint8_t *data, uint8_t count)
                                    387 ;	-----------------------------------------
                                    388 ;	 function PCF_Read
                                    389 ;	-----------------------------------------
      008271                        390 _PCF_Read:
      008271 52 03            [ 2]  391 	sub	sp, #3
                                    392 ;	user/RTC_pcf8563.c: 127: I2C_GenerateSTART(ENABLE);
      008273 4B 01            [ 1]  393 	push	#0x01
      008275 CD 92 81         [ 4]  394 	call	_I2C_GenerateSTART
      008278 84               [ 1]  395 	pop	a
                                    396 ;	user/RTC_pcf8563.c: 129: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
      008279                        397 00101$:
      008279 4B 01            [ 1]  398 	push	#0x01
      00827B 4B 03            [ 1]  399 	push	#0x03
      00827D CD 93 3B         [ 4]  400 	call	_I2C_CheckEvent
      008280 85               [ 2]  401 	popw	x
      008281 4D               [ 1]  402 	tnz	a
      008282 27 F5            [ 1]  403 	jreq	00101$
                                    404 ;	user/RTC_pcf8563.c: 131: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
      008284 4B 00            [ 1]  405 	push	#0x00
      008286 4B A2            [ 1]  406 	push	#0xa2
      008288 CD 93 25         [ 4]  407 	call	_I2C_Send7bitAddress
      00828B 85               [ 2]  408 	popw	x
                                    409 ;	user/RTC_pcf8563.c: 132: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
      00828C                        410 00104$:
      00828C 4B 82            [ 1]  411 	push	#0x82
      00828E 4B 07            [ 1]  412 	push	#0x07
      008290 CD 93 3B         [ 4]  413 	call	_I2C_CheckEvent
      008293 85               [ 2]  414 	popw	x
      008294 4D               [ 1]  415 	tnz	a
      008295 27 F5            [ 1]  416 	jreq	00104$
                                    417 ;	user/RTC_pcf8563.c: 134: I2C_SendData(addr);
      008297 7B 06            [ 1]  418 	ld	a, (0x06, sp)
      008299 88               [ 1]  419 	push	a
      00829A CD 93 34         [ 4]  420 	call	_I2C_SendData
      00829D 84               [ 1]  421 	pop	a
                                    422 ;	user/RTC_pcf8563.c: 135: while(!I2C_CheckEvent(I2C_FLAG_TRANSFERFINISHED));
      00829E                        423 00107$:
      00829E 4B 04            [ 1]  424 	push	#0x04
      0082A0 4B 01            [ 1]  425 	push	#0x01
      0082A2 CD 93 3B         [ 4]  426 	call	_I2C_CheckEvent
      0082A5 85               [ 2]  427 	popw	x
      0082A6 4D               [ 1]  428 	tnz	a
      0082A7 27 F5            [ 1]  429 	jreq	00107$
                                    430 ;	user/RTC_pcf8563.c: 138: I2C_GenerateSTART(ENABLE);
      0082A9 4B 01            [ 1]  431 	push	#0x01
      0082AB CD 92 81         [ 4]  432 	call	_I2C_GenerateSTART
      0082AE 84               [ 1]  433 	pop	a
                                    434 ;	user/RTC_pcf8563.c: 139: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
      0082AF                        435 00110$:
      0082AF 4B 01            [ 1]  436 	push	#0x01
      0082B1 4B 03            [ 1]  437 	push	#0x03
      0082B3 CD 93 3B         [ 4]  438 	call	_I2C_CheckEvent
      0082B6 85               [ 2]  439 	popw	x
      0082B7 4D               [ 1]  440 	tnz	a
      0082B8 27 F5            [ 1]  441 	jreq	00110$
                                    442 ;	user/RTC_pcf8563.c: 140: I2C_Send7bitAddress(PCF8563_READ_ADDR, I2C_DIRECTION_RX);
      0082BA 4B 01            [ 1]  443 	push	#0x01
      0082BC 4B A3            [ 1]  444 	push	#0xa3
      0082BE CD 93 25         [ 4]  445 	call	_I2C_Send7bitAddress
      0082C1 85               [ 2]  446 	popw	x
                                    447 ;	user/RTC_pcf8563.c: 142: while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
      0082C2                        448 00113$:
      0082C2 4B 02            [ 1]  449 	push	#0x02
      0082C4 4B 03            [ 1]  450 	push	#0x03
      0082C6 CD 93 3B         [ 4]  451 	call	_I2C_CheckEvent
      0082C9 85               [ 2]  452 	popw	x
      0082CA 4D               [ 1]  453 	tnz	a
      0082CB 27 F5            [ 1]  454 	jreq	00113$
                                    455 ;	user/RTC_pcf8563.c: 143: while(count)
      0082CD 16 07            [ 2]  456 	ldw	y, (0x07, sp)
      0082CF 17 02            [ 2]  457 	ldw	(0x02, sp), y
      0082D1 7B 09            [ 1]  458 	ld	a, (0x09, sp)
      0082D3 6B 01            [ 1]  459 	ld	(0x01, sp), a
      0082D5                        460 00127$:
      0082D5 0D 01            [ 1]  461 	tnz	(0x01, sp)
      0082D7 27 46            [ 1]  462 	jreq	00130$
                                    463 ;	user/RTC_pcf8563.c: 146: while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);
      0082D9                        464 00116$:
      0082D9 4B 04            [ 1]  465 	push	#0x04
      0082DB 4B 01            [ 1]  466 	push	#0x01
      0082DD CD 93 B6         [ 4]  467 	call	_I2C_GetFlagStatus
      0082E0 85               [ 2]  468 	popw	x
      0082E1 4D               [ 1]  469 	tnz	a
      0082E2 27 F5            [ 1]  470 	jreq	00116$
                                    471 ;	user/RTC_pcf8563.c: 148: if(count == 0)
      0082E4 0D 01            [ 1]  472 	tnz	(0x01, sp)
      0082E6 26 0C            [ 1]  473 	jrne	00120$
                                    474 ;	user/RTC_pcf8563.c: 150: I2C_AcknowledgeConfig(I2C_ACK_NONE);
      0082E8 4B 00            [ 1]  475 	push	#0x00
      0082EA CD 92 BF         [ 4]  476 	call	_I2C_AcknowledgeConfig
      0082ED 84               [ 1]  477 	pop	a
                                    478 ;	user/RTC_pcf8563.c: 151: I2C_GenerateSTOP(ENABLE);
      0082EE 4B 01            [ 1]  479 	push	#0x01
      0082F0 CD 92 8F         [ 4]  480 	call	_I2C_GenerateSTOP
      0082F3 84               [ 1]  481 	pop	a
      0082F4                        482 00120$:
                                    483 ;	user/RTC_pcf8563.c: 153: I2C_AcknowledgeConfig(I2C_ACK_CURR);
      0082F4 4B 01            [ 1]  484 	push	#0x01
      0082F6 CD 92 BF         [ 4]  485 	call	_I2C_AcknowledgeConfig
      0082F9 84               [ 1]  486 	pop	a
                                    487 ;	user/RTC_pcf8563.c: 158: while (I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) == RESET);
      0082FA                        488 00121$:
      0082FA 4B 40            [ 1]  489 	push	#0x40
      0082FC 4B 01            [ 1]  490 	push	#0x01
      0082FE CD 93 B6         [ 4]  491 	call	_I2C_GetFlagStatus
      008301 85               [ 2]  492 	popw	x
      008302 4D               [ 1]  493 	tnz	a
      008303 27 F5            [ 1]  494 	jreq	00121$
                                    495 ;	user/RTC_pcf8563.c: 159: while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED));
      008305                        496 00124$:
      008305 4B 40            [ 1]  497 	push	#0x40
      008307 4B 03            [ 1]  498 	push	#0x03
      008309 CD 93 3B         [ 4]  499 	call	_I2C_CheckEvent
      00830C 85               [ 2]  500 	popw	x
      00830D 4D               [ 1]  501 	tnz	a
      00830E 27 F5            [ 1]  502 	jreq	00124$
                                    503 ;	user/RTC_pcf8563.c: 161: *data = I2C_ReceiveData();
      008310 CD 93 20         [ 4]  504 	call	_I2C_ReceiveData
      008313 1E 02            [ 2]  505 	ldw	x, (0x02, sp)
      008315 F7               [ 1]  506 	ld	(x), a
                                    507 ;	user/RTC_pcf8563.c: 162: data++;
      008316 1E 02            [ 2]  508 	ldw	x, (0x02, sp)
      008318 5C               [ 2]  509 	incw	x
      008319 1F 02            [ 2]  510 	ldw	(0x02, sp), x
                                    511 ;	user/RTC_pcf8563.c: 163: count--;
      00831B 0A 01            [ 1]  512 	dec	(0x01, sp)
      00831D 20 B6            [ 2]  513 	jra	00127$
      00831F                        514 00130$:
      00831F 5B 03            [ 2]  515 	addw	sp, #3
      008321 81               [ 4]  516 	ret
                                    517 ;	user/RTC_pcf8563.c: 253: uint8_t PCF_getDateTime(PCF_DateTime *dateTime)
                                    518 ;	-----------------------------------------
                                    519 ;	 function PCF_getDateTime
                                    520 ;	-----------------------------------------
      008322                        521 _PCF_getDateTime:
      008322 52 1C            [ 2]  522 	sub	sp, #28
                                    523 ;	user/RTC_pcf8563.c: 257: PCF_Read(0x02, buffer, sizeof(buffer));
      008324 96               [ 1]  524 	ldw	x, sp
      008325 5C               [ 2]  525 	incw	x
      008326 1F 1A            [ 2]  526 	ldw	(0x1a, sp), x
      008328 1E 1A            [ 2]  527 	ldw	x, (0x1a, sp)
      00832A 4B 07            [ 1]  528 	push	#0x07
      00832C 89               [ 2]  529 	pushw	x
      00832D 4B 02            [ 1]  530 	push	#0x02
      00832F CD 82 71         [ 4]  531 	call	_PCF_Read
      008332 5B 04            [ 2]  532 	addw	sp, #4
                                    533 ;	user/RTC_pcf8563.c: 259: dateTime->second = (((buffer[0] >> 4) & 0x07) * 10) + (buffer[0] & 0x0F);
      008334 16 1F            [ 2]  534 	ldw	y, (0x1f, sp)
      008336 17 11            [ 2]  535 	ldw	(0x11, sp), y
      008338 1E 1A            [ 2]  536 	ldw	x, (0x1a, sp)
      00833A F6               [ 1]  537 	ld	a, (x)
      00833B 6B 1C            [ 1]  538 	ld	(0x1c, sp), a
      00833D 7B 1C            [ 1]  539 	ld	a, (0x1c, sp)
      00833F 4E               [ 1]  540 	swap	a
      008340 A4 0F            [ 1]  541 	and	a, #0x0f
      008342 A4 07            [ 1]  542 	and	a, #0x07
      008344 97               [ 1]  543 	ld	xl, a
      008345 A6 0A            [ 1]  544 	ld	a, #0x0a
      008347 42               [ 4]  545 	mul	x, a
      008348 7B 1C            [ 1]  546 	ld	a, (0x1c, sp)
      00834A A4 0F            [ 1]  547 	and	a, #0x0f
      00834C 6B 0B            [ 1]  548 	ld	(0x0b, sp), a
      00834E 9F               [ 1]  549 	ld	a, xl
      00834F 1B 0B            [ 1]  550 	add	a, (0x0b, sp)
      008351 1E 11            [ 2]  551 	ldw	x, (0x11, sp)
      008353 F7               [ 1]  552 	ld	(x), a
                                    553 ;	user/RTC_pcf8563.c: 260: dateTime->minute = (((buffer[1] >> 4) & 0x07) * 10) + (buffer[1] & 0x0F);
      008354 1E 11            [ 2]  554 	ldw	x, (0x11, sp)
      008356 5C               [ 2]  555 	incw	x
      008357 1F 18            [ 2]  556 	ldw	(0x18, sp), x
      008359 1E 1A            [ 2]  557 	ldw	x, (0x1a, sp)
      00835B E6 01            [ 1]  558 	ld	a, (0x1, x)
      00835D 6B 0F            [ 1]  559 	ld	(0x0f, sp), a
      00835F 7B 0F            [ 1]  560 	ld	a, (0x0f, sp)
      008361 4E               [ 1]  561 	swap	a
      008362 A4 0F            [ 1]  562 	and	a, #0x0f
      008364 A4 07            [ 1]  563 	and	a, #0x07
      008366 97               [ 1]  564 	ld	xl, a
      008367 A6 0A            [ 1]  565 	ld	a, #0x0a
      008369 42               [ 4]  566 	mul	x, a
      00836A 7B 0F            [ 1]  567 	ld	a, (0x0f, sp)
      00836C A4 0F            [ 1]  568 	and	a, #0x0f
      00836E 6B 10            [ 1]  569 	ld	(0x10, sp), a
      008370 9F               [ 1]  570 	ld	a, xl
      008371 1B 10            [ 1]  571 	add	a, (0x10, sp)
      008373 1E 18            [ 2]  572 	ldw	x, (0x18, sp)
      008375 F7               [ 1]  573 	ld	(x), a
                                    574 ;	user/RTC_pcf8563.c: 261: dateTime->hour = (((buffer[2] >> 4) & 0x03) * 10) + (buffer[2] & 0x0F);
      008376 16 11            [ 2]  575 	ldw	y, (0x11, sp)
      008378 72 A9 00 02      [ 2]  576 	addw	y, #0x0002
      00837C 1E 1A            [ 2]  577 	ldw	x, (0x1a, sp)
      00837E E6 02            [ 1]  578 	ld	a, (0x2, x)
      008380 6B 14            [ 1]  579 	ld	(0x14, sp), a
      008382 7B 14            [ 1]  580 	ld	a, (0x14, sp)
      008384 4E               [ 1]  581 	swap	a
      008385 A4 0F            [ 1]  582 	and	a, #0x0f
      008387 A4 03            [ 1]  583 	and	a, #0x03
      008389 97               [ 1]  584 	ld	xl, a
      00838A A6 0A            [ 1]  585 	ld	a, #0x0a
      00838C 42               [ 4]  586 	mul	x, a
      00838D 7B 14            [ 1]  587 	ld	a, (0x14, sp)
      00838F A4 0F            [ 1]  588 	and	a, #0x0f
      008391 6B 0A            [ 1]  589 	ld	(0x0a, sp), a
      008393 9F               [ 1]  590 	ld	a, xl
      008394 1B 0A            [ 1]  591 	add	a, (0x0a, sp)
      008396 90 F7            [ 1]  592 	ld	(y), a
                                    593 ;	user/RTC_pcf8563.c: 262: dateTime->day = (((buffer[3] >> 4) & 0x03) * 10) + (buffer[3] & 0x0F);
      008398 16 11            [ 2]  594 	ldw	y, (0x11, sp)
      00839A 72 A9 00 03      [ 2]  595 	addw	y, #0x0003
      00839E 1E 1A            [ 2]  596 	ldw	x, (0x1a, sp)
      0083A0 E6 03            [ 1]  597 	ld	a, (0x3, x)
      0083A2 6B 17            [ 1]  598 	ld	(0x17, sp), a
      0083A4 7B 17            [ 1]  599 	ld	a, (0x17, sp)
      0083A6 4E               [ 1]  600 	swap	a
      0083A7 A4 0F            [ 1]  601 	and	a, #0x0f
      0083A9 A4 03            [ 1]  602 	and	a, #0x03
      0083AB 97               [ 1]  603 	ld	xl, a
      0083AC A6 0A            [ 1]  604 	ld	a, #0x0a
      0083AE 42               [ 4]  605 	mul	x, a
      0083AF 7B 17            [ 1]  606 	ld	a, (0x17, sp)
      0083B1 A4 0F            [ 1]  607 	and	a, #0x0f
      0083B3 6B 0E            [ 1]  608 	ld	(0x0e, sp), a
      0083B5 9F               [ 1]  609 	ld	a, xl
      0083B6 1B 0E            [ 1]  610 	add	a, (0x0e, sp)
      0083B8 90 F7            [ 1]  611 	ld	(y), a
                                    612 ;	user/RTC_pcf8563.c: 263: dateTime->weekday = (buffer[4] & 0x07);
      0083BA 1E 11            [ 2]  613 	ldw	x, (0x11, sp)
      0083BC 1C 00 04         [ 2]  614 	addw	x, #0x0004
      0083BF 16 1A            [ 2]  615 	ldw	y, (0x1a, sp)
      0083C1 90 E6 04         [ 1]  616 	ld	a, (0x4, y)
      0083C4 A4 07            [ 1]  617 	and	a, #0x07
      0083C6 F7               [ 1]  618 	ld	(x), a
                                    619 ;	user/RTC_pcf8563.c: 264: dateTime->month = ((buffer[5] >> 4) & 0x01) * 10 + (buffer[5] & 0x0F);
      0083C7 16 11            [ 2]  620 	ldw	y, (0x11, sp)
      0083C9 72 A9 00 05      [ 2]  621 	addw	y, #0x0005
      0083CD 1E 1A            [ 2]  622 	ldw	x, (0x1a, sp)
      0083CF 1C 00 05         [ 2]  623 	addw	x, #0x0005
      0083D2 1F 08            [ 2]  624 	ldw	(0x08, sp), x
      0083D4 1E 08            [ 2]  625 	ldw	x, (0x08, sp)
      0083D6 F6               [ 1]  626 	ld	a, (x)
      0083D7 88               [ 1]  627 	push	a
      0083D8 44               [ 1]  628 	srl	a
      0083D9 44               [ 1]  629 	srl	a
      0083DA 44               [ 1]  630 	srl	a
      0083DB 44               [ 1]  631 	srl	a
      0083DC A4 01            [ 1]  632 	and	a, #0x01
      0083DE 97               [ 1]  633 	ld	xl, a
      0083DF A6 0A            [ 1]  634 	ld	a, #0x0a
      0083E1 42               [ 4]  635 	mul	x, a
      0083E2 84               [ 1]  636 	pop	a
      0083E3 A4 0F            [ 1]  637 	and	a, #0x0f
      0083E5 6B 13            [ 1]  638 	ld	(0x13, sp), a
      0083E7 9F               [ 1]  639 	ld	a, xl
      0083E8 1B 13            [ 1]  640 	add	a, (0x13, sp)
      0083EA 90 F7            [ 1]  641 	ld	(y), a
                                    642 ;	user/RTC_pcf8563.c: 265: dateTime->year = 1900 + ((buffer[6] >> 4) & 0x0F) * 10 + (buffer[6] & 0x0F);
      0083EC 1E 11            [ 2]  643 	ldw	x, (0x11, sp)
      0083EE 1C 00 06         [ 2]  644 	addw	x, #0x0006
      0083F1 1F 15            [ 2]  645 	ldw	(0x15, sp), x
      0083F3 1E 1A            [ 2]  646 	ldw	x, (0x1a, sp)
      0083F5 E6 06            [ 1]  647 	ld	a, (0x6, x)
      0083F7 97               [ 1]  648 	ld	xl, a
      0083F8 4E               [ 1]  649 	swap	a
      0083F9 A4 0F            [ 1]  650 	and	a, #0x0f
      0083FB A4 0F            [ 1]  651 	and	a, #0x0f
      0083FD 61               [ 1]  652 	exg	a, yl
      0083FE A6 0A            [ 1]  653 	ld	a, #0x0a
      008400 61               [ 1]  654 	exg	a, yl
      008401 90 42            [ 4]  655 	mul	y, a
      008403 72 A9 07 6C      [ 2]  656 	addw	y, #0x076c
      008407 9F               [ 1]  657 	ld	a, xl
      008408 A4 0F            [ 1]  658 	and	a, #0x0f
      00840A 6B 0D            [ 1]  659 	ld	(0x0d, sp), a
      00840C 0F 0C            [ 1]  660 	clr	(0x0c, sp)
      00840E 72 F9 0C         [ 2]  661 	addw	y, (0x0c, sp)
      008411 1E 15            [ 2]  662 	ldw	x, (0x15, sp)
      008413 FF               [ 2]  663 	ldw	(x), y
                                    664 ;	user/RTC_pcf8563.c: 267: if (buffer[5] &  0x80)
      008414 1E 08            [ 2]  665 	ldw	x, (0x08, sp)
      008416 F6               [ 1]  666 	ld	a, (x)
      008417 4D               [ 1]  667 	tnz	a
      008418 2A 0A            [ 1]  668 	jrpl	00102$
                                    669 ;	user/RTC_pcf8563.c: 269: dateTime->year += 100;
      00841A 1E 15            [ 2]  670 	ldw	x, (0x15, sp)
      00841C FE               [ 2]  671 	ldw	x, (x)
      00841D 1C 00 64         [ 2]  672 	addw	x, #0x0064
      008420 16 15            [ 2]  673 	ldw	y, (0x15, sp)
      008422 90 FF            [ 2]  674 	ldw	(y), x
      008424                        675 00102$:
                                    676 ;	user/RTC_pcf8563.c: 272: if (buffer[0] & 0x80) //Clock integrity not guaranted
      008424 1E 1A            [ 2]  677 	ldw	x, (0x1a, sp)
      008426 F6               [ 1]  678 	ld	a, (x)
      008427 4D               [ 1]  679 	tnz	a
      008428 2A 03            [ 1]  680 	jrpl	00104$
                                    681 ;	user/RTC_pcf8563.c: 274: return 1;
      00842A A6 01            [ 1]  682 	ld	a, #0x01
                                    683 ;	user/RTC_pcf8563.c: 277: return 0;
      00842C 21                     684 	.byte 0x21
      00842D                        685 00104$:
      00842D 4F               [ 1]  686 	clr	a
      00842E                        687 00105$:
      00842E 5B 1C            [ 2]  688 	addw	sp, #28
      008430 81               [ 4]  689 	ret
                                    690 ;	user/RTC_pcf8563.c: 282: void PCF_Init(uint8_t mode)
                                    691 ;	-----------------------------------------
                                    692 ;	 function PCF_Init
                                    693 ;	-----------------------------------------
      008431                        694 _PCF_Init:
      008431 88               [ 1]  695 	push	a
                                    696 ;	user/RTC_pcf8563.c: 284: uint8_t tmp = 0x00;
      008432 0F 01            [ 1]  697 	clr	(0x01, sp)
                                    698 ;	user/RTC_pcf8563.c: 285: I2C_setup();
      008434 CD 80 A0         [ 4]  699 	call	_I2C_setup
                                    700 ;	user/RTC_pcf8563.c: 288: PCF_Write(0x00, &tmp, 1);
      008437 96               [ 1]  701 	ldw	x, sp
      008438 5C               [ 2]  702 	incw	x
      008439 4B 01            [ 1]  703 	push	#0x01
      00843B 89               [ 2]  704 	pushw	x
      00843C 4B 00            [ 1]  705 	push	#0x00
      00843E CD 80 DC         [ 4]  706 	call	_PCF_Write
      008441 5B 04            [ 2]  707 	addw	sp, #4
                                    708 ;	user/RTC_pcf8563.c: 289: mode &= 0x13;
      008443 7B 04            [ 1]  709 	ld	a, (0x04, sp)
      008445 A4 13            [ 1]  710 	and	a, #0x13
      008447 6B 04            [ 1]  711 	ld	(0x04, sp), a
                                    712 ;	user/RTC_pcf8563.c: 292: PCF_Write(0x00, &mode, 1);
      008449 96               [ 1]  713 	ldw	x, sp
      00844A 1C 00 04         [ 2]  714 	addw	x, #4
      00844D 4B 01            [ 1]  715 	push	#0x01
      00844F 89               [ 2]  716 	pushw	x
      008450 4B 00            [ 1]  717 	push	#0x00
      008452 CD 80 DC         [ 4]  718 	call	_PCF_Write
      008455 5B 05            [ 2]  719 	addw	sp, #5
      008457 81               [ 4]  720 	ret
                                    721 ;	user/RTC_pcf8563.c: 295: uint8_t PCF_setDateTime(PCF_DateTime *dateTime)
                                    722 ;	-----------------------------------------
                                    723 ;	 function PCF_setDateTime
                                    724 ;	-----------------------------------------
      008458                        725 _PCF_setDateTime:
      008458 52 26            [ 2]  726 	sub	sp, #38
                                    727 ;	user/RTC_pcf8563.c: 298: if (dateTime->second >= 60 || dateTime->minute >= 60 || dateTime->hour >= 24 || dateTime->day > 32 || dateTime->weekday > 6 || dateTime->month > 12 || dateTime->year < 1900 || dateTime->year >= 2100)
      00845A 16 29            [ 2]  728 	ldw	y, (0x29, sp)
      00845C 17 13            [ 2]  729 	ldw	(0x13, sp), y
      00845E 1E 13            [ 2]  730 	ldw	x, (0x13, sp)
      008460 F6               [ 1]  731 	ld	a, (x)
      008461 6B 20            [ 1]  732 	ld	(0x20, sp), a
      008463 7B 20            [ 1]  733 	ld	a, (0x20, sp)
      008465 A1 3C            [ 1]  734 	cp	a, #0x3c
      008467 24 55            [ 1]  735 	jrnc	00101$
      008469 16 13            [ 2]  736 	ldw	y, (0x13, sp)
      00846B 90 5C            [ 2]  737 	incw	y
      00846D 90 F6            [ 1]  738 	ld	a, (y)
      00846F A1 3C            [ 1]  739 	cp	a, #0x3c
      008471 24 4B            [ 1]  740 	jrnc	00101$
      008473 1E 13            [ 2]  741 	ldw	x, (0x13, sp)
      008475 5C               [ 2]  742 	incw	x
      008476 5C               [ 2]  743 	incw	x
      008477 1F 25            [ 2]  744 	ldw	(0x25, sp), x
      008479 1E 25            [ 2]  745 	ldw	x, (0x25, sp)
      00847B F6               [ 1]  746 	ld	a, (x)
      00847C A1 18            [ 1]  747 	cp	a, #0x18
      00847E 24 3E            [ 1]  748 	jrnc	00101$
      008480 1E 13            [ 2]  749 	ldw	x, (0x13, sp)
      008482 1C 00 03         [ 2]  750 	addw	x, #0x0003
      008485 1F 11            [ 2]  751 	ldw	(0x11, sp), x
      008487 1E 11            [ 2]  752 	ldw	x, (0x11, sp)
      008489 F6               [ 1]  753 	ld	a, (x)
      00848A A1 20            [ 1]  754 	cp	a, #0x20
      00848C 22 30            [ 1]  755 	jrugt	00101$
      00848E 1E 13            [ 2]  756 	ldw	x, (0x13, sp)
      008490 1C 00 04         [ 2]  757 	addw	x, #0x0004
      008493 1F 0D            [ 2]  758 	ldw	(0x0d, sp), x
      008495 1E 0D            [ 2]  759 	ldw	x, (0x0d, sp)
      008497 F6               [ 1]  760 	ld	a, (x)
      008498 A1 06            [ 1]  761 	cp	a, #0x06
      00849A 22 22            [ 1]  762 	jrugt	00101$
      00849C 1E 13            [ 2]  763 	ldw	x, (0x13, sp)
      00849E 1C 00 05         [ 2]  764 	addw	x, #0x0005
      0084A1 1F 18            [ 2]  765 	ldw	(0x18, sp), x
      0084A3 1E 18            [ 2]  766 	ldw	x, (0x18, sp)
      0084A5 F6               [ 1]  767 	ld	a, (x)
      0084A6 A1 0C            [ 1]  768 	cp	a, #0x0c
      0084A8 22 14            [ 1]  769 	jrugt	00101$
      0084AA 1E 13            [ 2]  770 	ldw	x, (0x13, sp)
      0084AC 1C 00 06         [ 2]  771 	addw	x, #0x0006
      0084AF 1F 1E            [ 2]  772 	ldw	(0x1e, sp), x
      0084B1 1E 1E            [ 2]  773 	ldw	x, (0x1e, sp)
      0084B3 FE               [ 2]  774 	ldw	x, (x)
      0084B4 A3 07 6C         [ 2]  775 	cpw	x, #0x076c
      0084B7 25 05            [ 1]  776 	jrc	00101$
      0084B9 A3 08 34         [ 2]  777 	cpw	x, #0x0834
      0084BC 25 05            [ 1]  778 	jrc	00102$
      0084BE                        779 00101$:
                                    780 ;	user/RTC_pcf8563.c: 300: return 1;
      0084BE A6 01            [ 1]  781 	ld	a, #0x01
      0084C0 CC 85 F4         [ 2]  782 	jp	00113$
      0084C3                        783 00102$:
                                    784 ;	user/RTC_pcf8563.c: 303: buffer[0] = BinToBCD(dateTime->second) & 0x7F;
      0084C3 96               [ 1]  785 	ldw	x, sp
      0084C4 5C               [ 2]  786 	incw	x
      0084C5 1F 0F            [ 2]  787 	ldw	(0x0f, sp), x
      0084C7 5F               [ 1]  788 	clrw	x
      0084C8 7B 20            [ 1]  789 	ld	a, (0x20, sp)
      0084CA 97               [ 1]  790 	ld	xl, a
      0084CB A6 0A            [ 1]  791 	ld	a, #0x0a
      0084CD 62               [ 2]  792 	div	x, a
      0084CE 9F               [ 1]  793 	ld	a, xl
      0084CF 4E               [ 1]  794 	swap	a
      0084D0 A4 F0            [ 1]  795 	and	a, #0xf0
      0084D2 6B 24            [ 1]  796 	ld	(0x24, sp), a
      0084D4 5F               [ 1]  797 	clrw	x
      0084D5 7B 20            [ 1]  798 	ld	a, (0x20, sp)
      0084D7 97               [ 1]  799 	ld	xl, a
      0084D8 A6 0A            [ 1]  800 	ld	a, #0x0a
      0084DA 62               [ 2]  801 	div	x, a
      0084DB 1B 24            [ 1]  802 	add	a, (0x24, sp)
      0084DD A4 7F            [ 1]  803 	and	a, #0x7f
      0084DF 1E 0F            [ 2]  804 	ldw	x, (0x0f, sp)
      0084E1 F7               [ 1]  805 	ld	(x), a
                                    806 ;	user/RTC_pcf8563.c: 304: buffer[1] = BinToBCD(dateTime->minute) & 0x7F;
      0084E2 1E 0F            [ 2]  807 	ldw	x, (0x0f, sp)
      0084E4 5C               [ 2]  808 	incw	x
      0084E5 1F 0B            [ 2]  809 	ldw	(0x0b, sp), x
      0084E7 90 F6            [ 1]  810 	ld	a, (y)
      0084E9 97               [ 1]  811 	ld	xl, a
      0084EA 89               [ 2]  812 	pushw	x
      0084EB 4F               [ 1]  813 	clr	a
      0084EC 95               [ 1]  814 	ld	xh, a
      0084ED A6 0A            [ 1]  815 	ld	a, #0x0a
      0084EF 62               [ 2]  816 	div	x, a
      0084F0 9F               [ 1]  817 	ld	a, xl
      0084F1 85               [ 2]  818 	popw	x
      0084F2 4E               [ 1]  819 	swap	a
      0084F3 A4 F0            [ 1]  820 	and	a, #0xf0
      0084F5 6B 15            [ 1]  821 	ld	(0x15, sp), a
      0084F7 4F               [ 1]  822 	clr	a
      0084F8 95               [ 1]  823 	ld	xh, a
      0084F9 A6 0A            [ 1]  824 	ld	a, #0x0a
      0084FB 62               [ 2]  825 	div	x, a
      0084FC 1B 15            [ 1]  826 	add	a, (0x15, sp)
      0084FE A4 7F            [ 1]  827 	and	a, #0x7f
      008500 1E 0B            [ 2]  828 	ldw	x, (0x0b, sp)
      008502 F7               [ 1]  829 	ld	(x), a
                                    830 ;	user/RTC_pcf8563.c: 305: buffer[2] = BinToBCD(dateTime->hour) & 0x3F;
      008503 16 0F            [ 2]  831 	ldw	y, (0x0f, sp)
      008505 72 A9 00 02      [ 2]  832 	addw	y, #0x0002
      008509 1E 25            [ 2]  833 	ldw	x, (0x25, sp)
      00850B F6               [ 1]  834 	ld	a, (x)
      00850C 97               [ 1]  835 	ld	xl, a
      00850D 89               [ 2]  836 	pushw	x
      00850E 4F               [ 1]  837 	clr	a
      00850F 95               [ 1]  838 	ld	xh, a
      008510 A6 0A            [ 1]  839 	ld	a, #0x0a
      008512 62               [ 2]  840 	div	x, a
      008513 9F               [ 1]  841 	ld	a, xl
      008514 85               [ 2]  842 	popw	x
      008515 4E               [ 1]  843 	swap	a
      008516 A4 F0            [ 1]  844 	and	a, #0xf0
      008518 6B 1D            [ 1]  845 	ld	(0x1d, sp), a
      00851A 4F               [ 1]  846 	clr	a
      00851B 95               [ 1]  847 	ld	xh, a
      00851C A6 0A            [ 1]  848 	ld	a, #0x0a
      00851E 62               [ 2]  849 	div	x, a
      00851F 1B 1D            [ 1]  850 	add	a, (0x1d, sp)
      008521 A4 3F            [ 1]  851 	and	a, #0x3f
      008523 90 F7            [ 1]  852 	ld	(y), a
                                    853 ;	user/RTC_pcf8563.c: 306: buffer[3] = BinToBCD(dateTime->day) & 0x3F;
      008525 16 0F            [ 2]  854 	ldw	y, (0x0f, sp)
      008527 72 A9 00 03      [ 2]  855 	addw	y, #0x0003
      00852B 1E 11            [ 2]  856 	ldw	x, (0x11, sp)
      00852D F6               [ 1]  857 	ld	a, (x)
      00852E 97               [ 1]  858 	ld	xl, a
      00852F 89               [ 2]  859 	pushw	x
      008530 4F               [ 1]  860 	clr	a
      008531 95               [ 1]  861 	ld	xh, a
      008532 A6 0A            [ 1]  862 	ld	a, #0x0a
      008534 62               [ 2]  863 	div	x, a
      008535 9F               [ 1]  864 	ld	a, xl
      008536 85               [ 2]  865 	popw	x
      008537 4E               [ 1]  866 	swap	a
      008538 A4 F0            [ 1]  867 	and	a, #0xf0
      00853A 6B 0A            [ 1]  868 	ld	(0x0a, sp), a
      00853C 4F               [ 1]  869 	clr	a
      00853D 95               [ 1]  870 	ld	xh, a
      00853E A6 0A            [ 1]  871 	ld	a, #0x0a
      008540 62               [ 2]  872 	div	x, a
      008541 1B 0A            [ 1]  873 	add	a, (0x0a, sp)
      008543 A4 3F            [ 1]  874 	and	a, #0x3f
      008545 90 F7            [ 1]  875 	ld	(y), a
                                    876 ;	user/RTC_pcf8563.c: 307: buffer[4] = BinToBCD(dateTime->weekday) & 0x07;
      008547 16 0F            [ 2]  877 	ldw	y, (0x0f, sp)
      008549 72 A9 00 04      [ 2]  878 	addw	y, #0x0004
      00854D 1E 0D            [ 2]  879 	ldw	x, (0x0d, sp)
      00854F F6               [ 1]  880 	ld	a, (x)
      008550 97               [ 1]  881 	ld	xl, a
      008551 89               [ 2]  882 	pushw	x
      008552 4F               [ 1]  883 	clr	a
      008553 95               [ 1]  884 	ld	xh, a
      008554 A6 0A            [ 1]  885 	ld	a, #0x0a
      008556 62               [ 2]  886 	div	x, a
      008557 9F               [ 1]  887 	ld	a, xl
      008558 85               [ 2]  888 	popw	x
      008559 4E               [ 1]  889 	swap	a
      00855A A4 F0            [ 1]  890 	and	a, #0xf0
      00855C 6B 1C            [ 1]  891 	ld	(0x1c, sp), a
      00855E 4F               [ 1]  892 	clr	a
      00855F 95               [ 1]  893 	ld	xh, a
      008560 A6 0A            [ 1]  894 	ld	a, #0x0a
      008562 62               [ 2]  895 	div	x, a
      008563 1B 1C            [ 1]  896 	add	a, (0x1c, sp)
      008565 A4 07            [ 1]  897 	and	a, #0x07
      008567 90 F7            [ 1]  898 	ld	(y), a
                                    899 ;	user/RTC_pcf8563.c: 308: buffer[5] = BinToBCD(dateTime->month) & 0x1F;
      008569 1E 0F            [ 2]  900 	ldw	x, (0x0f, sp)
      00856B 1C 00 05         [ 2]  901 	addw	x, #0x0005
      00856E 1F 22            [ 2]  902 	ldw	(0x22, sp), x
      008570 1E 18            [ 2]  903 	ldw	x, (0x18, sp)
      008572 F6               [ 1]  904 	ld	a, (x)
      008573 97               [ 1]  905 	ld	xl, a
      008574 89               [ 2]  906 	pushw	x
      008575 4F               [ 1]  907 	clr	a
      008576 95               [ 1]  908 	ld	xh, a
      008577 A6 0A            [ 1]  909 	ld	a, #0x0a
      008579 62               [ 2]  910 	div	x, a
      00857A 9F               [ 1]  911 	ld	a, xl
      00857B 85               [ 2]  912 	popw	x
      00857C 4E               [ 1]  913 	swap	a
      00857D A4 F0            [ 1]  914 	and	a, #0xf0
      00857F 6B 1A            [ 1]  915 	ld	(0x1a, sp), a
      008581 4F               [ 1]  916 	clr	a
      008582 95               [ 1]  917 	ld	xh, a
      008583 A6 0A            [ 1]  918 	ld	a, #0x0a
      008585 62               [ 2]  919 	div	x, a
      008586 1B 1A            [ 1]  920 	add	a, (0x1a, sp)
      008588 A4 1F            [ 1]  921 	and	a, #0x1f
      00858A 1E 22            [ 2]  922 	ldw	x, (0x22, sp)
      00858C F7               [ 1]  923 	ld	(x), a
                                    924 ;	user/RTC_pcf8563.c: 310: if (dateTime->year >= 2000)
      00858D 1E 1E            [ 2]  925 	ldw	x, (0x1e, sp)
      00858F FE               [ 2]  926 	ldw	x, (x)
      008590 1F 08            [ 2]  927 	ldw	(0x08, sp), x
                                    928 ;	user/RTC_pcf8563.c: 313: buffer[6] = BinToBCD(dateTime->year - 2000);
      008592 1E 0F            [ 2]  929 	ldw	x, (0x0f, sp)
      008594 1C 00 06         [ 2]  930 	addw	x, #0x0006
      008597 1F 16            [ 2]  931 	ldw	(0x16, sp), x
                                    932 ;	user/RTC_pcf8563.c: 310: if (dateTime->year >= 2000)
      008599 1E 08            [ 2]  933 	ldw	x, (0x08, sp)
      00859B A3 07 D0         [ 2]  934 	cpw	x, #0x07d0
      00859E 25 29            [ 1]  935 	jrc	00111$
                                    936 ;	user/RTC_pcf8563.c: 312: buffer[5] |= 0x80;
      0085A0 1E 22            [ 2]  937 	ldw	x, (0x22, sp)
      0085A2 F6               [ 1]  938 	ld	a, (x)
      0085A3 AA 80            [ 1]  939 	or	a, #0x80
      0085A5 1E 22            [ 2]  940 	ldw	x, (0x22, sp)
      0085A7 F7               [ 1]  941 	ld	(x), a
                                    942 ;	user/RTC_pcf8563.c: 313: buffer[6] = BinToBCD(dateTime->year - 2000);
      0085A8 1E 1E            [ 2]  943 	ldw	x, (0x1e, sp)
      0085AA FE               [ 2]  944 	ldw	x, (x)
      0085AB 1D 07 D0         [ 2]  945 	subw	x, #0x07d0
      0085AE 89               [ 2]  946 	pushw	x
      0085AF 90 AE 00 0A      [ 2]  947 	ldw	y, #0x000a
      0085B3 65               [ 2]  948 	divw	x, y
      0085B4 9F               [ 1]  949 	ld	a, xl
      0085B5 85               [ 2]  950 	popw	x
      0085B6 4E               [ 1]  951 	swap	a
      0085B7 A4 F0            [ 1]  952 	and	a, #0xf0
      0085B9 6B 21            [ 1]  953 	ld	(0x21, sp), a
      0085BB 90 AE 00 0A      [ 2]  954 	ldw	y, #0x000a
      0085BF 65               [ 2]  955 	divw	x, y
      0085C0 90 9F            [ 1]  956 	ld	a, yl
      0085C2 1B 21            [ 1]  957 	add	a, (0x21, sp)
      0085C4 1E 16            [ 2]  958 	ldw	x, (0x16, sp)
      0085C6 F7               [ 1]  959 	ld	(x), a
      0085C7 20 1E            [ 2]  960 	jra	00112$
      0085C9                        961 00111$:
                                    962 ;	user/RTC_pcf8563.c: 317: buffer[6] = BinToBCD(dateTime->year - 1900);
      0085C9 1E 08            [ 2]  963 	ldw	x, (0x08, sp)
      0085CB 1D 07 6C         [ 2]  964 	subw	x, #0x076c
      0085CE 89               [ 2]  965 	pushw	x
      0085CF 90 AE 00 0A      [ 2]  966 	ldw	y, #0x000a
      0085D3 65               [ 2]  967 	divw	x, y
      0085D4 9F               [ 1]  968 	ld	a, xl
      0085D5 85               [ 2]  969 	popw	x
      0085D6 4E               [ 1]  970 	swap	a
      0085D7 A4 F0            [ 1]  971 	and	a, #0xf0
      0085D9 90 AE 00 0A      [ 2]  972 	ldw	y, #0x000a
      0085DD 65               [ 2]  973 	divw	x, y
      0085DE 61               [ 1]  974 	exg	a, yl
      0085DF 6B 1B            [ 1]  975 	ld	(0x1b, sp), a
      0085E1 61               [ 1]  976 	exg	a, yl
      0085E2 1B 1B            [ 1]  977 	add	a, (0x1b, sp)
      0085E4 1E 16            [ 2]  978 	ldw	x, (0x16, sp)
      0085E6 F7               [ 1]  979 	ld	(x), a
      0085E7                        980 00112$:
                                    981 ;	user/RTC_pcf8563.c: 320: PCF_Write(0x02, buffer, sizeof(buffer));
      0085E7 1E 0F            [ 2]  982 	ldw	x, (0x0f, sp)
      0085E9 4B 07            [ 1]  983 	push	#0x07
      0085EB 89               [ 2]  984 	pushw	x
      0085EC 4B 02            [ 1]  985 	push	#0x02
      0085EE CD 80 DC         [ 4]  986 	call	_PCF_Write
      0085F1 5B 04            [ 2]  987 	addw	sp, #4
                                    988 ;	user/RTC_pcf8563.c: 322: return 0;
      0085F3 4F               [ 1]  989 	clr	a
      0085F4                        990 00113$:
      0085F4 5B 26            [ 2]  991 	addw	sp, #38
      0085F6 81               [ 4]  992 	ret
                                    993 ;	user/RTC_pcf8563.c: 352: uint8_t PCF_setAlarm(PCF_Alarm *alarm)
                                    994 ;	-----------------------------------------
                                    995 ;	 function PCF_setAlarm
                                    996 ;	-----------------------------------------
      0085F7                        997 _PCF_setAlarm:
      0085F7 52 13            [ 2]  998 	sub	sp, #19
                                    999 ;	user/RTC_pcf8563.c: 355: if ((alarm->minute >= 60 && alarm->minute != 80) || (alarm->hour >= 24 && alarm->hour != 80) || (alarm->day > 32 && alarm->day != 80) || (alarm->weekday > 6 && alarm->weekday != 80))
      0085F9 16 16            [ 2] 1000 	ldw	y, (0x16, sp)
      0085FB 17 10            [ 2] 1001 	ldw	(0x10, sp), y
      0085FD 1E 10            [ 2] 1002 	ldw	x, (0x10, sp)
      0085FF F6               [ 1] 1003 	ld	a, (x)
      008600 6B 0F            [ 1] 1004 	ld	(0x0f, sp), a
      008602 7B 0F            [ 1] 1005 	ld	a, (0x0f, sp)
      008604 A1 3C            [ 1] 1006 	cp	a, #0x3c
      008606 25 06            [ 1] 1007 	jrc	00105$
      008608 7B 0F            [ 1] 1008 	ld	a, (0x0f, sp)
      00860A A1 50            [ 1] 1009 	cp	a, #0x50
      00860C 26 31            [ 1] 1010 	jrne	00101$
      00860E                       1011 00105$:
      00860E 16 10            [ 2] 1012 	ldw	y, (0x10, sp)
      008610 90 5C            [ 2] 1013 	incw	y
      008612 90 F6            [ 1] 1014 	ld	a, (y)
      008614 A1 18            [ 1] 1015 	cp	a, #0x18
      008616 25 04            [ 1] 1016 	jrc	00107$
      008618 A1 50            [ 1] 1017 	cp	a, #0x50
      00861A 26 23            [ 1] 1018 	jrne	00101$
      00861C                       1019 00107$:
      00861C 1E 10            [ 2] 1020 	ldw	x, (0x10, sp)
      00861E 5C               [ 2] 1021 	incw	x
      00861F 5C               [ 2] 1022 	incw	x
      008620 1F 0D            [ 2] 1023 	ldw	(0x0d, sp), x
      008622 1E 0D            [ 2] 1024 	ldw	x, (0x0d, sp)
      008624 F6               [ 1] 1025 	ld	a, (x)
      008625 A1 20            [ 1] 1026 	cp	a, #0x20
      008627 23 04            [ 2] 1027 	jrule	00109$
      008629 A1 50            [ 1] 1028 	cp	a, #0x50
      00862B 26 12            [ 1] 1029 	jrne	00101$
      00862D                       1030 00109$:
      00862D 1E 10            [ 2] 1031 	ldw	x, (0x10, sp)
      00862F 1C 00 03         [ 2] 1032 	addw	x, #0x0003
      008632 1F 12            [ 2] 1033 	ldw	(0x12, sp), x
      008634 1E 12            [ 2] 1034 	ldw	x, (0x12, sp)
      008636 F6               [ 1] 1035 	ld	a, (x)
      008637 A1 06            [ 1] 1036 	cp	a, #0x06
      008639 23 09            [ 2] 1037 	jrule	00102$
      00863B A1 50            [ 1] 1038 	cp	a, #0x50
      00863D 27 05            [ 1] 1039 	jreq	00102$
      00863F                       1040 00101$:
                                   1041 ;	user/RTC_pcf8563.c: 357: return 1;
      00863F A6 01            [ 1] 1042 	ld	a, #0x01
      008641 CC 86 D3         [ 2] 1043 	jp	00110$
      008644                       1044 00102$:
                                   1045 ;	user/RTC_pcf8563.c: 360: buffer[0] = BinToBCD(alarm->minute) & 0xFF;
      008644 96               [ 1] 1046 	ldw	x, sp
      008645 5C               [ 2] 1047 	incw	x
      008646 1F 07            [ 2] 1048 	ldw	(0x07, sp), x
      008648 5F               [ 1] 1049 	clrw	x
      008649 7B 0F            [ 1] 1050 	ld	a, (0x0f, sp)
      00864B 97               [ 1] 1051 	ld	xl, a
      00864C A6 0A            [ 1] 1052 	ld	a, #0x0a
      00864E 62               [ 2] 1053 	div	x, a
      00864F 9F               [ 1] 1054 	ld	a, xl
      008650 4E               [ 1] 1055 	swap	a
      008651 A4 F0            [ 1] 1056 	and	a, #0xf0
      008653 6B 06            [ 1] 1057 	ld	(0x06, sp), a
      008655 5F               [ 1] 1058 	clrw	x
      008656 7B 0F            [ 1] 1059 	ld	a, (0x0f, sp)
      008658 97               [ 1] 1060 	ld	xl, a
      008659 A6 0A            [ 1] 1061 	ld	a, #0x0a
      00865B 62               [ 2] 1062 	div	x, a
      00865C 1B 06            [ 1] 1063 	add	a, (0x06, sp)
      00865E 1E 07            [ 2] 1064 	ldw	x, (0x07, sp)
      008660 F7               [ 1] 1065 	ld	(x), a
                                   1066 ;	user/RTC_pcf8563.c: 361: buffer[1] = BinToBCD(alarm->hour) & 0xBF;
      008661 1E 07            [ 2] 1067 	ldw	x, (0x07, sp)
      008663 5C               [ 2] 1068 	incw	x
      008664 1F 0A            [ 2] 1069 	ldw	(0x0a, sp), x
      008666 90 F6            [ 1] 1070 	ld	a, (y)
      008668 97               [ 1] 1071 	ld	xl, a
      008669 89               [ 2] 1072 	pushw	x
      00866A 4F               [ 1] 1073 	clr	a
      00866B 95               [ 1] 1074 	ld	xh, a
      00866C A6 0A            [ 1] 1075 	ld	a, #0x0a
      00866E 62               [ 2] 1076 	div	x, a
      00866F 9F               [ 1] 1077 	ld	a, xl
      008670 85               [ 2] 1078 	popw	x
      008671 4E               [ 1] 1079 	swap	a
      008672 A4 F0            [ 1] 1080 	and	a, #0xf0
      008674 6B 05            [ 1] 1081 	ld	(0x05, sp), a
      008676 4F               [ 1] 1082 	clr	a
      008677 95               [ 1] 1083 	ld	xh, a
      008678 A6 0A            [ 1] 1084 	ld	a, #0x0a
      00867A 62               [ 2] 1085 	div	x, a
      00867B 1B 05            [ 1] 1086 	add	a, (0x05, sp)
      00867D A4 BF            [ 1] 1087 	and	a, #0xbf
      00867F 1E 0A            [ 2] 1088 	ldw	x, (0x0a, sp)
      008681 F7               [ 1] 1089 	ld	(x), a
                                   1090 ;	user/RTC_pcf8563.c: 362: buffer[2] = BinToBCD(alarm->day) & 0xBF;
      008682 16 07            [ 2] 1091 	ldw	y, (0x07, sp)
      008684 72 A9 00 02      [ 2] 1092 	addw	y, #0x0002
      008688 1E 0D            [ 2] 1093 	ldw	x, (0x0d, sp)
      00868A F6               [ 1] 1094 	ld	a, (x)
      00868B 97               [ 1] 1095 	ld	xl, a
      00868C 89               [ 2] 1096 	pushw	x
      00868D 4F               [ 1] 1097 	clr	a
      00868E 95               [ 1] 1098 	ld	xh, a
      00868F A6 0A            [ 1] 1099 	ld	a, #0x0a
      008691 62               [ 2] 1100 	div	x, a
      008692 9F               [ 1] 1101 	ld	a, xl
      008693 85               [ 2] 1102 	popw	x
      008694 4E               [ 1] 1103 	swap	a
      008695 A4 F0            [ 1] 1104 	and	a, #0xf0
      008697 6B 09            [ 1] 1105 	ld	(0x09, sp), a
      008699 4F               [ 1] 1106 	clr	a
      00869A 95               [ 1] 1107 	ld	xh, a
      00869B A6 0A            [ 1] 1108 	ld	a, #0x0a
      00869D 62               [ 2] 1109 	div	x, a
      00869E 1B 09            [ 1] 1110 	add	a, (0x09, sp)
      0086A0 A4 BF            [ 1] 1111 	and	a, #0xbf
      0086A2 90 F7            [ 1] 1112 	ld	(y), a
                                   1113 ;	user/RTC_pcf8563.c: 363: buffer[3] = BinToBCD(alarm->weekday) & 0x87;
      0086A4 16 07            [ 2] 1114 	ldw	y, (0x07, sp)
      0086A6 72 A9 00 03      [ 2] 1115 	addw	y, #0x0003
      0086AA 1E 12            [ 2] 1116 	ldw	x, (0x12, sp)
      0086AC F6               [ 1] 1117 	ld	a, (x)
      0086AD 97               [ 1] 1118 	ld	xl, a
      0086AE 89               [ 2] 1119 	pushw	x
      0086AF 4F               [ 1] 1120 	clr	a
      0086B0 95               [ 1] 1121 	ld	xh, a
      0086B1 A6 0A            [ 1] 1122 	ld	a, #0x0a
      0086B3 62               [ 2] 1123 	div	x, a
      0086B4 9F               [ 1] 1124 	ld	a, xl
      0086B5 85               [ 2] 1125 	popw	x
      0086B6 4E               [ 1] 1126 	swap	a
      0086B7 A4 F0            [ 1] 1127 	and	a, #0xf0
      0086B9 6B 0C            [ 1] 1128 	ld	(0x0c, sp), a
      0086BB 4F               [ 1] 1129 	clr	a
      0086BC 95               [ 1] 1130 	ld	xh, a
      0086BD A6 0A            [ 1] 1131 	ld	a, #0x0a
      0086BF 62               [ 2] 1132 	div	x, a
      0086C0 1B 0C            [ 1] 1133 	add	a, (0x0c, sp)
      0086C2 A4 87            [ 1] 1134 	and	a, #0x87
      0086C4 90 F7            [ 1] 1135 	ld	(y), a
                                   1136 ;	user/RTC_pcf8563.c: 365: PCF_Write(0x09, buffer, sizeof(buffer));
      0086C6 1E 07            [ 2] 1137 	ldw	x, (0x07, sp)
      0086C8 4B 04            [ 1] 1138 	push	#0x04
      0086CA 89               [ 2] 1139 	pushw	x
      0086CB 4B 09            [ 1] 1140 	push	#0x09
      0086CD CD 80 DC         [ 4] 1141 	call	_PCF_Write
      0086D0 5B 04            [ 2] 1142 	addw	sp, #4
                                   1143 ;	user/RTC_pcf8563.c: 367: return 0;
      0086D2 4F               [ 1] 1144 	clr	a
      0086D3                       1145 00110$:
      0086D3 5B 13            [ 2] 1146 	addw	sp, #19
      0086D5 81               [ 4] 1147 	ret
                                   1148 ;	user/RTC_pcf8563.c: 370: void PCF_setTimer(uint8_t mode, uint8_t count)
                                   1149 ;	-----------------------------------------
                                   1150 ;	 function PCF_setTimer
                                   1151 ;	-----------------------------------------
      0086D6                       1152 _PCF_setTimer:
                                   1153 ;	user/RTC_pcf8563.c: 372: mode &= 0x13;
      0086D6 7B 03            [ 1] 1154 	ld	a, (0x03, sp)
      0086D8 A4 13            [ 1] 1155 	and	a, #0x13
      0086DA 6B 03            [ 1] 1156 	ld	(0x03, sp), a
                                   1157 ;	user/RTC_pcf8563.c: 373: PCF_Write(0x0E, &mode, 1);				//Timer_control
      0086DC 96               [ 1] 1158 	ldw	x, sp
      0086DD 1C 00 03         [ 2] 1159 	addw	x, #3
      0086E0 4B 01            [ 1] 1160 	push	#0x01
      0086E2 89               [ 2] 1161 	pushw	x
      0086E3 4B 0E            [ 1] 1162 	push	#0x0e
      0086E5 CD 80 DC         [ 4] 1163 	call	_PCF_Write
      0086E8 5B 04            [ 2] 1164 	addw	sp, #4
                                   1165 ;	user/RTC_pcf8563.c: 375: PCF_Write(0x0F, &count, 1);				//Timer
      0086EA 96               [ 1] 1166 	ldw	x, sp
      0086EB 1C 00 04         [ 2] 1167 	addw	x, #4
      0086EE 4B 01            [ 1] 1168 	push	#0x01
      0086F0 89               [ 2] 1169 	pushw	x
      0086F1 4B 0F            [ 1] 1170 	push	#0x0f
      0086F3 CD 80 DC         [ 4] 1171 	call	_PCF_Write
      0086F6 5B 04            [ 2] 1172 	addw	sp, #4
      0086F8 81               [ 4] 1173 	ret
                                   1174 ;	user/RTC_pcf8563.c: 378: uint8_t PCF_getTimer()
                                   1175 ;	-----------------------------------------
                                   1176 ;	 function PCF_getTimer
                                   1177 ;	-----------------------------------------
      0086F9                       1178 _PCF_getTimer:
      0086F9 88               [ 1] 1179 	push	a
                                   1180 ;	user/RTC_pcf8563.c: 381: PCF_Read(0x0F, &count, 1);				//Timer
      0086FA 96               [ 1] 1181 	ldw	x, sp
      0086FB 5C               [ 2] 1182 	incw	x
      0086FC 4B 01            [ 1] 1183 	push	#0x01
      0086FE 89               [ 2] 1184 	pushw	x
      0086FF 4B 0F            [ 1] 1185 	push	#0x0f
      008701 CD 82 71         [ 4] 1186 	call	_PCF_Read
      008704 5B 04            [ 2] 1187 	addw	sp, #4
                                   1188 ;	user/RTC_pcf8563.c: 383: return count;
      008706 7B 01            [ 1] 1189 	ld	a, (0x01, sp)
      008708 5B 01            [ 2] 1190 	addw	sp, #1
      00870A 81               [ 4] 1191 	ret
                                   1192 ;	user/RTC_pcf8563.c: 386: uint8_t PCF_getAlarm(PCF_Alarm *alarm)
                                   1193 ;	-----------------------------------------
                                   1194 ;	 function PCF_getAlarm
                                   1195 ;	-----------------------------------------
      00870B                       1196 _PCF_getAlarm:
      00870B 52 0F            [ 2] 1197 	sub	sp, #15
                                   1198 ;	user/RTC_pcf8563.c: 390: PCF_Read(0x09, buffer, sizeof(buffer));
      00870D 96               [ 1] 1199 	ldw	x, sp
      00870E 5C               [ 2] 1200 	incw	x
      00870F 1F 0B            [ 2] 1201 	ldw	(0x0b, sp), x
      008711 1E 0B            [ 2] 1202 	ldw	x, (0x0b, sp)
      008713 4B 04            [ 1] 1203 	push	#0x04
      008715 89               [ 2] 1204 	pushw	x
      008716 4B 09            [ 1] 1205 	push	#0x09
      008718 CD 82 71         [ 4] 1206 	call	_PCF_Read
      00871B 5B 04            [ 2] 1207 	addw	sp, #4
                                   1208 ;	user/RTC_pcf8563.c: 392: alarm->minute = (((buffer[0] >> 4) & 0x0F) * 10) + (buffer[0] & 0x0F);
      00871D 16 12            [ 2] 1209 	ldw	y, (0x12, sp)
      00871F 17 07            [ 2] 1210 	ldw	(0x07, sp), y
      008721 1E 0B            [ 2] 1211 	ldw	x, (0x0b, sp)
      008723 F6               [ 1] 1212 	ld	a, (x)
      008724 90 97            [ 1] 1213 	ld	yl, a
      008726 4E               [ 1] 1214 	swap	a
      008727 A4 0F            [ 1] 1215 	and	a, #0x0f
      008729 A4 0F            [ 1] 1216 	and	a, #0x0f
      00872B 97               [ 1] 1217 	ld	xl, a
      00872C A6 0A            [ 1] 1218 	ld	a, #0x0a
      00872E 42               [ 4] 1219 	mul	x, a
      00872F 90 9F            [ 1] 1220 	ld	a, yl
      008731 A4 0F            [ 1] 1221 	and	a, #0x0f
      008733 6B 0A            [ 1] 1222 	ld	(0x0a, sp), a
      008735 9F               [ 1] 1223 	ld	a, xl
      008736 1B 0A            [ 1] 1224 	add	a, (0x0a, sp)
      008738 1E 07            [ 2] 1225 	ldw	x, (0x07, sp)
      00873A F7               [ 1] 1226 	ld	(x), a
                                   1227 ;	user/RTC_pcf8563.c: 393: alarm->hour = (((buffer[1] >> 4) & 0x0B) * 10) + (buffer[1] & 0x0F);
      00873B 16 07            [ 2] 1228 	ldw	y, (0x07, sp)
      00873D 90 5C            [ 2] 1229 	incw	y
      00873F 1E 0B            [ 2] 1230 	ldw	x, (0x0b, sp)
      008741 E6 01            [ 1] 1231 	ld	a, (0x1, x)
      008743 6B 09            [ 1] 1232 	ld	(0x09, sp), a
      008745 7B 09            [ 1] 1233 	ld	a, (0x09, sp)
      008747 4E               [ 1] 1234 	swap	a
      008748 A4 0F            [ 1] 1235 	and	a, #0x0f
      00874A A4 0B            [ 1] 1236 	and	a, #0x0b
      00874C 97               [ 1] 1237 	ld	xl, a
      00874D A6 0A            [ 1] 1238 	ld	a, #0x0a
      00874F 42               [ 4] 1239 	mul	x, a
      008750 7B 09            [ 1] 1240 	ld	a, (0x09, sp)
      008752 A4 0F            [ 1] 1241 	and	a, #0x0f
      008754 6B 0E            [ 1] 1242 	ld	(0x0e, sp), a
      008756 9F               [ 1] 1243 	ld	a, xl
      008757 1B 0E            [ 1] 1244 	add	a, (0x0e, sp)
      008759 90 F7            [ 1] 1245 	ld	(y), a
                                   1246 ;	user/RTC_pcf8563.c: 394: alarm->day = (((buffer[2] >> 4) & 0x0B) * 10) + (buffer[2] & 0x0F);
      00875B 16 07            [ 2] 1247 	ldw	y, (0x07, sp)
      00875D 72 A9 00 02      [ 2] 1248 	addw	y, #0x0002
      008761 1E 0B            [ 2] 1249 	ldw	x, (0x0b, sp)
      008763 E6 02            [ 1] 1250 	ld	a, (0x2, x)
      008765 6B 0D            [ 1] 1251 	ld	(0x0d, sp), a
      008767 7B 0D            [ 1] 1252 	ld	a, (0x0d, sp)
      008769 4E               [ 1] 1253 	swap	a
      00876A A4 0F            [ 1] 1254 	and	a, #0x0f
      00876C A4 0B            [ 1] 1255 	and	a, #0x0b
      00876E 97               [ 1] 1256 	ld	xl, a
      00876F A6 0A            [ 1] 1257 	ld	a, #0x0a
      008771 42               [ 4] 1258 	mul	x, a
      008772 7B 0D            [ 1] 1259 	ld	a, (0x0d, sp)
      008774 A4 0F            [ 1] 1260 	and	a, #0x0f
      008776 6B 06            [ 1] 1261 	ld	(0x06, sp), a
      008778 9F               [ 1] 1262 	ld	a, xl
      008779 1B 06            [ 1] 1263 	add	a, (0x06, sp)
      00877B 90 F7            [ 1] 1264 	ld	(y), a
                                   1265 ;	user/RTC_pcf8563.c: 395: alarm->weekday = (((buffer[3] >> 4) & 0x08) * 10) + (buffer[3] & 0x07);
      00877D 16 07            [ 2] 1266 	ldw	y, (0x07, sp)
      00877F 72 A9 00 03      [ 2] 1267 	addw	y, #0x0003
      008783 1E 0B            [ 2] 1268 	ldw	x, (0x0b, sp)
      008785 E6 03            [ 1] 1269 	ld	a, (0x3, x)
      008787 6B 0F            [ 1] 1270 	ld	(0x0f, sp), a
      008789 7B 0F            [ 1] 1271 	ld	a, (0x0f, sp)
      00878B 4E               [ 1] 1272 	swap	a
      00878C A4 0F            [ 1] 1273 	and	a, #0x0f
      00878E A4 08            [ 1] 1274 	and	a, #0x08
      008790 97               [ 1] 1275 	ld	xl, a
      008791 A6 0A            [ 1] 1276 	ld	a, #0x0a
      008793 42               [ 4] 1277 	mul	x, a
      008794 7B 0F            [ 1] 1278 	ld	a, (0x0f, sp)
      008796 A4 07            [ 1] 1279 	and	a, #0x07
      008798 6B 05            [ 1] 1280 	ld	(0x05, sp), a
      00879A 9F               [ 1] 1281 	ld	a, xl
      00879B 1B 05            [ 1] 1282 	add	a, (0x05, sp)
      00879D 90 F7            [ 1] 1283 	ld	(y), a
                                   1284 ;	user/RTC_pcf8563.c: 397: return 0;
      00879F 4F               [ 1] 1285 	clr	a
      0087A0 5B 0F            [ 2] 1286 	addw	sp, #15
      0087A2 81               [ 4] 1287 	ret
                                   1288 ;	user/RTC_pcf8563.c: 400: uint8_t PCF_getAndClearFlags()
                                   1289 ;	-----------------------------------------
                                   1290 ;	 function PCF_getAndClearFlags
                                   1291 ;	-----------------------------------------
      0087A3                       1292 _PCF_getAndClearFlags:
      0087A3 89               [ 2] 1293 	pushw	x
                                   1294 ;	user/RTC_pcf8563.c: 404: PCF_Read(0x01, &flags, 1);				//Control_status_2
      0087A4 96               [ 1] 1295 	ldw	x, sp
      0087A5 5C               [ 2] 1296 	incw	x
      0087A6 5C               [ 2] 1297 	incw	x
      0087A7 4B 01            [ 1] 1298 	push	#0x01
      0087A9 89               [ 2] 1299 	pushw	x
      0087AA 4B 01            [ 1] 1300 	push	#0x01
      0087AC CD 82 71         [ 4] 1301 	call	_PCF_Read
      0087AF 5B 04            [ 2] 1302 	addw	sp, #4
                                   1303 ;	user/RTC_pcf8563.c: 405: cleared = flags & 0x13;
      0087B1 7B 02            [ 1] 1304 	ld	a, (0x02, sp)
      0087B3 A4 13            [ 1] 1305 	and	a, #0x13
      0087B5 6B 01            [ 1] 1306 	ld	(0x01, sp), a
                                   1307 ;	user/RTC_pcf8563.c: 406: PCF_Write(0x01, &cleared, 1);			//Control_status_2
      0087B7 96               [ 1] 1308 	ldw	x, sp
      0087B8 5C               [ 2] 1309 	incw	x
      0087B9 4B 01            [ 1] 1310 	push	#0x01
      0087BB 89               [ 2] 1311 	pushw	x
      0087BC 4B 01            [ 1] 1312 	push	#0x01
      0087BE CD 80 DC         [ 4] 1313 	call	_PCF_Write
      0087C1 5B 04            [ 2] 1314 	addw	sp, #4
                                   1315 ;	user/RTC_pcf8563.c: 408: return flags & 0x0C;					//Mask unnecessary bits
      0087C3 7B 02            [ 1] 1316 	ld	a, (0x02, sp)
      0087C5 A4 0C            [ 1] 1317 	and	a, #0x0c
      0087C7 85               [ 2] 1318 	popw	x
      0087C8 81               [ 4] 1319 	ret
                                   1320 ;	user/RTC_pcf8563.c: 411: void PCF_setClockOut(uint8_t mode)
                                   1321 ;	-----------------------------------------
                                   1322 ;	 function PCF_setClockOut
                                   1323 ;	-----------------------------------------
      0087C9                       1324 _PCF_setClockOut:
                                   1325 ;	user/RTC_pcf8563.c: 413: mode &= 0x13;
      0087C9 7B 03            [ 1] 1326 	ld	a, (0x03, sp)
      0087CB A4 13            [ 1] 1327 	and	a, #0x13
      0087CD 6B 03            [ 1] 1328 	ld	(0x03, sp), a
                                   1329 ;	user/RTC_pcf8563.c: 414: PCF_Write(0x0D, &mode, 1);				//CLKOUT_control
      0087CF 96               [ 1] 1330 	ldw	x, sp
      0087D0 1C 00 03         [ 2] 1331 	addw	x, #3
      0087D3 4B 01            [ 1] 1332 	push	#0x01
      0087D5 89               [ 2] 1333 	pushw	x
      0087D6 4B 0D            [ 1] 1334 	push	#0x0d
      0087D8 CD 80 DC         [ 4] 1335 	call	_PCF_Write
      0087DB 5B 04            [ 2] 1336 	addw	sp, #4
      0087DD 81               [ 4] 1337 	ret
                                   1338 	.area CODE
                                   1339 	.area INITIALIZER
      009753                       1340 __xinit__timeout:
      009753 00 00 A0 00           1341 	.byte #0x00,#0x00,#0xa0,#0x00	; 40960
                                   1342 	.area CABS (ABS)
