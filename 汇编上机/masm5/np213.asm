;p213£¬Àý6.6
;		source module 1
;***********************************************
extrn		var1:word,output:far
extrn		var2:word
public		exit
;***********************************************
;
local_data	segment
		var	dw 5
		.
local_data	ends
;
;***********************************************
;
code		segment
		assume	cs:code,ds:local_data
;
main		proc	far
start:		mov	ax,local_data
		mov	ds,ax
		.
		.
		mov	bx,var
		mov	ax,seg var1		;¶¯Ì¬¸Ä±äes
		mov	es,ax
		add	bx,es:var1
		.
		.
		mov	ax,seg var2
		mov	es,ax
		sub	es:var2,50
		.
		.
		jmp	output
		.
exit:		mov	ax,4c00h
		int 	21h
main		endp
;
code		ends
;***********************************************
		end 	start
;
;*************************************************
;		source module 2
;
public		var1
;
extdata1	segment
		var1	dw	10
		.
extdata1	ends
;
;************************************************
		.
		.
		.
		end
;
;**************************************************
;		source module 3
;
public		var2
extrn		exit:far
;
extdata2	segment
		var	dw 3
		.
extdata2	ends
;
;
public		output
;
prognam		segment
		assume	cs:prognam,ds:extdata2
		.
		.
output:		jmp	exit
		.
prognam		ends
;
;**************************************************
		end