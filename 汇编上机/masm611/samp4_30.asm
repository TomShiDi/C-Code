;������Ԫ��У��ʹ���result��Ԫ��P164
.MODEL	SMALL
    	.STACK
    	.DATA
array	db	56h,23h,37h,78h,0ffh,0,12h,99h,64h,0b0h
count	equ	($-array)/type array  
result	db	?  
	.CODE
    	.STARTUP
	mov	ax,offset array
	push	ax
	mov	ax,count
	push	ax
	call	chksum
	mov	result,al
	.EXIT 0
;��������Ԫ��У���
;�˿ڲ����������׵�ַ,Ԫ�ظ���ͨ����ջ����
;���ڲ�����al=У���
chksum	proc
	push	bp
	mov	bp,sp			;
	push	bx
	push	cx
	mov	bx,[bp+6]
	mov	cx,[bp+4]
	xor	al,al
suma:	add	al,[bx]
	inc	bx
	loop	suma
	pop	cx
	pop	bx
	pop	bp
	ret	4
chksum	endp
END
