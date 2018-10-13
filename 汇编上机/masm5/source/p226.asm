;p226.asm,数组元素求和。
;使用了结构体方法通过堆栈传送参数。
;子程序的入口地址在不同段。
;g1d(转子之前），看堆栈内容。此时已压入5字。
;再在子程序中设置断点如gb80:19（其中b80为段地址）；
;此时已压入12个字，见p227图。
;且能访问结构体中元素，ax中为累加和。
;
;**********************************************
parmseg	segment
ary	dw	100	dup(1)
count	dw	100
sum	dw 	?
parmseg	ends
;**********************************************
;
;**********************************************
stack	segment
	dw	128	dup(?)
tos	label	word
stack	ends
;**********************************************
;
;**********************************************
code1	segment
main	proc	far
	assume	cs:code1,ds:parmseg,ss:stack
start:	mov	ax,stack
	mov	ss,ax
	mov	sp,offset tos
;
	push	ds
	sub	ax,ax
	push	ax
;
	mov	ax,parmseg
	mov	ds,ax
;
	mov	bx,offset ary
	push	bx
	mov	bx,offset count
	push	bx
	mov	bx,offset sum
	push 	bx
;
	call	far ptr proadd
;
	ret
main	endp
;
code1	ends
;**********************************************
;
;**********************************************
code2	segment
	assume	cs:code2
;
stack_strc	struc
	save_bp	dw	?
	s_csip	dw	2	dup(?)
	p3_addr	dw	?
	p2_addr	dw	?
	p1_addr	dw	?
stack_strc	ends
;
;-----------------------------------------------
;子程序名：proadd。
;功能：数组元素求和。
;入口参数：数组首址、数组长度地址、结果单元地址在栈顶三单元。
;返回值：结果在结果单元。
;算法：使用结构体形式。
;
proadd	proc	far
	push	bp
	mov	bp,sp
	push	ax
	push	cx
	push	si
	push	di
	mov	si,[bp].p1_addr
	mov	di,[bp].p2_addr
	mov	cx,[di]
	mov	di,[bp].p3_addr
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
;--------------------------------------------------
;
code2	ends
;***************************************************
	end 	start