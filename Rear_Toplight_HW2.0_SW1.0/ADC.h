#ifndef ADC_H_
#define ADC_H_

#include "init_mcu.h"

/* ============================================  Define  ============================================ */
#define CSystem_BattRes_Value               100u      	//电源电压采集靠近电源端电阻阻值，单位（KΩ）
#define CSystem_GndRes_Value                20u        	//电源电压采集靠近地端电阻阻值，单位（KΩ）

void ADC_Init(void);
static uint32_t Adc_fun(void);
uint32_t Adc_read(void);
uint8_t BAT_StateGet(void);
#endif /* ADC_H_ */
