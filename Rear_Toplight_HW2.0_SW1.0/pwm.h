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
    PWM_20,  //ÎÞ ----³õÊ¼»¯Öµ 5
    PWM_40,  //Ö±½ÓÁÁ6
    PWM_60,  //½¥Ãð7
    PWM_80,  //½¥ÁÁ8
    PWM_100,  //È«µÆÃð+ÃÅ¿ØÊäÈë¿ª9
    PWM_20_2_40,  //ÎÞ->Ö±½ÓÁÁ10
    PWM_20_2_80,  //ÎÞ->½¥ÁÁ11
    PWM_20_2_100,  //12
    PWM_40_2_100,  //13
    PWM_40_2_60,  //ÁÁ->½¥Ãð14
    PWM_40_2_20,  //ÁÁ->Ãð15
    PWM_60_2_80,  //½¥Ãð->½¥ÁÁ16
    PWM_60_2_40,  //½¥Ãð->Ö±½ÓÁÁ
    PWM_60_2_20,  //½¥Ãð->ÎÞ
    PWM_80_2_60,  //½¥ÁÁ->½¥Ãð
    PWM_80_2_40,  //½¥ÁÁ->Ö±½ÓÁÁ
    PWM_80_2_20,  //½¥ÁÁ->ÎÞ
    PWM_100_2_20,  //
    PWM_100_2_40,  //½¥ÁÁ->ÎÞ
} Door_Status_t;

extern void DoorState_Init(void);
extern void DoorState_Deal(void);
extern Door_Status_t Door_StatusGet(void);

#endif /* PWM_H_ */
