pusha  macro
loop:   push ax
       push bx
       push dx
       push cx
       jmp out
       endm
popa  macro
      pop cx
      pop dx
      pop bx
      pop ax
      endm
code  segment
      assume cs:code
main: pusha
      popa
      mov ah,4ch
      int 21h
code  ends
      end main

