dataseg segment
data    dw 0,0ch,11h,22h,33h,44h,55h,66h,77h,88h,99h,111h,222h,333h
dataseg ends


codeseg segment
        assume cs:codeseg,ds:dataseg
start:	mov ax,dataseg
	mov ds,ax
        lea di,data+02
        mov si,[di]
	add si,si
	add si,di
	add di,2
	mov ax,11
	cmp ax,[di]
	jb exitno
	ja cont
	mov si,di
	jmp exityes
cont:   cmp ax,[si]
        ja exitno
	je exityes
again:  mov bx,di
        add bx,si
	shr bx,1
	shr bx,1
	shl bx,1
	cmp ax,[bx]
	ja above
	jb below
	mov si,bx
	jmp exityes
above:  cmp bx,di
        je exitno
	mov di,bx
	jmp again
below:  cmp si,bx
        je exitno
	mov si,bx
	jmp again
exitno: stc 
        jmp exit
exityes:clc
        mov data,si
exit:   mov ah,4ch
        int 21h
codeseg ends
        end start
	

