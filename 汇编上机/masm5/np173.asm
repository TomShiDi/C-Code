;p 173.asm,Ã°ÅÝ·¨
;*******************************************
data	segment
addr	dw	8,5,16,84,32,22,15,39,50,2
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
	mov	cx,9
loop1:	mov	di,cx
	mov	bx,0
loop2:	mov	ax,addr[bx]
	cmp	ax,addr[bx+2]
	jge	continu
	xchg	ax,addr[bx+2]
	mov	addr[bx],ax
continu:add	bx,2
	loop	loop2
	mov	cx,di
	loop	loop1
	ret
main	endp
program	ends
	end start