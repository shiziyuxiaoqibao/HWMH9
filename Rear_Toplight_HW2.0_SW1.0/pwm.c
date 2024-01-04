/*
 * pwm.c
 *
 *  Created on: 2022-7-5
 *      Author: SUZENVON
 */

#include "pwm.h"

static Door_Status_t doorStatus;

void DoorState_Init(void)
{
	doorStatus = PWM_20;
}

//门控信号输入处理
void DoorState_Deal(void)
{
	uint8_t i, duty_get, flag,duty;

	flag = 0;
	//6次获取值
	duty_get = get_pwmduty();
	for (i = 0; i < 5; i++)
	{
		if(get_pwmduty() == duty_get)
			flag++;
	}

	if(flag >= 5) //6次获取同样值
	{
		if(duty_get >= 95)
			duty = 100;
		else
			if(duty_get >= 80)
				duty = 80;
			else
				if(duty_get >= 60)
					duty = 60;
				else
					if(duty_get >= 40)
						duty = 40;
					else
						duty = 20;

		switch(doorStatus)
		{
			case PWM_20:
				if(duty == 40)
				{
					doorStatus = PWM_20_2_40;
				}
				else if(duty == 80)
				{
					doorStatus = PWM_20_2_80;
				}
				else if(duty == 100)
				{
					doorStatus = PWM_20_2_100;
				}
				break;
			case PWM_40:
				if(duty == 20)
				{
					doorStatus = PWM_40_2_20;
				}
				else if(duty == 60)
				{
					doorStatus = PWM_40_2_60;
				}
				else if(duty == 100)
				{
					doorStatus = PWM_40_2_100;
				}
				break;
			case PWM_60:
				if(duty == 20)
				{
					doorStatus = PWM_60_2_20;
				}
				else if(duty == 40)
				{
					doorStatus = PWM_60_2_40;
				}
				else if(duty == 80)
				{
					doorStatus = PWM_60_2_80;
				}
				break;
			case PWM_80:
				if(duty == 20)
				{
					doorStatus = PWM_80_2_20;
				}
				else if(duty == 60)
				{
					doorStatus = PWM_80_2_60;
				}
				break;
			case PWM_100:
				if(duty == 20)
				{
					doorStatus = PWM_100_2_20;
				}
				else if(duty == 40)
				{
					doorStatus = PWM_100_2_40;
				}
				break;
			case PWM_20_2_40:
				doorStatus = PWM_40;
				break;
			case PWM_20_2_80:
				doorStatus = PWM_80;
				break;
			case PWM_20_2_100:
				doorStatus = PWM_100;
				break;
			case PWM_40_2_20:
				doorStatus = PWM_20;
				break;
			case PWM_40_2_60:
				doorStatus = PWM_60;
				break;
			case PWM_40_2_100:
				doorStatus = PWM_100;
				break;
			case PWM_60_2_20:
				doorStatus = PWM_20;
				break;
			case PWM_60_2_40:
				doorStatus = PWM_40;
				break;
			case PWM_60_2_80:
				doorStatus = PWM_80;
				break;
			case PWM_80_2_20:
				doorStatus = PWM_20;
				break;
			case PWM_80_2_60:
				doorStatus = PWM_60;
				break;
			case PWM_100_2_20:
				doorStatus = PWM_20;
				break;
			case PWM_100_2_40:
				doorStatus = PWM_40;
				break;
			default:
				break;
		}
	}
}

Door_Status_t Door_StatusGet(void)
{
    return doorStatus;
}
