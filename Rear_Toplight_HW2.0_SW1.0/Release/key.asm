;--------------------------------------------------------
; File Created by ChiponCC : ChipON  inc.
;--------------------------------------------------------
; chipon port for the 16-bit core
;--------------------------------------------------------
;	.file	"../key.c"
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
	.global	_key_deal
	.global	_key_state_set
	.global	_key_read
	.global	_key_init
	.global	_key_state
	.global	_key_status
	.global	_key_state2
	.global	_key_status2
	.global	_key_value
	.global	_Key_Code
	.global	_Key_Error_Code
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
UD_key_0	.udata
_key_state	.res	1

UD_key_1	.udata
_key_state2	.res	1

UD_key_2	.udata
_key_value	.res	2

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_key_0	.udata
r0x100C	.res	1
UDL_key_1	.udata
r0x100E	.res	1
UDL_key_2	.udata
r0x100F	.res	1
UDL_key_3	.udata
r0x100D	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_key_0	.idata
_key_status
	.db	0x00


ID_key_1	.idata
_key_status2
	.db	0x00


ID_key_2	.idata
_Key_Code
	.db	0x00, 0x00


ID_key_3	.idata
_Key_Error_Code
	.db	0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	.udata_ovr


func._key_deal	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _key_deal	;Function start
; 2 exit points
;has an exit
;functions called:
;   _key_read
;   _Door_StatusGet
;   _Door_StatusGet
;   _set_led
;   _Flash_data_set
;   _set_led
;   _Flash_data_set
;   _set_led
;   _Flash_data_set
;   _set_led
;   _Flash_data_set
;   _key_read
;   _Door_StatusGet
;   _Door_StatusGet
;   _set_led
;   _Flash_data_set
;   _set_led
;   _Flash_data_set
;   _set_led
;   _Flash_data_set
;   _set_led
;   _Flash_data_set
;3 compiler assigned registers:
;   r0x100D
;   STK01
;   STK00
;; Starting PostCode block
;	.def _key_deal_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_key_deal	;Function start
; 2 exit points
;	::->op : CALL
;	.line	102; "../key.c"	key_read();
	PAGESEL	_key_read
	CALL	_key_read
	PAGESEL	$
;	::->op : CALL
;	.line	104; "../key.c"	if((Door_StatusGet() != PWM_40) && (Door_StatusGet() >= PWM_20))
	PAGESEL	_Door_StatusGet
	CALL	_Door_StatusGet
	PAGESEL	$
	BANKSEL	r0x100D
	MOV	r0x100D, R0
;	::->op : EQ_OP
	BANKSEL	r0x100D
	MOVZ	R0, r0x100D
	XOR	R0,# 0x06
	JNB	PSW, 2
	JMP	_00056_DS_
	PAGESEL	_Door_StatusGet
	CALL	_Door_StatusGet
	PAGESEL	$
	BANKSEL	r0x100D
	MOV	r0x100D, R0
;	::->op : <
;unsigned compare: left < lit(0x5=5), size=1
	MOV	R0,# 0x05
	BANKSEL	r0x100D
	SUB	R0, r0x100D
;comparing bytes at offset 0
	JB	PSW, 0
	JMP	_00056_DS_
;	::->op : EQ_OP
;	.line	107; "../key.c"	if (key_state == UnPressed2Pressed)
	BANKSEL	_key_state
	MOVZ	R0, _key_state
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00047_DS_
;	::->op : IFX
;	.line	109; "../key.c"	if(key_status == Key_Off)
	MOV	R0,# 0x00
	BANKSEL	_key_status
	ORL	R0, _key_status
	JB	PSW, 2
	JMP	_00044_DS_
;	::->op : =
;	.line	111; "../key.c"	key_status = Key_On;
	MOV	R0,# 0x01
	BANKSEL	_key_status
	MOV	_key_status, R0
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	112; "../key.c"	set_led(1,LeftReadLightSW,Ind_On);
	MOV	R0,# 0x01
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x01
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	113; "../key.c"	Flash_data_set(1,LeftReadLightSW,Ind_On);
	MOV	R0,# 0x01
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x01
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_Flash_data_set
	CALL	_Flash_data_set
	PAGESEL	$
;	::->op : GOTO
	JMP	_00047_DS_
;	::->op : LABEL
;	::->op : =
_00044_DS_
;	.line	117; "../key.c"	key_status = Key_Off;
	BANKSEL	_key_status
	CLR	_key_status
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	118; "../key.c"	set_led(1,LeftReadLightSW,Ind_Off);
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x01
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	119; "../key.c"	Flash_data_set(1,LeftReadLightSW,Ind_Off);
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x01
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_Flash_data_set
	CALL	_Flash_data_set
	PAGESEL	$
;	::->op : LABEL
;	::->op : EQ_OP
_00047_DS_
;	.line	124; "../key.c"	if (key_state2 == UnPressed2Pressed)
	BANKSEL	_key_state2
	MOVZ	R0, _key_state2
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00056_DS_
;	::->op : IFX
;	.line	126; "../key.c"	if(key_status2 == Key_Off)
	MOV	R0,# 0x00
	BANKSEL	_key_status2
	ORL	R0, _key_status2
	JB	PSW, 2
	JMP	_00049_DS_
;	::->op : =
;	.line	128; "../key.c"	key_status2 = Key_On;
	MOV	R0,# 0x01
	BANKSEL	_key_status2
	MOV	_key_status2, R0
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	129; "../key.c"	set_led(2,RightReadLightSW,Ind_On);
	MOV	R0,# 0x01
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x00
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	130; "../key.c"	Flash_data_set(2,RightReadLightSW,Ind_On);
	MOV	R0,# 0x01
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x00
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_Flash_data_set
	CALL	_Flash_data_set
	PAGESEL	$
;	::->op : GOTO
	JMP	_00056_DS_
;	::->op : LABEL
;	::->op : =
_00049_DS_
;	.line	134; "../key.c"	key_status2 = Key_Off;
	BANKSEL	_key_status2
	CLR	_key_status2
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	135; "../key.c"	set_led(2,RightReadLightSW,Ind_Off);
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x00
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_set_led
	CALL	_set_led
	PAGESEL	$
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	136; "../key.c"	Flash_data_set(2,RightReadLightSW,Ind_Off);
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x00
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_Flash_data_set
	CALL	_Flash_data_set
	PAGESEL	$
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00056_DS_
	CRET	
;	.def _key_deal_function_end, debug, value=$

; exit point of _key_deal



func._key_state_set	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _key_state_set	;Function start
; 2 exit points
;has an exit
;3 compiler assigned registers:
;   r0x100E
;   STK00
;   r0x100F
;; Starting PostCode block
;	.def _key_state_set_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_key_state_set	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	89; "../key.c"	void key_state_set(uint8_t ch,Key_Status_t status)
	BANKSEL	r0x100E
	MOV	r0x100E, R0
;	::->op : RECEIVE
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x100F
	MOV	r0x100F, R0
;	::->op : EQ_OP
;	.line	91; "../key.c"	if(ch == 1)
	BANKSEL	r0x100E
	MOVZ	R0, r0x100E
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00036_DS_
;	::->op : =
;	.line	92; "../key.c"	key_status = status;
	BANKSEL	r0x100F
	MOVZ	R0, r0x100F
	BANKSEL	_key_status
	MOV	_key_status, R0
;	::->op : LABEL
;	::->op : EQ_OP
_00036_DS_
;	.line	93; "../key.c"	if(ch == 2)
	BANKSEL	r0x100E
	MOVZ	R0, r0x100E
	XOR	R0,# 0x02
	JB	PSW, 2
	JMP	_00039_DS_
;	::->op : =
;	.line	94; "../key.c"	key_status2 = status;
	BANKSEL	r0x100F
	MOVZ	R0, r0x100F
	BANKSEL	_key_status2
	MOV	_key_status2, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00039_DS_
	CRET	
;	.def _key_state_set_function_end, debug, value=$

; exit point of _key_state_set



func._key_read	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _key_read	;Function start
; 2 exit points
;has an exit
;functions called:
;   __CTouch_Scan_Process_
;   __CTouch_Scan_Process_
;2 compiler assigned registers:
;   r0x100B
;   r0x100C
;; Starting PostCode block
;	.def _key_read_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_key_read	;Function start
; 2 exit points
;	::->op : CALL
;	.line	37; "../key.c"	Key_Error_Code = _CTouch_Scan_Process_();  //错误代码
	PAGESEL	__CTouch_Scan_Process_
	CALL	__CTouch_Scan_Process_
	PAGESEL	$
	BANKSEL	_Key_Error_Code
	MOV	_Key_Error_Code, R0
;	::->op : =
;	.line	39; "../key.c"	key_value = Channel_Press_str;
	BANKSEL	_Channel_Press_str
	MOVZ	R0, _Channel_Press_str
	BANKSEL	_key_value
	MOV	_key_value, R0
	BANKSEL	_Channel_Press_str
	MOVZ	R0, (_Channel_Press_str + 1)
	BANKSEL	_key_value
	MOV	(_key_value + 1), R0
;	::->op : BITWISEAND
;	.line	40; "../key.c"	Key_Code = key_value & 0x01;  //获取按键状态
	MOV	R0,# 0x01
	BANKSEL	_key_value
	AND	R0, _key_value
	BANKSEL	_Key_Code
	MOV	_Key_Code, R0
	BANKSEL	_Key_Code
	CLR	(_Key_Code + 1)
;	::->op : >
;swapping arguments (AOP_TYPEs 1/3)
;unsigned compare: left >= lit(0x4=4), size=1
;	.line	42; "../key.c"	switch(key_state)  //状态标记
	MOV	R0,# 0x04
	BANKSEL	_key_state
	SUB	R0, _key_state
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00012_DS_
;	::->op : JUMPTABLE
	MOV	R0,#high _00032_DS_
	MOV	PCH, R0
	MOV	R0,#_00032_DS_
	BANKSEL	_key_state
	ADD	R0, _key_state
	JNB	PSW, 0
	INC	PCH
	MOV	PCL, R0
_00032_DS_
	JMP	_00003_DS_
	JMP	_00006_DS_
	JMP	_00007_DS_
	JMP	_00010_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00003_DS_
;	.line	45; "../key.c"	if(Key_Code == 1)
	BANKSEL	_Key_Code
	MOVZ	R0, _Key_Code
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00012_DS_
	BANKSEL	_Key_Code
	MOVZ	R0, (_Key_Code + 1)
	XOR	R0,# 0x00
	JB	PSW, 2
	JMP	_00012_DS_
;	::->op : =
;	.line	46; "../key.c"	key_state = UnPressed2Pressed;
	MOV	R0,# 0x01
	BANKSEL	_key_state
	MOV	_key_state, R0
;	::->op : GOTO
;	.line	47; "../key.c"	break;
	JMP	_00012_DS_
;	::->op : LABEL
;	::->op : =
_00006_DS_
;	.line	49; "../key.c"	key_state = Pressed;
	MOV	R0,# 0x02
	BANKSEL	_key_state
	MOV	_key_state, R0
;	::->op : GOTO
;	.line	50; "../key.c"	break;
	JMP	_00012_DS_
;	::->op : LABEL
;	::->op : IFX
_00007_DS_
;	.line	52; "../key.c"	if(Key_Code == 0)
	BANKSEL	_Key_Code
	MOVZ	R0, _Key_Code
	BANKSEL	_Key_Code
	ORL	R0, (_Key_Code + 1)
	JB	PSW, 2
	JMP	_00012_DS_
;	::->op : =
;	.line	53; "../key.c"	key_state = Pressed2UnPressed;
	MOV	R0,# 0x03
	BANKSEL	_key_state
	MOV	_key_state, R0
;	::->op : GOTO
;	.line	54; "../key.c"	break;
	JMP	_00012_DS_
;	::->op : LABEL
;	::->op : =
_00010_DS_
;	.line	56; "../key.c"	key_state = UnPressed;
	BANKSEL	_key_state
	CLR	_key_state
;	::->op : LABEL
;	::->op : RIGHT_OP
_00012_DS_
;	.line	63; "../key.c"	Key_Code = key_value >> 1 & 0x01;  //获取按键状态
	CLR	PSW, 0
	BANKSEL	_key_value
	RRCR	(_key_value + 1)
;;1	MOV	r0x100B, R0
	BANKSEL	_key_value
	RRCR	_key_value
	BANKSEL	r0x100C
	MOV	r0x100C, R0
;	::->op : BITWISEAND
	MOV	R0,# 0x01
	BANKSEL	r0x100C
	AND	R0, r0x100C
	BANKSEL	_Key_Code
	MOV	_Key_Code, R0
	BANKSEL	_Key_Code
	CLR	(_Key_Code + 1)
;	::->op : >
;swapping arguments (AOP_TYPEs 1/3)
;unsigned compare: left >= lit(0x4=4), size=1
;	.line	65; "../key.c"	switch(key_state2)  //状态标记
	MOV	R0,# 0x04
	BANKSEL	_key_state2
	SUB	R0, _key_state2
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00023_DS_
;	::->op : JUMPTABLE
	MOV	R0,#high _00034_DS_
	MOV	PCH, R0
	MOV	R0,#_00034_DS_
	BANKSEL	_key_state2
	ADD	R0, _key_state2
	JNB	PSW, 0
	INC	PCH
	MOV	PCL, R0
_00034_DS_
	JMP	_00013_DS_
	JMP	_00016_DS_
	JMP	_00017_DS_
	JMP	_00020_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00013_DS_
;	.line	68; "../key.c"	if(Key_Code == 1)
	BANKSEL	_Key_Code
	MOVZ	R0, _Key_Code
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00023_DS_
	BANKSEL	_Key_Code
	MOVZ	R0, (_Key_Code + 1)
	XOR	R0,# 0x00
	JB	PSW, 2
	JMP	_00023_DS_
;	::->op : =
;	.line	69; "../key.c"	key_state2 = UnPressed2Pressed;
	MOV	R0,# 0x01
	BANKSEL	_key_state2
	MOV	_key_state2, R0
;	::->op : GOTO
;	.line	70; "../key.c"	break;
	JMP	_00023_DS_
;	::->op : LABEL
;	::->op : =
_00016_DS_
;	.line	72; "../key.c"	key_state2 = Pressed;
	MOV	R0,# 0x02
	BANKSEL	_key_state2
	MOV	_key_state2, R0
;	::->op : GOTO
;	.line	73; "../key.c"	break;
	JMP	_00023_DS_
;	::->op : LABEL
;	::->op : IFX
_00017_DS_
;	.line	75; "../key.c"	if(Key_Code == 0)
	BANKSEL	_Key_Code
	MOVZ	R0, _Key_Code
	BANKSEL	_Key_Code
	ORL	R0, (_Key_Code + 1)
	JB	PSW, 2
	JMP	_00023_DS_
;	::->op : =
;	.line	76; "../key.c"	key_state2 = Pressed2UnPressed;
	MOV	R0,# 0x03
	BANKSEL	_key_state2
	MOV	_key_state2, R0
;	::->op : GOTO
;	.line	77; "../key.c"	break;
	JMP	_00023_DS_
;	::->op : LABEL
;	::->op : =
_00020_DS_
;	.line	79; "../key.c"	key_state2 = UnPressed;
	BANKSEL	_key_state2
	CLR	_key_state2
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00023_DS_
;	.line	83; "../key.c"	}
	CRET	
;	.def _key_read_function_end, debug, value=$

; exit point of _key_read



func._key_init	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _key_init	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	.def _key_init_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_key_init	;Function start
; 2 exit points
;	::->op : =
;	.line	28; "../key.c"	key_state = UnPressed;
	BANKSEL	_key_state
	CLR	_key_state
;	::->op : =
;	.line	29; "../key.c"	key_state2 = UnPressed;
	BANKSEL	_key_state2
	CLR	_key_state2
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _key_init_function_end, debug, value=$

; exit point of _key_init


;	code size estimation:
;	  222+   73 =   295 instructions (  736 byte)

;	.type _key_init,  32
;	.dim _key_init, 1, (_key_init_function_end&0xFF00)>>8, _key_init_function_end&0xFF,0,26,0,30 , 1, 1
;	.type _key_read,  32
;	.dim _key_read, 1, (_key_read_function_end&0xFF00)>>8, _key_read_function_end&0xFF,0,35,0,84 , 1, 1
;	.type _key_state_set,  32
;	.dim _key_state_set, 1, (_key_state_set_function_end&0xFF00)>>8, _key_state_set_function_end&0xFF,0,89,0,95 , 1, 1
;	.type _key_deal,  32
;	.dim _key_deal, 1, (_key_deal_function_end&0xFF00)>>8, _key_deal_function_end&0xFF,0,100,0,140 , 1, 1

	.end
