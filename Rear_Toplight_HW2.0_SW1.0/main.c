/*************************************************************************************
* 项目名：   Rear_Light V2.0
* 开发环境：ChipON IDE
* 软件版本：2021-07-02
* 硬件： V2.0
* 使用芯片：KF8A100ENG
* 作者： YPHS Smith
* 修改记录:
*
* 1)更换新触摸库，正常触摸 20220701
* 2)更新ADC电压检测功能、按键处理、flash储存 20220702
* 3)门控输入信号 占空比读取 正常 （读取值≈实际占空比 + 5） 20220705
* 4)功能基本正常 待测试 20220707
*
* note:硬件 电容C17需更换2.7nf电容
*************************************************************************************/

#include "include.h"

/*
 * define
 */


//系统启动必须函数 未改动
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
//;* 函 数 名:  void main()
//;* 函数功能: 主函数，入口函数
//;* 入口参数: 无
//;* 返    回:   无
//;************************************************************************************
void main()
{

	/*****初始化*****/
	Init_MCU();		//系统初始化  IO口初始化 触摸初始化

	_CTouch_Key_Init_();	//采样去初始化基准线
	P0_INT_init();  //初始化使能P0.5电平变化中断
	timer_init(); 	//定时器初始化
	key_init();		//按键初始化
	ADC_Init();		//ADC采样初始化
	DoorState_Init();
	FLASH_Init();	//Flash初始化 数据读取

	/*****主程序*****/
	while(1)
	{
		_CWDT();  //清狗

		if(BAT_StateGet())		//ADC采样 工作电压范围内返回1
		{

			//电压符合范围
			DoorState_Deal(); //门控输入
			key_deal();		//按键状态处理
			led_deal();		//LED灯状态处理
			FLASH_Deal();		//FLASH储存
			//get_pwmduty();
		}
		else
		{
			//电压超范围 不做处理 熄灭所有灯
			set_PWM1L(0);
			set_PWM2L(0);
		}
		//串口调试
		//USART_Send_num(7000);
	}
}
