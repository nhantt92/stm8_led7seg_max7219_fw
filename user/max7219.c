#include "max7219.h"
#include "stm8s_spi.h"
#include <string.h>

Max7Seg_Struct max7seg;

static void delay_ms(uint8_t x)
{
	while(x--);
}

void max7Seg(GPIO_TypeDef* port, uint8_t data, uint8_t cs, uint8_t clk, uint8_t numLed)
{
	max7seg.port = port;
	max7seg.data = data;
	max7seg.cs = cs;
	max7seg.clk = clk;
	max7seg.numLed =  numLed;
	memset(max7seg.buffer, 0x00, sizeof(max7seg.buffer));
}

void Max7219_Write_Byte(uint8_t dat)
{
	uint8_t cnt;
	uint8_t dsent;
	dsent = dat;
	for(cnt=0; cnt<8; cnt++)
	{
		GPIO_WriteLow(max7seg.port, max7seg.clk);
		if(dsent&0x80)
			GPIO_WriteHigh(max7seg.port, max7seg.data);
		else
			GPIO_WriteLow(max7seg.port, max7seg.data);
		GPIO_WriteHigh(max7seg.port, max7seg.clk);
		dsent <<= 1;
	}
}

void setCommand(uint8_t command, uint8_t value)
{
	uint8_t i;
	GPIO_WriteLow(max7seg.port, max7seg.cs);
	Max7219_Write_Byte(command);
	Max7219_Write_Byte(value);
	GPIO_WriteLow(max7seg.port, max7seg.cs);
	GPIO_WriteHigh(max7seg.port, max7seg.cs);
}

void Init(void)
{
	GPIO_Init(max7seg.port, max7seg.data|max7seg.cs|max7seg.clk, GPIO_MODE_OUT_PP_HIGH_FAST);
	setCommand(SCANLIMIT, 0x07); //scanf num led 7seg
	setCommand(DECODEMODE, 0xff); // decode digit 7 -0
	setCommand(SHUTDOWN, 0x01); // normal operator
	setCommand(DISPLAYTEST, 0x00); //no display test
	setCommand(INTENSITY, 0x01); // brightness 9/32
}

void setIntensity(uint8_t intensity)
{
	setCommand(INTENSITY, intensity);
}

void send7Seg(uint8_t led, uint8_t data)
{
	uint8_t i;
	GPIO_WriteLow(max7seg.port, max7seg.cs);
	Max7219_Write_Byte(led);
	Max7219_Write_Byte(data);
	GPIO_WriteLow(max7seg.port, max7seg.cs);
	GPIO_WriteHigh(max7seg.port, max7seg.cs);
}

/* SPI
// void Max7219_Init(uint8_t numled)
// {
// 	uint8_t i;
// 	GPIO_Init(CS_port, CS_pin, GPIO_MODE_OUT_PP_HIGH_FAST);
//	}
void Max7219_Write(unsigned char addr, unsigned char value)
{
	while(SPI_GetFlagStatus(SPI_FLAG_BSY));
	GPIO_WriteLow(CS_port, CS_pin);
	SPI_SendData(addr);
	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
	SPI_SendData(value);
	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
	GPIO_WriteHigh(CS_port, CS_pin);
}
*/

