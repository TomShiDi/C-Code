;p221.asm,ascii��ʽʮ������ת��Ϊ����������
;�㷨������p216��decibin�ӳ���
;��masm611�»�ࡢ���ӡ�
;��g43ʱ�Ķ�ջ�����ͼ6.5ʾ��
;���⣬ascval��ֵַ����0����4��
;
	.model	small
	.386
	.stack	200h
	.data
ascval	db	'12345'
binval	dw	?

	.code
main	proc
start:	mov	ax,@data
	mov	ds,ax
;
	lea	bx,ascval
	push	bx
	lea	bx,binval
	push	bx
	call	asc2bin
;
	mov	ax,4c00h
	int	21h
;
main	endp
;---------------------------------------
;�ӳ�������asc2bin
;���ܣ���ascii����ʽʮ��������ת��Ϊ����������
;��ڲ�����ʮ���������׵�ַ�������ƽ���ֵ�ַ��ջ������Ԫ��
;����ֵ�������ظ�����Ԫ
;�㷨��ʮ��������Ȩ��������Ӽ��ö����ƽ����
;
asc2bin proc	pascal uses ax bx cx si di,par1:word,par2:word
	local	asclen:word,mulfact:word
	mov	bx,10
	mov	si,par1
	mov	di,par2
	sub	di,si
	mov	asclen,di
	mov	cx,asclen
	add	si,asclen
	dec	si
	mov	mulfact,1
	mov	di,par2
	mov	[di],0
next:	mov	al,[si]
	and	ax,0fh
	mul	mulfact
	add	[di],ax
	mov	ax,mulfact
	mul 	bx
	mov	mulfact,ax
	dec	si
	loop	next
	ret
asc2bin endp
;-------------------------------------
;
;
	end 	main




	