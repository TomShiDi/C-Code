;p183.asm,逻辑尺计算向量运算
;*******************************************
data	segment
x	dw	1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31
y	dw	2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32
z	dw	16 dup (?)
logic_r	dw	00DCH
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
	mov	bx,0
	mov 	cx,10
	mov	dx,logic_r
next:	mov	ax,x[bx]
	shr	dx,1
	jc	subtra
	add	ax,y[bx]
	jmp	short result
subtra:	sub	ax,y[bx]
result:	mov	z[bx],ax
	add	bx,2
	loop	next
	ret
main	endp
program	ends
	end start