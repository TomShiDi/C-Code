;samp421.asm,P155,根据键盘输入1~8数字转向8个不同的处理。
.model small
.stack
.data
msg	db 	'Input number(1~8):',0dh,0ah,'$'
msg1	db	'Chapter 1:Fundamentals of Assembly Language',0dh,0ah,'$'
msg2	db	'Chapter 2:80x86 Instruction Set',0dh,0ah,'$'
msg3	db	'Chapter 3:Statements of Assembly Language',0dh,0ah,'$'
msg4	db	'Chapter 4:Basic Assembly Language Programming',0dh,0ah,'$'
msg5	db	'Chapter 5:Advansed Assembly Language Programming',0dh,0ah,'$'
msg6	db	'Chapter 6:32-bit Instructions and Programming',0dh,0ah,'$'
msg7	db	'Chapter 7:Mixed Programming with c/c++',0dh,0ah,'$'
msg8	db	'Chapter 8:FP Instructions and Programming',0dh,0ah,'$'
table	dw	disp1,disp2,disp3,disp4,disp5,disp6,disp7,disp8
.code
.startup
start1:	mov 	dx,offset msg
	mov	ah,9
	int	21h
	mov 	ah,1
	int	21h
	cmp	al,'1'
	jb	start1
	cmp	al,'8'
	ja	start1
	and	ax,0fh
	dec	ax
	shl	ax,1
	mov	bx,ax
	jmp	table[bx]
start2:	mov	ah,9
	int 	21h
.exit	0
disp1:	mov	dx,offset msg1
	jmp	start2
disp2:	mov	dx,offset msg2
	jmp	start2
disp3:	mov	dx,offset msg3
	jmp	start2
disp4:	mov	dx,offset msg4
	jmp	start2
disp5:	mov	dx,offset msg5
	jmp	start2
disp6:	mov	dx,offset msg6
	jmp	start2
disp7:	mov	dx,offset msg7
	jmp	start2
disp8:	mov	dx,offset msg8
	jmp	start2
end