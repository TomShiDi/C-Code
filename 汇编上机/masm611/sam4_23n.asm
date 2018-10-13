;如果wordx是0，则没必要进行右移判断。
.MODEL	SMALL
    	.STACK
    	.DATA
wordx	dw	0
bytey	db	-1	    
	.CODE
    	.STARTUP
    	mov	ax,wordx
	cmp	ax,0		;判0
	jz	done		;为0直接结束
	sub	cl,cl
AGAIN: 	shr	ax,1
	jc	over		;转，存结果
	inc	cl
    	JMP	AGAIN  		;继续循环
over:	mov	bytey,cl
DONE:	.EXIT 0
END
s