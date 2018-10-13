;samp401，P112
.model small
.stack
.data
	string	db	'Hello,Everybody!',0dh,0ah,'$'
.code
.startup
	mov	dx,offset string
	mov	ah,9
	int	21h			;DOS功能调用，显示字符串
.exit	0
	end