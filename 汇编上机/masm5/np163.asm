; p163.asm,�����Y��1�ĸ�����count
;*********************************
data	segment
addr	dw	number
number	dw	?
count	dw	?
data	ends
;*********************************
code	segment
	assume	cs:code,ds:data
main	proc	far
start:	push	ds
	sub	ax,ax
	push	ax
	mov	bx,data
	mov	ds,bx
	mov	bx,addr
	mov	dx,[bx]
repeat:	cmp	dx,0
	jz	exit
	shl	dx,1
	adc	al,0
	jmp	repeat
exit:	mov	count,ax
	ret	
main	endp
code	ends
	end 	start