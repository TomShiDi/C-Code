;samp254p.asm,P254,·¢ÉùÇý¶¯³ÌÐò
.model small
.stack
.data
.code
.startup
	mov	cx,1000
again:	call	beep
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
l0:	loop	l0
	dec	bl
	jnz	l0
	mov	al,ah
	out	61h,al
	pop	cx
	ret
beep	endp
end