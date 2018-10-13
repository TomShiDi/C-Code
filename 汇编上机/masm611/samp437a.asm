;samp437.asm,P181,调用子程序求数组校验和送result单元,增强型过程调用，尝试用FAR定义。
.model small
checksumd	proto	far c,:word,:word
.stack	256
.data
	result	db	0
	array	db	56h,23h,37h,78h,0ffh,0,12h,99h,64h,0b0h
		db	78h,80h,23h,1,4,0fh,2ah,46h,32h,42h
	count 	equ	($-array)/type array
.code
.startup
invoke	checksumd,count,offset array
	mov	result,al
.exit	0
;******************************************************
;子程序名:checksumd
;功能：计算字节数组校验和
;入口参数：array为数组名，count为元素个数
;返回值：al为校验和
;说明：除ax/bx/cx外不影响其他寄存器,增强型过程调用
;******************************************************
checksumd	proc	far c uses bx cx,countp:word,arrayp:word
	mov	bx,arrayp		;原本为[bp+6],现在[bp+8]
	mov	cx,countp		;原本为[bp+4]，现在[bp+6]
	xor	al,al
sumd:	add	al,[bx]
	inc	bx
	loop	sumd
	ret
checksumd	endp
end