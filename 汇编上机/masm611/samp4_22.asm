.MODEL	small			;����С��ģʽ
    	.stack
	.data
sum	dw	?
	.CODE			
    	.STARTUP           		
        sub	ax,ax			;�ۼ�����0		;
	mov	cx,100
again:	add	ax,cx
	loop	again
	mov	sum,ax			;����5050=13BAH
done:	.EXIT 0
END 
