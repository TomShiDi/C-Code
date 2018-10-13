;p185.asm,键入首字符为空格的字符串。遇第二空格结束。
;*******************************************
data	segment
buffer	db	80 dup (?)
flag	db	?
data	ends
;*******************************************
program	segment
main	proc	far
	assume	cs:program,ds:data
start:	push 	ds
	sub	ax,ax
	push	ax
	mov	ax,data
	mov	ds,ax
	lea	bx,buffer
	mov	flag
next:	mov	ah,01
	int	21H
	test	flag,01H
	jnz	follow
	cmp	al,20H
	jnz	exit
	mov	flag,1
	jmp	next
follow:	cmp	al,20H
	jz	exit
	mov	[bx],al	
	inc	bx
	jmp	next
exit:	ret
main	endp
program	ends
	end start