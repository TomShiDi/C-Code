;p352.asm,�����ַ���,����ʾ���ַ�����
;
;********************************************
;
	.model 	small
	.stack	200h
;==============================================
;
	.data
userstr	db	50,0,50 dup('$')
;==============================================
	.code
start:
	mov	ax,@data
	mov	ds,ax
;
	lea	dx,userstr
	mov	ah,0ah
	int	21h
;
	call	crlf
;
	sub	ch,ch
	mov	cl,userstr+1
	lea	dx,userstr+2
	mov	ah,9
	int	21h
;
exit:	mov	ax,4c00h
	int	21h

;===============================================
;-------------------------------------------
;��������crlf
;���ܣ���ʾ�س��������ӳ���
;��ڲ������ޡ�
;����ֵ���ޡ�
;
;
crlf	proc	near
;
	mov	dl,0dh
	mov	ah,2
	int	21h
	mov	dl,0ah
	mov	ah,2
	int 	21h
;
	ret
crlf	endp
;-------------------------------------------
;***********************************************
	end 	start