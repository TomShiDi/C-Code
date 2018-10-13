;œ∞Ã‚3.19



;******************************************
code		segment
;------------------------------------------
main		proc	far
		assume	cs:code
start:		
;set up stack for return
		push	ds		
		sub	ax,ax
		push	ax
		mov 	ax,0
		dec	ax
		INC	ax
		add	ax,7fffh
		add	ax,2
		not	ax
		sub	ax,0ffffh
		add	ax,8000h
		sub	ax,1
		and	ax,58d1h
		sal	ax,1
		sar	ax,1
		neg	ax
		ror	ax,1
		ret
main		endp
;----------------------------------------------
code		ends
;*********************************************
		end	start