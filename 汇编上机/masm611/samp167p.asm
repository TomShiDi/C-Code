;samp427.asm,P167,通过嵌套子程序实现无符号字节数冒泡法升序排序。
.model small
.stack
.data
	array	db	56h,23h,37h,78h,0ffh,0,12h,99h,64h,0b0h
		db	78h,80h,23h,1,4,0fh,2ah,46h,32h,42h
	count 	equ	($-array)/type array
.code
.startup
	mov 	cx,count
	dec	cx
outlp:	mov	dx,cx
	mov	bx,offset array
inlp:	mov	al,[bx]
	cmp	al,[bx+1]
	jna	next
	xchg	al,[bx+1]
	mov	[bx],al
next:	inc	bx
	dec	dx
	jnz	inlp
	loop	outlp
	mov	bx,offset array
	mov	cx,count
displp:	mov	al,[bx]
	call	aldisp	
	mov	dl,','
	mov	ah,2
	int	21h
	inc	bx
	loop	displp
.exit	0
aldisp	proc
	push	ax
	push	cx
	push	dx
	push	ax
	mov	cl,4
	shr 	al,cl
	call	htoasc
	pop	ax
	call	htoasc
	pop	dx
	pop	cx
	pop	ax
	ret
aldisp	endp
;*****************************************************************
htoasc	proc
	push	ax
	push	bx
	push	dx
	mov	bx,offset ascii
	and	al,0fh
	xlat	cs:ascii
	mov	dl,al
	mov	ah,2
	int	21H
	pop 	dx
	pop	bx
	pop	ax
	ret
ascii	db	30h,31h,32h,33h,34h,35h,36h,37h,38h,39h,41h,42h,43h,44h,45h,46h
htoasc	endp
end