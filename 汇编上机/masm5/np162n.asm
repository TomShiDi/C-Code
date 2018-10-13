;p162.asm

program	segment
main	proc	  far
	assume 	cs:program
start:	push	ds
	sub	ax,ax
	push	ax		;和ret配合使用
	mov	ch,4
;	mov	bx,ds		;bx中得到随机值
rotate:	mov	cl,4
	rol	bx,cl
	mov	al,bl
	and	al,0FH
	add	al,30H
	cmp	al,3AH
	jl	printit		;0~9
	add	al,7		;A~F
printit:mov	dl,al
	mov	ah,2
	int	21H		;显示dl中字符
	dec	ch
	jnz	rotate		;构成循环
	add	ax,bx
	add	ax,3048H
	add	ax,[3048H]
	ret
main	endp
program	ends
	end

			

