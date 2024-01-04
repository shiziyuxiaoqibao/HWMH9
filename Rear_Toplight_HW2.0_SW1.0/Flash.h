#ifndef FLASH_H_
#define FLASH_H_

#include "include.h"
//====================////////////////////FLASH相关声明/////////////////==============//////////
				/*参数传递说明见函数实现位置*/
#define			FLASH_BUFFER_MAX	16		// 数据的大小与单次操作量相关，这里int型，16,32，除非不用写操作或不关心一些数据。
#define			BUFFER_MAX	5

extern unsigned int 	FLASH_BUFFER[];

unsigned int 	FLASH_READ_ONE	(unsigned int address);	//读一个字
void 			FLASH_READ_FUN	(unsigned int address,unsigned char length);//读多个数据到数据缓存区，建议最多量为1个页即32个数据，同时建议不跨页操作，与写函数对应
void 			FLASH_WRITE_ONE	(unsigned int address,unsigned int value);  // 过程封装
void 			FLASH_WRITE_FUN	(unsigned int address,unsigned char length); //将缓存区数据写到对应位置，从第一个开始
extern void FLASH_Init(void);
extern void FLASH_Deal(void);
extern void Flash_data_set(uint8_t ch,uint8_t sw,uint8_t status);
extern void set_savefalg(uint8_t value);

#endif /* FLASH_H_ */
