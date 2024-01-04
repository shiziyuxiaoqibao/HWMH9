;--------------------------------------------------------
; File Created by ChiponCC : ChipON  inc.
;--------------------------------------------------------
; chipon port for the 16-bit core
;--------------------------------------------------------
;	.file	"../pwm.c"
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
	.extern	_set_led
	.extern	_led_deal
	.extern	_processLED
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
	.global	_Door_StatusGet
	.global	_DoorState_Deal
	.global	_DoorState_Init
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
UD_pwm_0	.udata
_doorStatus	.res	1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_pwm_0	.udata
r0x1001	.res	1
UDL_pwm_1	.udata
r0x1002	.res	1
UDL_pwm_2	.udata
r0x1003	.res	1
UDL_pwm_3	.udata
r0x1004	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	.udata_ovr


func._Door_StatusGet	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Door_StatusGet	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	.def _Door_StatusGet_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Door_StatusGet	;Function start
; 2 exit points
;	::->op : RETURN
;	.line	158; "../pwm.c"	return doorStatus;
	BANKSEL	_doorStatus
	MOVZ	R0, _doorStatus
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _Door_StatusGet_function_end, debug, value=$

; exit point of _Door_StatusGet



func._DoorState_Deal	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _DoorState_Deal	;Function start
; 2 exit points
;has an exit
;functions called:
;   _get_pwmduty
;   _get_pwmduty
;   _get_pwmduty
;   _get_pwmduty
;4 compiler assigned registers:
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;; Starting PostCode block
;	.def _DoorState_Deal_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_DoorState_Deal	;Function start
; 2 exit points
;	::->op : CALL
;	.line	24; "../pwm.c"	duty_get = get_pwmduty();
	PAGESEL	_get_pwmduty
	CALL	_get_pwmduty
	PAGESEL	$
	BANKSEL	r0x1001
	MOV	r0x1001, R0
;	::->op : =
;	.line	25; "../pwm.c"	for (i = 0; i < 5; i++)
	MOV	R0,# 0x05
	BANKSEL	r0x1002
	MOV	r0x1002, R0
;	::->op : =
	BANKSEL	r0x1003
	CLR	r0x1003
;	::->op : LABEL
;	::->op : CALL
_00075_DS_
;	.line	27; "../pwm.c"	if(get_pwmduty() == duty_get)
	PAGESEL	_get_pwmduty
	CALL	_get_pwmduty
	PAGESEL	$
	BANKSEL	r0x1004
	MOV	r0x1004, R0
;	::->op : EQ_OP
	BANKSEL	r0x1001
	MOVZ	R0, r0x1001
;	.line	28; "../pwm.c"	flag++;
	BANKSEL	r0x1004
	XOR	R0, r0x1004
	JB	PSW, 2
	JMP	_00112_DS_
	BANKSEL	r0x1003
	INC	r0x1003
_00112_DS_
	BANKSEL	r0x1002
	MOVZ	R0, r0x1002
	BANKSEL	r0x1004
	MOV	r0x1004, R0
;	::->op : -
	BANKSEL	r0x1004
	DEC	r0x1004
;	::->op : CAST
	BANKSEL	r0x1004
	MOVZ	R0, r0x1004
	BANKSEL	r0x1002
	MOV	r0x1002, R0
;	::->op : IFX
;	.line	25; "../pwm.c"	for (i = 0; i < 5; i++)
	MOV	R0,# 0x00
	BANKSEL	r0x1002
	ORL	R0, r0x1002
	JB	PSW, 2
	JMP	_00075_DS_
;	::->op : <
;unsigned compare: left < lit(0x5=5), size=1
;	.line	31; "../pwm.c"	if(flag >= 5) //6次获取同样值
	MOV	R0,# 0x05
	BANKSEL	r0x1003
	SUB	R0, r0x1003
;comparing bytes at offset 0
	JB	PSW, 0
	JMP	_00076_DS_
;	::->op : <
;unsigned compare: left < lit(0x5F=95), size=1
;	.line	33; "../pwm.c"	if(duty_get >= 95)
	MOV	R0,# 0x5f
	BANKSEL	r0x1001
	SUB	R0, r0x1001
;comparing bytes at offset 0
	JB	PSW, 0
	JMP	_00015_DS_
;	::->op : =
;	.line	34; "../pwm.c"	duty = 100;
	MOV	R0,# 0x64
	BANKSEL	r0x1002
	MOV	r0x1002, R0
;	::->op : GOTO
	JMP	_00016_DS_
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x50=80), size=1
_00015_DS_
;	.line	36; "../pwm.c"	if(duty_get >= 80)
	MOV	R0,# 0x50
	BANKSEL	r0x1001
	SUB	R0, r0x1001
;comparing bytes at offset 0
	JB	PSW, 0
	JMP	_00012_DS_
;	::->op : =
;	.line	37; "../pwm.c"	duty = 80;
	MOV	R0,# 0x50
	BANKSEL	r0x1002
	MOV	r0x1002, R0
;	::->op : GOTO
	JMP	_00016_DS_
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x3C=60), size=1
_00012_DS_
;	.line	39; "../pwm.c"	if(duty_get >= 60)
	MOV	R0,# 0x3c
	BANKSEL	r0x1001
	SUB	R0, r0x1001
;comparing bytes at offset 0
	JB	PSW, 0
	JMP	_00009_DS_
;	::->op : =
;	.line	40; "../pwm.c"	duty = 60;
	MOV	R0,# 0x3c
	BANKSEL	r0x1002
	MOV	r0x1002, R0
;	::->op : GOTO
	JMP	_00016_DS_
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x28=40), size=1
_00009_DS_
;	.line	42; "../pwm.c"	if(duty_get >= 40)
	MOV	R0,# 0x28
	BANKSEL	r0x1001
	SUB	R0, r0x1001
;comparing bytes at offset 0
	JB	PSW, 0
	JMP	_00006_DS_
;	::->op : =
;	.line	43; "../pwm.c"	duty = 40;
	MOV	R0,# 0x28
	BANKSEL	r0x1002
	MOV	r0x1002, R0
;	::->op : GOTO
	JMP	_00016_DS_
;	::->op : LABEL
;	::->op : =
_00006_DS_
;	.line	45; "../pwm.c"	duty = 20;
	MOV	R0,# 0x14
	BANKSEL	r0x1002
	MOV	r0x1002, R0
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x5=5), size=1
_00016_DS_
;	.line	47; "../pwm.c"	switch(doorStatus)
	MOV	R0,# 0x05
	BANKSEL	_doorStatus
	SUB	R0, _doorStatus
;comparing bytes at offset 0
	JB	PSW, 0
	JMP	_00076_DS_
;	::->op : >
;swapping arguments (AOP_TYPEs 1/3)
;unsigned compare: left >= lit(0x18=24), size=1
	MOV	R0,# 0x18
	BANKSEL	_doorStatus
	SUB	R0, _doorStatus
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00076_DS_
;	::->op : -
	MOV	R0,# 0xfb
	BANKSEL	_doorStatus
	ADD	R0, _doorStatus
	BANKSEL	r0x1001
	MOV	r0x1001, R0
;	::->op : JUMPTABLE
	MOV	R0,#high _00109_DS_
	MOV	PCH, R0
	MOV	R0,#_00109_DS_
	BANKSEL	r0x1001
	ADD	R0, r0x1001
	JNB	PSW, 0
	INC	PCH
	MOV	PCL, R0
_00109_DS_
	JMP	_00017_DS_
	JMP	_00026_DS_
	JMP	_00035_DS_
	JMP	_00044_DS_
	JMP	_00050_DS_
	JMP	_00056_DS_
	JMP	_00057_DS_
	JMP	_00058_DS_
	JMP	_00061_DS_
	JMP	_00060_DS_
	JMP	_00059_DS_
	JMP	_00064_DS_
	JMP	_00063_DS_
	JMP	_00062_DS_
	JMP	_00066_DS_
	JMP	_00076_DS_
	JMP	_00065_DS_
	JMP	_00067_DS_
	JMP	_00068_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00017_DS_
;	.line	50; "../pwm.c"	if(duty == 40)
	BANKSEL	r0x1002
	MOVZ	R0, r0x1002
	XOR	R0,# 0x28
	JB	PSW, 2
	JMP	_00024_DS_
;	::->op : =
;	.line	52; "../pwm.c"	doorStatus = PWM_20_2_40;
	MOV	R0,# 0x0a
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00024_DS_
;	.line	54; "../pwm.c"	else if(duty == 80)
	BANKSEL	r0x1002
	MOVZ	R0, r0x1002
	XOR	R0,# 0x50
	JB	PSW, 2
	JMP	_00021_DS_
;	::->op : =
;	.line	56; "../pwm.c"	doorStatus = PWM_20_2_80;
	MOV	R0,# 0x0b
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00021_DS_
;	.line	58; "../pwm.c"	else if(duty == 100)
	BANKSEL	r0x1002
	MOVZ	R0, r0x1002
	XOR	R0,# 0x64
	JB	PSW, 2
	JMP	_00076_DS_
;	::->op : =
;	.line	60; "../pwm.c"	doorStatus = PWM_20_2_100;
	MOV	R0,# 0x0c
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	62; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00026_DS_
;	.line	64; "../pwm.c"	if(duty == 20)
	BANKSEL	r0x1002
	MOVZ	R0, r0x1002
	XOR	R0,# 0x14
	JB	PSW, 2
	JMP	_00033_DS_
;	::->op : =
;	.line	66; "../pwm.c"	doorStatus = PWM_40_2_20;
	MOV	R0,# 0x0f
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00033_DS_
;	.line	68; "../pwm.c"	else if(duty == 60)
	BANKSEL	r0x1002
	MOVZ	R0, r0x1002
	XOR	R0,# 0x3c
	JB	PSW, 2
	JMP	_00030_DS_
;	::->op : =
;	.line	70; "../pwm.c"	doorStatus = PWM_40_2_60;
	MOV	R0,# 0x0e
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00030_DS_
;	.line	72; "../pwm.c"	else if(duty == 100)
	BANKSEL	r0x1002
	MOVZ	R0, r0x1002
	XOR	R0,# 0x64
	JB	PSW, 2
	JMP	_00076_DS_
;	::->op : =
;	.line	74; "../pwm.c"	doorStatus = PWM_40_2_100;
	MOV	R0,# 0x0d
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	76; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00035_DS_
;	.line	78; "../pwm.c"	if(duty == 20)
	BANKSEL	r0x1002
	MOVZ	R0, r0x1002
	XOR	R0,# 0x14
	JB	PSW, 2
	JMP	_00042_DS_
;	::->op : =
;	.line	80; "../pwm.c"	doorStatus = PWM_60_2_20;
	MOV	R0,# 0x12
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00042_DS_
;	.line	82; "../pwm.c"	else if(duty == 40)
	BANKSEL	r0x1002
	MOVZ	R0, r0x1002
	XOR	R0,# 0x28
	JB	PSW, 2
	JMP	_00039_DS_
;	::->op : =
;	.line	84; "../pwm.c"	doorStatus = PWM_60_2_40;
	MOV	R0,# 0x11
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00039_DS_
;	.line	86; "../pwm.c"	else if(duty == 80)
	BANKSEL	r0x1002
	MOVZ	R0, r0x1002
	XOR	R0,# 0x50
	JB	PSW, 2
	JMP	_00076_DS_
;	::->op : =
;	.line	88; "../pwm.c"	doorStatus = PWM_60_2_80;
	MOV	R0,# 0x10
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	90; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00044_DS_
;	.line	92; "../pwm.c"	if(duty == 20)
	BANKSEL	r0x1002
	MOVZ	R0, r0x1002
	XOR	R0,# 0x14
	JB	PSW, 2
	JMP	_00048_DS_
;	::->op : =
;	.line	94; "../pwm.c"	doorStatus = PWM_80_2_20;
	MOV	R0,# 0x15
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00048_DS_
;	.line	96; "../pwm.c"	else if(duty == 60)
	BANKSEL	r0x1002
	MOVZ	R0, r0x1002
	XOR	R0,# 0x3c
	JB	PSW, 2
	JMP	_00076_DS_
;	::->op : =
;	.line	98; "../pwm.c"	doorStatus = PWM_80_2_60;
	MOV	R0,# 0x13
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	100; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00050_DS_
;	.line	102; "../pwm.c"	if(duty == 20)
	BANKSEL	r0x1002
	MOVZ	R0, r0x1002
	XOR	R0,# 0x14
	JB	PSW, 2
	JMP	_00054_DS_
;	::->op : =
;	.line	104; "../pwm.c"	doorStatus = PWM_100_2_20;
	MOV	R0,# 0x16
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00054_DS_
;	.line	106; "../pwm.c"	else if(duty == 40)
	BANKSEL	r0x1002
	MOVZ	R0, r0x1002
	XOR	R0,# 0x28
	JB	PSW, 2
	JMP	_00076_DS_
;	::->op : =
;	.line	108; "../pwm.c"	doorStatus = PWM_100_2_40;
	MOV	R0,# 0x17
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	110; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : =
_00056_DS_
;	.line	112; "../pwm.c"	doorStatus = PWM_40;
	MOV	R0,# 0x06
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	113; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : =
_00057_DS_
;	.line	115; "../pwm.c"	doorStatus = PWM_80;
	MOV	R0,# 0x08
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	116; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : =
_00058_DS_
;	.line	118; "../pwm.c"	doorStatus = PWM_100;
	MOV	R0,# 0x09
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	119; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : =
_00059_DS_
;	.line	121; "../pwm.c"	doorStatus = PWM_20;
	MOV	R0,# 0x05
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	122; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : =
_00060_DS_
;	.line	124; "../pwm.c"	doorStatus = PWM_60;
	MOV	R0,# 0x07
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	125; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : =
_00061_DS_
;	.line	127; "../pwm.c"	doorStatus = PWM_100;
	MOV	R0,# 0x09
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	128; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : =
_00062_DS_
;	.line	130; "../pwm.c"	doorStatus = PWM_20;
	MOV	R0,# 0x05
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	131; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : =
_00063_DS_
;	.line	133; "../pwm.c"	doorStatus = PWM_40;
	MOV	R0,# 0x06
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	134; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : =
_00064_DS_
;	.line	136; "../pwm.c"	doorStatus = PWM_80;
	MOV	R0,# 0x08
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	137; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : =
_00065_DS_
;	.line	139; "../pwm.c"	doorStatus = PWM_20;
	MOV	R0,# 0x05
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	140; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : =
_00066_DS_
;	.line	142; "../pwm.c"	doorStatus = PWM_60;
	MOV	R0,# 0x07
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	143; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : =
_00067_DS_
;	.line	145; "../pwm.c"	doorStatus = PWM_20;
	MOV	R0,# 0x05
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	146; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : =
_00068_DS_
;	.line	148; "../pwm.c"	doorStatus = PWM_40;
	MOV	R0,# 0x06
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : GOTO
;	.line	149; "../pwm.c"	break;
	JMP	_00076_DS_
;	::->op : LABEL
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00076_DS_
;	.line	152; "../pwm.c"	}
	CRET	
;	.def _DoorState_Deal_function_end, debug, value=$

; exit point of _DoorState_Deal



func._DoorState_Init	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _DoorState_Init	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	.def _DoorState_Init_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_DoorState_Init	;Function start
; 2 exit points
;	::->op : =
;	.line	14; "../pwm.c"	doorStatus = PWM_20;
	MOV	R0,# 0x05
	BANKSEL	_doorStatus
	MOV	_doorStatus, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _DoorState_Init_function_end, debug, value=$

; exit point of _DoorState_Init


;	code size estimation:
;	  232+   69 =   301 instructions (  740 byte)

;	.type _DoorState_Init,  32
;	.dim _DoorState_Init, 1, (_DoorState_Init_function_end&0xFF00)>>8, _DoorState_Init_function_end&0xFF,0,12,0,15 , 1, 1
;	.type _DoorState_Deal,  32
;	.dim _DoorState_Deal, 1, (_DoorState_Deal_function_end&0xFF00)>>8, _DoorState_Deal_function_end&0xFF,0,18,0,154 , 2, 1
;	.type _Door_StatusGet,  32
;	.dim _Door_StatusGet, 1, (_Door_StatusGet_function_end&0xFF00)>>8, _Door_StatusGet_function_end&0xFF,0,156,0,159 , 1, 1

	.end
