;p180_n.asm,检索，查到删除该数。
es_data	segment
		dw 	50h
		org 	0a2h
es_data	ends

program	segment
	assume 	cs:program,es:es_data
start:	mov	ax,es_data
	mov	es,ax
	cld
	push	di
	mov	cx,es:[di]	;查0是否存在,若查到，要移动元素，破坏代码区。
	add	di,2		;
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
exit:	mov	ax,4c00h
	int 	21h
program	ends
	end

			

