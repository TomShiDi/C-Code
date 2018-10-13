;p419.利用文件代号随机读取磁盘文件
;
;	
	.model small
;	.386	
	.stack	64
;
;*******************************************
;
	.data
handle	dw	?
recindx	dw	?
errcde	db	0
prompt	db	'record number?'
ioarea	db	32 dup(' ')
pathnam	db	'd:\name.dat',0
openmsg	db	'*** open error ***',0dh,0ah
readmsg	db	'*** read error ***',0dh,0ah
row	db	0
col	db	0
;
recdpar	label	byte
maxlen	db	3
actlen	db	?
recdno	db	3 dup(' ')
;
;*******************************************
;
	.code
	main	proc	far
	mov	ax,@data
	mov	ds,ax
	mov	es,ax
;
	mov	ax,0600h
	call	scrn
	call	curs
	call 	openran
	cmp	errcde,0
	jnz	exit
callsub:call	recnum
	cmp	actlen,0
	je	exit
	call 	readran
	cmp	errcde,0
	jnz	next
	call	disp
next:	jmp	callsub
exit:	mov	ax,4c00h
	int	21h
main	endp
;
;-------------------------------------------
;
;
;
openran	proc
	mov	ah,3dh
	mov	al,0
	lea	dx,pathnam
	int 	21h
	jc	errm1
	mov	handle,ax
	ret
errm1:	mov	errcde,1
	lea	dx,openmsg
	call	errorp
	ret
openran	endp
;
;--------------------------------------------
;
;
;
recnum	proc
	mov	ah,40h
	mov	bx,1
	mov	cx,14
	lea	dx,prompt
	int 	21h
;
	mov	ah,0ah
	lea	dx,recdpar
	int	21h
;
	cmp	actlen,1
	jb	endd
	ja	twodgt
	xor	ah,ah
	mov	al,recdno
	jmp	conv
twodgt:	mov	ah,recdno
	mov	al,recdno+1
conv:	and	ax,0f0fh
	aad
	dec	ax
	mov	cl,05
	shl	ax,cl
	mov	recindx,ax
endd:	mov	col,20
	call	curs
	ret
recnum	endp
;
;-----------------------------------------------------
;
;
;
readran	proc
	mov	ah,42h
	mov	al,0
	mov	bx,handle
	mov	cx,0
	mov	dx,recindx
	int	21h
	jc	errm2
;
	mov	ah,3fh
	mov	bx,handle
	mov	cx,32
	lea	dx,ioarea
	int 	21h
	jc	errm2
	cmp	ioarea,1ah
	je	exit2
	jmp	back
errm2:	lea	dx,readmsg
	call	errorp
exit2:	mov	errcde,1
back:	ret
readran	endp
;
;----------------------------------------------------
;
;
;
disp	proc
	mov	ah,40h
	mov	bx,1
	mov	cx,32
	lea	dx,ioarea
	int 	21h
	mov	col,0
	cmp	row,20
	jae	scrol
	inc	row
	jmp	return
scrol:	mov	ax,0601h
	call	scrn
	call	curs
return:	ret
disp	endp
;
;------------------------------------------------------
;设置屏幕。
;
scrn  	proc
        mov bh,1eh
        mov cx,0
        mov dx,184fh
        int 10h
        ret
scrn    endp
;---------------------------------------------
;设置光标位置。
;
curs    proc
        mov ah,2
        mov bh,0
        mov dh,row
        mov dl,col
        int 10h
        ret
curs    endp
;---------------------------------------------
;显示出错信息。
;
errorp  proc
        mov ah,40h
        mov bx,1
        mov cx,20h
        int 21h
        ret
errorp  endp
;-------------------------------------------------
        end main


