;p352.asm,输入字符串,并显示该字符串。
;
;********************************************
;
	.model 	small
	.stack	200h
;==============================================
;
	.data
userstr	db	50,0,50 dup('$')
;==============================================
	.code
start:
	mov	ax,@data
	mov	ds,ax
;
	lea	dx,userstr
	mov	ah,0ah
	int	21h
;
	call	crlf
;
	sub	ch,ch
	mov	cl,userstr+1
	lea	dx,userstr+2
	mov	ah,9
	int	21h
;
exit:	mov	ax,4c00h
	int	21h

;===============================================
;-------------------------------------------
;过程名：crlf
;功能：显示回车、换行子程序。
;入口参数：无。
;返回值：无。
;
;
crlf	proc	near
;
	mov	dl,0dh
	mov	ah,2
	int	21h
	mov	dl,0ah
	mov	ah,2
	int 	21h
;
	ret
crlf	endp
;-------------------------------------------
;***********************************************
	end 	start