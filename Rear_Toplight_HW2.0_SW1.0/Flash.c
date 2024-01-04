#include "Flash.h"


uint8_t saveflag = 0;

unsigned int    FLASH_READ_BUF;	//当单字读函数使用非全嵌汇编模式时，使用该值获取读取结果值
unsigned int 	FLASH_BUFFER[FLASH_BUFFER_MAX];
unsigned int    BUFFER_ARRY[5];

/***********************************************************************************
 * 函数名     ：FLASH_READ_ONE
 * 函数功能：以设定地址开始，读取一个数的FLASH数据并返回结果
 * 入口参数：起始地址
 * 返回          ：无
 **********************************************************************************/
unsigned int FLASH_READ_ONE(unsigned int address)
{
#if  1  	// 1 选用C语言表达  0 选用嵌汇编表达，嵌汇编效率更高，但提示传递参数未使用和函数无返回，可以忽略

	// FLASH_READ_BUF;  需要定义全局的该变量，获取值用于返回，或直接使用
	//; 参数的使用
	NVMADDRH=(unsigned char)(address>>8);
	NVMADDRL=(unsigned char)address;
	__asm
		;//备份中断使能寄存器
			BANKSEL _INTCTL
			MOV		R1,_INTCTL
		;//关闭中断，操作不可打断
			CLR		_INTCTL,_AIE
			JNB		_INTCTL,_AIE
			JMP		$-2
		;//时钟频率备份及降频操作,建议降频到1M,此时中断已被关
			MOV		R0,#0x30
			MOV		R2,_OSCCTL
			MOV		_OSCCTL,R0
		;//硬件使能读操作
			BANKSEL _NVMCTL0
			MOV 	R5,#0x81
			MOV 	_NVMCTL0,R5
			NOPZ
			NOPZ
			NOPZ
			NOPZ
		;//时钟与中断使能的还原
			MOV		_OSCCTL,R2
			AND 	R1,#0xC0	;//中断使能仅关系高2位
			ORL 	INTCTL,R1
		;//操作结果赋值到变量，用于返回
			BANKSEL	_NVMDATAL
			MOV	R6,_NVMDATAL
			MOV	R7,_NVMDATAH
			BANKSEL _FLASH_READ_BUF
			MOV (_FLASH_READ_BUF),R6
			MOV (_FLASH_READ_BUF+1),R7
	__endasm;
	return 	FLASH_READ_BUF;
#else
	// 参数的传递使用  编译器自动变量 STK00  和 R0 ，其中R0为高位，返回使用STK00  和 R0 ，其中R0为高位
	__asm
	;//传递操作地址
		BANKSEL _NVMADDRH
		MOV		_NVMADDRH,R0
		BANKSEL STK00
		MOV		R0,STK00
		BANKSEL _NVMADDRL
		MOV		_NVMADDRL,R0
	;//备份中断使能寄存器
		BANKSEL _INTCTL
		MOV		R1,_INTCTL
	;//关闭中断，操作不可打断
		CLR		_INTCTL,_AIE
		JNB		_INTCTL,_AIE
		JMP		$-2
	;//时钟频率备份及降频操作,建议降频到1M,此时中断已被关
		MOV		R0,#0x30
		MOV		R2,_OSCCTL
		MOV		_OSCCTL,R0
	;//硬件使能读操作
		BANKSEL _NVMCTL0
		MOV 	R5,#0x81
		MOV 	_NVMCTL0,R5
		NOPZ
		NOPZ
		NOPZ
		NOPZ
	;//时钟与中断使能的还原
		MOV		_OSCCTL,R2
		AND 	R1,#0xC0	;//中断使能仅关系高2位
		ORL 	_INTCTL,R1
	;//操作结果提供形式 整型数据返回结果使用  编译器自动变量 STK00  和 R0 ，其中R0为高位
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
 * 函数名     ：FLASH_READ_FUN
 * 函数功能：以设定地址开始，读取一定个数的FLASH数据放置到数值FLASH_BUFFER[x]中
 * 入口参数：起始地址，操作个数
 * 返回          ：无
 **********************************************************************************/
void FLASH_READ_FUN(unsigned int address,unsigned char length)
{
#if 1  	   //  1时效率比0小   1 使用传递参数   0 按编译器全嵌汇编实现，但编译提示参数未使用，可以忽略
	//; 参数的使用
	NVMADDRH=(unsigned char) (address>>8);
	NVMADDRL=address;

	__asm
	;//备份中断使能寄存器
		BANKSEL _INTCTL
		MOV		R1,_INTCTL
	;//关闭中断，操作不可打断
		CLR		_INTCTL,_AIE
		JNB		_INTCTL,_AIE
		JMP		$-2
	;//时钟频率备份及降频操作,建议降频到1M,此时中断已被关
		MOV		R0,#0x30
		MOV		R2,_OSCCTL
		MOV		_OSCCTL,R0
	;//读取结果的存放起始RAM地址，即数组缓存区  FLASH_BUFFER[x]
		MOV		R3,#_FLASH_BUFFER
	__endasm;

	while(length--)	// 仅使用R0，不改变R1
	{
		__asm
		;//硬件读
		BANKSEL _NVMCTL0
		MOV 	R5,#0x81
		MOV 	_NVMCTL0,R5
		NOPZ
		NOPZ
		NOPZ				;//至少2条
		NOPZ
		;//读结果处理
		BANKSEL	_NVMDATAL
		MOV	R6,_NVMDATAL
		MOV	R7,_NVMDATAH

		BANKSEL _FLASH_BUFFER
		ST		[R3],R6
		INC		R3
		ST		[R3],R7
		INC		R3
		;//指向下一操作地址，建议每次操作内容在一个块中，此时不需要处理_BADDRL进位的_BADDRH+1操作
		BANKSEL _NVMADDRL
		INC		_NVMADDRL
		JNB		_PSW,_Z
		INC		_NVMADDRH
		__endasm;
	}

	__asm
		;//时钟与中断使能的还原
		BANKSEL _OSCCTL
		MOV		_OSCCTL,R2
		AND 	R1,#0xC0	;//中断使能仅关系高2位
		ORL 	_INTCTL,R1
	__endasm;
#else
	// 参数1的传递使用  编译器自动变量 STK00  和 R0 ，其中R0为高位
	// 参数2的传递使用  编译器自动变量 STK01
	// 整体实现的嵌汇编会提示参数未被使用，可以忽略
__asm
	;//传递操作地址
	BANKSEL _NVMADDRH
	MOV		_NVMADDRH,R0
	BANKSEL STK00
	MOV		R0,STK00
	BANKSEL _NVMADDRL
	MOV		_NVMADDRL,R0
	;//备份中断使能寄存器
	BANKSEL _INTCTL
	MOV		R1,_INTCTL
	;//关闭中断，操作不可打断
	CLR		_INTCTL,_AIE
	JNB		_INTCTL,_AIE
	JMP		$-2
	;//时钟频率备份及降频操作,建议降频到1M,此时中断已被关
	MOV		R0,#0x30
	MOV		R2,_OSCCTL
	MOV		_OSCCTL,R0
	;//读取结果的存放起始RAM地址，即数组缓存区  FLASH_BUFFER[x]
	MOV		R0,#_FLASH_BUFFER

FLASH_READ_FUN_LOOP:
	;//硬件读
	BANKSEL _NVMCTL0
	MOV 	R5,#0x81
	MOV 	_NVMCTL0,R5
	NOPZ
	NOPZ
	NOPZ					;//至少2条
	NOPZ
	;//读结果处理
	BANKSEL	_NVMDATAL
	MOV	R6,_NVMDATAL
	MOV	R7,_NVMDATAH

	BANKSEL _FLASH_BUFFER
	ST		[R0],R6
	INC		R0
	ST		[R0],R7
	INC		R0
	;//指向下一操作地址，建议每次操作内容在一个块中，此时不需要处理_BADDRL进位的_BADDRH+1操作
	BANKSEL _NVMADDRL
	INC		_NVMADDRL
	JNB		_PSW,_Z
	INC		_NVMADDRH
	;//读数量的判断
	BANKSEL STK01
	DECJZ	STK01
	JMP		FLASH_READ_FUN_LOOP

	;//时钟与中断使能的还原
	BANKSEL _OSCCTL
	MOV		_OSCCTL,R2
	AND 	R1,#0xC0	;//中断使能仅关系高2位
	ORL 	_INTCTL,R1
__endasm;
#endif
}
/***********************************************************************************
 * 函数名     ：FLASH_WRITE_FUN
 * 函数功能：按块或按页写入数据到FLASH，个数参数只能为16,32 ，地址必须为块的首地址 如十六进制下结尾00 20 40 60 80 A0 C0 E0
 * 			如果地址不是页的首地址，必须确定后续块结果为0xFFFF，或前面操作过块首写，使后续块值被0xFFFF，否则写结果异常。
 * 入口参数：待写地址，待写地址的数据
 * 返回          ：无
 * 写时间说明：除去代码，以整页FLASH为例，操作完第一块需要6ms，另外3块需要3ms。即第一块执行整页的擦除后写自身块，其他块直接写。
 **********************************************************************************/
void FLASH_WRITE_FUN(unsigned int address,unsigned char length)
{
#if 1  	   //  1时效率比0小   1 使用传递参数   0 按编译器全嵌汇编实现，但编译提示参数未使用，可以忽略
	//; 参数的使用
	NVMADDRH=(unsigned char) (address>>8);
	NVMADDRL=address;

	__asm
	;//备份中断使能寄存器
		BANKSEL _INTCTL
		MOV		R1,_INTCTL
	;//关闭中断，操作不可打断
		CLR		_INTCTL,_PUIE
		CLR		_INTCTL,_AIE
		JNB		_INTCTL,_AIE
		JMP		$-2
	;//时钟频率备份及降频操作,建议降频到1M,此时中断已被关
		MOV		R0,#0x30
		MOV		R2,_OSCCTL
		MOV		_OSCCTL,R0
	;//读取结果的存放起始RAM地址，即数组缓存区  FLASH_BUFFER[x]
		MOV		R3,#_FLASH_BUFFER
	__endasm;

	while(length--)		// 仅使用R0，不改变R1
	{
		__asm

		;//加载待写数据
		BANKSEL _FLASH_BUFFER
		LD		R6,[R3]
		INC		R3
		LD		R7,[R3]
		INC		R3
		BANKSEL _NVMDATAH
		MOV _NVMDATAH,R7
		MOV _NVMDATAL,R6
		;//硬件写
		MOV 	R5 ,#0x84
		MOV 	_NVMCTL0,R5
		MOV 	R5,#0x69
		MOV 	_NVMCTL1,R5
		MOV 	R5,#0x96
		MOV 	_NVMCTL1,R5
		SET 	_NVMCTL0 , 1	;// 写存在高压，高压还原添加空指令确保后续运行正常
		NOPZ
		NOPZ
		NOPZ
		NOPZ
		NOPZ
		NOPZ						;// 建议10条，至少2条
		NOPZ
		NOPZ
		NOPZ
		NOPZ
		MOV 	R5,#0X80
		MOV 	_NVMCTL0,R5
		;//指向下一操作地址，这里不考虑高位，特性要求只能操作一页内的数据，不能跨页
		BANKSEL _NVMADDRL
		INC		_NVMADDRL
		__endasm;
	}

	__asm
		;//时钟与中断使能的还原
		BANKSEL _OSCCTL
		MOV		_OSCCTL,R2
		AND 	R1,#0xC0	;//中断使能仅关系高2位
		ORL 	_INTCTL,R1
	__endasm;
#else
	// 参数1的传递使用  编译器自动变量 STK00  和 R0 ，其中R0为高位
	// 参数2的传递使用  编译器自动变量 STK01
	// 整体实现的嵌汇编会提示参数未被使用，可以忽略
__asm
	;//传递操作的地址(块首)
	BANKSEL _NVMADDRH
	MOV		_NVMADDRH,R0
	BANKSEL STK00
	MOV		R0,STK00
	BANKSEL _NVMADDRL
	MOV		_NVMADDRL,R0
	;//备份中断使能寄存器
	BANKSEL	_INTCTL
	MOV		R1,_INTCTL
	;//关闭中断，操作不可打断
	CLR		_INTCTL,_PUIE
	CLR		_INTCTL,_AIE
	JNB		_INTCTL,_AIE
	JMP		$-2
	;//时钟频率备份及降频操作,建议降频到1M,此时中断已被关
	MOV		R0,#0x30
	MOV		R2,_OSCCTL
	MOV		_OSCCTL,R0
	;//待写数据的存放起始RAM地址，即数组缓存区  FLASH_BUFFER[x]
	MOV		R0,#_FLASH_BUFFER

FALSH_WRITE_PAGE_LOOP:
	;//加载待写数据
	BANKSEL _FLASH_BUFFER
	LD		R6,[R0]
	INC		R0
	LD		R7,[R0]
	INC		R0

	BANKSEL _NVMDATAH
	MOV _NVMDATAH,R7
	MOV _NVMDATAL,R6

	;//硬件写
	MOV 	R5 ,#0x84
	MOV 	_NVMCTL0,R5
	MOV 	R5,#0x69
	MOV 	_NVMCTL1,R5
	MOV 	R5,#0x96
	MOV 	_NVMCTL1,R5
	SET 	_NVMCTL0 , 1	;// 写存在高压，高压还原添加空指令确保后续运行正常
	NOPZ
	NOPZ
	NOPZ
	NOPZ
	NOPZ
	NOPZ						;// 建议10条，至少2条
	NOPZ
	NOPZ
	NOPZ
	NOPZ
	MOV 	R5,#0X80
	MOV 	_NVMCTL0,R5
	;//指向下一操作地址，这里不考虑高位，特性要求只能操作一页内的数据，不能跨页
	BANKSEL _NVMADDRL
	INC		_NVMADDRL

	BANKSEL STK01
	DECJZ	STK01
	JMP		FALSH_WRITE_PAGE_LOOP

	;//时钟与中断使能的还原
	BANKSEL _OSCCTL
	MOV		_OSCCTL,R2
	AND 	R1,#0xC0	;//中断使能仅关系高2位
	ORL 	_INTCTL,R1
__endasm;
#endif
}

/***********************************************************************************
 * 函数名     ：FLASH_WRITE_ONE
 * 函数功能：向某一地址写入一个字，不建议使用，实际执行从页首读出，经对应地址的缓存修改，在页起始回写，因此地址与页首偏移量需要数组大小满足需求。
 * 建议：         可采用FLASH_WRITE_FUN的传递个数为16,32 对应连续操作地址开始的第一块 第二块
 * 			 但地址必须是某块的开始
 * 入口参数：待写地址，待写地址的数据
 * 返回          ：无
 **********************************************************************************/
void FLASH_WRITE_ONE(unsigned int address,unsigned int value)
{
	// 读出当前页到数据缓存，要求缓存大小必须满足写地址的偏移量要求
	FLASH_READ_FUN(address&0xFFE0,FLASH_BUFFER_MAX);
	// 修改待写数据在按照页排序中位置数据结果
	FLASH_BUFFER[address&0x1F] = value;
	// 整页数据回写
	FLASH_WRITE_FUN(address&0xFFE0,FLASH_BUFFER_MAX);
}

/*
 * FLASH 初始化
 * FLASH_Init()
 */

void FLASH_Init(void)
{
	unsigned int i;

	//读取FLASH储存的数据
	for(i = 0; i < BUFFER_MAX; i++)
	{
		//BUFFER_ARRY[i] = FLASH_READ_ONE(0x1E60+i);
		BUFFER_ARRY[i] = FLASH_READ_ONE(0x1FC0+i);
	}

	if(BUFFER_ARRY[0] == 0x55)  //有储存数据 恢复数据
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
	else //无数据 初始化数据
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
 * FLASH数据存储
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

//修改储存数据
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


