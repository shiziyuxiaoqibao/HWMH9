/*
 * key.h
 *
 *  Created on: 2022-7-2
 *      Author: SUZENVON
 */

#ifndef KEY_H_
#define KEY_H_

#include "include.h"

typedef enum
{
	RightReadLightSW = 0x00u,
	LeftReadLightSW,
	FullLightSW,
	DoorSW
} Key_Name_t;

typedef enum
{
    UnPressed = 0x00u,
	UnPressed2Pressed,
	Pressed,
	Pressed2UnPressed
} Key_State_t;

typedef enum
{
	Key_Off = 0x00u,
    Key_On
} Key_Status_t;


extern void key_init(void);
extern void key_read(void);
extern void key_state_set(uint8_t ch,Key_Status_t status);
//extern Key_State_t key_state_get(void);
extern void key_deal(void);
#endif /* KEY_H_ */
