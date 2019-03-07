_analogkey_adcInit:
;click_analogkey_adc.h,4 :: 		void analogkey_adcInit()
;click_analogkey_adc.h,6 :: 		ADC_Init();
CALL	_ADC_Init+0
;click_analogkey_adc.h,7 :: 		}
L_end_analogkey_adcInit:
RETURN	
; end of _analogkey_adcInit
_analogkey_adcSetInputChannel:
;click_analogkey_adc.h,9 :: 		void analogkey_adcSetInputChannel()
;click_analogkey_adc.h,11 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_4);
LDK.L	R0, #8
CALL	_ADC_Set_Input_Channel+0
;click_analogkey_adc.h,12 :: 		}
L_end_analogkey_adcSetInputChannel:
RETURN	
; end of _analogkey_adcSetInputChannel
_analogkey_adcRead:
;click_analogkey_adc.h,14 :: 		uint32_t analogkey_adcRead()
;click_analogkey_adc.h,18 :: 		adcData = ADC_Read(4);
LDK.L	R0, #4
CALL	_ADC_Read+0
; adcData start address is: 0 (R0)
;click_analogkey_adc.h,19 :: 		return adcData;
; adcData end address is: 0 (R0)
;click_analogkey_adc.h,20 :: 		}
L_end_analogkey_adcRead:
RETURN	
; end of _analogkey_adcRead
_systemInit:
;Click_AnalogKey_FT90x.c,31 :: 		void systemInit()
;Click_AnalogKey_FT90x.c,33 :: 		mikrobus_logInit( _LOG_USBUART, 9600 );
LDK.L	R1, #9600
LDK.L	R0, #16
CALL	_mikrobus_logInit+0
;Click_AnalogKey_FT90x.c,34 :: 		mikrobus_logWrite("--- System Init ---", _LOG_LINE);
LDK.L	R0, #?lstr1_Click_AnalogKey_FT90x+0
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_AnalogKey_FT90x.c,35 :: 		Delay_100ms();
CALL	_Delay_100ms+0
;Click_AnalogKey_FT90x.c,36 :: 		}
L_end_systemInit:
RETURN	
; end of _systemInit
_applicationInit:
;Click_AnalogKey_FT90x.c,38 :: 		void applicationInit()
;Click_AnalogKey_FT90x.c,41 :: 		analogkey_gpioDriverInit( (T_ANALOGKEY_P)&_MIKROBUS1_GPIO );
LDK.L	R0, #__MIKROBUS1_GPIO+0
CALL	_analogkey_gpioDriverInit+0
;Click_AnalogKey_FT90x.c,42 :: 		analogkey_setResolution(_ANALOGKEY_ADC_RESOLUTION_10bit);
LDK.L	R0, __ANALOGKEY_ADC_RESOLUTION_10bit
CALL	_analogkey_setResolution+0
;Click_AnalogKey_FT90x.c,44 :: 		analogkey_adcSetInputChannel();
CALL	_analogkey_adcSetInputChannel+0
;Click_AnalogKey_FT90x.c,45 :: 		analogkey_adcInit();
CALL	_analogkey_adcInit+0
;Click_AnalogKey_FT90x.c,46 :: 		Delay_100ms();
CALL	_Delay_100ms+0
;Click_AnalogKey_FT90x.c,48 :: 		mikrobus_logWrite("Press the button :D", _LOG_LINE);
LDK.L	R0, #?lstr2_Click_AnalogKey_FT90x+0
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_AnalogKey_FT90x.c,49 :: 		}
L_end_applicationInit:
RETURN	
; end of _applicationInit
_applicationTask:
;Click_AnalogKey_FT90x.c,51 :: 		void applicationTask()
LINK	LR, #52
;Click_AnalogKey_FT90x.c,57 :: 		uint16_t sumValue = 0;
; sumValue start address is: 40 (R10)
LDK.L	R10, #0
;Click_AnalogKey_FT90x.c,59 :: 		for(cnt = 0; cnt < 5; cnt++)
; cnt start address is: 36 (R9)
LDK.L	R9, #0
; sumValue end address is: 40 (R10)
; cnt end address is: 36 (R9)
L_applicationTask0:
; cnt start address is: 36 (R9)
; sumValue start address is: 40 (R10)
CMP.B	R9, #5
JMPC	R30, C, #0, L_applicationTask1
;Click_AnalogKey_FT90x.c,61 :: 		ADC_value = analogkey_adcRead();
CALL	_analogkey_adcRead+0
;Click_AnalogKey_FT90x.c,62 :: 		sumValue += ADC_value;
BEXTU.L	R0, R0, #0
ADD.L	R10, R10, R0
BEXTU.L	R10, R10, #0
;Click_AnalogKey_FT90x.c,63 :: 		Delay_10ms();
CALL	_Delay_10ms+0
;Click_AnalogKey_FT90x.c,59 :: 		for(cnt = 0; cnt < 5; cnt++)
ADD.L	R9, R9, #1
BEXTU.L	R9, R9, #256
;Click_AnalogKey_FT90x.c,64 :: 		}
; cnt end address is: 36 (R9)
JMP	L_applicationTask0
L_applicationTask1:
;Click_AnalogKey_FT90x.c,65 :: 		ADC_value = sumValue / 5;
UDIV.L	R0, R10, #5
BEXTU.L	R0, R0, #0
; sumValue end address is: 40 (R10)
;Click_AnalogKey_FT90x.c,66 :: 		isKey = analogkey_getKey(ADC_value);
CALL	_analogkey_getKey+0
; isKey start address is: 16 (R4)
BEXTU.L	R4, R0, #256
;Click_AnalogKey_FT90x.c,68 :: 		if(isKey != _ANALOGKEY_NO_TOUCH)
CMP.B	R0, __ANALOGKEY_NO_TOUCH
JMPC	R30, Z, #1, L_applicationTask3
;Click_AnalogKey_FT90x.c,70 :: 		IntToStr(isKey, demoText);
ADD.L	R1, SP, #0
BEXTU.L	R0, R4, #256
; isKey end address is: 16 (R4)
CALL	_IntToStr+0
;Click_AnalogKey_FT90x.c,71 :: 		mikrobus_logWrite("Pressed the button : ", _LOG_TEXT);
LDK.L	R0, #?lstr3_Click_AnalogKey_FT90x+0
LDK.L	R1, #1
CALL	_mikrobus_logWrite+0
;Click_AnalogKey_FT90x.c,72 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
ADD.L	R0, SP, #0
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_AnalogKey_FT90x.c,73 :: 		}
L_applicationTask3:
;Click_AnalogKey_FT90x.c,74 :: 		Delay_ms( 300 );
LPM.L	R28, #9999998
NOP	
L_applicationTask4:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_applicationTask4
JMP	$+8
	#9999998
NOP	
;Click_AnalogKey_FT90x.c,75 :: 		}
L_end_applicationTask:
UNLINK	LR
RETURN	
; end of _applicationTask
_main:
;Click_AnalogKey_FT90x.c,77 :: 		void main()
LDK.L	SP, #43605
;Click_AnalogKey_FT90x.c,79 :: 		systemInit();
CALL	_systemInit+0
;Click_AnalogKey_FT90x.c,80 :: 		applicationInit();
CALL	_applicationInit+0
;Click_AnalogKey_FT90x.c,82 :: 		while (1)
L_main6:
;Click_AnalogKey_FT90x.c,84 :: 		applicationTask();
CALL	_applicationTask+0
;Click_AnalogKey_FT90x.c,85 :: 		}
JMP	L_main6
;Click_AnalogKey_FT90x.c,86 :: 		}
L_end_main:
L__main_end_loop:
JMP	L__main_end_loop
; end of _main
