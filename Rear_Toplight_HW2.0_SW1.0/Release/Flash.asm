;--------------------------------------------------------
; File Created by ChiponCC : ChipON  inc.
;--------------------------------------------------------
; chipon port for the 16-bit core
;--------------------------------------------------------
;	.file	"../Flash.c"
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
	.extern	_set_led
	.extern	_led_deal
	.extern	_processLED
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
	.global	_set_savefalg
	.global	_Flash_data_set
	.global	_FLASH_Deal
	.global	_FLASH_Init
	.global	_FLASH_WRITE_ONE
	.global	_FLASH_WRITE_FUN
	.global	_FLASH_READ_FUN
	.global	_FLASH_READ_ONE
	.global	_saveflag
	.global	_FLASH_READ_BUF
	.global	_FLASH_BUFFER
	.global	_BUFFER_ARRY
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
UD_Flash_0	.udata
_FLASH_READ_BUF	.res	2

UD_Flash_1	.udata
_FLASH_BUFFER	.res	32

UD_Flash_2	.udata
_BUFFER_ARRY	.res	10

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_Flash_0	.udata
r0x102E	.res	1
UDL_Flash_1	.udata
r0x102F	.res	1
UDL_Flash_2	.udata
r0x1042	.res	1
UDL_Flash_3	.udata
r0x1041	.res	1
UDL_Flash_4	.udata
r0x1043	.res	1
UDL_Flash_5	.udata
r0x1037	.res	1
UDL_Flash_6	.udata
r0x1036	.res	1
UDL_Flash_7	.udata
r0x1038	.res	1
UDL_Flash_8	.udata
r0x1047	.res	1
UDL_Flash_9	.udata
r0x1046	.res	1
UDL_Flash_10	.udata
r0x1049	.res	1
UDL_Flash_11	.udata
r0x1048	.res	1
UDL_Flash_12	.udata
r0x104A	.res	1
UDL_Flash_13	.udata
r0x104B	.res	1
UDL_Flash_14	.udata
r0x104C	.res	1
UDL_Flash_15	.udata
r0x103B	.res	1
UDL_Flash_16	.udata
r0x103C	.res	1
UDL_Flash_17	.udata
r0x103D	.res	1
UDL_Flash_18	.udata
r0x103F	.res	1
UDL_Flash_19	.udata
r0x1040	.res	1
UDL_Flash_20	.udata
r0x1031	.res	1
UDL_Flash_21	.udata
r0x1032	.res	1
UDL_Flash_22	.udata
r0x1033	.res	1
UDL_Flash_23	.udata
r0x1034	.res	1
UDL_Flash_24	.udata
r0x1035	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_Flash_0	.idata
_saveflag
	.db	0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	.udata_ovr


func._set_savefalg	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _set_savefalg	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	.def _set_savefalg_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_set_savefalg	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	494; "../Flash.c"	void set_savefalg(uint8_t value)
	BANKSEL	_saveflag
	MOV	_saveflag, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
;	.line	496; "../Flash.c"	saveflag = value;
	CRET	
;	.def _set_savefalg_function_end, debug, value=$

; exit point of _set_savefalg



func._Flash_data_set	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Flash_data_set	;Function start
; 2 exit points
;has an exit
;functions called:
;   _FLASH_READ_ONE
;   _FLASH_READ_ONE
;   _FLASH_READ_ONE
;   _FLASH_READ_ONE
;   _set_savefalg
;   _FLASH_READ_ONE
;   _FLASH_READ_ONE
;   _FLASH_READ_ONE
;   _FLASH_READ_ONE
;   _set_savefalg
;7 compiler assigned registers:
;   r0x1031
;   STK00
;   r0x1032
;   STK01
;   r0x1033
;   r0x1034
;   r0x1035
;; Starting PostCode block
;	.def _Flash_data_set_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Flash_data_set	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	466; "../Flash.c"	void Flash_data_set(uint8_t ch,uint8_t sw,uint8_t status)
	BANKSEL	r0x1031
	MOV	r0x1031, R0
;	::->op : RECEIVE
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1032
	MOV	r0x1032, R0
;	::->op : RECEIVE
	BANKSEL	STK01
	MOVZ	R0, STK01
	BANKSEL	r0x1033
	MOV	r0x1033, R0
;	::->op : EQ_OP
;	.line	468; "../Flash.c"	if(ch == 1)
	BANKSEL	r0x1031
	MOVZ	R0, r0x1031
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00051_DS_
;	::->op :*  =
;	.line	470; "../Flash.c"	FLASH_BUFFER[0] = 0x55;
	MOV	R0,# 0x55
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 0), R0
	BANKSEL	_FLASH_BUFFER
	CLR	 (_FLASH_BUFFER + 1)
;	::->op : CAST
;	.line	471; "../Flash.c"	FLASH_BUFFER[1] = sw;
	BANKSEL	r0x1032
	MOVZ	R0, r0x1032
	BANKSEL	r0x1034
	MOV	r0x1034, R0
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 2), R0
	BANKSEL	r0x1035
	CLR	r0x1035
;	::->op :*  =
;;114	MOVZ	R0, r0x1034
	MOV	R0,# 0x00
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 3), R0
;	::->op : CAST
;	.line	472; "../Flash.c"	FLASH_BUFFER[2] = status;
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	BANKSEL	r0x1034
	MOV	r0x1034, R0
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 4), R0
	BANKSEL	r0x1035
	CLR	r0x1035
;	::->op :*  =
;;112	MOVZ	R0, r0x1034
	MOV	R0,# 0x00
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 5), R0
;	::->op : SEND
;	::->op : CALL
;	.line	475; "../Flash.c"	FLASH_BUFFER[3] = FLASH_READ_ONE(0x1FC0+3);
	MOV	R0,# 0xc3
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x1f
	PAGESEL	_FLASH_READ_ONE
	CALL	_FLASH_READ_ONE
	PAGESEL	$
	BANKSEL	r0x1035
	MOV	r0x1035, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1034
	MOV	r0x1034, R0
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 6), R0
;	::->op :*  =
;;110	MOVZ	R0, r0x1034
	BANKSEL	r0x1035
	MOVZ	R0, r0x1035
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 7), R0
;	::->op : SEND
;	::->op : CALL
;	.line	476; "../Flash.c"	FLASH_BUFFER[4] = FLASH_READ_ONE(0x1FC0+4);
	MOV	R0,# 0xc4
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x1f
	PAGESEL	_FLASH_READ_ONE
	CALL	_FLASH_READ_ONE
	PAGESEL	$
	BANKSEL	r0x1035
	MOV	r0x1035, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1034
	MOV	r0x1034, R0
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 8), R0
;	::->op :*  =
;;108	MOVZ	R0, r0x1034
	BANKSEL	r0x1035
	MOVZ	R0, r0x1035
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 9), R0
;	::->op : LABEL
;	::->op : EQ_OP
_00051_DS_
;	.line	480; "../Flash.c"	if(ch == 2)
	BANKSEL	r0x1031
	MOVZ	R0, r0x1031
	XOR	R0,# 0x02
	JB	PSW, 2
	JMP	_00053_DS_
;	::->op :*  =
;	.line	482; "../Flash.c"	FLASH_BUFFER[0] = 0x55;
	MOV	R0,# 0x55
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 0), R0
	BANKSEL	_FLASH_BUFFER
	CLR	 (_FLASH_BUFFER + 1)
;	::->op : SEND
;	::->op : CALL
;	.line	485; "../Flash.c"	FLASH_BUFFER[1] = FLASH_READ_ONE(0x1FC0+1);
	MOV	R0,# 0xc1
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x1f
	PAGESEL	_FLASH_READ_ONE
	CALL	_FLASH_READ_ONE
	PAGESEL	$
	BANKSEL	r0x1034
	MOV	r0x1034, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1031
	MOV	r0x1031, R0
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 2), R0
;	::->op :*  =
;;113	MOVZ	R0, r0x1031
	BANKSEL	r0x1034
	MOVZ	R0, r0x1034
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 3), R0
;	::->op : SEND
;	::->op : CALL
;	.line	486; "../Flash.c"	FLASH_BUFFER[2] = FLASH_READ_ONE(0x1FC0+2);
	MOV	R0,# 0xc2
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x1f
	PAGESEL	_FLASH_READ_ONE
	CALL	_FLASH_READ_ONE
	PAGESEL	$
	BANKSEL	r0x1034
	MOV	r0x1034, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1031
	MOV	r0x1031, R0
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 4), R0
;	::->op :*  =
;;111	MOVZ	R0, r0x1031
	BANKSEL	r0x1034
	MOVZ	R0, r0x1034
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 5), R0
;	::->op : CAST
;	.line	487; "../Flash.c"	FLASH_BUFFER[3] = sw;
	BANKSEL	r0x1032
	MOVZ	R0, r0x1032
	BANKSEL	r0x1031
	MOV	r0x1031, R0
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 6), R0
	BANKSEL	r0x1034
	CLR	r0x1034
;	::->op :*  =
;;109	MOVZ	R0, r0x1031
	MOV	R0,# 0x00
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 7), R0
;	::->op : CAST
;	.line	488; "../Flash.c"	FLASH_BUFFER[4] = status;
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	BANKSEL	r0x1031
	MOV	r0x1031, R0
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 8), R0
	BANKSEL	r0x1032
	CLR	r0x1032
;	::->op :*  =
;;107	MOVZ	R0, r0x1031
	MOV	R0,# 0x00
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 9), R0
;	::->op : LABEL
;	::->op : SEND
;	::->op : CALL
_00053_DS_
;	.line	490; "../Flash.c"	set_savefalg(1);
	MOV	R0,# 0x01
	PAGESEL	_set_savefalg
	CALL	_set_savefalg
	PAGESEL	$
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _Flash_data_set_function_end, debug, value=$

; exit point of _Flash_data_set



func._FLASH_Deal	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _FLASH_Deal	;Function start
; 2 exit points
;has an exit
;functions called:
;   _FLASH_WRITE_FUN
;   _set_savefalg
;   _FLASH_WRITE_FUN
;   _set_savefalg
;2 compiler assigned registers:
;   STK01
;   STK00
;; Starting PostCode block
;	.def _FLASH_Deal_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_FLASH_Deal	;Function start
; 2 exit points
;	::->op : EQ_OP
;	.line	457; "../Flash.c"	if(saveflag == 1)
	BANKSEL	_saveflag
	MOVZ	R0, _saveflag
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00047_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	460; "../Flash.c"	FLASH_WRITE_FUN(0x1FC0,FLASH_BUFFER_MAX);
	MOV	R0,# 0x10
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0xc0
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x1f
	PAGESEL	_FLASH_WRITE_FUN
	CALL	_FLASH_WRITE_FUN
	PAGESEL	$
;	::->op : SEND
;	::->op : CALL
;	.line	461; "../Flash.c"	set_savefalg(0);
	MOV	R0,# 0x00
	PAGESEL	_set_savefalg
	CALL	_set_savefalg
	PAGESEL	$
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00047_DS_
	CRET	
;	.def _FLASH_Deal_function_end, debug, value=$

; exit point of _FLASH_Deal



func._FLASH_Init	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _FLASH_Init	;Function start
; 2 exit points
;has an exit
;functions called:
;   _FLASH_READ_ONE
;   _set_led
;   _key_state_set
;   _set_led
;   _key_state_set
;   _set_led
;   _set_led
;   _FLASH_WRITE_FUN
;   _FLASH_READ_ONE
;   _set_led
;   _key_state_set
;   _set_led
;   _key_state_set
;   _set_led
;   _set_led
;   _FLASH_WRITE_FUN
;8 compiler assigned registers:
;   r0x103B
;   r0x103C
;   r0x103D
;   r0x103E
;   r0x103F
;   r0x1040
;   STK00
;   STK01
;; Starting PostCode block
;	.def _FLASH_Init_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_FLASH_Init	;Function start
; 2 exit points
;	::->op : =
;	.line	412; "../Flash.c"	for(i = 0; i < BUFFER_MAX; i++)
	BANKSEL	r0x103B
	CLR	r0x103B
	BANKSEL	r0x103C
	CLR	r0x103C
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x5=5), size=2
_00030_DS_
	MOV	R0,# 0x00
	BANKSEL	r0x103C
	SUB	R0, r0x103C
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00044_DS_
	MOV	R0,# 0x05
	BANKSEL	r0x103B
	SUB	R0, r0x103B
_00044_DS_
	JNB	PSW, 0
	JMP	_00033_DS_
;	::->op : LEFT_OP
;	.line	415; "../Flash.c"	BUFFER_ARRY[i] = FLASH_READ_ONE(0x1FC0+i);
	CLR	PSW, 0
	BANKSEL	r0x103B
	RLCR	r0x103B
	BANKSEL	r0x103D
	MOV	r0x103D, R0
	BANKSEL	r0x103C
	RLCR	r0x103C
;;1	MOV	r0x103E, R0
;	::->op : +
	MOV	R0,# (_BUFFER_ARRY + 0)
	BANKSEL	r0x103D
	ADD	r0x103D, R0
;	::->op : +
	MOV	R0,# 0xc0
	BANKSEL	r0x103B
	ADD	R0, r0x103B
	BANKSEL	r0x103F
	MOV	r0x103F, R0
	MOV	R0,# 0x1f
	BANKSEL	r0x1040
	MOV	r0x1040, R0
	BANKSEL	r0x103C
	MOVZ	R0, r0x103C
	JNB	PSW, 0
	INC	R0
	JNB	PSW, 2
	JMP	_00060_DS_
	BANKSEL	r0x1040
	ADD	r0x1040, R0
;	::->op : SEND
;	::->op : CALL
_00060_DS_
	BANKSEL	r0x103F
	MOVZ	R0, r0x103F
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1040
	MOVZ	R0, r0x1040
	PAGESEL	_FLASH_READ_ONE
	CALL	_FLASH_READ_ONE
	PAGESEL	$
	BANKSEL	r0x1040
	MOV	r0x1040, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x103F
	MOV	r0x103F, R0
;	::->op :*  =
	BANKSEL	r0x103F
	MOVZ	R0, r0x103F
	BANKSEL	r0x103D
	MOV	R1, r0x103D
	BANKSEL	_BUFFER_ARRY
	ST	[R1], R0
	INC	R1
	BANKSEL	r0x1040
	MOVZ	R0, r0x1040
	BANKSEL	_BUFFER_ARRY
	ST	[R1], R0
;	::->op : +
;	.line	412; "../Flash.c"	for(i = 0; i < BUFFER_MAX; i++)
	BANKSEL	r0x103B
	INC	r0x103B
	JB	PSW, 2
	JMP	_00061_DS_
	BANKSEL	r0x103C
	INC	r0x103C
;	::->op : GOTO
_00061_DS_
	JMP	_00030_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00033_DS_
;	.line	418; "../Flash.c"	if(BUFFER_ARRY[0] == 0x55)  //有储存数据 恢复数据
	BANKSEL	_BUFFER_ARRY
	MOVZ	R0,  (_BUFFER_ARRY + 0)
	BANKSEL	r0x103B
	MOV	r0x103B, R0
	BANKSEL	_BUFFER_ARRY
	MOVZ	R0,  (_BUFFER_ARRY + 1)
	BANKSEL	r0x103C
	MOV	r0x103C, R0
;	::->op : EQ_OP
	BANKSEL	r0x103B
	MOVZ	R0, r0x103B
	XOR	R0,# 0x55
	JB	PSW, 2
	JMP	_00028_DS_
	BANKSEL	r0x103C
	MOVZ	R0, r0x103C
	XOR	R0,# 0x00
	JB	PSW, 2
	JMP	_00028_DS_
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	421; "../Flash.c"	if(BUFFER_ARRY[1] == LeftReadLightSW && BUFFER_ARRY[2] == Ind_On)
	BANKSEL	_BUFFER_ARRY
	MOVZ	R0,  (_BUFFER_ARRY + 2)
	BANKSEL	r0x103B
	MOV	r0x103B, R0
	BANKSEL	_BUFFER_ARRY
	MOVZ	R0,  (_BUFFER_ARRY + 3)
	BANKSEL	r0x103C
	MOV	r0x103C, R0
;	::->op : EQ_OP
	BANKSEL	r0x103B
	MOVZ	R0, r0x103B
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00022_DS_
	BANKSEL	r0x103C
	MOVZ	R0, r0x103C
	XOR	R0,# 0x00
	JB	PSW, 2
	JMP	_00022_DS_
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	_BUFFER_ARRY
	MOVZ	R0,  (_BUFFER_ARRY + 4)
	BANKSEL	r0x103B
	MOV	r0x103B, R0
	BANKSEL	_BUFFER_ARRY
	MOVZ	R0,  (_BUFFER_ARRY + 5)
	BANKSEL	r0x103C
	MOV	r0x103C, R0
;	::->op : EQ_OP
	BANKSEL	r0x103B
	MOVZ	R0, r0x103B
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00022_DS_
	BANKSEL	r0x103C
	MOVZ	R0, r0x103C
	XOR	R0,# 0x00
	JB	PSW, 2
	JMP	_00022_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	423; "../Flash.c"	set_led(1,LeftReadLightSW,Key_On);
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
;	::->op : CALL
;	.line	424; "../Flash.c"	key_state_set(1,Key_On);
	MOV	R0,# 0x01
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	PAGESEL	_key_state_set
	CALL	_key_state_set
	PAGESEL	$
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00022_DS_
;	.line	428; "../Flash.c"	if(BUFFER_ARRY[3] == RightReadLightSW && BUFFER_ARRY[4] == Ind_On)
	BANKSEL	_BUFFER_ARRY
	MOVZ	R0,  (_BUFFER_ARRY + 6)
	BANKSEL	r0x103B
	MOV	r0x103B, R0
	BANKSEL	_BUFFER_ARRY
	MOVZ	R0,  (_BUFFER_ARRY + 7)
	BANKSEL	r0x103C
	MOV	r0x103C, R0
;	::->op : IFX
	BANKSEL	r0x103B
	MOVZ	R0, r0x103B
	BANKSEL	r0x103C
	ORL	R0, r0x103C
	JB	PSW, 2
	JMP	_00034_DS_
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	_BUFFER_ARRY
	MOVZ	R0,  (_BUFFER_ARRY + 8)
	BANKSEL	r0x103B
	MOV	r0x103B, R0
	BANKSEL	_BUFFER_ARRY
	MOVZ	R0,  (_BUFFER_ARRY + 9)
	BANKSEL	r0x103C
	MOV	r0x103C, R0
;	::->op : EQ_OP
	BANKSEL	r0x103B
	MOVZ	R0, r0x103B
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00034_DS_
	BANKSEL	r0x103C
	MOVZ	R0, r0x103C
	XOR	R0,# 0x00
	JB	PSW, 2
	JMP	_00034_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	430; "../Flash.c"	set_led(2,RightReadLightSW,Key_On);
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
;	::->op : CALL
;	.line	431; "../Flash.c"	key_state_set(2,Key_On);
	MOV	R0,# 0x01
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	PAGESEL	_key_state_set
	CALL	_key_state_set
	PAGESEL	$
;	::->op : GOTO
	JMP	_00034_DS_
;	::->op : LABEL
;	::->op :*  =
_00028_DS_
;	.line	437; "../Flash.c"	FLASH_BUFFER[0] = 0x55;
	MOV	R0,# 0x55
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 0), R0
	BANKSEL	_FLASH_BUFFER
	CLR	 (_FLASH_BUFFER + 1)
;	::->op :*  =
;	.line	438; "../Flash.c"	FLASH_BUFFER[1] = LeftReadLightSW;
	MOV	R0,# 0x01
	BANKSEL	_FLASH_BUFFER
	MOV	 (_FLASH_BUFFER + 2), R0
	BANKSEL	_FLASH_BUFFER
	CLR	 (_FLASH_BUFFER + 3)
;	::->op :*  =
;	.line	439; "../Flash.c"	FLASH_BUFFER[2] = Ind_Off;
	BANKSEL	_FLASH_BUFFER
	CLR	 (_FLASH_BUFFER + 4)
	BANKSEL	_FLASH_BUFFER
	CLR	 (_FLASH_BUFFER + 5)
;	::->op :*  =
;	.line	440; "../Flash.c"	FLASH_BUFFER[3] = RightReadLightSW;
	BANKSEL	_FLASH_BUFFER
	CLR	 (_FLASH_BUFFER + 6)
	BANKSEL	_FLASH_BUFFER
	CLR	 (_FLASH_BUFFER + 7)
;	::->op :*  =
;	.line	441; "../Flash.c"	FLASH_BUFFER[4] = Ind_Off;
	BANKSEL	_FLASH_BUFFER
	CLR	 (_FLASH_BUFFER + 8)
	BANKSEL	_FLASH_BUFFER
	CLR	 (_FLASH_BUFFER + 9)
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	443; "../Flash.c"	set_led(1,LeftReadLightSW,Key_Off);
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
;	.line	444; "../Flash.c"	set_led(2,RightReadLightSW,Key_Off);
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
;	::->op : CALL
;	.line	446; "../Flash.c"	FLASH_WRITE_FUN(0x1FC0,FLASH_BUFFER_MAX);
	MOV	R0,# 0x10
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0xc0
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x1f
	PAGESEL	_FLASH_WRITE_FUN
	CALL	_FLASH_WRITE_FUN
	PAGESEL	$
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00034_DS_
	CRET	
;	.def _FLASH_Init_function_end, debug, value=$

; exit point of _FLASH_Init



func._FLASH_WRITE_ONE	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _FLASH_WRITE_ONE	;Function start
; 2 exit points
;has an exit
;functions called:
;   _FLASH_READ_FUN
;   _FLASH_WRITE_FUN
;   _FLASH_READ_FUN
;   _FLASH_WRITE_FUN
;11 compiler assigned registers:
;   r0x1046
;   STK00
;   r0x1047
;   STK01
;   r0x1048
;   STK02
;   r0x1049
;   r0x104A
;   r0x104B
;   r0x104C
;   r0x104D
;; Starting PostCode block
;	.def _FLASH_WRITE_ONE_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_FLASH_WRITE_ONE	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	392; "../Flash.c"	void FLASH_WRITE_ONE(unsigned int address,unsigned int value)
	BANKSEL	r0x1046
	MOV	r0x1046, R0
	BANKSEL	r0x104B
	MOV	r0x104B, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1047
	MOV	r0x1047, R0
;	::->op : RECEIVE
	BANKSEL	STK01
	MOVZ	R0, STK01
	BANKSEL	r0x1048
	MOV	r0x1048, R0
	BANKSEL	STK02
	MOVZ	R0, STK02
	BANKSEL	r0x1049
	MOV	r0x1049, R0
;	::->op : BITWISEAND
;	.line	395; "../Flash.c"	FLASH_READ_FUN(address&0xFFE0,FLASH_BUFFER_MAX);
	MOV	R0,# 0xe0
	BANKSEL	r0x1047
	AND	R0, r0x1047
	BANKSEL	r0x104A
	MOV	r0x104A, R0
;;106	MOVZ	R0, r0x1046
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
	MOV	R0,# 0x10
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x104A
	MOVZ	R0, r0x104A
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x104B
	MOVZ	R0, r0x104B
	PAGESEL	_FLASH_READ_FUN
	CALL	_FLASH_READ_FUN
	PAGESEL	$
;	::->op : BITWISEAND
;	.line	397; "../Flash.c"	FLASH_BUFFER[address&0x1F] = value;
	MOV	R0,# 0x1f
	BANKSEL	r0x1047
	AND	R0, r0x1047
	BANKSEL	r0x104A
	MOV	r0x104A, R0
	BANKSEL	r0x104B
	CLR	r0x104B
;	::->op : LEFT_OP
	CLR	PSW, 0
	BANKSEL	r0x104A
	RLCR	r0x104A
	BANKSEL	r0x104C
	MOV	r0x104C, R0
	BANKSEL	r0x104B
	RLCR	r0x104B
;;1	MOV	r0x104D, R0
;	::->op : +
	BANKSEL	r0x104C
	MOV	R0, r0x104C
	ADD	R0,# (_FLASH_BUFFER + 0)
	BANKSEL	r0x104A
	MOV	r0x104A, R0
;	::->op :*  =
	BANKSEL	r0x1049
	MOVZ	R0, r0x1049
	BANKSEL	r0x104A
	MOV	R1, r0x104A
	BANKSEL	_FLASH_BUFFER
	ST	[R1], R0
	INC	R1
	BANKSEL	r0x1048
	MOVZ	R0, r0x1048
	BANKSEL	_FLASH_BUFFER
	ST	[R1], R0
;	::->op : BITWISEAND
;	.line	399; "../Flash.c"	FLASH_WRITE_FUN(address&0xFFE0,FLASH_BUFFER_MAX);
	MOV	R0,# 0xe0
	BANKSEL	r0x1047
	AND	r0x1047, R0
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
	MOV	R0,# 0x10
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1047
	MOVZ	R0, r0x1047
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1046
	MOVZ	R0, r0x1046
	PAGESEL	_FLASH_WRITE_FUN
	CALL	_FLASH_WRITE_FUN
	PAGESEL	$
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _FLASH_WRITE_ONE_function_end, debug, value=$

; exit point of _FLASH_WRITE_ONE



func._FLASH_WRITE_FUN	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _FLASH_WRITE_FUN	;Function start
; 2 exit points
;has an exit
;7 compiler assigned registers:
;   r0x1036
;   STK00
;   r0x1037
;   STK01
;   r0x1038
;   r0x1039
;   r0x103A
;; Starting PostCode block
;	.def _FLASH_WRITE_FUN_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_FLASH_WRITE_FUN	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	238; "../Flash.c"	void FLASH_WRITE_FUN(unsigned int address,unsigned char length)
	BANKSEL	r0x1036
	MOV	r0x1036, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1037
	MOV	r0x1037, R0
;	::->op : RECEIVE
	BANKSEL	STK01
	MOVZ	R0, STK01
	BANKSEL	r0x1038
	MOV	r0x1038, R0
;	::->op : RIGHT_OP
;;105	MOVZ	R0, r0x1036
;;103	MOV	r0x1039, R0
;;1	CLR	r0x103A
;	::->op : CAST
;;104	MOVZ	R0, r0x1039
;	.line	242; "../Flash.c"	NVMADDRH=(unsigned char) (address>>8);
	BANKSEL	r0x1036
	MOVZ	R0, r0x1036
	BANKSEL	_NVMADDRH
	MOV	_NVMADDRH, R0
;	::->op : CAST
;	.line	243; "../Flash.c"	NVMADDRL=address;
	BANKSEL	r0x1037
	MOVZ	R0, r0x1037
	BANKSEL	_NVMADDRL
	MOV	_NVMADDRL, R0
;	::->op : INLINEASM
	;
	BANKSEL _INTCTL
	MOV R1,_INTCTL
	;
	CLR _INTCTL,_PUIE
	CLR _INTCTL,_AIE
	JNB _INTCTL,_AIE
	JMP $-2
	;
	MOV R0,#0x30
	MOV R2,_OSCCTL
	MOV _OSCCTL,R0
	;
	MOV R3,#_FLASH_BUFFER
	
;	::->op : =
;	.line	262; "../Flash.c"	while(length--)		// 仅使用R0，不改变R1
	BANKSEL	r0x1038
	MOVZ	R0, r0x1038
	BANKSEL	r0x1037
	MOV	r0x1037, R0
;	::->op : LABEL
;	::->op : =
_00011_DS_
	BANKSEL	r0x1037
	MOVZ	R0, r0x1037
	BANKSEL	r0x1036
	MOV	r0x1036, R0
;	::->op : -
	BANKSEL	r0x1037
	DEC	r0x1037
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1036
	ORL	R0, r0x1036
	JNB	PSW, 2
	JMP	_00013_DS_
;	::->op : INLINEASM
	;
	BANKSEL _FLASH_BUFFER
	LD R6,[R3]
	INC R3
	LD R7,[R3]
	INC R3
	BANKSEL _NVMDATAH
	MOV _NVMDATAH,R7
	MOV _NVMDATAL,R6
	;
	MOV R5 ,#0x84
	MOV _NVMCTL0,R5
	MOV R5,#0x69
	MOV _NVMCTL1,R5
	MOV R5,#0x96
	MOV _NVMCTL1,R5
	SET _NVMCTL0 , 1 ;
	NOPZ
	NOPZ
	NOPZ
	NOPZ
	NOPZ
	NOPZ ;
	NOPZ
	NOPZ
	NOPZ
	NOPZ
	MOV R5,#0X80
	MOV _NVMCTL0,R5
	;
	BANKSEL _NVMADDRL
	INC _NVMADDRL
	
;	::->op : GOTO
	JMP	_00011_DS_
;	::->op : LABEL
;	::->op : INLINEASM
_00013_DS_
	;
	BANKSEL _OSCCTL
	MOV _OSCCTL,R2
	AND R1,#0xC0 ;
	ORL _INTCTL,R1
	
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _FLASH_WRITE_FUN_function_end, debug, value=$

; exit point of _FLASH_WRITE_FUN



func._FLASH_READ_FUN	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _FLASH_READ_FUN	;Function start
; 2 exit points
;has an exit
;7 compiler assigned registers:
;   r0x1041
;   STK00
;   r0x1042
;   STK01
;   r0x1043
;   r0x1044
;   r0x1045
;; Starting PostCode block
;	.def _FLASH_READ_FUN_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_FLASH_READ_FUN	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	108; "../Flash.c"	void FLASH_READ_FUN(unsigned int address,unsigned char length)
	BANKSEL	r0x1041
	MOV	r0x1041, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1042
	MOV	r0x1042, R0
;	::->op : RECEIVE
	BANKSEL	STK01
	MOVZ	R0, STK01
	BANKSEL	r0x1043
	MOV	r0x1043, R0
;	::->op : RIGHT_OP
;;102	MOVZ	R0, r0x1041
;;100	MOV	r0x1044, R0
;;1	CLR	r0x1045
;	::->op : CAST
;;101	MOVZ	R0, r0x1044
;	.line	112; "../Flash.c"	NVMADDRH=(unsigned char) (address>>8);
	BANKSEL	r0x1041
	MOVZ	R0, r0x1041
	BANKSEL	_NVMADDRH
	MOV	_NVMADDRH, R0
;	::->op : CAST
;	.line	113; "../Flash.c"	NVMADDRL=address;
	BANKSEL	r0x1042
	MOVZ	R0, r0x1042
	BANKSEL	_NVMADDRL
	MOV	_NVMADDRL, R0
;	::->op : INLINEASM
	;
	BANKSEL _INTCTL
	MOV R1,_INTCTL
	;
	CLR _INTCTL,_AIE
	JNB _INTCTL,_AIE
	JMP $-2
	;
	MOV R0,#0x30
	MOV R2,_OSCCTL
	MOV _OSCCTL,R0
	;
	MOV R3,#_FLASH_BUFFER
	
;	::->op : =
;	.line	131; "../Flash.c"	while(length--)	// 仅使用R0，不改变R1
	BANKSEL	r0x1043
	MOVZ	R0, r0x1043
	BANKSEL	r0x1042
	MOV	r0x1042, R0
;	::->op : LABEL
;	::->op : =
_00003_DS_
	BANKSEL	r0x1042
	MOVZ	R0, r0x1042
	BANKSEL	r0x1041
	MOV	r0x1041, R0
;	::->op : -
	BANKSEL	r0x1042
	DEC	r0x1042
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1041
	ORL	R0, r0x1041
	JNB	PSW, 2
	JMP	_00005_DS_
;	::->op : INLINEASM
	;
	BANKSEL _NVMCTL0
	MOV R5,#0x81
	MOV _NVMCTL0,R5
	NOPZ
	NOPZ
	NOPZ ;
	NOPZ
	;
	BANKSEL _NVMDATAL
	MOV R6,_NVMDATAL
	MOV R7,_NVMDATAH
	BANKSEL _FLASH_BUFFER
	ST [R3],R6
	INC R3
	ST [R3],R7
	INC R3
	;
	BANKSEL _NVMADDRL
	INC _NVMADDRL
	JNB _PSW,_Z
	INC _NVMADDRH
	
;	::->op : GOTO
	JMP	_00003_DS_
;	::->op : LABEL
;	::->op : INLINEASM
_00005_DS_
	;
	BANKSEL _OSCCTL
	MOV _OSCCTL,R2
	AND R1,#0xC0 ;
	ORL _INTCTL,R1
	
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _FLASH_READ_FUN_function_end, debug, value=$

; exit point of _FLASH_READ_FUN



func._FLASH_READ_ONE	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _FLASH_READ_ONE	;Function start
; 2 exit points
;has an exit
;5 compiler assigned registers:
;   r0x102D
;   STK00
;   r0x102E
;   r0x102F
;   r0x1030
;; Starting PostCode block
;	.def _FLASH_READ_ONE_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_FLASH_READ_ONE	;Function start
; 2 exit points
;	::->op : RECEIVE
;;1	MOV	r0x102D, R0
;	.line	16; "../Flash.c"	unsigned int FLASH_READ_ONE(unsigned int address)
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x102E
	MOV	r0x102E, R0
;	::->op : RIGHT_OP
;;99	MOVZ	R0, r0x102D
;;1	CLR	r0x1030
;	::->op : CAST
;	.line	22; "../Flash.c"	NVMADDRH=(unsigned char)(address>>8);
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	_NVMADDRH
	MOV	_NVMADDRH, R0
;	::->op : CAST
;	.line	23; "../Flash.c"	NVMADDRL=(unsigned char)address;
	BANKSEL	r0x102E
	MOVZ	R0, r0x102E
	BANKSEL	_NVMADDRL
	MOV	_NVMADDRL, R0
;	::->op : INLINEASM
	;
	BANKSEL _INTCTL
	MOV R1,_INTCTL
	;
	CLR _INTCTL,_AIE
	JNB _INTCTL,_AIE
	JMP $-2
	;
	MOV R0,#0x30
	MOV R2,_OSCCTL
	MOV _OSCCTL,R0
	;
	BANKSEL _NVMCTL0
	MOV R5,#0x81
	MOV _NVMCTL0,R5
	NOPZ
	NOPZ
	NOPZ
	NOPZ
	;
	MOV _OSCCTL,R2
	AND R1,#0xC0 ;
	ORL INTCTL,R1
	;
	BANKSEL _NVMDATAL
	MOV R6,_NVMDATAL
	MOV R7,_NVMDATAH
	BANKSEL _FLASH_READ_BUF
	MOV (_FLASH_READ_BUF),R6
	MOV (_FLASH_READ_BUF+1),R7
	
;	::->op : RETURN
;	.line	56; "../Flash.c"	return 	FLASH_READ_BUF;
	BANKSEL	_FLASH_READ_BUF
	MOVZ	R0, _FLASH_READ_BUF
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	_FLASH_READ_BUF
	MOVZ	R0, (_FLASH_READ_BUF + 1)
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _FLASH_READ_ONE_function_end, debug, value=$

; exit point of _FLASH_READ_ONE


;	code size estimation:
;	  382+  213 =   595 instructions ( 1616 byte)

;	.type _FLASH_READ_ONE,  32
;	.dim _FLASH_READ_ONE, 1, (_FLASH_READ_ONE_function_end&0xFF00)>>8, _FLASH_READ_ONE_function_end&0xFF,0,16,0,101 , 1, 1
;	.type _FLASH_READ_FUN,  32
;	.dim _FLASH_READ_FUN, 1, (_FLASH_READ_FUN_function_end&0xFF00)>>8, _FLASH_READ_FUN_function_end&0xFF,0,108,0,229 , 1, 1
;	.type _FLASH_WRITE_FUN,  32
;	.dim _FLASH_WRITE_FUN, 1, (_FLASH_WRITE_FUN_function_end&0xFF00)>>8, _FLASH_WRITE_FUN_function_end&0xFF,0,238,1,126 , 1, 1
;	.type _FLASH_WRITE_ONE,  32
;	.dim _FLASH_WRITE_ONE, 1, (_FLASH_WRITE_ONE_function_end&0xFF00)>>8, _FLASH_WRITE_ONE_function_end&0xFF,1,136,1,144 , 1, 1
;	.type _FLASH_Init,  32
;	.dim _FLASH_Init, 1, (_FLASH_Init_function_end&0xFF00)>>8, _FLASH_Init_function_end&0xFF,1,151,1,193 , 1, 1
;	.type _FLASH_Deal,  32
;	.dim _FLASH_Deal, 1, (_FLASH_Deal_function_end&0xFF00)>>8, _FLASH_Deal_function_end&0xFF,1,199,1,207 , 2, 1
;	.type _Flash_data_set,  32
;	.dim _Flash_data_set, 1, (_Flash_data_set_function_end&0xFF00)>>8, _Flash_data_set_function_end&0xFF,1,210,1,235 , 1, 1
;	.type _set_savefalg,  32
;	.dim _set_savefalg, 1, (_set_savefalg_function_end&0xFF00)>>8, _set_savefalg_function_end&0xFF,1,238,1,241 , 1, 1

	.end
