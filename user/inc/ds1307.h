
#ifndef __DS1307_H
#define __DS1307_H    16071985
//#define __DS1307_H

#include "stm8s.h"

#define DS1307_I2C_ADDR         0xD0

//Registers location
#define DS1307_SECONDS         0x00
#define DS1307_MINUTES         0x01
#define DS1307_HOURS            0x02
#define DS1307_DAY            0x03
#define DS1307_DATE            0x04
#define DS1307_MONTH            0x05
#define DS1307_YEAR            0x06
#define DS1307_CONTROL         0x07

//Bits in control register
#define TM_DS1307_CONTROL_OUT      7
#define TM_DS1307_CONTROL_SQWE      4
#define TM_DS1307_CONTROL_RS1      1
#define TM_DS1307_CONTROL_RS0      0

typedef struct {
   uint8_t seconds;   //Seconds,          00-59
   uint8_t minutes;   //Minutes,          00-59
   uint8_t hours;      //Hours,         00-23
   uint8_t day;      //Day in a week,    1-7
   uint8_t date;      //Day in a month   1-31
   uint8_t month;      //Month,         1-12
   uint8_t year;      //Year            00-99
} DS1307_Time_t;


#define DS1307_I2C_CLOCK         10000
#define DS1307_ADDR_WRITE     0xd0
#define DS1307_ADDR_READ      0xd1

#define DS1307_ADDR_SECOND    0x00
#define DS1307_ADDR_MINUTE    0x01
#define DS1307_ADDR_HOUR      0x02
#define DS1307_ADDR_DAY       0x03
#define DS1307_ADDR_DATE      0x04
#define DS1307_ADDR_MONTH     0x05
#define DS1307_ADDR_YEAR      0x06

#define DS1307_ADDR_CONTROL   0x07
#define DS1307_SQW            0x10
#define DS1307_MODE_1Khz      0x00
#define DS1307_MODE_4096Hz    0x01
#define DS1307_MODE_8192Hz    0x10
#define DS1307_MODE_32768Hz   0x11

#define DS1307_SQW_1Hz        0x10
#define DS1307_SQW_4096KHz    0x11    // 4.096KHz
#define DS1307_SQW_8192KHz    0x12    // 8.192KHz
#define DS1307_SQW_32768Hz    0x13

extern void DS1307_Init(void);
extern void DS1307_write_time(unsigned char hour1,unsigned char min1,unsigned char day1,unsigned char date1,unsigned char month1,unsigned char year1);
extern void DS1307_SetTime(DS1307_Time_t* time);

extern void DS1307_GetDateTime(DS1307_Time_t* time) ;
/*lay gia tri thu ngay thang nam*/
extern unsigned char DS1307_GetDay(void);
extern unsigned char DS1307_GetDate(void);
extern unsigned char DS1307_GetMonth(void);
extern unsigned char DS1307_GetYear(void);
/*lay gia tri gio phut giay*/
extern unsigned char DS1307_GetHours(void);
extern unsigned char DS1307_GetMinutes(void);
extern unsigned char DS1307_GetSeconds(void);
/*Ham doc tu DS1307 */
unsigned char read_ds1307(unsigned char regadd);
/*chuyen tu BCD sang BIN*/
extern unsigned char BCD2BIN(unsigned char data);
/* Chuyen tu BCD sang BIN*/
extern unsigned char BIN2BCD(unsigned char data);
#endif
