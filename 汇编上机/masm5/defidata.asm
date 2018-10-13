;定义数据例子
const1		equ	100
data		segment
bvar		DB 16
wvar		DW 4*3
dvar		DD 4294967295	;＝232－1
qvar		DQ ?
		DB 1,2,3,4,5 	;“1”的地址为qvar+8
Tvar		DT 2345		;定义了BCD码2345H
abc		DB 'a','b','c'
msg		DB 'Hello',13,10,'$'
bbuf		DB 12 DUP('month')
dbuf		DD 25 DUP(?)	 ; 甚至可嵌套
dbufend		dd ?
data		ends
code	segment
	assume	cs:code,ds:data
main	proc	far
start:	push	ds
	sub	ax,ax
	push	ax
	mov	bx,data
	mov	ds,bx
	mov	ax,const1
	lea	bx,byte ptr  bvar
	lea	bx,byte ptr  wvar
	lea	bx,byte ptr  dvar
	lea	bx,byte ptr  qvar
	lea	bx,byte ptr  tvar
	lea	bx,byte ptr  abc
	lea	bx,byte ptr  bbuf
	lea	bx,byte ptr  dbuf
	lea	bx,byte ptr  dbufend
	ret	
main	endp
code	ends
	end 	start