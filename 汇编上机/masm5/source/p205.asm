;p205.asm,�ֽڱ������������ֱ��ӦԪ�ظ��ֽڡ�
;һ��Ѱַ��ʽ������debug�п�����仯��
;����ʱ����ɿ���������ݡ�
	.model	small
	.386
	.stack	200H
	
	.data
	align	16
byte_ta	db	20 dup(?)
word_ta	dw	20 dup(?)
	.code
start:	mov	ax,@data
	mov	ds,ax			;�̶�ģʽ
;
	xor	si,si
	xor	di,di
next:	mov	ax,word_ta[di]
	mov	ah,byte_ta[si]
	mov	word_ta[di],ax
	inc	si
	add	di,2
	cmp	si,20
	jl	next
;
	mov	ax,4c00H
	int	21H
	end	start