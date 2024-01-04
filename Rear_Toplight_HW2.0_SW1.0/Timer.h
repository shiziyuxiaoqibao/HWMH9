#ifndef TIMER_H_
#define TIMER_H_

#include "include.h"

#define Timer0 1
#define Timer1 1
#define Timer4 0
#define CPPx_value 0


void Timer0_Init(void);
void Timer1_Init(void); //PWN CPP1 CPP2
void Timer4_Init(void);

void set_PWM1L(uint8_t duty);
void set_PWM2L(uint8_t duty);
extern void timer_init(void);
extern void P0_INT_init(void);
extern uint8_t get_pwmduty(void);
extern void pwm_deal(void);
extern void Clock_ClearSysLEDTimeStatus(void);
extern uint32_t Clock_GetSysLEDTimeStatus(void);
#endif /* TIMER_H_ */
