;samp436.asm,P178,����100����Ԫ������array��������ǰ���ɷǸ���֮����result��Ԫ��
.model small
.stack
.data
	array	sword	50 dup(1),50 dup(-2)
	result	sword	?
.code
.startup
	mov	cx,100
	xor	ax,ax
	mov	bx,offset array
.repeat
	.if	sword ptr [bx]>=0
		add	ax,[bx]
	.else	
		.break
	.endif
	inc	bx
	inc	bx
.untilcxz
	mov	result,ax
.exit	0
	end