	.model	small
	.code
	public	_dif
_dif	proc	near
	push	bp
	mov	bp,sp
	sub	dx,dx
	mov	ax,[bp+4]
	sub	ax,[bp+6]
	sbb	dx,0
	pop	bp
	ret
_dif	endp
	end