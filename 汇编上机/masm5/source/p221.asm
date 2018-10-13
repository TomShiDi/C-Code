;p221.asm数组元素相加送结果单元子程序。
;通过堆栈传送参数。
;通过debug分析堆栈变化。
;*************************************
parmseg segment
ary	dw	50 dup(1,2)
count	dw	100
sum	dw	?
parmseg	ends
;*************************************
;
;*************************************
stack	segment
	dw  	100  dup(?)
tos	label	word		;栈顶，向上发展。
stack	ends
;**************************************
;
;**************************************
code1	segment
	assume	cs:code1,ds:parmseg,ss:stack
	org	100h
;
main	proc	far
start:	mov	ax,stack
	mov	ss,ax
	mov	sp,offset  tos	;设置堆栈段
;
	push	ds
	sub	ax,ax
	push	ax
;
	mov	ax,parmseg
	mov	ds,ax		;上五行固定模式
;
	mov	bx,offset ary	;压数组首址
	push	bx
	mov	bx,offset count	;压元素个数地址
	push	bx
	mov	bx,offset sum	;压结果单元地址
	push	bx
	call	far ptr proadd
	ret
main	endp
;
code1	ends
;**************************************
;
;**************************************
code2	segment
	assume	cs:code2
;--------------------------------------
;过程名：proadd
;功能：数组元素相加
;入口参数：栈顶三字：结果单元地址、元素个数地址，数组首址。
;返回值：累加和送结果单元。
;算法：由于栈顶在转子时以改变，要以bp寻址。
;	
proadd	proc	far
	push	bp
	mov	bp,sp
	push	ax
	push	cx
	push	si
	push	di
	mov	si,[bp+0ah]	;见图6.2
	mov	di,[bp+8]
	mov	cx,[di]
	mov	di,[bp+6]
	xor	ax,ax
next:	add	ax,[si]
	add	si,2	
	loop	next
	mov	[di],ax
	pop	di
	pop	si
	pop	cx
	pop	ax
	pop	bp
	ret	6
proadd	endp
;---------------------------------------
;
code2	ends
;*****************************************
	end	start







