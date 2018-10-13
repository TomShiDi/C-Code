;samp435.asm,P176,条件控制伪指令实现有根判断（对比例4.20）。
.model small
.stack
.data
	_a	sbyte	4
	_b	sbyte	6
	_c	sbyte	8
	tag	byte	?
.code
.startup
	mov	al,_b
	imul	al
	mov	bx,ax
	mov	al,_a
	imul	_c
	shl	ax,1
	shl	ax,1
.if	sword ptr bx>=ax
	mov	tag,1
.else	
	mov	tag,0
.endif
end