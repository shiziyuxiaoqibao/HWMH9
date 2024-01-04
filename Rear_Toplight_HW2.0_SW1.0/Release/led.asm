;--------------------------------------------------------
; File Created by ChiponCC : ChipON  inc.
;--------------------------------------------------------
; chipon port for the 16-bit core
;--------------------------------------------------------
;	.file	"../led.c"
	.radix dec
	.include "kf8a100eng.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	.extern	_Init_MCU
	.extern	_Init_I2C_S
	.extern	_Init_Usart
	.extern	_UART_SendBuf
	.extern	_delay_ms
	.extern	_Init_Touch
	.extern	_Init_Touch_GPIO
	.extern	_USART_Send_num
	.extern	_delay_us
	.extern	_DoorState_Init
	.extern	_DoorState_Deal
	.extern	_Door_StatusGet
	.extern	__Parameter_Init_
	.extern	__CTouch_Scan_Process_
	.extern	__CTouch_Key_Init_
	.extern	__CTouch_Get_Baseline_
	.extern	__CTouch_Get_RawData_
	.extern	__CTouch_Get_Lib_Version_
	.extern	_ADC_Init
	.extern	_Adc_read
	.extern	_BAT_StateGet
	.extern	_key_init
	.extern	_key_read
	.extern	_key_state_set
	.extern	_key_deal
	.extern	_FLASH_READ_ONE
	.extern	_FLASH_READ_FUN
	.extern	_FLASH_WRITE_ONE
	.extern	_FLASH_WRITE_FUN
	.extern	_FLASH_Init
	.extern	_FLASH_Deal
	.extern	_Flash_data_set
	.extern	_set_savefalg
	.extern	_Timer0_Init
	.extern	_Timer1_Init
	.extern	_Timer4_Init
	.extern	_set_PWM1L
	.extern	_set_PWM2L
	.extern	_timer_init
	.extern	_P0_INT_init
	.extern	_get_pwmduty
	.extern	_pwm_deal
	.extern	_Clock_ClearSysLEDTimeStatus
	.extern	_Clock_GetSysLEDTimeStatus
	.extern	_processLED
	.extern	_STKR0
	.extern	_STK00
	.extern	_STK01
	.extern	_STK02
	.extern	_STK03
	.extern	_STK04
	.extern	_STK05
	.extern	_STK06
	.extern	_STK07
	.extern	_STK08
	.extern	_STK09
	.extern	_STK10
	.extern	_STK11
	.extern	_STK12
	.extern	_PSW_bits
	.extern	_P0_bits
	.extern	_P2_bits
	.extern	_P1_bits
	.extern	_INTCTL_bits
	.extern	_EIF1_bits
	.extern	_EIF2_bits
	.extern	_T1CTL_bits
	.extern	_PWMCTL_bits
	.extern	_BANK_bits
	.extern	_C1CTL_bits
	.extern	_VDACS_bits
	.extern	_AMPCTL_bits
	.extern	_ANSEH_bits
	.extern	_ADCCTL0_bits
	.extern	_AMPDT_bits
	.extern	_OPTR_bits
	.extern	_IP0_bits
	.extern	_IP1_bits
	.extern	_IP2_bits
	.extern	_TR0_bits
	.extern	_TR2_bits
	.extern	_TR1_bits
	.extern	_OSCSTA_bits
	.extern	_IP3_bits
	.extern	_VRECTL_bits
	.extern	_EIE1_bits
	.extern	_EIE2_bits
	.extern	_PCTL_bits
	.extern	_OSCCTL_bits
	.extern	_ANSEL_bits
	.extern	_PUR0_bits
	.extern	_IOCL_bits
	.extern	_ADCCTL1_bits
	.extern	_P0LR_bits
	.extern	_P2LR_bits
	.extern	_P1LR_bits
	.extern	_EIE3_bits
	.extern	_EIF3_bits
	.extern	_T3CTL_bits
	.extern	_CTCTL0_bits
	.extern	_PUR1_bits
	.extern	_PUR2_bits
	.extern	_CTCTL1_bits
	.extern	_INTEDGCTL_bits
	.extern	_VDAC_bits
	.extern	_VRES_bits
	.extern	_C1CAL_bits
	.extern	_RSCTL_bits
	.extern	_BRCTL_bits
	.extern	_TSCTL_bits
	.extern	_SSCICTL0_bits
	.extern	_SSCICTL1_bits
	.extern	_SSCISTA_bits
	.extern	_SSCIMSK_bits
	.extern	_WDTPS_bits
	.extern	_C1FILTCTL_bits
	.extern	_C1FILTPRE_bits
	.extern	_CTCTL2_bits
	.extern	_T4CTL_bits
	.extern	_Channel_Press_str
	.extern	_Channel_Num_lib
	.extern	_ON_debounce_times_lib
	.extern	_Data_Stream_Enable_lib
	.extern	_Press_On_Max_Time_lib
	.extern	_Data_Change_Disturb_Max_Channel
	.extern	_Protect_Mode_Release_Time_lib
	.extern	_Baseline_Update_Cnt_lib
	.extern	_Max_Key_Cnt_Lib
	.extern	_Touch_Int_Flg
	.extern	_Ref_Channel_Enable_lib
	.extern	_FLASH_BUFFER
	.extern	_CTouch_Channel_Tab
	.extern	_CTouch_Threshold_Tab
	.extern	_CTouch_Second_Key_Threshold_Tab
	.extern	_CTouch_Single_Hysteresis_Tab
	.extern	_CTouch_Noise_threshold_Tab
	.extern	_CTouch_Negative_Noise_threshold_Tab
	.extern	_CTouch_Max_Threshold_Tab
	.extern	_CTOUCH_VDAC_Tab
	.extern	_CTouch_Disturb_Noise_threshold_Tab
	.extern	_CTouch_Steady_Noise_threshold_Tab
	.extern	_T0
	.extern	_PCL
	.extern	_PSW
	.extern	_P0
	.extern	_P2
	.extern	_P1
	.extern	_PCH
	.extern	_INTCTL
	.extern	_EIF1
	.extern	_EIF2
	.extern	_T1L
	.extern	_T1H
	.extern	_T1CTL
	.extern	_PWM1L
	.extern	_PWMCTL
	.extern	_PP1
	.extern	_BANK
	.extern	_C1CTL
	.extern	_VDACS
	.extern	_AMPCTL
	.extern	_ANSEH
	.extern	_ADCDATA0H
	.extern	_ADCCTL0
	.extern	_AMPDT
	.extern	_OPTR
	.extern	_IP0
	.extern	_IP1
	.extern	_IP2
	.extern	_TR0
	.extern	_TR2
	.extern	_TR1
	.extern	_OSCSTA
	.extern	_IP3
	.extern	_VRECAL1
	.extern	_VRECTL
	.extern	_EIE1
	.extern	_EIE2
	.extern	_PCTL
	.extern	_OSCCTL
	.extern	_OSCCAL0
	.extern	_ANSEL
	.extern	_PP2
	.extern	_PWM2L
	.extern	_PUR0
	.extern	_IOCL
	.extern	_OSCCAL1
	.extern	_NVMDATAH
	.extern	_NVMDATAL
	.extern	_NVMADDRH
	.extern	_NVMADDRL
	.extern	_NVMCTL0
	.extern	_NVMCTL1
	.extern	_ADCDATA0L
	.extern	_ADCCTL1
	.extern	_P0LR
	.extern	_P2LR
	.extern	_P1LR
	.extern	_EIE3
	.extern	_EIF3
	.extern	_OSCCAL2
	.extern	_OSCCAL3
	.extern	_T3CTL
	.extern	_T3L
	.extern	_CTCTL0
	.extern	_T3H
	.extern	_PUR1
	.extern	_PUR2
	.extern	_CTCTL1
	.extern	_INTEDGCTL
	.extern	_VDAC
	.extern	_VRES
	.extern	_C1CAL
	.extern	_RSCTL
	.extern	_TXSDR
	.extern	_RXSDR
	.extern	_BRCTL
	.extern	_TSCTL
	.extern	_EUBRGL
	.extern	_EUBRGH
	.extern	_SSCICTL0
	.extern	_SSCICTL1
	.extern	_SSCISTA
	.extern	_SSCIBUFR
	.extern	_SSCIADD
	.extern	_SSCIMSK
	.extern	_WDTPS
	.extern	_C1FILTCTL
	.extern	_C1FILTPRE
	.extern	_VRECAL2
	.extern	_VRECAL3
	.extern	_CTCTL2
	.extern	_T4L
	.extern	_T4H
	.extern	_T4REL
	.extern	_T4REH
	.extern	_T4CTL
	.extern	_RC32KCAL

	.extern I0R1
	.extern I0R7
	.extern I0PSW
	.extern I0PCH
	.extern I1R1
	.extern I1R7
	.extern I1PSW
	.extern I1PCH
	.extern STK12
	.extern STK11
	.extern STK10
	.extern STK09
	.extern STK08
	.extern STK07
	.extern STK06
	.extern STK05
	.extern STK04
	.extern STK03
	.extern STK02
	.extern STK01
	.extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	.global	_led_deal
	.global	_set_led
	.global	_led
	.global	_led2
	.define _STK12	STK12
	.define _STK11	STK11
	.define _STK10	STK10
	.define _STK09	STK09
	.define _STK08	STK08
	.define _STK07	STK07
	.define _STK06	STK06
	.define _STK05	STK05
	.define _STK04	STK04
	.define _STK03	STK03
	.define _STK02	STK02
	.define _STK01	STK01
	.define _STK00	STK00

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
UD_led_0	.udata
_led	.res	2

UD_led_1	.udata
_led2	.res	2

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_led_0	.udata
r0x1005	.res	1
UDL_led_1	.udata
r0x1006	.res	1
UDL_led_2	.udata
r0x1007	.res	1
UDL_led_3	.udata
r0x1008	.res	1
UDL_led_4	.udata
r0x1009	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_led_0	.idata
_pointer
	.db	0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	.udata_ovr


func._led_deal	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _led_deal	;Function start
; 2 exit points
;has an exit
;functions called:
;   _Door_StatusGet
;   _set_led
;   _set_led
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _set_led
;   _set_led
;   _set_led
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _set_led
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _set_led
;   _set_led
;   _set_led
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _set_led
;   _Clock_GetSysLEDTimeStatus
;   _Clock_ClearSysLEDTimeStatus
;   _set_PWM1L
;   _set_led
;   _Clock_GetSysLEDTimeStatus
;   _Clock_ClearSysLEDTimeStatus
;   _set_PWM1L
;   _set_led
;   _set_PWM1L
;   _set_PWM1L
;   _Clock_GetSysLEDTimeStatus
;   _Clock_ClearSysLEDTimeStatus
;   _set_PWM2L
;   _set_led
;   _Clock_GetSysLEDTimeStatus
;   _Clock_ClearSysLEDTimeStatus
;   _set_PWM2L
;   _set_led
;   _set_PWM2L
;   _set_PWM2L
;   _Door_StatusGet
;   _set_led
;   _set_led
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _set_led
;   _set_led
;   _set_led
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _set_led
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _set_led
;   _set_led
;   _set_led
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _Clock_ClearSysLEDTimeStatus
;   _set_led
;   _set_led
;   _Clock_GetSysLEDTimeStatus
;   _Clock_ClearSysLEDTimeStatus
;   _set_PWM1L
;   _set_led
;   _Clock_GetSysLEDTimeStatus
;   _Clock_ClearSysLEDTimeStatus
;   _set_PWM1L
;   _set_led
;   _set_PWM1L
;   _set_PWM1L
;   _Clock_GetSysLEDTimeStatus
;   _Clock_ClearSysLEDTimeStatus
;   _set_PWM2L
;   _set_led
;   _Clock_GetSysLEDTimeStatus
;   _Clock_ClearSysLEDTimeStatus
;   _set_PWM2L
;   _set_led
;   _set_PWM2L
;   _set_PWM2L
;4 compiler assigned registers:
;   r0x1008
;   STK01
;   STK00
;   r0x1009
;; Starting PostCode block
;	.def _led_deal_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_led_deal	;Function start
; 2 exit points
;	::->op : CALL
;	.line	42; "../led.c"	switch(Door_StatusGet())
	PAGESEL	_Door_StatusGet
	CALL	_Door_StatusGet
	PAGESEL	$
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : <
;unsigned compare: left < lit(0xA=10), size=1
	MOV	R0,# 0x0a
	BANKSEL	r0x1008
	SUB	R0, r0x1008
;comparing bytes at offset 0
	JB	PSW, 0
	JMP	_00088_DS_
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x17=23), size=1
	MOV	R0,# 0x17
	BANKSEL	r0x1008
	SUB	R0, r0x1008
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00088_DS_
;	::->op : -
	MOV	R0,# 0xf6
	BANKSEL	r0x1008
	ADD	r0x1008, R0
;	::->op : JUMPTABLE
	MOV	R0,#high _00176_DS_
	MOV	PCH, R0
	MOV	R0,#_00176_DS_
	BANKSEL	r0x1008
	ADD	R0, r0x1008
	JNB	PSW, 0
	INC	PCH
	MOV	PCL, R0
_00176_DS_
	JMP	_00019_DS_
	JMP	_00014_DS_
	JMP	_00009_DS_
	JMP	_00088_DS_
	JMP	_00033_DS_
	JMP	_00024_DS_
	JMP	_00048_DS_
	JMP	_00043_DS_
	JMP	_00042_DS_
	JMP	_00067_DS_
	JMP	_00062_DS_
	JMP	_00053_DS_
	JMP	_00078_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00009_DS_
;	.line	62; "../led.c"	if(led.status == Ind_Off)
	BANKSEL	_led
	MOVZ	R0,  (_led + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JB	PSW, 2
	JMP	_00011_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	64; "../led.c"	set_led(1,DoorSW,Ind_On);
	MOV	R0,# 0x01
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00011_DS_
;	.line	67; "../led.c"	if(led2.status == Ind_Off)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JB	PSW, 2
	JMP	_00088_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	69; "../led.c"	set_led(2,DoorSW,Ind_On);
	MOV	R0,# 0x01
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : GOTO
;	.line	72; "../led.c"	break;
	JMP	_00088_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00014_DS_
;	.line	74; "../led.c"	if(led.status == Ind_Off)
	BANKSEL	_led
	MOVZ	R0,  (_led + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JB	PSW, 2
	JMP	_00016_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	76; "../led.c"	set_led(1,DoorSW,Ind_up);
	MOV	R0,# 0x02
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : =
;	.line	77; "../led.c"	pointer = 0;   //占空比从0 -> 100
	BANKSEL	_pointer
	CLR	_pointer
;	::->op : CALL
;	.line	78; "../led.c"	Clock_ClearSysLEDTimeStatus();  //清除定时器 待完善
	PAGESEL	_Clock_ClearSysLEDTimeStatus
	CALL	_Clock_ClearSysLEDTimeStatus
	PAGESEL	$
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00016_DS_
;	.line	81; "../led.c"	if(led2.status == Ind_Off)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JB	PSW, 2
	JMP	_00088_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	83; "../led.c"	set_led(2,DoorSW,Ind_up);
	MOV	R0,# 0x02
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : =
;	.line	84; "../led.c"	pointer = 0;   //占空比从0 -> 100
	BANKSEL	_pointer
	CLR	_pointer
;	::->op : CALL
;	.line	85; "../led.c"	Clock_ClearSysLEDTimeStatus();  //清除定时器 待完善
	PAGESEL	_Clock_ClearSysLEDTimeStatus
	CALL	_Clock_ClearSysLEDTimeStatus
	PAGESEL	$
;	::->op : GOTO
;	.line	88; "../led.c"	break;
	JMP	_00088_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00019_DS_
;	.line	90; "../led.c"	if(led.status == Ind_Off)
	BANKSEL	_led
	MOVZ	R0,  (_led + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JB	PSW, 2
	JMP	_00021_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	92; "../led.c"	set_led(1,DoorSW,Ind_On);
	MOV	R0,# 0x01
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00021_DS_
;	.line	96; "../led.c"	if(led2.status == Ind_Off)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JB	PSW, 2
	JMP	_00088_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	98; "../led.c"	set_led(2,DoorSW,Ind_On);
	MOV	R0,# 0x01
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : GOTO
;	.line	101; "../led.c"	break;
	JMP	_00088_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00024_DS_
;	.line	104; "../led.c"	if(led.status == Ind_On)
	BANKSEL	_led
	MOVZ	R0,  (_led + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00028_DS_
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	106; "../led.c"	if(led.key != LeftReadLightSW)
	BANKSEL	_led
	MOVZ	R0,  (_led + 0)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
;	.line	108; "../led.c"	set_led(1,DoorSW,Ind_Off);
	XOR	R0,# 0x01
	JNB	PSW, 2
	JMP	_00028_DS_
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00028_DS_
;	.line	114; "../led.c"	if(led2.status == Ind_On)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00088_DS_
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	116; "../led.c"	if(led2.key != RightReadLightSW)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 0)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JNB	PSW, 2
	JMP	_00088_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	119; "../led.c"	set_led(2,DoorSW,Ind_Off);
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : GOTO
;	.line	124; "../led.c"	break;
	JMP	_00088_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00033_DS_
;	.line	128; "../led.c"	if(led.status == Ind_On)
	BANKSEL	_led
	MOVZ	R0,  (_led + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00037_DS_
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	130; "../led.c"	if(led.key != LeftReadLightSW)
	BANKSEL	_led
	MOVZ	R0,  (_led + 0)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
;	.line	132; "../led.c"	set_led(1,DoorSW,Ind_down);
	XOR	R0,# 0x01
	JNB	PSW, 2
	JMP	_00037_DS_
	MOV	R0,# 0x03
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : =
;	.line	134; "../led.c"	pointer = 80;
	MOV	R0,# 0x50
	BANKSEL	_pointer
	MOV	_pointer, R0
;	::->op : CALL
;	.line	135; "../led.c"	Clock_ClearSysLEDTimeStatus();
	PAGESEL	_Clock_ClearSysLEDTimeStatus
	CALL	_Clock_ClearSysLEDTimeStatus
	PAGESEL	$
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00037_DS_
;	.line	140; "../led.c"	if(led2.status == Ind_On)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00088_DS_
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	142; "../led.c"	if(led2.key != RightReadLightSW)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 0)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JNB	PSW, 2
	JMP	_00088_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	144; "../led.c"	set_led(2,DoorSW,Ind_down);
	MOV	R0,# 0x03
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : =
;	.line	146; "../led.c"	pointer = 80;
	MOV	R0,# 0x50
	BANKSEL	_pointer
	MOV	_pointer, R0
;	::->op : CALL
;	.line	147; "../led.c"	Clock_ClearSysLEDTimeStatus();
	PAGESEL	_Clock_ClearSysLEDTimeStatus
	CALL	_Clock_ClearSysLEDTimeStatus
	PAGESEL	$
;	::->op : GOTO
;	.line	151; "../led.c"	break;
	JMP	_00088_DS_
;	::->op : LABEL
;	::->op : GOTO
_00042_DS_
;	.line	155; "../led.c"	break;
	JMP	_00088_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00043_DS_
;	.line	158; "../led.c"	if(led.status == Ind_Off)
	BANKSEL	_led
	MOVZ	R0,  (_led + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JB	PSW, 2
	JMP	_00045_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	160; "../led.c"	set_led(1,DoorSW,Ind_On);
	MOV	R0,# 0x01
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00045_DS_
;	.line	163; "../led.c"	if(led2.status == Ind_Off)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JB	PSW, 2
	JMP	_00088_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	165; "../led.c"	set_led(2,DoorSW,Ind_On);
	MOV	R0,# 0x01
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : GOTO
;	.line	167; "../led.c"	break;
	JMP	_00088_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00048_DS_
;	.line	169; "../led.c"	if(led.status == Ind_Off)
	BANKSEL	_led
	MOVZ	R0,  (_led + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JB	PSW, 2
	JMP	_00050_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	171; "../led.c"	set_led(1,DoorSW,Ind_up);
	MOV	R0,# 0x02
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : =
;	.line	172; "../led.c"	pointer = 0;
	BANKSEL	_pointer
	CLR	_pointer
;	::->op : CALL
;	.line	173; "../led.c"	Clock_ClearSysLEDTimeStatus();
	PAGESEL	_Clock_ClearSysLEDTimeStatus
	CALL	_Clock_ClearSysLEDTimeStatus
	PAGESEL	$
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00050_DS_
;	.line	176; "../led.c"	if(led2.status == Ind_Off)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JB	PSW, 2
	JMP	_00088_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	178; "../led.c"	set_led(2,DoorSW,Ind_up);
	MOV	R0,# 0x02
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : =
;	.line	179; "../led.c"	pointer = 0;
	BANKSEL	_pointer
	CLR	_pointer
;	::->op : CALL
;	.line	180; "../led.c"	Clock_ClearSysLEDTimeStatus();
	PAGESEL	_Clock_ClearSysLEDTimeStatus
	CALL	_Clock_ClearSysLEDTimeStatus
	PAGESEL	$
;	::->op : GOTO
;	.line	183; "../led.c"	break;
	JMP	_00088_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00053_DS_
;	.line	185; "../led.c"	if(led.status == Ind_On)
	BANKSEL	_led
	MOVZ	R0,  (_led + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00057_DS_
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	187; "../led.c"	if(led.key != LeftReadLightSW)//if(indInfo[LeftReadLight].key == DoorSW)
	BANKSEL	_led
	MOVZ	R0,  (_led + 0)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
;	.line	189; "../led.c"	set_led(1,DoorSW,Ind_Off);
	XOR	R0,# 0x01
	JNB	PSW, 2
	JMP	_00057_DS_
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00057_DS_
;	.line	193; "../led.c"	if(led2.status == Ind_On)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00088_DS_
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	195; "../led.c"	if(led2.key != RightReadLightSW)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 0)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JNB	PSW, 2
	JMP	_00088_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	197; "../led.c"	set_led(2,DoorSW,Ind_Off);
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : GOTO
;	.line	201; "../led.c"	break;
	JMP	_00088_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00062_DS_
;	.line	204; "../led.c"	if(led.status == Ind_Off)
	BANKSEL	_led
	MOVZ	R0,  (_led + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JB	PSW, 2
	JMP	_00064_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	207; "../led.c"	set_led(1,DoorSW,Ind_On);
	MOV	R0,# 0x01
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00064_DS_
;	.line	211; "../led.c"	if(led2.status == Ind_Off)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JB	PSW, 2
	JMP	_00088_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	214; "../led.c"	set_led(2,DoorSW,Ind_On);
	MOV	R0,# 0x01
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : GOTO
;	.line	218; "../led.c"	break;
	JMP	_00088_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00067_DS_
;	.line	221; "../led.c"	if(led.status == Ind_On || led.status == Ind_up)
	BANKSEL	_led
	MOVZ	R0,  (_led + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
	XOR	R0,# 0x01
	JNB	PSW, 2
	JMP	_00070_DS_
	BANKSEL	_led
	MOVZ	R0,  (_led + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
	XOR	R0,# 0x02
	JB	PSW, 2
	JMP	_00071_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00070_DS_
;	.line	223; "../led.c"	if(led.key != LeftReadLightSW)//if(indInfo[LeftReadLight].key == DoorSW)
	BANKSEL	_led
	MOVZ	R0,  (_led + 0)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
;	.line	225; "../led.c"	set_led(1,DoorSW,Ind_down);
	XOR	R0,# 0x01
	JNB	PSW, 2
	JMP	_00071_DS_
	MOV	R0,# 0x03
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : =
;	.line	228; "../led.c"	pointer = 80;
	MOV	R0,# 0x50
	BANKSEL	_pointer
	MOV	_pointer, R0
;	::->op : CALL
;	.line	229; "../led.c"	Clock_ClearSysLEDTimeStatus();
	PAGESEL	_Clock_ClearSysLEDTimeStatus
	CALL	_Clock_ClearSysLEDTimeStatus
	PAGESEL	$
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00071_DS_
;	.line	233; "../led.c"	if(led2.status == Ind_On || led2.status == Ind_up)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
	XOR	R0,# 0x01
	JNB	PSW, 2
	JMP	_00075_DS_
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
	XOR	R0,# 0x02
	JB	PSW, 2
	JMP	_00088_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00075_DS_
;	.line	235; "../led.c"	if(led2.key != RightReadLightSW)//if(indInfo[LeftReadLight].key == DoorSW)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 0)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JNB	PSW, 2
	JMP	_00088_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	237; "../led.c"	set_led(2,DoorSW,Ind_down);
	MOV	R0,# 0x03
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : =
;	.line	240; "../led.c"	pointer = 80;
	MOV	R0,# 0x50
	BANKSEL	_pointer
	MOV	_pointer, R0
;	::->op : CALL
;	.line	241; "../led.c"	Clock_ClearSysLEDTimeStatus();
	PAGESEL	_Clock_ClearSysLEDTimeStatus
	CALL	_Clock_ClearSysLEDTimeStatus
	PAGESEL	$
;	::->op : GOTO
;	.line	245; "../led.c"	break;
	JMP	_00088_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00078_DS_
;	.line	247; "../led.c"	if(led.status == Ind_On)
	BANKSEL	_led
	MOVZ	R0,  (_led + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00082_DS_
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	249; "../led.c"	if(led.key != LeftReadLightSW)//if(indInfo[LeftReadLight].key == DoorSW)
	BANKSEL	_led
	MOVZ	R0,  (_led + 0)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
;	.line	251; "../led.c"	set_led(1,DoorSW,Ind_Off);
	XOR	R0,# 0x01
	JNB	PSW, 2
	JMP	_00082_DS_
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00082_DS_
;	.line	257; "../led.c"	if(led2.status == Ind_On)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00088_DS_
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	259; "../led.c"	if(led2.key != RightReadLightSW)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 0)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1008
	ORL	R0, r0x1008
	JNB	PSW, 2
	JMP	_00088_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	261; "../led.c"	set_led(2,DoorSW,Ind_Off);
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : GOTO
;	.line	267; "../led.c"	break;
	JMP	_00088_DS_
;	::->op : LABEL
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00088_DS_
;	.line	273; "../led.c"	switch(led.status)
	BANKSEL	_led
	MOVZ	R0,  (_led + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x4=4), size=1
	MOV	R0,# 0x04
	BANKSEL	r0x1008
	SUB	R0, r0x1008
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00105_DS_
;	::->op : JUMPTABLE
	MOV	R0,#high _00185_DS_
	MOV	PCH, R0
	MOV	R0,#_00185_DS_
	BANKSEL	r0x1008
	ADD	R0, r0x1008
	JNB	PSW, 0
	INC	PCH
	MOV	PCL, R0
_00185_DS_
	JMP	_00103_DS_
	JMP	_00102_DS_
	JMP	_00089_DS_
	JMP	_00096_DS_
;	::->op : LABEL
;	::->op : CALL
_00089_DS_
;	.line	276; "../led.c"	if(Clock_GetSysLEDTimeStatus()>3)   //0.00204s * 343 ≈ 0.7S
	PAGESEL	_Clock_GetSysLEDTimeStatus
	CALL	_Clock_GetSysLEDTimeStatus
	PAGESEL	$
	BANKSEL	r0x1009
	MOV	r0x1009, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x4=4), size=2
	MOV	R0,# 0x00
	BANKSEL	r0x1009
	SUB	R0, r0x1009
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00186_DS_
	MOV	R0,# 0x04
	BANKSEL	r0x1008
	SUB	R0, r0x1008
_00186_DS_
	JB	PSW, 0
	JMP	_00091_DS_
;	::->op : +
;	.line	278; "../led.c"	pointer++;
	BANKSEL	_pointer
	INC	_pointer
;	::->op : CALL
;	.line	279; "../led.c"	Clock_ClearSysLEDTimeStatus();
	PAGESEL	_Clock_ClearSysLEDTimeStatus
	CALL	_Clock_ClearSysLEDTimeStatus
	PAGESEL	$
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x50=80), size=1
_00091_DS_
;	.line	282; "../led.c"	if(pointer < 80 || pointer == 80)
	MOV	R0,# 0x50
	BANKSEL	_pointer
	SUB	R0, _pointer
;comparing bytes at offset 0
	JB	PSW, 0
	JMP	_00092_DS_
;	::->op : EQ_OP
	BANKSEL	_pointer
	MOVZ	R0, _pointer
	XOR	R0,# 0x50
	JB	PSW, 2
	JMP	_00093_DS_
;	::->op : LABEL
;	::->op : SEND
;	::->op : CALL
_00092_DS_
;	.line	284; "../led.c"	set_PWM1L(pointer);
	BANKSEL	_pointer
	MOVZ	R0, _pointer
	PAGESEL	_set_PWM1L
	CALL	_set_PWM1L
	PAGESEL	$
;	::->op : GOTO
	JMP	_00105_DS_
;	::->op : LABEL
;	::->op : =
_00093_DS_
;	.line	288; "../led.c"	pointer = 80;
	MOV	R0,# 0x50
	BANKSEL	_pointer
	MOV	_pointer, R0
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	289; "../led.c"	set_led(1,DoorSW,Ind_On);
	MOV	R0,# 0x01
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : GOTO
;	.line	291; "../led.c"	break;
	JMP	_00105_DS_
;	::->op : LABEL
;	::->op : CALL
_00096_DS_
;	.line	294; "../led.c"	if(Clock_GetSysLEDTimeStatus()>6)   //0.00204s * 686 ≈ 1.4S
	PAGESEL	_Clock_GetSysLEDTimeStatus
	CALL	_Clock_GetSysLEDTimeStatus
	PAGESEL	$
	BANKSEL	r0x1009
	MOV	r0x1009, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x7=7), size=2
	MOV	R0,# 0x00
	BANKSEL	r0x1009
	SUB	R0, r0x1009
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00188_DS_
	MOV	R0,# 0x07
	BANKSEL	r0x1008
	SUB	R0, r0x1008
_00188_DS_
	JB	PSW, 0
	JMP	_00098_DS_
;	::->op : -
;	.line	296; "../led.c"	pointer--;
	BANKSEL	_pointer
	DEC	_pointer
;	::->op : CALL
;	.line	297; "../led.c"	Clock_ClearSysLEDTimeStatus();
	PAGESEL	_Clock_ClearSysLEDTimeStatus
	CALL	_Clock_ClearSysLEDTimeStatus
	PAGESEL	$
;	::->op : LABEL
;	::->op : IFX
_00098_DS_
;	.line	300; "../led.c"	if(pointer > 0)
	MOV	R0,# 0x00
	BANKSEL	_pointer
	ORL	R0, _pointer
	JNB	PSW, 2
	JMP	_00100_DS_
;	::->op : SEND
;	::->op : CALL
;	.line	302; "../led.c"	set_PWM1L(pointer);
	BANKSEL	_pointer
	MOVZ	R0, _pointer
	PAGESEL	_set_PWM1L
	CALL	_set_PWM1L
	PAGESEL	$
;	::->op : GOTO
	JMP	_00105_DS_
;	::->op : LABEL
;	::->op : =
_00100_DS_
;	.line	306; "../led.c"	pointer = 0;
	BANKSEL	_pointer
	CLR	_pointer
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	307; "../led.c"	set_led(1,DoorSW,Ind_Off);
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : GOTO
;	.line	309; "../led.c"	break;
	JMP	_00105_DS_
;	::->op : LABEL
;	::->op : SEND
;	::->op : CALL
_00102_DS_
;	.line	311; "../led.c"	set_PWM1L(80);
	MOV	R0,# 0x50
	PAGESEL	_set_PWM1L
	CALL	_set_PWM1L
	PAGESEL	$
;	::->op : GOTO
;	.line	312; "../led.c"	break;
	JMP	_00105_DS_
;	::->op : LABEL
;	::->op : SEND
;	::->op : CALL
_00103_DS_
;	.line	314; "../led.c"	set_PWM1L(0);
	MOV	R0,# 0x00
	PAGESEL	_set_PWM1L
	CALL	_set_PWM1L
	PAGESEL	$
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00105_DS_
;	.line	325; "../led.c"	switch(led2.status)
	BANKSEL	_led2
	MOVZ	R0,  (_led2 + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x4=4), size=1
	MOV	R0,# 0x04
	BANKSEL	r0x1008
	SUB	R0, r0x1008
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00126_DS_
;	::->op : JUMPTABLE
	MOV	R0,#high _00190_DS_
	MOV	PCH, R0
	MOV	R0,#_00190_DS_
	BANKSEL	r0x1008
	ADD	R0, r0x1008
	JNB	PSW, 0
	INC	PCH
	MOV	PCL, R0
_00190_DS_
	JMP	_00123_DS_
	JMP	_00122_DS_
	JMP	_00106_DS_
	JMP	_00114_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00106_DS_
;	.line	330; "../led.c"	if(led.status != Ind_up)  //如果同时渐亮 不操作
	BANKSEL	_led
	MOVZ	R0,  (_led + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
;	.line	332; "../led.c"	if(Clock_GetSysLEDTimeStatus()>3)
	XOR	R0,# 0x02
	JNB	PSW, 2
	JMP	_00110_DS_
	PAGESEL	_Clock_GetSysLEDTimeStatus
	CALL	_Clock_GetSysLEDTimeStatus
	PAGESEL	$
	BANKSEL	r0x1009
	MOV	r0x1009, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x4=4), size=2
	MOV	R0,# 0x00
	BANKSEL	r0x1009
	SUB	R0, r0x1009
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00192_DS_
	MOV	R0,# 0x04
	BANKSEL	r0x1008
	SUB	R0, r0x1008
_00192_DS_
	JB	PSW, 0
	JMP	_00110_DS_
;	::->op : +
;	.line	334; "../led.c"	pointer++;
	BANKSEL	_pointer
	INC	_pointer
;	::->op : CALL
;	.line	335; "../led.c"	Clock_ClearSysLEDTimeStatus();
	PAGESEL	_Clock_ClearSysLEDTimeStatus
	CALL	_Clock_ClearSysLEDTimeStatus
	PAGESEL	$
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x50=80), size=1
_00110_DS_
;	.line	339; "../led.c"	if(pointer < 80)
	MOV	R0,# 0x50
	BANKSEL	_pointer
	SUB	R0, _pointer
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00112_DS_
;	::->op : SEND
;	::->op : CALL
;	.line	341; "../led.c"	set_PWM2L(pointer);
	BANKSEL	_pointer
	MOVZ	R0, _pointer
	PAGESEL	_set_PWM2L
	CALL	_set_PWM2L
	PAGESEL	$
;	::->op : GOTO
	JMP	_00126_DS_
;	::->op : LABEL
;	::->op : =
_00112_DS_
;	.line	345; "../led.c"	pointer = 80;
	MOV	R0,# 0x50
	BANKSEL	_pointer
	MOV	_pointer, R0
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	347; "../led.c"	set_led(2,DoorSW,Ind_On);
	MOV	R0,# 0x01
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : GOTO
;	.line	349; "../led.c"	break;
	JMP	_00126_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00114_DS_
;	.line	352; "../led.c"	if(led.status != Ind_down)  //如果同时渐亮 不操作
	BANKSEL	_led
	MOVZ	R0,  (_led + 1)
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : EQ_OP
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
;	.line	354; "../led.c"	if(Clock_GetSysLEDTimeStatus()>6)
	XOR	R0,# 0x03
	JNB	PSW, 2
	JMP	_00118_DS_
	PAGESEL	_Clock_GetSysLEDTimeStatus
	CALL	_Clock_GetSysLEDTimeStatus
	PAGESEL	$
	BANKSEL	r0x1009
	MOV	r0x1009, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x7=7), size=2
	MOV	R0,# 0x00
	BANKSEL	r0x1009
	SUB	R0, r0x1009
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00195_DS_
	MOV	R0,# 0x07
	BANKSEL	r0x1008
	SUB	R0, r0x1008
_00195_DS_
	JB	PSW, 0
	JMP	_00118_DS_
;	::->op : -
;	.line	356; "../led.c"	pointer--;
	BANKSEL	_pointer
	DEC	_pointer
;	::->op : CALL
;	.line	357; "../led.c"	Clock_ClearSysLEDTimeStatus();
	PAGESEL	_Clock_ClearSysLEDTimeStatus
	CALL	_Clock_ClearSysLEDTimeStatus
	PAGESEL	$
;	::->op : LABEL
;	::->op : IFX
_00118_DS_
;	.line	361; "../led.c"	if(pointer > 0)
	MOV	R0,# 0x00
	BANKSEL	_pointer
	ORL	R0, _pointer
	JNB	PSW, 2
	JMP	_00120_DS_
;	::->op : SEND
;	::->op : CALL
;	.line	363; "../led.c"	set_PWM2L(pointer);
	BANKSEL	_pointer
	MOVZ	R0, _pointer
	PAGESEL	_set_PWM2L
	CALL	_set_PWM2L
	PAGESEL	$
;	::->op : GOTO
	JMP	_00126_DS_
;	::->op : LABEL
;	::->op : =
_00120_DS_
;	.line	367; "../led.c"	pointer = 0;
	BANKSEL	_pointer
	CLR	_pointer
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	369; "../led.c"	set_led(2,DoorSW,Ind_Off);
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x03
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : GOTO
;	.line	371; "../led.c"	break;
	JMP	_00126_DS_
;	::->op : LABEL
;	::->op : SEND
;	::->op : CALL
_00122_DS_
;	.line	373; "../led.c"	set_PWM2L(80);
	MOV	R0,# 0x50
	PAGESEL	_set_PWM2L
	CALL	_set_PWM2L
	PAGESEL	$
;	::->op : GOTO
;	.line	374; "../led.c"	break;
	JMP	_00126_DS_
;	::->op : LABEL
;	::->op : SEND
;	::->op : CALL
_00123_DS_
;	.line	376; "../led.c"	set_PWM2L(0);
	MOV	R0,# 0x00
	PAGESEL	_set_PWM2L
	CALL	_set_PWM2L
	PAGESEL	$
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00126_DS_
;	.line	380; "../led.c"	}
	CRET	
;	.def _led_deal_function_end, debug, value=$

; exit point of _led_deal



func._set_led	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _set_led	;Function start
; 2 exit points
;has an exit
;5 compiler assigned registers:
;   r0x1005
;   STK00
;   r0x1006
;   STK01
;   r0x1007
;; Starting PostCode block
;	.def _set_led_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_set_led	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	20; "../led.c"	void set_led(uint8_t ch,uint8_t sw,uint8_t led_status)
	BANKSEL	r0x1005
	MOV	r0x1005, R0
;	::->op : RECEIVE
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1006
	MOV	r0x1006, R0
;	::->op : RECEIVE
	BANKSEL	STK01
	MOVZ	R0, STK01
	BANKSEL	r0x1007
	MOV	r0x1007, R0
;	::->op : EQ_OP
;	.line	22; "../led.c"	if(ch == 1) //LED1
	BANKSEL	r0x1005
	MOVZ	R0, r0x1005
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00002_DS_
;	::->op :*  =
;	.line	24; "../led.c"	led.key = sw;
	BANKSEL	r0x1006
	MOVZ	R0, r0x1006
	BANKSEL	_led
	MOV	 (_led + 0), R0
;	::->op :*  =
;	.line	25; "../led.c"	led.status = led_status;
	BANKSEL	r0x1007
	MOVZ	R0, r0x1007
	BANKSEL	_led
	MOV	 (_led + 1), R0
;	::->op : LABEL
;	::->op : EQ_OP
_00002_DS_
;	.line	28; "../led.c"	if(ch == 2)
	BANKSEL	r0x1005
	MOVZ	R0, r0x1005
	XOR	R0,# 0x02
	JB	PSW, 2
	JMP	_00005_DS_
;	::->op :*  =
;	.line	30; "../led.c"	led2.key = sw;
	BANKSEL	r0x1006
	MOVZ	R0, r0x1006
	BANKSEL	_led2
	MOV	 (_led2 + 0), R0
;	::->op :*  =
;	.line	31; "../led.c"	led2.status = led_status;
	BANKSEL	r0x1007
	MOVZ	R0, r0x1007
	BANKSEL	_led2
	MOV	 (_led2 + 1), R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00005_DS_
	CRET	
;	.def _set_led_function_end, debug, value=$

; exit point of _set_led


;	code size estimation:
;	  703+  233 =   936 instructions ( 2338 byte)

;	.type _set_led,  32
;	.dim _set_led, 1, (_set_led_function_end&0xFF00)>>8, _set_led_function_end&0xFF,0,20,0,33 , 2, 1
;	.type _led_deal,  32
;	.dim _led_deal, 1, (_led_deal_function_end&0xFF00)>>8, _led_deal_function_end&0xFF,0,40,1,128 , 1, 1

	.end
