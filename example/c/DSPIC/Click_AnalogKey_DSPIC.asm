
_analogkey_adcInit:

;click_analogkey_adc.h,4 :: 		void analogkey_adcInit()
;click_analogkey_adc.h,6 :: 		ADC1_Init_Advanced(_ADC_12bit, _ADC_INTERNAL_VREFL | _ADC_INTERNAL_VREFH);
	PUSH	W10
	PUSH	W11
	CLR	W11
	MOV	#1, W10
	CALL	_ADC1_Init_Advanced
;click_analogkey_adc.h,7 :: 		}
L_end_analogkey_adcInit:
	POP	W11
	POP	W10
	RETURN
; end of _analogkey_adcInit

_analogkey_adcSetInputChannel:

;click_analogkey_adc.h,9 :: 		void analogkey_adcSetInputChannel()
;click_analogkey_adc.h,12 :: 		}
L_end_analogkey_adcSetInputChannel:
	RETURN
; end of _analogkey_adcSetInputChannel

_analogkey_adcRead:

;click_analogkey_adc.h,14 :: 		uint32_t analogkey_adcRead()
;click_analogkey_adc.h,18 :: 		adcData = ADC1_Read(8);
	PUSH	W10
	MOV	#8, W10
	CALL	_ADC1_Read
; adcData start address is: 4 (W2)
	MOV	W0, W2
	CLR	W3
;click_analogkey_adc.h,19 :: 		return adcData;
	MOV.D	W2, W0
; adcData end address is: 4 (W2)
;click_analogkey_adc.h,20 :: 		}
;click_analogkey_adc.h,19 :: 		return adcData;
;click_analogkey_adc.h,20 :: 		}
L_end_analogkey_adcRead:
	POP	W10
	RETURN
; end of _analogkey_adcRead

_systemInit:

;Click_AnalogKey_DSPIC.c,31 :: 		void systemInit()
;Click_AnalogKey_DSPIC.c,33 :: 		mikrobus_logInit( _LOG_USBUART_A, 9600 );
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#9600, W11
	MOV	#0, W12
	MOV.B	#32, W10
	CALL	_mikrobus_logInit
;Click_AnalogKey_DSPIC.c,34 :: 		mikrobus_logWrite("--- System Init ---", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr1_Click_AnalogKey_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_AnalogKey_DSPIC.c,35 :: 		Delay_100ms();
	CALL	_Delay_100ms
;Click_AnalogKey_DSPIC.c,36 :: 		}
L_end_systemInit:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _systemInit

_applicationInit:

;Click_AnalogKey_DSPIC.c,38 :: 		void applicationInit()
;Click_AnalogKey_DSPIC.c,41 :: 		analogkey_gpioDriverInit( (T_ANALOGKEY_P)&_MIKROBUS1_GPIO );
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(__MIKROBUS1_GPIO), W10
	CALL	_analogkey_gpioDriverInit
;Click_AnalogKey_DSPIC.c,42 :: 		analogkey_setResolution(_ANALOGKEY_ADC_RESOLUTION_10bit);
	MOV.B	#__ANALOGKEY_ADC_RESOLUTION_10bit, W10
	CALL	_analogkey_setResolution
;Click_AnalogKey_DSPIC.c,44 :: 		analogkey_adcSetInputChannel();
	CALL	_analogkey_adcSetInputChannel
;Click_AnalogKey_DSPIC.c,45 :: 		analogkey_adcInit();
	CALL	_analogkey_adcInit
;Click_AnalogKey_DSPIC.c,46 :: 		Delay_100ms();
	CALL	_Delay_100ms
;Click_AnalogKey_DSPIC.c,48 :: 		mikrobus_logWrite("Press the button :D", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr2_Click_AnalogKey_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_AnalogKey_DSPIC.c,49 :: 		}
L_end_applicationInit:
	POP	W11
	POP	W10
	RETURN
; end of _applicationInit

_applicationTask:
	LNK	#50

;Click_AnalogKey_DSPIC.c,51 :: 		void applicationTask()
;Click_AnalogKey_DSPIC.c,57 :: 		uint16_t sumValue = 0;
	PUSH	W10
	PUSH	W11
; sumValue start address is: 6 (W3)
	CLR	W3
;Click_AnalogKey_DSPIC.c,59 :: 		for(cnt = 0; cnt < 5; cnt++)
; cnt start address is: 8 (W4)
	CLR	W4
; sumValue end address is: 6 (W3)
; cnt end address is: 8 (W4)
L_applicationTask0:
; cnt start address is: 8 (W4)
; sumValue start address is: 6 (W3)
	CP.B	W4, #5
	BRA LTU	L__applicationTask14
	GOTO	L_applicationTask1
L__applicationTask14:
;Click_AnalogKey_DSPIC.c,61 :: 		ADC_value = analogkey_adcRead();
	PUSH	W3
	CALL	_analogkey_adcRead
	POP	W3
;Click_AnalogKey_DSPIC.c,62 :: 		sumValue += ADC_value;
	ADD	W3, W0, W3
;Click_AnalogKey_DSPIC.c,63 :: 		Delay_10ms();
	CALL	_Delay_10ms
;Click_AnalogKey_DSPIC.c,59 :: 		for(cnt = 0; cnt < 5; cnt++)
	INC.B	W4
;Click_AnalogKey_DSPIC.c,64 :: 		}
; cnt end address is: 8 (W4)
	GOTO	L_applicationTask0
L_applicationTask1:
;Click_AnalogKey_DSPIC.c,65 :: 		ADC_value = sumValue / 5;
	MOV	#5, W2
	REPEAT	#17
	DIV.U	W3, W2
; sumValue end address is: 6 (W3)
;Click_AnalogKey_DSPIC.c,66 :: 		isKey = analogkey_getKey(ADC_value);
	MOV	W0, W10
	CALL	_analogkey_getKey
; isKey start address is: 4 (W2)
	MOV.B	W0, W2
;Click_AnalogKey_DSPIC.c,68 :: 		if(isKey != _ANALOGKEY_NO_TOUCH)
	MOV.B	#__ANALOGKEY_NO_TOUCH, W1
	CP.B	W0, W1
	BRA NZ	L__applicationTask15
	GOTO	L_applicationTask3
L__applicationTask15:
;Click_AnalogKey_DSPIC.c,70 :: 		IntToStr(isKey, demoText);
	ADD	W14, #0, W0
	MOV	W0, W11
	ZE	W2, W10
; isKey end address is: 4 (W2)
	CALL	_IntToStr
;Click_AnalogKey_DSPIC.c,71 :: 		mikrobus_logWrite("Pressed the button : ", _LOG_TEXT);
	MOV.B	#1, W11
	MOV	#lo_addr(?lstr3_Click_AnalogKey_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_AnalogKey_DSPIC.c,72 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	ADD	W14, #0, W0
	MOV.B	#2, W11
	MOV	W0, W10
	CALL	_mikrobus_logWrite
;Click_AnalogKey_DSPIC.c,73 :: 		}
L_applicationTask3:
;Click_AnalogKey_DSPIC.c,74 :: 		Delay_ms( 300 );
	MOV	#7, W8
	MOV	#6785, W7
L_applicationTask4:
	DEC	W7
	BRA NZ	L_applicationTask4
	DEC	W8
	BRA NZ	L_applicationTask4
;Click_AnalogKey_DSPIC.c,75 :: 		}
L_end_applicationTask:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _applicationTask

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;Click_AnalogKey_DSPIC.c,77 :: 		void main()
;Click_AnalogKey_DSPIC.c,79 :: 		systemInit();
	CALL	_systemInit
;Click_AnalogKey_DSPIC.c,80 :: 		applicationInit();
	CALL	_applicationInit
;Click_AnalogKey_DSPIC.c,82 :: 		while (1)
L_main6:
;Click_AnalogKey_DSPIC.c,84 :: 		applicationTask();
	CALL	_applicationTask
;Click_AnalogKey_DSPIC.c,85 :: 		}
	GOTO	L_main6
;Click_AnalogKey_DSPIC.c,86 :: 		}
L_end_main:
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
