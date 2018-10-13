;p216,Àý6.7
;
;		source module 1
;
global		segment	public
extrn		var1:word,var2:word
global		ends
;
;****************************************
local_data	segment
		.
		.
local_data	ends
;
;*****************************************
;
code		segment
		assume	cs:code,ds:local_data,es:global
main		proc	far
start:		mov	ax,local_data
		mov	ds,ax,
		mov	ax,global
		mov	es,ax
		.
		.
		mov	bx,es:var1
		add	es:var2,bx
		.
		.
		mov	ax,4c00h
		int	21h
main		endp
;
code		ends
;********************************************
		end	start
;
;
;*******************************************
;		source module	2
;
global		segment	public
public		var1,var2
		var1	dw ?
		var2	dw ?
		.
		.
global		ends
;
;*****************************************
		.
		.
		.
;*****************************************
		end