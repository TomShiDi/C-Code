dseg     segment
time0    dw 0,0
timeend  dw 0,0
count    dw 0
mess     db 'The bell is ring!',0dh,0ah,'$'
dseg     ends

cseg     segment
         assume cs:cseg,ds:dseg,es:dseg
start:   mov  ax,dseg
	 mov  ds,ax
	 mov  al,1ch
	 mov  ah,35h
	 int  21h
	 push es
	 push bx
	 push ds
	 mov  dx,offset ring
	 mov  ax,seg ring
	 mov  ds,ax
	 mov  ax,251ch
	 int  21h
	 pop  ds
	 in   al,21h
	 and  al,0feh
	 out  21h,al
	 int  21h
	 sti
         mov  di,7000
delay:   mov  si,0ffffh
delay1:  dec  si
         cmp  count,100
         jae  exit0
         jnz  delay1
	 dec  di
	 jnz  delay
	 pop  dx
	 pop  ds
	 mov  ax,251ch
	 int  21h
exit0:   mov  ah,4ch
         int  21h
;         ret
;main     endp

ring     proc
         push ds
	 push ax
	 push cx
	 push dx
         push bx
         mov  ah,2ch
         int  21h
         mov  time0,cx
         mov  time0+2,dx
         inc  count
         cmp  count,100
         jb   exit
         mov  ah,2ch
         int  21h
         mov  timeend,cx
         mov  timeend+2,dx

exit:    pop  bx
         pop  dx
	 pop  cx
	 pop  ax
	 pop  ds
	 iret
ring     endp
cseg     ends
         end  start
