;samp423.asm,P157,确定字变量wordx中为1的最低位数（0~15）存入bytex中，若wordx中无1，则将-1存入bytex。
.model small
.stack
.data
	wordx	dw	56	;运行时用e命令改变
	bytex	db	-1
.code
.startup
	mov	ax,wordx
	mov	cx,16
	mov	dl,-1
again:	inc	dl
	test	ax,1
	rcr	ax,1
	loope	again
	je	done
	mov	bytex,dl
done:	.exit	0
end