
_analogkey_adcInit:

;click_analogkey_adc.h,4 :: 		void analogkey_adcInit()
;click_analogkey_adc.h,6 :: 		ADC_Init();
	CALL       _ADC_Init+0
;click_analogkey_adc.h,7 :: 		}
L_end_analogkey_adcInit:
	RET
; end of _analogkey_adcInit

_analogkey_adcSetInputChannel:

;click_analogkey_adc.h,9 :: 		void analogkey_adcSetInputChannel()
;click_analogkey_adc.h,12 :: 		}
L_end_analogkey_adcSetInputChannel:
	RET
; end of _analogkey_adcSetInputChannel

_analogkey_adcRead:

;click_analogkey_adc.h,14 :: 		uint32_t analogkey_adcRead()
;click_analogkey_adc.h,18 :: 		adcData = ADC_Read(7);
	PUSH       R2
	LDI        R27, 7
	MOV        R2, R27
	CALL       _ADC_Read+0
; adcData start address is: 20 (R20)
	MOVW       R20, R16
	LDI        R22, 0
	MOV        R23, R22
;click_analogkey_adc.h,19 :: 		return adcData;
	MOVW       R16, R20
	MOVW       R18, R22
; adcData end address is: 20 (R20)
;click_analogkey_adc.h,20 :: 		}
;click_analogkey_adc.h,19 :: 		return adcData;
;click_analogkey_adc.h,20 :: 		}
L_end_analogkey_adcRead:
	POP        R2
	RET
; end of _analogkey_adcRead

_systemInit:

;Click_AnalogKey_AVR.c,31 :: 		void systemInit()
;Click_AnalogKey_AVR.c,33 :: 		mikrobus_logInit( _LOG_USBUART, 9600 );
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	LDI        R27, 128
	MOV        R3, R27
	LDI        R27, 37
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	MOV        R6, R27
	LDI        R27, 16
	MOV        R2, R27
	CALL       _mikrobus_logInit+0
;Click_AnalogKey_AVR.c,34 :: 		mikrobus_logWrite("--- System Init ---", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr1_Click_AnalogKey_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_Click_AnalogKey_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_AnalogKey_AVR.c,35 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;Click_AnalogKey_AVR.c,36 :: 		}
L_end_systemInit:
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _systemInit

_applicationInit:

;Click_AnalogKey_AVR.c,38 :: 		void applicationInit()
;Click_AnalogKey_AVR.c,41 :: 		analogkey_gpioDriverInit( (T_ANALOGKEY_P)&_MIKROBUS1_GPIO );
	PUSH       R2
	PUSH       R3
	PUSH       R4
	LDI        R27, #lo_addr(__MIKROBUS1_GPIO+0)
	MOV        R2, R27
	LDI        R27, hi_addr(__MIKROBUS1_GPIO+0)
	MOV        R3, R27
	CALL       _analogkey_gpioDriverInit+0
;Click_AnalogKey_AVR.c,42 :: 		analogkey_setResolution(_ANALOGKEY_ADC_RESOLUTION_10bit);
	LDI        R27, __ANALOGKEY_ADC_RESOLUTION_10bit
	MOV        R2, R27
	CALL       _analogkey_setResolution+0
;Click_AnalogKey_AVR.c,44 :: 		analogkey_adcSetInputChannel();
	CALL       _analogkey_adcSetInputChannel+0
;Click_AnalogKey_AVR.c,45 :: 		analogkey_adcInit();
	CALL       _analogkey_adcInit+0
;Click_AnalogKey_AVR.c,46 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;Click_AnalogKey_AVR.c,48 :: 		mikrobus_logWrite("Press the button :D", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr2_Click_AnalogKey_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_Click_AnalogKey_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_AnalogKey_AVR.c,49 :: 		}
L_end_applicationInit:
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _applicationInit

_applicationTask:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 50
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;Click_AnalogKey_AVR.c,51 :: 		void applicationTask()
;Click_AnalogKey_AVR.c,57 :: 		uint16_t sumValue = 0;
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
; sumValue start address is: 21 (R21)
	LDI        R21, 0
	LDI        R22, 0
;Click_AnalogKey_AVR.c,59 :: 		for(cnt = 0; cnt < 5; cnt++)
; cnt start address is: 20 (R20)
	LDI        R20, 0
; sumValue end address is: 21 (R21)
; cnt end address is: 20 (R20)
L_applicationTask0:
; cnt start address is: 20 (R20)
; sumValue start address is: 21 (R21)
	CPI        R20, 5
	BRLO       L__applicationTask14
	JMP        L_applicationTask1
L__applicationTask14:
;Click_AnalogKey_AVR.c,61 :: 		ADC_value = analogkey_adcRead();
	PUSH       R22
	PUSH       R21
	PUSH       R20
	CALL       _analogkey_adcRead+0
	POP        R20
	POP        R21
	POP        R22
;Click_AnalogKey_AVR.c,62 :: 		sumValue += ADC_value;
	ADD        R16, R21
	ADC        R17, R22
	MOV        R21, R16
	MOV        R22, R17
;Click_AnalogKey_AVR.c,63 :: 		Delay_10ms();
	CALL       _Delay_10ms+0
;Click_AnalogKey_AVR.c,59 :: 		for(cnt = 0; cnt < 5; cnt++)
	MOV        R16, R20
	SUBI       R16, 255
	MOV        R20, R16
;Click_AnalogKey_AVR.c,64 :: 		}
; cnt end address is: 20 (R20)
	JMP        L_applicationTask0
L_applicationTask1:
;Click_AnalogKey_AVR.c,65 :: 		ADC_value = sumValue / 5;
	MOV        R16, R21
	MOV        R17, R22
	LDI        R20, 5
	LDI        R21, 0
	CALL       _Div_16x16_U+0
	MOVW       R16, R24
; sumValue end address is: 21 (R21)
;Click_AnalogKey_AVR.c,66 :: 		isKey = analogkey_getKey(ADC_value);
	MOVW       R2, R16
	CALL       _analogkey_getKey+0
; isKey start address is: 18 (R18)
	MOV        R18, R16
;Click_AnalogKey_AVR.c,68 :: 		if(isKey != _ANALOGKEY_NO_TOUCH)
	CPI        R16, __ANALOGKEY_NO_TOUCH
	BRNE       L__applicationTask15
	JMP        L_applicationTask3
L__applicationTask15:
;Click_AnalogKey_AVR.c,70 :: 		IntToStr(isKey, demoText);
	MOVW       R16, R28
	MOVW       R4, R16
	MOV        R2, R18
	LDI        R27, 0
	MOV        R3, R27
; isKey end address is: 18 (R18)
	CALL       _IntToStr+0
;Click_AnalogKey_AVR.c,71 :: 		mikrobus_logWrite("Pressed the button : ", _LOG_TEXT);
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr3_Click_AnalogKey_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr3_Click_AnalogKey_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_AnalogKey_AVR.c,72 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	MOVW       R16, R28
	LDI        R27, 2
	MOV        R4, R27
	MOVW       R2, R16
	CALL       _mikrobus_logWrite+0
;Click_AnalogKey_AVR.c,73 :: 		}
L_applicationTask3:
;Click_AnalogKey_AVR.c,74 :: 		Delay_ms( 300 );
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L_applicationTask4:
	DEC        R16
	BRNE       L_applicationTask4
	DEC        R17
	BRNE       L_applicationTask4
	DEC        R18
	BRNE       L_applicationTask4
	NOP
	NOP
;Click_AnalogKey_AVR.c,75 :: 		}
L_end_applicationTask:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 49
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _applicationTask

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Click_AnalogKey_AVR.c,77 :: 		void main()
;Click_AnalogKey_AVR.c,79 :: 		systemInit();
	CALL       _systemInit+0
;Click_AnalogKey_AVR.c,80 :: 		applicationInit();
	CALL       _applicationInit+0
;Click_AnalogKey_AVR.c,82 :: 		while (1)
L_main6:
;Click_AnalogKey_AVR.c,84 :: 		applicationTask();
	CALL       _applicationTask+0
;Click_AnalogKey_AVR.c,85 :: 		}
	JMP        L_main6
;Click_AnalogKey_AVR.c,86 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
