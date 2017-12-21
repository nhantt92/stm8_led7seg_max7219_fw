#include "ds1307.h"
#include "stm8s.h"
#include "stm8s_i2c.h"
#include "stm8s_clk.h"

void DS1307_Init(void)
{
  u8 Input_Clock = 0x0;
  Input_Clock = CLK_GetClockFreq()/1000000;
  I2C_DeInit();
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
  I2C_Cmd( ENABLE);
  /* sEE_I2C configuration after enabling it */
  I2C_Init(DS1307_I2C_CLOCK, DS1307_I2C_ADDR, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT,Input_Clock);
}

void DS1307_write_time(unsigned char hour1,unsigned char min1,unsigned char day1,unsigned char date1,unsigned char month1,unsigned char year1)
{
uint8_t data[7];
  data[0]=BIN2BCD(0x0);
  data[1]=BIN2BCD(min1);
  data[2]=BIN2BCD(hour1);
  data[3]=BIN2BCD(day1);
  data[4]=BIN2BCD(date1);
  data[5]=BIN2BCD(month1);
  data[6]=BIN2BCD(year1);
  //start i2c
  while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY)==SET);
  I2C_GenerateSTART(ENABLE);
 // while(I2C_GetFlagStatus(I2C_FLAG_STARTDETECTION)==SET);
  
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));

  //send ds1307 address
  I2C_Send7bitAddress(DS1307_ADDR_WRITE,I2C_DIRECTION_TX);
  
  /* Test on EV6 and clear it */
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));


  //second address register
  I2C_SendData( 0x01);
  
  /* Test on EV8 and clear it */
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));
  
  
  /* write min */
    I2C_SendData( data[1]);
  /* Test on EV8 and clear it */
    /* Wait till all data have been physically transferred on the bus */
    while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
	
	/* write hour */
    I2C_SendData( data[2]);
  /* Test on EV8 and clear it */
    /* Wait till all data have been physically transferred on the bus */
    while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
	
	/* write day */
    I2C_SendData( data[3]);
  /* Test on EV8 and clear it */
    /* Wait till all data have been physically transferred on the bus */
    while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
	
	/* write date */
    I2C_SendData( data[4]);
  /* Test on EV8 and clear it */
    /* Wait till all data have been physically transferred on the bus */
    while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
	
	/* write month */
    I2C_SendData( data[5]);
  /* Test on EV8 and clear it */
    /* Wait till all data have been physically transferred on the bus */
    while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
	
	/* write year */
    I2C_SendData( data[6]);
  /* Test on EV8 and clear it */
    /* Wait till all data have been physically transferred on the bus */
    while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
	
	/* Send STOP condition */
    I2C_GenerateSTOP(ENABLE);
	
	/* Perform a read on SR1 and SR3 register to clear eventually pending flags */
    I2C->SR1;		I2C->SR3;
}


void DS1307_SetTime(DS1307_Time_t* time)
{
  uint8_t data[7];
  data[0]=BIN2BCD(time->seconds);
  data[1]=BIN2BCD(time->minutes);
  data[2]=BIN2BCD(time->hours);
  data[3]=BIN2BCD(time->day);
  data[4]=BIN2BCD(time->date);
  data[5]=BIN2BCD(time->month);
  data[6]=BIN2BCD(time->year);
  //start i2c
  while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY)==SET);
  I2C_GenerateSTART(ENABLE);
// while(I2C_GetFlagStatus(I2C_FLAG_STARTDETECTION)==SET);
 
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));

  //send ds1307 address
  I2C_Send7bitAddress((uint8_t)DS1307_ADDR_WRITE,I2C_DIRECTION_TX);
 
  /* Test on EV6 and clear it */
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
 
  //second address register
  I2C_SendData( 0x01);
 
  /* Test on EV8 and clear it */
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 
 
  /* write min */
    I2C_SendData( data[1]);
  /* Test on EV8 and clear it */
    /* Wait till all data have been physically transferred on the bus */
    while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
   
    /* write hour */
    I2C_SendData( data[2]);
  /* Test on EV8 and clear it */
    /* Wait till all data have been physically transferred on the bus */
    while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
   
    /* write day */
    I2C_SendData( data[3]);
  /* Test on EV8 and clear it */
    /* Wait till all data have been physically transferred on the bus */
    while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
   
    /* write date */
    I2C_SendData( data[4]);
  /* Test on EV8 and clear it */
    /* Wait till all data have been physically transferred on the bus */
    while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
   
    /* write month */
    I2C_SendData( data[5]);
  /* Test on EV8 and clear it */
    /* Wait till all data have been physically transferred on the bus */
    while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
   
    /* write year */
    I2C_SendData( data[6]);
  /* Test on EV8 and clear it */
    /* Wait till all data have been physically transferred on the bus */
    while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED));
   
    /* Send STOP condition */
    I2C_GenerateSTOP(ENABLE);
   
    /* Perform a read on SR1 and SR3 register to clear eventually pending flags */
    I2C->SR1;        I2C->SR3;
}

void DS1307_GetDateTime(DS1307_Time_t* time) {
   unsigned char i,data[7];
   //TM_I2C_ReadMulti(DS1307_I2C, TM_DS1307_I2C_ADDR, TM_DS1307_SECONDS, data, 7);
   for(i=0;i<8;i++)
   {
      data[i]=read_ds1307(i);
   }
  
   time->seconds = BCD2BIN(data[0]&=0x7F);
  
   time->minutes = BCD2BIN(data[1]&=0x7F);
  
   if((data[1]&0x40)!=0)    time->hours=BCD2BIN(data[2]&=0x1F);
   else time->hours=BCD2BIN(data[2]&=0x3F);
  
   time->day = BCD2BIN(data[3]&=0x07);
   time->date = BCD2BIN(data[4]&=0x3F);
   time->month = BCD2BIN(data[5]&=0x1F);
   time->year = BCD2BIN(data[6]&=0xFF);
}


unsigned char DS1307_GetSeconds(void)
  {
    unsigned char sec;
    sec=read_ds1307(0x00);
    sec=BCD2BIN(sec&=0x7F);
    return sec;
  }
unsigned char DS1307_GetMinutes(void)
  {
    unsigned char min;
    min=read_ds1307(0x01);
    min=BCD2BIN(min&=0x7F);
    return min;
  }
unsigned char DS1307_GetHours(void)
  {
    unsigned char hour;
    hour=read_ds1307(0x02);
    if((hour&0x40)!=0)    hour=BCD2BIN(hour&=0x1F);
    else hour=BCD2BIN(hour&=0x3F);
    return hour;
  }
unsigned char DS1307_GetDay(void)
  {
    unsigned char day;
    day=read_ds1307(0x03);
    day=BCD2BIN(day&=0x07);
    return day;
  }
unsigned char DS1307_GetDate(void)
  {
    unsigned char date;
    date=read_ds1307(0x04);
    date=BCD2BIN(date&=0x3F);
    return date;
  }
unsigned char DS1307_GetMonth(void)
  {
    unsigned char month;
    month=read_ds1307(0x05);
    month=BCD2BIN(month&=0x1F);
    return month;
  }
unsigned char DS1307_GetYear(void)
  {
    unsigned char year;
    year=read_ds1307(0x06);
    year=BCD2BIN(year&=0xFF);
    return year;
  }

unsigned char read_ds1307(unsigned char regadd)
{
  unsigned char data=0;
  //start i2c
  while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY)==SET);
 
  I2C_GenerateSTART(ENABLE);
// while(I2C_GetFlagStatus(I2C_FLAG_STARTDETECTION)==SET);
 
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));

  //send ds1307 address
  I2C_Send7bitAddress(0xD0,I2C_DIRECTION_TX);
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));

  //send ds1307's register address to read
  I2C_SendData(regadd);
  while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET);

  //restart i2c
  I2C_GenerateSTART( ENABLE);
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT));

  //send ds1307 address for read
  I2C_Send7bitAddress(0xD0,I2C_DIRECTION_RX);
 
  /* Wait on ADDR flag to be set (ADDR is still not cleared at this level */
  while(I2C_GetFlagStatus( I2C_FLAG_ADDRESSSENTMATCHED) == RESET);
 
  //clear ACK
  I2C_AcknowledgeConfig(I2C_ACK_NONE);
  //Clear ADDR flag
  /* Clear ADDR register by reading SR1 then SR3 register (SR1 has already been read) */
  I2C->SR1;        I2C->SR3;
  //set stop
  I2C_GenerateSTOP(ENABLE);
 
  //Poll RXNE
  while (I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET);
 
  //read byte
  data=I2C_ReceiveData();
// while(I2C_GetFlagStatus( I2C_FLAG_STOPDETECTION ) == SET);
  /* Wait to make sure that STOP control bit has been cleared */
    while(I2C->CR2 & I2C_CR2_STOP);
    /* Re-Enable Acknowledgement to be ready for another reception */
    I2C_AcknowledgeConfig( I2C_ACK_CURR);
  return (data);
}
unsigned char BCD2BIN(unsigned char data)
{
  unsigned char high,low;
  high=(data>>4)&0x0F;
  low=data&0x0F;
  return ((high*10)+low);
}
unsigned char BIN2BCD(unsigned char data)
{
  unsigned char high,low;
  high=data/10;    high =(high<<4)&0xF0;
  low=data%10;    low&=0x0F;
  return ((high)|low);
}
