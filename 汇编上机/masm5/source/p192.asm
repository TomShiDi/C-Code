;p192.asm,�������������в���һ���������۰���ҡ�
;�����������si��cf��0������cf��1��
;*******************************************
data	segment
array	dw	10,3,5,15,23,37,49,52,65,78,99
n	dw 	32
low_idx	dw	?
hi_idx	dw	?
data	ends
;*******************************************
program	segment
main	proc	far
	assume	cs:program,ds:data
start:	push 	ds
	sub	ax,ax
	push	ax
	mov	ax,data
	mov	ds,ax		;�̶�ģʽ
	mov	es,ax
	mov	ax,n		;��������
	mov	di,array
	cmp	ax,[di+2]
	ja	chk_la		;����Ԫ�ش󣬼������ҡ�
	lea	si,es:[di+2]	;�ҵ�����cf��0��siΪԪ�ص�ַ��
	je	exit
	stc			
	jmp	exit		;cf=1,δ�ҵ���
chk_la:	mov	si,es[di]	;di��ָΪԪ�ظ�����
	shl	si,1		;��Ϊ���֣����Գ�2
	add	si,di		;��siָ�����Ԫ�ء�
	cmp	ax,es:[si]	
	jb	search		;��ĩԪ��С���������ҡ�
	je	exit		;�ҵ�����cf��0��siΪԪ�ص�ַ��
	stc
	jmp	exit		;cf=1,δ�ҵ���
search:	mov	low_idx,1	;low_idx��1����ֵ��
	mov	bx,es:[di]
	mov 	hi_idx,bx	;hi_idx��Ԫ�ظ�������ֵ��
	mov	bx,di
mid:	mov	cx,low_idx	;����ˡ�
	mov	dx,hi_idx	;���Ҷˡ�
	cmp	cx,dx		
	ja	nomatch		;��˳����Ҷˣ���δ�ҵ���
	add	cx,dx		;�۰롣
	shr	cx,1		;(��ˣ��Ҷ�)/2��
	mov	si,cx
	shl	si,1
compare:cmp	ax,es:[bx+si]	;���м�ıȽϡ�
	je	exit		;��ȣ��ҵ���
	ja	higher		
	dec	cx		;�ڵ�һ�롣
	mov	hi_idx,cx	;�ж����Ҷˡ�
	jmp	mid
higher:	inc	cx		;�ڸ�һ�롣
	mov	low_idx,cx	;�ж�����ˡ�
	jmp	mid
nomatch:stc
exit:	ret
main	endp
program	ends
	end start