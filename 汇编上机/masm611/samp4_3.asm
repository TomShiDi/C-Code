;samp4_3.asm
.MODEL	SMALL
    .STACK
    .DATA 
    V_BYTE   	EQU	THIS BYTE	;;V_BYTE���ֽ����͵ı���,�����
                   			;��V_WORD��ַ��ͬ:
    V_WORD	DW	3332H,3735H 	;V_WORD�������͵ı���.
    TARGET    	DW   	5 DUP (20H) 	;�������ݿռ�2 �� 5��10���ֽ�,
    CRLF	DB	0DH,0AH,'$'
    FLAG	DB	0
    N_POINT	DW  	OFFSET S_LABEL  ;ȡ�ñ��S_LABEL��ƫ�Ƶ�ַ
    .CODE
    .STARTUP
		MOV	AL,BYTE PTR V_WORD	;��PTR�ı�V_ WORD��
          				;����,������AL�Ĵ������Ͳ�ƥ��,ָ���к�(AL)=32H
		DEC	AL
		MOV	V_BYTE,AL	;��V_WORD�ĵ�һ���ֽڲ���,ԭ
					;����32H,������31H
N_LABEL:	CMP 	FLAG,1
		JZ	S_LABEL		;FLAG��ԪΪ1,��ת��
 		INC	FLAG
 		JMP	SHORT  N_LABEL 	;��ת��
S_LABEL:	CMP	FLAG,2
		JZ	NEXT 		;FLAG��ԪΪ2ת��
		INC	FLAG
		JMP	N_POINT		;���ڵĴ洢�����Ѱַ,ת
					;�Ƶ����S_LABEL��
NEXT:		MOV	AX,TYPE V_WORD	;�����ΪMOV AX,2
 		MOV	CX,LENGTH TARGET	;�����ΪMOV CX,5
 		MOV	SI,OFFSET  TARGET
W_AGAIN:	MOV 	[SI],AX 		;���ֵ�Ԫ����
		INC	SI 			;SIָ���2
 		INC	SI
 		LOOP	W_AGAIN 		;ѭ��
 		MOV	CX,SIZE TARGET 		;�����ΪMOV CX,0AH
 		MOV	AL,'?'
 		MOV	DI,OFFSET TARGET
B_AGAIN:	MOV	[DI],AL 		;���ֽڵ�Ԫ����
 		INC	DI			;DIָ���1
		LOOP	B_AGAIN 		;ѭ��
 		MOV	DX,OFFSET V_WORD	;��ʾ���:1357??????????
    		MOV	AH,9
    		INT	21H
    		.EXIT 0
END
