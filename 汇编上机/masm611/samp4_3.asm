;samp4_3.asm
.MODEL	SMALL
    .STACK
    .DATA 
    V_BYTE   	EQU	THIS BYTE	;;V_BYTE是字节类型的变量,但与变
                   			;量V_WORD地址相同:
    V_WORD	DW	3332H,3735H 	;V_WORD是字类型的变量.
    TARGET    	DW   	5 DUP (20H) 	;分配数据空间2 × 5＝10个字节,
    CRLF	DB	0DH,0AH,'$'
    FLAG	DB	0
    N_POINT	DW  	OFFSET S_LABEL  ;取得标号S_LABEL的偏移地址
    .CODE
    .STARTUP
		MOV	AL,BYTE PTR V_WORD	;用PTR改变V_ WORD的
          				;类型,否则与AL寄存器类型不匹配,指令行后(AL)=32H
		DEC	AL
		MOV	V_BYTE,AL	;对V_WORD的第一个字节操作,原
					;来是32H,现在是31H
N_LABEL:	CMP 	FLAG,1
		JZ	S_LABEL		;FLAG单元为1,则转移
 		INC	FLAG
 		JMP	SHORT  N_LABEL 	;短转移
S_LABEL:	CMP	FLAG,2
		JZ	NEXT 		;FLAG单元为2转移
		INC	FLAG
		JMP	N_POINT		;段内的存储器间接寻址,转
					;移到标号S_LABEL处
NEXT:		MOV	AX,TYPE V_WORD	;汇编结果为MOV AX,2
 		MOV	CX,LENGTH TARGET	;汇编结果为MOV CX,5
 		MOV	SI,OFFSET  TARGET
W_AGAIN:	MOV 	[SI],AX 		;对字单元操作
		INC	SI 			;SI指针加2
 		INC	SI
 		LOOP	W_AGAIN 		;循环
 		MOV	CX,SIZE TARGET 		;汇编结果为MOV CX,0AH
 		MOV	AL,'?'
 		MOV	DI,OFFSET TARGET
B_AGAIN:	MOV	[DI],AL 		;对字节单元操作
 		INC	DI			;DI指针加1
		LOOP	B_AGAIN 		;循环
 		MOV	DX,OFFSET V_WORD	;显示结果:1357??????????
    		MOV	AH,9
    		INT	21H
    		.EXIT 0
END
