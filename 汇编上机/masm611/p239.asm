;p234.asm,求n!
;不采用结构体,用增强型过程定义。
;
;*****************************************************
	.model	small
	.data	
n_v	dw	?
result	dw	?
;*****************************************************
;
;*****************************************************
	.stack	200h
;*****************************************************
;
;*****************************************************
	.code	
start:	mov	ax,@data
	mov	ds,ax
;
	mov	bx,offset result
	push	bx
	mov	bx,n_v
	push	bx
	call 	fact
;
	mov	ax,4c00h
	int 	21h

;-------------------------------------------------------
fact	proc	pascal uses bx ax,parresult:word,parn:word
	mov	bx,parresult
	mov	ax,parn
	cmp	ax,0
	je	done
	push	bx
	dec	ax
	push	ax
	call	fact
	mov	bx,parresult
	mul	parn
	jmp	short return
;
done:	mov	ax,1
return:	mov	[bx],ax
	ret
fact	endp
;----------------------------------------------------------
;
;**********************************************************
	end	start

