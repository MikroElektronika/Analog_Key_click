#include "Click_AnalogKey_types.h"


void analogkey_adcInit()
{
    ADC1_Init_Advanced(_ADC_12bit, _ADC_INTERNAL_VREFL | _ADC_INTERNAL_VREFH);	
}

void analogkey_adcSetInputChannel()
{
    
}

uint32_t analogkey_adcRead()
{
	uint32_t adcData;
	
    adcData = ADC1_Read(8);
	return adcData;
}
