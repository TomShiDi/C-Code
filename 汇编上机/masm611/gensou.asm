public  gensou

cseg    segment para 'code'
        assume cs:cseg
gensou  proc  far
        push ax
        push bx
        push cx
        push dx
        push di
        mov al,0b6h
        out 43h,al
        mov dx,12h
        mov ax,533h*896
        div di
        out 42h,al
        mov al,ah
        out 42h,al
        in al,61h
        mov ah,al
        or al,3
        out 61h,al
wait1:  mov cx,0ffffh
delay:  loop delay
        dec bx
        jnz wait1
        mov al,ah
        out 61h,al
        pop di
        pop dx
        pop cx
        pop bx
        pop ax
        ret
gensou  endp
cseg    ends
        end






