;--------------------------------------------------------
; File Created by ChiponCC : ChipON  inc.
;--------------------------------------------------------
; chipon port for the 16-bit core
;--------------------------------------------------------
;	.file	"../Timer.c"
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
	.extern	_FLASH_READ_ONE
	.extern	_FLASH_READ_FUN
	.extern	_FLASH_WRITE_ONE
	.extern	_FLASH_WRITE_FUN
	.extern	_FLASH_Init
	.extern	_FLASH_Deal
	.extern	_Flash_data_set
	.extern	_set_savefalg
	.extern	_Timer4_Init
	.extern	___uchar2fs
	.extern	___fsmul
	.extern	___fs2uchar
	.extern	__mulint
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
	.global	_Clock_ClearSysLEDTimeStatus
	.global	_Clock_GetSysLEDTimeStatus
	.global	_pwm_deal
	.global	_get_pwmduty
	.global	_P0_INT_init
	.global	_timer_init
	.global	_set_PWM2L
	.global	_set_PWM1L
	.global	_Timer1_Init
	.global	_Timer0_Init
	.global	_int_fun0
	.global	_int_fun1
	.global	_count
	.global	_H_Level_C
	.global	_H_Level_T
	.global	_L_Level_C
	.global	_L_Level_T
	.global	_flag
	.global	_Pwm_duty
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
UDL_Timer_0	.udata
r0x1017	.res	1
UDL_Timer_1	.udata
r0x101A	.res	1
UDL_Timer_2	.udata
r0x1019	.res	1
UDL_Timer_3	.udata
r0x1018	.res	1
UDL_Timer_4	.udata
r0x1013	.res	1
UDL_Timer_5	.udata
r0x1016	.res	1
UDL_Timer_6	.udata
r0x1015	.res	1
UDL_Timer_7	.udata
r0x1014	.res	1
UDL_Timer_8	.udata
r0x1010	.res	1
UDL_Timer_9	.udata
r0x100F	.res	1
UDL_Timer_10	.udata
r0x1012	.res	1
UDL_Timer_11	.udata
r0x1011	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_Timer_0	.idata
_count
	.db	0x00, 0x00


ID_Timer_1	.idata
_H_Level_C
	.db	0x00, 0x00


ID_Timer_2	.idata
_H_Level_T
	.db	0x00, 0x00


ID_Timer_3	.idata
_L_Level_C
	.db	0x00, 0x00


ID_Timer_4	.idata
_L_Level_T
	.db	0x00, 0x00


ID_Timer_5	.idata
_sys_LED_Time
	.db	0x00, 0x00


ID_Timer_6	.idata
_flag
	.db	0x02


ID_Timer_7	.idata
_Pwm_duty
	.db	0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	.udata_ovr
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
interrupt_0x04	.code	0x4
	MOV		R2,R0
	MOV		R3,BANK
	MOV		R0,PSW
	BANKSEL	I0PSW
	MOV		I0PSW,R0
	MOV		R0,PCH
	BANKSEL	I0PCH
	MOV		I0PCH,R0
	MOV		I0R1,R1
	MOV		I0R7,R7
	PAGESEL	interrupt_service_routine_0x04
	JMP		interrupt_service_routine_0x04



func._int_fun0	.code
;***
;  PostBlock Stats: dbName = I
;***
;entry:  _int_fun0	;Function start
; 0 exit points
;; Starting PostCode block
;	.def _int_fun0_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_int_fun0	;Function start
; 0 exit points
;	::->op : GET_VALUE_AT_ADDRESS
; R3 resprent for wsave,R4 resprent for ssave, R5 resprent for psave
interrupt_service_routine_0x04
;	.line	239; "../Timer.c"	if(T3IF)
	BANKSEL	_EIF2_bits
	JB	_EIF2_bits, 7
	JMP	_00031_DS_
;	::->op :*  =
;	.line	241; "../Timer.c"	T3IF = 0;
	BANKSEL	_EIF2_bits
	CLR	_EIF2_bits, 7
;	::->op : =
;	.line	242; "../Timer.c"	Touch_Int_Flg = 1;
	MOV	R0,# 0x01
	BANKSEL	_Touch_Int_Flg
	MOV	_Touch_Int_Flg, R0
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00031_DS_
;	.line	245; "../Timer.c"	if(T0IF)   //T0中断
	BANKSEL	_INTCTL_bits
	JB	_INTCTL_bits, 2
	JMP	_00033_DS_
;	::->op :*  =
;	.line	247; "../Timer.c"	T0IF = 0;
	BANKSEL	_INTCTL_bits
	CLR	_INTCTL_bits, 2
;	::->op : +
;	.line	248; "../Timer.c"	count++;
	BANKSEL	_count
	INC	_count
	JB	PSW, 2
	JMP	_00058_DS_
	BANKSEL	_count
	INC	(_count + 1)
;	::->op : +
_00058_DS_
;	.line	249; "../Timer.c"	sys_LED_Time++;
	BANKSEL	_sys_LED_Time
	INC	_sys_LED_Time
	JB	PSW, 2
	JMP	_00059_DS_
	BANKSEL	_sys_LED_Time
	INC	(_sys_LED_Time + 1)
;	::->op : INLINEASM
_00059_DS_
	CWDT 
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00033_DS_
;	.line	253; "../Timer.c"	if(P0IF)  //P0电平变化中断
	BANKSEL	_INTCTL_bits
	JB	_INTCTL_bits, 0
	JMP	_00045_DS_
;	::->op : INLINEASM
	
	BANKSEL P0 
	MOV P0 
	
;	::->op :*  =
;	.line	256; "../Timer.c"	P0IF=0; //清零中断标志量
	BANKSEL	_INTCTL_bits
	CLR	_INTCTL_bits, 0
;	::->op : EQ_OP
;	.line	258; "../Timer.c"	if(flag == 1)	//已获取高电平
	BANKSEL	_flag
	MOVZ	R0, _flag
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00035_DS_
;	::->op : =
;	.line	260; "../Timer.c"	flag = 2; //2表示获取到下降沿，记录高电平值
	MOV	R0,# 0x02
	BANKSEL	_flag
	MOV	_flag, R0
;	::->op : =
;	.line	261; "../Timer.c"	H_Level_C = count;  //定时器圈数
	BANKSEL	_count
	MOVZ	R0, _count
	BANKSEL	_H_Level_C
	MOV	_H_Level_C, R0
	BANKSEL	_count
	MOVZ	R0, (_count + 1)
	BANKSEL	_H_Level_C
	MOV	(_H_Level_C + 1), R0
;	::->op : CAST
;	.line	262; "../Timer.c"	H_Level_T = T0;		//T0当前值
	BANKSEL	_T0
	MOVZ	R0, _T0
	BANKSEL	_H_Level_T
	MOV	_H_Level_T, R0
	BANKSEL	_H_Level_T
	CLR	(_H_Level_T + 1)
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00035_DS_
;	.line	265; "../Timer.c"	if(!P05)  //根据电路 输入高电平时 读为电平
	BANKSEL	_P0_bits
	JNB	_P0_bits, 5
	JMP	_00045_DS_
;	::->op : IFX
;	.line	267; "../Timer.c"	if(flag == 0)   //初始等待状态
	MOV	R0,# 0x00
	BANKSEL	_flag
	ORL	R0, _flag
	JB	PSW, 2
	JMP	_00039_DS_
;	::->op : =
;	.line	269; "../Timer.c"	flag = 1; //1表示初次获取到上升沿，初始化
	MOV	R0,# 0x01
	BANKSEL	_flag
	MOV	_flag, R0
;	::->op : =
;	.line	270; "../Timer.c"	T0 = 0;	//清零计数
	BANKSEL	_T0
	CLR	_T0
;	::->op : =
;	.line	271; "../Timer.c"	count = 0;
	BANKSEL	_count
	CLR	_count
	BANKSEL	_count
	CLR	(_count + 1)
;	::->op : GOTO
	JMP	_00045_DS_
;	::->op : LABEL
;	::->op : EQ_OP
_00039_DS_
;	.line	274; "../Timer.c"	if(flag == 2)   //第二次获取上升沿 一个周期
	BANKSEL	_flag
	MOVZ	R0, _flag
	XOR	R0,# 0x02
	JB	PSW, 2
	JMP	_00045_DS_
;	::->op : =
;	.line	276; "../Timer.c"	L_Level_C = count;  //定时器圈数
	BANKSEL	_count
	MOVZ	R0, _count
	BANKSEL	_L_Level_C
	MOV	_L_Level_C, R0
	BANKSEL	_count
	MOVZ	R0, (_count + 1)
	BANKSEL	_L_Level_C
	MOV	(_L_Level_C + 1), R0
;	::->op : CAST
;	.line	277; "../Timer.c"	L_Level_T = T0;		//T0当前值
	BANKSEL	_T0
	MOVZ	R0, _T0
	BANKSEL	_L_Level_T
	MOV	_L_Level_T, R0
	BANKSEL	_L_Level_T
	CLR	(_L_Level_T + 1)
;	::->op : =
;	.line	279; "../Timer.c"	flag = 1;       //标记下一个周期捕获到上升沿
	MOV	R0,# 0x01
	BANKSEL	_flag
	MOV	_flag, R0
;	::->op : =
;	.line	280; "../Timer.c"	T0 = 0;	//清零计数
	BANKSEL	_T0
	CLR	_T0
;	::->op : =
;	.line	281; "../Timer.c"	count = 0;
	BANKSEL	_count
	CLR	_count
	BANKSEL	_count
	CLR	(_count + 1)
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00045_DS_
	BANKSEL	I0R1
	MOV	R1, I0R1
	BANKSEL	I0R7
	MOV	R7, I0R7
	BANKSEL	I0PCH
	MOV	R0, I0PCH
	MOV	PCH, R0
	BANKSEL	I0PSW
	MOV	R0, I0PSW
	MOV	PSW, R0
	MOV	BANK, R3
	MOV	R0, R2
	IRET	
;	.def _int_fun0_function_end, debug, value=$




func._int_fun1	.code
;***
;  PostBlock Stats: dbName = I
;***
;entry:  _int_fun1	;Function start
; 0 exit points
;; Starting PostCode block
;	.def _int_fun1_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_int_fun1	;Function start
; 0 exit points
;	::->op : LABEL
;	::->op : ENDFUNCTION
; R3 resprent for wsave,R4 resprent for ssave, R5 resprent for psave
interrupt_service_routine_0x14
_00054_DS_
;	.line	291; "../Timer.c"	}
	IRET	
;	.def _int_fun1_function_end, debug, value=$




func._Clock_ClearSysLEDTimeStatus	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Clock_ClearSysLEDTimeStatus	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	.def _Clock_ClearSysLEDTimeStatus_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Clock_ClearSysLEDTimeStatus	;Function start
; 2 exit points
;	::->op : =
;	.line	226; "../Timer.c"	sys_LED_Time = 0;
	BANKSEL	_sys_LED_Time
	CLR	_sys_LED_Time
	BANKSEL	_sys_LED_Time
	CLR	(_sys_LED_Time + 1)
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _Clock_ClearSysLEDTimeStatus_function_end, debug, value=$

; exit point of _Clock_ClearSysLEDTimeStatus



func._Clock_GetSysLEDTimeStatus	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Clock_GetSysLEDTimeStatus	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   STK00
;; Starting PostCode block
;	.def _Clock_GetSysLEDTimeStatus_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Clock_GetSysLEDTimeStatus	;Function start
; 2 exit points
;	::->op : RETURN
;	.line	221; "../Timer.c"	return sys_LED_Time;  //
	BANKSEL	_sys_LED_Time
	MOVZ	R0, _sys_LED_Time
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	_sys_LED_Time
	MOVZ	R0, (_sys_LED_Time + 1)
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _Clock_GetSysLEDTimeStatus_function_end, debug, value=$

; exit point of _Clock_GetSysLEDTimeStatus



func._pwm_deal	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _pwm_deal	;Function start
; 2 exit points
;has an exit
;functions called:
;   __mulint
;   __mulint
;   __mulint
;   __divuint
;   __mulint
;   __mulint
;   __mulint
;   __divuint
;7 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x100F
;   r0x1010
;   r0x1011
;   r0x1012
;; Starting PostCode block
;	.def _pwm_deal_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_pwm_deal	;Function start
; 2 exit points
;	::->op : >
;swapping arguments (AOP_TYPEs 1/3)
;unsigned compare: left >= lit(0xB=11), size=2
;	.line	198; "../Timer.c"	if(count > 10)  //超时
	MOV	R0,# 0x00
	BANKSEL	_count
	SUB	R0, (_count + 1)
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00025_DS_
	MOV	R0,# 0x0b
	BANKSEL	_count
	SUB	R0, _count
_00025_DS_
	JB	PSW, 0
	JMP	_00019_DS_
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	200; "../Timer.c"	if(P05)
	BANKSEL	_P0_bits
	JB	_P0_bits, 5
	JMP	_00016_DS_
;	::->op : =
;	.line	201; "../Timer.c"	Pwm_duty = 0;
	BANKSEL	_Pwm_duty
	CLR	_Pwm_duty
;	::->op : GOTO
	JMP	_00021_DS_
;	::->op : LABEL
;	::->op : =
_00016_DS_
;	.line	203; "../Timer.c"	Pwm_duty = 100;
	MOV	R0,# 0x64
	BANKSEL	_Pwm_duty
	MOV	_Pwm_duty, R0
;	::->op : GOTO
	JMP	_00021_DS_
;	::->op : LABEL
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
_00019_DS_
;	.line	209; "../Timer.c"	Pwm_duty =  ((H_Level_C * 255 + H_Level_T) * 100) / (L_Level_C * 255 + L_Level_T);
	BANKSEL	_H_Level_C
	MOVZ	R0, _H_Level_C
	BANKSEL	STK02
	MOV	STK02, R0
	BANKSEL	_H_Level_C
	MOVZ	R0, (_H_Level_C + 1)
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0xff
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x00
	PAGESEL	__mulint
	CALL	__mulint
	PAGESEL	$
	BANKSEL	r0x100F
	MOV	r0x100F, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1010
	MOV	r0x1010, R0
;	::->op : +
	BANKSEL	_H_Level_T
	MOV	R0, _H_Level_T
	BANKSEL	r0x1010
	ADD	r0x1010, R0
	BANKSEL	_H_Level_T
	MOVZ	R0, (_H_Level_T + 1)
	JNB	PSW, 0
	INC	R0
	JNB	PSW, 2
	JMP	_00056_DS_
	BANKSEL	r0x100F
	ADD	r0x100F, R0
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
_00056_DS_
	BANKSEL	r0x1010
	MOVZ	R0, r0x1010
	BANKSEL	STK02
	MOV	STK02, R0
	BANKSEL	r0x100F
	MOVZ	R0, r0x100F
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x64
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x00
	PAGESEL	__mulint
	CALL	__mulint
	PAGESEL	$
	BANKSEL	r0x100F
	MOV	r0x100F, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1010
	MOV	r0x1010, R0
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
	BANKSEL	_L_Level_C
	MOVZ	R0, _L_Level_C
	BANKSEL	STK02
	MOV	STK02, R0
	BANKSEL	_L_Level_C
	MOVZ	R0, (_L_Level_C + 1)
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0xff
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x00
	PAGESEL	__mulint
	CALL	__mulint
	PAGESEL	$
	BANKSEL	r0x1011
	MOV	r0x1011, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1012
	MOV	r0x1012, R0
;	::->op : +
	BANKSEL	_L_Level_T
	MOV	R0, _L_Level_T
	BANKSEL	r0x1012
	ADD	r0x1012, R0
	BANKSEL	_L_Level_T
	MOVZ	R0, (_L_Level_T + 1)
	JNB	PSW, 0
	INC	R0
	JNB	PSW, 2
	JMP	_00057_DS_
	BANKSEL	r0x1011
	ADD	r0x1011, R0
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
_00057_DS_
	BANKSEL	r0x1012
	MOVZ	R0, r0x1012
	BANKSEL	STK02
	MOV	STK02, R0
	BANKSEL	r0x1011
	MOVZ	R0, r0x1011
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1010
	MOVZ	R0, r0x1010
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x100F
	MOVZ	R0, r0x100F
	PAGESEL	__divuint
	CALL	__divuint
	PAGESEL	$
	BANKSEL	r0x100F
	MOV	r0x100F, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1010
	MOV	r0x1010, R0
;	::->op : CAST
	BANKSEL	r0x1010
	MOVZ	R0, r0x1010
	BANKSEL	_Pwm_duty
	MOV	_Pwm_duty, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00021_DS_
	CRET	
;	.def _pwm_deal_function_end, debug, value=$

; exit point of _pwm_deal



func._get_pwmduty	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _get_pwmduty	;Function start
; 2 exit points
;has an exit
;functions called:
;   _pwm_deal
;   _pwm_deal
;; Starting PostCode block
;	.def _get_pwmduty_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_get_pwmduty	;Function start
; 2 exit points
;	::->op : CALL
;	.line	191; "../Timer.c"	pwm_deal();
	PAGESEL	_pwm_deal
	CALL	_pwm_deal
	PAGESEL	$
;	::->op : RETURN
;	.line	192; "../Timer.c"	return Pwm_duty;
	BANKSEL	_Pwm_duty
	MOVZ	R0, _Pwm_duty
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _get_pwmduty_function_end, debug, value=$

; exit point of _get_pwmduty



func._P0_INT_init	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _P0_INT_init	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	.def _P0_INT_init_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_P0_INT_init	;Function start
; 2 exit points
;	::->op :*  =
;	.line	181; "../Timer.c"	P0IE = 1;
	BANKSEL	_INTCTL_bits
	SET	_INTCTL_bits, 3
;	::->op :*  =
;	.line	182; "../Timer.c"	PP0 = 1; //高优先级
	BANKSEL	_IP0_bits
	SET	_IP0_bits, 0
;	::->op :*  =
;	.line	183; "../Timer.c"	P0IF = 0;
	BANKSEL	_INTCTL_bits
	CLR	_INTCTL_bits, 0
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _P0_INT_init_function_end, debug, value=$

; exit point of _P0_INT_init



func._timer_init	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _timer_init	;Function start
; 2 exit points
;has an exit
;functions called:
;   _Timer1_Init
;   _Timer0_Init
;   _Timer1_Init
;   _Timer0_Init
;; Starting PostCode block
;	.def _timer_init_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_timer_init	;Function start
; 2 exit points
;	::->op : CALL
;	.line	171; "../Timer.c"	Timer1_Init(); //Timer1 CPP1 CPP2 PWM 初始化
	PAGESEL	_Timer1_Init
	CALL	_Timer1_Init
	PAGESEL	$
;	::->op : CALL
;	.line	172; "../Timer.c"	Timer0_Init(); //Timer0 PWM计数定时器
	PAGESEL	_Timer0_Init
	CALL	_Timer0_Init
	PAGESEL	$
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _timer_init_function_end, debug, value=$

; exit point of _timer_init



func._set_PWM2L	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _set_PWM2L	;Function start
; 2 exit points
;has an exit
;functions called:
;   ___uchar2fs
;   ___fsmul
;   ___fs2uchar
;   ___uchar2fs
;   ___fsmul
;   ___fs2uchar
;11 compiler assigned registers:
;   r0x1013
;   r0x1014
;   STK00
;   r0x1015
;   STK01
;   r0x1016
;   STK02
;   STK06
;   STK05
;   STK04
;   STK03
;; Starting PostCode block
;	.def _set_PWM2L_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_set_PWM2L	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	163; "../Timer.c"	void set_PWM2L(uint8_t duty)
	BANKSEL	r0x1013
	MOV	r0x1013, R0
;	::->op : SEND
;	::->op : CALL
;	.line	165; "../Timer.c"	PWM2L = 249 * duty * 0.01;
	BANKSEL	r0x1013
	MOVZ	R0, r0x1013
	PAGESEL	___uchar2fs
	CALL	___uchar2fs
	PAGESEL	$
	BANKSEL	r0x1014
	MOV	r0x1014, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1015
	MOV	r0x1015, R0
	BANKSEL	STK01
	MOVZ	R0, STK01
	BANKSEL	r0x1016
	MOV	r0x1016, R0
	BANKSEL	STK02
	MOVZ	R0, STK02
	BANKSEL	r0x1013
	MOV	r0x1013, R0
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
	BANKSEL	r0x1013
	MOVZ	R0, r0x1013
	BANKSEL	STK06
	MOV	STK06, R0
	BANKSEL	r0x1016
	MOVZ	R0, r0x1016
	BANKSEL	STK05
	MOV	STK05, R0
	BANKSEL	r0x1015
	MOVZ	R0, r0x1015
	BANKSEL	STK04
	MOV	STK04, R0
	BANKSEL	r0x1014
	MOVZ	R0, r0x1014
	BANKSEL	STK03
	MOV	STK03, R0
	MOV	R0,# 0x29
	BANKSEL	STK02
	MOV	STK02, R0
	MOV	R0,# 0x5c
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x1f
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x40
	PAGESEL	___fsmul
	CALL	___fsmul
	PAGESEL	$
	BANKSEL	r0x1014
	MOV	r0x1014, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1015
	MOV	r0x1015, R0
	BANKSEL	STK01
	MOVZ	R0, STK01
	BANKSEL	r0x1016
	MOV	r0x1016, R0
	BANKSEL	STK02
	MOVZ	R0, STK02
	BANKSEL	r0x1013
	MOV	r0x1013, R0
;	::->op : SEND
;	::->op : CALL
	BANKSEL	r0x1013
	MOVZ	R0, r0x1013
	BANKSEL	STK02
	MOV	STK02, R0
	BANKSEL	r0x1016
	MOVZ	R0, r0x1016
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1015
	MOVZ	R0, r0x1015
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1014
	MOVZ	R0, r0x1014
	PAGESEL	___fs2uchar
	CALL	___fs2uchar
	PAGESEL	$
	BANKSEL	_PWM2L
	MOV	_PWM2L, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _set_PWM2L_function_end, debug, value=$

; exit point of _set_PWM2L



func._set_PWM1L	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _set_PWM1L	;Function start
; 2 exit points
;has an exit
;functions called:
;   ___uchar2fs
;   ___fsmul
;   ___fs2uchar
;   ___uchar2fs
;   ___fsmul
;   ___fs2uchar
;11 compiler assigned registers:
;   r0x1017
;   r0x1018
;   STK00
;   r0x1019
;   STK01
;   r0x101A
;   STK02
;   STK06
;   STK05
;   STK04
;   STK03
;; Starting PostCode block
;	.def _set_PWM1L_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_set_PWM1L	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	158; "../Timer.c"	void set_PWM1L(uint8_t duty)
	BANKSEL	r0x1017
	MOV	r0x1017, R0
;	::->op : SEND
;	::->op : CALL
;	.line	160; "../Timer.c"	PWM1L = 249 * duty * 0.01;
	BANKSEL	r0x1017
	MOVZ	R0, r0x1017
	PAGESEL	___uchar2fs
	CALL	___uchar2fs
	PAGESEL	$
	BANKSEL	r0x1018
	MOV	r0x1018, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1019
	MOV	r0x1019, R0
	BANKSEL	STK01
	MOVZ	R0, STK01
	BANKSEL	r0x101A
	MOV	r0x101A, R0
	BANKSEL	STK02
	MOVZ	R0, STK02
	BANKSEL	r0x1017
	MOV	r0x1017, R0
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
	BANKSEL	r0x1017
	MOVZ	R0, r0x1017
	BANKSEL	STK06
	MOV	STK06, R0
	BANKSEL	r0x101A
	MOVZ	R0, r0x101A
	BANKSEL	STK05
	MOV	STK05, R0
	BANKSEL	r0x1019
	MOVZ	R0, r0x1019
	BANKSEL	STK04
	MOV	STK04, R0
	BANKSEL	r0x1018
	MOVZ	R0, r0x1018
	BANKSEL	STK03
	MOV	STK03, R0
	MOV	R0,# 0x29
	BANKSEL	STK02
	MOV	STK02, R0
	MOV	R0,# 0x5c
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x1f
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x40
	PAGESEL	___fsmul
	CALL	___fsmul
	PAGESEL	$
	BANKSEL	r0x1018
	MOV	r0x1018, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1019
	MOV	r0x1019, R0
	BANKSEL	STK01
	MOVZ	R0, STK01
	BANKSEL	r0x101A
	MOV	r0x101A, R0
	BANKSEL	STK02
	MOVZ	R0, STK02
	BANKSEL	r0x1017
	MOV	r0x1017, R0
;	::->op : SEND
;	::->op : CALL
	BANKSEL	r0x1017
	MOVZ	R0, r0x1017
	BANKSEL	STK02
	MOV	STK02, R0
	BANKSEL	r0x101A
	MOVZ	R0, r0x101A
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1019
	MOVZ	R0, r0x1019
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1018
	MOVZ	R0, r0x1018
	PAGESEL	___fs2uchar
	CALL	___fs2uchar
	PAGESEL	$
	BANKSEL	_PWM1L
	MOV	_PWM1L, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _set_PWM1L_function_end, debug, value=$

; exit point of _set_PWM1L



func._Timer1_Init	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Timer1_Init	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	.def _Timer1_Init_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Timer1_Init	;Function start
; 2 exit points
;	::->op :*  =
;	.line	92; "../Timer.c"	PWMS = 0; //PWM1 分配到P0.2 口，PWM2 分配到P1.0 口
	BANKSEL	_T3CTL_bits
	CLR	_T3CTL_bits, 3
;	::->op : =
;	.line	95; "../Timer.c"	PP2=249;		//50000
	MOV	R0,# 0xf9
	BANKSEL	_PP2
	MOV	_PP2, R0
;	::->op : =
;	.line	96; "../Timer.c"	PP1=249;
	MOV	R0,# 0xf9
	BANKSEL	_PP1
	MOV	_PP1, R0
;	::->op : =
;	.line	97; "../Timer.c"	PWM1L = 0;
	BANKSEL	_PWM1L
	CLR	_PWM1L
;	::->op : =
;	.line	98; "../Timer.c"	PWM2L = 0;
	BANKSEL	_PWM2L
	CLR	_PWM2L
;	::->op :*  =
;	.line	102; "../Timer.c"	T1CS = 0; //当前定时模式*计数模式
	BANKSEL	_T1CTL_bits
	CLR	_T1CTL_bits, 1
;	::->op :*  =
;	.line	103; "../Timer.c"	T1OSCEN = 0; //计数模式 当T1OSCEN=0 时T1 时钟为T1CK
	BANKSEL	_T1CTL_bits
	CLR	_T1CTL_bits, 3
;	::->op :*  =
;	.line	104; "../Timer.c"	T1CLKEN = 0; //当T1CLKEN=1 时T1 时钟为内部高频振荡器时钟
	BANKSEL	_INTEDGCTL_bits
	CLR	_INTEDGCTL_bits, 0
;	::->op :*  =
;	.line	113; "../Timer.c"	T1CKS1 = 1;  //8分频
	BANKSEL	_T1CTL_bits
	SET	_T1CTL_bits, 5
;	::->op :*  =
;	.line	114; "../Timer.c"	T1CKS0 = 1;
	BANKSEL	_T1CTL_bits
	SET	_T1CTL_bits, 4
;	::->op : =
;	.line	115; "../Timer.c"	T1H=0;  //将T1L/H 清零
	BANKSEL	_T1H
	CLR	_T1H
;	::->op : =
;	.line	116; "../Timer.c"	T1L=0;
	BANKSEL	_T1L
	CLR	_T1L
;	::->op :*  =
;	.line	121; "../Timer.c"	T1ON = 1;  //启动T1
	BANKSEL	_T1CTL_bits
	SET	_T1CTL_bits, 0
;	::->op :*  =
;	.line	123; "../Timer.c"	PWM1ON = 1;
	BANKSEL	_PWMCTL_bits
	SET	_PWMCTL_bits, 0
;	::->op :*  =
;	.line	124; "../Timer.c"	PWM2ON = 1;
	BANKSEL	_PWMCTL_bits
	SET	_PWMCTL_bits, 4
;	::->op :*  =
;	.line	126; "../Timer.c"	TR02 = 0; //将TR00 或TR01 清零使能引脚PWM1 /PWM2 的输出驱动
	BANKSEL	_TR0_bits
	CLR	_TR0_bits, 2
;	::->op :*  =
;	.line	127; "../Timer.c"	TR10 = 0;
	BANKSEL	_TR1_bits
	CLR	_TR1_bits, 0
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _Timer1_Init_function_end, debug, value=$

; exit point of _Timer1_Init



func._Timer0_Init	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Timer0_Init	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	.def _Timer0_Init_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Timer0_Init	;Function start
; 2 exit points
;	::->op : =
;	.line	35; "../Timer.c"	WDTPS = 0x07;
	MOV	R0,# 0x07
	BANKSEL	_WDTPS
	MOV	_WDTPS, R0
;	::->op : INLINEASM
	CWDT 
;	::->op : =
;	.line	60; "../Timer.c"	OPTR = 0xC4;	// INT0/P0.2 为上升沿触发
	MOV	R0,# 0xc4
	BANKSEL	_OPTR
	MOV	_OPTR, R0
;	::->op : INLINEASM
	CWDT 
;	::->op : =
;	.line	62; "../Timer.c"	T0 = 1;  //8 位计数器
	MOV	R0,# 0x01
	BANKSEL	_T0
	MOV	_T0, R0
;	::->op :*  =
;	.line	63; "../Timer.c"	T0IE = 1;  //暂不使能//使能T0中断
	BANKSEL	_INTCTL_bits
	SET	_INTCTL_bits, 5
;	::->op :*  =
;	.line	64; "../Timer.c"	T0IF = 0;  //清除标记位
	BANKSEL	_INTCTL_bits
	CLR	_INTCTL_bits, 2
;	::->op :*  =
;	.line	65; "../Timer.c"	PT0 = 1;   //高优先级
	BANKSEL	_IP0_bits
	SET	_IP0_bits, 2
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _Timer0_Init_function_end, debug, value=$

; exit point of _Timer0_Init


;	code size estimation:
;	  307+  193 =   500 instructions ( 1386 byte)

;	.type _Timer0_Init,  32
;	.dim _Timer0_Init, 1, (_Timer0_Init_function_end&0xFF00)>>8, _Timer0_Init_function_end&0xFF,0,17,0,67 , 1, 1
;	.type _Timer1_Init,  32
;	.dim _Timer1_Init, 1, (_Timer1_Init_function_end&0xFF00)>>8, _Timer1_Init_function_end&0xFF,0,77,0,131 , 1, 1
;	.type _set_PWM1L,  32
;	.dim _set_PWM1L, 1, (_set_PWM1L_function_end&0xFF00)>>8, _set_PWM1L_function_end&0xFF,0,158,0,161 , 1, 1
;	.type _set_PWM2L,  32
;	.dim _set_PWM2L, 1, (_set_PWM2L_function_end&0xFF00)>>8, _set_PWM2L_function_end&0xFF,0,163,0,166 , 1, 1
;	.type _timer_init,  32
;	.dim _timer_init, 1, (_timer_init_function_end&0xFF00)>>8, _timer_init_function_end&0xFF,0,169,0,173 , 1, 1
;	.type _P0_INT_init,  32
;	.dim _P0_INT_init, 1, (_P0_INT_init_function_end&0xFF00)>>8, _P0_INT_init_function_end&0xFF,0,176,0,186 , 1, 1
;	.type _get_pwmduty,  32
;	.dim _get_pwmduty, 1, (_get_pwmduty_function_end&0xFF00)>>8, _get_pwmduty_function_end&0xFF,0,189,0,193 , 1, 1
;	.type _pwm_deal,  32
;	.dim _pwm_deal, 1, (_pwm_deal_function_end&0xFF00)>>8, _pwm_deal_function_end&0xFF,0,195,0,217 , 1, 1
;	.type _Clock_GetSysLEDTimeStatus,  32
;	.dim _Clock_GetSysLEDTimeStatus, 1, (_Clock_GetSysLEDTimeStatus_function_end&0xFF00)>>8, _Clock_GetSysLEDTimeStatus_function_end&0xFF,0,219,0,222 , 1, 1
;	.type _Clock_ClearSysLEDTimeStatus,  32
;	.dim _Clock_ClearSysLEDTimeStatus, 1, (_Clock_ClearSysLEDTimeStatus_function_end&0xFF00)>>8, _Clock_ClearSysLEDTimeStatus_function_end&0xFF,0,224,0,227 , 1, 1
;	.type _int_fun0,  32
;	.dim _int_fun0, 1, (_int_fun0_function_end&0xFF00)>>8, _int_fun0_function_end&0xFF,0,236,1,29 , 1, 1
;	.type _int_fun1,  32
;	.dim _int_fun1, 1, (_int_fun1_function_end&0xFF00)>>8, _int_fun1_function_end&0xFF,1,31,1,35 , 1, 1

	.end
