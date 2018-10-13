;p200.asm,键入十进制数以十六进制形式显示。
;
;****************************************
decihex	segment
	assume	cs:decihex
main	proc	far
start:	mov 	cx,2
repeat:	call	decibin
	call 	crlf
	call 	binihex
	call 	crlf
	loop	repeat
	mov	ax,4c00h
	int 	21h
main	endp

;------------------------------------------
;过程名：decibin
;功能：十进制数转换为二进制子程序。;
;入口参数：键入十进制数，非十进制数结束
;返回值：以二进制形式存入BX中。
;算法；123=((1*10)+2)*10+3
;
decibin	proc	near
	push	cx
	mov	bx,0
newchar:mov	ah,1
	int	21h
	sub	al,30h
	jl	exit
	cmp	al,9
	jg	exit
	cbw
	xchg	ax,bx
	mov	cx,10	;进行十进制到二进制转换。
	mul	cx
	xchg	ax,bx
	add	bx,ax
	jmp	newchar
exit:	pop	cx	;当exit标在下行时出错。
	ret
decibin endp

;============================================
;过程名：binihex
;功能：二进制字以十六进制形式显示在屏幕上。
;入口参数：二进制字在bx中。
;返回值：无。
;算法：四位二进制转换为ascii码显示
;
binihex	proc	near
	push	cx
	mov	ch,4
rotate:	mov	cl,4
	rol	bx,cl
	mov	al,bl
	and 	al,0fh
	add	al,30h
	cmp	al,3ah
	jl	printit
	add	al,7
printit:mov	dl,al
	mov	ah,2
	int	21h
	dec	ch
	jnz	rotate
	pop	cx
	ret
binihex	endp

;-------------------------------------------
;过程名：crlf
;功能：显示回车、换行。
;入口参数：无。
;返回值：无。
;
crlf	proc	near
	push	cx
	mov	dl,0dh
	mov	ah,2
	int	21h
	mov	dl,0ah
	mov	ah,2
	int 	21h
	pop	cx
	ret
crlf	endp
;-------------------------------------------

decihex ends
;*********************************************
	end	main



	































