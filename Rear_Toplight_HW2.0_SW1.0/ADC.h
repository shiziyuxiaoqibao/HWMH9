#ifndef ADC_H_
#define ADC_H_

#include "init_mcu.h"

/* ============================================  Define  ============================================ */
#define CSystem_BattRes_Value               100u      	//��Դ��ѹ�ɼ�������Դ�˵�����ֵ����λ��K����
#define CSystem_GndRes_Value                20u        	//��Դ��ѹ�ɼ������ض˵�����ֵ����λ��K����

void ADC_Init(void);
static uint32_t Adc_fun(void);
uint32_t Adc_read(void);
uint8_t BAT_StateGet(void);
#endif /* ADC_H_ */
