;--------------------------------------------------------
; File Created by ChiponCC : ChipON  inc.
;--------------------------------------------------------
; chipon port for the 16-bit core
;--------------------------------------------------------
;	.file	"../main.c"
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
	.extern	__gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	.global	_startup
	.global	_main

	.global I0R1
	.global I0R7
	.global I0PSW
	.global I0PCH
	.global I1R1
	.global I1R7
	.global I1PSW
	.global I1PCH
	.define _STK12	STK12
	.global STK12
	.define _STK11	STK11
	.global STK11
	.define _STK10	STK10
	.global STK10
	.define _STK09	STK09
	.global STK09
	.define _STK08	STK08
	.global STK08
	.define _STK07	STK07
	.global STK07
	.define _STK06	STK06
	.global STK06
	.define _STK05	STK05
	.global STK05
	.define _STK04	STK04
	.global STK04
	.define _STK03	STK03
	.global STK03
	.define _STK02	STK02
	.global STK02
	.define _STK01	STK01
	.global STK01
	.define _STK00	STK00
	.global STK00

sharebank .udata
I0R1		.res 1
I0R7		.res 1
I0PSW		.res 1
I0PCH		.res 1
I1R1		.res 1
I1R7		.res 1
I1PSW		.res 1
I1PCH		.res 1
sharebankSTKP1 .udata 
STK12	.res 1
	.type STK12, 108
STK11	.res 1
	.type STK11, 108
STK10	.res 1
	.type STK10, 108
STK09	.res 1
	.type STK09, 108
STK08	.res 1
	.type STK08, 108
STK07	.res 1
	.type STK07, 108
sharebankSTKP2 .udata 0x78
STK06	.res 1
	.type STK06, 108
STK05	.res 1
	.type STK05, 108
STK04	.res 1
	.type STK04, 108
STK03	.res 1
	.type STK03, 108
STK02	.res 1
	.type STK02, 108
STK01	.res 1
	.type STK01, 108
STK00	.res 1
	.type STK00, 108

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_main_0	.udata
r0x1000	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	.udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	.code 0x0000
	NOP
	PAGESEL	init_imp
	JMP		init_imp

	.global	init_imp
INIT_IMP	.code
init_imp
	PAGESEL	_startup
	CALL	_startup
	PAGESEL	__gsinit_startup
	CALL	__gsinit_startup
	PAGESEL	_main
	JMP		_main


func._main	.code
;***
;  PostBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;functions called:
;   _Init_MCU
;   __CTouch_Key_Init_
;   _P0_INT_init
;   _timer_init
;   _key_init
;   _ADC_Init
;   _DoorState_Init
;   _FLASH_Init
;   _BAT_StateGet
;   _DoorState_Deal
;   _key_deal
;   _led_deal
;   _FLASH_Deal
;   _set_PWM1L
;   _set_PWM2L
;   _Init_MCU
;   __CTouch_Key_Init_
;   _P0_INT_init
;   _timer_init
;   _key_init
;   _ADC_Init
;   _DoorState_Init
;   _FLASH_Init
;   _BAT_StateGet
;   _DoorState_Deal
;   _key_deal
;   _led_deal
;   _FLASH_Deal
;   _set_PWM1L
;   _set_PWM2L
;1 compiler assigned register :
;   r0x1000
;; Starting PostCode block
;	.def _main_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_main	;Function start
; 2 exit points
;	::->op : CALL
;	.line	76; "../main.c"	Init_MCU();		//系统初始化  IO口初始化 触摸初始化
	PAGESEL	_Init_MCU
	CALL	_Init_MCU
	PAGESEL	$
;	::->op : CALL
;	.line	78; "../main.c"	_CTouch_Key_Init_();	//采样去初始化基准线
	PAGESEL	__CTouch_Key_Init_
	CALL	__CTouch_Key_Init_
	PAGESEL	$
;	::->op : CALL
;	.line	79; "../main.c"	P0_INT_init();  //初始化使能P0.5电平变化中断
	PAGESEL	_P0_INT_init
	CALL	_P0_INT_init
	PAGESEL	$
;	::->op : CALL
;	.line	80; "../main.c"	timer_init(); 	//定时器初始化
	PAGESEL	_timer_init
	CALL	_timer_init
	PAGESEL	$
;	::->op : CALL
;	.line	81; "../main.c"	key_init();		//按键初始化
	PAGESEL	_key_init
	CALL	_key_init
	PAGESEL	$
;	::->op : CALL
;	.line	82; "../main.c"	ADC_Init();		//ADC采样初始化
	PAGESEL	_ADC_Init
	CALL	_ADC_Init
	PAGESEL	$
;	::->op : CALL
;	.line	83; "../main.c"	DoorState_Init();
	PAGESEL	_DoorState_Init
	CALL	_DoorState_Init
	PAGESEL	$
;	::->op : CALL
;	.line	84; "../main.c"	FLASH_Init();	//Flash初始化 数据读取
	PAGESEL	_FLASH_Init
	CALL	_FLASH_Init
	PAGESEL	$
;	::->op : LABEL
;	::->op : INLINEASM
_00007_DS_
	CWDT 
;	::->op : CALL
;	.line	91; "../main.c"	if(BAT_StateGet())		//ADC采样 工作电压范围内返回1
	PAGESEL	_BAT_StateGet
	CALL	_BAT_StateGet
	PAGESEL	$
	BANKSEL	r0x1000
	MOV	r0x1000, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1000
	ORL	R0, r0x1000
	JNB	PSW, 2
	JMP	_00004_DS_
;	::->op : CALL
;	.line	95; "../main.c"	DoorState_Deal(); //门控输入
	PAGESEL	_DoorState_Deal
	CALL	_DoorState_Deal
	PAGESEL	$
;	::->op : CALL
;	.line	96; "../main.c"	key_deal();		//按键状态处理
	PAGESEL	_key_deal
	CALL	_key_deal
	PAGESEL	$
;	::->op : CALL
;	.line	97; "../main.c"	led_deal();		//LED灯状态处理
	PAGESEL	_led_deal
	CALL	_led_deal
	PAGESEL	$
;	::->op : CALL
;	.line	98; "../main.c"	FLASH_Deal();		//FLASH储存
	PAGESEL	_FLASH_Deal
	CALL	_FLASH_Deal
	PAGESEL	$
;	::->op : GOTO
	JMP	_00007_DS_
;	::->op : LABEL
;	::->op : SEND
;	::->op : CALL
_00004_DS_
;	.line	104; "../main.c"	set_PWM1L(0);
	MOV	R0,# 0x00
	PAGESEL	_set_PWM1L
	CALL	_set_PWM1L
	PAGESEL	$
;	::->op : SEND
;	::->op : CALL
;	.line	105; "../main.c"	set_PWM2L(0);
	MOV	R0,# 0x00
	PAGESEL	_set_PWM2L
	CALL	_set_PWM2L
	PAGESEL	$
;	::->op : GOTO
	JMP	_00007_DS_
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _main_function_end, debug, value=$

; exit point of _main



func._startup	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _startup	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	.def _startup_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_startup	;Function start
; 2 exit points
;	::->op : INLINEASM
	MOVP #0x1F
	MOVB #0x00
	CALL #0xfff
	MOV 0x30, R0
	NOPZ
	NOPZ
	CALL #0xffe
	MOV 0x37, R0
	NOPZ
	NOPZ
	CALL #0xffd
	MOV 0x4c, R0
	NOPZ
	NOPZ
	CALL #0xffc
	MOV 0x4d, R0
	NOPZ
	NOPZ
	CALL #0xffb
	MOV 0x2a, R0
	NOPZ
	MOVB #0x01
	CALL #0xffa
	MOV 0x59, R0
	NOPZ
	CALL #0xff9
	MOV 0x5a, R0
	NOPZ
	CALL #0xff8
	MOV 0x65, R0
	NOPZ
	NOPZ
	;CRET
;	::->op : =
;	.line	63; "../main.c"	OSCCTL = 0x70;
	MOV	R0,# 0x70
	BANKSEL	_OSCCTL
	MOV	_OSCCTL, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _startup_function_end, debug, value=$

; exit point of _startup


;	code size estimation:
;	   58+    3 =    61 instructions (  128 byte)

;	.type _startup,  32
;	.dim _startup, 1, (_startup_function_end&0xFF00)>>8, _startup_function_end&0xFF,0,26,0,64 , 1, 1
;	.type _main,  32
;	.dim _main, 1, (_main_function_end&0xFF00)>>8, _main_function_end&0xFF,0,72,0,110 , 1, 1

	.end
