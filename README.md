![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

---

# AnalogKey Click

- **CIC Prefix**  : ANALOGKEY
- **Author**      : Katarina Perendic
- **Verison**     : 1.0.0
- **Date**        : dec 2018.

---

### Software Support

We provide a library for the AnalogKey Click on our [LibStock](https://libstock.mikroe.com/projects/view/2682/analog-key-click) 
page, as well as a demo application (example), developed using MikroElektronika 
[compilers](http://shop.mikroe.com/compilers). The demo can run on all the main 
MikroElektronika [development boards](http://shop.mikroe.com/development-boards).

**Library Description**

The library contains a function which, based on the ADC value, detects which button is pressed.

Key functions :

- ``` uint8_t analogkey_getKey(uint16_t adcValue) ``` - Detects which button is pressed

**Examples Description**

The application is composed of three sections :

- System Initialization - LOG initialization for displaying data on USB UART
- Application Initialization - Initializes ADC init
- Application Task - (code snippet) - Reads ADC value and detects which button is pressed based on that value.


```.c
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
```

The full application code, and ready to use projects can be found on our 
[LibStock](https://libstock.mikroe.com/projects/view/2682/analog-key-click) page.

Other mikroE Libraries used in the example:

- ADC
- UART

**Additional notes and informations**

Depending on the development board you are using, you may need 
[USB UART click](http://shop.mikroe.com/usb-uart-click), 
[USB UART 2 Click](http://shop.mikroe.com/usb-uart-2-click) or 
[RS232 Click](http://shop.mikroe.com/rs232-click) to connect to your PC, for 
development systems with no UART to USB interface available on the board. The 
terminal available in all Mikroelektronika 
[compilers](http://shop.mikroe.com/compilers), or any other terminal application 
of your choice, can be used to read the message.

---
---
