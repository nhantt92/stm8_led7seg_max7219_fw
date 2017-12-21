;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module ds1307
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _I2C_GetFlagStatus
	.globl _I2C_CheckEvent
	.globl _I2C_SendData
	.globl _I2C_Send7bitAddress
	.globl _I2C_ReceiveData
	.globl _I2C_AcknowledgeConfig
	.globl _I2C_GenerateSTOP
	.globl _I2C_GenerateSTART
	.globl _I2C_Cmd
	.globl _I2C_Init
	.globl _I2C_DeInit
	.globl _CLK_GetClockFreq
	.globl _CLK_PeripheralClockConfig
	.globl _DS1307_Init
	.globl _DS1307_write_time
	.globl _DS1307_SetTime
	.globl _DS1307_GetDateTime
	.globl _DS1307_GetSeconds
	.globl _DS1307_GetMinutes
	.globl _DS1307_GetHours
	.globl _DS1307_GetDay
	.globl _DS1307_GetDate
	.globl _DS1307_GetMonth
	.globl _DS1307_GetYear
	.globl _read_ds1307
	.globl _BCD2BIN
	.globl _BIN2BCD
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	user/ds1307.c: 6: void DS1307_Init(void)
;	-----------------------------------------
;	 function DS1307_Init
;	-----------------------------------------
_DS1307_Init:
	push	a
;	user/ds1307.c: 9: Input_Clock = CLK_GetClockFreq()/1000000;
	call	_CLK_GetClockFreq
	push	#0x40
	push	#0x42
	push	#0x0f
	push	#0x00
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ld	a, xl
	ld	(0x01, sp), a
;	user/ds1307.c: 10: I2C_DeInit();
	call	_I2C_DeInit
;	user/ds1307.c: 11: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	push	#0x01
	push	#0x00
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/ds1307.c: 12: I2C_Cmd( ENABLE);
	push	#0x01
	call	_I2C_Cmd
	pop	a
;	user/ds1307.c: 14: I2C_Init(DS1307_I2C_CLOCK, DS1307_I2C_ADDR, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT,Input_Clock);
	ld	a, (0x01, sp)
	push	a
	push	#0x00
	push	#0x01
	push	#0x00
	push	#0xd0
	push	#0x00
	push	#0x10
	push	#0x27
	clrw	x
	pushw	x
	call	_I2C_Init
	addw	sp, #11
	ret
;	user/ds1307.c: 17: void DS1307_write_time(unsigned char hour1,unsigned char min1,unsigned char day1,unsigned char date1,unsigned char month1,unsigned char year1)
;	-----------------------------------------
;	 function DS1307_write_time
;	-----------------------------------------
_DS1307_write_time:
	sub	sp, #21
;	user/ds1307.c: 20: data[0]=BIN2BCD(0x0);
	ldw	x, sp
	incw	x
	ldw	(0x14, sp), x
	push	#0x00
	call	_BIN2BCD
	addw	sp, #1
	ldw	x, (0x14, sp)
	ld	(x), a
;	user/ds1307.c: 21: data[1]=BIN2BCD(min1);
	ldw	x, (0x14, sp)
	incw	x
	ldw	(0x0a, sp), x
	ld	a, (0x19, sp)
	push	a
	call	_BIN2BCD
	addw	sp, #1
	ldw	x, (0x0a, sp)
	ld	(x), a
;	user/ds1307.c: 22: data[2]=BIN2BCD(hour1);
	ldw	x, (0x14, sp)
	incw	x
	incw	x
	ldw	(0x12, sp), x
	ld	a, (0x18, sp)
	push	a
	call	_BIN2BCD
	addw	sp, #1
	ldw	x, (0x12, sp)
	ld	(x), a
;	user/ds1307.c: 23: data[3]=BIN2BCD(day1);
	ldw	x, (0x14, sp)
	addw	x, #0x0003
	ldw	(0x0e, sp), x
	ld	a, (0x1a, sp)
	push	a
	call	_BIN2BCD
	addw	sp, #1
	ldw	x, (0x0e, sp)
	ld	(x), a
;	user/ds1307.c: 24: data[4]=BIN2BCD(date1);
	ldw	x, (0x14, sp)
	addw	x, #0x0004
	ldw	(0x08, sp), x
	ld	a, (0x1b, sp)
	push	a
	call	_BIN2BCD
	addw	sp, #1
	ldw	x, (0x08, sp)
	ld	(x), a
;	user/ds1307.c: 25: data[5]=BIN2BCD(month1);
	ldw	x, (0x14, sp)
	addw	x, #0x0005
	ldw	(0x0c, sp), x
	ld	a, (0x1c, sp)
	push	a
	call	_BIN2BCD
	addw	sp, #1
	ldw	x, (0x0c, sp)
	ld	(x), a
;	user/ds1307.c: 26: data[6]=BIN2BCD(year1);
	ldw	x, (0x14, sp)
	addw	x, #0x0006
	ldw	(0x10, sp), x
	ld	a, (0x1d, sp)
	push	a
	call	_BIN2BCD
	addw	sp, #1
	ldw	x, (0x10, sp)
	ld	(x), a
;	user/ds1307.c: 28: while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY)==SET);
00101$:
	push	#0x02
	push	#0x03
	call	_I2C_GetFlagStatus
	popw	x
	cp	a, #0x01
	jreq	00101$
;	user/ds1307.c: 29: I2C_GenerateSTART(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	user/ds1307.c: 32: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
00104$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00104$
;	user/ds1307.c: 35: I2C_Send7bitAddress(DS1307_ADDR_WRITE,I2C_DIRECTION_TX);
	push	#0x00
	push	#0xd0
	call	_I2C_Send7bitAddress
	popw	x
;	user/ds1307.c: 38: while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
00107$:
	push	#0x82
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00107$
;	user/ds1307.c: 42: I2C_SendData( 0x01);
	push	#0x01
	call	_I2C_SendData
	pop	a
;	user/ds1307.c: 45: while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));
00110$:
	push	#0x84
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00110$
;	user/ds1307.c: 49: I2C_SendData( data[1]);
	ldw	x, (0x0a, sp)
	ld	a, (x)
	push	a
	call	_I2C_SendData
	pop	a
;	user/ds1307.c: 52: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
00113$:
	push	#0x04
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00113$
;	user/ds1307.c: 55: I2C_SendData( data[2]);
	ldw	x, (0x12, sp)
	ld	a, (x)
	push	a
	call	_I2C_SendData
	pop	a
;	user/ds1307.c: 58: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
00116$:
	push	#0x04
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00116$
;	user/ds1307.c: 61: I2C_SendData( data[3]);
	ldw	x, (0x0e, sp)
	ld	a, (x)
	push	a
	call	_I2C_SendData
	pop	a
;	user/ds1307.c: 64: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
00119$:
	push	#0x04
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00119$
;	user/ds1307.c: 67: I2C_SendData( data[4]);
	ldw	x, (0x08, sp)
	ld	a, (x)
	push	a
	call	_I2C_SendData
	pop	a
;	user/ds1307.c: 70: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
00122$:
	push	#0x04
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00122$
;	user/ds1307.c: 73: I2C_SendData( data[5]);
	ldw	x, (0x0c, sp)
	ld	a, (x)
	push	a
	call	_I2C_SendData
	pop	a
;	user/ds1307.c: 76: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
00125$:
	push	#0x04
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00125$
;	user/ds1307.c: 79: I2C_SendData( data[6]);
	ldw	x, (0x10, sp)
	ld	a, (x)
	push	a
	call	_I2C_SendData
	pop	a
;	user/ds1307.c: 82: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
00128$:
	push	#0x04
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00128$
;	user/ds1307.c: 85: I2C_GenerateSTOP(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTOP
	pop	a
;	user/ds1307.c: 88: I2C->SR1;		I2C->SR3;
	ldw	x, #0x5217
	ld	a, (x)
	ldw	x, #0x5219
	ld	a, (x)
	addw	sp, #21
	ret
;	user/ds1307.c: 92: void DS1307_SetTime(DS1307_Time_t* time)
;	-----------------------------------------
;	 function DS1307_SetTime
;	-----------------------------------------
_DS1307_SetTime:
	sub	sp, #23
;	user/ds1307.c: 95: data[0]=BIN2BCD(time->seconds);
	ldw	x, sp
	incw	x
	ldw	(0x14, sp), x
	ldw	y, (0x1a, sp)
	ldw	(0x16, sp), y
	ldw	x, (0x16, sp)
	ld	a, (x)
	push	a
	call	_BIN2BCD
	addw	sp, #1
	ldw	x, (0x14, sp)
	ld	(x), a
;	user/ds1307.c: 96: data[1]=BIN2BCD(time->minutes);
	ldw	x, (0x14, sp)
	incw	x
	ldw	(0x10, sp), x
	ldw	x, (0x16, sp)
	ld	a, (0x1, x)
	push	a
	call	_BIN2BCD
	addw	sp, #1
	ldw	x, (0x10, sp)
	ld	(x), a
;	user/ds1307.c: 97: data[2]=BIN2BCD(time->hours);
	ldw	x, (0x14, sp)
	incw	x
	incw	x
	ldw	(0x08, sp), x
	ldw	x, (0x16, sp)
	ld	a, (0x2, x)
	push	a
	call	_BIN2BCD
	addw	sp, #1
	ldw	x, (0x08, sp)
	ld	(x), a
;	user/ds1307.c: 98: data[3]=BIN2BCD(time->day);
	ldw	x, (0x14, sp)
	addw	x, #0x0003
	ldw	(0x0e, sp), x
	ldw	x, (0x16, sp)
	ld	a, (0x3, x)
	push	a
	call	_BIN2BCD
	addw	sp, #1
	ldw	x, (0x0e, sp)
	ld	(x), a
;	user/ds1307.c: 99: data[4]=BIN2BCD(time->date);
	ldw	x, (0x14, sp)
	addw	x, #0x0004
	ldw	(0x0c, sp), x
	ldw	x, (0x16, sp)
	ld	a, (0x4, x)
	push	a
	call	_BIN2BCD
	addw	sp, #1
	ldw	x, (0x0c, sp)
	ld	(x), a
;	user/ds1307.c: 100: data[5]=BIN2BCD(time->month);
	ldw	x, (0x14, sp)
	addw	x, #0x0005
	ldw	(0x0a, sp), x
	ldw	x, (0x16, sp)
	ld	a, (0x5, x)
	push	a
	call	_BIN2BCD
	addw	sp, #1
	ldw	x, (0x0a, sp)
	ld	(x), a
;	user/ds1307.c: 101: data[6]=BIN2BCD(time->year);
	ldw	x, (0x14, sp)
	addw	x, #0x0006
	ldw	(0x12, sp), x
	ldw	x, (0x16, sp)
	ld	a, (0x6, x)
	push	a
	call	_BIN2BCD
	addw	sp, #1
	ldw	x, (0x12, sp)
	ld	(x), a
;	user/ds1307.c: 103: while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY)==SET);
00101$:
	push	#0x02
	push	#0x03
	call	_I2C_GetFlagStatus
	popw	x
	cp	a, #0x01
	jreq	00101$
;	user/ds1307.c: 104: I2C_GenerateSTART(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	user/ds1307.c: 107: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
00104$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00104$
;	user/ds1307.c: 110: I2C_Send7bitAddress((uint8_t)DS1307_ADDR_WRITE,I2C_DIRECTION_TX);
	push	#0x00
	push	#0xd0
	call	_I2C_Send7bitAddress
	popw	x
;	user/ds1307.c: 113: while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
00107$:
	push	#0x82
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00107$
;	user/ds1307.c: 116: I2C_SendData( 0x01);
	push	#0x01
	call	_I2C_SendData
	pop	a
;	user/ds1307.c: 119: while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));
00110$:
	push	#0x84
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00110$
;	user/ds1307.c: 123: I2C_SendData( data[1]);
	ldw	x, (0x10, sp)
	ld	a, (x)
	push	a
	call	_I2C_SendData
	pop	a
;	user/ds1307.c: 126: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
00113$:
	push	#0x04
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00113$
;	user/ds1307.c: 129: I2C_SendData( data[2]);
	ldw	x, (0x08, sp)
	ld	a, (x)
	push	a
	call	_I2C_SendData
	pop	a
;	user/ds1307.c: 132: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
00116$:
	push	#0x04
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00116$
;	user/ds1307.c: 135: I2C_SendData( data[3]);
	ldw	x, (0x0e, sp)
	ld	a, (x)
	push	a
	call	_I2C_SendData
	pop	a
;	user/ds1307.c: 138: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
00119$:
	push	#0x04
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00119$
;	user/ds1307.c: 141: I2C_SendData( data[4]);
	ldw	x, (0x0c, sp)
	ld	a, (x)
	push	a
	call	_I2C_SendData
	pop	a
;	user/ds1307.c: 144: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
00122$:
	push	#0x04
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00122$
;	user/ds1307.c: 147: I2C_SendData( data[5]);
	ldw	x, (0x0a, sp)
	ld	a, (x)
	push	a
	call	_I2C_SendData
	pop	a
;	user/ds1307.c: 150: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
00125$:
	push	#0x04
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00125$
;	user/ds1307.c: 153: I2C_SendData( data[6]);
	ldw	x, (0x12, sp)
	ld	a, (x)
	push	a
	call	_I2C_SendData
	pop	a
;	user/ds1307.c: 156: while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
00128$:
	push	#0x04
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00128$
;	user/ds1307.c: 159: I2C_GenerateSTOP(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTOP
	pop	a
;	user/ds1307.c: 162: I2C->SR1;        I2C->SR3;
	ldw	x, #0x5217
	ld	a, (x)
	ldw	x, #0x5219
	ld	a, (x)
	addw	sp, #23
	ret
;	user/ds1307.c: 165: void DS1307_GetDateTime(DS1307_Time_t* time) {
;	-----------------------------------------
;	 function DS1307_GetDateTime
;	-----------------------------------------
_DS1307_GetDateTime:
	sub	sp, #24
;	user/ds1307.c: 168: for(i=0;i<8;i++)
	ldw	x, sp
	incw	x
	ldw	(0x13, sp), x
	clr	(0x08, sp)
00105$:
;	user/ds1307.c: 170: data[i]=read_ds1307(i);
	clrw	x
	ld	a, (0x08, sp)
	ld	xl, a
	addw	x, (0x13, sp)
	pushw	x
	ld	a, (0x0a, sp)
	push	a
	call	_read_ds1307
	addw	sp, #1
	popw	x
	ld	(x), a
;	user/ds1307.c: 168: for(i=0;i<8;i++)
	inc	(0x08, sp)
	ld	a, (0x08, sp)
	cp	a, #0x08
	jrc	00105$
;	user/ds1307.c: 173: time->seconds = BCD2BIN(data[0]&=0x7F);
	ldw	y, (0x1b, sp)
	ldw	(0x11, sp), y
	ldw	x, (0x13, sp)
	ld	a, (x)
	and	a, #0x7f
	ldw	x, (0x13, sp)
	ld	(x), a
	push	a
	call	_BCD2BIN
	addw	sp, #1
	ldw	x, (0x11, sp)
	ld	(x), a
;	user/ds1307.c: 175: time->minutes = BCD2BIN(data[1]&=0x7F);
	ldw	x, (0x11, sp)
	incw	x
	ldw	(0x15, sp), x
	ldw	x, (0x13, sp)
	incw	x
	ld	a, (x)
	and	a, #0x7f
	ld	(x), a
	pushw	x
	push	a
	call	_BCD2BIN
	addw	sp, #1
	popw	x
	ldw	y, (0x15, sp)
	ld	(y), a
;	user/ds1307.c: 177: if((data[1]&0x40)!=0)    time->hours=BCD2BIN(data[2]&=0x1F);
	ld	a, (x)
	ld	yl, a
	ldw	x, (0x11, sp)
	incw	x
	incw	x
	ldw	(0x0b, sp), x
	ldw	x, (0x13, sp)
	incw	x
	incw	x
	ld	a, (x)
	push	a
	ld	a, yl
	bcp	a, #0x40
	pop	a
	jreq	00103$
	and	a, #0x1f
	ld	(x), a
	push	a
	call	_BCD2BIN
	addw	sp, #1
	ldw	x, (0x0b, sp)
	ld	(x), a
	jra	00104$
00103$:
;	user/ds1307.c: 178: else time->hours=BCD2BIN(data[2]&=0x3F);
	and	a, #0x3f
	ld	(x), a
	push	a
	call	_BCD2BIN
	addw	sp, #1
	ldw	x, (0x0b, sp)
	ld	(x), a
00104$:
;	user/ds1307.c: 180: time->day = BCD2BIN(data[3]&=0x07);
	ldw	x, (0x11, sp)
	addw	x, #0x0003
	ldw	(0x0d, sp), x
	ldw	x, (0x13, sp)
	addw	x, #0x0003
	ld	a, (x)
	and	a, #0x07
	ld	(x), a
	push	a
	call	_BCD2BIN
	addw	sp, #1
	ldw	x, (0x0d, sp)
	ld	(x), a
;	user/ds1307.c: 181: time->date = BCD2BIN(data[4]&=0x3F);
	ldw	x, (0x11, sp)
	addw	x, #0x0004
	ldw	(0x17, sp), x
	ldw	x, (0x13, sp)
	addw	x, #0x0004
	ld	a, (x)
	and	a, #0x3f
	ld	(x), a
	push	a
	call	_BCD2BIN
	addw	sp, #1
	ldw	x, (0x17, sp)
	ld	(x), a
;	user/ds1307.c: 182: time->month = BCD2BIN(data[5]&=0x1F);
	ldw	x, (0x11, sp)
	addw	x, #0x0005
	ldw	(0x0f, sp), x
	ldw	x, (0x13, sp)
	addw	x, #0x0005
	ld	a, (x)
	and	a, #0x1f
	ld	(x), a
	push	a
	call	_BCD2BIN
	addw	sp, #1
	ldw	x, (0x0f, sp)
	ld	(x), a
;	user/ds1307.c: 183: time->year = BCD2BIN(data[6]&=0xFF);
	ldw	x, (0x11, sp)
	addw	x, #0x0006
	ldw	(0x09, sp), x
	ldw	x, (0x13, sp)
	addw	x, #0x0006
	ld	a, (x)
	ld	(x), a
	push	a
	call	_BCD2BIN
	addw	sp, #1
	ldw	x, (0x09, sp)
	ld	(x), a
	addw	sp, #24
	ret
;	user/ds1307.c: 187: unsigned char DS1307_GetSeconds(void)
;	-----------------------------------------
;	 function DS1307_GetSeconds
;	-----------------------------------------
_DS1307_GetSeconds:
;	user/ds1307.c: 190: sec=read_ds1307(0x00);
	push	#0x00
	call	_read_ds1307
	addw	sp, #1
;	user/ds1307.c: 191: sec=BCD2BIN(sec&=0x7F);
	and	a, #0x7f
	push	a
	call	_BCD2BIN
	addw	sp, #1
;	user/ds1307.c: 192: return sec;
	ret
;	user/ds1307.c: 194: unsigned char DS1307_GetMinutes(void)
;	-----------------------------------------
;	 function DS1307_GetMinutes
;	-----------------------------------------
_DS1307_GetMinutes:
;	user/ds1307.c: 197: min=read_ds1307(0x01);
	push	#0x01
	call	_read_ds1307
	addw	sp, #1
;	user/ds1307.c: 198: min=BCD2BIN(min&=0x7F);
	and	a, #0x7f
	push	a
	call	_BCD2BIN
	addw	sp, #1
;	user/ds1307.c: 199: return min;
	ret
;	user/ds1307.c: 201: unsigned char DS1307_GetHours(void)
;	-----------------------------------------
;	 function DS1307_GetHours
;	-----------------------------------------
_DS1307_GetHours:
;	user/ds1307.c: 204: hour=read_ds1307(0x02);
	push	#0x02
	call	_read_ds1307
	addw	sp, #1
;	user/ds1307.c: 205: if((hour&0x40)!=0)    hour=BCD2BIN(hour&=0x1F);
	bcp	a, #0x40
	jreq	00102$
	and	a, #0x1f
	push	a
	call	_BCD2BIN
	addw	sp, #1
	ret
00102$:
;	user/ds1307.c: 206: else hour=BCD2BIN(hour&=0x3F);
	and	a, #0x3f
	push	a
	call	_BCD2BIN
	addw	sp, #1
;	user/ds1307.c: 207: return hour;
	ret
;	user/ds1307.c: 209: unsigned char DS1307_GetDay(void)
;	-----------------------------------------
;	 function DS1307_GetDay
;	-----------------------------------------
_DS1307_GetDay:
;	user/ds1307.c: 212: day=read_ds1307(0x03);
	push	#0x03
	call	_read_ds1307
	addw	sp, #1
;	user/ds1307.c: 213: day=BCD2BIN(day&=0x07);
	and	a, #0x07
	push	a
	call	_BCD2BIN
	addw	sp, #1
;	user/ds1307.c: 214: return day;
	ret
;	user/ds1307.c: 216: unsigned char DS1307_GetDate(void)
;	-----------------------------------------
;	 function DS1307_GetDate
;	-----------------------------------------
_DS1307_GetDate:
;	user/ds1307.c: 219: date=read_ds1307(0x04);
	push	#0x04
	call	_read_ds1307
	addw	sp, #1
;	user/ds1307.c: 220: date=BCD2BIN(date&=0x3F);
	and	a, #0x3f
	push	a
	call	_BCD2BIN
	addw	sp, #1
;	user/ds1307.c: 221: return date;
	ret
;	user/ds1307.c: 223: unsigned char DS1307_GetMonth(void)
;	-----------------------------------------
;	 function DS1307_GetMonth
;	-----------------------------------------
_DS1307_GetMonth:
;	user/ds1307.c: 226: month=read_ds1307(0x05);
	push	#0x05
	call	_read_ds1307
	addw	sp, #1
;	user/ds1307.c: 227: month=BCD2BIN(month&=0x1F);
	and	a, #0x1f
	push	a
	call	_BCD2BIN
	addw	sp, #1
;	user/ds1307.c: 228: return month;
	ret
;	user/ds1307.c: 230: unsigned char DS1307_GetYear(void)
;	-----------------------------------------
;	 function DS1307_GetYear
;	-----------------------------------------
_DS1307_GetYear:
;	user/ds1307.c: 233: year=read_ds1307(0x06);
	push	#0x06
	call	_read_ds1307
	addw	sp, #1
;	user/ds1307.c: 234: year=BCD2BIN(year&=0xFF);
	push	a
	call	_BCD2BIN
	addw	sp, #1
;	user/ds1307.c: 235: return year;
	ret
;	user/ds1307.c: 238: unsigned char read_ds1307(unsigned char regadd)
;	-----------------------------------------
;	 function read_ds1307
;	-----------------------------------------
_read_ds1307:
	push	a
;	user/ds1307.c: 242: while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY)==SET);
00101$:
	push	#0x02
	push	#0x03
	call	_I2C_GetFlagStatus
	popw	x
	cp	a, #0x01
	jreq	00101$
;	user/ds1307.c: 244: I2C_GenerateSTART(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	user/ds1307.c: 247: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
00104$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00104$
;	user/ds1307.c: 250: I2C_Send7bitAddress(0xD0,I2C_DIRECTION_TX);
	push	#0x00
	push	#0xd0
	call	_I2C_Send7bitAddress
	popw	x
;	user/ds1307.c: 251: while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
00107$:
	push	#0x82
	push	#0x07
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00107$
;	user/ds1307.c: 254: I2C_SendData(regadd);
	ld	a, (0x04, sp)
	push	a
	call	_I2C_SendData
	pop	a
;	user/ds1307.c: 255: while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);
00110$:
	push	#0x04
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00110$
;	user/ds1307.c: 258: I2C_GenerateSTART( ENABLE);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	user/ds1307.c: 259: while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));
00113$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	popw	x
	tnz	a
	jreq	00113$
;	user/ds1307.c: 262: I2C_Send7bitAddress(0xD0,I2C_DIRECTION_RX);
	push	#0x01
	push	#0xd0
	call	_I2C_Send7bitAddress
	popw	x
;	user/ds1307.c: 265: while(I2C_GetFlagStatus( I2C_FLAG_ADDRESSSENTMATCHED) == RESET);
00116$:
	push	#0x02
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00116$
;	user/ds1307.c: 268: I2C_AcknowledgeConfig(I2C_ACK_NONE);
	push	#0x00
	call	_I2C_AcknowledgeConfig
	pop	a
;	user/ds1307.c: 271: I2C->SR1;        I2C->SR3;
	ldw	x, #0x5217
	ld	a, (x)
	ldw	x, #0x5219
	ld	a, (x)
;	user/ds1307.c: 273: I2C_GenerateSTOP(ENABLE);
	push	#0x01
	call	_I2C_GenerateSTOP
	pop	a
;	user/ds1307.c: 276: while (I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
00119$:
	push	#0x40
	push	#0x01
	call	_I2C_GetFlagStatus
	popw	x
	tnz	a
	jreq	00119$
;	user/ds1307.c: 279: data=I2C_ReceiveData();
	call	_I2C_ReceiveData
	ld	(0x01, sp), a
;	user/ds1307.c: 282: while(I2C->CR2 & I2C_CR2_STOP);
00122$:
	ldw	x, #0x5211
	ld	a, (x)
	bcp	a, #0x02
	jrne	00122$
;	user/ds1307.c: 284: I2C_AcknowledgeConfig( I2C_ACK_CURR);
	push	#0x01
	call	_I2C_AcknowledgeConfig
	pop	a
;	user/ds1307.c: 285: return (data);
	ld	a, (0x01, sp)
	addw	sp, #1
	ret
;	user/ds1307.c: 287: unsigned char BCD2BIN(unsigned char data)
;	-----------------------------------------
;	 function BCD2BIN
;	-----------------------------------------
_BCD2BIN:
	push	a
;	user/ds1307.c: 290: high=(data>>4)&0x0F;
	ld	a, (0x04, sp)
	swap	a
	and	a, #0x0f
	and	a, #0x0f
	ld	xl, a
;	user/ds1307.c: 291: low=data&0x0F;
	ld	a, (0x04, sp)
	and	a, #0x0f
	ld	(0x01, sp), a
;	user/ds1307.c: 292: return ((high*10)+low);
	ld	a, #0x0a
	mul	x, a
	ld	a, xl
	add	a, (0x01, sp)
	addw	sp, #1
	ret
;	user/ds1307.c: 294: unsigned char BIN2BCD(unsigned char data)
;	-----------------------------------------
;	 function BIN2BCD
;	-----------------------------------------
_BIN2BCD:
	push	a
;	user/ds1307.c: 297: high=data/10;    high =(high<<4)&0xF0;
	clrw	x
	ld	a, (0x04, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	ld	a, xl
	swap	a
	and	a, #0xf0
	and	a, #0xf0
	ld	(0x01, sp), a
;	user/ds1307.c: 298: low=data%10;    low&=0x0F;
	clrw	x
	ld	a, (0x04, sp)
	ld	xl, a
	ld	a, #0x0a
	div	x, a
	and	a, #0x0f
;	user/ds1307.c: 299: return ((high)|low);
	or	a, (0x01, sp)
	addw	sp, #1
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
