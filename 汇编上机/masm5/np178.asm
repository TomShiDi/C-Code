;p 178.asm,�������������в���һ���������۰���ҡ�
;�����������si����flag��Ԫ��cf��0������cf��1��flag��Ԫ��-1��
;*******************************************
data	segment
array	dw	10,3,5,15,23,37,49,52,65,78,99
n	dw 	32
flag	dw	0
low_idx	dw	?
hi_idx	dw	?
data	ends
;*******************************************
program	segment
main	proc	far
	assume	cs:program,ds:data,es:data
start:	push 	ds
	sub	ax,ax
	push	ax
	mov	ax,data
	mov	ds,ax		;�̶�ģʽ
	mov	es,ax
	mov	ax,n		;��������
	mov	di,offset array	;û��offset��
	cmp	ax,es:[di+2]
	ja	chk_la		;����Ԫ�ش󣬼������ҡ�
	lea	si,es:[di+2]	;�ҵ�����cf��0��siΪԪ�ص�ַ��
	je	found
	stc			
	jmp	nomatch		;cf=1,δ�ҵ���
chk_la:	mov	si,es:[di]	;di��ָΪԪ�ظ�����
	shl	si,1		;��Ϊ���֣����Գ�2
	add	si,di		;��siָ�����Ԫ�ء�
	cmp	ax,es:[si]	
	jb	search		;��ĩԪ��С���������ҡ�
	je	found		;�ҵ�����cf��0��siΪԪ�ص�ַ��
	stc
	jmp	nomatch		;cf=1,δ�ҵ���
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
	je	found		;��ȣ��ҵ���
	ja	higher		
	dec	cx		;�ڵ�һ�롣
	mov	hi_idx,cx	;�ж����Ҷˡ�
	jmp	mid
higher:	inc	cx		;�ڸ�һ�롣
	mov	low_idx,cx	;�ж�����ˡ�
	jmp	mid
nomatch:mov	flag,-1
	stc
	ret
found:	mov 	flag,si
	ret
main	endp
program	ends
	end start