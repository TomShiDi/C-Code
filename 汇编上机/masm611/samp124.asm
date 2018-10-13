;------------------------------------------------------
cseg    segment para 'code'
        assume cs:cseg,ds:cseg,ss:cseg,es:cseg
        org 100h
        jmp begin
fcbrec  label byte
fcbdriv db 0
febname db 'NAMEFILE'
fcbext  db 'DAT'
fcbblk  dw 0
fcbrcsz dw 0
        dd ?
        dw ?
        dt ?
        db 0
fcbrnrc dd 0
endcode db 0
norecs  dw 140
opnmsg  db '**** open error ****',13,10,'$'
redmsg  db '**** read error ****',13,10,'$'
rowctr  db 0
reclen  equ 20h
dskrecs db 5120 dup(?),'$'
begin:   mov ax,cseg
        mov ds,ax
        mov es,ax
        call clrscn
        call curs
        call openb
        cmp endcode,0
        jnz exit
        call readb
        call  dispb
exit:   mov ah,4ch
        int 21h

;---------------------------------
openb   proc
        mov ah,0fh
        lea dx,fcbrec
        int 21h
        cmp al,0
        jnz error
        mov fcbrcsz,reclen
        lea dx,dskrecs
        mov ah,1ah
        int 21h
        ret
error:  lea dx,opnmsg
        call errm
        ret
openb   endp
;---------------------------------------        
;-------------------------------------
readb   proc
        mov ah,27h
        mov cx,norecs
        lea dx,fcbrec
        int 21h
        mov endcode,al
        ret
readb   endp
;----------------------------------
dispb   proc
        mov ah,9
        lea dx,dskrecs
        int 21h
        ret
dispb   endp
;---------------------------------
clrscn  proc
        mov bh,7h
        mov ax,0600h
        mov cx,0
        mov dx,184fh
        int 10h
        ret
clrscn  endp
;--------------------------------------------------
curs    proc
        mov ah,2
        mov bh,0
        mov dl,0
        mov dh,rowctr
        int 10h
        inc rowctr
        ret
curs    endp
;--------------------------------------------------
errm    proc
        mov ah,9
        int 21h
        mov endcode,1
        ret
errm    endp
;----------------------------------------------------
cseg    ends
        end begin


