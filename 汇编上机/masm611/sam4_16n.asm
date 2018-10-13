;samp4_16.asm,P151,最弱智算法。1、不能做符号数（要用cbd）；1、算法低效。
.MODEL	SMALL
    .STACK
    .DATA
    X		DB	8CH
    Y 		DB	64H
    Z		DB	?
.CODE
.STARTUP
   		MOV	AL,X		;AL←8CH
		ADD	AL,Y		;AL←8CH+64H
      		rcr	al,1
					;MOV	AH,00H ,AH←00H
					;ADC	AH,00H ,进位送AH
					;MOV	BL,2 ,除数2→BL
					;DIV	BL  ,AX除以BL的内容,
                        		;商→AL,余数→AH
		MOV	Z,AL   		;结果送入Z单元
    		.EXIT 0
END
