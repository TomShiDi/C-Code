;p219.asm,ʹ����ǿ�͹��̶��壬��masm611�»�ࡢ���ӡ�
;���Կ������ӳ������Զ�������11��ָ�
;�����Զ��ı�retΪretf 0006��
;��para,parb,parc�Զ���Ϊ[bp+0a],[bp+08],[bp+06]
;
;
;
	.model	medium
	.data
ary	dw	100	dup(1)
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