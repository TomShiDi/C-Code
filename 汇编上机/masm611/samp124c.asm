dseg    segment
buff    db 2048 dup(?),'$'
dseg    ends
cseg    segment
        assume cs:cseg,ds:dseg
begin:  mov ax,dseg
        mov ds,ax
        mov al,0
        lea bx,buff
        mov cx,5
        mov dx,11
        int 25h
        mov ah,4ch
        int 21h
cseg    ends
        end begin

