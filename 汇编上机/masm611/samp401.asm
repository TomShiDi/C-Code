;samp401��P112
.model small
.stack
.data
	string	db	'Hello,Everybody!',0dh,0ah,'$'
.code
.startup
	mov	dx,offset string
	mov	ah,9
	int	21h			;DOS���ܵ��ã���ʾ�ַ���
.exit	0
	end