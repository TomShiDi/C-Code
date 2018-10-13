;samp429.asm,P164,调用子程序求数组校验和送result单元,变量直接传送参数。
.model small
.stack
.data
	result	db	0
	array	db	56h,23h,37h,78h,0ffh,0,12h,99h,64h,0b0h
		db	78h,80h,23h,1,4,0fh,2ah,46h,32h,42h
	count 	equ	($-array)/type array
.code
.startup
	call	checksumb
.exit	0
;******************************************************
;子程序名:checksumb
;功能：计算字节数组校验和
;入口参数：array为数组名，count为元素个数，result为校验和存放单元
;返回值：无
;说明：除ax/bx/cx外不影响其他寄存器
;******************************************************
checksumb	proc
	push	ax
	push	bx
	push	cx
	xor	al,al
	mov	bx,offset array
	mov	cx,count
sumb:	add	al,[bx]
	inc	bx
	loop	sumb
	mov	result,al
	pop	cx
	pop	bx
	pop	ax
	ret
checksumb	endp
end