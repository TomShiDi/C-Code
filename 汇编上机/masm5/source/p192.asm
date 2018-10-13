;p192.asm,增序正数数组中查找一个正数，折半查找。
;有则将其序号送si，cf←0；否则cf←1。
;*******************************************
data	segment
array	dw	10,3,5,15,23,37,49,52,65,78,99
n	dw 	32
low_idx	dw	?
hi_idx	dw	?
data	ends
;*******************************************
program	segment
main	proc	far
	assume	cs:program,ds:data
start:	push 	ds
	sub	ax,ax
	push	ax
	mov	ax,data
	mov	ds,ax		;固定模式
	mov	es,ax
	mov	ax,n		;检索对象
	mov	di,array
	cmp	ax,[di+2]
	ja	chk_la		;比首元素大，继续查找。
	lea	si,es:[di+2]	;找到，且cf＝0，si为元素地址。
	je	exit
	stc			
	jmp	exit		;cf=1,未找到。
chk_la:	mov	si,es[di]	;di所指为元素个数。
	shl	si,1		;因为是字，所以乘2
	add	si,di		;即si指向最后元素。
	cmp	ax,es:[si]	
	jb	search		;比末元素小，继续查找。
	je	exit		;找到，且cf＝0，si为元素地址。
	stc
	jmp	exit		;cf=1,未找到。
search:	mov	low_idx,1	;low_idx←1，初值。
	mov	bx,es:[di]
	mov 	hi_idx,bx	;hi_idx←元素个数，初值。
	mov	bx,di
mid:	mov	cx,low_idx	;新左端。
	mov	dx,hi_idx	;新右端。
	cmp	cx,dx		
	ja	nomatch		;左端超过右端，即未找到。
	add	cx,dx		;折半。
	shr	cx,1		;(左端＋右端)/2。
	mov	si,cx
	shl	si,1
compare:cmp	ax,es:[bx+si]	;和中间的比较。
	je	exit		;相等，找到。
	ja	higher		
	dec	cx		;在低一半。
	mov	hi_idx,cx	;中端作右端。
	jmp	mid
higher:	inc	cx		;在高一半。
	mov	low_idx,cx	;中端作左端。
	jmp	mid
nomatch:stc
exit:	ret
main	endp
program	ends
	end start