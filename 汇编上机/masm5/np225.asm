;p225.asm,����ʮ����������ʮ������ʽ��ʾ��
;
;���峣��
display	equ	2h
key_in	equ	1h
doscall	equ	21h
;
;
;****************************************
hexidec	segment
	assume	cs:hexidec
;
start:	mov 	cx,5
repeat:	push	cx	
	call	hexibin
	call 	crlf
	call 	binidec
	call 	crlf
	pop	cx
	loop	repeat
	mov	ax,4c00h
	int 	doscall
;*******************************************
;
;------------------------------------------
;��������hexibin
;���ܣ�ʮ��������ת��Ϊ�������ӳ���
;��ڲ��������������ĸ���ʮ��������
;����ֵ�������BX�С�
;�㷨��0~9��ȥ30h��A~F�ټ�ȥ7��a~f�ټ�ȥ20h��
;
hexibin	proc	near
	mov	bx,0
newchar:mov	ah,key_in
	int	doscall
	sub	al,30h
	jl	exit	;С��0����ʮ����������
	cmp	al,10
	jl	add_to	;�Ѿ�ת��Ϊ������,0��9
	sub	al,7
	cmp	al,0ah
	jl	exit	;'9'<al<'A',��ʮ����������
	cmp	al,16
	jl	add_to	;�Ѿ�ת��Ϊ������,A��F
	sub	al,20h
	cmp	al,0ah
	jl	exit	;'F'<al<'a',��ʮ����������
	cmp	al,16
	jge	exit	;al>'f'ת�ߣ�����a��f
add_to:	mov	cl,4	;0��9,��A��F,��a��f
	shl	bx,cl	;����������ƴ��16λ����������
	mov	ah,0
	add	bx,ax
	jmp	newchar
;
exit:	ret
hexibin endp
;-----------------------------------------------
;
;============================================
;��������binidec
;���ܣ�����������ʮ������ʽ��ʾ����Ļ�ϡ�
;��ڲ���������������bx�С�
;����ֵ���ޡ�����Ļ����ʾ�����
;�㷨�����������γ���ʮ����Ȩֵ�õ�������Ļ����ʾ��
;
;
binidec	proc	near
	mov	cx,10000
	call	dec_div
	mov	cx,1000
	call	dec_div
	mov	cx,100
	call	dec_div
	mov	cx,10
	call	dec_div
	mov	cx,1
	call	dec_div
	ret
;
;
;----------------------------------------
;��������dec_div
;���ܣ�ͨ������10���ݴη��õ�һλ�̲���ʾ����Ļ�ϡ�
;��ڲ�����ԭ��������(����)��bx�У�10���ݴη���cx�С�
;����ֵ��������Ļ��ʾ��������bx�С�
;�㷨�����γ���10000,1000,100,10,1�õ��̲���ʾ��
;
dec_div	proc	near
	mov	ax,bx
	sub	dx,dx	;�õ�dx:ax����cx
	div	cx
	mov	bx,dx
;
	mov	dl,al
	add	dl,30h
	mov	ah,display
	int 	doscall
	ret
dec_div	endp
;------------------------------------------------
;
binidec	endp
;==================================================
;
;
;-------------------------------------------
;��������crlf
;���ܣ���ʾ�س��������ӳ���
;��ڲ������ޡ�
;����ֵ���ޡ�
;
;
crlf	proc	near
;
	mov	dl,0dh
	mov	ah,display
	int	doscall
;
	mov	dl,0ah
	mov	ah,display
	int 	doscall
;
	ret
crlf	endp
;-------------------------------------------

hexidec ends
;*********************************************
	end	start


	































