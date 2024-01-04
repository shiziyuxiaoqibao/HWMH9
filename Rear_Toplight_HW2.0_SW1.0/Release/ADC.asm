;--------------------------------------------------------
; File Created by ChiponCC : ChipON  inc.
;--------------------------------------------------------
; chipon port for the 16-bit core
;--------------------------------------------------------
;	.file	"../ADC.c"
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
	.global	_BAT_StateGet
	.global	_Adc_read
	.global	_ADC_Init
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
UDL_ADC_0	.udata
r0x1000	.res	1
UDL_ADC_1	.udata
r0x1001	.res	1
UDL_ADC_2	.udata
r0x1002	.res	1
UDL_ADC_3	.udata
r0x1004	.res	1
UDL_ADC_4	.udata
r0x1005	.res	1
UDL_ADC_5	.udata
r0x1006	.res	1
UDL_ADC_6	.udata
r0x1008	.res	1
UDL_ADC_7	.udata
r0x1007	.res	1
UDL_ADC_8	.udata
r0x100A	.res	1
UDL_ADC_9	.udata
r0x1009	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	.udata_ovr


func._BAT_StateGet	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _BAT_StateGet	;Function start
; 2 exit points
;has an exit
;functions called:
;   _Adc_read
;   _Adc_read
;3 compiler assigned registers:
;   r0x1009
;   STK00
;   r0x100A
;; Starting PostCode block
;	.def _BAT_StateGet_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_BAT_StateGet	;Function start
; 2 exit points
;	::->op : CALL
;	.line	58; "../ADC.c"	value = Adc_read();
	PAGESEL	_Adc_read
	CALL	_Adc_read
	PAGESEL	$
	BANKSEL	r0x1009
	MOV	r0x1009, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x100A
	MOV	r0x100A, R0
;	::->op : <
;unsigned compare: left < lit(0x5AC=1452), size=2
;	.line	73; "../ADC.c"	if(value >= 1452 && value <= 3512)
	MOV	R0,# 0x05
	BANKSEL	r0x1009
	SUB	R0, r0x1009
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00025_DS_
	MOV	R0,# 0xac
	BANKSEL	r0x100A
	SUB	R0, r0x100A
_00025_DS_
	JB	PSW, 0
	JMP	_00018_DS_
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0xDB9=3513), size=2
	MOV	R0,# 0x0d
	BANKSEL	r0x1009
	SUB	R0, r0x1009
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00026_DS_
	MOV	R0,# 0xb9
	BANKSEL	r0x100A
	SUB	R0, r0x100A
_00026_DS_
	JNB	PSW, 0
	JMP	_00018_DS_
;	::->op : RETURN
;	.line	75; "../ADC.c"	return 1;
	MOV	R0,# 0x01
	JMP	_00021_DS_
;	::->op : LABEL
;	::->op : RETURN
_00018_DS_
;	.line	79; "../ADC.c"	return 0;
	MOV	R0,# 0x00
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00021_DS_
	CRET	
;	.def _BAT_StateGet_function_end, debug, value=$

; exit point of _BAT_StateGet



func._Adc_read	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Adc_read	;Function start
; 2 exit points
;has an exit
;functions called:
;   _Adc_fun
;   _Adc_fun
;6 compiler assigned registers:
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;   STK00
;   r0x1008
;; Starting PostCode block
;	.def _Adc_read_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Adc_read	;Function start
; 2 exit points
;	::->op : =
;	.line	43; "../ADC.c"	uint32_t Adc_sum = 0 ; 		          //adc采样累加变量
	BANKSEL	r0x1004
	CLR	r0x1004
	BANKSEL	r0x1005
	CLR	r0x1005
;	::->op : =
;	.line	45; "../ADC.c"	for(i = 0; i < 8; i++)
	MOV	R0,# 0x08
	BANKSEL	r0x1006
	MOV	r0x1006, R0
;	::->op : LABEL
;	::->op : CALL
_00012_DS_
;	.line	47; "../ADC.c"	Adc_sum += Adc_fun();		  //累加八次采样值
	PAGESEL	_Adc_fun
	CALL	_Adc_fun
	PAGESEL	$
	BANKSEL	r0x1007
	MOV	r0x1007, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : +
	BANKSEL	r0x1008
	MOV	R0, r0x1008
	BANKSEL	r0x1004
	ADD	r0x1004, R0
	BANKSEL	r0x1007
	MOVZ	R0, r0x1007
	JNB	PSW, 0
	INC	R0
	JNB	PSW, 2
	JMP	_00027_DS_
	BANKSEL	r0x1005
	ADD	r0x1005, R0
;	::->op : CAST
_00027_DS_
	BANKSEL	r0x1006
	MOVZ	R0, r0x1006
	BANKSEL	r0x1008
	MOV	r0x1008, R0
;	::->op : -
	BANKSEL	r0x1008
	DEC	r0x1008
;	::->op : CAST
	BANKSEL	r0x1008
	MOVZ	R0, r0x1008
	BANKSEL	r0x1006
	MOV	r0x1006, R0
;	::->op : IFX
;	.line	45; "../ADC.c"	for(i = 0; i < 8; i++)
	MOV	R0,# 0x00
	BANKSEL	r0x1006
	ORL	R0, r0x1006
	JB	PSW, 2
	JMP	_00012_DS_
;	::->op : +
;	.line	49; "../ADC.c"	Adc_sum  += 4;					  // 四舍五入
	MOV	R0,# 0x04
	BANKSEL	r0x1004
	ADD	r0x1004, R0
	JB	PSW, 0
	JMP	_00028_DS_
	BANKSEL	r0x1005
	INC	r0x1005
;	::->op : RIGHT_OP
_00028_DS_
;	.line	50; "../ADC.c"	Adc_sum >>= 3;		              //右移动3位  除8求均值
	CLR	PSW, 0
	BANKSEL	r0x1005
	RRC	r0x1005
	BANKSEL	r0x1004
	RRC	r0x1004
	CLR	PSW, 0
	BANKSEL	r0x1005
	RRC	r0x1005
	BANKSEL	r0x1004
	RRC	r0x1004
	CLR	PSW, 0
	BANKSEL	r0x1005
	RRC	r0x1005
	BANKSEL	r0x1004
	RRC	r0x1004
;	::->op : RETURN
;	.line	51; "../ADC.c"	return Adc_sum;
	BANKSEL	r0x1004
	MOVZ	R0, r0x1004
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1005
	MOVZ	R0, r0x1005
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _Adc_read_function_end, debug, value=$

; exit point of _Adc_read



func._Adc_fun	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Adc_fun	;Function start
; 2 exit points
;has an exit
;5 compiler assigned registers:
;   r0x1000
;   r0x1001
;   r0x1002
;   r0x1003
;   STK00
;; Starting PostCode block
;	.def _Adc_fun_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Adc_fun	;Function start
; 2 exit points
;	::->op :*  =
;	.line	27; "../ADC.c"	START = 1;					  //启动ADC
	BANKSEL	_ADCCTL0_bits
	SET	_ADCCTL0_bits, 1
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00003_DS_
;	.line	28; "../ADC.c"	while(START);                 //等待转换结束
	BANKSEL	_ADCCTL0_bits
	JNB	_ADCCTL0_bits, 1
	JMP	_00003_DS_
;	::->op : CAST
;	.line	29; "../ADC.c"	Adc_num = ADCDATA0H;	  	  //将高位加进去
	BANKSEL	_ADCDATA0H
	MOVZ	R0, _ADCDATA0H
	BANKSEL	r0x1000
	MOV	r0x1000, R0
	BANKSEL	r0x1001
	CLR	r0x1001
;	::->op : LEFT_OP
;	.line	30; "../ADC.c"	Adc_num <<=8;
	BANKSEL	r0x1000
	MOVZ	R0, r0x1000
	BANKSEL	r0x1001
	MOV	r0x1001, R0
	BANKSEL	r0x1000
	CLR	r0x1000
;	::->op : CAST
;	.line	31; "../ADC.c"	Adc_num |= ADCDATA0L;		  //将低位加进去
	BANKSEL	_ADCDATA0L
	MOVZ	R0, _ADCDATA0L
	BANKSEL	r0x1002
	MOV	r0x1002, R0
;;1	CLR	r0x1003
;	::->op : |
	BANKSEL	r0x1002
	MOVZ	R0, r0x1002
	BANKSEL	r0x1000
	ORL	r0x1000, R0
	MOV	R0,# 0x00
	BANKSEL	r0x1001
	ORL	r0x1001, R0
;	::->op : RETURN
;	.line	32; "../ADC.c"	return Adc_num;			      //返回转换值
	BANKSEL	r0x1000
	MOVZ	R0, r0x1000
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1001
	MOVZ	R0, r0x1001
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _Adc_fun_function_end, debug, value=$

; exit point of _Adc_fun



func._ADC_Init	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _ADC_Init	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	.def _ADC_Init_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_ADC_Init	;Function start
; 2 exit points
;	::->op :*  =
;	.line	11; "../ADC.c"	TR11 = 1;		//ADC引脚配置 P1.1
	BANKSEL	_TR1_bits
	SET	_TR1_bits, 1
;	::->op : =
;	.line	12; "../ADC.c"	ANSEH = 0x00;
	BANKSEL	_ANSEH
	CLR	_ANSEH
;	::->op : =
;	.line	13; "../ADC.c"	ANSEL = 0x02;
	MOV	R0,# 0x02
	BANKSEL	_ANSEL
	MOV	_ANSEL, R0
;	::->op : =
;	.line	14; "../ADC.c"	ADCCTL1 = 0x95;		              //ad校准使能，8分频，VDD作为参考电压
	MOV	R0,# 0x95
	BANKSEL	_ADCCTL1
	MOV	_ADCCTL1, R0
;	::->op : =
;	.line	15; "../ADC.c"	ADCCTL0 = 0x85;		              //右对齐，通道1， AD使能打开     ( 0x 1_00 0101 )
	MOV	R0,# 0x85
	BANKSEL	_ADCCTL0
	MOV	_ADCCTL0, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
;	.def _ADC_Init_function_end, debug, value=$

; exit point of _ADC_Init


;	code size estimation:
;	   99+   55 =   154 instructions (  418 byte)

;	.type _ADC_Init,  32
;	.dim _ADC_Init, 1, (_ADC_Init_function_end&0xFF00)>>8, _ADC_Init_function_end&0xFF,0,9,0,16 , 1, 1
;	.type _Adc_fun,  32
;	.dim _Adc_fun, 1, (_Adc_fun_function_end&0xFF00)>>8, _Adc_fun_function_end&0xFF,0,24,0,33 , 1, 1
;	.type _Adc_read,  32
;	.dim _Adc_read, 1, (_Adc_read_function_end&0xFF00)>>8, _Adc_read_function_end&0xFF,0,41,0,52 , 1, 1
;	.type _BAT_StateGet,  32
;	.dim _BAT_StateGet, 1, (_BAT_StateGet_function_end&0xFF00)>>8, _BAT_StateGet_function_end&0xFF,0,54,0,82 , 1, 1

	.end
