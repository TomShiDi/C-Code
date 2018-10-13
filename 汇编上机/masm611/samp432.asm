;samp432.asm,P169,键盘输入有符号十进制数的子程序。
.model small
.stack
.data
	count	=	10
	array	dw	count dup(0)
.code
.startup
	mov	cx,count
	mov	bx,offset array
again:	call	read
	mov	[bx],ax
	inc	bx
	inc	bx
	call	dpcrlf
	loop	again

.exit	0
;******************************************************
;子程序名:read
;功能：键盘输入有符号十进制数的子程序
;入口参数：键入数字
;返回值：补码形式的数字存于ax。
;说明：字范围数据
;******************************************************
read	proc
	push	bx
	push	cx
	push	dx
	xor	bx,bx
	xor	cx,cx
	mov	ah,1
	int	21h
	cmp	al,'+'
	jz	read1
	cmp	al,'-'
	jnz	read2
	mov	cx,-1
read1:	mov	ah,1
	int	21h
read2:	cmp	al,'0'
	jb	read3
	cmp	al,'9'
	ja	read3
	sub	al,30h
	shl	bx,1
	mov	dx,bx
	shl	bx,1
	shl	bx,1
	add	bx,dx		;实现乘10
	mov	dx,bx
	mov	ah,0
	add	bx,ax
	jmp	read1
read3:	cmp	cx,0
	jz	read4
	neg	bx
read4:	mov	ax,bx
	pop	dx
	pop	cx
	pop	bx
	ret
read	endp
;******************************************************
;子程序名:dpcrlf
;功能：光标回车换行
;入口参数： 
;返回值： 
;说明： 
;******************************************************
dpcrlf	proc
	push	ax
	push	dx
	mov	ah,2
	mov	dl,0dh
	int	21h
	mov	ah,2
	mov	dl,0ah
	int	21h
	pop	dx
	pop	ax
	ret
dpcrlf	endp
end