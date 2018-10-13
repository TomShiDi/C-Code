;samp436.asm,P178,计算100个字元素数组array的连续的前若干非负数之和送result单元。
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