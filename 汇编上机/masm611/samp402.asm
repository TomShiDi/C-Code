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
	mov 	ds,ax			;�������ݶε���ʼ��ַ
	mov	dx,offset string
	mov	ah,9
	int	21h			;DOS���ܵ��ã���ʾ�ַ���
	mov	ax,4c00h
	int 	21h			;DOS���ܵ��ã�����DOS
code	ends
	end	start