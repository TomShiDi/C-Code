;p204.asm����Ԫ������ͽ����Ԫ�ӳ���
;ͨ����ַ���Ͳ���������ַ��bx�С�
;��.com��ʽд����
;��debug�п������
;
;*************************************
code	segment
	assume	cs:code,ds:code,ss:code
	org	100h
;======================================
;
main	proc	near
start:	mov	ax,code
	mov	ds,ax
	mov	table,offset ary
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
ary	dw	100 dup(?)	;ary��140h��ʼ��
count	dw	100		;��ַΪ208h
sum	dw	?		;��ַΪ20ah
table	dw	3  dup(?)	;���δ�140h,208h,20ah��
;
;=========================================
;
code	ends
;*****************************************
	end	start







