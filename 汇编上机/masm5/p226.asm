;p226.asm,����Ԫ����͡�
;ʹ���˽ṹ�巽��ͨ����ջ���Ͳ�����
;�ӳ������ڵ�ַ�ڲ�ͬ�Ρ�
;g1d(ת��֮ǰ��������ջ���ݡ���ʱ��ѹ��5�֡�
;�����ӳ��������öϵ���gb80:19������b80Ϊ�ε�ַ����
;��ʱ��ѹ��12���֣���p227ͼ��
;���ܷ��ʽṹ����Ԫ�أ�ax��Ϊ�ۼӺ͡�
;
;**********************************************
parmseg	segment
ary	dw	100	dup(1)
count	dw	100
sum	dw 	?
parmseg	ends
;**********************************************
;
;**********************************************
stack	segment
	dw	128	dup(?)
tos	label	word
stack	ends
;**********************************************
;
;**********************************************
code1	segment
main	proc	far
	assume	cs:code1,ds:parmseg,ss:stack
start:	mov	ax,stack
	mov	ss,ax
	mov	sp,offset tos
;
	push	ds
	sub	ax,ax
	push	ax
;
	mov	ax,parmseg
	mov	ds,ax
;
	mov	bx,offset ary
	push	bx
	mov	bx,offset count
	push	bx
	mov	bx,offset sum
	push 	bx
;
	call	far ptr proadd
;
	ret
main	endp
;
code1	ends
;**********************************************
;
;**********************************************
code2	segment
	assume	cs:code2
;
stack_strc	struc
	save_bp	dw	?
	s_csip	dw	2	dup(?)
	p3_addr	dw	?
	p2_addr	dw	?
	p1_addr	dw	?
stack_strc	ends
;
;-----------------------------------------------
;�ӳ�������proadd��
;���ܣ�����Ԫ����͡�
;��ڲ�����������ַ�����鳤�ȵ�ַ�������Ԫ��ַ��ջ������Ԫ��
;����ֵ������ڽ����Ԫ��
;�㷨��ʹ�ýṹ����ʽ��
;
proadd	proc	far
	push	bp
	mov	bp,sp
	push	ax
	push	cx
	push	si
	push	di
	mov	si,[bp].p1_addr
	mov	di,[bp].p2_addr
	mov	cx,[di]
	mov	di,[bp].p3_addr
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
;--------------------------------------------------
;
code2	ends
;***************************************************
	end 	start