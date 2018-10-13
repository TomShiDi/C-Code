;program title goes here p146com.asm


;******************************************
code		segment
;------------------------------------------
		org 	100H
		assume	cs:code,ds:code,es:code,ss:code
		
start:		
;main part of program goes here
		lea	si,source_buffer
		lea	di,dest_buffer
		cld				;set DF flag to forward
		mov	cx,40
		rep	movsb
		mov	ax,4c00h
		int	21h
source_buffer	db 	40  dup('a')
dest_buffer	db	40  dup(?)
;----------------------------------------------
code		ends
;*********************************************
		end	start