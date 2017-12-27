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
                                     12 	.globl _I2C_ClearFlag
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
                                     63 ;	user/RTC_pcf8563.c: 9: static void I2C_setup(void)
                                     64 ;	-----------------------------------------
                                     65 ;	 function I2C_setup
                                     66 ;	-----------------------------------------
      0080A0                         67 _I2C_setup:
                                     68 ;	user/RTC_pcf8563.c: 11: I2C_DeInit();
      0080A0 CD 92 D5         [ 4]   69 	call	_I2C_DeInit
                                     70 ;	user/RTC_pcf8563.c: 12: I2C_Cmd(ENABLE);
      0080A3 4B 01            [ 1]   71 	push	#0x01
      0080A5 CD 94 28         [ 4]   72 	call	_I2C_Cmd
      0080A8 84               [ 1]   73 	pop	a
                                     74 ;	user/RTC_pcf8563.c: 13: I2C_Init(100000, PCF8563_WRITE_ADDR, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, CLK_GetClockFreq()/1000000);
      0080A9 CD 91 01         [ 4]   75 	call	_CLK_GetClockFreq
      0080AC 4B 40            [ 1]   76 	push	#0x40
      0080AE 4B 42            [ 1]   77 	push	#0x42
      0080B0 4B 0F            [ 1]   78 	push	#0x0f
      0080B2 4B 00            [ 1]   79 	push	#0x00
      0080B4 89               [ 2]   80 	pushw	x
      0080B5 90 89            [ 2]   81 	pushw	y
      0080B7 CD 98 11         [ 4]   82 	call	__divulong
      0080BA 5B 08            [ 2]   83 	addw	sp, #8
      0080BC 9F               [ 1]   84 	ld	a, xl
      0080BD 88               [ 1]   85 	push	a
      0080BE 4B 00            [ 1]   86 	push	#0x00
      0080C0 4B 01            [ 1]   87 	push	#0x01
      0080C2 4B 00            [ 1]   88 	push	#0x00
      0080C4 4B A2            [ 1]   89 	push	#0xa2
      0080C6 4B 00            [ 1]   90 	push	#0x00
      0080C8 4B A0            [ 1]   91 	push	#0xa0
      0080CA 4B 86            [ 1]   92 	push	#0x86
      0080CC 4B 01            [ 1]   93 	push	#0x01
      0080CE 4B 00            [ 1]   94 	push	#0x00
      0080D0 CD 92 FA         [ 4]   95 	call	_I2C_Init
      0080D3 5B 0A            [ 2]   96 	addw	sp, #10
      0080D5 81               [ 4]   97 	ret
                                     98 ;	user/RTC_pcf8563.c: 16: uint8_t PCF_Write(uint8_t addr, uint8_t *data, uint8_t count)
                                     99 ;	-----------------------------------------
                                    100 ;	 function PCF_Write
                                    101 ;	-----------------------------------------
      0080D6                        102 _PCF_Write:
      0080D6 52 25            [ 2]  103 	sub	sp, #37
                                    104 ;	user/RTC_pcf8563.c: 18: uint8_t res = 1;
      0080D8 A6 01            [ 1]  105 	ld	a, #0x01
      0080DA 6B 01            [ 1]  106 	ld	(0x01, sp), a
                                    107 ;	user/RTC_pcf8563.c: 21: I2C_AcknowledgeConfig(I2C_ACK_CURR);
      0080DC 4B 01            [ 1]  108 	push	#0x01
      0080DE CD 94 88         [ 4]  109 	call	_I2C_AcknowledgeConfig
      0080E1 84               [ 1]  110 	pop	a
                                    111 ;	user/RTC_pcf8563.c: 22: timeout = 0x0FFF;
      0080E2 AE 0F FF         [ 2]  112 	ldw	x, #0x0fff
      0080E5 1F 04            [ 2]  113 	ldw	(0x04, sp), x
      0080E7 5F               [ 1]  114 	clrw	x
      0080E8 1F 02            [ 2]  115 	ldw	(0x02, sp), x
                                    116 ;	user/RTC_pcf8563.c: 24: while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY))
      0080EA                        117 00103$:
      0080EA 4B 02            [ 1]  118 	push	#0x02
      0080EC 4B 03            [ 1]  119 	push	#0x03
      0080EE CD 95 7F         [ 4]  120 	call	_I2C_GetFlagStatus
      0080F1 85               [ 2]  121 	popw	x
      0080F2 4D               [ 1]  122 	tnz	a
      0080F3 27 2F            [ 1]  123 	jreq	00105$
                                    124 ;	user/RTC_pcf8563.c: 26: if(!timeout--)
      0080F5 16 04            [ 2]  125 	ldw	y, (0x04, sp)
      0080F7 17 23            [ 2]  126 	ldw	(0x23, sp), y
      0080F9 16 02            [ 2]  127 	ldw	y, (0x02, sp)
      0080FB 17 21            [ 2]  128 	ldw	(0x21, sp), y
      0080FD 1E 04            [ 2]  129 	ldw	x, (0x04, sp)
      0080FF 1D 00 01         [ 2]  130 	subw	x, #0x0001
      008102 1F 17            [ 2]  131 	ldw	(0x17, sp), x
      008104 7B 03            [ 1]  132 	ld	a, (0x03, sp)
      008106 A2 00            [ 1]  133 	sbc	a, #0x00
      008108 6B 16            [ 1]  134 	ld	(0x16, sp), a
      00810A 7B 02            [ 1]  135 	ld	a, (0x02, sp)
      00810C A2 00            [ 1]  136 	sbc	a, #0x00
      00810E 6B 15            [ 1]  137 	ld	(0x15, sp), a
      008110 16 17            [ 2]  138 	ldw	y, (0x17, sp)
      008112 17 04            [ 2]  139 	ldw	(0x04, sp), y
      008114 16 15            [ 2]  140 	ldw	y, (0x15, sp)
      008116 17 02            [ 2]  141 	ldw	(0x02, sp), y
      008118 1E 23            [ 2]  142 	ldw	x, (0x23, sp)
      00811A 26 CE            [ 1]  143 	jrne	00103$
      00811C 1E 21            [ 2]  144 	ldw	x, (0x21, sp)
      00811E 26 CA            [ 1]  145 	jrne	00103$
                                    146 ;	user/RTC_pcf8563.c: 29: return res;
      008120 4F               [ 1]  147 	clr	a
      008121 CC 82 68         [ 2]  148 	jp	00133$
      008124                        149 00105$:
                                    150 ;	user/RTC_pcf8563.c: 33: I2C_GenerateSTART(ENABLE);
      008124 4B 01            [ 1]  151 	push	#0x01
      008126 CD 94 4A         [ 4]  152 	call	_I2C_GenerateSTART
      008129 84               [ 1]  153 	pop	a
                                    154 ;	user/RTC_pcf8563.c: 35: timeout = 0x0FFF;
      00812A AE 0F FF         [ 2]  155 	ldw	x, #0x0fff
      00812D 1F 04            [ 2]  156 	ldw	(0x04, sp), x
      00812F 5F               [ 1]  157 	clrw	x
      008130 1F 02            [ 2]  158 	ldw	(0x02, sp), x
                                    159 ;	user/RTC_pcf8563.c: 37: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
      008132                        160 00108$:
      008132 4B 01            [ 1]  161 	push	#0x01
      008134 4B 03            [ 1]  162 	push	#0x03
      008136 CD 95 04         [ 4]  163 	call	_I2C_CheckEvent
      008139 85               [ 2]  164 	popw	x
      00813A 6B 14            [ 1]  165 	ld	(0x14, sp), a
      00813C 0D 14            [ 1]  166 	tnz	(0x14, sp)
      00813E 26 29            [ 1]  167 	jrne	00110$
                                    168 ;	user/RTC_pcf8563.c: 39: if(!timeout--) 
      008140 16 04            [ 2]  169 	ldw	y, (0x04, sp)
      008142 17 0E            [ 2]  170 	ldw	(0x0e, sp), y
      008144 16 02            [ 2]  171 	ldw	y, (0x02, sp)
      008146 17 0C            [ 2]  172 	ldw	(0x0c, sp), y
      008148 16 04            [ 2]  173 	ldw	y, (0x04, sp)
      00814A 72 A2 00 01      [ 2]  174 	subw	y, #0x0001
      00814E 7B 03            [ 1]  175 	ld	a, (0x03, sp)
      008150 A2 00            [ 1]  176 	sbc	a, #0x00
      008152 97               [ 1]  177 	ld	xl, a
      008153 7B 02            [ 1]  178 	ld	a, (0x02, sp)
      008155 A2 00            [ 1]  179 	sbc	a, #0x00
      008157 95               [ 1]  180 	ld	xh, a
      008158 17 04            [ 2]  181 	ldw	(0x04, sp), y
      00815A 1F 02            [ 2]  182 	ldw	(0x02, sp), x
      00815C 1E 0E            [ 2]  183 	ldw	x, (0x0e, sp)
      00815E 26 D2            [ 1]  184 	jrne	00108$
      008160 1E 0C            [ 2]  185 	ldw	x, (0x0c, sp)
      008162 26 CE            [ 1]  186 	jrne	00108$
                                    187 ;	user/RTC_pcf8563.c: 41: res = 0;
      008164 0F 01            [ 1]  188 	clr	(0x01, sp)
                                    189 ;	user/RTC_pcf8563.c: 42: goto stop;
      008166 CC 82 60         [ 2]  190 	jp	00132$
      008169                        191 00110$:
                                    192 ;	user/RTC_pcf8563.c: 46: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
      008169 4B 00            [ 1]  193 	push	#0x00
      00816B 4B A2            [ 1]  194 	push	#0xa2
      00816D CD 94 EE         [ 4]  195 	call	_I2C_Send7bitAddress
      008170 85               [ 2]  196 	popw	x
                                    197 ;	user/RTC_pcf8563.c: 47: timeout = 0x0FFF;
      008171 AE 0F FF         [ 2]  198 	ldw	x, #0x0fff
      008174 1F 04            [ 2]  199 	ldw	(0x04, sp), x
      008176 5F               [ 1]  200 	clrw	x
      008177 1F 02            [ 2]  201 	ldw	(0x02, sp), x
                                    202 ;	user/RTC_pcf8563.c: 49: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
      008179                        203 00116$:
      008179 4B 82            [ 1]  204 	push	#0x82
      00817B 4B 07            [ 1]  205 	push	#0x07
      00817D CD 95 04         [ 4]  206 	call	_I2C_CheckEvent
      008180 85               [ 2]  207 	popw	x
      008181 4D               [ 1]  208 	tnz	a
      008182 26 42            [ 1]  209 	jrne	00118$
                                    210 ;	user/RTC_pcf8563.c: 51: if(!timeout--)
      008184 16 02            [ 2]  211 	ldw	y, (0x02, sp)
      008186 17 08            [ 2]  212 	ldw	(0x08, sp), y
      008188 1E 04            [ 2]  213 	ldw	x, (0x04, sp)
      00818A 16 04            [ 2]  214 	ldw	y, (0x04, sp)
      00818C 72 A2 00 01      [ 2]  215 	subw	y, #0x0001
      008190 7B 03            [ 1]  216 	ld	a, (0x03, sp)
      008192 A2 00            [ 1]  217 	sbc	a, #0x00
      008194 6B 1A            [ 1]  218 	ld	(0x1a, sp), a
      008196 7B 02            [ 1]  219 	ld	a, (0x02, sp)
      008198 A2 00            [ 1]  220 	sbc	a, #0x00
      00819A 17 04            [ 2]  221 	ldw	(0x04, sp), y
      00819C 6B 02            [ 1]  222 	ld	(0x02, sp), a
      00819E 7B 1A            [ 1]  223 	ld	a, (0x1a, sp)
      0081A0 6B 03            [ 1]  224 	ld	(0x03, sp), a
      0081A2 5D               [ 2]  225 	tnzw	x
      0081A3 26 09            [ 1]  226 	jrne	00114$
      0081A5 1E 08            [ 2]  227 	ldw	x, (0x08, sp)
      0081A7 26 05            [ 1]  228 	jrne	00114$
                                    229 ;	user/RTC_pcf8563.c: 53: res = 0;
      0081A9 0F 01            [ 1]  230 	clr	(0x01, sp)
                                    231 ;	user/RTC_pcf8563.c: 54: goto stop;
      0081AB CC 82 60         [ 2]  232 	jp	00132$
      0081AE                        233 00114$:
                                    234 ;	user/RTC_pcf8563.c: 56: else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
      0081AE 4B 04            [ 1]  235 	push	#0x04
      0081B0 4B 02            [ 1]  236 	push	#0x02
      0081B2 CD 95 7F         [ 4]  237 	call	_I2C_GetFlagStatus
      0081B5 85               [ 2]  238 	popw	x
      0081B6 4D               [ 1]  239 	tnz	a
      0081B7 27 C0            [ 1]  240 	jreq	00116$
                                    241 ;	user/RTC_pcf8563.c: 58: I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
      0081B9 4B 04            [ 1]  242 	push	#0x04
      0081BB 4B 02            [ 1]  243 	push	#0x02
      0081BD CD 95 B6         [ 4]  244 	call	_I2C_ClearFlag
      0081C0 85               [ 2]  245 	popw	x
                                    246 ;	user/RTC_pcf8563.c: 59: res = 0;
      0081C1 0F 01            [ 1]  247 	clr	(0x01, sp)
                                    248 ;	user/RTC_pcf8563.c: 60: goto stop;
      0081C3 CC 82 60         [ 2]  249 	jp	00132$
      0081C6                        250 00118$:
                                    251 ;	user/RTC_pcf8563.c: 64: I2C_SendData(addr);
      0081C6 7B 28            [ 1]  252 	ld	a, (0x28, sp)
      0081C8 88               [ 1]  253 	push	a
      0081C9 CD 94 FD         [ 4]  254 	call	_I2C_SendData
      0081CC 84               [ 1]  255 	pop	a
                                    256 ;	user/RTC_pcf8563.c: 65: timeout = 0x0FFF;
      0081CD AE 0F FF         [ 2]  257 	ldw	x, #0x0fff
      0081D0 1F 04            [ 2]  258 	ldw	(0x04, sp), x
      0081D2 5F               [ 1]  259 	clrw	x
      0081D3 1F 02            [ 2]  260 	ldw	(0x02, sp), x
                                    261 ;	user/RTC_pcf8563.c: 67: while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
      0081D5                        262 00121$:
      0081D5 4B 84            [ 1]  263 	push	#0x84
      0081D7 4B 07            [ 1]  264 	push	#0x07
      0081D9 CD 95 04         [ 4]  265 	call	_I2C_CheckEvent
      0081DC 85               [ 2]  266 	popw	x
      0081DD 4D               [ 1]  267 	tnz	a
      0081DE 26 28            [ 1]  268 	jrne	00152$
                                    269 ;	user/RTC_pcf8563.c: 69: if(!timeout--)
      0081E0 16 04            [ 2]  270 	ldw	y, (0x04, sp)
      0081E2 17 1F            [ 2]  271 	ldw	(0x1f, sp), y
      0081E4 16 02            [ 2]  272 	ldw	y, (0x02, sp)
      0081E6 17 1D            [ 2]  273 	ldw	(0x1d, sp), y
      0081E8 16 04            [ 2]  274 	ldw	y, (0x04, sp)
      0081EA 72 A2 00 01      [ 2]  275 	subw	y, #0x0001
      0081EE 7B 03            [ 1]  276 	ld	a, (0x03, sp)
      0081F0 A2 00            [ 1]  277 	sbc	a, #0x00
      0081F2 97               [ 1]  278 	ld	xl, a
      0081F3 7B 02            [ 1]  279 	ld	a, (0x02, sp)
      0081F5 A2 00            [ 1]  280 	sbc	a, #0x00
      0081F7 95               [ 1]  281 	ld	xh, a
      0081F8 17 04            [ 2]  282 	ldw	(0x04, sp), y
      0081FA 1F 02            [ 2]  283 	ldw	(0x02, sp), x
      0081FC 1E 1F            [ 2]  284 	ldw	x, (0x1f, sp)
      0081FE 26 D5            [ 1]  285 	jrne	00121$
      008200 1E 1D            [ 2]  286 	ldw	x, (0x1d, sp)
      008202 26 D1            [ 1]  287 	jrne	00121$
                                    288 ;	user/RTC_pcf8563.c: 71: res = 0;
      008204 0F 01            [ 1]  289 	clr	(0x01, sp)
                                    290 ;	user/RTC_pcf8563.c: 72: goto stop;
      008206 20 58            [ 2]  291 	jra	00132$
                                    292 ;	user/RTC_pcf8563.c: 76: while(count)
      008208                        293 00152$:
      008208 16 29            [ 2]  294 	ldw	y, (0x29, sp)
      00820A 17 06            [ 2]  295 	ldw	(0x06, sp), y
      00820C 7B 2B            [ 1]  296 	ld	a, (0x2b, sp)
      00820E 6B 25            [ 1]  297 	ld	(0x25, sp), a
      008210                        298 00129$:
      008210 0D 25            [ 1]  299 	tnz	(0x25, sp)
      008212 27 4C            [ 1]  300 	jreq	00132$
                                    301 ;	user/RTC_pcf8563.c: 78: I2C_SendData(*data);
      008214 1E 06            [ 2]  302 	ldw	x, (0x06, sp)
      008216 F6               [ 1]  303 	ld	a, (x)
      008217 88               [ 1]  304 	push	a
      008218 CD 94 FD         [ 4]  305 	call	_I2C_SendData
      00821B 84               [ 1]  306 	pop	a
                                    307 ;	user/RTC_pcf8563.c: 79: timeout = 0x0FFF;
      00821C AE 0F FF         [ 2]  308 	ldw	x, #0x0fff
      00821F 1F 04            [ 2]  309 	ldw	(0x04, sp), x
      008221 5F               [ 1]  310 	clrw	x
      008222 1F 02            [ 2]  311 	ldw	(0x02, sp), x
                                    312 ;	user/RTC_pcf8563.c: 81: while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
      008224                        313 00126$:
      008224 4B 84            [ 1]  314 	push	#0x84
      008226 4B 07            [ 1]  315 	push	#0x07
      008228 CD 95 04         [ 4]  316 	call	_I2C_CheckEvent
      00822B 85               [ 2]  317 	popw	x
      00822C 4D               [ 1]  318 	tnz	a
      00822D 26 28            [ 1]  319 	jrne	00128$
                                    320 ;	user/RTC_pcf8563.c: 83: if(!timeout--)
      00822F 16 04            [ 2]  321 	ldw	y, (0x04, sp)
      008231 17 12            [ 2]  322 	ldw	(0x12, sp), y
      008233 16 02            [ 2]  323 	ldw	y, (0x02, sp)
      008235 17 10            [ 2]  324 	ldw	(0x10, sp), y
      008237 16 04            [ 2]  325 	ldw	y, (0x04, sp)
      008239 72 A2 00 01      [ 2]  326 	subw	y, #0x0001
      00823D 7B 03            [ 1]  327 	ld	a, (0x03, sp)
      00823F A2 00            [ 1]  328 	sbc	a, #0x00
      008241 97               [ 1]  329 	ld	xl, a
      008242 7B 02            [ 1]  330 	ld	a, (0x02, sp)
      008244 A2 00            [ 1]  331 	sbc	a, #0x00
      008246 95               [ 1]  332 	ld	xh, a
      008247 17 04            [ 2]  333 	ldw	(0x04, sp), y
      008249 1F 02            [ 2]  334 	ldw	(0x02, sp), x
      00824B 1E 12            [ 2]  335 	ldw	x, (0x12, sp)
      00824D 26 D5            [ 1]  336 	jrne	00126$
      00824F 1E 10            [ 2]  337 	ldw	x, (0x10, sp)
      008251 26 D1            [ 1]  338 	jrne	00126$
                                    339 ;	user/RTC_pcf8563.c: 85: res = 0;
      008253 0F 01            [ 1]  340 	clr	(0x01, sp)
                                    341 ;	user/RTC_pcf8563.c: 86: goto stop;
      008255 20 09            [ 2]  342 	jra	00132$
      008257                        343 00128$:
                                    344 ;	user/RTC_pcf8563.c: 89: data++;
      008257 1E 06            [ 2]  345 	ldw	x, (0x06, sp)
      008259 5C               [ 2]  346 	incw	x
      00825A 1F 06            [ 2]  347 	ldw	(0x06, sp), x
                                    348 ;	user/RTC_pcf8563.c: 90: count--;
      00825C 0A 25            [ 1]  349 	dec	(0x25, sp)
      00825E 20 B0            [ 2]  350 	jra	00129$
                                    351 ;	user/RTC_pcf8563.c: 93: stop: I2C_GenerateSTOP(ENABLE);
      008260                        352 00132$:
      008260 4B 01            [ 1]  353 	push	#0x01
      008262 CD 94 58         [ 4]  354 	call	_I2C_GenerateSTOP
      008265 84               [ 1]  355 	pop	a
                                    356 ;	user/RTC_pcf8563.c: 94: return res;
      008266 7B 01            [ 1]  357 	ld	a, (0x01, sp)
      008268                        358 00133$:
      008268 5B 25            [ 2]  359 	addw	sp, #37
      00826A 81               [ 4]  360 	ret
                                    361 ;	user/RTC_pcf8563.c: 97: uint8_t PCF_Read(uint8_t addr, uint8_t *data, uint8_t count)
                                    362 ;	-----------------------------------------
                                    363 ;	 function PCF_Read
                                    364 ;	-----------------------------------------
      00826B                        365 _PCF_Read:
      00826B 52 25            [ 2]  366 	sub	sp, #37
                                    367 ;	user/RTC_pcf8563.c: 99: uint8_t res = 1;
      00826D A6 01            [ 1]  368 	ld	a, #0x01
      00826F 6B 01            [ 1]  369 	ld	(0x01, sp), a
                                    370 ;	user/RTC_pcf8563.c: 101: timeout = 0x0FFF;
      008271 AE 0F FF         [ 2]  371 	ldw	x, #0x0fff
      008274 1F 04            [ 2]  372 	ldw	(0x04, sp), x
      008276 5F               [ 1]  373 	clrw	x
      008277 1F 02            [ 2]  374 	ldw	(0x02, sp), x
                                    375 ;	user/RTC_pcf8563.c: 103: while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY))
      008279                        376 00103$:
      008279 4B 02            [ 1]  377 	push	#0x02
      00827B 4B 03            [ 1]  378 	push	#0x03
      00827D CD 95 7F         [ 4]  379 	call	_I2C_GetFlagStatus
      008280 85               [ 2]  380 	popw	x
      008281 4D               [ 1]  381 	tnz	a
      008282 27 2F            [ 1]  382 	jreq	00105$
                                    383 ;	user/RTC_pcf8563.c: 105: if(!timeout--)
      008284 16 04            [ 2]  384 	ldw	y, (0x04, sp)
      008286 17 1D            [ 2]  385 	ldw	(0x1d, sp), y
      008288 16 02            [ 2]  386 	ldw	y, (0x02, sp)
      00828A 17 1B            [ 2]  387 	ldw	(0x1b, sp), y
      00828C 1E 04            [ 2]  388 	ldw	x, (0x04, sp)
      00828E 1D 00 01         [ 2]  389 	subw	x, #0x0001
      008291 1F 24            [ 2]  390 	ldw	(0x24, sp), x
      008293 7B 03            [ 1]  391 	ld	a, (0x03, sp)
      008295 A2 00            [ 1]  392 	sbc	a, #0x00
      008297 6B 23            [ 1]  393 	ld	(0x23, sp), a
      008299 7B 02            [ 1]  394 	ld	a, (0x02, sp)
      00829B A2 00            [ 1]  395 	sbc	a, #0x00
      00829D 6B 22            [ 1]  396 	ld	(0x22, sp), a
      00829F 16 24            [ 2]  397 	ldw	y, (0x24, sp)
      0082A1 17 04            [ 2]  398 	ldw	(0x04, sp), y
      0082A3 16 22            [ 2]  399 	ldw	y, (0x22, sp)
      0082A5 17 02            [ 2]  400 	ldw	(0x02, sp), y
      0082A7 1E 1D            [ 2]  401 	ldw	x, (0x1d, sp)
      0082A9 26 CE            [ 1]  402 	jrne	00103$
      0082AB 1E 1B            [ 2]  403 	ldw	x, (0x1b, sp)
      0082AD 26 CA            [ 1]  404 	jrne	00103$
                                    405 ;	user/RTC_pcf8563.c: 108: return res;
      0082AF 4F               [ 1]  406 	clr	a
      0082B0 CC 84 E6         [ 2]  407 	jp	00155$
      0082B3                        408 00105$:
                                    409 ;	user/RTC_pcf8563.c: 112: I2C_GenerateSTART(ENABLE);
      0082B3 4B 01            [ 1]  410 	push	#0x01
      0082B5 CD 94 4A         [ 4]  411 	call	_I2C_GenerateSTART
      0082B8 84               [ 1]  412 	pop	a
                                    413 ;	user/RTC_pcf8563.c: 113: timeout = 0x0FFF;
      0082B9 AE 0F FF         [ 2]  414 	ldw	x, #0x0fff
      0082BC 1F 04            [ 2]  415 	ldw	(0x04, sp), x
      0082BE 5F               [ 1]  416 	clrw	x
      0082BF 1F 02            [ 2]  417 	ldw	(0x02, sp), x
                                    418 ;	user/RTC_pcf8563.c: 115: while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
      0082C1                        419 00108$:
      0082C1 4B 01            [ 1]  420 	push	#0x01
      0082C3 4B 03            [ 1]  421 	push	#0x03
      0082C5 CD 95 04         [ 4]  422 	call	_I2C_CheckEvent
      0082C8 85               [ 2]  423 	popw	x
      0082C9 6B 21            [ 1]  424 	ld	(0x21, sp), a
      0082CB 0D 21            [ 1]  425 	tnz	(0x21, sp)
      0082CD 26 29            [ 1]  426 	jrne	00110$
                                    427 ;	user/RTC_pcf8563.c: 117: if(!timeout--)
      0082CF 16 04            [ 2]  428 	ldw	y, (0x04, sp)
      0082D1 17 08            [ 2]  429 	ldw	(0x08, sp), y
      0082D3 16 02            [ 2]  430 	ldw	y, (0x02, sp)
      0082D5 17 06            [ 2]  431 	ldw	(0x06, sp), y
      0082D7 16 04            [ 2]  432 	ldw	y, (0x04, sp)
      0082D9 72 A2 00 01      [ 2]  433 	subw	y, #0x0001
      0082DD 7B 03            [ 1]  434 	ld	a, (0x03, sp)
      0082DF A2 00            [ 1]  435 	sbc	a, #0x00
      0082E1 97               [ 1]  436 	ld	xl, a
      0082E2 7B 02            [ 1]  437 	ld	a, (0x02, sp)
      0082E4 A2 00            [ 1]  438 	sbc	a, #0x00
      0082E6 95               [ 1]  439 	ld	xh, a
      0082E7 17 04            [ 2]  440 	ldw	(0x04, sp), y
      0082E9 1F 02            [ 2]  441 	ldw	(0x02, sp), x
      0082EB 1E 08            [ 2]  442 	ldw	x, (0x08, sp)
      0082ED 26 D2            [ 1]  443 	jrne	00108$
      0082EF 1E 06            [ 2]  444 	ldw	x, (0x06, sp)
      0082F1 26 CE            [ 1]  445 	jrne	00108$
                                    446 ;	user/RTC_pcf8563.c: 119: res = 0;
      0082F3 0F 01            [ 1]  447 	clr	(0x01, sp)
                                    448 ;	user/RTC_pcf8563.c: 120: goto stop;
      0082F5 CC 84 DE         [ 2]  449 	jp	00154$
      0082F8                        450 00110$:
                                    451 ;	user/RTC_pcf8563.c: 124: I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
      0082F8 4B 00            [ 1]  452 	push	#0x00
      0082FA 4B A2            [ 1]  453 	push	#0xa2
      0082FC CD 94 EE         [ 4]  454 	call	_I2C_Send7bitAddress
      0082FF 85               [ 2]  455 	popw	x
                                    456 ;	user/RTC_pcf8563.c: 125: timeout = 0x0FFF;
      008300 AE 0F FF         [ 2]  457 	ldw	x, #0x0fff
      008303 1F 04            [ 2]  458 	ldw	(0x04, sp), x
      008305 5F               [ 1]  459 	clrw	x
      008306 1F 02            [ 2]  460 	ldw	(0x02, sp), x
                                    461 ;	user/RTC_pcf8563.c: 126: while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
      008308                        462 00116$:
      008308 4B 82            [ 1]  463 	push	#0x82
      00830A 4B 07            [ 1]  464 	push	#0x07
      00830C CD 95 04         [ 4]  465 	call	_I2C_CheckEvent
      00830F 85               [ 2]  466 	popw	x
      008310 4D               [ 1]  467 	tnz	a
      008311 26 42            [ 1]  468 	jrne	00118$
                                    469 ;	user/RTC_pcf8563.c: 128: if(!timeout--)
      008313 16 02            [ 2]  470 	ldw	y, (0x02, sp)
      008315 17 0A            [ 2]  471 	ldw	(0x0a, sp), y
      008317 1E 04            [ 2]  472 	ldw	x, (0x04, sp)
      008319 16 04            [ 2]  473 	ldw	y, (0x04, sp)
      00831B 72 A2 00 01      [ 2]  474 	subw	y, #0x0001
      00831F 7B 03            [ 1]  475 	ld	a, (0x03, sp)
      008321 A2 00            [ 1]  476 	sbc	a, #0x00
      008323 6B 14            [ 1]  477 	ld	(0x14, sp), a
      008325 7B 02            [ 1]  478 	ld	a, (0x02, sp)
      008327 A2 00            [ 1]  479 	sbc	a, #0x00
      008329 17 04            [ 2]  480 	ldw	(0x04, sp), y
      00832B 6B 02            [ 1]  481 	ld	(0x02, sp), a
      00832D 7B 14            [ 1]  482 	ld	a, (0x14, sp)
      00832F 6B 03            [ 1]  483 	ld	(0x03, sp), a
      008331 5D               [ 2]  484 	tnzw	x
      008332 26 09            [ 1]  485 	jrne	00114$
      008334 1E 0A            [ 2]  486 	ldw	x, (0x0a, sp)
      008336 26 05            [ 1]  487 	jrne	00114$
                                    488 ;	user/RTC_pcf8563.c: 130: res = 0;
      008338 0F 01            [ 1]  489 	clr	(0x01, sp)
                                    490 ;	user/RTC_pcf8563.c: 131: goto stop;
      00833A CC 84 DE         [ 2]  491 	jp	00154$
      00833D                        492 00114$:
                                    493 ;	user/RTC_pcf8563.c: 133: else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
      00833D 4B 04            [ 1]  494 	push	#0x04
      00833F 4B 02            [ 1]  495 	push	#0x02
      008341 CD 95 7F         [ 4]  496 	call	_I2C_GetFlagStatus
      008344 85               [ 2]  497 	popw	x
      008345 4D               [ 1]  498 	tnz	a
      008346 27 C0            [ 1]  499 	jreq	00116$
                                    500 ;	user/RTC_pcf8563.c: 135: I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
      008348 4B 04            [ 1]  501 	push	#0x04
      00834A 4B 02            [ 1]  502 	push	#0x02
      00834C CD 95 B6         [ 4]  503 	call	_I2C_ClearFlag
      00834F 85               [ 2]  504 	popw	x
                                    505 ;	user/RTC_pcf8563.c: 136: res = 0;
      008350 0F 01            [ 1]  506 	clr	(0x01, sp)
                                    507 ;	user/RTC_pcf8563.c: 137: goto stop;
      008352 CC 84 DE         [ 2]  508 	jp	00154$
      008355                        509 00118$:
                                    510 ;	user/RTC_pcf8563.c: 141: I2C_SendData(addr);
      008355 7B 28            [ 1]  511 	ld	a, (0x28, sp)
      008357 88               [ 1]  512 	push	a
      008358 CD 94 FD         [ 4]  513 	call	_I2C_SendData
      00835B 84               [ 1]  514 	pop	a
                                    515 ;	user/RTC_pcf8563.c: 142: timeout = 0x0FFF;
      00835C AE 0F FF         [ 2]  516 	ldw	x, #0x0fff
      00835F 1F 04            [ 2]  517 	ldw	(0x04, sp), x
      008361 5F               [ 1]  518 	clrw	x
      008362 1F 02            [ 2]  519 	ldw	(0x02, sp), x
                                    520 ;	user/RTC_pcf8563.c: 143: while(!I2C_CheckEvent(I2C_FLAG_TRANSFERFINISHED))
      008364                        521 00121$:
      008364 4B 04            [ 1]  522 	push	#0x04
      008366 4B 01            [ 1]  523 	push	#0x01
      008368 CD 95 04         [ 4]  524 	call	_I2C_CheckEvent
      00836B 85               [ 2]  525 	popw	x
      00836C 4D               [ 1]  526 	tnz	a
      00836D 26 29            [ 1]  527 	jrne	00123$
                                    528 ;	user/RTC_pcf8563.c: 145: if(!timeout--)
      00836F 16 04            [ 2]  529 	ldw	y, (0x04, sp)
      008371 17 19            [ 2]  530 	ldw	(0x19, sp), y
      008373 16 02            [ 2]  531 	ldw	y, (0x02, sp)
      008375 17 17            [ 2]  532 	ldw	(0x17, sp), y
      008377 16 04            [ 2]  533 	ldw	y, (0x04, sp)
      008379 72 A2 00 01      [ 2]  534 	subw	y, #0x0001
      00837D 7B 03            [ 1]  535 	ld	a, (0x03, sp)
      00837F A2 00            [ 1]  536 	sbc	a, #0x00
      008381 97               [ 1]  537 	ld	xl, a
      008382 7B 02            [ 1]  538 	ld	a, (0x02, sp)
      008384 A2 00            [ 1]  539 	sbc	a, #0x00
      008386 95               [ 1]  540 	ld	xh, a
      008387 17 04            [ 2]  541 	ldw	(0x04, sp), y
      008389 1F 02            [ 2]  542 	ldw	(0x02, sp), x
      00838B 1E 19            [ 2]  543 	ldw	x, (0x19, sp)
      00838D 26 D5            [ 1]  544 	jrne	00121$
      00838F 1E 17            [ 2]  545 	ldw	x, (0x17, sp)
      008391 26 D1            [ 1]  546 	jrne	00121$
                                    547 ;	user/RTC_pcf8563.c: 147: res = 0;
      008393 0F 01            [ 1]  548 	clr	(0x01, sp)
                                    549 ;	user/RTC_pcf8563.c: 148: goto stop;
      008395 CC 84 DE         [ 2]  550 	jp	00154$
      008398                        551 00123$:
                                    552 ;	user/RTC_pcf8563.c: 153: I2C_GenerateSTART(ENABLE);
      008398 4B 01            [ 1]  553 	push	#0x01
      00839A CD 94 4A         [ 4]  554 	call	_I2C_GenerateSTART
      00839D 84               [ 1]  555 	pop	a
                                    556 ;	user/RTC_pcf8563.c: 154: timeout = 0x0FFF;
      00839E AE 0F FF         [ 2]  557 	ldw	x, #0x0fff
      0083A1 1F 04            [ 2]  558 	ldw	(0x04, sp), x
      0083A3 5F               [ 1]  559 	clrw	x
      0083A4 1F 02            [ 2]  560 	ldw	(0x02, sp), x
                                    561 ;	user/RTC_pcf8563.c: 155: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT))
      0083A6                        562 00126$:
      0083A6 4B 01            [ 1]  563 	push	#0x01
      0083A8 4B 03            [ 1]  564 	push	#0x03
      0083AA CD 95 04         [ 4]  565 	call	_I2C_CheckEvent
      0083AD 85               [ 2]  566 	popw	x
      0083AE 4D               [ 1]  567 	tnz	a
      0083AF 26 29            [ 1]  568 	jrne	00128$
                                    569 ;	user/RTC_pcf8563.c: 157: if(!timeout--)
      0083B1 16 04            [ 2]  570 	ldw	y, (0x04, sp)
      0083B3 17 10            [ 2]  571 	ldw	(0x10, sp), y
      0083B5 16 02            [ 2]  572 	ldw	y, (0x02, sp)
      0083B7 17 0E            [ 2]  573 	ldw	(0x0e, sp), y
      0083B9 16 04            [ 2]  574 	ldw	y, (0x04, sp)
      0083BB 72 A2 00 01      [ 2]  575 	subw	y, #0x0001
      0083BF 7B 03            [ 1]  576 	ld	a, (0x03, sp)
      0083C1 A2 00            [ 1]  577 	sbc	a, #0x00
      0083C3 97               [ 1]  578 	ld	xl, a
      0083C4 7B 02            [ 1]  579 	ld	a, (0x02, sp)
      0083C6 A2 00            [ 1]  580 	sbc	a, #0x00
      0083C8 95               [ 1]  581 	ld	xh, a
      0083C9 17 04            [ 2]  582 	ldw	(0x04, sp), y
      0083CB 1F 02            [ 2]  583 	ldw	(0x02, sp), x
      0083CD 1E 10            [ 2]  584 	ldw	x, (0x10, sp)
      0083CF 26 D5            [ 1]  585 	jrne	00126$
      0083D1 1E 0E            [ 2]  586 	ldw	x, (0x0e, sp)
      0083D3 26 D1            [ 1]  587 	jrne	00126$
                                    588 ;	user/RTC_pcf8563.c: 159: res = 0;
      0083D5 0F 01            [ 1]  589 	clr	(0x01, sp)
                                    590 ;	user/RTC_pcf8563.c: 160: goto stop;
      0083D7 CC 84 DE         [ 2]  591 	jp	00154$
      0083DA                        592 00128$:
                                    593 ;	user/RTC_pcf8563.c: 164: I2C_Send7bitAddress(PCF8563_READ_ADDR, I2C_DIRECTION_RX);
      0083DA 4B 01            [ 1]  594 	push	#0x01
      0083DC 4B A3            [ 1]  595 	push	#0xa3
      0083DE CD 94 EE         [ 4]  596 	call	_I2C_Send7bitAddress
      0083E1 85               [ 2]  597 	popw	x
                                    598 ;	user/RTC_pcf8563.c: 165: timeout = 0x0FFF;
      0083E2 AE 0F FF         [ 2]  599 	ldw	x, #0x0fff
      0083E5 1F 04            [ 2]  600 	ldw	(0x04, sp), x
      0083E7 5F               [ 1]  601 	clrw	x
      0083E8 1F 02            [ 2]  602 	ldw	(0x02, sp), x
                                    603 ;	user/RTC_pcf8563.c: 166: while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
      0083EA                        604 00134$:
      0083EA 4B 02            [ 1]  605 	push	#0x02
      0083EC 4B 03            [ 1]  606 	push	#0x03
      0083EE CD 95 04         [ 4]  607 	call	_I2C_CheckEvent
      0083F1 85               [ 2]  608 	popw	x
      0083F2 4D               [ 1]  609 	tnz	a
      0083F3 26 25            [ 1]  610 	jrne	00136$
                                    611 ;	user/RTC_pcf8563.c: 168: if(!timeout)
      0083F5 1E 04            [ 2]  612 	ldw	x, (0x04, sp)
      0083F7 26 09            [ 1]  613 	jrne	00132$
      0083F9 1E 02            [ 2]  614 	ldw	x, (0x02, sp)
      0083FB 26 05            [ 1]  615 	jrne	00132$
                                    616 ;	user/RTC_pcf8563.c: 170: res = 0;
      0083FD 0F 01            [ 1]  617 	clr	(0x01, sp)
                                    618 ;	user/RTC_pcf8563.c: 171: goto stop;
      0083FF CC 84 DE         [ 2]  619 	jp	00154$
      008402                        620 00132$:
                                    621 ;	user/RTC_pcf8563.c: 173: else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
      008402 4B 04            [ 1]  622 	push	#0x04
      008404 4B 02            [ 1]  623 	push	#0x02
      008406 CD 95 7F         [ 4]  624 	call	_I2C_GetFlagStatus
      008409 85               [ 2]  625 	popw	x
      00840A 4D               [ 1]  626 	tnz	a
      00840B 27 DD            [ 1]  627 	jreq	00134$
                                    628 ;	user/RTC_pcf8563.c: 175: I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
      00840D 4B 04            [ 1]  629 	push	#0x04
      00840F 4B 02            [ 1]  630 	push	#0x02
      008411 CD 95 B6         [ 4]  631 	call	_I2C_ClearFlag
      008414 85               [ 2]  632 	popw	x
                                    633 ;	user/RTC_pcf8563.c: 176: res = 0;
      008415 0F 01            [ 1]  634 	clr	(0x01, sp)
                                    635 ;	user/RTC_pcf8563.c: 177: goto stop;
      008417 CC 84 DE         [ 2]  636 	jp	00154$
      00841A                        637 00136$:
                                    638 ;	user/RTC_pcf8563.c: 180: disableInterrupts();
      00841A 9B               [ 1]  639 	sim
                                    640 ;	user/RTC_pcf8563.c: 181: while(count)
      00841B 16 29            [ 2]  641 	ldw	y, (0x29, sp)
      00841D 17 1F            [ 2]  642 	ldw	(0x1f, sp), y
      00841F 7B 2B            [ 1]  643 	ld	a, (0x2b, sp)
      008421 6B 12            [ 1]  644 	ld	(0x12, sp), a
      008423                        645 00151$:
      008423 0D 12            [ 1]  646 	tnz	(0x12, sp)
      008425 26 03            [ 1]  647 	jrne	00294$
      008427 CC 84 DD         [ 2]  648 	jp	00153$
      00842A                        649 00294$:
                                    650 ;	user/RTC_pcf8563.c: 183: timeout = 0x0FFF;
      00842A AE 0F FF         [ 2]  651 	ldw	x, #0x0fff
      00842D 1F 04            [ 2]  652 	ldw	(0x04, sp), x
      00842F 5F               [ 1]  653 	clrw	x
      008430 1F 02            [ 2]  654 	ldw	(0x02, sp), x
                                    655 ;	user/RTC_pcf8563.c: 184: while(--timeout && I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);
      008432                        656 00138$:
      008432 16 04            [ 2]  657 	ldw	y, (0x04, sp)
      008434 72 A2 00 01      [ 2]  658 	subw	y, #0x0001
      008438 7B 03            [ 1]  659 	ld	a, (0x03, sp)
      00843A A2 00            [ 1]  660 	sbc	a, #0x00
      00843C 97               [ 1]  661 	ld	xl, a
      00843D 7B 02            [ 1]  662 	ld	a, (0x02, sp)
      00843F A2 00            [ 1]  663 	sbc	a, #0x00
      008441 95               [ 1]  664 	ld	xh, a
      008442 17 04            [ 2]  665 	ldw	(0x04, sp), y
      008444 1F 02            [ 2]  666 	ldw	(0x02, sp), x
      008446 1E 04            [ 2]  667 	ldw	x, (0x04, sp)
      008448 26 04            [ 1]  668 	jrne	00295$
      00844A 1E 02            [ 2]  669 	ldw	x, (0x02, sp)
      00844C 27 0B            [ 1]  670 	jreq	00140$
      00844E                        671 00295$:
      00844E 4B 04            [ 1]  672 	push	#0x04
      008450 4B 01            [ 1]  673 	push	#0x01
      008452 CD 95 7F         [ 4]  674 	call	_I2C_GetFlagStatus
      008455 85               [ 2]  675 	popw	x
      008456 4D               [ 1]  676 	tnz	a
      008457 27 D9            [ 1]  677 	jreq	00138$
      008459                        678 00140$:
                                    679 ;	user/RTC_pcf8563.c: 185: if(count == 0)
      008459 0D 12            [ 1]  680 	tnz	(0x12, sp)
      00845B 26 0C            [ 1]  681 	jrne	00142$
                                    682 ;	user/RTC_pcf8563.c: 187: I2C_AcknowledgeConfig(I2C_ACK_NONE);
      00845D 4B 00            [ 1]  683 	push	#0x00
      00845F CD 94 88         [ 4]  684 	call	_I2C_AcknowledgeConfig
      008462 84               [ 1]  685 	pop	a
                                    686 ;	user/RTC_pcf8563.c: 188: I2C_GenerateSTOP(ENABLE);
      008463 4B 01            [ 1]  687 	push	#0x01
      008465 CD 94 58         [ 4]  688 	call	_I2C_GenerateSTOP
      008468 84               [ 1]  689 	pop	a
      008469                        690 00142$:
                                    691 ;	user/RTC_pcf8563.c: 190: I2C_AcknowledgeConfig(I2C_ACK_CURR);
      008469 4B 01            [ 1]  692 	push	#0x01
      00846B CD 94 88         [ 4]  693 	call	_I2C_AcknowledgeConfig
      00846E 84               [ 1]  694 	pop	a
                                    695 ;	user/RTC_pcf8563.c: 194: timeout = 0x0FFF;
      00846F AE 0F FF         [ 2]  696 	ldw	x, #0x0fff
      008472 1F 04            [ 2]  697 	ldw	(0x04, sp), x
      008474 5F               [ 1]  698 	clrw	x
      008475 1F 02            [ 2]  699 	ldw	(0x02, sp), x
                                    700 ;	user/RTC_pcf8563.c: 195: while (--timeout && I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) == RESET);
      008477                        701 00144$:
      008477 16 04            [ 2]  702 	ldw	y, (0x04, sp)
      008479 72 A2 00 01      [ 2]  703 	subw	y, #0x0001
      00847D 7B 03            [ 1]  704 	ld	a, (0x03, sp)
      00847F A2 00            [ 1]  705 	sbc	a, #0x00
      008481 97               [ 1]  706 	ld	xl, a
      008482 7B 02            [ 1]  707 	ld	a, (0x02, sp)
      008484 A2 00            [ 1]  708 	sbc	a, #0x00
      008486 95               [ 1]  709 	ld	xh, a
      008487 17 04            [ 2]  710 	ldw	(0x04, sp), y
      008489 1F 02            [ 2]  711 	ldw	(0x02, sp), x
      00848B 1E 04            [ 2]  712 	ldw	x, (0x04, sp)
      00848D 26 04            [ 1]  713 	jrne	00298$
      00848F 1E 02            [ 2]  714 	ldw	x, (0x02, sp)
      008491 27 0B            [ 1]  715 	jreq	00146$
      008493                        716 00298$:
      008493 4B 40            [ 1]  717 	push	#0x40
      008495 4B 01            [ 1]  718 	push	#0x01
      008497 CD 95 7F         [ 4]  719 	call	_I2C_GetFlagStatus
      00849A 85               [ 2]  720 	popw	x
      00849B 4D               [ 1]  721 	tnz	a
      00849C 27 D9            [ 1]  722 	jreq	00144$
      00849E                        723 00146$:
                                    724 ;	user/RTC_pcf8563.c: 196: timeout = 0x0FFF;
      00849E AE 0F FF         [ 2]  725 	ldw	x, #0x0fff
      0084A1 1F 04            [ 2]  726 	ldw	(0x04, sp), x
      0084A3 5F               [ 1]  727 	clrw	x
      0084A4 1F 02            [ 2]  728 	ldw	(0x02, sp), x
                                    729 ;	user/RTC_pcf8563.c: 197: while(--timeout && !I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED));
      0084A6                        730 00148$:
      0084A6 16 04            [ 2]  731 	ldw	y, (0x04, sp)
      0084A8 72 A2 00 01      [ 2]  732 	subw	y, #0x0001
      0084AC 7B 03            [ 1]  733 	ld	a, (0x03, sp)
      0084AE A2 00            [ 1]  734 	sbc	a, #0x00
      0084B0 97               [ 1]  735 	ld	xl, a
      0084B1 7B 02            [ 1]  736 	ld	a, (0x02, sp)
      0084B3 A2 00            [ 1]  737 	sbc	a, #0x00
      0084B5 95               [ 1]  738 	ld	xh, a
      0084B6 17 04            [ 2]  739 	ldw	(0x04, sp), y
      0084B8 1F 02            [ 2]  740 	ldw	(0x02, sp), x
      0084BA 1E 04            [ 2]  741 	ldw	x, (0x04, sp)
      0084BC 26 04            [ 1]  742 	jrne	00300$
      0084BE 1E 02            [ 2]  743 	ldw	x, (0x02, sp)
      0084C0 27 0B            [ 1]  744 	jreq	00150$
      0084C2                        745 00300$:
      0084C2 4B 40            [ 1]  746 	push	#0x40
      0084C4 4B 03            [ 1]  747 	push	#0x03
      0084C6 CD 95 04         [ 4]  748 	call	_I2C_CheckEvent
      0084C9 85               [ 2]  749 	popw	x
      0084CA 4D               [ 1]  750 	tnz	a
      0084CB 27 D9            [ 1]  751 	jreq	00148$
      0084CD                        752 00150$:
                                    753 ;	user/RTC_pcf8563.c: 198: *data = I2C_ReceiveData();
      0084CD CD 94 E9         [ 4]  754 	call	_I2C_ReceiveData
      0084D0 1E 1F            [ 2]  755 	ldw	x, (0x1f, sp)
      0084D2 F7               [ 1]  756 	ld	(x), a
                                    757 ;	user/RTC_pcf8563.c: 199: data++;
      0084D3 1E 1F            [ 2]  758 	ldw	x, (0x1f, sp)
      0084D5 5C               [ 2]  759 	incw	x
      0084D6 1F 1F            [ 2]  760 	ldw	(0x1f, sp), x
                                    761 ;	user/RTC_pcf8563.c: 200: count--;
      0084D8 0A 12            [ 1]  762 	dec	(0x12, sp)
      0084DA CC 84 23         [ 2]  763 	jp	00151$
      0084DD                        764 00153$:
                                    765 ;	user/RTC_pcf8563.c: 202: enableInterrupts();
      0084DD 9A               [ 1]  766 	rim
                                    767 ;	user/RTC_pcf8563.c: 203: stop: I2C_GenerateSTOP(ENABLE);
      0084DE                        768 00154$:
      0084DE 4B 01            [ 1]  769 	push	#0x01
      0084E0 CD 94 58         [ 4]  770 	call	_I2C_GenerateSTOP
      0084E3 84               [ 1]  771 	pop	a
                                    772 ;	user/RTC_pcf8563.c: 204: return res;
      0084E4 7B 01            [ 1]  773 	ld	a, (0x01, sp)
      0084E6                        774 00155$:
      0084E6 5B 25            [ 2]  775 	addw	sp, #37
      0084E8 81               [ 4]  776 	ret
                                    777 ;	user/RTC_pcf8563.c: 207: void PCF_Init(uint8_t mode)
                                    778 ;	-----------------------------------------
                                    779 ;	 function PCF_Init
                                    780 ;	-----------------------------------------
      0084E9                        781 _PCF_Init:
      0084E9 88               [ 1]  782 	push	a
                                    783 ;	user/RTC_pcf8563.c: 209: uint8_t tmp = 0x00;
      0084EA 0F 01            [ 1]  784 	clr	(0x01, sp)
                                    785 ;	user/RTC_pcf8563.c: 210: I2C_setup();
      0084EC CD 80 A0         [ 4]  786 	call	_I2C_setup
                                    787 ;	user/RTC_pcf8563.c: 211: PCF_Write(0x00, &tmp, 1);
      0084EF 96               [ 1]  788 	ldw	x, sp
      0084F0 5C               [ 2]  789 	incw	x
      0084F1 4B 01            [ 1]  790 	push	#0x01
      0084F3 89               [ 2]  791 	pushw	x
      0084F4 4B 00            [ 1]  792 	push	#0x00
      0084F6 CD 80 D6         [ 4]  793 	call	_PCF_Write
      0084F9 5B 04            [ 2]  794 	addw	sp, #4
                                    795 ;	user/RTC_pcf8563.c: 212: mode &= 0x13;
      0084FB 7B 04            [ 1]  796 	ld	a, (0x04, sp)
      0084FD A4 13            [ 1]  797 	and	a, #0x13
      0084FF 6B 04            [ 1]  798 	ld	(0x04, sp), a
                                    799 ;	user/RTC_pcf8563.c: 213: PCF_Write(0x00, &mode, 1);
      008501 96               [ 1]  800 	ldw	x, sp
      008502 1C 00 04         [ 2]  801 	addw	x, #4
      008505 4B 01            [ 1]  802 	push	#0x01
      008507 89               [ 2]  803 	pushw	x
      008508 4B 00            [ 1]  804 	push	#0x00
      00850A CD 80 D6         [ 4]  805 	call	_PCF_Write
      00850D 5B 05            [ 2]  806 	addw	sp, #5
      00850F 81               [ 4]  807 	ret
                                    808 ;	user/RTC_pcf8563.c: 216: uint8_t PCF_setDateTime(DateTime *dateTime)
                                    809 ;	-----------------------------------------
                                    810 ;	 function PCF_setDateTime
                                    811 ;	-----------------------------------------
      008510                        812 _PCF_setDateTime:
      008510 52 26            [ 2]  813 	sub	sp, #38
                                    814 ;	user/RTC_pcf8563.c: 219: if (dateTime->second >= 60 || dateTime->minute >= 60 || dateTime->hour >= 24 || dateTime->day > 32 || dateTime->weekday > 6 || dateTime->month > 12 || dateTime->year < 1900 || dateTime->year >= 2100)
      008512 16 29            [ 2]  815 	ldw	y, (0x29, sp)
      008514 17 20            [ 2]  816 	ldw	(0x20, sp), y
      008516 1E 20            [ 2]  817 	ldw	x, (0x20, sp)
      008518 F6               [ 1]  818 	ld	a, (x)
      008519 6B 09            [ 1]  819 	ld	(0x09, sp), a
      00851B 7B 09            [ 1]  820 	ld	a, (0x09, sp)
      00851D A1 3C            [ 1]  821 	cp	a, #0x3c
      00851F 24 55            [ 1]  822 	jrnc	00101$
      008521 16 20            [ 2]  823 	ldw	y, (0x20, sp)
      008523 90 5C            [ 2]  824 	incw	y
      008525 90 F6            [ 1]  825 	ld	a, (y)
      008527 A1 3C            [ 1]  826 	cp	a, #0x3c
      008529 24 4B            [ 1]  827 	jrnc	00101$
      00852B 1E 20            [ 2]  828 	ldw	x, (0x20, sp)
      00852D 5C               [ 2]  829 	incw	x
      00852E 5C               [ 2]  830 	incw	x
      00852F 1F 0C            [ 2]  831 	ldw	(0x0c, sp), x
      008531 1E 0C            [ 2]  832 	ldw	x, (0x0c, sp)
      008533 F6               [ 1]  833 	ld	a, (x)
      008534 A1 18            [ 1]  834 	cp	a, #0x18
      008536 24 3E            [ 1]  835 	jrnc	00101$
      008538 1E 20            [ 2]  836 	ldw	x, (0x20, sp)
      00853A 1C 00 03         [ 2]  837 	addw	x, #0x0003
      00853D 1F 17            [ 2]  838 	ldw	(0x17, sp), x
      00853F 1E 17            [ 2]  839 	ldw	x, (0x17, sp)
      008541 F6               [ 1]  840 	ld	a, (x)
      008542 A1 20            [ 1]  841 	cp	a, #0x20
      008544 22 30            [ 1]  842 	jrugt	00101$
      008546 1E 20            [ 2]  843 	ldw	x, (0x20, sp)
      008548 1C 00 04         [ 2]  844 	addw	x, #0x0004
      00854B 1F 15            [ 2]  845 	ldw	(0x15, sp), x
      00854D 1E 15            [ 2]  846 	ldw	x, (0x15, sp)
      00854F F6               [ 1]  847 	ld	a, (x)
      008550 A1 06            [ 1]  848 	cp	a, #0x06
      008552 22 22            [ 1]  849 	jrugt	00101$
      008554 1E 20            [ 2]  850 	ldw	x, (0x20, sp)
      008556 1C 00 05         [ 2]  851 	addw	x, #0x0005
      008559 1F 11            [ 2]  852 	ldw	(0x11, sp), x
      00855B 1E 11            [ 2]  853 	ldw	x, (0x11, sp)
      00855D F6               [ 1]  854 	ld	a, (x)
      00855E A1 0C            [ 1]  855 	cp	a, #0x0c
      008560 22 14            [ 1]  856 	jrugt	00101$
      008562 1E 20            [ 2]  857 	ldw	x, (0x20, sp)
      008564 1C 00 06         [ 2]  858 	addw	x, #0x0006
      008567 1F 1A            [ 2]  859 	ldw	(0x1a, sp), x
      008569 1E 1A            [ 2]  860 	ldw	x, (0x1a, sp)
      00856B FE               [ 2]  861 	ldw	x, (x)
      00856C A3 07 6C         [ 2]  862 	cpw	x, #0x076c
      00856F 25 05            [ 1]  863 	jrc	00101$
      008571 A3 08 34         [ 2]  864 	cpw	x, #0x0834
      008574 25 04            [ 1]  865 	jrc	00102$
      008576                        866 00101$:
                                    867 ;	user/RTC_pcf8563.c: 221: return 0;
      008576 4F               [ 1]  868 	clr	a
      008577 CC 86 AC         [ 2]  869 	jp	00113$
      00857A                        870 00102$:
                                    871 ;	user/RTC_pcf8563.c: 223: buffer[0] = BinToBCD(dateTime->second) & 0x7F;
      00857A 96               [ 1]  872 	ldw	x, sp
      00857B 5C               [ 2]  873 	incw	x
      00857C 1F 0A            [ 2]  874 	ldw	(0x0a, sp), x
      00857E 5F               [ 1]  875 	clrw	x
      00857F 7B 09            [ 1]  876 	ld	a, (0x09, sp)
      008581 97               [ 1]  877 	ld	xl, a
      008582 A6 0A            [ 1]  878 	ld	a, #0x0a
      008584 62               [ 2]  879 	div	x, a
      008585 9F               [ 1]  880 	ld	a, xl
      008586 4E               [ 1]  881 	swap	a
      008587 A4 F0            [ 1]  882 	and	a, #0xf0
      008589 6B 19            [ 1]  883 	ld	(0x19, sp), a
      00858B 5F               [ 1]  884 	clrw	x
      00858C 7B 09            [ 1]  885 	ld	a, (0x09, sp)
      00858E 97               [ 1]  886 	ld	xl, a
      00858F A6 0A            [ 1]  887 	ld	a, #0x0a
      008591 62               [ 2]  888 	div	x, a
      008592 1B 19            [ 1]  889 	add	a, (0x19, sp)
      008594 A4 7F            [ 1]  890 	and	a, #0x7f
      008596 1E 0A            [ 2]  891 	ldw	x, (0x0a, sp)
      008598 F7               [ 1]  892 	ld	(x), a
                                    893 ;	user/RTC_pcf8563.c: 224: buffer[1] = BinToBCD(dateTime->minute) & 0x7F;
      008599 1E 0A            [ 2]  894 	ldw	x, (0x0a, sp)
      00859B 5C               [ 2]  895 	incw	x
      00859C 1F 23            [ 2]  896 	ldw	(0x23, sp), x
      00859E 90 F6            [ 1]  897 	ld	a, (y)
      0085A0 97               [ 1]  898 	ld	xl, a
      0085A1 89               [ 2]  899 	pushw	x
      0085A2 4F               [ 1]  900 	clr	a
      0085A3 95               [ 1]  901 	ld	xh, a
      0085A4 A6 0A            [ 1]  902 	ld	a, #0x0a
      0085A6 62               [ 2]  903 	div	x, a
      0085A7 9F               [ 1]  904 	ld	a, xl
      0085A8 85               [ 2]  905 	popw	x
      0085A9 4E               [ 1]  906 	swap	a
      0085AA A4 F0            [ 1]  907 	and	a, #0xf0
      0085AC 6B 10            [ 1]  908 	ld	(0x10, sp), a
      0085AE 4F               [ 1]  909 	clr	a
      0085AF 95               [ 1]  910 	ld	xh, a
      0085B0 A6 0A            [ 1]  911 	ld	a, #0x0a
      0085B2 62               [ 2]  912 	div	x, a
      0085B3 1B 10            [ 1]  913 	add	a, (0x10, sp)
      0085B5 A4 7F            [ 1]  914 	and	a, #0x7f
      0085B7 1E 23            [ 2]  915 	ldw	x, (0x23, sp)
      0085B9 F7               [ 1]  916 	ld	(x), a
                                    917 ;	user/RTC_pcf8563.c: 225: buffer[2] = BinToBCD(dateTime->hour) & 0x3F;
      0085BA 16 0A            [ 2]  918 	ldw	y, (0x0a, sp)
      0085BC 72 A9 00 02      [ 2]  919 	addw	y, #0x0002
      0085C0 1E 0C            [ 2]  920 	ldw	x, (0x0c, sp)
      0085C2 F6               [ 1]  921 	ld	a, (x)
      0085C3 97               [ 1]  922 	ld	xl, a
      0085C4 89               [ 2]  923 	pushw	x
      0085C5 4F               [ 1]  924 	clr	a
      0085C6 95               [ 1]  925 	ld	xh, a
      0085C7 A6 0A            [ 1]  926 	ld	a, #0x0a
      0085C9 62               [ 2]  927 	div	x, a
      0085CA 9F               [ 1]  928 	ld	a, xl
      0085CB 85               [ 2]  929 	popw	x
      0085CC 4E               [ 1]  930 	swap	a
      0085CD A4 F0            [ 1]  931 	and	a, #0xf0
      0085CF 6B 22            [ 1]  932 	ld	(0x22, sp), a
      0085D1 4F               [ 1]  933 	clr	a
      0085D2 95               [ 1]  934 	ld	xh, a
      0085D3 A6 0A            [ 1]  935 	ld	a, #0x0a
      0085D5 62               [ 2]  936 	div	x, a
      0085D6 1B 22            [ 1]  937 	add	a, (0x22, sp)
      0085D8 A4 3F            [ 1]  938 	and	a, #0x3f
      0085DA 90 F7            [ 1]  939 	ld	(y), a
                                    940 ;	user/RTC_pcf8563.c: 226: buffer[3] = BinToBCD(dateTime->day) & 0x3F;
      0085DC 16 0A            [ 2]  941 	ldw	y, (0x0a, sp)
      0085DE 72 A9 00 03      [ 2]  942 	addw	y, #0x0003
      0085E2 1E 17            [ 2]  943 	ldw	x, (0x17, sp)
      0085E4 F6               [ 1]  944 	ld	a, (x)
      0085E5 97               [ 1]  945 	ld	xl, a
      0085E6 89               [ 2]  946 	pushw	x
      0085E7 4F               [ 1]  947 	clr	a
      0085E8 95               [ 1]  948 	ld	xh, a
      0085E9 A6 0A            [ 1]  949 	ld	a, #0x0a
      0085EB 62               [ 2]  950 	div	x, a
      0085EC 9F               [ 1]  951 	ld	a, xl
      0085ED 85               [ 2]  952 	popw	x
      0085EE 4E               [ 1]  953 	swap	a
      0085EF A4 F0            [ 1]  954 	and	a, #0xf0
      0085F1 6B 1E            [ 1]  955 	ld	(0x1e, sp), a
      0085F3 4F               [ 1]  956 	clr	a
      0085F4 95               [ 1]  957 	ld	xh, a
      0085F5 A6 0A            [ 1]  958 	ld	a, #0x0a
      0085F7 62               [ 2]  959 	div	x, a
      0085F8 1B 1E            [ 1]  960 	add	a, (0x1e, sp)
      0085FA A4 3F            [ 1]  961 	and	a, #0x3f
      0085FC 90 F7            [ 1]  962 	ld	(y), a
                                    963 ;	user/RTC_pcf8563.c: 227: buffer[4] = BinToBCD(dateTime->weekday) & 0x07;
      0085FE 16 0A            [ 2]  964 	ldw	y, (0x0a, sp)
      008600 72 A9 00 04      [ 2]  965 	addw	y, #0x0004
      008604 1E 15            [ 2]  966 	ldw	x, (0x15, sp)
      008606 F6               [ 1]  967 	ld	a, (x)
      008607 97               [ 1]  968 	ld	xl, a
      008608 89               [ 2]  969 	pushw	x
      008609 4F               [ 1]  970 	clr	a
      00860A 95               [ 1]  971 	ld	xh, a
      00860B A6 0A            [ 1]  972 	ld	a, #0x0a
      00860D 62               [ 2]  973 	div	x, a
      00860E 9F               [ 1]  974 	ld	a, xl
      00860F 85               [ 2]  975 	popw	x
      008610 4E               [ 1]  976 	swap	a
      008611 A4 F0            [ 1]  977 	and	a, #0xf0
      008613 6B 14            [ 1]  978 	ld	(0x14, sp), a
      008615 4F               [ 1]  979 	clr	a
      008616 95               [ 1]  980 	ld	xh, a
      008617 A6 0A            [ 1]  981 	ld	a, #0x0a
      008619 62               [ 2]  982 	div	x, a
      00861A 1B 14            [ 1]  983 	add	a, (0x14, sp)
      00861C A4 07            [ 1]  984 	and	a, #0x07
      00861E 90 F7            [ 1]  985 	ld	(y), a
                                    986 ;	user/RTC_pcf8563.c: 228: buffer[5] = BinToBCD(dateTime->month) & 0x1F;
      008620 1E 0A            [ 2]  987 	ldw	x, (0x0a, sp)
      008622 1C 00 05         [ 2]  988 	addw	x, #0x0005
      008625 1F 25            [ 2]  989 	ldw	(0x25, sp), x
      008627 1E 11            [ 2]  990 	ldw	x, (0x11, sp)
      008629 F6               [ 1]  991 	ld	a, (x)
      00862A 97               [ 1]  992 	ld	xl, a
      00862B 89               [ 2]  993 	pushw	x
      00862C 4F               [ 1]  994 	clr	a
      00862D 95               [ 1]  995 	ld	xh, a
      00862E A6 0A            [ 1]  996 	ld	a, #0x0a
      008630 62               [ 2]  997 	div	x, a
      008631 9F               [ 1]  998 	ld	a, xl
      008632 85               [ 2]  999 	popw	x
      008633 4E               [ 1] 1000 	swap	a
      008634 A4 F0            [ 1] 1001 	and	a, #0xf0
      008636 6B 08            [ 1] 1002 	ld	(0x08, sp), a
      008638 4F               [ 1] 1003 	clr	a
      008639 95               [ 1] 1004 	ld	xh, a
      00863A A6 0A            [ 1] 1005 	ld	a, #0x0a
      00863C 62               [ 2] 1006 	div	x, a
      00863D 1B 08            [ 1] 1007 	add	a, (0x08, sp)
      00863F A4 1F            [ 1] 1008 	and	a, #0x1f
      008641 1E 25            [ 2] 1009 	ldw	x, (0x25, sp)
      008643 F7               [ 1] 1010 	ld	(x), a
                                   1011 ;	user/RTC_pcf8563.c: 230: if (dateTime->year >= 2000)
      008644 1E 1A            [ 2] 1012 	ldw	x, (0x1a, sp)
      008646 FE               [ 2] 1013 	ldw	x, (x)
      008647 1F 0E            [ 2] 1014 	ldw	(0x0e, sp), x
                                   1015 ;	user/RTC_pcf8563.c: 233: buffer[6] = BinToBCD(dateTime->year - 2000);
      008649 1E 0A            [ 2] 1016 	ldw	x, (0x0a, sp)
      00864B 1C 00 06         [ 2] 1017 	addw	x, #0x0006
      00864E 1F 1C            [ 2] 1018 	ldw	(0x1c, sp), x
                                   1019 ;	user/RTC_pcf8563.c: 230: if (dateTime->year >= 2000)
      008650 1E 0E            [ 2] 1020 	ldw	x, (0x0e, sp)
      008652 A3 07 D0         [ 2] 1021 	cpw	x, #0x07d0
      008655 25 29            [ 1] 1022 	jrc	00111$
                                   1023 ;	user/RTC_pcf8563.c: 232: buffer[5] |= 0x80;
      008657 1E 25            [ 2] 1024 	ldw	x, (0x25, sp)
      008659 F6               [ 1] 1025 	ld	a, (x)
      00865A AA 80            [ 1] 1026 	or	a, #0x80
      00865C 1E 25            [ 2] 1027 	ldw	x, (0x25, sp)
      00865E F7               [ 1] 1028 	ld	(x), a
                                   1029 ;	user/RTC_pcf8563.c: 233: buffer[6] = BinToBCD(dateTime->year - 2000);
      00865F 1E 1A            [ 2] 1030 	ldw	x, (0x1a, sp)
      008661 FE               [ 2] 1031 	ldw	x, (x)
      008662 1D 07 D0         [ 2] 1032 	subw	x, #0x07d0
      008665 89               [ 2] 1033 	pushw	x
      008666 90 AE 00 0A      [ 2] 1034 	ldw	y, #0x000a
      00866A 65               [ 2] 1035 	divw	x, y
      00866B 9F               [ 1] 1036 	ld	a, xl
      00866C 85               [ 2] 1037 	popw	x
      00866D 4E               [ 1] 1038 	swap	a
      00866E A4 F0            [ 1] 1039 	and	a, #0xf0
      008670 6B 1F            [ 1] 1040 	ld	(0x1f, sp), a
      008672 90 AE 00 0A      [ 2] 1041 	ldw	y, #0x000a
      008676 65               [ 2] 1042 	divw	x, y
      008677 90 9F            [ 1] 1043 	ld	a, yl
      008679 1B 1F            [ 1] 1044 	add	a, (0x1f, sp)
      00867B 1E 1C            [ 2] 1045 	ldw	x, (0x1c, sp)
      00867D F7               [ 1] 1046 	ld	(x), a
      00867E 20 1E            [ 2] 1047 	jra	00112$
      008680                       1048 00111$:
                                   1049 ;	user/RTC_pcf8563.c: 237: buffer[6] = BinToBCD(dateTime->year - 1900);
      008680 1E 0E            [ 2] 1050 	ldw	x, (0x0e, sp)
      008682 1D 07 6C         [ 2] 1051 	subw	x, #0x076c
      008685 89               [ 2] 1052 	pushw	x
      008686 90 AE 00 0A      [ 2] 1053 	ldw	y, #0x000a
      00868A 65               [ 2] 1054 	divw	x, y
      00868B 9F               [ 1] 1055 	ld	a, xl
      00868C 85               [ 2] 1056 	popw	x
      00868D 4E               [ 1] 1057 	swap	a
      00868E A4 F0            [ 1] 1058 	and	a, #0xf0
      008690 90 AE 00 0A      [ 2] 1059 	ldw	y, #0x000a
      008694 65               [ 2] 1060 	divw	x, y
      008695 61               [ 1] 1061 	exg	a, yl
      008696 6B 13            [ 1] 1062 	ld	(0x13, sp), a
      008698 61               [ 1] 1063 	exg	a, yl
      008699 1B 13            [ 1] 1064 	add	a, (0x13, sp)
      00869B 1E 1C            [ 2] 1065 	ldw	x, (0x1c, sp)
      00869D F7               [ 1] 1066 	ld	(x), a
      00869E                       1067 00112$:
                                   1068 ;	user/RTC_pcf8563.c: 240: PCF_Write(0x02, buffer, sizeof(buffer));
      00869E 1E 0A            [ 2] 1069 	ldw	x, (0x0a, sp)
      0086A0 4B 07            [ 1] 1070 	push	#0x07
      0086A2 89               [ 2] 1071 	pushw	x
      0086A3 4B 02            [ 1] 1072 	push	#0x02
      0086A5 CD 80 D6         [ 4] 1073 	call	_PCF_Write
      0086A8 5B 04            [ 2] 1074 	addw	sp, #4
                                   1075 ;	user/RTC_pcf8563.c: 242: return 1;
      0086AA A6 01            [ 1] 1076 	ld	a, #0x01
      0086AC                       1077 00113$:
      0086AC 5B 26            [ 2] 1078 	addw	sp, #38
      0086AE 81               [ 4] 1079 	ret
                                   1080 ;	user/RTC_pcf8563.c: 245: uint8_t PCF_getDateTime(DateTime *dateTime)
                                   1081 ;	-----------------------------------------
                                   1082 ;	 function PCF_getDateTime
                                   1083 ;	-----------------------------------------
      0086AF                       1084 _PCF_getDateTime:
      0086AF 52 1C            [ 2] 1085 	sub	sp, #28
                                   1086 ;	user/RTC_pcf8563.c: 249: PCF_Read(0x02, buffer, sizeof(buffer));
      0086B1 96               [ 1] 1087 	ldw	x, sp
      0086B2 5C               [ 2] 1088 	incw	x
      0086B3 1F 0E            [ 2] 1089 	ldw	(0x0e, sp), x
      0086B5 1E 0E            [ 2] 1090 	ldw	x, (0x0e, sp)
      0086B7 4B 07            [ 1] 1091 	push	#0x07
      0086B9 89               [ 2] 1092 	pushw	x
      0086BA 4B 02            [ 1] 1093 	push	#0x02
      0086BC CD 82 6B         [ 4] 1094 	call	_PCF_Read
      0086BF 5B 04            [ 2] 1095 	addw	sp, #4
                                   1096 ;	user/RTC_pcf8563.c: 250: dateTime->second = (((buffer[0] >> 4) & 0x07) * 10) + (buffer[0] & 0x0F);
      0086C1 16 1F            [ 2] 1097 	ldw	y, (0x1f, sp)
      0086C3 17 0A            [ 2] 1098 	ldw	(0x0a, sp), y
      0086C5 1E 0E            [ 2] 1099 	ldw	x, (0x0e, sp)
      0086C7 F6               [ 1] 1100 	ld	a, (x)
      0086C8 6B 19            [ 1] 1101 	ld	(0x19, sp), a
      0086CA 7B 19            [ 1] 1102 	ld	a, (0x19, sp)
      0086CC 4E               [ 1] 1103 	swap	a
      0086CD A4 0F            [ 1] 1104 	and	a, #0x0f
      0086CF A4 07            [ 1] 1105 	and	a, #0x07
      0086D1 97               [ 1] 1106 	ld	xl, a
      0086D2 A6 0A            [ 1] 1107 	ld	a, #0x0a
      0086D4 42               [ 4] 1108 	mul	x, a
      0086D5 7B 19            [ 1] 1109 	ld	a, (0x19, sp)
      0086D7 A4 0F            [ 1] 1110 	and	a, #0x0f
      0086D9 6B 0C            [ 1] 1111 	ld	(0x0c, sp), a
      0086DB 9F               [ 1] 1112 	ld	a, xl
      0086DC 1B 0C            [ 1] 1113 	add	a, (0x0c, sp)
      0086DE 1E 0A            [ 2] 1114 	ldw	x, (0x0a, sp)
      0086E0 F7               [ 1] 1115 	ld	(x), a
                                   1116 ;	user/RTC_pcf8563.c: 251: dateTime->minute = (((buffer[1] >> 4) & 0x07) * 10) + (buffer[1] & 0x0F);
      0086E1 1E 0A            [ 2] 1117 	ldw	x, (0x0a, sp)
      0086E3 5C               [ 2] 1118 	incw	x
      0086E4 1F 10            [ 2] 1119 	ldw	(0x10, sp), x
      0086E6 1E 0E            [ 2] 1120 	ldw	x, (0x0e, sp)
      0086E8 E6 01            [ 1] 1121 	ld	a, (0x1, x)
      0086EA 6B 09            [ 1] 1122 	ld	(0x09, sp), a
      0086EC 7B 09            [ 1] 1123 	ld	a, (0x09, sp)
      0086EE 4E               [ 1] 1124 	swap	a
      0086EF A4 0F            [ 1] 1125 	and	a, #0x0f
      0086F1 A4 07            [ 1] 1126 	and	a, #0x07
      0086F3 97               [ 1] 1127 	ld	xl, a
      0086F4 A6 0A            [ 1] 1128 	ld	a, #0x0a
      0086F6 42               [ 4] 1129 	mul	x, a
      0086F7 7B 09            [ 1] 1130 	ld	a, (0x09, sp)
      0086F9 A4 0F            [ 1] 1131 	and	a, #0x0f
      0086FB 6B 08            [ 1] 1132 	ld	(0x08, sp), a
      0086FD 9F               [ 1] 1133 	ld	a, xl
      0086FE 1B 08            [ 1] 1134 	add	a, (0x08, sp)
      008700 1E 10            [ 2] 1135 	ldw	x, (0x10, sp)
      008702 F7               [ 1] 1136 	ld	(x), a
                                   1137 ;	user/RTC_pcf8563.c: 252: dateTime->hour = (((buffer[2] >> 4) & 0x03) * 10) + (buffer[2] & 0x0F);
      008703 16 0A            [ 2] 1138 	ldw	y, (0x0a, sp)
      008705 72 A9 00 02      [ 2] 1139 	addw	y, #0x0002
      008709 1E 0E            [ 2] 1140 	ldw	x, (0x0e, sp)
      00870B E6 02            [ 1] 1141 	ld	a, (0x2, x)
      00870D 6B 0D            [ 1] 1142 	ld	(0x0d, sp), a
      00870F 7B 0D            [ 1] 1143 	ld	a, (0x0d, sp)
      008711 4E               [ 1] 1144 	swap	a
      008712 A4 0F            [ 1] 1145 	and	a, #0x0f
      008714 A4 03            [ 1] 1146 	and	a, #0x03
      008716 97               [ 1] 1147 	ld	xl, a
      008717 A6 0A            [ 1] 1148 	ld	a, #0x0a
      008719 42               [ 4] 1149 	mul	x, a
      00871A 7B 0D            [ 1] 1150 	ld	a, (0x0d, sp)
      00871C A4 0F            [ 1] 1151 	and	a, #0x0f
      00871E 6B 14            [ 1] 1152 	ld	(0x14, sp), a
      008720 9F               [ 1] 1153 	ld	a, xl
      008721 1B 14            [ 1] 1154 	add	a, (0x14, sp)
      008723 90 F7            [ 1] 1155 	ld	(y), a
                                   1156 ;	user/RTC_pcf8563.c: 253: dateTime->day = (((buffer[3] >> 4) & 0x03) * 10) + (buffer[3] & 0x0F);
      008725 16 0A            [ 2] 1157 	ldw	y, (0x0a, sp)
      008727 72 A9 00 03      [ 2] 1158 	addw	y, #0x0003
      00872B 1E 0E            [ 2] 1159 	ldw	x, (0x0e, sp)
      00872D E6 03            [ 1] 1160 	ld	a, (0x3, x)
      00872F 6B 17            [ 1] 1161 	ld	(0x17, sp), a
      008731 7B 17            [ 1] 1162 	ld	a, (0x17, sp)
      008733 4E               [ 1] 1163 	swap	a
      008734 A4 0F            [ 1] 1164 	and	a, #0x0f
      008736 A4 03            [ 1] 1165 	and	a, #0x03
      008738 97               [ 1] 1166 	ld	xl, a
      008739 A6 0A            [ 1] 1167 	ld	a, #0x0a
      00873B 42               [ 4] 1168 	mul	x, a
      00873C 7B 17            [ 1] 1169 	ld	a, (0x17, sp)
      00873E A4 0F            [ 1] 1170 	and	a, #0x0f
      008740 6B 18            [ 1] 1171 	ld	(0x18, sp), a
      008742 9F               [ 1] 1172 	ld	a, xl
      008743 1B 18            [ 1] 1173 	add	a, (0x18, sp)
      008745 90 F7            [ 1] 1174 	ld	(y), a
                                   1175 ;	user/RTC_pcf8563.c: 254: dateTime->weekday = (buffer[4] & 0x07);
      008747 1E 0A            [ 2] 1176 	ldw	x, (0x0a, sp)
      008749 1C 00 04         [ 2] 1177 	addw	x, #0x0004
      00874C 16 0E            [ 2] 1178 	ldw	y, (0x0e, sp)
      00874E 90 E6 04         [ 1] 1179 	ld	a, (0x4, y)
      008751 A4 07            [ 1] 1180 	and	a, #0x07
      008753 F7               [ 1] 1181 	ld	(x), a
                                   1182 ;	user/RTC_pcf8563.c: 255: dateTime->month = ((buffer[5] >> 4) & 0x01) * 10 + (buffer[5] & 0x0F);
      008754 16 0A            [ 2] 1183 	ldw	y, (0x0a, sp)
      008756 72 A9 00 05      [ 2] 1184 	addw	y, #0x0005
      00875A 1E 0E            [ 2] 1185 	ldw	x, (0x0e, sp)
      00875C 1C 00 05         [ 2] 1186 	addw	x, #0x0005
      00875F 1F 1B            [ 2] 1187 	ldw	(0x1b, sp), x
      008761 1E 1B            [ 2] 1188 	ldw	x, (0x1b, sp)
      008763 F6               [ 1] 1189 	ld	a, (x)
      008764 88               [ 1] 1190 	push	a
      008765 44               [ 1] 1191 	srl	a
      008766 44               [ 1] 1192 	srl	a
      008767 44               [ 1] 1193 	srl	a
      008768 44               [ 1] 1194 	srl	a
      008769 A4 01            [ 1] 1195 	and	a, #0x01
      00876B 97               [ 1] 1196 	ld	xl, a
      00876C A6 0A            [ 1] 1197 	ld	a, #0x0a
      00876E 42               [ 4] 1198 	mul	x, a
      00876F 84               [ 1] 1199 	pop	a
      008770 A4 0F            [ 1] 1200 	and	a, #0x0f
      008772 6B 1A            [ 1] 1201 	ld	(0x1a, sp), a
      008774 9F               [ 1] 1202 	ld	a, xl
      008775 1B 1A            [ 1] 1203 	add	a, (0x1a, sp)
      008777 90 F7            [ 1] 1204 	ld	(y), a
                                   1205 ;	user/RTC_pcf8563.c: 256: dateTime->year = 1900 + ((buffer[6] >> 4) & 0x0F) * 10 + (buffer[6] & 0x0F);
      008779 1E 0A            [ 2] 1206 	ldw	x, (0x0a, sp)
      00877B 1C 00 06         [ 2] 1207 	addw	x, #0x0006
      00877E 1F 15            [ 2] 1208 	ldw	(0x15, sp), x
      008780 1E 0E            [ 2] 1209 	ldw	x, (0x0e, sp)
      008782 E6 06            [ 1] 1210 	ld	a, (0x6, x)
      008784 97               [ 1] 1211 	ld	xl, a
      008785 4E               [ 1] 1212 	swap	a
      008786 A4 0F            [ 1] 1213 	and	a, #0x0f
      008788 A4 0F            [ 1] 1214 	and	a, #0x0f
      00878A 61               [ 1] 1215 	exg	a, yl
      00878B A6 0A            [ 1] 1216 	ld	a, #0x0a
      00878D 61               [ 1] 1217 	exg	a, yl
      00878E 90 42            [ 4] 1218 	mul	y, a
      008790 72 A9 07 6C      [ 2] 1219 	addw	y, #0x076c
      008794 9F               [ 1] 1220 	ld	a, xl
      008795 A4 0F            [ 1] 1221 	and	a, #0x0f
      008797 6B 13            [ 1] 1222 	ld	(0x13, sp), a
      008799 0F 12            [ 1] 1223 	clr	(0x12, sp)
      00879B 72 F9 12         [ 2] 1224 	addw	y, (0x12, sp)
      00879E 1E 15            [ 2] 1225 	ldw	x, (0x15, sp)
      0087A0 FF               [ 2] 1226 	ldw	(x), y
                                   1227 ;	user/RTC_pcf8563.c: 258: if (buffer[5] &  0x80)
      0087A1 1E 1B            [ 2] 1228 	ldw	x, (0x1b, sp)
      0087A3 F6               [ 1] 1229 	ld	a, (x)
      0087A4 4D               [ 1] 1230 	tnz	a
      0087A5 2A 0A            [ 1] 1231 	jrpl	00102$
                                   1232 ;	user/RTC_pcf8563.c: 260: dateTime->year += 100;
      0087A7 1E 15            [ 2] 1233 	ldw	x, (0x15, sp)
      0087A9 FE               [ 2] 1234 	ldw	x, (x)
      0087AA 1C 00 64         [ 2] 1235 	addw	x, #0x0064
      0087AD 16 15            [ 2] 1236 	ldw	y, (0x15, sp)
      0087AF 90 FF            [ 2] 1237 	ldw	(y), x
      0087B1                       1238 00102$:
                                   1239 ;	user/RTC_pcf8563.c: 263: if (buffer[0] & 0x80) //Clock integrity not guaranted
      0087B1 1E 0E            [ 2] 1240 	ldw	x, (0x0e, sp)
      0087B3 F6               [ 1] 1241 	ld	a, (x)
      0087B4 4D               [ 1] 1242 	tnz	a
      0087B5 2A 03            [ 1] 1243 	jrpl	00104$
                                   1244 ;	user/RTC_pcf8563.c: 265: return 0;
      0087B7 4F               [ 1] 1245 	clr	a
      0087B8 20 02            [ 2] 1246 	jra	00105$
      0087BA                       1247 00104$:
                                   1248 ;	user/RTC_pcf8563.c: 268: return 1;
      0087BA A6 01            [ 1] 1249 	ld	a, #0x01
      0087BC                       1250 00105$:
      0087BC 5B 1C            [ 2] 1251 	addw	sp, #28
      0087BE 81               [ 4] 1252 	ret
                                   1253 ;	user/RTC_pcf8563.c: 272: uint8_t PCF_setAlarm(Alarm *alarm)
                                   1254 ;	-----------------------------------------
                                   1255 ;	 function PCF_setAlarm
                                   1256 ;	-----------------------------------------
      0087BF                       1257 _PCF_setAlarm:
      0087BF 52 13            [ 2] 1258 	sub	sp, #19
                                   1259 ;	user/RTC_pcf8563.c: 275: if ((alarm->minute >= 60 && alarm->minute != 80) || (alarm->hour >= 24 && alarm->hour != 80) || (alarm->day > 32 && alarm->day != 80) || (alarm->weekday > 6 && alarm->weekday != 80))
      0087C1 16 16            [ 2] 1260 	ldw	y, (0x16, sp)
      0087C3 17 12            [ 2] 1261 	ldw	(0x12, sp), y
      0087C5 1E 12            [ 2] 1262 	ldw	x, (0x12, sp)
      0087C7 F6               [ 1] 1263 	ld	a, (x)
      0087C8 6B 11            [ 1] 1264 	ld	(0x11, sp), a
      0087CA 7B 11            [ 1] 1265 	ld	a, (0x11, sp)
      0087CC A1 3C            [ 1] 1266 	cp	a, #0x3c
      0087CE 25 06            [ 1] 1267 	jrc	00105$
      0087D0 7B 11            [ 1] 1268 	ld	a, (0x11, sp)
      0087D2 A1 50            [ 1] 1269 	cp	a, #0x50
      0087D4 26 31            [ 1] 1270 	jrne	00101$
      0087D6                       1271 00105$:
      0087D6 16 12            [ 2] 1272 	ldw	y, (0x12, sp)
      0087D8 90 5C            [ 2] 1273 	incw	y
      0087DA 90 F6            [ 1] 1274 	ld	a, (y)
      0087DC A1 18            [ 1] 1275 	cp	a, #0x18
      0087DE 25 04            [ 1] 1276 	jrc	00107$
      0087E0 A1 50            [ 1] 1277 	cp	a, #0x50
      0087E2 26 23            [ 1] 1278 	jrne	00101$
      0087E4                       1279 00107$:
      0087E4 1E 12            [ 2] 1280 	ldw	x, (0x12, sp)
      0087E6 5C               [ 2] 1281 	incw	x
      0087E7 5C               [ 2] 1282 	incw	x
      0087E8 1F 06            [ 2] 1283 	ldw	(0x06, sp), x
      0087EA 1E 06            [ 2] 1284 	ldw	x, (0x06, sp)
      0087EC F6               [ 1] 1285 	ld	a, (x)
      0087ED A1 20            [ 1] 1286 	cp	a, #0x20
      0087EF 23 04            [ 2] 1287 	jrule	00109$
      0087F1 A1 50            [ 1] 1288 	cp	a, #0x50
      0087F3 26 12            [ 1] 1289 	jrne	00101$
      0087F5                       1290 00109$:
      0087F5 1E 12            [ 2] 1291 	ldw	x, (0x12, sp)
      0087F7 1C 00 03         [ 2] 1292 	addw	x, #0x0003
      0087FA 1F 0B            [ 2] 1293 	ldw	(0x0b, sp), x
      0087FC 1E 0B            [ 2] 1294 	ldw	x, (0x0b, sp)
      0087FE F6               [ 1] 1295 	ld	a, (x)
      0087FF A1 06            [ 1] 1296 	cp	a, #0x06
      008801 23 09            [ 2] 1297 	jrule	00102$
      008803 A1 50            [ 1] 1298 	cp	a, #0x50
      008805 27 05            [ 1] 1299 	jreq	00102$
      008807                       1300 00101$:
                                   1301 ;	user/RTC_pcf8563.c: 277: return 1;
      008807 A6 01            [ 1] 1302 	ld	a, #0x01
      008809 CC 88 9B         [ 2] 1303 	jp	00110$
      00880C                       1304 00102$:
                                   1305 ;	user/RTC_pcf8563.c: 279: buffer[0] = BinToBCD(alarm->minute) & 0xFF;
      00880C 96               [ 1] 1306 	ldw	x, sp
      00880D 5C               [ 2] 1307 	incw	x
      00880E 1F 08            [ 2] 1308 	ldw	(0x08, sp), x
      008810 5F               [ 1] 1309 	clrw	x
      008811 7B 11            [ 1] 1310 	ld	a, (0x11, sp)
      008813 97               [ 1] 1311 	ld	xl, a
      008814 A6 0A            [ 1] 1312 	ld	a, #0x0a
      008816 62               [ 2] 1313 	div	x, a
      008817 9F               [ 1] 1314 	ld	a, xl
      008818 4E               [ 1] 1315 	swap	a
      008819 A4 F0            [ 1] 1316 	and	a, #0xf0
      00881B 6B 05            [ 1] 1317 	ld	(0x05, sp), a
      00881D 5F               [ 1] 1318 	clrw	x
      00881E 7B 11            [ 1] 1319 	ld	a, (0x11, sp)
      008820 97               [ 1] 1320 	ld	xl, a
      008821 A6 0A            [ 1] 1321 	ld	a, #0x0a
      008823 62               [ 2] 1322 	div	x, a
      008824 1B 05            [ 1] 1323 	add	a, (0x05, sp)
      008826 1E 08            [ 2] 1324 	ldw	x, (0x08, sp)
      008828 F7               [ 1] 1325 	ld	(x), a
                                   1326 ;	user/RTC_pcf8563.c: 280: buffer[1] = BinToBCD(alarm->hour) & 0xBF;
      008829 1E 08            [ 2] 1327 	ldw	x, (0x08, sp)
      00882B 5C               [ 2] 1328 	incw	x
      00882C 1F 0D            [ 2] 1329 	ldw	(0x0d, sp), x
      00882E 90 F6            [ 1] 1330 	ld	a, (y)
      008830 97               [ 1] 1331 	ld	xl, a
      008831 89               [ 2] 1332 	pushw	x
      008832 4F               [ 1] 1333 	clr	a
      008833 95               [ 1] 1334 	ld	xh, a
      008834 A6 0A            [ 1] 1335 	ld	a, #0x0a
      008836 62               [ 2] 1336 	div	x, a
      008837 9F               [ 1] 1337 	ld	a, xl
      008838 85               [ 2] 1338 	popw	x
      008839 4E               [ 1] 1339 	swap	a
      00883A A4 F0            [ 1] 1340 	and	a, #0xf0
      00883C 6B 10            [ 1] 1341 	ld	(0x10, sp), a
      00883E 4F               [ 1] 1342 	clr	a
      00883F 95               [ 1] 1343 	ld	xh, a
      008840 A6 0A            [ 1] 1344 	ld	a, #0x0a
      008842 62               [ 2] 1345 	div	x, a
      008843 1B 10            [ 1] 1346 	add	a, (0x10, sp)
      008845 A4 BF            [ 1] 1347 	and	a, #0xbf
      008847 1E 0D            [ 2] 1348 	ldw	x, (0x0d, sp)
      008849 F7               [ 1] 1349 	ld	(x), a
                                   1350 ;	user/RTC_pcf8563.c: 281: buffer[2] = BinToBCD(alarm->day) & 0xBF;
      00884A 16 08            [ 2] 1351 	ldw	y, (0x08, sp)
      00884C 72 A9 00 02      [ 2] 1352 	addw	y, #0x0002
      008850 1E 06            [ 2] 1353 	ldw	x, (0x06, sp)
      008852 F6               [ 1] 1354 	ld	a, (x)
      008853 97               [ 1] 1355 	ld	xl, a
      008854 89               [ 2] 1356 	pushw	x
      008855 4F               [ 1] 1357 	clr	a
      008856 95               [ 1] 1358 	ld	xh, a
      008857 A6 0A            [ 1] 1359 	ld	a, #0x0a
      008859 62               [ 2] 1360 	div	x, a
      00885A 9F               [ 1] 1361 	ld	a, xl
      00885B 85               [ 2] 1362 	popw	x
      00885C 4E               [ 1] 1363 	swap	a
      00885D A4 F0            [ 1] 1364 	and	a, #0xf0
      00885F 6B 0A            [ 1] 1365 	ld	(0x0a, sp), a
      008861 4F               [ 1] 1366 	clr	a
      008862 95               [ 1] 1367 	ld	xh, a
      008863 A6 0A            [ 1] 1368 	ld	a, #0x0a
      008865 62               [ 2] 1369 	div	x, a
      008866 1B 0A            [ 1] 1370 	add	a, (0x0a, sp)
      008868 A4 BF            [ 1] 1371 	and	a, #0xbf
      00886A 90 F7            [ 1] 1372 	ld	(y), a
                                   1373 ;	user/RTC_pcf8563.c: 282: buffer[3] = BinToBCD(alarm->weekday) & 0x87;
      00886C 16 08            [ 2] 1374 	ldw	y, (0x08, sp)
      00886E 72 A9 00 03      [ 2] 1375 	addw	y, #0x0003
      008872 1E 0B            [ 2] 1376 	ldw	x, (0x0b, sp)
      008874 F6               [ 1] 1377 	ld	a, (x)
      008875 97               [ 1] 1378 	ld	xl, a
      008876 89               [ 2] 1379 	pushw	x
      008877 4F               [ 1] 1380 	clr	a
      008878 95               [ 1] 1381 	ld	xh, a
      008879 A6 0A            [ 1] 1382 	ld	a, #0x0a
      00887B 62               [ 2] 1383 	div	x, a
      00887C 9F               [ 1] 1384 	ld	a, xl
      00887D 85               [ 2] 1385 	popw	x
      00887E 4E               [ 1] 1386 	swap	a
      00887F A4 F0            [ 1] 1387 	and	a, #0xf0
      008881 6B 0F            [ 1] 1388 	ld	(0x0f, sp), a
      008883 4F               [ 1] 1389 	clr	a
      008884 95               [ 1] 1390 	ld	xh, a
      008885 A6 0A            [ 1] 1391 	ld	a, #0x0a
      008887 62               [ 2] 1392 	div	x, a
      008888 1B 0F            [ 1] 1393 	add	a, (0x0f, sp)
      00888A A4 87            [ 1] 1394 	and	a, #0x87
      00888C 90 F7            [ 1] 1395 	ld	(y), a
                                   1396 ;	user/RTC_pcf8563.c: 284: PCF_Write(0x09, buffer, sizeof(buffer));
      00888E 1E 08            [ 2] 1397 	ldw	x, (0x08, sp)
      008890 4B 04            [ 1] 1398 	push	#0x04
      008892 89               [ 2] 1399 	pushw	x
      008893 4B 09            [ 1] 1400 	push	#0x09
      008895 CD 80 D6         [ 4] 1401 	call	_PCF_Write
      008898 5B 04            [ 2] 1402 	addw	sp, #4
                                   1403 ;	user/RTC_pcf8563.c: 286: return 0;
      00889A 4F               [ 1] 1404 	clr	a
      00889B                       1405 00110$:
      00889B 5B 13            [ 2] 1406 	addw	sp, #19
      00889D 81               [ 4] 1407 	ret
                                   1408 ;	user/RTC_pcf8563.c: 289: void PCF_setTimer(uint8_t mode, uint8_t count)
                                   1409 ;	-----------------------------------------
                                   1410 ;	 function PCF_setTimer
                                   1411 ;	-----------------------------------------
      00889E                       1412 _PCF_setTimer:
                                   1413 ;	user/RTC_pcf8563.c: 291: mode &= 0x13;
      00889E 7B 03            [ 1] 1414 	ld	a, (0x03, sp)
      0088A0 A4 13            [ 1] 1415 	and	a, #0x13
      0088A2 6B 03            [ 1] 1416 	ld	(0x03, sp), a
                                   1417 ;	user/RTC_pcf8563.c: 292: PCF_Write(0x0E, &mode, 1);				//Timer_control
      0088A4 96               [ 1] 1418 	ldw	x, sp
      0088A5 1C 00 03         [ 2] 1419 	addw	x, #3
      0088A8 4B 01            [ 1] 1420 	push	#0x01
      0088AA 89               [ 2] 1421 	pushw	x
      0088AB 4B 0E            [ 1] 1422 	push	#0x0e
      0088AD CD 80 D6         [ 4] 1423 	call	_PCF_Write
      0088B0 5B 04            [ 2] 1424 	addw	sp, #4
                                   1425 ;	user/RTC_pcf8563.c: 293: PCF_Write(0x0F, &count, 1);				//Timer
      0088B2 96               [ 1] 1426 	ldw	x, sp
      0088B3 1C 00 04         [ 2] 1427 	addw	x, #4
      0088B6 4B 01            [ 1] 1428 	push	#0x01
      0088B8 89               [ 2] 1429 	pushw	x
      0088B9 4B 0F            [ 1] 1430 	push	#0x0f
      0088BB CD 80 D6         [ 4] 1431 	call	_PCF_Write
      0088BE 5B 04            [ 2] 1432 	addw	sp, #4
      0088C0 81               [ 4] 1433 	ret
                                   1434 ;	user/RTC_pcf8563.c: 296: uint8_t PCF_getTimer()
                                   1435 ;	-----------------------------------------
                                   1436 ;	 function PCF_getTimer
                                   1437 ;	-----------------------------------------
      0088C1                       1438 _PCF_getTimer:
      0088C1 88               [ 1] 1439 	push	a
                                   1440 ;	user/RTC_pcf8563.c: 299: PCF_Read(0x0F, &count, 1);				//Timer
      0088C2 96               [ 1] 1441 	ldw	x, sp
      0088C3 5C               [ 2] 1442 	incw	x
      0088C4 4B 01            [ 1] 1443 	push	#0x01
      0088C6 89               [ 2] 1444 	pushw	x
      0088C7 4B 0F            [ 1] 1445 	push	#0x0f
      0088C9 CD 82 6B         [ 4] 1446 	call	_PCF_Read
      0088CC 5B 04            [ 2] 1447 	addw	sp, #4
                                   1448 ;	user/RTC_pcf8563.c: 301: return count;
      0088CE 7B 01            [ 1] 1449 	ld	a, (0x01, sp)
      0088D0 5B 01            [ 2] 1450 	addw	sp, #1
      0088D2 81               [ 4] 1451 	ret
                                   1452 ;	user/RTC_pcf8563.c: 304: uint8_t PCF_getAlarm(Alarm *alarm)
                                   1453 ;	-----------------------------------------
                                   1454 ;	 function PCF_getAlarm
                                   1455 ;	-----------------------------------------
      0088D3                       1456 _PCF_getAlarm:
      0088D3 52 0F            [ 2] 1457 	sub	sp, #15
                                   1458 ;	user/RTC_pcf8563.c: 308: PCF_Read(0x09, buffer, sizeof(buffer));
      0088D5 96               [ 1] 1459 	ldw	x, sp
      0088D6 5C               [ 2] 1460 	incw	x
      0088D7 1F 0D            [ 2] 1461 	ldw	(0x0d, sp), x
      0088D9 1E 0D            [ 2] 1462 	ldw	x, (0x0d, sp)
      0088DB 4B 04            [ 1] 1463 	push	#0x04
      0088DD 89               [ 2] 1464 	pushw	x
      0088DE 4B 09            [ 1] 1465 	push	#0x09
      0088E0 CD 82 6B         [ 4] 1466 	call	_PCF_Read
      0088E3 5B 04            [ 2] 1467 	addw	sp, #4
                                   1468 ;	user/RTC_pcf8563.c: 310: alarm->minute = (((buffer[0] >> 4) & 0x0F) * 10) + (buffer[0] & 0x0F);
      0088E5 16 12            [ 2] 1469 	ldw	y, (0x12, sp)
      0088E7 17 07            [ 2] 1470 	ldw	(0x07, sp), y
      0088E9 1E 0D            [ 2] 1471 	ldw	x, (0x0d, sp)
      0088EB F6               [ 1] 1472 	ld	a, (x)
      0088EC 90 97            [ 1] 1473 	ld	yl, a
      0088EE 4E               [ 1] 1474 	swap	a
      0088EF A4 0F            [ 1] 1475 	and	a, #0x0f
      0088F1 A4 0F            [ 1] 1476 	and	a, #0x0f
      0088F3 97               [ 1] 1477 	ld	xl, a
      0088F4 A6 0A            [ 1] 1478 	ld	a, #0x0a
      0088F6 42               [ 4] 1479 	mul	x, a
      0088F7 90 9F            [ 1] 1480 	ld	a, yl
      0088F9 A4 0F            [ 1] 1481 	and	a, #0x0f
      0088FB 6B 09            [ 1] 1482 	ld	(0x09, sp), a
      0088FD 9F               [ 1] 1483 	ld	a, xl
      0088FE 1B 09            [ 1] 1484 	add	a, (0x09, sp)
      008900 1E 07            [ 2] 1485 	ldw	x, (0x07, sp)
      008902 F7               [ 1] 1486 	ld	(x), a
                                   1487 ;	user/RTC_pcf8563.c: 311: alarm->hour = (((buffer[1] >> 4) & 0x0B) * 10) + (buffer[1] & 0x0F);
      008903 16 07            [ 2] 1488 	ldw	y, (0x07, sp)
      008905 90 5C            [ 2] 1489 	incw	y
      008907 1E 0D            [ 2] 1490 	ldw	x, (0x0d, sp)
      008909 E6 01            [ 1] 1491 	ld	a, (0x1, x)
      00890B 6B 0B            [ 1] 1492 	ld	(0x0b, sp), a
      00890D 7B 0B            [ 1] 1493 	ld	a, (0x0b, sp)
      00890F 4E               [ 1] 1494 	swap	a
      008910 A4 0F            [ 1] 1495 	and	a, #0x0f
      008912 A4 0B            [ 1] 1496 	and	a, #0x0b
      008914 97               [ 1] 1497 	ld	xl, a
      008915 A6 0A            [ 1] 1498 	ld	a, #0x0a
      008917 42               [ 4] 1499 	mul	x, a
      008918 7B 0B            [ 1] 1500 	ld	a, (0x0b, sp)
      00891A A4 0F            [ 1] 1501 	and	a, #0x0f
      00891C 6B 0C            [ 1] 1502 	ld	(0x0c, sp), a
      00891E 9F               [ 1] 1503 	ld	a, xl
      00891F 1B 0C            [ 1] 1504 	add	a, (0x0c, sp)
      008921 90 F7            [ 1] 1505 	ld	(y), a
                                   1506 ;	user/RTC_pcf8563.c: 312: alarm->day = (((buffer[2] >> 4) & 0x0B) * 10) + (buffer[2] & 0x0F);
      008923 16 07            [ 2] 1507 	ldw	y, (0x07, sp)
      008925 72 A9 00 02      [ 2] 1508 	addw	y, #0x0002
      008929 1E 0D            [ 2] 1509 	ldw	x, (0x0d, sp)
      00892B E6 02            [ 1] 1510 	ld	a, (0x2, x)
      00892D 6B 06            [ 1] 1511 	ld	(0x06, sp), a
      00892F 7B 06            [ 1] 1512 	ld	a, (0x06, sp)
      008931 4E               [ 1] 1513 	swap	a
      008932 A4 0F            [ 1] 1514 	and	a, #0x0f
      008934 A4 0B            [ 1] 1515 	and	a, #0x0b
      008936 97               [ 1] 1516 	ld	xl, a
      008937 A6 0A            [ 1] 1517 	ld	a, #0x0a
      008939 42               [ 4] 1518 	mul	x, a
      00893A 7B 06            [ 1] 1519 	ld	a, (0x06, sp)
      00893C A4 0F            [ 1] 1520 	and	a, #0x0f
      00893E 6B 0A            [ 1] 1521 	ld	(0x0a, sp), a
      008940 9F               [ 1] 1522 	ld	a, xl
      008941 1B 0A            [ 1] 1523 	add	a, (0x0a, sp)
      008943 90 F7            [ 1] 1524 	ld	(y), a
                                   1525 ;	user/RTC_pcf8563.c: 313: alarm->weekday = (((buffer[3] >> 4) & 0x08) * 10) + (buffer[3] & 0x07);
      008945 16 07            [ 2] 1526 	ldw	y, (0x07, sp)
      008947 72 A9 00 03      [ 2] 1527 	addw	y, #0x0003
      00894B 1E 0D            [ 2] 1528 	ldw	x, (0x0d, sp)
      00894D E6 03            [ 1] 1529 	ld	a, (0x3, x)
      00894F 6B 0F            [ 1] 1530 	ld	(0x0f, sp), a
      008951 7B 0F            [ 1] 1531 	ld	a, (0x0f, sp)
      008953 4E               [ 1] 1532 	swap	a
      008954 A4 0F            [ 1] 1533 	and	a, #0x0f
      008956 A4 08            [ 1] 1534 	and	a, #0x08
      008958 97               [ 1] 1535 	ld	xl, a
      008959 A6 0A            [ 1] 1536 	ld	a, #0x0a
      00895B 42               [ 4] 1537 	mul	x, a
      00895C 7B 0F            [ 1] 1538 	ld	a, (0x0f, sp)
      00895E A4 07            [ 1] 1539 	and	a, #0x07
      008960 6B 05            [ 1] 1540 	ld	(0x05, sp), a
      008962 9F               [ 1] 1541 	ld	a, xl
      008963 1B 05            [ 1] 1542 	add	a, (0x05, sp)
      008965 90 F7            [ 1] 1543 	ld	(y), a
                                   1544 ;	user/RTC_pcf8563.c: 315: return 0;
      008967 4F               [ 1] 1545 	clr	a
      008968 5B 0F            [ 2] 1546 	addw	sp, #15
      00896A 81               [ 4] 1547 	ret
                                   1548 ;	user/RTC_pcf8563.c: 318: uint8_t PCF_getAndClearFlags(void)
                                   1549 ;	-----------------------------------------
                                   1550 ;	 function PCF_getAndClearFlags
                                   1551 ;	-----------------------------------------
      00896B                       1552 _PCF_getAndClearFlags:
      00896B 89               [ 2] 1553 	pushw	x
                                   1554 ;	user/RTC_pcf8563.c: 322: PCF_Read(0x01, &flags, 1);				//Control_status_2
      00896C 96               [ 1] 1555 	ldw	x, sp
      00896D 5C               [ 2] 1556 	incw	x
      00896E 4B 01            [ 1] 1557 	push	#0x01
      008970 89               [ 2] 1558 	pushw	x
      008971 4B 01            [ 1] 1559 	push	#0x01
      008973 CD 82 6B         [ 4] 1560 	call	_PCF_Read
      008976 5B 04            [ 2] 1561 	addw	sp, #4
                                   1562 ;	user/RTC_pcf8563.c: 323: cleared = flags & 0x13;
      008978 7B 01            [ 1] 1563 	ld	a, (0x01, sp)
      00897A A4 13            [ 1] 1564 	and	a, #0x13
      00897C 6B 02            [ 1] 1565 	ld	(0x02, sp), a
                                   1566 ;	user/RTC_pcf8563.c: 324: PCF_Write(0x01, &cleared, 1);			//Control_status_2
      00897E 96               [ 1] 1567 	ldw	x, sp
      00897F 5C               [ 2] 1568 	incw	x
      008980 5C               [ 2] 1569 	incw	x
      008981 4B 01            [ 1] 1570 	push	#0x01
      008983 89               [ 2] 1571 	pushw	x
      008984 4B 01            [ 1] 1572 	push	#0x01
      008986 CD 80 D6         [ 4] 1573 	call	_PCF_Write
      008989 5B 04            [ 2] 1574 	addw	sp, #4
                                   1575 ;	user/RTC_pcf8563.c: 326: return flags & 0x0C;					//Mask unnecessary bits
      00898B 7B 01            [ 1] 1576 	ld	a, (0x01, sp)
      00898D A4 0C            [ 1] 1577 	and	a, #0x0c
      00898F 85               [ 2] 1578 	popw	x
      008990 81               [ 4] 1579 	ret
                                   1580 ;	user/RTC_pcf8563.c: 329: void PCF_setClockOut(uint8_t mode)
                                   1581 ;	-----------------------------------------
                                   1582 ;	 function PCF_setClockOut
                                   1583 ;	-----------------------------------------
      008991                       1584 _PCF_setClockOut:
                                   1585 ;	user/RTC_pcf8563.c: 331: mode &= 0x13;
      008991 7B 03            [ 1] 1586 	ld	a, (0x03, sp)
      008993 A4 13            [ 1] 1587 	and	a, #0x13
      008995 6B 03            [ 1] 1588 	ld	(0x03, sp), a
                                   1589 ;	user/RTC_pcf8563.c: 332: PCF_Write(0x0D, &mode, 1);				//CLKOUT_control
      008997 96               [ 1] 1590 	ldw	x, sp
      008998 1C 00 03         [ 2] 1591 	addw	x, #3
      00899B 4B 01            [ 1] 1592 	push	#0x01
      00899D 89               [ 2] 1593 	pushw	x
      00899E 4B 0D            [ 1] 1594 	push	#0x0d
      0089A0 CD 80 D6         [ 4] 1595 	call	_PCF_Write
      0089A3 5B 04            [ 2] 1596 	addw	sp, #4
      0089A5 81               [ 4] 1597 	ret
                                   1598 	.area CODE
                                   1599 	.area INITIALIZER
                                   1600 	.area CABS (ABS)
