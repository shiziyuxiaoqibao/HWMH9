/*
 *  CTouch.h
 *
 *  Changed on: 2022-07-05
 *      Author: chipon demo
 *				change by YPHS SZY
 */

#ifndef CTOUCH_H_
#define CTOUCH_H_

#include "init_mcu.h"


extern const unsigned char CTouch_Channel_Tab[];
extern const unsigned int	CTouch_Threshold_Tab[];
extern const unsigned int	CTouch_Second_Key_Threshold_Tab[];
extern const unsigned char	CTouch_Single_Hysteresis_Tab[];
extern const unsigned char	CTouch_Noise_threshold_Tab[];
extern const unsigned char	CTouch_Negative_Noise_threshold_Tab[];
extern const unsigned int CTouch_Max_Threshold_Tab[];
extern const unsigned char CTOUCH_VDAC_Tab[];
extern const unsigned int	CTouch_Disturb_Noise_threshold_Tab[];
extern const unsigned unsigned char CTouch_Steady_Noise_threshold_Tab[];

extern volatile unsigned int   Channel_Press_str;

extern unsigned char Channel_Num_lib;
extern unsigned char ON_debounce_times_lib;
extern unsigned char Data_Stream_Enable_lib;
extern unsigned int Press_On_Max_Time_lib;
extern unsigned char Data_Change_Disturb_Max_Channel;
extern unsigned char Protect_Mode_Release_Time_lib;
extern unsigned int  Baseline_Update_Cnt_lib;
extern unsigned char Max_Key_Cnt_Lib;
extern volatile unsigned char  Touch_Int_Flg;
extern unsigned char Ref_Channel_Enable_lib;

extern void _Parameter_Init_(void); /*触摸库内部调用*/

/*------------------------------------------------------------------------------
描述		: 触摸数据处理
输入		: 无
输出		: 返回错误代码
		  0x00  -- 无错误
		  0x01  -- 多通道异常保护
		  0x02  -- 信号超过最大阈值保护
		  0x04  -- 有手指按下时，突然有通道信号异常变化保护
		  0x08  -- 按下按键数量大于最大设置按键数
		  0x10  -- 同时两个通道数据上升异常
		  0x20  -- 参考通道异常保护
备注		:
============================================================================*/
extern unsigned char _CTouch_Scan_Process_(void);

/******************************************************************************
* 函 数 名: Touch_Key_Init()
* 函数功能: 触摸按键扫描初始化
* 入口参数: 无
* 返    回: 无
******************************************************************************/
extern void _CTouch_Key_Init_(void);

/*------------------------------------------------------------------------------
描述	   : 获取通道Baseline
输入        : 对应通道 编号-- ch
输出        : 对应通道的基准线数据
         如果ch大于通道数，返回0xFFFF
备注        :
============================================================================*/
extern unsigned int _CTouch_Get_Baseline_(unsigned char ch);

/*------------------------------------------------------------------------------
描述	   : 获取通道Rawdata
输入        : 对应通道 编号-- ch
输出        : 对应通道的原始数据
	如果ch大于通道数，返回0xFFFF
备注        :
============================================================================*/
extern unsigned int _CTouch_Get_RawData_(unsigned char ch);

/*------------------------------------------------------------------------------
描述	   : 获取触摸库版本号
输入        : 无
输出        : 版本号
         0x0ABC
         A -- 触摸按键版本
         B -- 较大更新
         C -- 小更新
备注        :
============================================================================*/
extern unsigned int _CTouch_Get_Lib_Version_(void);

#define DEF_TOUCH_ON_DEBOUNCE   10u
#define DEF_DATA_STREAM_ENABLE  0u
#define DEF_PRESS_ON_MAX_TIME   1000
#define DEF_DATA_CHANGE_DISTURB_MAX_CHANNEL 3u
#define DEF_PROTECT_MODE_RELEASE_CYCLE  70
#define DEF_BASELINE_UPDATE_CNT      500
#define DEF_MAX_KEY_CNT              2
#define DEF_REFERENCE_CHANNEL_ENABLE 0u

#endif /* CTOUCH_H_ */
