;求数组元素校验和存入result单元，P164
.MODEL	SMALL
    	.STACK
    	.DATA
array	db	56h,23h,37h,78h,0ffh,0,12h,99h,64h,0b0h
count	equ	($-array)/type array  
result	db	?  
	.CODE
    	.STARTUP
	mov	bx,offset array
	mov	cx,count
	call	chksum
	mov	result,al
	.EXIT 0
;计算数组元素校验和
;人口参数：ds:bx=数组首地址：偏移地址，cx=元素个数
;出口参数：al=校验和
;说明：除ax，bx，cx外不影响其它寄存器
chksum	proc
	push	cx
	push	bx
	xor	al,al
suma:	add	al,[bx]
	inc	bx
	loop	suma
	pop	bx
	pop	cx
	ret
chksum	endp
END
