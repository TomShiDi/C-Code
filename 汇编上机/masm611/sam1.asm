code segment
     assume  cs:code
main:push ds
     sub ax,ax
     push ax
     mov cx,10
next:mov dl,31h
     mov ah,2
     int 21h
     loop next
     ret
code ends
     end main

