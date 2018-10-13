;p190.asm,优化冒泡法
;******************************************
data	segment
addr	dw	8,5,16,84,32,22,15,39,50,26
savecnt	dw	?				;结果反映排序次数（怎样反映？）。
data	ends
;*******************************************
program	segment
bubble	proc	far
	assume	cs:program,ds:data
start:	push 	ds
	sub	ax,ax
	push	ax
	mov	ax,data
	mov	ds,ax
	mov	cx,10
	mov	savecnt,cx
init:	mov	bx,1			;交换标志，最终为0表进行了交换。
	dec	savecnt			;外层循环计数器
	jz	sorted
	mov	cx,savecnt		;当再次进入外层循环，则最后若干元素已经升序
	mov	di,offset addr-2	;ds:di为串起始地址
next:	add	di,2
	mov	ax,[di]
	cmp	[di+2],ax		;[di+2]-[di]
	jae	cont			;两数已经升序
	xchg	[di+2],ax		;使两数升序
	mov	[di],ax
	sub	bx,bx			;因为交换，bx＝0
cont:	loop	next
	cmp	bx,0			;判是否进行过交换。
	je	init			;因为交换过，转到init继续。
sorted:	ret				;因为未交换，说明已经全部升序。
bubble	endp
program	ends
	end 	start
