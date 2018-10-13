;p237.asm ，位串插入：小于32位的位串插入存储器中大位串中。
;要插入位串在bitsg中，为右对齐位串，长度由符号常数bigsg_l指定。
;大位串在string中，并为要插入的子串准备了sg_end的双字单元。
;将bitsg_l改为16、bit_off改为60是为了容易对比。
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
;过程名：mov_str
;功能；在大位串中由bit_off指定位置左方长度为bitsg_l位左移。
;入口参数：大位串首址string，bit_off，bitsg_l
;返回值：无
;算法：使用32位指令，如shld，stosd等
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
;过程名：insert
;功能：将子串插入mov_str移出的空中。
;入口参数：子串首址、bit_off、大位串首址string，bitsg_l
;返回值：无
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