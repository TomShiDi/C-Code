;p221.asm����Ԫ������ͽ����Ԫ�ӳ���
;ͨ����ջ���Ͳ�����
;ͨ��debug������ջ�仯��
;*************************************
parmseg segment
ary	dw	50 dup(1,2)
count	dw	100
sum	dw	?
parmseg	ends
;*************************************
;
;*************************************
stack	segment
	dw  	100  dup(?)
tos	label	word		;ջ�������Ϸ�չ��
stack	ends
;**************************************
;
;**************************************
code1	segment
	assume	cs:code1,ds:parmseg,ss:stack
	org	100h
;
main	proc	far
start:	mov	ax,stack
	mov	ss,ax
	mov	sp,offset  tos	;���ö�ջ��
;
	push	ds
	sub	ax,ax
	push	ax
;
	mov	ax,parmseg
	mov	ds,ax		;�����й̶�ģʽ
;
	mov	bx,offset ary	;ѹ������ַ
	push	bx
	mov	bx,offset count	;ѹԪ�ظ�����ַ
	push	bx
	mov	bx,offset sum	;ѹ�����Ԫ��ַ
	push	bx
	call	far ptr proadd
	ret
main	endp
;
code1	ends
;**************************************
;
;**************************************
code2	segment
	assume	cs:code2
;--------------------------------------
;��������proadd
;���ܣ�����Ԫ�����
;��ڲ�����ջ�����֣������Ԫ��ַ��Ԫ�ظ�����ַ��������ַ��
;����ֵ���ۼӺ��ͽ����Ԫ��
;�㷨������ջ����ת��ʱ�Ըı䣬Ҫ��bpѰַ��
;	
proadd	proc	far
	push	bp
	mov	bp,sp
	push	ax
	push	cx
	push	si
	push	di
	mov	si,[bp+0ah]	;��ͼ6.2
	mov	di,[bp+8]
	mov	cx,[di]
	mov	di,[bp+6]
	xor	ax,ax
next:	add	ax,[si]
	add	si,2	
	loop	next
	mov	[di],ax
	pop	di
	pop	si
	pop	cx
	pop	ax
	pop	bp
	ret	6
proadd	endp
;---------------------------------------
;
code2	ends
;*****************************************
	end	start







