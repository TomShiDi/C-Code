;p202.asm����Ԫ������ͽ����Ԫ�ӳ���
;��debug���á�e�������޸��ڴ浥Ԫ���ݡ�
;
;*************************************
data	segment
ary	dw	100 dup(?)
count	dw	100
sum	dw	?
data	ends
;*************************************
;
;*************************************
code	segment
	assume	cs:code,ds:data
;======================================
;
main	proc	far
start:	push	ds
	sub	ax,ax
	push	ax
	mov	ax,data
	mov	ds,ax
	call	near  ptr  proadd
	ret
main	endp
;=======================================
;
;--------------------------------------	
;���ܣ��������Ԫ�����
;��ڲ�����������Ϊary��Ԫ�ظ�����count
;����ֵ���ۼӺʹ���sum��Ԫ
proadd	proc	near
	push	ax
	push	cx
	push	si
	lea	si,ary
	mov	cx,count
	xor	ax,ax
next:	add	ax,[si]
	add	si,2	
	loop	next
	mov	sum,ax
	add	ax,bx
	add	ax,48H
	add	ax,[48H]
	pop	si
	pop	cx
	pop	ax
	ret
proadd	endp
;---------------------------------------
;
code	ends
;*****************************************
	end	start







