;p207.asm,˫�ֳ������ӦԪ����ˡ�
;�������ӱ�ַ��ʽ
	.model	small
	.386
	.stack	200H
	.data
data1	dd	1234H,2345H,3456H,4567H,5678H
	dd	6789H,7890H,890aH,90abH,0abcH
data2	dd      1,2,4,8,16,32,64,128,256,512
result	dq	10 dup(?)
	.code
start:	mov	ax,@data
	mov	ds,ax			;�̶�ģʽ
;
	xor	ebx,ebx
	mov	cx,10
back:	mov	eax,data1[ebx*4]
	mul	data2[ebx*4]
	mov	dword  ptr  result[ebx*8],eax
	mov	dword  ptr  result+4[ebx*8],edx
	inc	ebx
	loop 	back
;
	mov	ax,4c00H
	int	21H
	end	start