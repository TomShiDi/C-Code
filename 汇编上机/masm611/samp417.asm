;samp417.asm,P151,64λ������������8λ,�̲����㷨������.
.model small
.stack
.data
	qvar dq	1234567887654321h
.code
.startup
	mov	ax,ds
	mov	es,ax
	std
	lea	si,qvar+6
	lea	di,qvar+7
	mov	cx,7
	rep	movsb
	sub	al,al
	mov	[di],al
.exit	0
end