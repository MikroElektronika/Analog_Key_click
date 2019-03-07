#include "Click_AnalogKey_types.h"


void analogkey_adcInit()
{
    ADC_Init();	
}

void analogkey_adcSetInputChannel()
{
    ADC_Set_Input_Channel(_ADC_CHANNEL_15);
}

uint32_t analogkey_adcRead()
{
	uint32_t adcData;
	
    adcData = ADC_Read(15);
	return adcData;
}
