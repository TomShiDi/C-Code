;p219.asm,
;
;
;
	.model	medium
	.data
ary	dw	100	dup(?)
count	dw	100
sum	dw	?
;
;
	.stack	200h
;
;*****************************************
	.code
main	proc
start:	mov	ax,@data
	mov	ds,ax
;
	mov	bx,offset ary
	push	bx
	mov	bx,offset count
	push	bx
	mov	bx,offset sum
	push	bx
;
	call 	proadd
;
	mov	ax,4c00h
	int	21h
main	endp	
;***************************************
;
;-------------------------------------------------
;�ӳ�������proadd��
;���ܣ�����Ԫ����͡�
;��ڲ�����������ַ�����鳤�ȵ�ַ�������Ԫ��ַ��ջ������Ԫ��
;����ֵ������ڽ����Ԫ��
;
proadd	proc	pascal uses ax cx si di,para:word,parc:word,pars:word
	mov	si,para
	mov	di,parc
	mov	cx,[di]
	mov	di,pars
	xor	ax,ax
next:	add	ax,[si]
	add	si,2
	loop	next
	mov	[di],ax
	ret
proadd	endp
;------------------------------------------------
;
	end	start