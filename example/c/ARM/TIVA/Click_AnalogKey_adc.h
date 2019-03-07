#include "Click_AnalogKey_types.h"


void analogkey_adcInit()
{
    ADC0_Init();	
}

void analogkey_adcSetInputChannel()
{
    ADC_Set_Input_Channel(_ADC_CHANNEL_9);
}

uint32_t analogkey_adcRead()
{
	uint32_t adcData;
	
    adcData = ADC0_Get_Sample(9);
	return adcData;
}
