/*
    __analogkey_driver.c

-----------------------------------------------------------------------------

  This file is part of mikroSDK.

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

#include "__analogkey_driver.h"
#include "__analogkey_hal.c"

/* ------------------------------------------------------------------- MACROS */

const uint8_t _ANALOGKEY_TOUCH_KEY_1 = 0x01;
const uint8_t _ANALOGKEY_TOUCH_KEY_2 = 0x02;
const uint8_t _ANALOGKEY_TOUCH_KEY_3 = 0x03;
const uint8_t _ANALOGKEY_TOUCH_KEY_4 = 0x04;
const uint8_t _ANALOGKEY_TOUCH_KEY_5 = 0x05;
const uint8_t _ANALOGKEY_TOUCH_KEY_6 = 0x06;
const uint8_t _ANALOGKEY_NO_TOUCH    = 0x00;

const uint8_t _ANALOGKEY_ADC_RESOLUTION_10bit = 0x01;
const uint8_t _ANALOGKEY_ADC_RESOLUTION_12bit = 0x02;

/* ---------------------------------------------------------------- VARIABLES */

#ifdef   __ANALOGKEY_DRV_I2C__
static uint8_t _slaveAddress;
#endif

static float _keyFlag = 1;
static uint16_t _maxADC = 1024;
static uint8_t _prec = 51;

/* -------------------------------------------- PRIVATE FUNCTION DECLARATIONS */



/* --------------------------------------------- PRIVATE FUNCTION DEFINITIONS */


/* --------------------------------------------------------- PUBLIC FUNCTIONS */

#ifdef   __ANALOGKEY_DRV_SPI__

void analogkey_spiDriverInit(T_ANALOGKEY_P gpioObj, T_ANALOGKEY_P spiObj)
{
    hal_spiMap( (T_HAL_P)spiObj );
    hal_gpioMap( (T_HAL_P)gpioObj );
}

#endif
#ifdef   __ANALOGKEY_DRV_I2C__

void analogkey_i2cDriverInit(T_ANALOGKEY_P gpioObj, T_ANALOGKEY_P i2cObj, uint8_t slave)
{
    _slaveAddress = slave;
    hal_i2cMap( (T_HAL_P)i2cObj );
    hal_gpioMap( (T_HAL_P)gpioObj );
}

#endif
#ifdef   __ANALOGKEY_DRV_UART__

void analogkey_uartDriverInit(T_ANALOGKEY_P gpioObj, T_ANALOGKEY_P uartObj)
{
    hal_uartMap( (T_HAL_P)uartObj );
    hal_gpioMap( (T_HAL_P)gpioObj );
}

#endif

void analogkey_gpioDriverInit(T_ANALOGKEY_P gpioObj)
{
    hal_gpioMap( (T_HAL_P)gpioObj );
}

/* ----------------------------------------------------------- IMPLEMENTATION */

uint8_t analogkey_getKey(uint16_t adcValue)
{
    if(adcValue >= (_maxADC/6 - _prec) && adcValue <= (_maxADC/6 + _prec))
    {
        return _ANALOGKEY_TOUCH_KEY_6;
    }
    else if(adcValue >= (_maxADC/6 * 2 - _prec) && adcValue <= (_maxADC/6 * 2 + _prec))
    {
        return _ANALOGKEY_TOUCH_KEY_5;
    }
    else if(adcValue >= (_maxADC/6 * 3 - _prec) && adcValue <= (_maxADC/6 * 3 + _prec))
    {
        return _ANALOGKEY_TOUCH_KEY_4;
    }
    else if(adcValue >= (_maxADC/6 * 4 - _prec) && adcValue <= (_maxADC/6 * 4 + _prec))
    {
        return _ANALOGKEY_TOUCH_KEY_3;
    }
    else if(adcValue >= (_maxADC/6 * 5 - _prec) && adcValue <= (_maxADC/6 * 5 + _prec))
    {
        return _ANALOGKEY_TOUCH_KEY_2;
    }
    else if(adcValue >= (_maxADC - _prec) && adcValue <= (_maxADC + _prec))
    {
        return _ANALOGKEY_TOUCH_KEY_1;
    }
    return _ANALOGKEY_NO_TOUCH;
}

void analogkey_setResolution(uint8_t resolution)
{
        if(resolution == _ANALOGKEY_ADC_RESOLUTION_10bit)
        {
                _maxADC = 1023;
                _prec = 51;
        }
        else 
        {
                _maxADC = 4095;
                _prec = 205;
        }
}

/* -------------------------------------------------------------------------- */
/*
  __analogkey_driver.c

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the MikroElektonika.

4. Neither the name of the MikroElektonika nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY MIKROELEKTRONIKA ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL MIKROELEKTRONIKA BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

----------------------------------------------------------------------------- */