;p237.asm ��λ�����룺С��32λ��λ������洢���д�λ���С�
;Ҫ����λ����bitsg�У�Ϊ�Ҷ���λ���������ɷ��ų���bigsg_lָ����
;��λ����string�У���ΪҪ������Ӵ�׼����sg_end��˫�ֵ�Ԫ��
;��bitsg_l��Ϊ16��bit_off��Ϊ60��Ϊ�����׶Աȡ�
;
;*********************************************************
;
	.model	small
	.386
	.stack	200h
;
;*********************************************************
;
	bitsg_l=16
;
;*********************************************************
;
	.data
	align	16
bitsg	dd	7fffh
string	dd	12345678h,12345678h,12345678h,12345678h
sg_end	dd	?
bit_off	dd	60
;
;*********************************************************
;
	.code
;---------------------------------------------------------
start:	mov	ax,@data
	mov	ds,ax
	mov	es,ax
;
	mov	cx,bitsg_l
	cmp	cx,0
	je	exit
	cmp	cx,32
	jae	exit
	mov	edi,bit_off
	mov	ecx,(sg_end-string)/4
	shl	ecx,5
	cmp	edi,ecx
	ja	exit
	jb	move
	mov	esi,bitsg
	mov	sg_end,esi
	jmp	exit
;
move:	call 	mov_str
	call	insert
;
exit:	mov	ax,4c00h
	int 	21h
;-----------------------------------------------------------
;
;-----------------------------------------------------------
;��������mov_str
;���ܣ��ڴ�λ������bit_offָ��λ���󷽳���Ϊbitsg_lλ���ơ�
;��ڲ�������λ����ַstring��bit_off��bitsg_l
;����ֵ����
;�㷨��ʹ��32λָ���shld��stosd��
mov_str	proc	near
	sub	eax,eax
	std
	mov	si,offset sg_end-4
	mov	di,offset sg_end
	mov	ecx,(sg_end-string)/4
	mov	ebx,bit_off
	shr	ebx,5
	sub	ecx,ebx
;
next:	mov	ebx,[si]
	shld	eax,ebx,bitsg_l
	stosd
	mov	eax,ebx
	sub	si,4
	loop	next
	sub	ebx,ebx
	sub	edx,edx
	mov	ecx,bit_off
	and	cl,1fh
	shrd	ebx,eax,cl
	shld	eax,ebx,cl
	shl	eax,bitsg_l
	mov	ebx,-1
	shl	ebx,cl
	and	eax,ebx
	or	eax,edx
	mov	[edi],eax
	ret
mov_str	endp
;
;------------------------------------------------------
;��������insert
;���ܣ����Ӵ�����mov_str�Ƴ��Ŀ��С�
;��ڲ������Ӵ���ַ��bit_off����λ����ַstring��bitsg_l
;����ֵ����
;
;
insert	proc	near
	mov	esi,bitsg
	mov	edi,bit_off
	mov	ecx,edi
	shr	edi,5
	shl	edi,2
	and	cl,1fh
	mov	eax,string
	mov	edx,string+4[edi]
	mov	ebx,eax
	shrd	eax,edx,cl
	shrd	edx,ebx,cl
	shrd	eax,esi,bitsg_l
	rol	eax,bitsg_l
	mov	ebx,eax
	shld	eax,edx,cl
	shld	edx,ebx,cl
	mov	string[edi],eax
	mov	string+4[edi],edx
	ret	
insert	endp
;
;----------------------------------------------------------
;
;***********************************************************
;	
	end	start