;p190_n.asm,�Ż�ð�ݷ�
;******************************************
data	segment
addr	dw	1,3,5,7,8,9,10,11,12,15
savecnt	dw	?
data	ends
;*******************************************
program	segment
bubble	proc	far
	assume	cs:program,ds:data
start:	push 	ds
	sub	ax,ax
	push	ax
	mov	ax,data
	mov	ds,ax
	mov	cx,10
	mov	savecnt,cx
init:	mov	bx,1			;������־������Ϊ0������˽�����
	dec	savecnt			;���ѭ��������
	jz	sorted
	mov	cx,savecnt		;���ٴν������ѭ�������������Ԫ���Ѿ�����
	mov	di,offset addr-2	;ds:diΪ����ʼ��ַ
next:	add	di,2
	mov	ax,[di]
	cmp	[di+2],ax		;[di+2]-[di]
	jae	cont			;�����Ѿ�����
	xchg	[di+2],ax		;ʹ��������
	mov	[di],ax
	sub	bx,bx			;��Ϊ������bx��0
cont:	loop	next
	cmp	bx,0			;���Ƿ���й�������
	je	init			;��Ϊ��������ת��init������
sorted:	ret				;��Ϊδ������˵���Ѿ�ȫ������
bubble	endp
program	ends
	end 	start
