;samp434.asm,P173,�����з�������ƽ��ֵ���ӳ���
.model small
.stack
.data
	array	dw	1234,-1234,0,1,-1,32767,-32768,5678,-5678,9000	
	count	=	($-array)/2
	wmed	dw	?
.code
.startup
	mov	ax,count
	push	ax
	mov	ax,offset array
	push	ax
	call	mean
	add	sp,4
	mov	wmed,ax
.exit	0
;******************************************************
;�ӳ�����:mean
;���ܣ������з�������ƽ��ֵ���ӳ���
;��ڲ����������������������׵�ַѹջ����
;����ֵ�����ƽ��ֵ��ax
;˵�����ַ�Χ����
;******************************************************
mean	proc
	push	bp
	mov	bp,sp
	push	bx
	push	cx
	push	dx
	push	si
	push	di
	mov	bx,[bp+4]
	mov	cx,[bp+6]
	xor	si,si
	mov	di,si
mean1:	mov	ax,[bx]
	cwd
	add	si,ax
	adc	di,dx
	inc	bx
	inc	bx
	loop	mean1		;����ۼӺ���di:si
	mov	ax,si
	mov	dx,di
	mov	cx,[bp+6]
	idiv	cx		;ƽ��ֵ��ax��
	pop	di
	pop	si
	pop	dx
	pop	cx
	pop	bx
	pop	bp
	ret
mean	endp
	
end