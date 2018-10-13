		.model	small
		.code
		public	weekpay
weekpay	proc 	near c 	address:word
		push	si
		sub	ax,ax
		mov	cx,5
		mov	si,address
again:		add	al,[si]
		adc	ah,0
		inc	si
		inc	si
		loop	again
		pop	si
		ret
weekpay		endp
		end