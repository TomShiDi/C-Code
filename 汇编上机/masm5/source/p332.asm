;p332.asm,����Ϊ0������жϣ�����0���������
;
;
;****************************************************
	.model	small
;
;---------------------------------------------------
;
	.stack
;
;---------------------------------------------------
;
	.code
;
start:	lea	dx,zdiv
	mov	ax,seg zdiv
	mov	ds,ax
	mov	al,0
	mov	ah,25h
	int	21h	;�����ж�����
;
 	mov	ax,@code
	mov	ds,ax
	mov	dx,offset ok_msg
	mov	ah,9
	int	21h	;�����ʾ�ַ���ok_msg
;
	mov	ax,1
	mov	dl,0
	div	dl	;�ж�Դ
;
	mov	ah,2
	mov	dl,'#'
	int	21h
;
	mov	ah,31h	;������פ�����ܵ���
	mov	al,0	;פ������С��dx��
	mov	dx,((proglen+15)/16)+16
	int	21h	;��֤��СΪ16��������
;
	mov	ax,4c00h
	int 	21h
;
;----------------------------------------------------
;��������zdiv
;���ܣ�����Ϊ0�жϴ����ӳ���
;
;
zdiv	proc	far
	push	ax
	push	bx
	push	cx
	push	dx
	push	si
	push	di
	push 	bp
	push	ds
	push 	es
	sti
;
prtwarn:mov	ax,@code
	mov	ds,ax
;
	mov	dx,offset warnmsg
	mov	ah,9
	int	21h	;���������Ϣ
;
input:	mov	ah,1
	int	21h
	cmp	al,'c'
	je	continu
;
	cmp	al,'q'
	je	exit
;
	mov	dx,offset beep
	mov	ah,9
	int 	21h	;���beep��
	jmp	prtwarn
;
exit:	mov	ax,4cffh
	int 	21h
;
continu:mov	dx,offset crlf
	mov	ah,9
	int	21h
	cli
;
	pop	es
	pop	ds
	pop	bp
	pop	di
	pop	si
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	iret
zdiv	endp
;
;-------------------------------------------------
;
;��������
;
ok_msg	db	0dh,0ah,'Zero-division Handler installed!'
	db	0dh,0ah,'$'
warnmsg	db	0dh,0ah,'Zero-division detected,',07h
	db	'Continue or Quit(c/q)?$'
beep	db	10 dup(07h),'$'
crlf	db	0dh,0ah,'$'
proglen	equ	$-start
;
;--------------------------------------------------
;******************************************************
	end	start