extrn gensou:far
stack   segment para stack 'stack'
        db 64 dup('stack...')
stack   ends
;------------------------------------------
dseg    segment para 'data'
mus_fre dw 330,294,262,294,330,330,330
        dw 294,294,294,330,392,392
        dw 330,294,262,294,330,330,330,330
        dw 294,294,330,294,262,-1
mus_tim dw 6 dup(125),250
        dw 2 dup(125,125,250)
        dw 12 dup(125),500
dseg    ends
;--------------------------------------------
cseg    segment para 'code'
        assume cs:cseg,ds:dseg,ss:stack
music:  mov ax,dseg
        mov ds,ax
        lea si,mus_fre
        lea bp,ds:mus_tim
freq:   mov di,[si]
        cmp di,-1
        je end_mus
        mov bx,ds:[bp]
        call gensou
        add si,2
        add bp,2
        jmp freq
end_mus:mov ah,4ch
        int 21h
cseg    ends
        end music
