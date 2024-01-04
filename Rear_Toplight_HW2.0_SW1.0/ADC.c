#include "ADC.h"

/****************************************************************************************
 * 函数名     ：Adc_fun
 * 函数功能：ADC函数，模数转换
 * 入口参数：无
 * 返回          ：返回ADC采样值
****************************************************************************************/
void ADC_Init(void)
{
	TR11 = 1;		//ADC引脚配置 P1.1
	ANSEH = 0x00;
	ANSEL = 0x02;
	ADCCTL1 = 0x95;		              //ad校准使能，8分频，VDD作为参考电压
	ADCCTL0 = 0x85;		              //右对齐，通道1， AD使能打开     ( 0x 1_00 0101 )
}

/****************************************************************************************
 * 函数名     ：Adc_fun
 * 函数功能：ADC函数，模数转换，若切换通道，则需要延时通道采样稳定时间
 * 入口参数：无
 * 返回          ：返回ADC采样值
****************************************************************************************/
static uint32_t Adc_fun(void)
{
	uint32_t Adc_num = 0 ;			  //ADC转换缓冲变量
    START = 1;					  //启动ADC
	while(START);                 //等待转换结束
	Adc_num = ADCDATA0H;	  	  //将高位加进去
	Adc_num <<=8;
	Adc_num |= ADCDATA0L;		  //将低位加进去
	return Adc_num;			      //返回转换值
}

/****************************************************************************************
 * 函数名     ：Adc_read
 * 函数功能：ADC求均值函数，adc读取函数
 * 入口参数：无
 * 返回          ：返回ADC采样8次均值
****************************************************************************************/
uint32_t Adc_read(void)
{
	uint32_t Adc_sum = 0 ; 		          //adc采样累加变量
	uint8_t i = 0;
	for(i = 0; i < 8; i++)
	{
		Adc_sum += Adc_fun();		  //累加八次采样值
	}
	Adc_sum  += 4;					  // 四舍五入
	Adc_sum >>= 3;		              //右移动3位  除8求均值
	return Adc_sum;
}

uint8_t BAT_StateGet(void)
{
	uint32_t value;

	value = Adc_read();
	//	DEBUG
	//	UART_SendBuf('V');
	//	UART_SendBuf(':');
	//	USART_Send_num(value);

	//value = Adc_read() * 3300 / 0xFFF;   //得出当前电压值
	//value = value * (CSystem_BattRes_Value + CSystem_GndRes_Value) / CSystem_GndRes_Value;   //反推总电压值

	//100K:20K  5:1
	//7V时 约为1.17V 采样值 1452
	//9V时 约为1.50V 采样值 1861
	//16V时 约为2.67V 采样值 3314
	//17V时 约为2.83V 采样值 3512

	if(value >= 1452 && value <= 3512)
	{
		return 1;
	}
	else
	{
		return 0;
	}
	//return 1;
}





