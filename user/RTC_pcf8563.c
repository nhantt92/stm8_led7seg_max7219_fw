#include "RTC_pcf8563.h"
#include "stm8s_i2c.h"

static void IIC_Init(uint8_t addr)
{
	I2C_DeInit();
	I2C_Init(100000, addr, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, (CLK_GetClockFreq()/1000000));
	I2C_Cmd(ENABLE);
}

void PCF_Write(uint8_t addr, uint8_t *data, uint8_t count)
{
	I2C_GenerateSTART(ENABLE);
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));

	I2C_Send7bitAddress(PCF8563_WRITE_ADDR, I2C_DIRECTION_TX);
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));

	I2C_SendData(addr);
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));

	while(count){
		count--;
		I2C_SendData(*data);
		data++;
		while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
	}

	I2C_GenerateSTOP(ENABLE);
}