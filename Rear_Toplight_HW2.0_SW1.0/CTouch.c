/*
 *  CTouch.c
 *
 *  Changed on: 2022-07-05
 *      Author: chipon demo
 *				change by YPHS SZY
 */

#include "CTouch.h"

const unsigned char CTouch_Channel_Tab[]={6, 7};

/*通道信号阈值设定*/
const unsigned int	CTouch_Threshold_Tab[]={60,60};
/*通道信号第二按键阈值增加设定*/
const unsigned int	CTouch_Second_Key_Threshold_Tab[]={0,0};
/*通道信号迟滞设定*/
const unsigned char	CTouch_Single_Hysteresis_Tab[]={6,6};
/*通道噪声阈值设定*/
const unsigned char	CTouch_Noise_threshold_Tab[]={30,30};
/*通道负噪声阈值设定*/
const unsigned char	CTouch_Negative_Noise_threshold_Tab[]={60,60};
/*通道最大阈值设定*/
const unsigned int CTouch_Max_Threshold_Tab[]={200,200};
/*通道数据异常阈值设定 */
const unsigned int	CTouch_Disturb_Noise_threshold_Tab[]={60,60};
/*通道稳定噪声阈值设置*/
const unsigned unsigned char CTouch_Steady_Noise_threshold_Tab[]={20,20};

const unsigned char CTOUCH_VDAC_Tab[] ={0xF0,0xF0};

const unsigned char	DEF_NUM_CHANNELS = sizeof(CTouch_Channel_Tab);


unsigned char Channel_Num_lib;
unsigned char ON_debounce_times_lib;
unsigned char Data_Stream_Enable_lib;
unsigned int  Press_On_Max_Time_lib;
unsigned char Data_Change_Disturb_Max_Channel;
unsigned char Protect_Mode_Release_Time_lib;
unsigned int  Baseline_Update_Cnt_lib;
unsigned char Max_Key_Cnt_Lib;
unsigned char Ref_Channel_Enable_lib;

void _Parameter_Init_(void)
{
	Channel_Num_lib = DEF_NUM_CHANNELS;
	ON_debounce_times_lib = DEF_TOUCH_ON_DEBOUNCE;
	Data_Stream_Enable_lib = DEF_DATA_STREAM_ENABLE;
	Press_On_Max_Time_lib = DEF_PRESS_ON_MAX_TIME;
	Data_Change_Disturb_Max_Channel = DEF_DATA_CHANGE_DISTURB_MAX_CHANNEL;
	Protect_Mode_Release_Time_lib = DEF_PROTECT_MODE_RELEASE_CYCLE;
	Baseline_Update_Cnt_lib = DEF_BASELINE_UPDATE_CNT;
	Max_Key_Cnt_Lib = DEF_MAX_KEY_CNT;
	Ref_Channel_Enable_lib = DEF_REFERENCE_CHANNEL_ENABLE;
}
