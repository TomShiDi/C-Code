;�޳��ַ����пո����P160
.MODEL	SMALL
    	.STACK
    	.DATA
string	db	'let us have a try','$'
	.CODE
    	.STARTUP
    	mov	si,offset string
outlp:	cmp	byte ptr [si],'$'
	jz	done
again:	cmp	byte ptr [si],' '
	jnz	next
	mov	di,si
inlp:	inc	di
	mov	al,[di]
	mov	[di-1],al			;ǰ�ƿո�������ַ�
	cmp	byte ptr [di],'$'
	jnz	inlp
	jmp	again
next:	inc	si
	jmp	outlp
done:	.EXIT 0
END
