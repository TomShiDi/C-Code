;p332.asm,除数为0的软件中断（类型0）处理程序。
;
;
;****************************************************
	.model	small
;
;---------------------------------------------------
;
	.stack
;
;---------------------------------------------------
;
	.code
;
start:	lea	dx,zdiv
	mov	ax,seg zdiv
	mov	ds,ax
	mov	al,0
	mov	ah,25h
	int	21h	;设置中断向量
;
 	mov	ax,@code
	mov	ds,ax
	mov	dx,offset ok_msg
	mov	ah,9
	int	21h	;输出提示字符串ok_msg
;
	mov	ax,1
	mov	dl,0
	div	dl	;中断源
;
	mov	ah,2
	mov	dl,'#'
	int	21h
;
	mov	ah,31h	;结束并驻留功能调用
	mov	al,0	;驻留区大小在dx中
	mov	dx,((proglen+15)/16)+16
	int	21h	;保证大小为16整倍数。
;
	mov	ax,4c00h
	int 	21h
;
;----------------------------------------------------
;过程名：zdiv
;功能：除数为0中断处理子程序。
;
;
zdiv	proc	far
	push	ax
	push	bx
	push	cx
	push	dx
	push	si
	push	di
	push 	bp
	push	ds
	push 	es
	sti
;
prtwarn:mov	ax,@code
	mov	ds,ax
;
	mov	dx,offset warnmsg
	mov	ah,9
	int	21h	;输出警告信息
;
input:	mov	ah,1
	int	21h
	cmp	al,'c'
	je	continu
;
	cmp	al,'q'
	je	exit
;
	mov	dx,offset beep
	mov	ah,9
	int 	21h	;输出beep声
	jmp	prtwarn
;
exit:	mov	ax,4cffh
	int 	21h
;
continu:mov	dx,offset crlf
	mov	ah,9
	int	21h
	cli
;
	pop	es
	pop	ds
	pop	bp
	pop	di
	pop	si
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	iret
zdiv	endp
;
;-------------------------------------------------
;
;数据区。
;
ok_msg	db	0dh,0ah,'Zero-division Handler installed!'
	db	0dh,0ah,'$'
warnmsg	db	0dh,0ah,'Zero-division detected,',07h
	db	'Continue or Quit(c/q)?$'
beep	db	10 dup(07h),'$'
crlf	db	0dh,0ah,'$'
proglen	equ	$-start
;
;--------------------------------------------------
;******************************************************
	end	start