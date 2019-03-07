#include "Click_AnalogKey_types.h"


void analogkey_adcInit()
{
    ADC0_Init();	
}

void analogkey_adcSetInputChannel()
{
    ADC0_Set_Input_Channel(_ADC_CHANNEL_12);
}

uint32_t analogkey_adcRead()
{
	uint32_t adcData;
	
    adcData = ADC0_Read(12);
	return adcData;
}
