.MODEL	small			;采用小型模式
    	.stack
	.data
_a	db	22
_b	db	33
_c	db	44
tag	db	1
	.CODE			
    	.STARTUP           		
        mov	al,_b
	imul	al
	mov	bx,ax		;B*B在bx
	mov	al,_a
	imul	_c
	shl	ax,1
	shl	ax,1		;4AC在ax
	sub	bx,ax
	jge	done
	mov	tag,0
done:	.EXIT 0
END 
