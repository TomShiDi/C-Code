.MODEL	small			;采用小型模式
    	.stack
	.data
msg	db	'Input number(1-8)',0dh,0ah,'$'
msg1	db	'   Chapter1 :Fundamentals                        。', 0dh,0ah,'$'
msg2	db	'   Chapter2 :80x86                       。',0dh,0ah,'$'
msg3	db	'   Chapter3 :statements                        。',0dh,0ah,'$'
msg4	db	'   Chapter4 :Basic                        。',0dh,0ah,'$'
msg5	db	'   Chapter5 :advanced                        。',0dh,0ah,'$'
msg6	db	'   Chapter6 :32bit                         。',0dh,0ah,'$'	
msg7	db	'   Chapter7 :Mixed                        。',0dh,0ah,'$'
msg8	db	'   Chapter8 :Instructions                         。',0dh,0ah,'$'
table	dw	disp1,disp2,disp3,disp4,disp5,disp6,disp7,disp8
						;造表，8路处理人口偏移地址
	.CODE			
    	.STARTUP           		
start1:	mov	dx,offset msg
	mov	ah,9
	int	21h				;输出提示字符串
	mov	ah,1
	int	21h
	cmp	al,'1'
	jb	start1				;输入非法字符
	cmp	al,'8'
	ja	start1				;输入非法字符
	and	ax,0fh
	dec	ax
	shl	ax,1
	mov	bx,ax
	jmp	table[bx]			;表中第N项，间接转移
start2:	mov	ah,9	
	int	21h
	.EXIT 0
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
END 
