;������Ԫ��У��ʹ���result��Ԫ��P164
.MODEL	SMALL
    	.STACK
    	.DATA
array	db	56h,23h,37h,78h,0ffh,0,12h,99h,64h,0b0h
count	equ	($-array)/type array  
result	db	?  
	.CODE
    	.STARTUP
	mov	bx,offset array
	mov	cx,count
	call	chksum
	mov	result,al
	.EXIT 0
;��������Ԫ��У���
;�˿ڲ�����ds:bx=�����׵�ַ��ƫ�Ƶ�ַ��cx=Ԫ�ظ���
;���ڲ�����al=У���
;˵������ax��bx��cx�ⲻӰ�������Ĵ���
chksum	proc
	push	cx
	push	bx
	xor	al,al
suma:	add	al,[bx]
	inc	bx
	loop	suma
	pop	bx
	pop	cx
	ret
chksum	endp
END
