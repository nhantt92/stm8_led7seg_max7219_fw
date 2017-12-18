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

void GPIO_setup(void); 
void SPI_setup(void);
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
  uint8_t i;
  const unsigned char data[11] = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70,0x7F, 0x7B, 0x00}; 
  CLK_Config();
  // GPIO_setup(); 
  // SPI_setup(); 
  max7Seg(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 8);
  Init();
  TIMER_Init();
  IWDG_Config();
  enableInterrupts();
  GPIO_WriteLow(max7seg.port, max7seg.cs);
  Max7219_Write_Byte(DIG0);
  Max7219_Write_Byte(data[0]);
  GPIO_WriteLow(max7seg.port, max7seg.cs);
  GPIO_WriteHigh(max7seg.port, max7seg.cs);
  while(TRUE) 
  {

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
