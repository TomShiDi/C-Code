dseg    segment
tab     dw 1,2,3,4,5,6
entry   equ 3
dseg    ends
cseg    segment
        assume cs:cseg,ds:dseg
start:  mov ax,dseg
        mov ds,ax
        mov bx,offset tab
        add bx,entry
        mov cx,[bx]
        mov ah,4ch
        int 21h
cseg    ends
        end start
