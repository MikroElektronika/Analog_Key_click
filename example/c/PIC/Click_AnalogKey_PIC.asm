
_analogkey_adcInit:

;click_analogkey_adc.h,4 :: 		void analogkey_adcInit()
;click_analogkey_adc.h,7 :: 		}
L_end_analogkey_adcInit:
	RETURN      0
; end of _analogkey_adcInit

_analogkey_adcSetInputChannel:

;click_analogkey_adc.h,9 :: 		void analogkey_adcSetInputChannel()
;click_analogkey_adc.h,12 :: 		}
L_end_analogkey_adcSetInputChannel:
	RETURN      0
; end of _analogkey_adcSetInputChannel

_analogkey_adcRead:

;click_analogkey_adc.h,14 :: 		uint32_t analogkey_adcRead()
;click_analogkey_adc.h,18 :: 		adcData = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       analogkey_adcRead_adcData_L0+0 
	MOVF        R1, 0 
	MOVWF       analogkey_adcRead_adcData_L0+1 
	MOVLW       0
	MOVWF       analogkey_adcRead_adcData_L0+2 
	MOVWF       analogkey_adcRead_adcData_L0+3 
;click_analogkey_adc.h,19 :: 		return adcData;
	MOVF        analogkey_adcRead_adcData_L0+0, 0 
	MOVWF       R0 
	MOVF        analogkey_adcRead_adcData_L0+1, 0 
	MOVWF       R1 
	MOVF        analogkey_adcRead_adcData_L0+2, 0 
	MOVWF       R2 
	MOVF        analogkey_adcRead_adcData_L0+3, 0 
	MOVWF       R3 
;click_analogkey_adc.h,20 :: 		}
L_end_analogkey_adcRead:
	RETURN      0
; end of _analogkey_adcRead

_systemInit:

;Click_AnalogKey_PIC.c,31 :: 		void systemInit()
;Click_AnalogKey_PIC.c,33 :: 		mikrobus_logInit( _LOG_USBUART, 9600 );
	MOVLW       16
	MOVWF       FARG_mikrobus_logInit_port+0 
	MOVLW       128
	MOVWF       FARG_mikrobus_logInit_baud+0 
	MOVLW       37
	MOVWF       FARG_mikrobus_logInit_baud+1 
	MOVLW       0
	MOVWF       FARG_mikrobus_logInit_baud+2 
	MOVWF       FARG_mikrobus_logInit_baud+3 
	CALL        _mikrobus_logInit+0, 0
;Click_AnalogKey_PIC.c,34 :: 		mikrobus_logWrite("--- System Init ---", _LOG_LINE);
	MOVLW       ?lstr1_Click_AnalogKey_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr1_Click_AnalogKey_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_AnalogKey_PIC.c,35 :: 		Delay_100ms();
	CALL        _Delay_100ms+0, 0
;Click_AnalogKey_PIC.c,36 :: 		}
L_end_systemInit:
	RETURN      0
; end of _systemInit

_applicationInit:

;Click_AnalogKey_PIC.c,38 :: 		void applicationInit()
;Click_AnalogKey_PIC.c,41 :: 		analogkey_gpioDriverInit( (T_ANALOGKEY_P)&_MIKROBUS1_GPIO );
	MOVLW       __MIKROBUS1_GPIO+0
	MOVWF       FARG_analogkey_gpioDriverInit_gpioObj+0 
	MOVLW       hi_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_analogkey_gpioDriverInit_gpioObj+1 
	MOVLW       higher_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_analogkey_gpioDriverInit_gpioObj+2 
	CALL        _analogkey_gpioDriverInit+0, 0
;Click_AnalogKey_PIC.c,42 :: 		analogkey_setResolution(_ANALOGKEY_ADC_RESOLUTION_12bit);
	MOVLW       __ANALOGKEY_ADC_RESOLUTION_12bit
	MOVWF       FARG_analogkey_setResolution_resolution+0 
	CALL        _analogkey_setResolution+0, 0
;Click_AnalogKey_PIC.c,44 :: 		analogkey_adcSetInputChannel();
	CALL        _analogkey_adcSetInputChannel+0, 0
;Click_AnalogKey_PIC.c,45 :: 		analogkey_adcInit();
	CALL        _analogkey_adcInit+0, 0
;Click_AnalogKey_PIC.c,46 :: 		Delay_100ms();
	CALL        _Delay_100ms+0, 0
;Click_AnalogKey_PIC.c,48 :: 		mikrobus_logWrite("Press the button :D", _LOG_LINE);
	MOVLW       ?lstr2_Click_AnalogKey_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr2_Click_AnalogKey_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_AnalogKey_PIC.c,49 :: 		}
L_end_applicationInit:
	RETURN      0
; end of _applicationInit

_applicationTask:

;Click_AnalogKey_PIC.c,51 :: 		void applicationTask()
;Click_AnalogKey_PIC.c,57 :: 		uint16_t sumValue = 0;
	CLRF        applicationTask_sumValue_L0+0 
	CLRF        applicationTask_sumValue_L0+1 
;Click_AnalogKey_PIC.c,59 :: 		for(cnt = 0; cnt < 5; cnt++)
	CLRF        applicationTask_cnt_L0+0 
L_applicationTask0:
	MOVLW       5
	SUBWF       applicationTask_cnt_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_applicationTask1
;Click_AnalogKey_PIC.c,61 :: 		ADC_value = analogkey_adcRead();
	CALL        _analogkey_adcRead+0, 0
;Click_AnalogKey_PIC.c,62 :: 		sumValue += ADC_value;
	MOVF        R0, 0 
	ADDWF       applicationTask_sumValue_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      applicationTask_sumValue_L0+1, 1 
;Click_AnalogKey_PIC.c,63 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Click_AnalogKey_PIC.c,59 :: 		for(cnt = 0; cnt < 5; cnt++)
	INCF        applicationTask_cnt_L0+0, 1 
;Click_AnalogKey_PIC.c,64 :: 		}
	GOTO        L_applicationTask0
L_applicationTask1:
;Click_AnalogKey_PIC.c,65 :: 		ADC_value = sumValue / 5;
	MOVLW       5
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        applicationTask_sumValue_L0+0, 0 
	MOVWF       R0 
	MOVF        applicationTask_sumValue_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
;Click_AnalogKey_PIC.c,66 :: 		isKey = analogkey_getKey(ADC_value);
	MOVF        R0, 0 
	MOVWF       FARG_analogkey_getKey_adcValue+0 
	MOVF        R1, 0 
	MOVWF       FARG_analogkey_getKey_adcValue+1 
	CALL        _analogkey_getKey+0, 0
	MOVF        R0, 0 
	MOVWF       applicationTask_isKey_L0+0 
;Click_AnalogKey_PIC.c,68 :: 		if(isKey != _ANALOGKEY_NO_TOUCH)
	MOVF        R0, 0 
	XORLW       __ANALOGKEY_NO_TOUCH
	BTFSC       STATUS+0, 2 
	GOTO        L_applicationTask3
;Click_AnalogKey_PIC.c,70 :: 		IntToStr(isKey, demoText);
	MOVF        applicationTask_isKey_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       applicationTask_demoText_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(applicationTask_demoText_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Click_AnalogKey_PIC.c,71 :: 		mikrobus_logWrite("Pressed the button : ", _LOG_TEXT);
	MOVLW       ?lstr3_Click_AnalogKey_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr3_Click_AnalogKey_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       1
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_AnalogKey_PIC.c,72 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	MOVLW       applicationTask_demoText_L0+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(applicationTask_demoText_L0+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_AnalogKey_PIC.c,73 :: 		}
L_applicationTask3:
;Click_AnalogKey_PIC.c,74 :: 		Delay_ms( 300 );
	MOVLW       25
	MOVWF       R11, 0
	MOVLW       90
	MOVWF       R12, 0
	MOVLW       177
	MOVWF       R13, 0
L_applicationTask4:
	DECFSZ      R13, 1, 1
	BRA         L_applicationTask4
	DECFSZ      R12, 1, 1
	BRA         L_applicationTask4
	DECFSZ      R11, 1, 1
	BRA         L_applicationTask4
	NOP
	NOP
;Click_AnalogKey_PIC.c,75 :: 		}
L_end_applicationTask:
	RETURN      0
; end of _applicationTask

_main:

;Click_AnalogKey_PIC.c,77 :: 		void main()
;Click_AnalogKey_PIC.c,79 :: 		systemInit();
	CALL        _systemInit+0, 0
;Click_AnalogKey_PIC.c,80 :: 		applicationInit();
	CALL        _applicationInit+0, 0
;Click_AnalogKey_PIC.c,82 :: 		while (1)
L_main5:
;Click_AnalogKey_PIC.c,84 :: 		applicationTask();
	CALL        _applicationTask+0, 0
;Click_AnalogKey_PIC.c,85 :: 		}
	GOTO        L_main5
;Click_AnalogKey_PIC.c,86 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
