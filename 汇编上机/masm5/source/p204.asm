;p204.asm,������ַʵ��5��˫����ӡ�
;
	.model	small
	.386
	.stack	200H
	.data
array	dd	234556H,0f983f5H,6754ae2H
	dd	0c5231239H,0af34acb4H
result	dq	?
	.code
start:	mov	ax,@data
	mov	ds,ax			;�̶�ģʽ
;
	sub	ebx,ebx
	mov	edx,ebx
	mov	eax,ebx
	mov	cx,5
back:	add	eax,array[ebx*4]
	adc	edx,0			;������˫�����Ͻ��
	inc	ebx			;ָ���޸ģ���1
	dec	cx
	jnz	back
	mov 	dword ptr result,eax
	mov	dword ptr result+4,edx
;
	mov	ax,4c00H
	int	21H
	end	start