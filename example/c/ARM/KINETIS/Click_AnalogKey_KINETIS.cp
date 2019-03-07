#line 1 "D:/Clicks_git/A/analog-key-click/SW/example/c/ARM/KINETIS/Click_AnalogKey_KINETIS.c"
#line 1 "d:/clicks_git/a/analog-key-click/sw/example/c/arm/kinetis/click_analogkey_types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "d:/clicks_git/a/analog-key-click/sw/example/c/arm/kinetis/click_analogkey_config.h"
#line 1 "d:/clicks_git/a/analog-key-click/sw/example/c/arm/kinetis/click_analogkey_types.h"
#line 1 "d:/clicks_git/a/analog-key-click/sw/example/c/arm/kinetis/click_analogkey_adc.h"
#line 1 "d:/clicks_git/a/analog-key-click/sw/example/c/arm/kinetis/click_analogkey_types.h"
#line 4 "d:/clicks_git/a/analog-key-click/sw/example/c/arm/kinetis/click_analogkey_adc.h"
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
#line 1 "d:/clicks_git/a/analog-key-click/sw/library/__analogkey_driver.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 57 "d:/clicks_git/a/analog-key-click/sw/library/__analogkey_driver.h"
extern const uint8_t _ANALOGKEY_TOUCH_KEY_1;
extern const uint8_t _ANALOGKEY_TOUCH_KEY_2;
extern const uint8_t _ANALOGKEY_TOUCH_KEY_3;
extern const uint8_t _ANALOGKEY_TOUCH_KEY_4;
extern const uint8_t _ANALOGKEY_TOUCH_KEY_5;
extern const uint8_t _ANALOGKEY_TOUCH_KEY_6;
extern const uint8_t _ANALOGKEY_NO_TOUCH ;

extern const uint8_t _ANALOGKEY_ADC_RESOLUTION_10bit ;
extern const uint8_t _ANALOGKEY_ADC_RESOLUTION_12bit ;
#line 91 "d:/clicks_git/a/analog-key-click/sw/library/__analogkey_driver.h"
void analogkey_gpioDriverInit( const uint8_t*  gpioObj);
#line 101 "d:/clicks_git/a/analog-key-click/sw/library/__analogkey_driver.h"
uint8_t analogkey_getKey(uint16_t adcValue);
#line 108 "d:/clicks_git/a/analog-key-click/sw/library/__analogkey_driver.h"
void analogkey_setResolution(uint8_t resolution);
#line 31 "D:/Clicks_git/A/analog-key-click/SW/example/c/ARM/KINETIS/Click_AnalogKey_KINETIS.c"
void systemInit()
{
 mikrobus_logInit( _LOG_USBUART, 9600 );
 mikrobus_logWrite("--- System Init ---", _LOG_LINE);
 Delay_100ms();
}

void applicationInit()
{

 analogkey_gpioDriverInit( ( const uint8_t* )&_MIKROBUS1_GPIO );


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
