;p200.asm,����ʮ��������ʮ��������ʽ��ʾ��
;
;****************************************
decihex	segment
	assume	cs:decihex
main	proc	far
start:	mov 	cx,2
repeat:	call	decibin
	call 	crlf
	call 	binihex
	call 	crlf
	loop	repeat
	mov	ax,4c00h
	int 	21h
main	endp

;------------------------------------------
;��������decibin
;���ܣ�ʮ������ת��Ϊ�������ӳ���;
;��ڲ���������ʮ����������ʮ����������
;����ֵ���Զ�������ʽ����BX�С�
;�㷨��123=((1*10)+2)*10+3
;
decibin	proc	near
	push	cx
	mov	bx,0
newchar:mov	ah,1
	int	21h
	sub	al,30h
	jl	exit
	cmp	al,9
	jg	exit
	cbw
	xchg	ax,bx
	mov	cx,10	;����ʮ���Ƶ�������ת����
	mul	cx
	xchg	ax,bx
	add	bx,ax
	jmp	newchar
exit:	pop	cx	;��exit��������ʱ����
	ret
decibin endp

;============================================
;��������binihex
;���ܣ�����������ʮ��������ʽ��ʾ����Ļ�ϡ�
;��ڲ���������������bx�С�
;����ֵ���ޡ�
;�㷨����λ������ת��Ϊascii����ʾ
;
binihex	proc	near
	push	cx
	mov	ch,4
rotate:	mov	cl,4
	rol	bx,cl
	mov	al,bl
	and 	al,0fh
	add	al,30h
	cmp	al,3ah
	jl	printit
	add	al,7
printit:mov	dl,al
	mov	ah,2
	int	21h
	dec	ch
	jnz	rotate
	pop	cx
	ret
binihex	endp

;-------------------------------------------
;��������crlf
;���ܣ���ʾ�س������С�
;��ڲ������ޡ�
;����ֵ���ޡ�
;
crlf	proc	near
	push	cx
	mov	dl,0dh
	mov	ah,2
	int	21h
	mov	dl,0ah
	mov	ah,2
	int 	21h
	pop	cx
	ret
crlf	endp
;-------------------------------------------

decihex ends
;*********************************************
	end	main



	































