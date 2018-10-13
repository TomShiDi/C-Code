datas   segment
flag	db	0,0		;检查flag值，即分支号。
bran_ta	dw	route_1
	dw	route_2
	dw	route_3
	dw	route_4
	dw	route_5
	dw	route_6
	dw 	route_7
	dw	route_8
mess1   db 	0dh,0ah,'Please enter a number(1~8):$'
datas   ends

codes   segment
        assume 	cs:codes,ds:datas
start:  mov 	ax,datas
        mov 	ds,ax
  	lea 	dx,mess1
        mov 	ah,09h
        int 	21h		;显示提示
        mov 	ah,1
        int 	21h		;输入字符在al中。
	and	al,0fH
	cmp	al,8
	ja	exit		;输入≥8，结束
	mov	cl,al
	sub	al,al
	stc
	rcl	al,cl
	cmp	al,0	
	je	exit		;输入＝0，结束
	lea	bx,bran_ta
loop1:	shr	al,1
	jnb	not_yet
	jmp	word ptr[bx]
not_yet:add	bx,type bran_ta
	jmp	loop1
route_1:mov	flag,1
	jmp	exit
route_2:mov	flag,2
	jmp	exit
route_3:mov	flag,3
	jmp	exit
route_4:mov	flag,4
	jmp	exit
route_5:mov	flag,5
	jmp	exit
route_6:mov	flag,6
	jmp	exit
route_7:mov	flag,7
	jmp	exit
route_8:mov	flag,8
exit:   mov	ah,4cH
	int 	21H
codes   ends
        end start





