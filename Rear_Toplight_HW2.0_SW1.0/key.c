/*
 * key.c
 *
 *  Created on: 2022-7-2
 *      Author: YPHS Smith
 */

#include "key.h"

/*
 * 定义
 */
//LED1
Key_State_t key_state;
Key_Status_t key_status = 0;
//LED2
Key_State_t key_state2;
Key_Status_t key_status2 = 0;

volatile unsigned int key_value,Key_Code = 0;
volatile unsigned char Key_Error_Code = 0;

/*
 * 按键初始化
 */
void key_init(void)
{
	key_state = UnPressed;
	key_state2 = UnPressed;
}

/*
 * 获取按键状态
 */
void key_read(void)
{
	Key_Error_Code = _CTouch_Scan_Process_();  //错误代码
	//LED1 通道7 P1.5
	key_value = Channel_Press_str;
	Key_Code = key_value & 0x01;  //获取按键状态

	switch(key_state)  //状态标记
	{
		case UnPressed:
			if(Key_Code == 1)
				key_state = UnPressed2Pressed;
			break;
		case UnPressed2Pressed:
			key_state = Pressed;
			break;
		case Pressed:
			if(Key_Code == 0)
				key_state = Pressed2UnPressed;
			break;
		case Pressed2UnPressed:
			key_state = UnPressed;
			break;
		default:
			break;
	}

	//LED2 通道6 P1.6
	Key_Code = key_value >> 1 & 0x01;  //获取按键状态

	switch(key_state2)  //状态标记
	{
		case UnPressed:
			if(Key_Code == 1)
				key_state2 = UnPressed2Pressed;
			break;
		case UnPressed2Pressed:
			key_state2 = Pressed;
			break;
		case Pressed:
			if(Key_Code == 0)
				key_state2 = Pressed2UnPressed;
			break;
		case Pressed2UnPressed:
			key_state2 = UnPressed;
			break;
		default:
			break;
	}
}

/*
 * 改变按键状态
 */
void key_state_set(uint8_t ch,Key_Status_t status)
{
	if(ch == 1)
		key_status = status;
	if(ch == 2)
		key_status2 = status;
}

/*
 * 获取按键状态
 */
void key_deal(void)
{
	key_read();

	if((Door_StatusGet() != PWM_40) && (Door_StatusGet() >= PWM_20))
	{
		//LED1 KEY1
		if (key_state == UnPressed2Pressed)
		{
			if(key_status == Key_Off)
			{
				key_status = Key_On;
				set_led(1,LeftReadLightSW,Ind_On);
				Flash_data_set(1,LeftReadLightSW,Ind_On);
			}
			else
			{
				key_status = Key_Off;
				set_led(1,LeftReadLightSW,Ind_Off);
				Flash_data_set(1,LeftReadLightSW,Ind_Off);
			}
		}

		//LED2 KEY2
		if (key_state2 == UnPressed2Pressed)
		{
			if(key_status2 == Key_Off)
			{
				key_status2 = Key_On;
				set_led(2,RightReadLightSW,Ind_On);
				Flash_data_set(2,RightReadLightSW,Ind_On);
			}
			else
			{
				key_status2 = Key_Off;
				set_led(2,RightReadLightSW,Ind_Off);
				Flash_data_set(2,RightReadLightSW,Ind_Off);
			}
		}
	}
}
