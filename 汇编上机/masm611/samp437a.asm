;samp437.asm,P181,�����ӳ���������У�����result��Ԫ,��ǿ�͹��̵��ã�������FAR���塣
.model small
checksumd	proto	far c,:word,:word
.stack	256
.data
	result	db	0
	array	db	56h,23h,37h,78h,0ffh,0,12h,99h,64h,0b0h
		db	78h,80h,23h,1,4,0fh,2ah,46h,32h,42h
	count 	equ	($-array)/type array
.code
.startup
invoke	checksumd,count,offset array
	mov	result,al
.exit	0
;******************************************************
;�ӳ�����:checksumd
;���ܣ������ֽ�����У���
;��ڲ�����arrayΪ��������countΪԪ�ظ���
;����ֵ��alΪУ���
;˵������ax/bx/cx�ⲻӰ�������Ĵ���,��ǿ�͹��̵���
;******************************************************
checksumd	proc	far c uses bx cx,countp:word,arrayp:word
	mov	bx,arrayp		;ԭ��Ϊ[bp+6],����[bp+8]
	mov	cx,countp		;ԭ��Ϊ[bp+4]������[bp+6]
	xor	al,al
sumd:	add	al,[bx]
	inc	bx
	loop	sumd
	ret
checksumd	endp
end