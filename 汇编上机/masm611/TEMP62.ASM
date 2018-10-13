
code1 segment
      assume cs:code1
start:mov dl,31h
      call far ptr pro1
      mov ah,4ch
      int 21h
pro1  proc far
      mov ah,2
      int 21h
      inc dl
      call far ptr pro2
      ret
pro2  proc far
      mov ah,2
      int 21h
      ret
pro2  endp
pro1  endp

code1 ends
      end start