;samp426.asm,P160,ɾ��"$"�������ַ����пո����
.model small
.stack
.data
	string	db	'LET US HAVE A TRY!','$'
.code
.startup
	mov 	si,offset string
outlp:	cmp	byte ptr [si],'$'
	jz	done
again:	cmp	byte ptr [si],' '
	jnz	next
	mov	di,si
inlp:	inc	di			;5��ָ���ѭ������ǰ��һ���ַ���
	mov	al,[di]
	mov	[di-1],al
	cmp	byte ptr [di],'$'
	jnz	inlp
	jmp	again
next:	inc	si
	jmp	outlp
done:	.exit	0
end