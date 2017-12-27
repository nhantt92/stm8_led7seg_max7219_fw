#ifndef __RTC_PCF8563_H_
#define __RTC_PCF8563_H_
#include "stm8s.h"

#define RTC_HOLDER 0xA5

#define PCF8563_READ_ADDR 0xA3
#define PCF8563_WRITE_ADDR 0xA2

#define PCF_ALARM_FLAG (1<<3)
#define PCF_TIMER_FLAG (1<<2)
#define PCF_ALARM_INTERRUPT_ENABLE (1<<1) 
#define PCF_TIMER_INTERRUPT_ENABLE (1<<0)

#define PCF_CLKOUT_32768HZ 0x10
#define PCF_CLKOUT_1024HZ 0x11
#define PCF_CLKOUT_32HZ 0x12
#define PCF_CLKOUT_1HZ 0x13
#define PCF_CLKOUT_DISABLE 0x00

#define PCF_TIMER_4096HZ 0x10
#define PCF_TIMER_64HZ 0x11
#define PCF_TIMER_1HZ	0x12
#define PCF_TIMER_1_60HZ	0x13
#define PCF_TIMER_DISABLE 0x03

#define PCF_DISABLE_ALARM 80

#define I2C_FLAG_TIMEOUT ((uint32_t)0x1000)
#define I2C_LONG_TIMEOUT ((uint32_t)(10*I2C_FLAG_TIMEOUT))

typedef struct {
	uint8_t minute;
	uint8_t hour;
	uint8_t day;
	uint8_t weekday;
} PCF_Alarm;

typedef struct {
	uint8_t second;
	uint8_t minute;
	uint8_t hour;
	uint8_t day;
	uint8_t weekday;
	uint8_t month;
	uint16_t year;
} PCF_DateTime;

//void I2C_setup(void);
//void I2C_Write_Byte(uint8_t data);

uint8_t PCF_Write(uint8_t addr, uint8_t *data, uint8_t count);
void PCF_Read(uint8_t addr, uint8_t *data, uint8_t count);

void PCF_Init(uint8_t mode);
uint8_t PCF_GetAndClearFlags(void);

void PCF_setClockOut(uint8_t mode);
void PCF_setTimer(uint8_t mode, uint8_t count);
uint8_t PCF_getTimer(void);

uint8_t PCF_setAlarm(PCF_Alarm *alarm);
uint8_t PCF_getAlarm(PCF_Alarm *alarm);

uint8_t PCF_setDateTime(PCF_DateTime *dataTime);
uint8_t PCF_getDateTime(PCF_DateTime *dataTime);

#endif /*PCF8563_H_*/