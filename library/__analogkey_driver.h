/*
    __analogkey_driver.h

-----------------------------------------------------------------------------

  This file is part of mikroSDK.
  
  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

/**
@file   __analogkey_driver.h
@brief    AnalogKey Driver
@mainpage AnalogKey Click
@{

@image html libstock_fb_view.jpg

@}

@defgroup   ANALOGKEY
@brief      AnalogKey Click Driver
@{

| Global Library Prefix | **ANALOGKEY** |
|:---------------------:|:-----------------:|
| Version               | **1.0.0**    |
| Date                  | **dec 2018.**      |
| Developer             | **Katarina Perendic**     |

*/
/* -------------------------------------------------------------------------- */

#include "stdint.h"

#ifndef _ANALOGKEY_H_
#define _ANALOGKEY_H_

/** 
 * @macro T_ANALOGKEY_P
 * @brief Driver Abstract type 
 */
#define T_ANALOGKEY_P    const uint8_t*

/** @defgroup ANALOGKEY_COMPILE Compilation Config */              /** @{ */

//  #define   __ANALOGKEY_DRV_SPI__                            /**<     @macro __ANALOGKEY_DRV_SPI__  @brief SPI driver selector */
//  #define   __ANALOGKEY_DRV_I2C__                            /**<     @macro __ANALOGKEY_DRV_I2C__  @brief I2C driver selector */                                          
// #define   __ANALOGKEY_DRV_UART__                           /**<     @macro __ANALOGKEY_DRV_UART__ @brief UART driver selector */ 

                                                                       /** @} */
/** @defgroup ANALOGKEY_VAR Variables */                           /** @{ */

extern const uint8_t _ANALOGKEY_TOUCH_KEY_1;
extern const uint8_t _ANALOGKEY_TOUCH_KEY_2;
extern const uint8_t _ANALOGKEY_TOUCH_KEY_3;
extern const uint8_t _ANALOGKEY_TOUCH_KEY_4;
extern const uint8_t _ANALOGKEY_TOUCH_KEY_5;
extern const uint8_t _ANALOGKEY_TOUCH_KEY_6;
extern const uint8_t _ANALOGKEY_NO_TOUCH   ;

extern const uint8_t _ANALOGKEY_ADC_RESOLUTION_10bit ;
extern const uint8_t _ANALOGKEY_ADC_RESOLUTION_12bit ;

                                                                       /** @} */
/** @defgroup ANALOGKEY_TYPES Types */                             /** @{ */



                                                                       /** @} */
#ifdef __cplusplus
extern "C"{
#endif

/** @defgroup ANALOGKEY_INIT Driver Initialization */              /** @{ */

#ifdef   __ANALOGKEY_DRV_SPI__
void analogkey_spiDriverInit(T_ANALOGKEY_P gpioObj, T_ANALOGKEY_P spiObj);
#endif
#ifdef   __ANALOGKEY_DRV_I2C__
void analogkey_i2cDriverInit(T_ANALOGKEY_P gpioObj, T_ANALOGKEY_P i2cObj, uint8_t slave);
#endif
#ifdef   __ANALOGKEY_DRV_UART__
void analogkey_uartDriverInit(T_ANALOGKEY_P gpioObj, T_ANALOGKEY_P uartObj);
#endif

// GPIO Only Drivers - remove in other cases
void analogkey_gpioDriverInit(T_ANALOGKEY_P gpioObj);
                                                                       /** @} */
/** @defgroup ANALOGKEY_FUNC Driver Functions */                   /** @{ */

/**
 * @brief Detects which button is pressed
 *
 * @param[in] adcValue     ADC value
 * @return which button is pressed
 */
uint8_t analogkey_getKey(uint16_t adcValue);

/**
 * @brief set ADC resolution
 *
 * @param[in] resolution     ADC resolution (10bit or 12 bit)
 */
void analogkey_setResolution(uint8_t resolution);

                                                                       /** @} */
#ifdef __cplusplus
} // extern "C"
#endif
#endif

/**
    @example Click_AnalogKey_STM.c
    @example Click_AnalogKey_TIVA.c
    @example Click_AnalogKey_CEC.c
    @example Click_AnalogKey_KINETIS.c
    @example Click_AnalogKey_MSP.c
    @example Click_AnalogKey_PIC.c
    @example Click_AnalogKey_PIC32.c
    @example Click_AnalogKey_DSPIC.c
    @example Click_AnalogKey_AVR.c
    @example Click_AnalogKey_FT90x.c
    @example Click_AnalogKey_STM.mbas
    @example Click_AnalogKey_TIVA.mbas
    @example Click_AnalogKey_CEC.mbas
    @example Click_AnalogKey_KINETIS.mbas
    @example Click_AnalogKey_MSP.mbas
    @example Click_AnalogKey_PIC.mbas
    @example Click_AnalogKey_PIC32.mbas
    @example Click_AnalogKey_DSPIC.mbas
    @example Click_AnalogKey_AVR.mbas
    @example Click_AnalogKey_FT90x.mbas
    @example Click_AnalogKey_STM.mpas
    @example Click_AnalogKey_TIVA.mpas
    @example Click_AnalogKey_CEC.mpas
    @example Click_AnalogKey_KINETIS.mpas
    @example Click_AnalogKey_MSP.mpas
    @example Click_AnalogKey_PIC.mpas
    @example Click_AnalogKey_PIC32.mpas
    @example Click_AnalogKey_DSPIC.mpas
    @example Click_AnalogKey_AVR.mpas
    @example Click_AnalogKey_FT90x.mpas
*/                                                                     /** @} */
/* -------------------------------------------------------------------------- */
/*
  __analogkey_driver.h

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