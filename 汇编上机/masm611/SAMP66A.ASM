stack_strc  struc
 save_bp    dw ?
 save_cs_ip dw 2 dup(?)
 par3_addr  dw ?
 par2_addr  dw ?
 par1_addr  dw ?
stack_strc  ends

parm_seg   segment
ary        dw 100 dup(?)
count      dw 100
sum        dw ?
struct1     stack_strc <>
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
	   mov struct1.par1_addr,bx
	   mov bx,offset count
	   mov struct1.par2_addr,bx
	   mov bx,offset sum
	   mov struct1.par3_addr,bx
	   call far ptr proadd
	   mov ah,4ch
	   int 21h
code1      ends

code2     segment
          assume cs:code2

 proadd    proc far
           push bx
	   lea bx,struct1
	   push ax
	   push cx
	   push si
	   push di
	   mov si,[bx].par1_addr
	   mov di,[bx].par2_addr
	   mov cx,[di]
	   mov di,[bx].par3_addr
	   xor ax,ax
  next:    add ax,[si]
           add si,2
	   loop next
	   mov [di],ax
	   pop di
	   pop si
	   pop cx
	   pop ax
	   pop bx
	   ret 
 proadd    endp
code2     ends
          end start
	  