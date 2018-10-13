; p165.asm,检索，查到删除该数。
program	segment
main	proc	  far
	assume 	cs:program
start:	push	ds
	sub	ax,ax
	push	ax		;和ret配合使用
	cld
	push	di
	mov	cx,es:[di]
	mov	ax,cx		;修改。查串长值元素是否存在。
	add	di,2
	repne	scasw		;在串中查找与ax值相等者。
	je	delete
	pop	di
	jmp	short exit	;没有找到，直接退出。
delete:	jcxz	dec_cnt		;找到，是最后一个，直接将串长减1。
next_el:mov	bx,es:[di]	;找到，元素往前移一个位置。
	mov	es:[di-2],bx	;
	add	di,2
	loop	next_el
dec_cnt:pop	di
	dec	word ptr es:[di]
exit:	ret
main	endp
program	ends
	end

			

