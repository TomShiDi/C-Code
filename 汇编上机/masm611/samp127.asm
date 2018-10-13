keybd   equ 0
crt     equ 1
prt     equ 4
;--------------------------------
stack   segment para stack 'stack'
        dw 80 dup(?)
stack   ends
;------------------------------------
dseg    segment para 'data'
typbuf  db 130 dup(' ')
errmsg  db '**** error ****',13,10
dseg    ends
;-----------------------------------------
cseg    segment para 'code'
        assume cs:cseg,ds:dseg,ss:stack,es:dseg
main:   mov ax,dseg
        mov ds,ax
        mov es,ax
        sti
        cld
        mov ah,0
        mov dx,0
        int 17h
input:  mov bx,keybd
        mov ah,3fh
        mov cx,130
        lea dx,typbuf
        int 21h
        jc error
        cmp typbuf,0
        je exit
output: mov cx,ax
        mov bx,prt
        mov ah,40h
        int 21h
        jc error
        jmp input
error:  mov bx,crt
        mov ah,40h
        mov cx,17
        lea dx,errmsg
        int 21h
exit:   mov ah,4ch
        int 21h
cseg    ends
        end main
