;p220_n.asm����Ԫ������ͽ����Ԫ�ӳ���
;ͨ����ַ���Ͳ���������ַ��bx�С�
;��.com��ʽд����
;��debug�п������
;
;*************************************
code	segment
	assume	cs:code,ds:code,es:code,ss:code
	org	100h
;======================================
;
main	proc	near
start:	mov	table,offset ary
	mov	table+2,offset count
	mov	table+4,offset sum
	mov	bx,offset table
	call	proadd
	mov	ax,4c00h
	int 	21h
main	endp
;=======================================
;
;--------------------------------------	
;��������proadd
;���ܣ�����Ԫ�����
;��ڲ�����ͨ����ַ��ת�͡�����ַ��bx�С�
;         ��������Ϊ������ʼ��ַ��Ԫ�ظ����������Ԫ
;����ֵ���ۼӺ��ͽ����Ԫ��
;
proadd	proc	near
	push	ax
	push	cx
	push	si
	push	di
	mov	si,[bx]		;ary��ַָ��
	mov	di,[bx+2]	
	mov	cx,[di]		;aryԪ�ظ���
	mov	di,[bx+4]	;�����Ԫָ��
	xor	ax,ax
next:	add	ax,[si]
	add	si,2	
	loop	next
	mov	[di],ax
	pop	di
	pop	si
	pop	cx
	pop	ax
	ret
proadd	endp
;---------------------------------------
;
;=========================================
;
	even
ary	dw	100 dup(?)	;ary��13ch��ʼ��
count	dw	100		;��ַΪ204h
sum	dw	?		;��ַΪ206h
table	dw	3  dup(?)	;���δ�13ch,204h,206h��
;
;=========================================
;
code	ends
;*****************************************
	end	start







