#include "Click_AnalogKey_types.h"


void analogkey_adcInit()
{
    ADC_Init();	
}

void analogkey_adcSetInputChannel()
{
   
}

uint32_t analogkey_adcRead()
{
	uint32_t adcData;
	
    adcData = ADC_Read(7);
	return adcData;
}
