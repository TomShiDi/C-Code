.MODEL	small			;采用小型模式
    	.stack
	.data
qvar	dq  	1234567887654321H
	.CODE			
    	.STARTUP           		
        mov	ax,ds
	mov	es,ax
	mov	si,offset qvar+6
	mov	di,offset qvar+7
	mov	cx,7
	std
rep	movsb
    	mov	byte ptr qvar,0
	.EXIT 0
END 
