.MODEL	small			;采用小型模式
    	.stack
	.data
sum	dw	?
	.CODE			
    	.STARTUP           		
        sub	ax,ax			;累加器清0		;
	mov	cx,100
again:	add	ax,cx
	loop	again
	mov	sum,ax			;存结果5050=13BAH
done:	.EXIT 0
END 
