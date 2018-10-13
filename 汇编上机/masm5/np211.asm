;p211,Proadd_4_1_ex_6_4_4_1
;******************************************************
:		source module 1
;
extrn		proadd:far
;
;****************************************************
data		segment	common
		ary	dw 100 dup(?)
		count	dw	100
		sum	dw	?
data		ends
;
;*****************************************************
;
code1		segment
main		proc	far
		assume	cs:code1,ds:data
start:		mov	ax,data
		mov	ds,ax
;
		.
		.
		call	far ptr proadd
		.
		.
		mov ax,4c00h
		int 21h
main		endp
;
code1		ends
;******************************************************
		end	start
;
;******************************************************
;		source module 2
;
public		proadd
;
;******************************************************
data		segment	common
		ary	dw 100 dup(?)
		count	dw	100
		sum	dw	?
data		ends
;
;*****************************************************
;	
code2		segment
proadd		proc	far
		assume	cs:code2,ds:data
		mov	ax,data
		mov	ds,ax
;
		push	ax
		push	cx
		push	si
		lea	si,ary
		mov	cx,count
		xor	ax,ax
next:		add	ax,[si]
		add	si,2
		loop	next
		mov	sum,ax
		pop	si
		pop	cx
		pop	ax
		ret
proadd		endp
;*****************************************************
code2		ends
;
;********************************************************
		end
		