;samp420.asm,P154,��һԪ���η�����ʵ�����ֽڱ���TAG��1���������㡣
.model small
.stack
.data
	_a	db	8
	_b	db	6
	_c	db	4
	tag	db	1
.code
.startup
	mov	al,_b
	imul	al
	mov	bx,ax
	mov	al,_a
	imul	_c
	sal	ax,1
	sal	ax,1		;����4��������2λʵ��
	cmp	bx,ax
	jge	done
	mov	tag,0
done:	.exit	0
end