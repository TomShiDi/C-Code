;samp433.asm,P171,����ʾ������з���ʮ���������ӳ���
.model small
.stack
.data
	array	dw	1234,-1234,0,1,-1,32767,-32768,5678,-5678,9000	
	count	=	($-array)/2
	wtemp	dw	?
.code
.startup
	mov	cx,count
	mov	bx,offset array
again:	mov	ax,[bx]
	mov	wtemp,ax
	call	write
	inc	bx
	inc	bx
	call	dpcrlf
	loop	again

.exit	0
;******************************************************
;�ӳ�����:write
;���ܣ���ʾ�з���ʮ���������ӳ���
;��ڲ������������wtemp
;����ֵ��
;˵�����ַ�Χ����
;******************************************************
write	proc
	push	bx
	push	ax
	push	dx
	mov	ax,wtemp
	test	ax,ax
	jnz	write1
	mov	dl,'0'
	mov	ah,2
	int	21h		;��ʾ0
	jmp	write5
write1:	jns	write2
	mov	bx,ax
	mov	dl,'-'
	mov	ah,2
	int	21h		;��ʾ����
	mov	ax,bx
	neg	ax
write2:	mov	bx,10
	push	bx
write3:	cmp	ax,0
	jz	write4
	sub	dx,dx
	div	bx
	add	dl,30h
	push	dx
	jmp	write3
write4:	pop	dx
	cmp	dl,10
	je	write5		
	mov	ah,2
	int	21h		;������ʾ��λ��
	jmp	write4
write5:	pop	dx
	pop	ax
	pop	bx
	ret
write	endp
;******************************************************
;�ӳ�����:dpcrlf
;���ܣ����س�����
;��ڲ����� 
;����ֵ�� 
;˵���� 
;******************************************************
dpcrlf	proc
	push	ax
	push	dx
	mov	ah,2
	mov	dl,0dh
	int	21h
	mov	ah,2
	mov	dl,0ah
	int	21h
	pop	dx
	pop	ax
	ret
dpcrlf	endp
end