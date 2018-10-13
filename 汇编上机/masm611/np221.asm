;p221.asm,ascii形式十进制数转换为二进制数。
;算法本身不如p216的decibin子程序。
;在masm611下汇编、连接。
;当g43时的堆栈情况如图6.5示。
;另外，ascval地址值并非0而是4。
;
	.model	small
	.386
	.stack	200h
	.data
ascval	db	'12345'
binval	dw	?

	.code
main	proc
start:	mov	ax,@data
	mov	ds,ax
;
	lea	bx,ascval
	push	bx
	lea	bx,binval
	push	bx
	call	asc2bin
;
	mov	ax,4c00h
	int	21h
;
main	endp
;---------------------------------------
;子程序名：asc2bin
;功能：将ascii码形式十进制数字转换为二进制数。
;入口参数：十进制数串首地址、二进制结果字地址在栈顶两单元。
;返回值：结果存回给定单元
;算法：十进制数按权相乘最后相加即得二进制结果。
;
asc2bin proc	pascal uses ax bx cx si di,par1:word,par2:word
	local	asclen:word,mulfact:word
	mov	bx,10
	mov	si,par1
	mov	di,par2
	sub	di,si
	mov	asclen,di
	mov	cx,asclen
	add	si,asclen
	dec	si
	mov	mulfact,1
	mov	di,par2
	mov	[di],0
next:	mov	al,[si]
	and	ax,0fh
	mul	mulfact
	add	[di],ax
	mov	ax,mulfact
	mul 	bx
	mov	mulfact,ax
	dec	si
	loop	next
	ret
asc2bin endp
;-------------------------------------
;
;
	end 	main




	