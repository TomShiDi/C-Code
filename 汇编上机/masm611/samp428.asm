;samp428.asm,P164,�����ӳ���������У�����result��Ԫ��
.model small
.stack
.data
	result	db	0
	array	db	56h,23h,37h,78h,0ffh,0,12h,99h,64h,0b0h
		db	78h,80h,23h,1,4,0fh,2ah,46h,32h,42h
	count 	equ	($-array)/type array
.code
.startup
	mov 	cx,count
	mov	bx,offset array
	call	checksuma
	mov	result,al	
.exit	0
;******************************************************
;�ӳ�����:checksuma
;���ܣ������ֽ�����У���
;��ڲ�����ds:bxΪ������ʼ��ַ��cxΪ����Ԫ�ظ���
;����ֵ��alΪУ���
;˵������ax/bx/cx�ⲻӰ�������Ĵ���
;******************************************************
checksuma	proc
	xor	al,al
suma:	add	al,[bx]
	inc	bx
	loop	suma
	ret
checksuma	endp
end