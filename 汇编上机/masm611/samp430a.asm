;samp430.asm,P165,�����ӳ���������У�����result��Ԫ,��ջ���Ͳ���,ǿ�ƶμ���á�
.model small
.stack
.data
	result	db	0
	array	db	56h,23h,37h,78h,0ffh,0,12h,99h,64h,0b0h
		db	78h,80h,23h,1,4,0fh,2ah,46h,32h,42h
	count 	equ	($-array)/type array
.code
.startup
	mov	ax,offset array
	push	ax
	mov	ax,count
	push	ax
	call	far ptr checksumc
	add	sp,4
	mov	result,al
.exit	0
;******************************************************
;�ӳ�����:checksumb
;���ܣ������ֽ�����У���
;��ڲ�����arrayΪ��������countΪԪ�ظ���ѹջ���Ͳ���
;����ֵ��alΪУ���
;˵������ax/bx/cx�ⲻӰ�������Ĵ���
;******************************************************
checksumc	proc
	
	push	bp
	mov	bp,sp
	push	ax
	push	bx
	push	cx
	mov	bx,[bp+8]
	mov	cx,[bp+6]
	xor	al,al
sumc:	add	al,[bx]
	inc	bx
	loop	sumc
	pop	cx
	pop	bx
	pop	ax
	pop	bp
	ret
checksumc	endp
end