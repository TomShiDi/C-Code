datas   segment
bin_dig db 16 dup(?),'B$'
hex_dig db 4 dup(?)
hex_str db 0dh,0ah,4 dup(?),'H=$'
mess1   db 0dh,0ah,'Please enter a hexadecimal_bit:$'
datas   ends

codes   segment
        assume cs:codes,ds:datas
start:  mov ax,datas
        mov ds,ax
        mov cx,4
        lea si,hex_str+2
        lea di,hex_dig
loop1:  lea dx,mess1
        mov ah,09h
        int 21h
        mov ah,1
        int 21h
        mov ah,al
        sub al,30h
        jb loop1                ;<'0',input error
        cmp al,09
        jbe cont1               ;'0'--'9'
        cmp al,36h
        ja loop1                ;>'f',input error
        cmp al,31h
        jb cont
        sub al,27h              ;'a'<=(al)<='f'
        jmp cont1
cont:   cmp al,16h
        ja loop1                ;'F'<(al)<'a',input error
        cmp al,11h
        jb loop1                ;'9'<(al)<'A',input error
        sub al,7                ;'A'<=(al)<='F'
cont1:  mov [di],al
        mov [si],ah
        inc si
        inc di
        loop loop1
        lea di,bin_dig
        lea si,hex_dig
        mov cl,4
        mov bh,4
loop2:  mov bl,[si]
        mov ch,cl
        shl bl,cl
loop3:  mov al,30h
        shl bl,1
        adc al,0
        mov [di],al
        inc di
        dec ch
        jnz loop3
        inc si
        dec bh
        jnz loop2
        lea dx,hex_str
        mov ah,09h
        int 21h
        lea dx,bin_dig
        mov ah,09h
        int 21h
        mov ah,4ch
        int 21h
codes   ends
        end start





