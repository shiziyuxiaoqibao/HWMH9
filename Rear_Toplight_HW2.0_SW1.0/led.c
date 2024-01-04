/*
 * led.c
 *
 *  Created on: 2022-7-2
 *      Author: SUZENVON
 */



#include "led.h"

/*
 * define
 */
led_Info_t led,led2;
static uint8_t pointer = 0u;
/*
 * LED���Ƴ�ʼ��
 */
void set_led(uint8_t ch,uint8_t sw,uint8_t led_status)
{
	if(ch == 1) //LED1
	{
		led.key = sw;
		led.status = led_status;
	}

	if(ch == 2)
	{
		led2.key = sw;
		led2.status = led_status;
	}
}


/*
 * �ƴ���
 */

void led_deal(void)
{
    switch(Door_StatusGet())
    {
    /*
    	case PWM_20:  //�� ״̬

    		break;
    	case PWM_40:  //ֱ����

    		break;
    	case PWM_60:  //����

    		break;
    	case PWM_80:  //����

    		break;
    	case PWM_100:  //

    		break;
    		*/
    	case PWM_20_2_100:  //
    		if(led.status == Ind_Off)
    		{
    			set_led(1,DoorSW,Ind_On);
    		}

    		if(led2.status == Ind_Off)
    		{
    			set_led(2,DoorSW,Ind_On);
    		}

    		break;
    	case PWM_20_2_80: //���𵽽���
			if(led.status == Ind_Off)
			{
				set_led(1,DoorSW,Ind_up);
				pointer = 0;   //ռ�ձȴ�0 -> 100
				Clock_ClearSysLEDTimeStatus();  //�����ʱ�� ������
			}

			if(led2.status == Ind_Off)
			{
				set_led(2,DoorSW,Ind_up);
				pointer = 0;   //ռ�ձȴ�0 -> 100
				Clock_ClearSysLEDTimeStatus();  //�����ʱ�� ������
			}

			break;
    	case PWM_20_2_40: //����ֱ���� OK
			if(led.status == Ind_Off)
			{
				set_led(1,DoorSW,Ind_On);
				//saveFlag = 1;
			}

			if(led2.status == Ind_Off)
			{
				set_led(2,DoorSW,Ind_On);
				//saveFlag = 1;
			}
			break;

    	case PWM_40_2_20: //ֱ��������  OK
			if(led.status == Ind_On)
			{
				if(led.key != LeftReadLightSW)
				{
					set_led(1,DoorSW,Ind_Off);
					//saveFlag = 1;
				}

			}

			if(led2.status == Ind_On)
			{
				if(led2.key != RightReadLightSW)
				{
					//Ind_InfoSet(RightReadLight,DoorSW,Ind_Off);
					set_led(2,DoorSW,Ind_Off);
					//saveFlag = 1;
				}
			}

			break;

    	case PWM_40_2_60: //ֱ����������
			//��ƽ���
			if(led.status == Ind_On)
			{
				if(led.key != LeftReadLightSW)
				{
					set_led(1,DoorSW,Ind_down);
					//saveFlag = 1;
					pointer = 80;
					Clock_ClearSysLEDTimeStatus();
				}
			}

			//�ҵƽ���
			if(led2.status == Ind_On)
			{
				if(led2.key != RightReadLightSW)
				{
					set_led(2,DoorSW,Ind_down);
					//saveFlag = 1;
					pointer = 80;
					Clock_ClearSysLEDTimeStatus();
				}
			}

    		break;

    	case PWM_60_2_20: //������

    		break;

    	case PWM_60_2_40: //����ֱ����
			if(led.status == Ind_Off)
			{
				set_led(1,DoorSW,Ind_On);
			}

			if(led2.status == Ind_Off)
			{
				set_led(2,DoorSW,Ind_On);
			}
    		break;
    	case PWM_60_2_80: //���𵽽���
			if(led.status == Ind_Off)
			{
				set_led(1,DoorSW,Ind_up);
				pointer = 0;
				Clock_ClearSysLEDTimeStatus();
			}

			if(led2.status == Ind_Off)
			{
				set_led(2,DoorSW,Ind_up);
				pointer = 0;
				Clock_ClearSysLEDTimeStatus();
			}

    		break;
    	case PWM_80_2_20: //�������� OK
			if(led.status == Ind_On)
			{
				if(led.key != LeftReadLightSW)//if(indInfo[LeftReadLight].key == DoorSW)
				{
					set_led(1,DoorSW,Ind_Off);
				}
			}

			if(led2.status == Ind_On)
			{
				if(led2.key != RightReadLightSW)
				{
					set_led(2,DoorSW,Ind_Off);
				}
			}

			break;
    	case PWM_80_2_40: //������ֱ���� OK

			if(led.status == Ind_Off)
			{
				//Ind_InfoSet(LeftReadLight,DoorSW,Ind_On);
				set_led(1,DoorSW,Ind_On);
				//saveFlag = 1;//
			}

			if(led2.status == Ind_Off)
			{
				//Ind_InfoSet(RightReadLight,DoorSW,Ind_On);
				set_led(2,DoorSW,Ind_On);
				//saveFlag = 1;//
			}

			break;

    	case PWM_80_2_60: //����������
			if(led.status == Ind_On || led.status == Ind_up)
			{
				if(led.key != LeftReadLightSW)//if(indInfo[LeftReadLight].key == DoorSW)
				{
					set_led(1,DoorSW,Ind_down);
					//Ind_InfoSet(LeftReadLight,DoorSW,Ind_down);
					//saveFlag = 1;
					pointer = 80;
					Clock_ClearSysLEDTimeStatus();
				}
			}

			if(led2.status == Ind_On || led2.status == Ind_up)
			{
				if(led2.key != RightReadLightSW)//if(indInfo[LeftReadLight].key == DoorSW)
				{
					set_led(2,DoorSW,Ind_down);
					//Ind_InfoSet(LeftReadLight,DoorSW,Ind_down);
					//saveFlag = 1;
					pointer = 80;
					Clock_ClearSysLEDTimeStatus();
				}
			}

    		break;
    	case PWM_100_2_20: //�������� OK
			if(led.status == Ind_On)
			{
				if(led.key != LeftReadLightSW)//if(indInfo[LeftReadLight].key == DoorSW)
				{
					set_led(1,DoorSW,Ind_Off);
					//Ind_InfoSet(LeftReadLight,DoorSW,Ind_Off);
					//saveFlag = 1;
				}
			}

			if(led2.status == Ind_On)
			{
				if(led2.key != RightReadLightSW)
				{
					set_led(2,DoorSW,Ind_Off);
					//Ind_InfoSet(RightReadLight,DoorSW,Ind_Off);
					//saveFlag = 1;//
				}
			}

			break;
    	default:
    		break;
    }

    //���Ķ���
    switch(led.status)
    {
    	case Ind_up:
    		if(Clock_GetSysLEDTimeStatus()>3)   //0.00204s * 343 �� 0.7S
    		{
    			pointer++;
    			Clock_ClearSysLEDTimeStatus();
    		}

    		if(pointer < 80 || pointer == 80)
    		{
    			set_PWM1L(pointer);
    		}
    		else
    		{
    			pointer = 80;
    			set_led(1,DoorSW,Ind_On);
    		}
    		break;
    	case Ind_down:

    		if(Clock_GetSysLEDTimeStatus()>6)   //0.00204s * 686 �� 1.4S
    		{
    			pointer--;
    			Clock_ClearSysLEDTimeStatus();
    		}

    		if(pointer > 0)
    		{
    			set_PWM1L(pointer);
    		}
    		else
    		{
    			pointer = 0;
    			set_led(1,DoorSW,Ind_Off);
    		}
    		break;
    	case Ind_On:
    		set_PWM1L(80);
    		break;
    	case Ind_Off:
    		set_PWM1L(0);
    		break;
    	default:
    		break;
    }
	//    UART_SendBuf('A');
	//    UART_SendBuf(':');
	//    USART_Send_num(pointer);

    //���Ķ���
    //������ 20220705
    switch(led2.status)
    {

    	case Ind_up:

    		if(led.status != Ind_up)  //���ͬʱ���� ������
    		{
				if(Clock_GetSysLEDTimeStatus()>3)
				{
					pointer++;
					Clock_ClearSysLEDTimeStatus();
				}
    		}

    		if(pointer < 80)
    		{
    			set_PWM2L(pointer);
    		}
    		else
    		{
    			pointer = 80;
    			//Ind_InfoSet(RightReadLight,DoorSW,Ind_On);
    			set_led(2,DoorSW,Ind_On);
    		}
    		break;

    	case Ind_down:
    		if(led.status != Ind_down)  //���ͬʱ���� ������
    		{
				if(Clock_GetSysLEDTimeStatus()>6)
				{
					pointer--;
					Clock_ClearSysLEDTimeStatus();
				}
    		}

    		if(pointer > 0)
    		{
    			set_PWM2L(pointer);
    		}
    		else
    		{
    			pointer = 0;
    			//Ind_InfoSet(RightReadLight,DoorSW,Ind_Off);
    			set_led(2,DoorSW,Ind_Off);
    		}
    		break;
    	case Ind_On:
    		set_PWM2L(80);
    		break;
    	case Ind_Off:
    		set_PWM2L(0);
    		break;
    	default:
    		break;
    }
	//    UART_SendBuf('B');
	//    UART_SendBuf(':');
	//    USART_Send_num(pointer);
}

//void processLED(uint8_t ch, uint8_t sw, uint8_t led_status, uint8_t door_status, uint8_t pwm_threshold)
//{
//    if (ch == 1)
//    {
//        if (led.status == Ind_Off && door_status == pwm_threshold)
//        {
//            set_led(1, sw, led_status);
//        }
//        else if (led.status == Ind_On && door_status == PWM_40_2_20 && led.key != LeftReadLightSW)
//        {
//            set_led(1, sw, Ind_Off);
//        }
//        else if (led.status == Ind_On && door_status == PWM_60_2_40)
//        {
//            set_led(1, sw, Ind_On);
//        }
//        else if (led.status == Ind_Off && door_status == PWM_80_2_20 && led.key != LeftReadLightSW)
//        {
//            set_led(1, sw, Ind_Off);
//        }
//        else if (led.status == Ind_Off && door_status == PWM_80_2_40)
//        {
//            set_led(1, sw, Ind_On);
//        }
//        else if (led.status == Ind_On && door_status == PWM_80_2_60)
//        {
//            set_led(1, sw, Ind_down);
//            pointer = 80;
//            Clock_ClearSysLEDTimeStatus();
//        }
//        else if (led.status == Ind_On && door_status == PWM_100_2_20 && led.key != LeftReadLightSW)
//        {
//            set_led(1, sw, Ind_Off);
//        }
//    }
//    else if (ch == 2)
//    {
//        if (led2.status == Ind_Off && door_status == pwm_threshold)
//        {
//            set_led(2, sw, led_status);
//        }
//        else if (led2.status == Ind_On && door_status == PWM_40_2_20 && led2.key != LeftReadLightSW)
//        {
//            set_led(2, sw, Ind_Off);
//        }
//        else if (led2.status == Ind_On && door_status == PWM_60_2_40)
//        {
//            set_led(2, sw, Ind_On);
//        }
//        else if (led2.status == Ind_Off && door_status == PWM_80_2_20 && led2.key != LeftReadLightSW)
//        {
//            set_led(2, sw, Ind_Off);
//        }
//        else if (led2.status == Ind_Off && door_status == PWM_80_2_40)
//        {
//            set_led(2, sw, Ind_On);
//        }
//        else if (led2.status == Ind_On && door_status == PWM_80_2_60)
//        {
//            set_led(2, sw, Ind_down);
//            pointer = 80;
//            Clock_ClearSysLEDTimeStatus();
//        }
//        else if (led2.status == Ind_On && door_status == PWM_100_2_20 && led2.key != LeftReadLightSW)
//        {
//            set_led(2, sw, Ind_Off);
//        }
//    	// Similar logic for LED2
//    }
//}
//
//void led_deal(void) {
//    uint8_t door_status = Door_StatusGet();
//
//    switch (door_status) {
//        // ... (existing cases)
//
//        case PWM_20_2_80:
//            processLED(1, DoorSW, Ind_up, door_status, PWM_20_2_80);
//            processLED(2, DoorSW, Ind_up, door_status, PWM_20_2_80);
//            break;
//
//        case PWM_20_2_40:
//            processLED(1, DoorSW, Ind_On, door_status, PWM_20_2_40);
//            processLED(2, DoorSW, Ind_On, door_status, PWM_20_2_40);
//            break;
//
//        case PWM_20_2_100:
//			processLED(1, DoorSW, Ind_On, door_status, PWM_20_2_40);
//			processLED(2, DoorSW, Ind_On, door_status, PWM_20_2_40);
//			break;
//
//        case PWM_20_2_40:
//			processLED(1, DoorSW, Ind_On, door_status, PWM_20_2_40);
//			processLED(2, DoorSW, Ind_On, door_status, PWM_20_2_40);
//			break;
//
//
//        case PWM_20_2_40:
//			processLED(1, DoorSW, Ind_On, door_status, PWM_20_2_40);
//			processLED(2, DoorSW, Ind_On, door_status, PWM_20_2_40);
//			break;
//
//
//        case PWM_20_2_40:
//			processLED(1, DoorSW, Ind_On, door_status, PWM_20_2_40);
//			processLED(2, DoorSW, Ind_On, door_status, PWM_20_2_40);
//			break;
//
//        // ... (existing cases)
//    }
//
//    // Additional logic for LeftReadLight (LED1) and RightReadLight (LED2)
//    // ...
//}


/*
 *
 */
