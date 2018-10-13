;com dummy (C) by O Love & Tels - please modify for your own purposes

.286c
SEG_A		SEGMENT
		ASSUME CS:SEG_A, DS:SEG_A
		ORG	100H

COMDUMMY	PROC FAR
	INIT:	JMP	START

;insert your data here like this one:

		a	DW	0

;insert your macros and procedures here like this one:

	DUMMY MACRO
		NOP
	ENDM

	START:	
; insert your main program code here:

		RETN
COMDUMMY	ENDP

SEG_A		ENDS
		END	INIT
