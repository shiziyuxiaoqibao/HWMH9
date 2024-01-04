/*
 * led.h
 *
 *  Created on: 2022-7-2
 *      Author: SUZENVON
 */

#ifndef LED_H_
#define LED_H_

#include "include.h"

/*
 * ����
 */

typedef struct
{
	uint8_t key;         //�ĸ�����������ָʾ��
	uint8_t status;    //ָʾ��״̬
} led_Info_t;

typedef enum
{
	Ind_Off = 0x00u,
    Ind_On,
    Ind_up,
    Ind_down
} led_Status_t;

/*
 * ����
 */
extern void set_led(uint8_t ch,uint8_t sw,uint8_t led_status);
extern void led_deal(void);
void processLED(uint8_t ch, uint8_t sw, uint8_t led_status, uint8_t door_status, uint8_t pwm_threshold);
#endif /* LED_H_ */
