#include "Click_AnalogKey_types.h"


void analogkey_adcInit()
{
    //ADC1_Init();	
}

void analogkey_adcSetInputChannel()
{
    //ADC_Set_Input_Channel(_ADC_CHANNEL_4);
}

uint32_t analogkey_adcRead()
{
	uint32_t adcData;
	
    adcData = ADC_Read(0);
	return adcData;
}
