;samp706.asm,P263.8255A�ڶ���λ����ֵ��16��������B������������߶δ�����ʾ
data	segmeng
	list	db	3fh,06h,5bh,4fh,66h,6dh,7dh,07h,7fh,6fh,77h,7ch,39h,5eh,79h,71h
data	ends
code	segment
	assume	cs:code,ds:data
start:	mov	ax,data
	mov	ds,ax
	mov	al,90h		;10010000��1������֡�001��A�ڷ�ʽ0���롢0��C�ڸ���λ�����00��B�ڷ�ʽ0�����0��C�ڵ���λ���
	mov	dx,0fee3h	;
	out	dx,al
l0:	mov	dx,0fee0h
	in	al,dx		;������״̬��һλ16������
	and	al,0fh
	mov	bx,offset list
	and	ax,00ffh	;and,add,mov����ָ�������xlat���档
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