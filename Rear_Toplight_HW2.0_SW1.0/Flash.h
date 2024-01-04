#ifndef FLASH_H_
#define FLASH_H_

#include "include.h"
//====================////////////////////FLASH�������/////////////////==============//////////
				/*��������˵��������ʵ��λ��*/
#define			FLASH_BUFFER_MAX	16		// ���ݵĴ�С�뵥�β�������أ�����int�ͣ�16,32�����ǲ���д�����򲻹���һЩ���ݡ�
#define			BUFFER_MAX	5

extern unsigned int 	FLASH_BUFFER[];

unsigned int 	FLASH_READ_ONE	(unsigned int address);	//��һ����
void 			FLASH_READ_FUN	(unsigned int address,unsigned char length);//��������ݵ����ݻ����������������Ϊ1��ҳ��32�����ݣ�ͬʱ���鲻��ҳ��������д������Ӧ
void 			FLASH_WRITE_ONE	(unsigned int address,unsigned int value);  // ���̷�װ
void 			FLASH_WRITE_FUN	(unsigned int address,unsigned char length); //������������д����Ӧλ�ã��ӵ�һ����ʼ
extern void FLASH_Init(void);
extern void FLASH_Deal(void);
extern void Flash_data_set(uint8_t ch,uint8_t sw,uint8_t status);
extern void set_savefalg(uint8_t value);

#endif /* FLASH_H_ */
