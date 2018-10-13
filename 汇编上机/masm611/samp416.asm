;samp416.asm,P151,求两数平均值
.model small
.stack
.data
	x	db	8ch
	y	db	64h
	z	db	?
.code
.startup
	mov	al,x
	add	al,y
	mov	ah,00
	adc	ah,0
	mov	bl,2
	div	bl
	mov	z,al
.exit	0
end