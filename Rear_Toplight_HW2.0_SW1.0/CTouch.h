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

extern void _Parameter_Init_(void); /*�������ڲ�����*/

/*------------------------------------------------------------------------------
����		: �������ݴ���
����		: ��
���		: ���ش������
		  0x00  -- �޴���
		  0x01  -- ��ͨ���쳣����
		  0x02  -- �źų��������ֵ����
		  0x04  -- ����ָ����ʱ��ͻȻ��ͨ���ź��쳣�仯����
		  0x08  -- ���°�����������������ð�����
		  0x10  -- ͬʱ����ͨ�����������쳣
		  0x20  -- �ο�ͨ���쳣����
��ע		:
============================================================================*/
extern unsigned char _CTouch_Scan_Process_(void);

/******************************************************************************
* �� �� ��: Touch_Key_Init()
* ��������: ��������ɨ���ʼ��
* ��ڲ���: ��
* ��    ��: ��
******************************************************************************/
extern void _CTouch_Key_Init_(void);

/*------------------------------------------------------------------------------
����	   : ��ȡͨ��Baseline
����        : ��Ӧͨ�� ���-- ch
���        : ��Ӧͨ���Ļ�׼������
         ���ch����ͨ����������0xFFFF
��ע        :
============================================================================*/
extern unsigned int _CTouch_Get_Baseline_(unsigned char ch);

/*------------------------------------------------------------------------------
����	   : ��ȡͨ��Rawdata
����        : ��Ӧͨ�� ���-- ch
���        : ��Ӧͨ����ԭʼ����
	���ch����ͨ����������0xFFFF
��ע        :
============================================================================*/
extern unsigned int _CTouch_Get_RawData_(unsigned char ch);

/*------------------------------------------------------------------------------
����	   : ��ȡ������汾��
����        : ��
���        : �汾��
         0x0ABC
         A -- ���������汾
         B -- �ϴ����
         C -- С����
��ע        :
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
