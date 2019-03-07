/*
Example for AnalogKey Click

    Date          : dec 2018.
    Author        : Katarina Perendic

Test configuration TIVA :
    
    MCU              : TM4C129XNCZAD
    Dev. Board       : EasyMx PRO v7 for TIVA ARM
    ARM Compiler ver : v6.0.0.0

---

Description :

The application is composed of three sections :

- System Initialization - LOG initialization for displaying data on USB UART
- Application Initialization - Initializes ADC init
- Application Task - (code snippet) - Reads ADC value and detects which button is pressed based on that value.

*/

#include "Click_AnalogKey_types.h"
#include "Click_AnalogKey_config.h"
#include "Click_AnalogKey_adc.h"

void systemInit()
{
    mikrobus_logInit( _LOG_USBUART_A, 9600 );
    mikrobus_logWrite("--- System Init ---", _LOG_LINE);
    Delay_100ms();
}

void applicationInit()
{
// CLICK INIT
    analogkey_gpioDriverInit( (T_ANALOGKEY_P)&_MIKROBUS1_GPIO );
    analogkey_setResolution(_ANALOGKEY_ADC_RESOLUTION_12bit);
// ADC INIT
    analogkey_adcSetInputChannel();
    analogkey_adcInit();
    Delay_100ms();
    
    mikrobus_logWrite("Press the button :D", _LOG_LINE);
}

void applicationTask()
{
    uint16_t ADC_value;
    uint8_t isKey;
    char demoText[ 50 ];
    uint8_t cnt;
    uint16_t sumValue = 0;
    
    for(cnt = 0; cnt < 5; cnt++)
    {
        ADC_value = analogkey_adcRead();
        sumValue += ADC_value;
        Delay_10ms();
    }
    ADC_value = sumValue / 5;
    isKey = analogkey_getKey(ADC_value);
    
    if(isKey != _ANALOGKEY_NO_TOUCH)
    {
        IntToStr(isKey, demoText);
        mikrobus_logWrite("Pressed the button : ", _LOG_TEXT);
        mikrobus_logWrite(demoText, _LOG_LINE);
    }
    Delay_ms( 300 );
}

void main()
{
    systemInit();
    applicationInit();

    while (1)
    {
        applicationTask();
    }
}