;--------------------------------------------------------
; File Created by ChiponCC : ChipON  inc.
;--------------------------------------------------------
; chipon port for the 16-bit core
;--------------------------------------------------------
;	.file	"../CTouch.c"
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
	.extern	__CTouch_Scan_Process_
	.extern	__CTouch_Key_Init_
	.extern	__CTouch_Get_Baseline_
	.extern	__CTouch_Get_RawData_
	.extern	__CTouch_Get_Lib_Version_
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
	.extern	_Touch_Int_Flg
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
	.extern	__R2PCL

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
	.global	__Parameter_Init_
	.global	_Channel_Num_lib
	.global	_ON_debounce_times_lib
	.global	_Data_Stream_Enable_lib
	.global	_Press_On_Max_Time_lib
	.global	_Data_Change_Disturb_Max_Channel
	.global	_Protect_Mode_Release_Time_lib
	.global	_Baseline_Update_Cnt_lib
	.global	_Max_Key_Cnt_Lib
	.global	_Ref_Channel_Enable_lib
	.global	_CTouch_Channel_Tab
	.global	_CTouch_Threshold_Tab
	.global	_CTouch_Second_Key_Threshold_Tab
	.global	_CTouch_Single_Hysteresis_Tab
	.global	_CTouch_Noise_threshold_Tab
	.global	_CTouch_Negative_Noise_threshold_Tab
	.global	_CTouch_Max_Threshold_Tab
	.global	_CTouch_Disturb_Noise_threshold_Tab
	.global	_CTouch_Steady_Noise_threshold_Tab
	.global	_CTOUCH_VDAC_Tab
	.global	_DEF_NUM_CHANNELS
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
UD_CTouch_0	.udata
_Channel_Num_lib	.res	1

UD_CTouch_1	.udata
_ON_debounce_times_lib	.res	1

UD_CTouch_2	.udata
_Data_Stream_Enable_lib	.res	1

UD_CTouch_3	.udata
_Press_On_Max_Time_lib	.res	2

UD_CTouch_4	.udata
_Data_Change_Disturb_Max_Channel	.res	1

UD_CTouch_5	.udata
_Protect_Mode_Release_Time_lib	.res	1

UD_CTouch_6	.udata
_Baseline_Update_Cnt_lib	.res	2

UD_CTouch_7	.udata
_Max_Key_Cnt_Lib	.res	1

UD_CTouch_8	.udata
_Ref_Channel_Enable_lib	.res	1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_CTouch_0	.code
_CTouch_Channel_Tab
	RRET R0, #0x06
	RRET R0, #0x07


ID_CTouch_1	.code
_CTouch_Threshold_Tab
	RRET R0, #0x3c
	RRET R0, #0x00
	RRET R0, #0x3c
	RRET R0, #0x00


ID_CTouch_2	.code
_CTouch_Second_Key_Threshold_Tab
	RRET R0, #0x00
	RRET R0, #0x00
	RRET R0, #0x00
	RRET R0, #0x00


ID_CTouch_3	.code
_CTouch_Single_Hysteresis_Tab
	RRET R0, #0x06
	RRET R0, #0x06


ID_CTouch_4	.code
_CTouch_Noise_threshold_Tab
	RRET R0, #0x1e
	RRET R0, #0x1e


ID_CTouch_5	.code
_CTouch_Negative_Noise_threshold_Tab
	RRET R0, #0x3c
	RRET R0, #0x3c


ID_CTouch_6	.code
_CTouch_Max_Threshold_Tab
	RRET R0, #0xc8
	RRET R0, #0x00
	RRET R0, #0xc8
	RRET R0, #0x00


ID_CTouch_7	.code
_CTouch_Disturb_Noise_threshold_Tab
	RRET R0, #0x3c
	RRET R0, #0x00
	RRET R0, #0x3c
	RRET R0, #0x00


ID_CTouch_8	.code
_CTouch_Steady_Noise_threshold_Tab
	RRET R0, #0x14
	RRET R0, #0x14


ID_CTouch_9	.code
_CTOUCH_VDAC_Tab
	RRET R0, #0xf0
	RRET R0, #0xf0


ID_CTouch_10	.code
_DEF_NUM_CHANNELS
	RRET R0, #0x02

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	.udata_ovr


func.__Parameter_Init_	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  __Parameter_Init_	;Function start
; 2 exit points
;has an exit
;functions called:
;   __R2PCL
;   __R2PCL
;; Starting PostCode block
;	.def __Parameter_Init__function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
__Parameter_Init_	;Function start
; 2 exit points
;	::->op : =
;gen_assign from CODESPACE
;	.line	47; "../CTouch.c"	Channel_Num_lib = DEF_NUM_CHANNELS;
	MOV	R1,# high (_DEF_NUM_CHANNELS+0)
	MOV	R0,# low (_DEF_NUM_CHANNELS+0)
	PAGESEL	__R2PCL
	CALL	__R2PCL
	PAGESEL	$
	BANKSEL	_Channel_Num_lib
	MOV	_Channel_Num_lib, R0
;	::->op : =
;	.line	48; "../CTouch.c"	ON_debounce_times_lib = DEF_TOUCH_ON_DEBOUNCE;
	MOV	R0,# 0x0a
	BANKSEL	_ON_debounce_times_lib
	MOV	_ON_debounce_times_lib, R0
;	::->op : =
;	.line	49; "../CTouch.c"	Data_Stream_Enable_lib = DEF_DATA_STREAM_ENABLE;
	BANKSEL	_Data_Stream_Enable_lib
	CLR	_Data_Stream_Enable_lib
;	::->op : =
;	.line	50; "../CTouch.c"	Press_On_Max_Time_lib = DEF_PRESS_ON_MAX_TIME;
	MOV	R0,# 0xe8
	BANKSEL	_Press_On_Max_Time_lib
	MOV	_Press_On_Max_Time_lib, R0
	MOV	R0,# 0x03
	BANKSEL	_Press_On_Max_Time_lib
	MOV	(_Press_On_Max_Time_lib + 1), R0
;	::->op : =
;	.line	51; "../CTouch.c"	Data_Change_Disturb_Max_Channel = DEF_DATA_CHANGE_DISTURB_MAX_CHANNEL;
	MOV	R0,# 0x03
	BANKSEL	_Data_Change_Disturb_Max_Channel
	MOV	_Data_Change_Disturb_Max_Channel, R0
;	::->op : =
;	.line	52; "../CTouch.c"	Protect_Mode_Release_Time_lib = DEF_PROTECT_MODE_RELEASE_CYCLE;
	MOV	R0,# 0x46
	BANKSEL	_Protect_Mode_Release_Time_lib
	MOV	_Protect_Mode_Release_Time_lib, R0
;	::->op : =
;	.line	53; "../CTouch.c"	Baseline_Update_Cnt_lib = DEF_BASELINE_UPDATE_CNT;
	MOV	R0,# 0xf4
	BANKSEL	_Baseline_Update_Cnt_lib
	MOV	_Baseline_Update_Cnt_lib, R0
	MOV	R0,# 0x01
	BANKSEL	_Baseline_Update_Cnt_lib
	MOV	(_Baseline_Update_Cnt_lib + 1), R0
;	::->op : =
;	.line	54; "../CTouch.c"	Max_Key_Cnt_Lib = DEF_MAX_KEY_CNT;
	MOV	R0,# 0x02
	BANKSEL	_Max_Key_Cnt_Lib
	MOV	_Max_Key_Cnt_Lib, R0
;	::->op : =
;	.line	55; "../CTouch.c"	Ref_Channel_Enable_lib = DEF_REFERENCE_CHANNEL_ENABLE;
	BANKSEL	_Ref_Channel_Enable_lib
	CLR	_Ref_Channel_Enable_lib
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def __Parameter_Init__function_end, debug, value=$

; exit point of __Parameter_Init_


;	code size estimation:
;	   25+   11 =    36 instructions (   94 byte)

;	.type __Parameter_Init_,  32
;	.dim __Parameter_Init_, 1, (__Parameter_Init__function_end&0xFF00)>>8, __Parameter_Init__function_end&0xFF,0,45,0,56 , 1, 1

	.end
