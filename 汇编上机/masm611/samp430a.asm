;samp430.asm,P165,调用子程序求数组校验和送result单元,堆栈传送参数,强制段间调用。
.model small
.stack
.data
	result	db	0
	array	db	56h,23h,37h,78h,0ffh,0,12h,99h,64h,0b0h
		db	78h,80h,23h,1,4,0fh,2ah,46h,32h,42h
	count 	equ	($-array)/type array
.code
.startup
	mov	ax,offset array
	push	ax
	mov	ax,count
	push	ax
	call	far ptr checksumc
	add	sp,4
	mov	result,al
.exit	0
;******************************************************
;子程序名:checksumb
;功能：计算字节数组校验和
;入口参数：array为数组名，count为元素个数压栈传送参数
;返回值：al为校验和
;说明：除ax/bx/cx外不影响其他寄存器
;******************************************************
checksumc	proc
	
	push	bp
	mov	bp,sp
	push	ax
	push	bx
	push	cx
	mov	bx,[bp+8]
	mov	cx,[bp+6]
	xor	al,al
sumc:	add	al,[bx]
	inc	bx
	loop	sumc
	pop	cx
	pop	bx
	pop	ax
	pop	bp
	ret
checksumc	endp
end