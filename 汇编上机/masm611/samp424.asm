;samp424.asm,P158,将字符串中所有大写字母改为小写字母，该字符串以0结束。
.model small
.stack
.data
	string	db	'Hello,EveryBody！',0
.code
.startup
	mov	bx,offset string
again:	mov	al,[bx]
	or	al,al		;是否0
	jz	done
	cmp	al,'A'
	jb	next
	cmp	al,'Z'
	ja	next
	or	al,20h		;改为小写字母
	mov	[bx],al
next:	inc	bx
	jmp	again
done:	.exit	0
end