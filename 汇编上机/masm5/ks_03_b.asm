;exer3_40.asm,判断转移分支。
;相应执行分支号存flag数组。
;
data	segment
ary1	dw	14c8h,0d082h,427bh,3f23h,42h
ary2	dw	808dh,9f70h,60dch,50d0h,0ff3dh
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
	mov	bx,ary2[si]
	add	al,bl
	jo	l1
	jc	l2
	cmp	ah,bh
	jg	l3
	jb	l4
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