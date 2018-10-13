;p360
;
;***********************************************
cl_scre	proc near
	push	ax
	push	bx
	push	cx
	push	dx
;
	mov	ah,6
	mov 	al,0
	mov	bh,7
	mov	ch,0
	mov	cl,0
	mov	dh,24
	mov	dl,79
	int	10h
;
	mov	dx,0
	mov	ah,2
	int 	10h
;
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	ret
cl_scre	endp
;------------------------------------------------








