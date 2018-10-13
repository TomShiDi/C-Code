parm_seg   segment
ary        dw 100 dup(?)
count      dw 100
sum        dw ?
parm_seg   ends
  
stack_seg  segment
           dw 100 dup(?)
tos        label word
stack_seg  ends

code1      segment
	   assume cs:code1,ds:parm_seg,ss:stack_seg
   start:  mov  ax,stack_seg
           mov ss,ax
	   mov sp,offset tos
	   sub ax,ax
	   push ax
	   mov ax,parm_seg
	   mov ds,ax
	   mov bx,offset ary
	   push bx
	   mov bx,offset count
	   push bx
	   mov bx,offset sum
	   push bx
	   call far ptr proadd
	   mov ah,4ch
	   int 21h
code1      ends

code2     segment
          assume cs:code2
stack_strc  struc
 save_bp    dw ?
 save_cs_ip dw 2 dup(?)
 par3_addr  dw ?
 par2_addr  dw ?
 par1_addr  dw ?
stack_strc  ends
 proadd    proc far
           push bp
	   mov bp,sp
	   push ax
	   push cx
	   push si
	   push di
	   mov si,[bp].par1_addr
	   mov di,[bp].par2_addr
	   mov cx,[di]
	   mov di,[bp].par3_addr
	   xor ax,ax
  next:    add ax,[si]
           add si,2
	   loop next
	   mov [di],ax
	   pop di
	   pop si
	   pop cx
	   pop ax
	   pop bp
	   ret 6
 proadd    endp
code2     ends
          end start
	  