/*************************************************************************************
* ��Ŀ����   Rear_Light V2.0
* ����������ChipON IDE
* ����汾��2021-07-02
* Ӳ���� V2.0
* ʹ��оƬ��KF8A100ENG
* ���ߣ� YPHS Smith
* �޸ļ�¼:
*
* 1)�����´����⣬�������� 20220701
* 2)����ADC��ѹ��⹦�ܡ���������flash���� 20220702
* 3)�ſ������ź� ռ�ձȶ�ȡ ���� ����ȡֵ��ʵ��ռ�ձ� + 5�� 20220705
* 4)���ܻ������� ������ 20220707
*
* note:Ӳ�� ����C17�����2.7nf����
*************************************************************************************/

#include "include.h"

/*
 * define
 */


//ϵͳ�������뺯�� δ�Ķ�
void startup()
{
__asm
	MOVP	#0x1F
	MOVB	#0x00
	CALL	#0xfff
	MOV	0x30, R0
	NOPZ
	NOPZ
	CALL	#0xffe
	MOV	0x37, R0
	NOPZ
	NOPZ
	CALL	#0xffd
	MOV	0x4c, R0
	NOPZ
	NOPZ
	CALL	#0xffc
	MOV	0x4d, R0
	NOPZ
	NOPZ
	CALL	#0xffb
	MOV	0x2a, R0
	NOPZ
	MOVB	#0x01
	CALL	#0xffa
	MOV	0x59, R0
	NOPZ
	CALL	#0xff9
	MOV	0x5a, R0
	NOPZ
	CALL	#0xff8
	MOV	0x65, R0
	NOPZ
	NOPZ
	;CRET
__endasm;
	OSCCTL = 0x70;
}

//;************************************************************************************
//;* �� �� ��:  void main()
//;* ��������: ����������ں���
//;* ��ڲ���: ��
//;* ��    ��:   ��
//;************************************************************************************
void main()
{

	/*****��ʼ��*****/
	Init_MCU();		//ϵͳ��ʼ��  IO�ڳ�ʼ�� ������ʼ��

	_CTouch_Key_Init_();	//����ȥ��ʼ����׼��
	P0_INT_init();  //��ʼ��ʹ��P0.5��ƽ�仯�ж�
	timer_init(); 	//��ʱ����ʼ��
	key_init();		//������ʼ��
	ADC_Init();		//ADC������ʼ��
	DoorState_Init();
	FLASH_Init();	//Flash��ʼ�� ���ݶ�ȡ

	/*****������*****/
	while(1)
	{
		_CWDT();  //�幷

		if(BAT_StateGet())		//ADC���� ������ѹ��Χ�ڷ���1
		{

			//��ѹ���Ϸ�Χ
			DoorState_Deal(); //�ſ�����
			key_deal();		//����״̬����
			led_deal();		//LED��״̬����
			FLASH_Deal();		//FLASH����
			//get_pwmduty();
		}
		else
		{
			//��ѹ����Χ �������� Ϩ�����е�
			set_PWM1L(0);
			set_PWM2L(0);
		}
		//���ڵ���
		//USART_Send_num(7000);
	}
}
