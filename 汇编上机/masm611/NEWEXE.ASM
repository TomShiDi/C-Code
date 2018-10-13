;exe dummy (C) by O Love & Tels - please modify for your own purposes

.286c
;-------------------------------------------------------------- SEG_A  ----

SEG_A		SEGMENT BYTE PUBLIC
		ASSUME CS:SEG_A, DS:SEG_B, SS:STACK_SEG_C

EXEDUMMY	PROC	FAR

;insert your macros and procedures here like this one:

	DUMMY MACRO
		NOP
	ENDM

;insert your main program code here:

START:		
		MOV	AX,4C00H
		INT	21H			;DOS service: terminate
EXEDUMMY	ENDP
SEG_A		ENDS

;-------------------------------------------------------------- SEG_B  ----

SEG_B		SEGMENT BYTE PUBLIC
		ASSUME CS:SEG_B, DS:SEG_B, SS:STACK_SEG_C

;insert your data here like this one:

	a	DB 0
SEG_B		ENDS

;--------------------------------------------------------- STACK_SEG_C	---

STACK_SEG_C	SEGMENT WORD STACK 'STACK'
		DB 4 DUP (0)			;stack size
STACK_SEG_C	ENDS

		END	START
