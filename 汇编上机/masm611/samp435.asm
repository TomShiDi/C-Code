;samp435.asm,P176,��������αָ��ʵ���и��жϣ��Ա���4.20����
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