;program title goes here p146_asm

;******************************************
data		segment
  datax		dw 0148h,2316h
  datay		dw 0237h,4052h
  dataz		dw 0,0,0,0
data		ends

;******************************************
code		segment
;------------------------------------------
main		proc	far
		assume	cs:code,ds:data
start:		
;set up stack for return
		push	ds		
		sub	ax,ax
		push	ax
;set ds register to current data segment		
		mov	ax,data		
		mov 	ds,ax
;main part of program goes here
		mov 	ax,datax
		mul	datay
		mov	dataz,ax
		mov	dataz+2,dx
;******************************************
		mov	ax,datax+2
		mul	datay
		add	dataz+2,ax
		adc	dataz+4,dx
		adc	dataz+6,0
;******************************************
		mov	ax,datax
		mul	datay+2
		add	dataz+2,ax
		adc	dataz+4,dx
		adc	dataz+6,0
;******************************************
		mov	ax,datax+2
		mul	datay+2
		add	dataz+4,ax
		adc	dataz+6,dx
		ret
main		endp
;----------------------------------------------
code		ends
;*********************************************
		end	start