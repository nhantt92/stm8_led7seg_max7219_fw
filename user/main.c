/**
*******************************************
* @file     main.c
* @author   nhantt
* @version  V1.0.0
* @date     25-March-2017
* @brief    This file brief for save memory used build with SDCC
*********************************************
*/

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "main.h"
#include "stm8s_gpio.h"
#include "stm8s_clk.h"
#include "stm8s_conf.h"
#include "max7219.h"
#include "stm8s_spi.h"
#include <string.h>
#include "timerTick.h"
#include "stm8s_tim4.h"
#include "RTC_pcf8563.h"
#include "stm8s_i2c.h"

TIME tick; 

void clock_setup(void)
{
   CLK_DeInit();
   CLK_HSECmd(DISABLE);
   CLK_LSICmd(DISABLE);
   CLK_HSICmd(ENABLE);
   while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
   CLK_ClockSwitchCmd(ENABLE);
   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
   CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
   CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
}

static void GPIO_Config(void)
{
  GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
  GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
}

void delay(uint16_t x)
{
    while(x--);
}

INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
{
  TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
  TIMER_Inc();
  IWDG_ReloadCounter();
}

void IWDG_Config(void)
{
  /* IWDG timeout equal to 500 ms (the timeout may varies due to LSI frequency dispersion) */
  /* Enable write access to IWDG_PR and IWDG_RLR registers */
  IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
  /* IWDG counter clock: LSI 128KHz/256 */
  IWDG_SetPrescaler(IWDG_Prescaler_256);
  //Set counter reload value to obtain 0.5s IWDG TimeOut.
  //Counter Reload Value = 0.5s/IWDG counter clock period
  //                       = 0.5s*LsiFreq/(256) 
  IWDG_SetReload(250);
  /* Reload IWDG counter */
  IWDG_ReloadCounter();
  /* Enable IWDG (the LSI oscillator will be enabled by hardware) */
  IWDG_Enable();
}

// void I2C_setup(void)
// {
//  uint8_t Input_Clock = 0x00;
//  I2C_DeInit();
//  Input_Clock = CLK_GetClockFreq()/1000000;
//  I2C_Cmd(ENABLE);
//  I2C_Init(100000, 0x46, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, Input_Clock);
// }

// void I2C_Write_Byte(uint8_t addr, uint8_t data)
// {
//   I2C_GenerateSTART(ENABLE);
//   while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
//   //return I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT);
//   I2C_Send7bitAddress(addr, I2C_DIRECTION_TX);
//   while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
//   //return I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED);
//   I2C_SendData(data);
//   while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
//   I2C_GenerateSTOP(ENABLE);
// }

// uint16_t I2C_Read_Byte(void)
// {
//   uint16_t value = 0x0000;
//   uint8_t num_of_byte = 0x02;
//   unsigned char bytes[2] = {0x00, 0x00};
//   while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY));
//   I2C_GenerateSTART(ENABLE);
//   while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
//   I2C_Send7bitAddress(0x46, I2C_DIRECTION_RX);
//   while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));

//   while(num_of_byte)
//   {
//     if(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED))
//     {
//       if(num_of_byte==0)
//       {
//         I2C_AcknowledgeConfig(I2C_ACK_NONE);
//         I2C_GenerateSTOP(ENABLE);
//       }
//       bytes[(num_of_byte-1)]=I2C_ReceiveData();
//       num_of_byte--;
//     }
//   }
//   value = ((bytes[1]<<8)|bytes[0]);
//   return value;
// }

// uint16_t get_lux_value(unsigned char mode, uint16_t delay_time)
// {
//   uint16_t lux_value = 0x00;
//   uint8_t dly = 0x00;
//   unsigned char s = 0x08;
//   while(s)
//   {
//     I2C_Write_Byte(0x46, 0x01);
//     I2C_Write_Byte(0x46, mode);
//     lux_value+=I2C_Read_Byte();
//     for(dly = 0; dly < delay_time; dly++)
//     {
//       delay(1);
//     }
//     I2C_Write_Byte(0x46,0x00);
//     s--;
//   }
//   lux_value>>=3;
//   return ((uint16_t)lux_value);
// }

void main() 
{
  uint8_t hh = 0, mm = 0, ss = 0;
  PCF_DateTime dateTime;
  PCF_DateTime pcfDateTime;
  dateTime.second = 40;
  dateTime.minute = 32;
  dateTime.hour = 14;
  dateTime.day = 22;
  dateTime.weekday = 6;
  dateTime.month = 12;
  dateTime.year = 2017;
  clock_setup();
  //GPIO_Config();
  //I2C_setup();
  //I2C_Write_Byte(0x00);
  PCF_Init(PCF_ALARM_INTERRUPT_ENABLE | PCF_TIMER_INTERRUPT_ENABLE);
  //PCF_Init(PCF_ALARM_INTERRUPT_ENABLE);
  // SPI_setup(); 
  max7Seg(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 8);
  Init();
  TIMER_Init();
  PCF_setClockOut(PCF_CLKOUT_1HZ);
  delay(50);
  PCF_setDateTime(&dateTime);
  delay(50);
  IWDG_Config();
  enableInterrupts();
  setIntensity(0x03);
  TIMER_InitTime(&tick);
  send7Seg(DIG7, 0);
  send7Seg(DIG6, 0);
  send7Seg(DIG5, 10);
  send7Seg(DIG4, 0);
  send7Seg(DIG3, 0);
  send7Seg(DIG2, 10);
  send7Seg(DIG1, 0);
  send7Seg(DIG0, 0);
  while(TRUE) 
  {
      // if(TIMER_CheckTimeMS(&tick, 100) == 0)
      // {
      //   if(++ss >=60)
      //   {
      //     ss=0;
      //     if(++mm >=60)
      //     {
      //       mm=0;
      //       if(++hh >= 24)
      //         hh = 0;
      //     }
      //   }
      //   send7Seg(DIG0, ss%10);
      //   send7Seg(DIG1, ss/10);
      //   send7Seg(DIG3, mm%10);
      //   send7Seg(DIG4, mm/10);
      //   send7Seg(DIG6, hh%10);
      //   send7Seg(DIG7, hh/10);
      // }
    
    if(TIMER_CheckTimeMS(&tick, 50) == 0)
    {
      PCF_getDateTime(&pcfDateTime);  
      send7Seg(DIG0, pcfDateTime.second%10);
      send7Seg(DIG1, pcfDateTime.second/10);
      send7Seg(DIG3, pcfDateTime.minute%10);
      send7Seg(DIG4, pcfDateTime.minute/10);
      send7Seg(DIG6, pcfDateTime.hour%10);
      send7Seg(DIG7, pcfDateTime.hour/10);
    }
  }
}

// void GPIO_setup(void) 
// {
//   GPIO_Init(GPIOC, ((GPIO_Pin_TypeDef)GPIO_PIN_5 | GPIO_PIN_6), GPIO_MODE_OUT_PP_HIGH_FAST);
// }
// void SPI_setup(void) 
// {
//   SPI_DeInit(); SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_2, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_1LINE_TX, SPI_NSS_SOFT ,0x00); 
//   SPI_Cmd(ENABLE);
// }
