;program title goes here p162_asm

;******************************************
data		segment
  source_buffer	db 	40  dup('a')
data		ends
;******************************************

;******************************************
extra		segment
  dest_buffer	db	40  dup(?)
extra		ends
;******************************************

;******************************************
code		segment
;------------------------------------------
main		proc	far
		assume	cs:code,ds:data,es:extra
start:		
;set up stack for return
		push	ds		
		sub	ax,ax
		push	ax
;set ds register to current data segment		
		mov	ax,data		
		mov 	ds,ax
;seg es register to current extra segment		
		mov	ax,extra	
		mov	es,ax
;main part of program goes here
		lea	si,source_buffer
		lea	di,dest_buffer
		cld				;set DF flag to forward
		mov	cx,40
		rep	movsb
		ret
main		endp
;----------------------------------------------
code		ends
;*********************************************
		end	start