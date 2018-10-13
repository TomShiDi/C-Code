;samp428.asm,P164,调用子程序求数组校验和送result单元。
.model small
.stack
.data
	result	db	0
	array	db	56h,23h,37h,78h,0ffh,0,12h,99h,64h,0b0h
		db	78h,80h,23h,1,4,0fh,2ah,46h,32h,42h
	count 	equ	($-array)/type array
.code
.startup
	mov 	cx,count
	mov	bx,offset array
	call	checksuma
	mov	result,al	
.exit	0
;******************************************************
;子程序名:checksuma
;功能：计算字节数组校验和
;入口参数：ds:bx为数组起始地址，cx为数组元素个数
;返回值：al为校验和
;说明：除ax/bx/cx外不影响其他寄存器
;******************************************************
checksuma	proc
	xor	al,al
suma:	add	al,[bx]
	inc	bx
	loop	suma
	ret
checksuma	endp
end