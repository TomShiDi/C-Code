;exer3_40.asm,�ж�ת�Ʒ�֧��
;��Ӧִ�з�֧�Ŵ�flag���顣
;
data	segment
ary1	dw	147bh,0b568h,42c8h,0d023h,94b7h
ary2	dw	89dch,54b7h,608dh,9fd0h,b568h
flag	dw	5 dup(?)
data	ends
;
;
code	segment
	assume	cs:code,ds:data
start:	mov	ax,data
	mov 	ds,ax
;
	mov	si,0
	mov	cx,5
next:	mov	ax,ary1[si]
	add	ax,ary2[si]
	jno	l1
	jnc	l2
	sub	ax,ary2[si]
	jnc	l3
	jno	l4
;
	mov	flag[si],5
	jmp	continu
;
l1:	mov	flag[si],1
	jmp	continu
;
l2:	mov	flag[si],2
	jmp	continu
;
l3:	mov	flag[si],3
	jmp	continu
;
l4:	mov	flag[si],4
;
continu:inc	si
	inc	si
	loop	next
;
	mov 	ax,4c00h
	int	21h
;
code	ends
	end	start