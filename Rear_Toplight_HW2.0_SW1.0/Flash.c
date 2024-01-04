#include "Flash.h"


uint8_t saveflag = 0;

unsigned int    FLASH_READ_BUF;	//�����ֶ�����ʹ�÷�ȫǶ���ģʽʱ��ʹ�ø�ֵ��ȡ��ȡ���ֵ
unsigned int 	FLASH_BUFFER[FLASH_BUFFER_MAX];
unsigned int    BUFFER_ARRY[5];

/***********************************************************************************
 * ������     ��FLASH_READ_ONE
 * �������ܣ����趨��ַ��ʼ����ȡһ������FLASH���ݲ����ؽ��
 * ��ڲ�������ʼ��ַ
 * ����          ����
 **********************************************************************************/
unsigned int FLASH_READ_ONE(unsigned int address)
{
#if  1  	// 1 ѡ��C���Ա��  0 ѡ��Ƕ����Ƕ���Ч�ʸ��ߣ�����ʾ���ݲ���δʹ�úͺ����޷��أ����Ժ���

	// FLASH_READ_BUF;  ��Ҫ����ȫ�ֵĸñ�������ȡֵ���ڷ��أ���ֱ��ʹ��
	//; ������ʹ��
	NVMADDRH=(unsigned char)(address>>8);
	NVMADDRL=(unsigned char)address;
	__asm
		;//�����ж�ʹ�ܼĴ���
			BANKSEL _INTCTL
			MOV		R1,_INTCTL
		;//�ر��жϣ��������ɴ��
			CLR		_INTCTL,_AIE
			JNB		_INTCTL,_AIE
			JMP		$-2
		;//ʱ��Ƶ�ʱ��ݼ���Ƶ����,���齵Ƶ��1M,��ʱ�ж��ѱ���
			MOV		R0,#0x30
			MOV		R2,_OSCCTL
			MOV		_OSCCTL,R0
		;//Ӳ��ʹ�ܶ�����
			BANKSEL _NVMCTL0
			MOV 	R5,#0x81
			MOV 	_NVMCTL0,R5
			NOPZ
			NOPZ
			NOPZ
			NOPZ
		;//ʱ�����ж�ʹ�ܵĻ�ԭ
			MOV		_OSCCTL,R2
			AND 	R1,#0xC0	;//�ж�ʹ�ܽ���ϵ��2λ
			ORL 	INTCTL,R1
		;//���������ֵ�����������ڷ���
			BANKSEL	_NVMDATAL
			MOV	R6,_NVMDATAL
			MOV	R7,_NVMDATAH
			BANKSEL _FLASH_READ_BUF
			MOV (_FLASH_READ_BUF),R6
			MOV (_FLASH_READ_BUF+1),R7
	__endasm;
	return 	FLASH_READ_BUF;
#else
	// �����Ĵ���ʹ��  �������Զ����� STK00  �� R0 ������R0Ϊ��λ������ʹ��STK00  �� R0 ������R0Ϊ��λ
	__asm
	;//���ݲ�����ַ
		BANKSEL _NVMADDRH
		MOV		_NVMADDRH,R0
		BANKSEL STK00
		MOV		R0,STK00
		BANKSEL _NVMADDRL
		MOV		_NVMADDRL,R0
	;//�����ж�ʹ�ܼĴ���
		BANKSEL _INTCTL
		MOV		R1,_INTCTL
	;//�ر��жϣ��������ɴ��
		CLR		_INTCTL,_AIE
		JNB		_INTCTL,_AIE
		JMP		$-2
	;//ʱ��Ƶ�ʱ��ݼ���Ƶ����,���齵Ƶ��1M,��ʱ�ж��ѱ���
		MOV		R0,#0x30
		MOV		R2,_OSCCTL
		MOV		_OSCCTL,R0
	;//Ӳ��ʹ�ܶ�����
		BANKSEL _NVMCTL0
		MOV 	R5,#0x81
		MOV 	_NVMCTL0,R5
		NOPZ
		NOPZ
		NOPZ
		NOPZ
	;//ʱ�����ж�ʹ�ܵĻ�ԭ
		MOV		_OSCCTL,R2
		AND 	R1,#0xC0	;//�ж�ʹ�ܽ���ϵ��2λ
		ORL 	_INTCTL,R1
	;//��������ṩ��ʽ �������ݷ��ؽ��ʹ��  �������Զ����� STK00  �� R0 ������R0Ϊ��λ
		BANKSEL	_NVMDATAL
		MOV		R0,NVMDATAL
		BANKSEL STK00
		MOV		STK00,R0

		BANKSEL	_NVMDATAH
		MOV		R0,NVMDATAH
	__endasm;
#endif

}
/***********************************************************************************
 * ������     ��FLASH_READ_FUN
 * �������ܣ����趨��ַ��ʼ����ȡһ��������FLASH���ݷ��õ���ֵFLASH_BUFFER[x]��
 * ��ڲ�������ʼ��ַ����������
 * ����          ����
 **********************************************************************************/
void FLASH_READ_FUN(unsigned int address,unsigned char length)
{
#if 1  	   //  1ʱЧ�ʱ�0С   1 ʹ�ô��ݲ���   0 ��������ȫǶ���ʵ�֣���������ʾ����δʹ�ã����Ժ���
	//; ������ʹ��
	NVMADDRH=(unsigned char) (address>>8);
	NVMADDRL=address;

	__asm
	;//�����ж�ʹ�ܼĴ���
		BANKSEL _INTCTL
		MOV		R1,_INTCTL
	;//�ر��жϣ��������ɴ��
		CLR		_INTCTL,_AIE
		JNB		_INTCTL,_AIE
		JMP		$-2
	;//ʱ��Ƶ�ʱ��ݼ���Ƶ����,���齵Ƶ��1M,��ʱ�ж��ѱ���
		MOV		R0,#0x30
		MOV		R2,_OSCCTL
		MOV		_OSCCTL,R0
	;//��ȡ����Ĵ����ʼRAM��ַ�������黺����  FLASH_BUFFER[x]
		MOV		R3,#_FLASH_BUFFER
	__endasm;

	while(length--)	// ��ʹ��R0�����ı�R1
	{
		__asm
		;//Ӳ����
		BANKSEL _NVMCTL0
		MOV 	R5,#0x81
		MOV 	_NVMCTL0,R5
		NOPZ
		NOPZ
		NOPZ				;//����2��
		NOPZ
		;//���������
		BANKSEL	_NVMDATAL
		MOV	R6,_NVMDATAL
		MOV	R7,_NVMDATAH

		BANKSEL _FLASH_BUFFER
		ST		[R3],R6
		INC		R3
		ST		[R3],R7
		INC		R3
		;//ָ����һ������ַ������ÿ�β���������һ�����У���ʱ����Ҫ����_BADDRL��λ��_BADDRH+1����
		BANKSEL _NVMADDRL
		INC		_NVMADDRL
		JNB		_PSW,_Z
		INC		_NVMADDRH
		__endasm;
	}

	__asm
		;//ʱ�����ж�ʹ�ܵĻ�ԭ
		BANKSEL _OSCCTL
		MOV		_OSCCTL,R2
		AND 	R1,#0xC0	;//�ж�ʹ�ܽ���ϵ��2λ
		ORL 	_INTCTL,R1
	__endasm;
#else
	// ����1�Ĵ���ʹ��  �������Զ����� STK00  �� R0 ������R0Ϊ��λ
	// ����2�Ĵ���ʹ��  �������Զ����� STK01
	// ����ʵ�ֵ�Ƕ������ʾ����δ��ʹ�ã����Ժ���
__asm
	;//���ݲ�����ַ
	BANKSEL _NVMADDRH
	MOV		_NVMADDRH,R0
	BANKSEL STK00
	MOV		R0,STK00
	BANKSEL _NVMADDRL
	MOV		_NVMADDRL,R0
	;//�����ж�ʹ�ܼĴ���
	BANKSEL _INTCTL
	MOV		R1,_INTCTL
	;//�ر��жϣ��������ɴ��
	CLR		_INTCTL,_AIE
	JNB		_INTCTL,_AIE
	JMP		$-2
	;//ʱ��Ƶ�ʱ��ݼ���Ƶ����,���齵Ƶ��1M,��ʱ�ж��ѱ���
	MOV		R0,#0x30
	MOV		R2,_OSCCTL
	MOV		_OSCCTL,R0
	;//��ȡ����Ĵ����ʼRAM��ַ�������黺����  FLASH_BUFFER[x]
	MOV		R0,#_FLASH_BUFFER

FLASH_READ_FUN_LOOP:
	;//Ӳ����
	BANKSEL _NVMCTL0
	MOV 	R5,#0x81
	MOV 	_NVMCTL0,R5
	NOPZ
	NOPZ
	NOPZ					;//����2��
	NOPZ
	;//���������
	BANKSEL	_NVMDATAL
	MOV	R6,_NVMDATAL
	MOV	R7,_NVMDATAH

	BANKSEL _FLASH_BUFFER
	ST		[R0],R6
	INC		R0
	ST		[R0],R7
	INC		R0
	;//ָ����һ������ַ������ÿ�β���������һ�����У���ʱ����Ҫ����_BADDRL��λ��_BADDRH+1����
	BANKSEL _NVMADDRL
	INC		_NVMADDRL
	JNB		_PSW,_Z
	INC		_NVMADDRH
	;//���������ж�
	BANKSEL STK01
	DECJZ	STK01
	JMP		FLASH_READ_FUN_LOOP

	;//ʱ�����ж�ʹ�ܵĻ�ԭ
	BANKSEL _OSCCTL
	MOV		_OSCCTL,R2
	AND 	R1,#0xC0	;//�ж�ʹ�ܽ���ϵ��2λ
	ORL 	_INTCTL,R1
__endasm;
#endif
}
/***********************************************************************************
 * ������     ��FLASH_WRITE_FUN
 * �������ܣ������ҳд�����ݵ�FLASH����������ֻ��Ϊ16,32 ����ַ����Ϊ����׵�ַ ��ʮ�������½�β00 20 40 60 80 A0 C0 E0
 * 			�����ַ����ҳ���׵�ַ������ȷ����������Ϊ0xFFFF����ǰ�����������д��ʹ������ֵ��0xFFFF������д����쳣��
 * ��ڲ�������д��ַ����д��ַ������
 * ����          ����
 * дʱ��˵������ȥ���룬����ҳFLASHΪ�����������һ����Ҫ6ms������3����Ҫ3ms������һ��ִ����ҳ�Ĳ�����д����飬������ֱ��д��
 **********************************************************************************/
void FLASH_WRITE_FUN(unsigned int address,unsigned char length)
{
#if 1  	   //  1ʱЧ�ʱ�0С   1 ʹ�ô��ݲ���   0 ��������ȫǶ���ʵ�֣���������ʾ����δʹ�ã����Ժ���
	//; ������ʹ��
	NVMADDRH=(unsigned char) (address>>8);
	NVMADDRL=address;

	__asm
	;//�����ж�ʹ�ܼĴ���
		BANKSEL _INTCTL
		MOV		R1,_INTCTL
	;//�ر��жϣ��������ɴ��
		CLR		_INTCTL,_PUIE
		CLR		_INTCTL,_AIE
		JNB		_INTCTL,_AIE
		JMP		$-2
	;//ʱ��Ƶ�ʱ��ݼ���Ƶ����,���齵Ƶ��1M,��ʱ�ж��ѱ���
		MOV		R0,#0x30
		MOV		R2,_OSCCTL
		MOV		_OSCCTL,R0
	;//��ȡ����Ĵ����ʼRAM��ַ�������黺����  FLASH_BUFFER[x]
		MOV		R3,#_FLASH_BUFFER
	__endasm;

	while(length--)		// ��ʹ��R0�����ı�R1
	{
		__asm

		;//���ش�д����
		BANKSEL _FLASH_BUFFER
		LD		R6,[R3]
		INC		R3
		LD		R7,[R3]
		INC		R3
		BANKSEL _NVMDATAH
		MOV _NVMDATAH,R7
		MOV _NVMDATAL,R6
		;//Ӳ��д
		MOV 	R5 ,#0x84
		MOV 	_NVMCTL0,R5
		MOV 	R5,#0x69
		MOV 	_NVMCTL1,R5
		MOV 	R5,#0x96
		MOV 	_NVMCTL1,R5
		SET 	_NVMCTL0 , 1	;// д���ڸ�ѹ����ѹ��ԭ��ӿ�ָ��ȷ��������������
		NOPZ
		NOPZ
		NOPZ
		NOPZ
		NOPZ
		NOPZ						;// ����10��������2��
		NOPZ
		NOPZ
		NOPZ
		NOPZ
		MOV 	R5,#0X80
		MOV 	_NVMCTL0,R5
		;//ָ����һ������ַ�����ﲻ���Ǹ�λ������Ҫ��ֻ�ܲ���һҳ�ڵ����ݣ����ܿ�ҳ
		BANKSEL _NVMADDRL
		INC		_NVMADDRL
		__endasm;
	}

	__asm
		;//ʱ�����ж�ʹ�ܵĻ�ԭ
		BANKSEL _OSCCTL
		MOV		_OSCCTL,R2
		AND 	R1,#0xC0	;//�ж�ʹ�ܽ���ϵ��2λ
		ORL 	_INTCTL,R1
	__endasm;
#else
	// ����1�Ĵ���ʹ��  �������Զ����� STK00  �� R0 ������R0Ϊ��λ
	// ����2�Ĵ���ʹ��  �������Զ����� STK01
	// ����ʵ�ֵ�Ƕ������ʾ����δ��ʹ�ã����Ժ���
__asm
	;//���ݲ����ĵ�ַ(����)
	BANKSEL _NVMADDRH
	MOV		_NVMADDRH,R0
	BANKSEL STK00
	MOV		R0,STK00
	BANKSEL _NVMADDRL
	MOV		_NVMADDRL,R0
	;//�����ж�ʹ�ܼĴ���
	BANKSEL	_INTCTL
	MOV		R1,_INTCTL
	;//�ر��жϣ��������ɴ��
	CLR		_INTCTL,_PUIE
	CLR		_INTCTL,_AIE
	JNB		_INTCTL,_AIE
	JMP		$-2
	;//ʱ��Ƶ�ʱ��ݼ���Ƶ����,���齵Ƶ��1M,��ʱ�ж��ѱ���
	MOV		R0,#0x30
	MOV		R2,_OSCCTL
	MOV		_OSCCTL,R0
	;//��д���ݵĴ����ʼRAM��ַ�������黺����  FLASH_BUFFER[x]
	MOV		R0,#_FLASH_BUFFER

FALSH_WRITE_PAGE_LOOP:
	;//���ش�д����
	BANKSEL _FLASH_BUFFER
	LD		R6,[R0]
	INC		R0
	LD		R7,[R0]
	INC		R0

	BANKSEL _NVMDATAH
	MOV _NVMDATAH,R7
	MOV _NVMDATAL,R6

	;//Ӳ��д
	MOV 	R5 ,#0x84
	MOV 	_NVMCTL0,R5
	MOV 	R5,#0x69
	MOV 	_NVMCTL1,R5
	MOV 	R5,#0x96
	MOV 	_NVMCTL1,R5
	SET 	_NVMCTL0 , 1	;// д���ڸ�ѹ����ѹ��ԭ��ӿ�ָ��ȷ��������������
	NOPZ
	NOPZ
	NOPZ
	NOPZ
	NOPZ
	NOPZ						;// ����10��������2��
	NOPZ
	NOPZ
	NOPZ
	NOPZ
	MOV 	R5,#0X80
	MOV 	_NVMCTL0,R5
	;//ָ����һ������ַ�����ﲻ���Ǹ�λ������Ҫ��ֻ�ܲ���һҳ�ڵ����ݣ����ܿ�ҳ
	BANKSEL _NVMADDRL
	INC		_NVMADDRL

	BANKSEL STK01
	DECJZ	STK01
	JMP		FALSH_WRITE_PAGE_LOOP

	;//ʱ�����ж�ʹ�ܵĻ�ԭ
	BANKSEL _OSCCTL
	MOV		_OSCCTL,R2
	AND 	R1,#0xC0	;//�ж�ʹ�ܽ���ϵ��2λ
	ORL 	_INTCTL,R1
__endasm;
#endif
}

/***********************************************************************************
 * ������     ��FLASH_WRITE_ONE
 * �������ܣ���ĳһ��ַд��һ���֣�������ʹ�ã�ʵ��ִ�д�ҳ�׶���������Ӧ��ַ�Ļ����޸ģ���ҳ��ʼ��д����˵�ַ��ҳ��ƫ������Ҫ�����С��������
 * ���飺         �ɲ���FLASH_WRITE_FUN�Ĵ��ݸ���Ϊ16,32 ��Ӧ����������ַ��ʼ�ĵ�һ�� �ڶ���
 * 			 ����ַ������ĳ��Ŀ�ʼ
 * ��ڲ�������д��ַ����д��ַ������
 * ����          ����
 **********************************************************************************/
void FLASH_WRITE_ONE(unsigned int address,unsigned int value)
{
	// ������ǰҳ�����ݻ��棬Ҫ�󻺴��С��������д��ַ��ƫ����Ҫ��
	FLASH_READ_FUN(address&0xFFE0,FLASH_BUFFER_MAX);
	// �޸Ĵ�д�����ڰ���ҳ������λ�����ݽ��
	FLASH_BUFFER[address&0x1F] = value;
	// ��ҳ���ݻ�д
	FLASH_WRITE_FUN(address&0xFFE0,FLASH_BUFFER_MAX);
}

/*
 * FLASH ��ʼ��
 * FLASH_Init()
 */

void FLASH_Init(void)
{
	unsigned int i;

	//��ȡFLASH���������
	for(i = 0; i < BUFFER_MAX; i++)
	{
		//BUFFER_ARRY[i] = FLASH_READ_ONE(0x1E60+i);
		BUFFER_ARRY[i] = FLASH_READ_ONE(0x1FC0+i);
	}

	if(BUFFER_ARRY[0] == 0x55)  //�д������� �ָ�����
	{
		//LED1
		if(BUFFER_ARRY[1] == LeftReadLightSW && BUFFER_ARRY[2] == Ind_On)
		{
			set_led(1,LeftReadLightSW,Key_On);
			key_state_set(1,Key_On);
			//Ind_InfoSet(LeftReadLight, LeftReadLightSW, Ind_On);
		}
		//LED2
		if(BUFFER_ARRY[3] == RightReadLightSW && BUFFER_ARRY[4] == Ind_On)
		{
			set_led(2,RightReadLightSW,Key_On);
			key_state_set(2,Key_On);
			//Ind_InfoSet(LeftReadLight, LeftReadLightSW, Ind_On);
		}
	}
	else //������ ��ʼ������
	{
		FLASH_BUFFER[0] = 0x55;
		FLASH_BUFFER[1] = LeftReadLightSW;
		FLASH_BUFFER[2] = Ind_Off;
		FLASH_BUFFER[3] = RightReadLightSW;
		FLASH_BUFFER[4] = Ind_Off;

		set_led(1,LeftReadLightSW,Key_Off);
		set_led(2,RightReadLightSW,Key_Off);

		FLASH_WRITE_FUN(0x1FC0,FLASH_BUFFER_MAX);
		//FLASH_WRITE_FUN(0x1E60,FLASH_BUFFER_MAX);
	}
}

/*
 * FLASH���ݴ洢
 * FLASH_Deal()
 */
void FLASH_Deal(void)
{
	if(saveflag == 1)
	{
		//FLASH_WRITE_FUN(0x1E60,FLASH_BUFFER_MAX);
		FLASH_WRITE_FUN(0x1FC0,FLASH_BUFFER_MAX);
		set_savefalg(0);
	}
}

//�޸Ĵ�������
void Flash_data_set(uint8_t ch,uint8_t sw,uint8_t status)
{
	if(ch == 1)
	{
		FLASH_BUFFER[0] = 0x55;
		FLASH_BUFFER[1] = sw;
		FLASH_BUFFER[2] = status;
		//FLASH_BUFFER[3] = FLASH_READ_ONE(0x1E60+3);
		//FLASH_BUFFER[4] = FLASH_READ_ONE(0x1E60+4);
		FLASH_BUFFER[3] = FLASH_READ_ONE(0x1FC0+3);
		FLASH_BUFFER[4] = FLASH_READ_ONE(0x1FC0+4);

	}

	if(ch == 2)
	{
		FLASH_BUFFER[0] = 0x55;
//		FLASH_BUFFER[1] = FLASH_READ_ONE(0x1E60+1);
//		FLASH_BUFFER[2] = FLASH_READ_ONE(0x1E60+2);
		FLASH_BUFFER[1] = FLASH_READ_ONE(0x1FC0+1);
		FLASH_BUFFER[2] = FLASH_READ_ONE(0x1FC0+2);
		FLASH_BUFFER[3] = sw;
		FLASH_BUFFER[4] = status;
	}
	set_savefalg(1);
}

//set Save_flag
void set_savefalg(uint8_t value)
{
	saveflag = value;
}


