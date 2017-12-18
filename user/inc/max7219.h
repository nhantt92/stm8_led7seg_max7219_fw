#ifndef __MAX7219_H
#define __MAX7219_H

#include "stm8s.h"
#include "stm8s_gpio.h"

#define CS_pin GPIO_PIN_4
#define CS_port GPIOC

#define NOP 0x00
#define DIG0 0x01
#define DIG1 0x02
#define DIG2 0x03
#define DIG3 0x04
#define DIG4 0x05
#define DIG5 0x06
#define DIG6 0x07
#define DIG7 0x08
#define DECODEMODE 0x09
#define INTENSITY 0x0A
#define SCANLIMIT 0x0B
#define SHUTDOWN 0x0C
#define DISPLAYTEST 0x0F

typedef struct 
{	
	GPIO_TypeDef* port;
	uint8_t data;
	uint8_t cs;
	uint8_t clk;
	uint8_t numLed;
	uint8_t buffer[8]; // 8 led 8 byte
}Max7Seg_Struct;

extern Max7Seg_Struct max7seg;

void Max7219_Write_Byte(uint8_t dat);
void max7Seg(GPIO_TypeDef* port, uint8_t data, uint8_t cs, uint8_t clk, uint8_t numLed);
void Init(void);
void setCommand(uint8_t command, uint8_t value);
void setIntensity(uint8_t intensity);
void send7Seg(uint8_t led, uint8_t data);
#endif