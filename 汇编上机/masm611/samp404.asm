;samp404.asm,P136
.model tiny
.code
.startup
	mov	dx,offset string
	mov 	ah,9
	int	21h
	mov	ah,1
	int	21h
	mov	ah,2
	mov	dl,7
	int	21h
.exit	0
string	db	'PRESS ANY KEY TO CONTINUE!$'
	end