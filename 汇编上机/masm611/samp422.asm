;samp422.asm,P157,����1~100֮�ʹ�sum�ֵ�Ԫ
.model small
.stack
.data
	sum	dw	0
.code
.startup
	xor	ax,ax
	mov	cx,100
again:	add	ax,cx
	loop	again
	mov	sum,ax
done:	.exit	0
end