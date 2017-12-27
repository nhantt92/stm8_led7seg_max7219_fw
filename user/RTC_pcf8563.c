#include "RTC_pcf8563.h"
#include "stm8s_i2c.h"
#include "stm8s_gpio.h"
#include "stm8s_clk.h"
#include "timerTick.h"

#define BinToBCD(bin) ((((bin) / 10) << 4) + ((bin) % 10))

uint32_t timeout = I2C_LONG_TIMEOUT;

void I2C_setup(void)
{
 uint8_t Input_Clock = 0x00;
 I2C_DeInit();
 Input_Clock = CLK_GetClockFreq()/1000000;
 I2C_Cmd(ENABLE);
 I2C_Init(100000, PCF8563_WRITE_ADDR, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, Input_Clock);
}

void EnterCriticalSection_UserCallback(void)
{
  disableInterrupts();  
}

void ExitCriticalSection_UserCallback(void)
{
  enableInterrupts();
}

/*Check write byte I2C*/
// void I2C_Write_Byte(uint8_t data)
// {
//   I2C_GenerateSTART(ENABLE);
//   while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
//   I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
//   while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
//   I2C_SendData(data);
//   while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
//   I2C_GenerateSTOP(ENABLE);
// }


uint8_t PCF_Write(uint8_t addr, uint8_t *data, uint8_t count)
{
	uint8_t res = 1;
	volatile uint32_t timeout;
	/*Config ACK current*/
	I2C_AcknowledgeConfig(I2C_ACK_CURR);
	timeout = 0x0FFF;
	/* Check bus Busy */
	while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY))
	{
		if(!timeout--)
		{	
			res = 0;
			return res;
		} 
	}
	/* Master send Start*/
	I2C_GenerateSTART(ENABLE);
	//while(I2C_GetFlagStatus(I2C_FLAG_STARTDETECTION)==SET);
	timeout = 0x0FFF;
	/* Check EV5 */
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
	{
		if(!timeout--) 
		{
			res = 0;
			goto stop;
		}
	}
	/*Send 7bit addr, mode Write*/
	I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
	timeout = 0x0FFF;
	/* check EV6 */
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
	{
		if(!timeout--)
		{
			res = 0;
			goto stop;
		}
		else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
		{
			I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
			res = 0;
			goto stop;
		}
	}
	/* Send addr slave */
	I2C_SendData(addr);
	timeout = 0x0FFF;
	/*  check EV8 */
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
	{
		if(!timeout--)
		{
			res = 0;
			goto stop;
		}
	}
	/* Repeat write data */
	while(count)
	{
		I2C_SendData(*data);
		timeout = 0x0FFF;
		/* Check EV8 */
		while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
		{
			if(!timeout--)
			{
				res = 0;
				goto stop;
			}
		}
		data++;
		count--;
	}
	/* Send the STOP condition */ 
	stop: I2C_GenerateSTOP(ENABLE);
	return res;
}

uint8_t PCF_Read(uint8_t addr, uint8_t *data, uint8_t count)
{	
	uint8_t res = 1;
	volatile uint32_t timeout;
	timeout = 0x0FFF;
	/* Check bus busy */
	while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY))
	{
		if(!timeout--)
		{
			res = 0;
			return res;
		}
	}
	/* send the START condition */
	I2C_GenerateSTART(ENABLE);
	timeout = 0x0FFF;
	// while(I2C_GetFlagStatus(I2C_FLAG_STARTDETECTION)==SET);
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
	{
		if(!timeout--)
		{
			res = 0;
			goto stop;
		}
	}
	/* Send slave addr, mode write */
	I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
	timeout = 0x0FFF;
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
	{
		if(!timeout--)
		{
			res = 0;
			goto stop;
		}
		else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
		{
			I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
			res = 0;
			goto stop;
		}
	}
	/* Send addr */
	I2C_SendData(addr);
	timeout = 0x0FFF;
	while(!I2C_CheckEvent(I2C_FLAG_TRANSFERFINISHED))
	{
		if(!timeout--)
		{
			res = 0;
			goto stop;
		}
	}

	/*resend the START condition  */
	I2C_GenerateSTART(ENABLE);
	timeout = 0x0FFF;
  	while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT))
  	{
  		if(!timeout--)
  		{
  			res = 0;
  			goto stop;
  		}
  	}
  	/* send slave addr, mode READ */
  	I2C_Send7bitAddress(PCF8563_READ_ADDR, I2C_DIRECTION_RX);
  	timeout = 0x0FFF;
  	while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
  	{
  		if(!timeout)
  		{
  			res = 0;
  			goto stop;
  		}
  		else if(I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
		{
			I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);
			res = 0;
			goto stop;
		}
  	}
  	while(count)
  	{
  		timeout = 0x0FFF;
  		while(--timeout && I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);
  		if(count == 0)
  		{
  			I2C_AcknowledgeConfig(I2C_ACK_NONE);
  			I2C_GenerateSTOP(ENABLE);
  		}
  		I2C_AcknowledgeConfig(I2C_ACK_CURR);
  		/* Clear ADDR register by reading SR1 then SR3 register (SR1 has already been read) */
  		//I2C->SR1;        
  		//I2C->SR3;
  		timeout = 0x0FFF;
  		while (--timeout && I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY) == RESET);
  		timeout = 0x0FFF;
  		while(--timeout && !I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED));
  		*data = I2C_ReceiveData();
  		data++;
  		count--;
  	}
  	stop: I2C_GenerateSTOP(ENABLE);
  	return res;
}


// uint8_t read_pcf(uint8_t regadd)
// {
//   uint8_t data=0;
//   //start i2c
//   while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY)==SET);
 
//   I2C_GenerateSTART(ENABLE);
// // while(I2C_GetFlagStatus(I2C_FLAG_STARTDETECTION)==SET);
 
//   while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));

//   //send ds1307 address
//   I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
//   while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));

//   //send ds1307's register address to read
//   I2C_SendData(regadd);
//   while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);

//   //restart i2c
//   I2C_GenerateSTART( ENABLE);
//   while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));

//   //send ds1307 address for read
//   I2C_Send7bitAddress(PCF8563_READ_ADDR,I2C_DIRECTION_RX);
 
//   /* Wait on ADDR flag to be set (ADDR is still not cleared at this level */
//   while(I2C_GetFlagStatus(I2C_FLAG_ADDRESSSENTMATCHED) == RESET);
 
//   //clear ACK
//   I2C_AcknowledgeConfig(I2C_ACK_NONE);
//   //Clear ADDR flag
//   /* Clear ADDR register by reading SR1 then SR3 register (SR1 has already been read) */
//   I2C->SR1;        I2C->SR3;
//   //set stop
//   I2C_GenerateSTOP(ENABLE);
 
//   //Poll RXNE
//   while (I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
 
//   //read byte
//   data=I2C_ReceiveData();
// // while(I2C_GetFlagStatus( I2C_FLAG_STOPDETECTION ) == SET);
//   /* Wait to make sure that STOP control bit has been cleared */
//     while(I2C->CR2 & I2C_CR2_STOP);
//     /* Re-Enable Acknowledgement to be ready for another reception */
//     I2C_AcknowledgeConfig( I2C_ACK_CURR);
//   return (data);
// }

// uint8_t PCF_getDateTime(PCF_DateTime *dateTime)
// {
// 	uint8_t buffer[7];

// 	//PCF_Read(0x02, buffer, sizeof(buffer));
// 	buffer[0] = read_pcf(0x02);

// 	dateTime->second = (((buffer[0] >> 4) & 0x07) * 10) + (buffer[0] & 0x0F);
// 	buffer[1] = read_pcf(0x03);
// 	dateTime->minute = (((buffer[1] >> 4) & 0x07) * 10) + (buffer[1] & 0x0F);
// 	buffer[2] = read_pcf(0x04);
// 	dateTime->hour = (((buffer[2] >> 4) & 0x03) * 10) + (buffer[2] & 0x0F);
// 	buffer[3] = read_pcf(0x05);
// 	dateTime->day = (((buffer[3] >> 4) & 0x03) * 10) + (buffer[3] & 0x0F);
// 	buffer[4] = read_pcf(0x06);
// 	dateTime->weekday = (buffer[4] & 0x07);
// 	buffer[5] = read_pcf(0x07);
// 	dateTime->month = ((buffer[5] >> 4) & 0x01) * 10 + (buffer[5] & 0x0F);
// 	buffer[6] = read_pcf(0x08);
// 	dateTime->year = 1900 + ((buffer[6] >> 4) & 0x0F) * 10 + (buffer[6] & 0x0F);

// 	if (buffer[5] &  0x80)
// 	{
// 		dateTime->year += 100;
// 	}

// 	if (buffer[0] & 0x80) //Clock integrity not guaranted
// 	{
// 		return 1;
// 	}

// 	return 0;

// }

uint8_t PCF_getDateTime(PCF_DateTime *dateTime)
{
	uint8_t buffer[7];

	PCF_Read(0x02, buffer, sizeof(buffer));
	//pcf_read(buffer, 0x02, sizeof(buffer));
	dateTime->second = (((buffer[0] >> 4) & 0x07) * 10) + (buffer[0] & 0x0F);
	dateTime->minute = (((buffer[1] >> 4) & 0x07) * 10) + (buffer[1] & 0x0F);
	dateTime->hour = (((buffer[2] >> 4) & 0x03) * 10) + (buffer[2] & 0x0F);
	dateTime->day = (((buffer[3] >> 4) & 0x03) * 10) + (buffer[3] & 0x0F);
	dateTime->weekday = (buffer[4] & 0x07);
	dateTime->month = ((buffer[5] >> 4) & 0x01) * 10 + (buffer[5] & 0x0F);
	dateTime->year = 1900 + ((buffer[6] >> 4) & 0x0F) * 10 + (buffer[6] & 0x0F);

	if (buffer[5] &  0x80)
	{
		dateTime->year += 100;
	}

	if (buffer[0] & 0x80) //Clock integrity not guaranted
	{
		return 1;
	}

	return 0;

}


void PCF_Init(uint8_t mode)
{
	uint8_t tmp = 0x00;
	I2C_setup();
	// I2C_Write_Byte(0x00); //control status 1;
	// I2C_Write_Byte(tmp);
	PCF_Write(0x00, &tmp, 1);
	mode &= 0x13;
	// I2C_Write_Byte(0x01);
	// I2C_Write_Byte(mode);
	PCF_Write(0x00, &mode, 1);
}

uint8_t PCF_setDateTime(PCF_DateTime *dateTime)
{
	uint8_t buffer[7];
	if (dateTime->second >= 60 || dateTime->minute >= 60 || dateTime->hour >= 24 || dateTime->day > 32 || dateTime->weekday > 6 || dateTime->month > 12 || dateTime->year < 1900 || dateTime->year >= 2100)
	{
		return 1;
	}

	buffer[0] = BinToBCD(dateTime->second) & 0x7F;
	buffer[1] = BinToBCD(dateTime->minute) & 0x7F;
	buffer[2] = BinToBCD(dateTime->hour) & 0x3F;
	buffer[3] = BinToBCD(dateTime->day) & 0x3F;
	buffer[4] = BinToBCD(dateTime->weekday) & 0x07;
	buffer[5] = BinToBCD(dateTime->month) & 0x1F;

	if (dateTime->year >= 2000)
	{
		buffer[5] |= 0x80;
		buffer[6] = BinToBCD(dateTime->year - 2000);
	}
	else
	{
		buffer[6] = BinToBCD(dateTime->year - 1900);
	}

	PCF_Write(0x02, buffer, sizeof(buffer));

	return 0;
}

// uint8_t PCF_getDateTime(PCF_DateTime *dateTime)
// {
// 	uint8_t buffer[7];

// 	PCF_Read(0x02, buffer, sizeof(buffer));

// 	dateTime->second = (((buffer[0] >> 4) & 0x07) * 10) + (buffer[0] & 0x0F);
// 	dateTime->minute = (((buffer[1] >> 4) & 0x07) * 10) + (buffer[1] & 0x0F);
// 	dateTime->hour = (((buffer[2] >> 4) & 0x03) * 10) + (buffer[2] & 0x0F);
// 	dateTime->day = (((buffer[3] >> 4) & 0x03) * 10) + (buffer[3] & 0x0F);
// 	dateTime->weekday = (buffer[4] & 0x07);
// 	dateTime->month = ((buffer[5] >> 4) & 0x01) * 10 + (buffer[5] & 0x0F);
// 	dateTime->year = 1900 + ((buffer[6] >> 4) & 0x0F) * 10 + (buffer[6] & 0x0F);

// 	if (buffer[5] &  0x80)
// 	{
// 		dateTime->year += 100;
// 	}

// 	if (buffer[0] & 0x80) //Clock integrity not guaranted
// 	{
// 		return 1;
// 	}

// 	return 0;
// }

uint8_t PCF_setAlarm(PCF_Alarm *alarm)
{
	uint8_t buffer[4];
	if ((alarm->minute >= 60 && alarm->minute != 80) || (alarm->hour >= 24 && alarm->hour != 80) || (alarm->day > 32 && alarm->day != 80) || (alarm->weekday > 6 && alarm->weekday != 80))
	{
		return 1;
	}

	buffer[0] = BinToBCD(alarm->minute) & 0xFF;
	buffer[1] = BinToBCD(alarm->hour) & 0xBF;
	buffer[2] = BinToBCD(alarm->day) & 0xBF;
	buffer[3] = BinToBCD(alarm->weekday) & 0x87;

	PCF_Write(0x09, buffer, sizeof(buffer));

	return 0;
}

void PCF_setTimer(uint8_t mode, uint8_t count)
{
	mode &= 0x13;
	PCF_Write(0x0E, &mode, 1);				//Timer_control

	PCF_Write(0x0F, &count, 1);				//Timer
}

uint8_t PCF_getTimer()
{
	uint8_t count;
	PCF_Read(0x0F, &count, 1);				//Timer

	return count;
}

uint8_t PCF_getAlarm(PCF_Alarm *alarm)
{
	uint8_t buffer[4];

	PCF_Read(0x09, buffer, sizeof(buffer));

	alarm->minute = (((buffer[0] >> 4) & 0x0F) * 10) + (buffer[0] & 0x0F);
	alarm->hour = (((buffer[1] >> 4) & 0x0B) * 10) + (buffer[1] & 0x0F);
	alarm->day = (((buffer[2] >> 4) & 0x0B) * 10) + (buffer[2] & 0x0F);
	alarm->weekday = (((buffer[3] >> 4) & 0x08) * 10) + (buffer[3] & 0x07);

	return 0;
}

uint8_t PCF_getAndClearFlags()
{
	uint8_t flags;
	uint8_t cleared;	//Mask only configuration bits
	PCF_Read(0x01, &flags, 1);				//Control_status_2
	cleared = flags & 0x13;
	PCF_Write(0x01, &cleared, 1);			//Control_status_2

	return flags & 0x0C;					//Mask unnecessary bits
}

void PCF_setClockOut(uint8_t mode)
{
	mode &= 0x13;
	PCF_Write(0x0D, &mode, 1);				//CLKOUT_control
}

// uint32_t pcf_read(uint8_t *buffer, uint8_t readAddr, uint8_t NumByteToRead)
// {
// 	I2C_Timeout = I2C_LONG_TIMEOUT;
// 	/* While the bus is busy */
// 	while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY))
// 	{
// 		if((I2C_Timeout--)==0) return TIMEOUT_UserCallback();
// 	}

// 	/* Send START */
// 	I2C_GenerateSTART(ENABLE);

// 	/* Check EV5 */
// 	I2C_Timeout = I2C_FLAG_TIMEOUT;
// 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
// 	{
// 		if((I2C_Timeout--) == 0) return TIMEOUT_UserCallback();
// 	}

// 	/* Send Slave Address for write */
// 	I2C_Send7bitAddress((uint8_t)PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
// 	/* Check EV6 */
// 	I2C_Timeout = I2C_FLAG_TIMEOUT;
// 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
// 	{
// 		if((I2C_Timeout--)==0) return TIMEOUT_UserCallback();
// 	}

// 	I2C_SendData((uint8_t)readAddr);
// 	/* Check EV8 */
// 	I2C_Timeout = I2C_FLAG_TIMEOUT;
// 	while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);
// 	{
// 		if((I2C_Timeout--)==0) return TIMEOUT_UserCallback();
// 	}

// 	/* Send START second */
// 	I2C_GenerateSTART(ENABLE);
// 	/* Check EV5 */
// 	I2C_Timeout = I2C_FLAG_TIMEOUT;
// 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
// 	{
// 		if((I2C_Timeout--)==0) return TIMEOUT_UserCallback();
// 	}

// 	I2C_Send7bitAddress((uint8_t)PCF8563_READ_ADDR, I2C_DIRECTION_RX);

// 	if(NumByteToRead > 3)
// 	{
// 		I2C_Timeout = I2C_FLAG_TIMEOUT;
// 		while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET)
// 		{
// 			if((I2C_Timeout--)==0) return TIMEOUT_UserCallback();
// 		}
// 		/* Read a byte from pcf */
// 		*buffer = I2C_ReceiveData();
// 		/*point to the next location where the byte read will saved*/
// 		*buffer++;
// 		/* decrement the read bytes counter */
// 		NumByteToRead--;
// 	}
// 	if(NumByteToRead == 3)
// 	{
// 		I2C_Timeout = I2C_FLAG_TIMEOUT;
// 		while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET)
// 		{
// 			if((I2C_Timeout--)==0) return TIMEOUT_UserCallback();
// 		}
// 		/*Clear ACK*/
// 		I2C_AcknowledgeConfig(I2C_ACK_NONE);
// 		/* Call User callback, disable interrupt */
// 		EnterCriticalSection_UserCallback();
// 		/*Read Data N-2*/
// 		*buffer = I2C_ReceiveData();
// 		*buffer++;
// 		I2C_GenerateSTOP(ENABLE);
// 		*buffer = I2C_ReceiveData();
// 		ExitCriticalSection_UserCallback();
// 		*buffer++;
// 		I2C_Timeout = I2C_FLAG_TIMEOUT;
// 		while(I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY)== RESET)
// 		{
// 			if((I2C_Timeout--)==0) return TIMEOUT_UserCallback();
// 		}
// 		*buffer = I2C_ReceiveData();
// 		NumByteToRead = 0;
// 	}
// 	if(NumByteToRead==2)
// 	{
// 		I2C_AcknowledgeConfig(I2C_ACK_NEXT);
// 		I2C_Timeout = I2C_FLAG_TIMEOUT;
// 		while(I2C_GetFlagStatus(I2C_FLAG_ADDRESSSENTMATCHED)==RESET)
// 		{
// 			if((I2C_Timeout--)==0) return TIMEOUT_UserCallback();
// 		}
// 		I2C->SR3;
// 		I2C_AcknowledgeConfig(I2C_ACK_NONE);
// 		I2C_Timeout=I2C_FLAG_TIMEOUT;
// 		while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED)==RESET)
// 		{
// 			if((I2C_Timeout--)==0)  return TIMEOUT_UserCallback();
// 		}
// 		EnterCriticalSection_UserCallback();
// 		I2C_GenerateSTOP(ENABLE);
// 		*buffer = I2C_ReceiveData();
// 		*buffer++;
// 		ExitCriticalSection_UserCallback();
// 		*buffer = I2C_ReceiveData();
// 		NumByteToRead = 0;
// 	}
// 	if(NumByteToRead < 2)
// 	{
// 		I2C_Timeout = I2C_FLAG_TIMEOUT;
// 		while(I2C_GetFlagStatus(I2C_FLAG_ADDRESSSENTMATCHED)== RESET)
// 		{
// 			if((I2C_Timeout--)==0) return TIMEOUT_UserCallback();
// 		}
// 		I2C_AcknowledgeConfig(I2C_ACK_NONE);
// 		EnterCriticalSection_UserCallback();
// 		I2C->SR3;
// 		I2C_GenerateSTOP(ENABLE);
// 		ExitCriticalSection_UserCallback();
// 		I2C_Timeout = I2C_FLAG_TIMEOUT;
// 		while(I2C_GetFlagStatus(I2C_FLAG_RXNOTEMPTY)== RESET)
// 		{
// 			if((I2C_Timeout--)==0) return TIMEOUT_UserCallback();
// 		}
// 		*buffer = I2C_ReceiveData();
// 		NumByteToRead--;
// 		I2C_Timeout = I2C_FLAG_TIMEOUT;
// 		while(I2C->CR2 & I2C_CR2_STOP)
// 		{
// 			if((I2C_Timeout--)==0) return TIMEOUT_UserCallback();
// 		}
// 		I2C_AcknowledgeConfig(I2C_ACK_CURR);
// 	}
// 	return 1;
// }

