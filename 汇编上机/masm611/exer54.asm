datas   segment
string1 db 80,81 dup(?)
string2 db 80,81 dup(?)
mess1   db 0dh,0ah,'match$'
mess2   db 0dh,0ah,'no match$'
mess3   db 0dh,0ah,'Please enter a string:$'
datas   ends

codes   segment
        assume cs:codes,ds:datas,es:datas
start:  mov ax,datas
        mov ds,ax
        mov es,ax
        lea dx,string1
        call in_string
        lea dx,string2
        call in_string
        lea si,string1+2
        lea di,string2+2
        mov ch,[si-1]
        mov cl,[di-1]
        cmp ch,cl
        jz compare
        lea dx,mess2
        call out_mess
        jmp exit
compare:sub ch,ch
        lea dx,mess1
        repz cmpsb
        jz next
        lea dx,mess2
next:   call out_mess
exit:   mov ah,4ch
        int 21h

in_string proc
          push dx
          lea dx,mess3
          call out_mess
          pop dx
          mov ah,0ah
          int 21h
          ret
in_string endp

out_mess  proc
          mov ah,09h
          int 21h
          ret
out_mess  endp




codes   ends
        end start


