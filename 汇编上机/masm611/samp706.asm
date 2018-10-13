;samp706.asm,P263.8255A口读四位开关值的16进制数，B口输出共阴极七段代码显示
data	segmeng
	list	db	3fh,06h,5bh,4fh,66h,6dh,7dh,07h,7fh,6fh,77h,7ch,39h,5eh,79h,71h
data	ends
code	segment
	assume	cs:code,ds:data
start:	mov	ax,data
	mov	ds,ax
	mov	al,90h		;10010000，1表控制字、001表A口方式0输入、0表C口高四位输出、00表B口方式0输出、0表C口低四位输出
	mov	dx,0fee3h	;
	out	dx,al
l0:	mov	dx,0fee0h
	in	al,dx		;读开关状态，一位16进制数
	and	al,0fh
	mov	bx,offset list
	and	ax,00ffh	;and,add,mov三条指令可以用xlat代替。
	add	bx,ax
	mov	al,[bx]
	mov	dx,0fee1h
	out	dx,al
	call	dailly
	jmp	l0
	...
dailly	proc
	...
dailly	endp
code	ends
	end start