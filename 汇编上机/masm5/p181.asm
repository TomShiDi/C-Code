;p181.asm,增序正数数组中插入一个正数。
;*******************************************
data	segment
x	dw	?
array_h	dw	3,5,15,23,37,49,52,65,78,99
array_e dw	105
n	dw 	32
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
	mov	ax,n
	mov 	array_h-2,0FFFFH
	mov	si,0
compare:cmp	array_e[si],ax
	jle	insert
	mov 	array_e[si+2],bx
	sub	si,2
	jmp	short compare
insert:	mov array_e[si+2],ax
	ret
main	endp
program	ends
	end start