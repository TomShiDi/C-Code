;p234.asm,��n!
;�����ýṹ�塣
;
;*****************************************************
data	segment
n	dw	3
result	dw	?
data	ends
;*****************************************************
;
;*****************************************************
stack	segment
	dw	128 dup(0)
tos	label	word
stack	ends
;*****************************************************
;
;*****************************************************
code	segment
	assume	cs:code,ds:data,ss:stack
start:	mov	ax,stack
	mov	ss,ax
	mov	sp,offset tos
;
	mov	ax,data
	mov	ds,ax
;
	mov	bx,n
	push	bx
	call 	fact
;
	pop	result
	mov	ax,4c00h
	int 	21h

;-------------------------------------------------------
fact	proc	near
	push	ax
	push	bp
	mov	bp,sp
	mov	ax,[bp+6]
	cmp	ax,0
	jne	fact1
	inc	ax
	jmp	exit
fact1:	dec	ax
	push	ax
	call	fact
	pop	ax
	mul	word ptr [bp+6]
exit:	mov	[bp+6],ax
	pop	bp
	pop	ax
	ret
fact	endp
;----------------------------------------------------------
code	ends
;**********************************************************
	end	start

