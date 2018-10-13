;p204.asm数组元素相加送结果单元子程序。
;通过地址表传送参数，表首址在bx中。
;以.com形式写程序。
;在debug中看结果。
;
;*************************************
code	segment
	assume	cs:code,ds:code,ss:code
	org	100h
;======================================
;
main	proc	near
start:	mov	ax,code
	mov	ds,ax
	mov	table,offset ary
	mov	table+2,offset count
	mov	table+4,offset sum
	mov	bx,offset table
	call	proadd
	mov	ax,4c00h
	int 	21h
main	endp
;=======================================
;
;--------------------------------------	
;过程名：proadd
;功能：数组元素相加
;入口参数：通过地址表转送。表首址在bx中。
;         表中依次为数组起始地址、元素个数、结果单元
;返回值：累加和送结果单元。
;
proadd	proc	near
	push	ax
	push	cx
	push	si
	push	di
	mov	si,[bx]		;ary首址指针
	mov	di,[bx+2]	
	mov	cx,[di]		;ary元素个数
	mov	di,[bx+4]	;结果单元指针
	xor	ax,ax
next:	add	ax,[si]
	add	si,2	
	loop	next
	mov	[di],ax
	pop	di
	pop	si
	pop	cx
	pop	ax
	ret
proadd	endp
;---------------------------------------
;
;=========================================
;
ary	dw	100 dup(?)	;ary从140h开始。
count	dw	100		;地址为208h
sum	dw	?		;地址为20ah
table	dw	3  dup(?)	;依次存140h,208h,20ah。
;
;=========================================
;
code	ends
;*****************************************
	end	start







