;samp434.asm,P173,计算有符号数的平均值的子程序。
.model small
.stack
.data
	array	dw	1234,-1234,0,1,-1,32767,-32768,5678,-5678,9000	
	count	=	($-array)/2
	wmed	dw	?
.code
.startup
	mov	ax,count
	push	ax
	mov	ax,offset array
	push	ax
	call	mean
	add	sp,4
	mov	wmed,ax
.exit	0
;******************************************************
;子程序名:mean
;功能：计算有符号数的平均值的子程序
;入口参数：符号数个数及数组首地址压栈传送
;返回值：求得平均值在ax
;说明：字范围数据
;******************************************************
mean	proc
	push	bp
	mov	bp,sp
	push	bx
	push	cx
	push	dx
	push	si
	push	di
	mov	bx,[bp+4]
	mov	cx,[bp+6]
	xor	si,si
	mov	di,si
mean1:	mov	ax,[bx]
	cwd
	add	si,ax
	adc	di,dx
	inc	bx
	inc	bx
	loop	mean1		;求得累加和在di:si
	mov	ax,si
	mov	dx,di
	mov	cx,[bp+6]
	idiv	cx		;平均值在ax中
	pop	di
	pop	si
	pop	dx
	pop	cx
	pop	bx
	pop	bp
	ret
mean	endp
	
end