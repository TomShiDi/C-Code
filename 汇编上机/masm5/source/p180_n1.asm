;p180_n.asm,�������鵽ɾ��������
es_data	segment
		dw 	50h
		org 	0a2h
es_data	ends

program	segment
	assume 	cs:program,es:es_data
start:	mov	ax,es_data
	mov	es,ax
	cld
	push	di
	mov	cx,es:[di]	;��0�Ƿ����,���鵽��Ҫ�ƶ�Ԫ�أ��ƻ���������
	add	di,2		;
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
exit:	mov	ax,4c00h
	int 	21h
program	ends
	end

			

