_analogkey_adcInit:
;click_analogkey_adc.h,4 :: 		void analogkey_adcInit()
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;click_analogkey_adc.h,6 :: 		ADC1_Init();
JAL	_ADC1_Init+0
NOP	
;click_analogkey_adc.h,7 :: 		}
L_end_analogkey_adcInit:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _analogkey_adcInit
_analogkey_adcSetInputChannel:
;click_analogkey_adc.h,9 :: 		void analogkey_adcSetInputChannel()
;click_analogkey_adc.h,12 :: 		}
L_end_analogkey_adcSetInputChannel:
JR	RA
NOP	
; end of _analogkey_adcSetInputChannel
_analogkey_adcRead:
;click_analogkey_adc.h,14 :: 		uint32_t analogkey_adcRead()
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;click_analogkey_adc.h,18 :: 		adcData = ADC1_Read(8);
SW	R25, 4(SP)
ORI	R25, R0, 8
JAL	_ADC1_Read+0
NOP	
; adcData start address is: 8 (R2)
ANDI	R2, R2, 65535
;click_analogkey_adc.h,19 :: 		return adcData;
; adcData end address is: 8 (R2)
;click_analogkey_adc.h,20 :: 		}
;click_analogkey_adc.h,19 :: 		return adcData;
;click_analogkey_adc.h,20 :: 		}
L_end_analogkey_adcRead:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _analogkey_adcRead
_systemInit:
;Click_AnalogKey_PIC32.c,31 :: 		void systemInit()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Click_AnalogKey_PIC32.c,33 :: 		mikrobus_logInit( _LOG_USBUART_A, 9600 );
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R26, R0, 9600
ORI	R25, R0, 32
JAL	_mikrobus_logInit+0
NOP	
;Click_AnalogKey_PIC32.c,34 :: 		mikrobus_logWrite("--- System Init ---", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr1_Click_AnalogKey_PIC32+0)
ORI	R25, R25, lo_addr(?lstr1_Click_AnalogKey_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_AnalogKey_PIC32.c,35 :: 		Delay_100ms();
JAL	_Delay_100ms+0
NOP	
;Click_AnalogKey_PIC32.c,36 :: 		}
L_end_systemInit:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _systemInit
_applicationInit:
;Click_AnalogKey_PIC32.c,38 :: 		void applicationInit()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Click_AnalogKey_PIC32.c,41 :: 		analogkey_gpioDriverInit( (T_ANALOGKEY_P)&_MIKROBUS1_GPIO );
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R25, hi_addr(__MIKROBUS1_GPIO+0)
ORI	R25, R25, lo_addr(__MIKROBUS1_GPIO+0)
JAL	_analogkey_gpioDriverInit+0
NOP	
;Click_AnalogKey_PIC32.c,42 :: 		analogkey_setResolution(_ANALOGKEY_ADC_RESOLUTION_10bit);
ORI	R25, R0, __ANALOGKEY_ADC_RESOLUTION_10bit
JAL	_analogkey_setResolution+0
NOP	
;Click_AnalogKey_PIC32.c,44 :: 		analogkey_adcSetInputChannel();
JAL	_analogkey_adcSetInputChannel+0
NOP	
;Click_AnalogKey_PIC32.c,45 :: 		analogkey_adcInit();
JAL	_analogkey_adcInit+0
NOP	
;Click_AnalogKey_PIC32.c,46 :: 		Delay_100ms();
JAL	_Delay_100ms+0
NOP	
;Click_AnalogKey_PIC32.c,48 :: 		mikrobus_logWrite("Press the button :D", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr2_Click_AnalogKey_PIC32+0)
ORI	R25, R25, lo_addr(?lstr2_Click_AnalogKey_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_AnalogKey_PIC32.c,49 :: 		}
L_end_applicationInit:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _applicationInit
_applicationTask:
;Click_AnalogKey_PIC32.c,51 :: 		void applicationTask()
ADDIU	SP, SP, -64
SW	RA, 0(SP)
;Click_AnalogKey_PIC32.c,57 :: 		uint16_t sumValue = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
; sumValue start address is: 16 (R4)
MOVZ	R4, R0, R0
;Click_AnalogKey_PIC32.c,59 :: 		for(cnt = 0; cnt < 5; cnt++)
; cnt start address is: 20 (R5)
MOVZ	R5, R0, R0
; sumValue end address is: 16 (R4)
; cnt end address is: 20 (R5)
L_applicationTask0:
; cnt start address is: 20 (R5)
; sumValue start address is: 16 (R4)
ANDI	R2, R5, 255
SLTIU	R2, R2, 5
BNE	R2, R0, L__applicationTask14
NOP	
J	L_applicationTask1
NOP	
L__applicationTask14:
;Click_AnalogKey_PIC32.c,61 :: 		ADC_value = analogkey_adcRead();
JAL	_analogkey_adcRead+0
NOP	
;Click_AnalogKey_PIC32.c,62 :: 		sumValue += ADC_value;
ADDU	R2, R4, R2
ANDI	R4, R2, 65535
;Click_AnalogKey_PIC32.c,63 :: 		Delay_10ms();
JAL	_Delay_10ms+0
NOP	
;Click_AnalogKey_PIC32.c,59 :: 		for(cnt = 0; cnt < 5; cnt++)
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;Click_AnalogKey_PIC32.c,64 :: 		}
; cnt end address is: 20 (R5)
J	L_applicationTask0
NOP	
L_applicationTask1:
;Click_AnalogKey_PIC32.c,65 :: 		ADC_value = sumValue / 5;
ANDI	R3, R4, 65535
; sumValue end address is: 16 (R4)
ORI	R2, R0, 5
DIVU	R3, R2
MFLO	R2
;Click_AnalogKey_PIC32.c,66 :: 		isKey = analogkey_getKey(ADC_value);
ANDI	R25, R2, 65535
JAL	_analogkey_getKey+0
NOP	
; isKey start address is: 16 (R4)
ANDI	R4, R2, 255
;Click_AnalogKey_PIC32.c,68 :: 		if(isKey != _ANALOGKEY_NO_TOUCH)
ANDI	R3, R2, 255
LUI	R2, __ANALOGKEY_NO_TOUCH+2
ORI	R2, R2, __ANALOGKEY_NO_TOUCH
BNE	R3, R2, L__applicationTask16
NOP	
J	L_applicationTask3
NOP	
L__applicationTask16:
;Click_AnalogKey_PIC32.c,70 :: 		IntToStr(isKey, demoText);
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
ANDI	R25, R4, 255
; isKey end address is: 16 (R4)
JAL	_IntToStr+0
NOP	
;Click_AnalogKey_PIC32.c,71 :: 		mikrobus_logWrite("Pressed the button : ", _LOG_TEXT);
ORI	R26, R0, 1
LUI	R25, hi_addr(?lstr3_Click_AnalogKey_PIC32+0)
ORI	R25, R25, lo_addr(?lstr3_Click_AnalogKey_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_AnalogKey_PIC32.c,72 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
ADDIU	R2, SP, 12
ORI	R26, R0, 2
MOVZ	R25, R2, R0
JAL	_mikrobus_logWrite+0
NOP	
;Click_AnalogKey_PIC32.c,73 :: 		}
L_applicationTask3:
;Click_AnalogKey_PIC32.c,74 :: 		Delay_ms( 300 );
LUI	R24, 122
ORI	R24, R24, 4607
L_applicationTask4:
ADDIU	R24, R24, -1
BNE	R24, R0, L_applicationTask4
NOP	
NOP	
;Click_AnalogKey_PIC32.c,75 :: 		}
L_end_applicationTask:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 64
JR	RA
NOP	
; end of _applicationTask
_main:
;Click_AnalogKey_PIC32.c,77 :: 		void main()
;Click_AnalogKey_PIC32.c,79 :: 		systemInit();
JAL	_systemInit+0
NOP	
;Click_AnalogKey_PIC32.c,80 :: 		applicationInit();
JAL	_applicationInit+0
NOP	
;Click_AnalogKey_PIC32.c,82 :: 		while (1)
L_main6:
;Click_AnalogKey_PIC32.c,84 :: 		applicationTask();
JAL	_applicationTask+0
NOP	
;Click_AnalogKey_PIC32.c,85 :: 		}
J	L_main6
NOP	
;Click_AnalogKey_PIC32.c,86 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
