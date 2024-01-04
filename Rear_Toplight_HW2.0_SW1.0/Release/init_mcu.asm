;--------------------------------------------------------
; File Created by ChiponCC : ChipON  inc.
;--------------------------------------------------------
; chipon port for the 16-bit core
;--------------------------------------------------------
;	.file	"../init_mcu.c"
	.radix dec
	.include "kf8a100eng.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
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
	.extern	__moduint
	.extern	__divuint
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
	.global	_USART_Send_num
	.global	_UART_SendBuf
	.global	_Init_Usart
	.global	_Init_I2C_S
	.global	_Init_MCU
	.global	_Init_Touch_GPIO
	.global	_Init_Touch
	.global	_delay_us
	.global	_delay_ms
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
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_init_mcu_0	.udata
r0x1015	.res	1
UDL_init_mcu_1	.udata
r0x1014	.res	1
UDL_init_mcu_2	.udata
r0x1016	.res	1
UDL_init_mcu_3	.udata
r0x1017	.res	1
UDL_init_mcu_4	.udata
r0x1018	.res	1
UDL_init_mcu_5	.udata
r0x1019	.res	1
UDL_init_mcu_6	.udata
r0x101B	.res	1
UDL_init_mcu_7	.udata
r0x101A	.res	1
UDL_init_mcu_8	.udata
r0x101C	.res	1
UDL_init_mcu_9	.udata
r0x101D	.res	1
UDL_init_mcu_10	.udata
r0x101E	.res	1
UDL_init_mcu_11	.udata
r0x101F	.res	1
UDL_init_mcu_12	.udata
r0x100B	.res	1
UDL_init_mcu_13	.udata
r0x100A	.res	1
UDL_init_mcu_14	.udata
r0x100C	.res	1
UDL_init_mcu_15	.udata
r0x100D	.res	1
UDL_init_mcu_16	.udata
r0x100F	.res	1
UDL_init_mcu_17	.udata
r0x100E	.res	1
UDL_init_mcu_18	.udata
r0x1010	.res	1
UDL_init_mcu_19	.udata
r0x1011	.res	1
UDL_init_mcu_20	.udata
r0x1013	.res	1
UDL_init_mcu_21	.udata
r0x1012	.res	1
UDL_init_mcu_22	.udata
_USART_Send_num_s_1_1	.res	10
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	.udata_ovr


func._USART_Send_num	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _USART_Send_num	;Function start
; 2 exit points
;has an exit
;functions called:
;   __moduint
;   __divuint
;   _UART_SendBuf
;   _UART_SendBuf
;   _UART_SendBuf
;   _UART_SendBuf
;   __moduint
;   __divuint
;   _UART_SendBuf
;   _UART_SendBuf
;   _UART_SendBuf
;   _UART_SendBuf
;13 compiler assigned registers:
;   r0x100A
;   STK00
;   r0x100B
;   r0x100C
;   r0x100D
;   STK02
;   STK01
;   r0x100E
;   r0x100F
;   r0x1010
;   r0x1011
;   r0x1012
;   r0x1013
;; Starting PostCode block
;	.def _USART_Send_num_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_USART_Send_num	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	201; "../init_mcu.c"	void USART_Send_num(uint32_t num)
	BANKSEL	r0x100A
	MOV	r0x100A, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x100B
	MOV	r0x100B, R0
;	::->op : =
;	.line	205; "../init_mcu.c"	uint8_t count = 0;
	BANKSEL	r0x100C
	CLR	r0x100C
;	::->op : IFX
;	.line	206; "../init_mcu.c"	if (num > 0)
	BANKSEL	r0x100B
	MOVZ	R0, r0x100B
	BANKSEL	r0x100A
	ORL	R0, r0x100A
	JNB	PSW, 2
	JMP	_00047_DS_
;	::->op : =
;	.line	208; "../init_mcu.c"	while(num > 0){
	BANKSEL	r0x100D
	CLR	r0x100D
;	::->op : LABEL
;	::->op : IFX
_00043_DS_
	BANKSEL	r0x100B
	MOVZ	R0, r0x100B
	BANKSEL	r0x100A
	ORL	R0, r0x100A
	JNB	PSW, 2
	JMP	_00065_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	209; "../init_mcu.c"	temp = num % 10;
	MOV	R0,# 0x0a
	BANKSEL	STK02
	MOV	STK02, R0
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x100B
	MOVZ	R0, r0x100B
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x100A
	MOVZ	R0, r0x100A
	PAGESEL	__moduint
	CALL	__moduint
	PAGESEL	$
	BANKSEL	r0x100E
	MOV	r0x100E, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x100F
	MOV	r0x100F, R0
;	::->op : CAST
	BANKSEL	r0x100F
	MOVZ	R0, r0x100F
	BANKSEL	r0x1010
	MOV	r0x1010, R0
;	::->op : +
;	.line	210; "../init_mcu.c"	s[count] = temp + 48;  //'0' ASCALL 48
	BANKSEL	r0x100D
	MOV	R0, r0x100D
	ADD	R0,# (_USART_Send_num_s_1_1 + 0)
	BANKSEL	r0x100F
	MOV	r0x100F, R0
;	::->op : +
	MOV	R0,# 0x30
	BANKSEL	r0x1010
	ADD	R0, r0x1010
	BANKSEL	r0x1011
	MOV	r0x1011, R0
;	::->op :*  =
	BANKSEL	r0x1011
	MOVZ	R0, r0x1011
	BANKSEL	r0x100F
	MOV	R1, r0x100F
	BANKSEL	_USART_Send_num_s_1_1
	ST	[R1], R0
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	211; "../init_mcu.c"	num = num / 10;
	MOV	R0,# 0x0a
	BANKSEL	STK02
	MOV	STK02, R0
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x100B
	MOVZ	R0, r0x100B
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x100A
	MOVZ	R0, r0x100A
	PAGESEL	__divuint
	CALL	__divuint
	PAGESEL	$
	BANKSEL	r0x100A
	MOV	r0x100A, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x100B
	MOV	r0x100B, R0
;	::->op : +
;	.line	212; "../init_mcu.c"	count++;
	BANKSEL	r0x100D
	INC	r0x100D
;	::->op : =
	BANKSEL	r0x100D
	MOVZ	R0, r0x100D
	BANKSEL	r0x100C
	MOV	r0x100C, R0
;	::->op : GOTO
	JMP	_00043_DS_
;	::->op : LABEL
;	::->op : =
_00065_DS_
	BANKSEL	r0x100D
	MOVZ	R0, r0x100D
	BANKSEL	r0x100C
	MOV	r0x100C, R0
;	::->op : RIGHT_OP
;	.line	215; "../init_mcu.c"	for(i = 0; i <= count/2 - 1; i++)
	CLR	PSW, 0
	BANKSEL	r0x100D
	RRCR	r0x100D
	BANKSEL	r0x100B
	MOV	r0x100B, R0
;	::->op : =
	BANKSEL	r0x100A
	CLR	r0x100A
;	::->op : LABEL
;	::->op : CAST
_00049_DS_
	BANKSEL	r0x100B
	MOVZ	R0, r0x100B
	BANKSEL	r0x100D
	MOV	r0x100D, R0
	BANKSEL	r0x100F
	CLR	r0x100F
;	::->op : -
	MOV	R0,# 0xff
	BANKSEL	r0x100D
	ADD	r0x100D, R0
	JNB	PSW, 0
	JMP	_00070_DS_
	BANKSEL	r0x100F
	DEC	r0x100F
;	::->op : CAST
_00070_DS_
	BANKSEL	r0x100A
	MOVZ	R0, r0x100A
	BANKSEL	r0x100E
	MOV	r0x100E, R0
	BANKSEL	r0x1011
	CLR	r0x1011
;	::->op : >
	BANKSEL	r0x100F
	MOVZ	R0, r0x100F
	ADD	R0,# 0x80
	BANKSEL	r0x1012
	MOV	r0x1012, R0
	MOV	R0,# 0x00
	ADD	R0,# 0x80
	BANKSEL	r0x1012
	SUB	R0, r0x1012
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00068_DS_
	BANKSEL	r0x100E
	MOVZ	R0, r0x100E
	BANKSEL	r0x100D
	SUB	R0, r0x100D
_00068_DS_
	JB	PSW, 0
	JMP	_00052_DS_
;	::->op : +
;	.line	217; "../init_mcu.c"	temp = s[i];
	BANKSEL	r0x100A
	MOV	R0, r0x100A
	ADD	R0,# (_USART_Send_num_s_1_1 + 0)
	BANKSEL	r0x100D
	MOV	r0x100D, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x100D
	MOV	R1, r0x100D
	BANKSEL	_USART_Send_num_s_1_1
	LD	R0, [R1]
	BANKSEL	r0x1010
	MOV	r0x1010, R0
;	::->op : +
;	.line	218; "../init_mcu.c"	s[i] = s[count-i-1];
	BANKSEL	r0x100A
	MOV	R0, r0x100A
	ADD	R0,# (_USART_Send_num_s_1_1 + 0)
	BANKSEL	r0x100D
	MOV	r0x100D, R0
;	::->op : -
	BANKSEL	r0x100A
	MOVZ	R0, r0x100A
	BANKSEL	r0x100C
	SUB	R0, r0x100C
	BANKSEL	r0x100E
	MOV	r0x100E, R0
;	::->op : -
	BANKSEL	r0x100E
	DEC	r0x100E
;	::->op : +
	MOV	R0,# (_USART_Send_num_s_1_1 + 0)
	BANKSEL	r0x100E
	ADD	r0x100E, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x100E
	MOV	R1, r0x100E
	BANKSEL	_USART_Send_num_s_1_1
	LD	R0, [R1]
	BANKSEL	r0x1013
	MOV	r0x1013, R0
;	::->op :*  =
	BANKSEL	r0x1013
	MOVZ	R0, r0x1013
	BANKSEL	r0x100D
	MOV	R1, r0x100D
	BANKSEL	_USART_Send_num_s_1_1
	ST	[R1], R0
;	::->op : -
;	.line	219; "../init_mcu.c"	s[count-i-1] = temp;
	BANKSEL	r0x100A
	MOVZ	R0, r0x100A
	BANKSEL	r0x100C
	SUB	R0, r0x100C
	BANKSEL	r0x100D
	MOV	r0x100D, R0
;	::->op : -
	BANKSEL	r0x100D
	DEC	r0x100D
;	::->op : +
	MOV	R0,# (_USART_Send_num_s_1_1 + 0)
	BANKSEL	r0x100D
	ADD	r0x100D, R0
;	::->op :*  =
	BANKSEL	r0x1010
	MOVZ	R0, r0x1010
	BANKSEL	r0x100D
	MOV	R1, r0x100D
	BANKSEL	_USART_Send_num_s_1_1
	ST	[R1], R0
;	::->op : +
;	.line	215; "../init_mcu.c"	for(i = 0; i <= count/2 - 1; i++)
	BANKSEL	r0x100A
	INC	r0x100A
;	::->op : GOTO
	JMP	_00049_DS_
;	::->op : LABEL
;	::->op : =
_00052_DS_
;	.line	222; "../init_mcu.c"	for(i = 0; i < count; i++)
	BANKSEL	r0x100B
	CLR	r0x100B
;	::->op : LABEL
;	::->op : <
_00053_DS_
	BANKSEL	r0x100C
	MOVZ	R0, r0x100C
	BANKSEL	r0x100B
	SUB	R0, r0x100B
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00056_DS_
;	::->op : +
;	.line	223; "../init_mcu.c"	UART_SendBuf(s[i]);
	BANKSEL	r0x100B
	MOV	R0, r0x100B
	ADD	R0,# (_USART_Send_num_s_1_1 + 0)
	BANKSEL	r0x100A
	MOV	r0x100A, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x100A
	MOV	R1, r0x100A
	BANKSEL	_USART_Send_num_s_1_1
	LD	R0, [R1]
	BANKSEL	r0x100F
	MOV	r0x100F, R0
;	::->op : SEND
;	::->op : CALL
	BANKSEL	r0x100F
	MOVZ	R0, r0x100F
	PAGESEL	_UART_SendBuf
	CALL	_UART_SendBuf
	PAGESEL	$
;	::->op : +
;	.line	222; "../init_mcu.c"	for(i = 0; i < count; i++)
	BANKSEL	r0x100B
	INC	r0x100B
;	::->op : GOTO
	JMP	_00053_DS_
;	::->op : LABEL
;	::->op : SEND
;	::->op : CALL
_00056_DS_
;	.line	224; "../init_mcu.c"	UART_SendBuf('\n');
	MOV	R0,# 0x0a
	PAGESEL	_UART_SendBuf
	CALL	_UART_SendBuf
	PAGESEL	$
;	::->op : GOTO
	JMP	_00057_DS_
;	::->op : LABEL
;	::->op : SEND
;	::->op : CALL
_00047_DS_
;	.line	230; "../init_mcu.c"	UART_SendBuf('0');
	MOV	R0,# 0x30
	PAGESEL	_UART_SendBuf
	CALL	_UART_SendBuf
	PAGESEL	$
;	::->op : SEND
;	::->op : CALL
;	.line	231; "../init_mcu.c"	UART_SendBuf('\n');
	MOV	R0,# 0x0a
	PAGESEL	_UART_SendBuf
	CALL	_UART_SendBuf
	PAGESEL	$
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00057_DS_
	CRET	
;	.def _USART_Send_num_function_end, debug, value=$

; exit point of _USART_Send_num



func._UART_SendBuf	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _UART_SendBuf	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	.def _UART_SendBuf_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_UART_SendBuf	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	195; "../init_mcu.c"	void UART_SendBuf(unsigned char SendTemp)
	BANKSEL	_TXSDR
	MOV	_TXSDR, R0
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00037_DS_
;	.line	198; "../init_mcu.c"	while(TXSRS == 0);
	BANKSEL	_TSCTL_bits
	JB	_TSCTL_bits, 1
	JMP	_00037_DS_
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _UART_SendBuf_function_end, debug, value=$

; exit point of _UART_SendBuf



func._Init_Usart	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Init_Usart	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	.def _Init_Usart_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Init_Usart	;Function start
; 2 exit points
;	::->op : =
;	.line	176; "../init_mcu.c"	BRCTL = 0x40;	// 	接收空闲  使用8位计数器，不考虑唤醒是使能和自动波特率检测
	MOV	R0,# 0x40
	BANKSEL	_BRCTL
	MOV	_BRCTL, R0
;	::->op : =
;	.line	182; "../init_mcu.c"	EUBRGH = 0x00;	// 波特率公式=SCLK/(m*y+1),其中SCLK系统时钟，如这里8M，m为倍频数，见手册，y为8位或16位波特率计数值
	BANKSEL	_EUBRGH
	CLR	_EUBRGH
;	::->op : =
;	.line	184; "../init_mcu.c"	EUBRGL = 0x08; 	// SYNC=0(全双工异步模式),BRG16=0(使用8位波特率发生器),HBRG=1(高速)
	MOV	R0,# 0x08
	BANKSEL	_EUBRGL
	MOV	_EUBRGL, R0
;	::->op : =
;	.line	185; "../init_mcu.c"	TSCTL = 0x26;  	// 8位 发送，使能发送，全双工异步模式SYNC=0，低速模式HBRG=1，发送移位空,不发送同步间隔符
	MOV	R0,# 0x26
	BANKSEL	_TSCTL
	MOV	_TSCTL, R0
;	::->op : =
;	.line	186; "../init_mcu.c"	RSCTL = 0x90;  	// 串口使能（配置引脚为串行口引脚），8位接收，接收使能，无帧错误，溢出错误，不考虑地址识别和第9位
	MOV	R0,# 0x90
	BANKSEL	_RSCTL
	MOV	_RSCTL, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _Init_Usart_function_end, debug, value=$

; exit point of _Init_Usart



func._Init_I2C_S	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Init_I2C_S	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	.def _Init_I2C_S_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Init_I2C_S	;Function start
; 2 exit points
;	::->op :*  =
;	.line	151; "../init_mcu.c"	SSCIPIN = 0;			//SDA = P00, SCL =P01
	BANKSEL	_ANSEH_bits
	CLR	_ANSEH_bits, 7
;	::->op :*  =
;	.line	152; "../init_mcu.c"	TR00 = 1;				//P00 SDA,设置为输入态
	BANKSEL	_TR0_bits
	SET	_TR0_bits, 0
;	::->op :*  =
;	.line	153; "../init_mcu.c"	TR01 = 1;				//P01 SCL,设置为输入态
	BANKSEL	_TR0_bits
	SET	_TR0_bits, 1
;	::->op : =
;	.line	156; "../init_mcu.c"	SSCICTL0 = 0x36;		//使能IIC端口，使能时钟，IIC从动模式，7位地址
	MOV	R0,# 0x36
	BANKSEL	_SSCICTL0
	MOV	_SSCICTL0, R0
;	::->op : =
;	.line	157; "../init_mcu.c"	SSCICTL1 = 0x00;		//禁止广播呼叫地址匹配中断
	BANKSEL	_SSCICTL1
	CLR	_SSCICTL1
;	::->op : =
;	.line	158; "../init_mcu.c"	SSCIADD = I2C_SLAVE_ADDR;//芯片地址设定
	MOV	R0,# 0x10
	BANKSEL	_SSCIADD
	MOV	_SSCIADD, R0
;	::->op : =
;	.line	159; "../init_mcu.c"	SSCISTA = 0x00;
	BANKSEL	_SSCISTA
	CLR	_SSCISTA
;	::->op :*  =
;	.line	160; "../init_mcu.c"	SSCIIF  =0;
	BANKSEL	_EIF2_bits
	CLR	_EIF2_bits, 0
;	::->op :*  =
;	.line	161; "../init_mcu.c"	PSSCI = 0;	            // 低优先级
	BANKSEL	_IP2_bits
	CLR	_IP2_bits, 0
;	::->op :*  =
;	.line	162; "../init_mcu.c"	SSCIIF = 0;	            // 清除标志位
	BANKSEL	_EIF2_bits
	CLR	_EIF2_bits, 0
;	::->op :*  =
;	.line	163; "../init_mcu.c"	SSCIIE = 1;             // 使能I2C中断
	BANKSEL	_EIE2_bits
	SET	_EIE2_bits, 0
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _Init_I2C_S_function_end, debug, value=$

; exit point of _Init_I2C_S



func._Init_MCU	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Init_MCU	;Function start
; 2 exit points
;has an exit
;functions called:
;   _Init_Touch_GPIO
;   _Init_Touch
;   _delay_ms
;   _Init_Touch_GPIO
;   _Init_Touch
;   _delay_ms
;1 compiler assigned register :
;   STK00
;; Starting PostCode block
;	.def _Init_MCU_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Init_MCU	;Function start
; 2 exit points
;	::->op : =
;	.line	116; "../init_mcu.c"	OSCCTL = 0x70;
	MOV	R0,# 0x70
	BANKSEL	_OSCCTL
	MOV	_OSCCTL, R0
;	::->op : CALL
;	.line	118; "../init_mcu.c"	Init_Touch_GPIO();  //IO口初始化  P0中断使能
	PAGESEL	_Init_Touch_GPIO
	CALL	_Init_Touch_GPIO
	PAGESEL	$
;	::->op :*  =
;	.line	123; "../init_mcu.c"	IPEN = 1;  //使能中断优先级功能
	BANKSEL	_PCTL_bits
	SET	_PCTL_bits, 3
;	::->op : CALL
;	.line	131; "../init_mcu.c"	Init_Touch();
	PAGESEL	_Init_Touch
	CALL	_Init_Touch
	PAGESEL	$
;	::->op :*  =
;	.line	133; "../init_mcu.c"	AIEH = 1; //使能高优先级中断--触摸中断--对应Interrupt 0
	BANKSEL	_INTCTL_bits
	SET	_INTCTL_bits, 7
;	::->op :*  =
;	.line	134; "../init_mcu.c"	AIEL = 1; //使能低优先级中断--I2C中断 --对应Interrupt  1
	BANKSEL	_INTCTL_bits
	SET	_INTCTL_bits, 6
;	::->op : SEND
;	::->op : CALL
;	.line	138; "../init_mcu.c"	delay_ms(10);
	MOV	R0,# 0x0a
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x00
	PAGESEL	_delay_ms
	CALL	_delay_ms
	PAGESEL	$
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _Init_MCU_function_end, debug, value=$

; exit point of _Init_MCU



func._Init_Touch_GPIO	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Init_Touch_GPIO	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	.def _Init_Touch_GPIO_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Init_Touch_GPIO	;Function start
; 2 exit points
;	::->op : =
;	.line	96; "../init_mcu.c"	TR0 = 0b00110100;
	MOV	R0,# 0x34
	BANKSEL	_TR0
	MOV	_TR0, R0
;	::->op : =
;	.line	97; "../init_mcu.c"	TR1 = 0b01100111;
	MOV	R0,# 0x67
	BANKSEL	_TR1
	MOV	_TR1, R0
;	::->op : =
;	.line	98; "../init_mcu.c"	TR2 = 0b00000000;
	BANKSEL	_TR2
	CLR	_TR2
;	::->op :*  =
;	.line	100; "../init_mcu.c"	TR04 = 1;  //P04（Cx电容引脚）
	BANKSEL	_TR0_bits
	SET	_TR0_bits, 4
;	::->op :*  =
;	.line	103; "../init_mcu.c"	IOCL5 = 1; //IOCL5 P05口 使能引脚变化中断
	BANKSEL	_IOCL_bits
	SET	_IOCL_bits, 5
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _Init_Touch_GPIO_function_end, debug, value=$

; exit point of _Init_Touch_GPIO



func._Init_Touch	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Init_Touch	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	.def _Init_Touch_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Init_Touch	;Function start
; 2 exit points
;	::->op : =
;	.line	65; "../init_mcu.c"	CTCTL1 	= 0x01;
	MOV	R0,# 0x01
	BANKSEL	_CTCTL1
	MOV	_CTCTL1, R0
;	::->op : =
;	.line	66; "../init_mcu.c"	VRECTL	=0x92;
	MOV	R0,# 0x92
	BANKSEL	_VRECTL
	MOV	_VRECTL, R0
;	::->op : INLINEASM
	;;VDACS=0x40;
	MOVB #0x00
	MOV R0,#0x40
	ORL 0x1A,R0
	
;	::->op : =
;	.line	73; "../init_mcu.c"	VDAC=0xC0;
	MOV	R0,# 0xc0
	BANKSEL	_VDAC
	MOV	_VDAC, R0
;	::->op :*  =
;	.line	75; "../init_mcu.c"	PT3 = 1;   //T3的触摸中断优先级为高
	BANKSEL	_IP2_bits
	SET	_IP2_bits, 7
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _Init_Touch_function_end, debug, value=$

; exit point of _Init_Touch



func._delay_us	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _delay_us	;Function start
; 2 exit points
;has an exit
;7 compiler assigned registers:
;   r0x101A
;   STK00
;   r0x101B
;   r0x101C
;   r0x101D
;   r0x101E
;   r0x101F
;; Starting PostCode block
;	.def _delay_us_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_delay_us	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	37; "../init_mcu.c"	void delay_us(unsigned int us_data)
	BANKSEL	r0x101A
	MOV	r0x101A, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x101B
	MOV	r0x101B, R0
;	::->op : =
;	::->op : LABEL
;	::->op : =
_00017_DS_
;	.line	40; "../init_mcu.c"	while(us_data--)
	BANKSEL	r0x101B
	MOVZ	R0, r0x101B
	BANKSEL	r0x101C
	MOV	r0x101C, R0
	BANKSEL	r0x101A
	MOVZ	R0, r0x101A
	BANKSEL	r0x101D
	MOV	r0x101D, R0
;	::->op : -
	MOV	R0,# 0xff
	BANKSEL	r0x101B
	ADD	r0x101B, R0
	JNB	PSW, 0
	JMP	_00071_DS_
	BANKSEL	r0x101A
	DEC	r0x101A
;	::->op : IFX
_00071_DS_
	BANKSEL	r0x101C
	MOVZ	R0, r0x101C
	BANKSEL	r0x101D
	ORL	R0, r0x101D
	JNB	PSW, 2
	JMP	_00020_DS_
;	::->op : INLINEASM
	CWDT 
;	::->op : =
;	.line	44; "../init_mcu.c"	while(j--)
	MOV	R0,# 0x01
	BANKSEL	r0x101C
	MOV	r0x101C, R0
	BANKSEL	r0x101D
	CLR	r0x101D
;	::->op : LABEL
;	::->op : =
_00014_DS_
	BANKSEL	r0x101C
	MOVZ	R0, r0x101C
	BANKSEL	r0x101E
	MOV	r0x101E, R0
	BANKSEL	r0x101D
	MOVZ	R0, r0x101D
	BANKSEL	r0x101F
	MOV	r0x101F, R0
;	::->op : -
	MOV	R0,# 0xff
	BANKSEL	r0x101C
	ADD	r0x101C, R0
	JNB	PSW, 0
	JMP	_00072_DS_
	BANKSEL	r0x101D
	DEC	r0x101D
;	::->op : IFX
_00072_DS_
	BANKSEL	r0x101E
	MOVZ	R0, r0x101E
	BANKSEL	r0x101F
	ORL	R0, r0x101F
	JNB	PSW, 2
	JMP	_00017_DS_
;	::->op : INLINEASM
	CWDT 
;	::->op : GOTO
	JMP	_00014_DS_
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00020_DS_
	CRET	
;	.def _delay_us_function_end, debug, value=$

; exit point of _delay_us



func._delay_ms	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _delay_ms	;Function start
; 2 exit points
;has an exit
;7 compiler assigned registers:
;   r0x1014
;   STK00
;   r0x1015
;   r0x1016
;   r0x1017
;   r0x1018
;   r0x1019
;; Starting PostCode block
;	.def _delay_ms_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_delay_ms	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	16; "../init_mcu.c"	void delay_ms(unsigned int ms_data)
	BANKSEL	r0x1014
	MOV	r0x1014, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1015
	MOV	r0x1015, R0
;	::->op : =
;	::->op : LABEL
;	::->op : =
_00004_DS_
;	.line	19; "../init_mcu.c"	while(ms_data--)
	BANKSEL	r0x1015
	MOVZ	R0, r0x1015
	BANKSEL	r0x1016
	MOV	r0x1016, R0
	BANKSEL	r0x1014
	MOVZ	R0, r0x1014
	BANKSEL	r0x1017
	MOV	r0x1017, R0
;	::->op : -
	MOV	R0,# 0xff
	BANKSEL	r0x1015
	ADD	r0x1015, R0
	JNB	PSW, 0
	JMP	_00073_DS_
	BANKSEL	r0x1014
	DEC	r0x1014
;	::->op : IFX
_00073_DS_
	BANKSEL	r0x1016
	MOVZ	R0, r0x1016
	BANKSEL	r0x1017
	ORL	R0, r0x1017
	JNB	PSW, 2
	JMP	_00007_DS_
;	::->op : INLINEASM
	CWDT 
;	::->op : =
;	.line	23; "../init_mcu.c"	while(j--)
	MOV	R0,# 0xc8
	BANKSEL	r0x1016
	MOV	r0x1016, R0
	BANKSEL	r0x1017
	CLR	r0x1017
;	::->op : LABEL
;	::->op : =
_00001_DS_
	BANKSEL	r0x1016
	MOVZ	R0, r0x1016
	BANKSEL	r0x1018
	MOV	r0x1018, R0
	BANKSEL	r0x1017
	MOVZ	R0, r0x1017
	BANKSEL	r0x1019
	MOV	r0x1019, R0
;	::->op : -
	MOV	R0,# 0xff
	BANKSEL	r0x1016
	ADD	r0x1016, R0
	JNB	PSW, 0
	JMP	_00074_DS_
	BANKSEL	r0x1017
	DEC	r0x1017
;	::->op : IFX
_00074_DS_
	BANKSEL	r0x1018
	MOVZ	R0, r0x1018
	BANKSEL	r0x1019
	ORL	R0, r0x1019
	JNB	PSW, 2
	JMP	_00004_DS_
;	::->op : INLINEASM
	CWDT 
;	::->op : GOTO
	JMP	_00001_DS_
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00007_DS_
	CRET	
;	.def _delay_ms_function_end, debug, value=$

; exit point of _delay_ms


;	code size estimation:
;	  276+  166 =   442 instructions ( 1216 byte)

;	.type _delay_ms,  32
;	.dim _delay_ms, 1, (_delay_ms_function_end&0xFF00)>>8, _delay_ms_function_end&0xFF,0,16,0,28 , 1, 1
;	.type _delay_us,  32
;	.dim _delay_us, 1, (_delay_us_function_end&0xFF00)>>8, _delay_us_function_end&0xFF,0,37,0,49 , 1, 1
;	.type _Init_Touch,  32
;	.dim _Init_Touch, 1, (_Init_Touch_function_end&0xFF00)>>8, _Init_Touch_function_end&0xFF,0,57,0,76 , 1, 1
;	.type _Init_Touch_GPIO,  32
;	.dim _Init_Touch_GPIO, 1, (_Init_Touch_GPIO_function_end&0xFF00)>>8, _Init_Touch_GPIO_function_end&0xFF,0,84,0,105 , 1, 1
;	.type _Init_MCU,  32
;	.dim _Init_MCU, 1, (_Init_MCU_function_end&0xFF00)>>8, _Init_MCU_function_end&0xFF,0,113,0,140 , 1, 1
;	.type _Init_I2C_S,  32
;	.dim _Init_I2C_S, 1, (_Init_I2C_S_function_end&0xFF00)>>8, _Init_I2C_S_function_end&0xFF,0,149,0,164 , 1, 1
;	.type _Init_Usart,  32
;	.dim _Init_Usart, 1, (_Init_Usart_function_end&0xFF00)>>8, _Init_Usart_function_end&0xFF,0,173,0,187 , 1, 1
;	.type _UART_SendBuf,  32
;	.dim _UART_SendBuf, 1, (_UART_SendBuf_function_end&0xFF00)>>8, _UART_SendBuf_function_end&0xFF,0,195,0,199 , 1, 1
;	.type _USART_Send_num,  32
;	.dim _USART_Send_num, 1, (_USART_Send_num_function_end&0xFF00)>>8, _USART_Send_num_function_end&0xFF,0,201,0,235 , 1, 1

	.end
