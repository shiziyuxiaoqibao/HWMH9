/****************************************************************************************
 * 文件名: init_mcu.h
 * 日 期:   2016-6-28
 * 作 者:   上海芯旺微电子技术有限公司
 * 说明：       初始化芯片寄存器头文件
 ****************************************************************************************/

#ifndef INIT_MCU_H_
#define INIT_MCU_H_

#include "KF8A100ENG.h"
//#include "include.h"

typedef signed char            int8_t;
typedef unsigned char         uint8_t;
typedef short                 int16_t;
typedef unsigned short       uint16_t;
typedef int                   int32_t;
typedef unsigned int         uint32_t;

#define I2C_SLAVE_ENABLE 0
#define I2C_SLAVE_ADDR  0x10
#define USART_DEBUG_EN  0

//函数的声明
extern void Init_MCU();
extern void Init_I2C_S();
extern void Init_Usart();
extern void UART_SendBuf(unsigned char SendTemp);
extern void delay_ms(unsigned int ms_data);
extern void Init_Touch(void);
extern void Init_Touch_GPIO(void);
extern void USART_Send_num(uint32_t num);
extern void delay_us(unsigned int us_data);

#endif /* INIT_MCU_H_ */
