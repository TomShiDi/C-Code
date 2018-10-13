;p234.asm,Çón!
;
;
;*****************************************************
data	segment
n_v	dw	3
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
code1	segment
	assume	cs:code1,ds:data,ss:stack
start:	mov	ax,stack
	mov	ss,ax
	mov	sp,offset tos
;
	mov	ax,data
	mov	ds,ax
;
	mov	bx,offset result
	push	bx
	mov	bx,n_v
	push	bx
	call 	far ptr fact
;
	mov	ax,4c00h
	int 	21h
code1	ends
;******************************************************
;
;******************************************************
code	segment
;
frame	struc
	save_bp	dw	?
	savcsip	dw	2 dup(?)
	n	dw	?
	result1	dw	?
frame	ends
;
	assume	cs:code
;-------------------------------------------------------
fact	proc	far
	push	bp
	mov	bp,sp
	push	bx
	push	ax
	mov	bx,[bp].result1
	mov	ax,[bp].n
	cmp	ax,0
	je	done
	push	bx
	dec	ax
	push	ax
	call	far ptr fact
	mov	bx,[bp].result1
	mov	ax,[bx]
	mul	[bp].n
	jmp	short	return
;
done:	mov	ax,1
return:	mov	[bx],ax
	pop	ax
	pop	bx
	pop	bp
	ret	4
fact	endp	
;---------------------------------------------------------
;
code	ends
;**********************************************************
	end	start

