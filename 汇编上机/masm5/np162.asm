;p162.asm

program	segment
main	proc	  far
	assume 	cs:program
start:	push	ds
	sub	ax,ax
	push	ax		;��ret���ʹ��
	mov	ch,4
;	mov	bx,ds		;bx�еõ����ֵ
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
	int	21H		;��ʾdl���ַ�
	dec	ch
	jnz	rotate		;����ѭ��
	ret
main	endp
program	ends
	end

			

