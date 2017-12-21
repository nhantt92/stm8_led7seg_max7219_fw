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

TIME tick; 
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

void main() 
{
  uint8_t hh = 0, mm = 0, ss = 0;
  PCF_DateTime dateTime;
  PCF_DateTime pcfDateTime;
  dateTime.second = 43;
  dateTime.minute = 15;
  dateTime.hour = 17;
  dateTime.day = 21;
  dateTime.weekday = 5;
  dateTime.month = 12;
  dateTime.year = 2017;
  CLK_Config();
  GPIO_Config();
  PCF_Init(PCF_ALARM_INTERRUPT_ENABLE);
  // SPI_setup(); 
  max7Seg(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 8);
  Init();
  TIMER_Init();
  //PCF_setClockOut(PCF_CLKOUT_1HZ);
  //PCF_setDateTime(&dateTime);
  IWDG_Config();
  enableInterrupts();
  setIntensity(0x03);
  TIMER_InitTime(&tick);
  //test
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
      if(TIMER_CheckTimeMS(&tick, 1000) == 0)
      {
        if(++ss >=60)
        {
          ss=0;
          if(++mm >=60)
          {
            mm=0;
            if(++hh >= 24)
              hh = 0;
          }
        }
        send7Seg(DIG0, ss%10);
        send7Seg(DIG1, ss/10);
        send7Seg(DIG3, mm%10);
        send7Seg(DIG4, mm/10);
        send7Seg(DIG6, hh%10);
        send7Seg(DIG7, hh/10);
      }
    // if(TIMER_CheckTimeMS(&tick, 100) == 0)
    // {
    //   PCF_getDateTime(&pcfDateTime);
    //   send7Seg(DIG0, pcfDateTime.second%10);
    //   send7Seg(DIG1, pcfDateTime.second/10);
    //   send7Seg(DIG3, pcfDateTime.minute%10);
    //   send7Seg(DIG4, pcfDateTime.minute/10);
    //   send7Seg(DIG6, pcfDateTime.hour%10);
    //   send7Seg(DIG7, pcfDateTime.hour/10);
    // }
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
