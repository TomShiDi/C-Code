; p190.asm,字节表中数据移入字表对应元素高字节。
;比例因子变址方式，数据段紧跟代码段。
;在004ccd21H(mov ax,4c00H/int 21H)后
	.model	small
	.386
	.stack	200H
	.data
byte_ta	db	20 dup(17)
word_ta	dw	20 dup(202h)
	.code
start:	mov	ax,@data
	mov	ds,ax			;固定模式
;
	xor	esi,esi
next:	mov	ax,word_ta[esi*2]
	mov	ah,byte_ta[esi]
	mov	word_ta[esi*2],ax
	inc	esi
	cmp	esi,20
	jl	next
;
	mov	ax,4c00H
	int	21H
	end	start