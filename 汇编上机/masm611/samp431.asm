;samp431.asm,P168,递归调用实现阶乘。
.model small
.stack
.data
	n	dw	3
	result	dw	?
.code
.startup
	mov	bx,n
	push	bx
	call	fact
	pop	result
.exit	0
;******************************************************
;子程序名:fact
;功能：阶乘计算：n！
;入口参数：n压入堆栈
;返回值：阶乘压入堆栈，主程序中弹出。
;说明：
;******************************************************
fact	proc
	push	ax
	push	bp
	mov	bp,sp
	mov	ax,[bp+6]
	cmp	ax,0
	jne	fact1
	inc	ax
	jmp	fact2
fact1:	dec	ax
	push	ax
	call	fact
	pop	ax
	mul	word ptr [bp+6]
fact2:	mov	[bp+6],ax
	pop	bp
	pop	ax
	ret
fact	endp
end