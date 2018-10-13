;p247.asm,人名排序,使用如下过程。
;b10read:输入人名串。
;d10stor:输入人名串存入人名表中。
;g10sort:人名表中人名串按字母顺序排序。
;k10disp:显示人名表。
;
;
	.model	small
	.stack	40h
;
;************************************************
	.data
namepar	label	byte
maxnlen	db	21
namelen	db	?
namefld	db	21 dup(?)
crlf	db	13,10,'$'
endaddr	dw	?
messg1	db	'Name?',13,10,'$'
messg2	db	'Sorted name:',13,10,'$'
namectr	db	0
nametab	db	30 dup(20 dup(' '))
namesav	db	20 dup(?),13,10,'$'
swapped	db	0
;
;***********************************************
	.code
start: 	mov	ax,@data
	mov	ds,ax
	mov	es,ax
;
	cld
	lea	di,nametab
a20loop:call	b10read
	cmp	namelen,0
	jz	a30
	cmp	namectr,30
	je	a30
	call	d10stor
	jmp	a20loop
;
a30:	cmp	namectr,1
	jbe	a40
	call 	g10sort
	call 	k10disp
;
a40:	mov	ax,4c00h
	int	21h
;
;----------------------------------------------------
;过程名：b10read
;功能：键入人名串存入namepar缓冲区（不够部分用空格代替）。
;入口参数：namepar缓冲区首地址。
;返回值：串存入namepar缓冲区。
;
;
b10read	proc	near
;	
	mov	ah,9
	lea	dx,messg1
	int	21h
;
	mov	ah,0ah
	lea	dx,namepar	
	int	21h
;
	mov	ah,9
	lea	dx,crlf
	int	21h
;
	mov	bh,0
	mov	bl,namelen
	mov	cx,21
	sub	cx,bx
b20:	mov	namefld[bx],20h
	inc 	bx
	loop	b20
	ret
b10read	endp
;
;-------------------------------------------------------
;
;-------------------------------------------------------
;过程名：d10stor
;功能：将namepar缓冲区中一个人名串存入nametab中。
;入口参数：源串首址namefld，目的串首址di中。
;返回值：无。实现人名串保存。
;
d10stor	proc	near
	inc	namectr
	cld
	lea	si,namefld
	mov	cx,10
	rep	movsw
	ret
d10stor	endp
;
;--------------------------------------------------------
;
;--------------------------------------------------------
;过程名：g10sort
;功能：人名串按字母顺序排序
;入口参数；人名表首址nametab，最后的人名串后的空串首址在di。
;返回值：无。
;算法：冒泡排序，设置交换标志swapped，si,di指向相邻两串。
;
g10sort	proc	near
	sub	di,40
	mov	endaddr,di
g20:	mov	swapped,0
	lea	si,nametab
g30:	mov	cx,20
	mov	di,si
	add	di,20
	mov	ax,di
	mov	bx,si
	repe	cmpsb
	jbe	g40
	call	h10xchg
g40:	mov	si,ax
	cmp	si,endaddr
	jbe	g30
	cmp	swapped,0
	jnz	g20
	ret
g10sort	endp
;
;---------------------------------------------------------
;过程名：h10xchg
;功能：交换相邻两串
;入口参数：前一串地址在bx中,临时串首址namesav。传送时si,di分别指向两串
;返回值：无。
;算法：新、旧si/di的衔接；另外设置swapped标志为1
;
;
h10xchg	proc	near
	mov	cx,10
	lea	di,namesav
	mov	si,bx
	rep	movsw
;
	mov	cx,10
	mov	di,bx
	rep	movsw
;
	mov	cx,10
	lea	si,namesav
	rep	movsw
;
	mov	swapped,1
	ret
h10xchg	endp
;
;-------------------------------------------------------------
;
;-------------------------------------------------------------
;过程名：k10disp
;功能：将人名表显示在屏幕上。
;入口参数：提示字符串首址，人名表首址。
;返回值：无
;算法：将人名串依次送到namesav串中，因为它有结束标志。
;
k10disp	proc	near
	mov	ah,9
	lea	dx,messg2
	int	21h
;
	lea	si,nametab
k20:	lea	di,namesav
	mov	cx,10
	rep	movsw
	mov	ah,9
	lea	dx,namesav
	int	21h
;	
	dec	namectr
	jnz	k20
	ret
k10disp	endp
;
;--------------------------------------------------------------
;
;**************************************************************
	end	start


	
