;samp423.asm,P157,ȷ���ֱ���wordx��Ϊ1�����λ����0~15������bytex�У���wordx����1����-1����bytex��
.model small
.stack
.data
	wordx	dw	56	;����ʱ��e����ı�
	bytex	db	-1
.code
.startup
	mov	ax,wordx
	mov	cx,16
	mov	dl,-1
again:	inc	dl
	test	ax,1
	rcr	ax,1
	loope	again
	je	done
	mov	bytex,dl
done:	.exit	0
end