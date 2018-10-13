	.model	small
	.386
	.stack	200H
	.data
	align	16
data1	dq	1234567890abcdefH
data2	dq	0fedcba0987654321H
data3	dq	?
	.code
start:	mov	ax,@data
	mov	ds,ax
	mov	eax,dword ptr data1
	add	eax,dword ptr data2
	mov	edx,dword ptr data1+4
	adc	edx,dword ptr data2+4
	mov	dword ptr data3,eax
	mov	dword ptr data3+4,edx
	mov	ax,4c00H
	int	21H
	end	start