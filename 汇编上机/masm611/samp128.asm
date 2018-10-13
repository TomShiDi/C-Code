cseg    segment para 'code'
        assume cs:cseg,ds:cseg,ss:cseg,es:cseg
        org 100h
begin:  jmp main
;----------------------------
recdin  db 512 dup(' ')
endcde  db 0
curadr  dw 0304h
endadr  dw 0501h
redmsg  db '**** read error ***$'
side    db 0
;-------------------------------------------
main:   mov ax,cseg
        mov ds,ax
        mov es,ax
        mov ax,600h
repeat: call scren
        call curs
        call addrs
        mov cx,curadr
        mov dx,endadr
        cmp cx,dx
        je exit
        call reads
        cmp endcde,0
        jnz exit
        call disps
        mov ah,7
        int 21h
        jmp repeat
exit:   mov ax,4c00h
        int 21h
;---------------------------------------------
addrs   proc
        mov cx,curadr
        cmp cl,19
        jne return
        cmp side,0
        je chs
        inc ch
chs:    xor side,01
        mov cl,1
        mov curadr,cx
return: ret
addrs   endp
;-----------------------------------------------
reads   proc
        mov al,1
        mov ah,2
        lea bx,recdin
        mov cx,curadr
        mov dh,side
        mov dl,0
        int 13h
        cmp ah,0
        jz incrt
        mov endcde,1
        call errm
incrt:  inc curadr
        ret
reads   endp
;-----------------------------------------------
disps   proc
        mov ah,40h
        mov bx,1
        mov cx,512
        lea dx,recdin
        int 21h
        ret
disps   endp
;---------------------------------------------
scren   proc
        mov ax,600h
        mov bh,1eh
        mov cx,0
        mov dx,184fh
        int 10h
        ret
scren   endp
;-----------------------------------------------
curs    proc
        mov ah,2
        mov bh,0
        mov dx,0
        int 10h
        ret
curs    endp
;-------------------------------------------------
errm    proc
        mov ah,40h
        mov bx,1
        mov cx,20
        lea dx,redmsg
        int 21h
        ret
errm    endp
;-------------------------------------------
cseg    ends
        end begin


