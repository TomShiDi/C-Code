;p228_n.asm,�򵥵���Ϣ����ϵͳ��
;����crlf���̣�ʹ��������ʾ��
;
;***********************************************
data	segment
;
msg0	db	' I like my IBM-PC---------------'
msg1	db	' 8088 programming is fun--------'
msg2	db	' Time to buy more dikettes------'
msg3	db	' This program work--------------'
msg4	db	' Turn off that printer----------'
msg5	db	' I have more memory than you----'
msg6	db	' The PSP can be useful----------'
msg7	db	' BASIC was easier than is-------'
msg8	db	' DOS is indispensable-----------'
msg9	db	' Last message of the day--------'
;
errmsg	db	' Error!!!invalid parameter!!!---'
;
strlen	db	32,0
;
data	ends
;************************************************
;
;************************************************
;
stack	segment
	db	256 dup(0)
tos	label	word
stack	ends
;
;************************************************
;
;************************************************
;
code	segment
	assume	cs:code,ds:data,ss:stack
start:	mov	ax,stack
	mov	ss,ax
	mov	sp,offset tos
;
	mov	ax,data
	mov 	ds,ax
;
begin:	mov	ah,1
	int 	21h
	sub	al,'0'
	jc	error
	cmp	al,9
	ja	error
;
	mov	bx,offset msg0
	mul	strlen
	add	bx,ax
	call	display
	jmp	begin
;
error:	mov	bx,offset errmsg
	call	display
;
	mov	ax,4c00h
	int	21h
;
;
;----------------------------------------------
;��������display
;���ܣ���ʾ��Ϣ������Ϣ��
;��ڲ�������Ϣ����ʼ��ַ��bx�С�
;����ֵ���ޡ�
;
display	proc	near
	mov	cx,word ptr strlen
disp1:	mov	dl,[bx]
	call	disp_ch
	inc	bx
	loop	disp1
	call	crlf
	ret
display	endp
;
;-------------------------------------------------
;
;-------------------------------------------
;��������crlf
;���ܣ���ʾ�س������С�
;��ڲ������ޡ�
;����ֵ���ޡ�
;
crlf	proc	near
	push	cx
	mov	dl,0dh
	mov	ah,2
	int	21h
	mov	dl,0ah
	mov	ah,2
	int 	21h
	pop	cx
	ret
crlf	endp
;-------------------------------------------
;==================================================
;��������disp_ch
;���ܣ���ʾһ���ַ���
;��ڲ�����Ҫ��ʾ�ַ���dl�С�
;����ֵ���ޡ�
;
disp_ch	proc	near
	mov	ah,2
	int 	21h
	ret
disp_ch	endp
;
;==================================================
;
code	ends
;**************************************************
	end	start
