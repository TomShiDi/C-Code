;求数组元素校验和存入result单元，P164
.MODEL	SMALL
    	.STACK
    	.DATA
array	db	56h,23h,37h,78h,0ffh,0,12h,99h,64h,0b0h
count	equ	($-array)/type array  
result	db	?  
	.CODE
    	.STARTUP
	mov	ax,offset array
	push	ax
	mov	ax,count
	push	ax
	call	chksum
	mov	result,al
	.EXIT 0
;计算数组元素校验和
;人口参数：数组首地址,元素个数通过堆栈传递
;出口参数：al=校验和
chksum	proc
	push	bp
	mov	bp,sp			;
	push	bx
	push	cx
	mov	bx,[bp+6]
	mov	cx,[bp+4]
	xor	al,al
suma:	add	al,[bx]
	inc	bx
	loop	suma
	pop	cx
	pop	bx
	pop	bp
	ret	4
chksum	endp
END
