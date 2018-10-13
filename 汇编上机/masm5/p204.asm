;p204.asm,比例变址实现5个双字相加。
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
	mov	ds,ax			;固定模式
;
	sub	ebx,ebx
	mov	edx,ebx
	mov	eax,ebx
	mov	cx,5
back:	add	eax,array[ebx*4]
	adc	edx,0			;可能有双字以上结果
	inc	ebx			;指针修改，加1
	dec	cx
	jnz	back
	mov 	dword ptr result,eax
	mov	dword ptr result+4,edx
;
	mov	ax,4c00H
	int	21H
	end	start