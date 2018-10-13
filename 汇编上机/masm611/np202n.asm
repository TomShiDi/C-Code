;p202.asm数组元素相加送结果单元子程序。
;在debug中用“e”命令修改内存单元内容。
;
;*************************************
data	segment
ary	dw	100 dup(?)
count	dw	100
sum	dw	?
data	ends
;*************************************
;
;*************************************
code	segment
	assume	cs:code,ds:data
;======================================
;
main	proc	far
start:	push	ds
	sub	ax,ax
	push	ax
	mov	ax,data
	mov	ds,ax
	call	near  ptr  proadd
	ret
main	endp
;=======================================
;
;--------------------------------------	
;功能：完成数组元素相加
;入口参数：数组名为ary，元素个数在count
;返回值：累加和存入sum单元
proadd	proc	near
	push	ax
	push	cx
	push	si
	lea	si,ary
	mov	cx,count
	xor	ax,ax
next:	add	ax,[si]
	add	si,2	
	loop	next
	mov	sum,ax
	add	ax,bx
	add	ax,48H
	add	ax,[48H]
	pop	si
	pop	cx
	pop	ax
	ret
proadd	endp
;---------------------------------------
;
code	ends
;*****************************************
	end	start







