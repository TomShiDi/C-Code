;samp417.asm,P151,64位数据算术左移8位,教材上算法很弱智.
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