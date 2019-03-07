_analogkey_adcInit:
;click_analogkey_adc.h,4 :: 		void analogkey_adcInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;click_analogkey_adc.h,6 :: 		ADC0_Init();
BL	_ADC0_Init+0
;click_analogkey_adc.h,7 :: 		}
L_end_analogkey_adcInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _analogkey_adcInit
_analogkey_adcSetInputChannel:
;click_analogkey_adc.h,9 :: 		void analogkey_adcSetInputChannel()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;click_analogkey_adc.h,11 :: 		ADC0_Set_Input_Channel(_ADC_CHANNEL_12);
MOV	R0, #4096
BL	_ADC0_Set_Input_Channel+0
;click_analogkey_adc.h,12 :: 		}
L_end_analogkey_adcSetInputChannel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _analogkey_adcSetInputChannel
_analogkey_adcRead:
;click_analogkey_adc.h,14 :: 		uint32_t analogkey_adcRead()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;click_analogkey_adc.h,18 :: 		adcData = ADC0_Read(12);
MOVS	R0, #12
BL	_ADC0_Read+0
;click_analogkey_adc.h,19 :: 		return adcData;
;click_analogkey_adc.h,20 :: 		}
L_end_analogkey_adcRead:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _analogkey_adcRead
_systemInit:
;Click_AnalogKey_KINETIS.c,31 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_AnalogKey_KINETIS.c,33 :: 		mikrobus_logInit( _LOG_USBUART, 9600 );
MOVW	R1, #9600
MOVS	R0, #16
BL	_mikrobus_logInit+0
;Click_AnalogKey_KINETIS.c,34 :: 		mikrobus_logWrite("--- System Init ---", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr1_Click_AnalogKey_KINETIS+0)
MOVT	R0, #hi_addr(?lstr1_Click_AnalogKey_KINETIS+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_AnalogKey_KINETIS.c,35 :: 		Delay_100ms();
BL	_Delay_100ms+0
;Click_AnalogKey_KINETIS.c,36 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_AnalogKey_KINETIS.c,38 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_AnalogKey_KINETIS.c,41 :: 		analogkey_gpioDriverInit( (T_ANALOGKEY_P)&_MIKROBUS1_GPIO );
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_analogkey_gpioDriverInit+0
;Click_AnalogKey_KINETIS.c,44 :: 		analogkey_adcSetInputChannel();
BL	_analogkey_adcSetInputChannel+0
;Click_AnalogKey_KINETIS.c,45 :: 		analogkey_adcInit();
BL	_analogkey_adcInit+0
;Click_AnalogKey_KINETIS.c,46 :: 		Delay_100ms();
BL	_Delay_100ms+0
;Click_AnalogKey_KINETIS.c,48 :: 		mikrobus_logWrite("Press the button :D", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr2_Click_AnalogKey_KINETIS+0)
MOVT	R0, #hi_addr(?lstr2_Click_AnalogKey_KINETIS+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_AnalogKey_KINETIS.c,49 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_AnalogKey_KINETIS.c,51 :: 		void applicationTask()
SUB	SP, SP, #60
STR	LR, [SP, #0]
;Click_AnalogKey_KINETIS.c,57 :: 		uint16_t sumValue = 0;
; sumValue start address is: 4 (R1)
MOVW	R1, #0
;Click_AnalogKey_KINETIS.c,59 :: 		for(cnt = 0; cnt < 5; cnt++)
; cnt start address is: 40 (R10)
MOVW	R10, #0
; sumValue end address is: 4 (R1)
; cnt end address is: 40 (R10)
L_applicationTask0:
; cnt start address is: 40 (R10)
; sumValue start address is: 4 (R1)
CMP	R10, #5
IT	CS
BCS	L_applicationTask1
;Click_AnalogKey_KINETIS.c,61 :: 		ADC_value = analogkey_adcRead();
STRH	R1, [SP, #4]
BL	_analogkey_adcRead+0
LDRH	R1, [SP, #4]
;Click_AnalogKey_KINETIS.c,62 :: 		sumValue += ADC_value;
UXTH	R0, R0
ADDS	R1, R1, R0
UXTH	R1, R1
;Click_AnalogKey_KINETIS.c,63 :: 		Delay_10ms();
BL	_Delay_10ms+0
;Click_AnalogKey_KINETIS.c,59 :: 		for(cnt = 0; cnt < 5; cnt++)
ADD	R10, R10, #1
UXTB	R10, R10
;Click_AnalogKey_KINETIS.c,64 :: 		}
; cnt end address is: 40 (R10)
IT	AL
BAL	L_applicationTask0
L_applicationTask1:
;Click_AnalogKey_KINETIS.c,65 :: 		ADC_value = sumValue / 5;
MOVS	R0, #5
UDIV	R0, R1, R0
; sumValue end address is: 4 (R1)
;Click_AnalogKey_KINETIS.c,66 :: 		isKey = analogkey_getKey(ADC_value);
BL	_analogkey_getKey+0
; isKey start address is: 4 (R1)
UXTB	R1, R0
;Click_AnalogKey_KINETIS.c,68 :: 		if(isKey != _ANALOGKEY_NO_TOUCH)
CMP	R0, __ANALOGKEY_NO_TOUCH
IT	EQ
BEQ	L_applicationTask3
;Click_AnalogKey_KINETIS.c,70 :: 		IntToStr(isKey, demoText);
ADD	R0, SP, #8
STRH	R1, [SP, #4]
MOV	R1, R0
LDRSH	R0, [SP, #4]
; isKey end address is: 4 (R1)
BL	_IntToStr+0
;Click_AnalogKey_KINETIS.c,71 :: 		mikrobus_logWrite("Pressed the button : ", _LOG_TEXT);
MOVW	R0, #lo_addr(?lstr3_Click_AnalogKey_KINETIS+0)
MOVT	R0, #hi_addr(?lstr3_Click_AnalogKey_KINETIS+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_AnalogKey_KINETIS.c,72 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
ADD	R0, SP, #8
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_AnalogKey_KINETIS.c,73 :: 		}
L_applicationTask3:
;Click_AnalogKey_KINETIS.c,74 :: 		Delay_ms( 300 );
MOVW	R7, #6910
MOVT	R7, #183
NOP
NOP
L_applicationTask4:
SUBS	R7, R7, #1
BNE	L_applicationTask4
NOP
NOP
NOP
;Click_AnalogKey_KINETIS.c,75 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #60
BX	LR
; end of _applicationTask
_main:
;Click_AnalogKey_KINETIS.c,77 :: 		void main()
;Click_AnalogKey_KINETIS.c,79 :: 		systemInit();
BL	_systemInit+0
;Click_AnalogKey_KINETIS.c,80 :: 		applicationInit();
BL	_applicationInit+0
;Click_AnalogKey_KINETIS.c,82 :: 		while (1)
L_main6:
;Click_AnalogKey_KINETIS.c,84 :: 		applicationTask();
BL	_applicationTask+0
;Click_AnalogKey_KINETIS.c,85 :: 		}
IT	AL
BAL	L_main6
;Click_AnalogKey_KINETIS.c,86 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
