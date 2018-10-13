;sample402
stack	segment
	dw 	512 dup(?)
stack	ends
data	segment
string	db 	'Hello,Everybody!',0dh,0ah,'$'
data	ends
code	segment	'code'
	assume 	cs:code,ds:data,ss:stack
start:	mov 	ax,data
	mov 	ds,ax			;设置数据段的起始地址
	mov	dx,offset string
	mov	ah,9
	int	21h			;DOS功能调用，显示字符串
	mov	ax,4c00h
	int 	21h			;DOS功能调用，返回DOS
code	ends
	end	start