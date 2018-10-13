;p180_n.asm,检索，查到删除该数。
program	segment
main	proc	  far
	assume 	cs:program
start:	push	ds
	sub	ax,ax
	push	ax		;和ret配合使用
	cld
	push	di
	mov	cx,50H		;查0是否存在,若查到，要移动元素，破坏代码区。
	add	di,2		;只查20个元素。
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

			

