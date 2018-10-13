;p225.asm,键入十六进制数以十进制形式显示。
;
;定义常数
display	equ	2h
key_in	equ	1h
doscall	equ	21h
;
;
;****************************************
hexidec	segment
	assume	cs:hexidec
;
start:	mov 	cx,5
repeat:	push	cx	
	call	hexibin
	call 	crlf
	call 	binidec
	call 	crlf
	pop	cx
	loop	repeat
	mov	ax,4c00h
	int 	doscall
;*******************************************
;
;------------------------------------------
;过程名：hexibin
;功能：十六进制数转换为二进制子程序。
;入口参数：键盘输入四个正十六进制数
;返回值：结果在BX中。
;算法：0~9减去30h，A~F再减去7，a~f再减去20h。
;
hexibin	proc	near
	mov	bx,0
newchar:mov	ah,key_in
	int	doscall
	sub	al,30h
	jl	exit	;小于0，非十六进制数。
	cmp	al,10
	jl	add_to	;已经转换为二进制,0～9
	sub	al,7
	cmp	al,0ah
	jl	exit	;'9'<al<'A',非十六进制数。
	cmp	al,16
	jl	add_to	;已经转换为二进制,A～F
	sub	al,20h
	cmp	al,0ah
	jl	exit	;'F'<al<'a',非十六进制数。
	cmp	al,16
	jge	exit	;al>'f'转走，否则a～f
add_to:	mov	cl,4	;0～9,或A～F,或a～f
	shl	bx,cl	;将输入四数拼成16位二进制数。
	mov	ah,0
	add	bx,ax
	jmp	newchar
;
exit:	ret
hexibin endp
;-----------------------------------------------
;
;============================================
;过程名：binidec
;功能：二进制数以十进制形式显示在屏幕上。
;入口参数：二进制数在bx中。
;返回值：无。在屏幕上显示结果。
;算法：从左到右依次除以十进制权值得到商在屏幕上显示。
;
;
binidec	proc	near
	mov	cx,10000
	call	dec_div
	mov	cx,1000
	call	dec_div
	mov	cx,100
	call	dec_div
	mov	cx,10
	call	dec_div
	mov	cx,1
	call	dec_div
	ret
;
;
;----------------------------------------
;过程名：dec_div
;功能：通过除以10的幂次方得到一位商并显示在屏幕上。
;入口参数：原二进制数(余数)在bx中，10的幂次方在cx中。
;返回值：商送屏幕显示。余数在bx中。
;算法：依次除以10000,1000,100,10,1得到商并显示。
;
dec_div	proc	near
	mov	ax,bx
	sub	dx,dx	;得到dx:ax除以cx
	div	cx
	mov	bx,dx
;
	mov	dl,al
	add	dl,30h
	mov	ah,display
	int 	doscall
	ret
dec_div	endp
;------------------------------------------------
;
binidec	endp
;==================================================
;
;
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
	mov	ah,display
	int	doscall
;
	mov	dl,0ah
	mov	ah,display
	int 	doscall
;
	ret
crlf	endp
;-------------------------------------------

hexidec ends
;*********************************************
	end	start


	































