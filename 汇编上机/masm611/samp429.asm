;samp429.asm,P164,�����ӳ���������У�����result��Ԫ,����ֱ�Ӵ��Ͳ�����
.model small
.stack
.data
	result	db	0
	array	db	56h,23h,37h,78h,0ffh,0,12h,99h,64h,0b0h
		db	78h,80h,23h,1,4,0fh,2ah,46h,32h,42h
	count 	equ	($-array)/type array
.code
.startup
	call	checksumb
.exit	0
;******************************************************
;�ӳ�����:checksumb
;���ܣ������ֽ�����У���
;��ڲ�����arrayΪ��������countΪԪ�ظ�����resultΪУ��ʹ�ŵ�Ԫ
;����ֵ����
;˵������ax/bx/cx�ⲻӰ�������Ĵ���
;******************************************************
checksumb	proc
	push	ax
	push	bx
	push	cx
	xor	al,al
	mov	bx,offset array
	mov	cx,count
sumb:	add	al,[bx]
	inc	bx
	loop	sumb
	mov	result,al
	pop	cx
	pop	bx
	pop	ax
	ret
checksumb	endp
end