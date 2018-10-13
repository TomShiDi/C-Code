;p219.asm,使用增强型过程定义，在masm611下汇编、连接。
;可以看到在子程序中自动生成了11条指令。
;另外自动改变ret为retf 0006。
;将para,parb,parc自动变为[bp+0a],[bp+08],[bp+06]
;
;
;
	.model	medium
	.data
ary	dw	100	dup(1)
count	dw	100
sum	dw	?
;
;
	.stack	200h
;
;*****************************************
	.code
main	proc
start:	mov	ax,@data
	mov	ds,ax
;
	mov	bx,offset ary
	push	bx
	mov	bx,offset count
	push	bx
	mov	bx,offset sum
	push	bx
;
	call 	proadd
;
	mov	ax,4c00h
	int	21h
main	endp	
;***************************************
;
;-------------------------------------------------
;子程序名：proadd。
;功能：数组元素求和。
;入口参数：数组首址、数组长度地址、结果单元地址在栈顶三单元。
;返回值：结果在结果单元。
;
proadd	proc	pascal uses ax cx si di,para:word,parc:word,pars:word
	mov	si,para
	mov	di,parc
	mov	cx,[di]
	mov	di,pars
	xor	ax,ax
next:	add	ax,[si]
	add	si,2
	loop	next
	mov	[di],ax
	ret
proadd	endp
;------------------------------------------------
;
	end	start