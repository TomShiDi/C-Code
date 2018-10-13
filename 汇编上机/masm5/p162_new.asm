;program title goes here p162_asm

;******************************************
data_seg		segment
  table		db 	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,40  dup('a')
data_seg		ends
;******************************************

;******************************************
extra		segment
  y		db	40  dup(?)
extra		ends
;******************************************

;******************************************
code		segment
;------------------------------------------
main		proc	far
		assume	cs:code,ds:data_seg,es:extra
start:		
;set up stack for return
		push	ds		
		sub	ax,ax
		push	ax
;set ds register to current data segment		
		mov	ax,data_seg		
		mov 	ds,ax
;seg es register to current extra segment		
		mov	ax,extra	
		mov	bx,ax
		mov	es,bx
		mov     es,ax
		mov	ax,100 mod 2+25*2 
;main part of program goes here
		lea	si,table
		lea	di,y
		cld				;set DF flag to forward
		mov	cx,40
		rep	movsb
		mov	al,'e'
		mov	ah,'E'
		mov	bx,offset table
		mov	ax,word ptr y[bp][si]
		mov	byte ptr [si],0ah
		mov	word ptr [si+2],0bh
		xchg	cx,dx
		xchg	bx,[bp][si]
		mov	bx,offset table
		mov	al,0fH
		xlat		
		ret
main		endp
;----------------------------------------------
code		ends
;*********************************************
		end	start