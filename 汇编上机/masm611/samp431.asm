;samp431.asm,P168,�ݹ����ʵ�ֽ׳ˡ�
.model small
.stack
.data
	n	dw	3
	result	dw	?
.code
.startup
	mov	bx,n
	push	bx
	call	fact
	pop	result
.exit	0
;******************************************************
;�ӳ�����:fact
;���ܣ��׳˼��㣺n��
;��ڲ�����nѹ���ջ
;����ֵ���׳�ѹ���ջ���������е�����
;˵����
;******************************************************
fact	proc
	push	ax
	push	bp
	mov	bp,sp
	mov	ax,[bp+6]
	cmp	ax,0
	jne	fact1
	inc	ax
	jmp	fact2
fact1:	dec	ax
	push	ax
	call	fact
	pop	ax
	mul	word ptr [bp+6]
fact2:	mov	[bp+6],ax
	pop	bp
	pop	ax
	ret
fact	endp
end