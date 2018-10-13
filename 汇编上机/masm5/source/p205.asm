;p205.asm,字节表中数据移入字表对应元素高字节。
;一般寻址方式，可在debug中看到其变化。
;运行时俩表可可作随机数据。
	.model	small
	.386
	.stack	200H
	
	.data
	align	16
byte_ta	db	20 dup(?)
word_ta	dw	20 dup(?)
	.code
start:	mov	ax,@data
	mov	ds,ax			;固定模式
;
	xor	si,si
	xor	di,di
next:	mov	ax,word_ta[di]
	mov	ah,byte_ta[si]
	mov	word_ta[di],ax
	inc	si
	add	di,2
	cmp	si,20
	jl	next
;
	mov	ax,4c00H
	int	21H
	end	start