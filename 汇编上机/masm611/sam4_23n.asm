;���wordx��0����û��Ҫ���������жϡ�
.MODEL	SMALL
    	.STACK
    	.DATA
wordx	dw	0
bytey	db	-1	    
	.CODE
    	.STARTUP
    	mov	ax,wordx
	cmp	ax,0		;��0
	jz	done		;Ϊ0ֱ�ӽ���
	sub	cl,cl
AGAIN: 	shr	ax,1
	jc	over		;ת������
	inc	cl
    	JMP	AGAIN  		;����ѭ��
over:	mov	bytey,cl
DONE:	.EXIT 0
END
s