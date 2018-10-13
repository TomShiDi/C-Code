;samp254p.asm,P254,发声驱动程序
.model small
.stack
.data
.code
.startup
	mov	cx,100
again:	mov	bl,1
	call	beep
	loope	again
.exit	0
beep	proc	
	push	cx
	mov	al,0b6h
	out 	43h,al
	mov	ax,1190
	out	42h,al
	mov	al,ah
	out 	42h,al
	or	al,03h
	out 	61h,al
	mov	cx,0
	mov	bx,655		;6553,1分钟左右。655，6秒左右。
l0:	loop	l0		;5/6
	dec	bx
	jnz	l0
	mov	al,ah
	out	61h,al
	pop	cx
	ret
beep	endp
end