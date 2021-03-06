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
   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
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
  GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT);
  GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);
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

void main() 
{ 
  DateTime dateTimeSet;
  DateTime dateTimeGet;
  dateTimeSet.second = 0;
  dateTimeSet.minute = 25;
  dateTimeSet.hour = 16;
  dateTimeSet.day = 27;
  dateTimeSet.weekday = 4;
  dateTimeSet.month = 12;
  dateTimeSet.year = 2017;
  clock_setup();
  GPIO_Config();
  PCF_Init(PCF_ALARM_INTERRUPT_ENABLE | PCF_TIMER_INTERRUPT_ENABLE);
  max7Seg(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 8);
  Init();
  TIMER_Init();
  PCF_setClockOut(PCF_CLKOUT_1HZ);
  delay(50);
  PCF_setDateTime(&dateTimeSet);
  delay(50);
  IWDG_Config();
  enableInterrupts();
  setIntensity(0x0F);
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
    if(TIMER_CheckTimeMS(&tick, 100) == 0)
    {
      PCF_getDateTime(&dateTimeGet);  
      send7Seg(DIG0, dateTimeGet.second%10);
      send7Seg(DIG1, dateTimeGet.second/10);
      send7Seg(DIG3, dateTimeGet.minute%10);
      send7Seg(DIG4, dateTimeGet.minute/10);
      send7Seg(DIG6, dateTimeGet.hour%10);
      send7Seg(DIG7, dateTimeGet.hour/10);
      IWDG_ReloadCounter();
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
