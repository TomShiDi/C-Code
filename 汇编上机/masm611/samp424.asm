;samp424.asm,P158,���ַ��������д�д��ĸ��ΪСд��ĸ�����ַ�����0������
.model small
.stack
.data
	string	db	'Hello,EveryBody��',0
.code
.startup
	mov	bx,offset string
again:	mov	al,[bx]
	or	al,al		;�Ƿ�0
	jz	done
	cmp	al,'A'
	jb	next
	cmp	al,'Z'
	ja	next
	or	al,20h		;��ΪСд��ĸ
	mov	[bx],al
next:	inc	bx
	jmp	again
done:	.exit	0
end