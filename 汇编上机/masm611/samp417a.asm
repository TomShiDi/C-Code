;samp417a.asm,P151,64位数据算术左移n位,教材上算法很弱智.
.model small
.stack
n	equ	12
.data
	qvar dq	1234567887654321h
;结果：3456788765432100h
.code
.startup
	mov	cx,n
looop:	clc
	mov	dh,4
	lea	si,qvar
next:	mov	ax,[si]
	rcl	ax,1
	mov	[si],ax
	inc	si
	inc	si
	dec	dh
	jnz	next
	loop	looop
.exit	0
end