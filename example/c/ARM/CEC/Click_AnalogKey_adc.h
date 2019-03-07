#include "Click_AnalogKey_types.h"


void analogkey_adcInit()
{
    ADC1_Init();	
}

void analogkey_adcSetInputChannel()
{
    ADC1_Set_Input_Channel(0x01);
}

uint32_t analogkey_adcRead()
{
	uint32_t adcData;
	
    adcData = ADC1_Read(1);
	return adcData;
}
