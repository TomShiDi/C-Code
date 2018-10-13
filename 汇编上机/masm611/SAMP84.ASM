dseg     segment
count    dw 1
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
         mov  di,30000
delay:   mov  si,0ffffh
delay1:  dec  si
         jnz  delay1
	 dec  di
	 jnz  delay
	 pop  dx
	 pop  ds
	 mov  ax,251ch
	 int  21h
         mov  ah,4ch
         int  21h

ring     proc
         push ds
	 push ax
	 push cx
	 push dx
         push bx
         mov  ax,dseg
         mov  ds,ax
         sti
         dec  count
         jnz  exit
         mov  dx,offset mess
         mov  ah,9
         int  21h
         mov  dx,100
         in   al,61h
         and  al,0fch
sound:   xor  al,2
         out  61h,al
         mov  cx,0ffffh
wait1:   loop wait1
         dec  dx
         jne  sound
         mov  count,182
exit:    cli
         pop  bx
         pop  dx
	 pop  cx
	 pop  ax
	 pop  ds
	 iret
ring     endp
cseg     ends
         end  start
