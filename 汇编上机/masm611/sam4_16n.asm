;samp4_16.asm,P151,�������㷨��1����������������Ҫ��cbd����1���㷨��Ч��
.MODEL	SMALL
    .STACK
    .DATA
    X		DB	8CH
    Y 		DB	64H
    Z		DB	?
.CODE
.STARTUP
   		MOV	AL,X		;AL��8CH
		ADD	AL,Y		;AL��8CH+64H
      		rcr	al,1
					;MOV	AH,00H ,AH��00H
					;ADC	AH,00H ,��λ��AH
					;MOV	BL,2 ,����2��BL
					;DIV	BL  ,AX����BL������,
                        		;�̡�AL,������AH
		MOV	Z,AL   		;�������Z��Ԫ
    		.EXIT 0
END
