;p180_n.asm,�������鵽ɾ��������
program	segment
main	proc	  far
	assume 	cs:program
start:	push	ds
	sub	ax,ax
	push	ax		;��ret���ʹ��
	cld
	push	di
	mov	cx,50H		;��0�Ƿ����,���鵽��Ҫ�ƶ�Ԫ�أ��ƻ���������
	add	di,2		;ֻ��20��Ԫ�ء�
	repne	scasw		;�ڴ��в�����axֵ����ߡ�
	je	delete
	pop	di
	jmp	short exit	;û���ҵ���ֱ���˳���
delete:	jcxz	dec_cnt		;�ҵ��������һ����ֱ�ӽ�������1��
next_el:mov	bx,es:[di]	;�ҵ���Ԫ����ǰ��һ��λ�á�
	mov	es:[di-2],bx	;
	add	di,2
	loop	next_el
dec_cnt:pop	di
	dec	word ptr es:[di]
exit:	ret
main	endp
program	ends
	end

			

