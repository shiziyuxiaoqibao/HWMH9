/*
 * pwm.h
 *
 *  Created on: 2022-7-5
 *      Author: SUZENVON
 */

#ifndef PWM_H_
#define PWM_H_

#include "include.h"

typedef enum
{
    PWM_NO = 0x00u,
    PWM_NO_2_20,
    PWM_NO_2_40,
    PWM_NO_2_60,
    PWM_NO_2_80,
    PWM_20,  //�� ----��ʼ��ֵ 5
    PWM_40,  //ֱ����6
    PWM_60,  //����7
    PWM_80,  //����8
    PWM_100,  //ȫ����+�ſ����뿪9
    PWM_20_2_40,  //��->ֱ����10
    PWM_20_2_80,  //��->����11
    PWM_20_2_100,  //12
    PWM_40_2_100,  //13
    PWM_40_2_60,  //��->����14
    PWM_40_2_20,  //��->��15
    PWM_60_2_80,  //����->����16
    PWM_60_2_40,  //����->ֱ����
    PWM_60_2_20,  //����->��
    PWM_80_2_60,  //����->����
    PWM_80_2_40,  //����->ֱ����
    PWM_80_2_20,  //����->��
    PWM_100_2_20,  //
    PWM_100_2_40,  //����->��
} Door_Status_t;

extern void DoorState_Init(void);
extern void DoorState_Deal(void);
extern Door_Status_t Door_StatusGet(void);

#endif /* PWM_H_ */
