dataseg segment
word_op dw 1234
dataseg ends
 
codeseg segment
        assume cs:codeseg,ds:dataseg
start:	mov ax,dataseg
	mov ds,ax
	sub bx,bx
	mov di,bx
	mov sp,word_op[bx+3*4][di]
	ret
codeseg ends
        end start
	