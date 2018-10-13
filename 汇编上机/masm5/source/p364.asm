;p364.asm,在屏幕上以红底蓝字显示“world”
;然后分别以红底绿字和红底蓝字相间地显示“scenery”。
;
;
	.model small
;
	.data
string1	db	'world '
string2	db	's',42h,'c',41h,'e',42h,'n',41h
	db	'e',42h,'r',41h,'y',42h		;前景2，绿字。
lenstr2	equ	($-string2)/2		;属性字节不计入串长。
;
	.code
start:	mov	ax,@data
	mov	ds,ax
;
	mov	al,3
	mov	ah,0
	int 	10h
;
	mov	bp,seg string1
	mov	es,bp
	mov	bp,offset string1	;串起始地址在es:bp
	mov	cx,string2-string1	;串长度
	mov	dx,0
	mov	bl,41h	;背景0400，红底不闪烁，前景1，蓝字。
	mov	al,1
	mov	ah,13h
	int	10h
;
	mov	ah,3
	int	10h	;读光标当前位置，否则可能覆盖前面输出。
;
	mov	bp,offset string2
	mov	cx,lenstr2
	mov	al,3
	mov	ah,13h
	int	10h
;
	mov	ax,4c00h
	int	21h
;
	end	start