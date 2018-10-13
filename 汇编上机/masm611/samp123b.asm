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
reclen  equ 32
recdpar label byte
maxlen  db 3
actlen  db ?
recdno  db 3 dup(' ')
namefl0 db reclen,?
namefld db reclen dup(' ')
endcde  db 0
row     db 0
col     db 0
prompt  db 13,10,'record number ?$'
opnmsg  db '**** open error ****',13,10,'$'
redmsg  db '**** read error ****',13,10,'$'
press   db 'press anykey continue......$'
inmess  db 13,10,'please enter a string:$'
begin:   mov ax,cseg
        mov ds,ax
        mov es,ax
        call clrscn
        call curs
        call openr
        cmp endcde,0
        jnz exit
loop1:  call recn
        cmp actlen,0
        je exit
        call inputr
        call writer
        cmp endcde,0
        jz loop1
exit:   call clsef
        mov ah,4ch
        int 21h

;---------------------------------
openr   proc
        mov ah,0fh
        lea dx,fcbrec
        int 21h
        cmp al,0
        jnz error
        mov fcbrcsz,reclen
        lea dx,namefld
        mov ah,1ah
        int 21h
        ret
error:  lea dx,opnmsg
        call errm
        ret
openr   endp
;---------------------------------------        
inputr  proc
        mov ah,9
        lea dx,inmess
        int 21h
        inc row
        mov col,23
        call curs
        mov ah,0ah
        lea dx,namefl0
        int 21h
        ret
inputr  endp
;-----------------------------------------------

writer  proc
        mov ah,22h
        lea dx,fcbrec
        int 21h
        mov al,' '
        cld
        lea di,namefld
        mov cx,reclen
        rep stosb
        ret
writer  endp
;-------------------------------------------
recn    proc
        cmp row,24
        jb jumprec
        call clrscn
        call curs
jumprec:mov ah,9
        lea dx,prompt
        int 21h
        mov ah,0ah
        lea dx,recdpar
        int 21h
        inc row
        cmp actlen,1
        jb c3
        ja c1
        sub ah,ah
        mov al,recdno
        jmp c2
c1:     mov ah,recdno
        mov al,recdno+1
c2:     and ax,0f0fh
        aad
        mov word ptr fcbrnrc,ax
c3:     mov col,20
        call  curs
        ret
recn    endp

;---------------------------------
clrscn  proc
        mov bh,7h
        mov ax,0600h
        mov cx,0
        mov dx,184fh
        int 10h
        mov row,0
        mov col,0
        ret
clrscn  endp
;--------------------------------------------------
curs    proc
        mov ah,2
        mov bh,0
        mov dl,col
        mov dh,row
        int 10h
        ret
curs    endp
;--------------------------------------------------
errm    proc
        mov ah,9
        int 21h
        mov endcde,1
        add row,1
        cmp row,24
        jbe jumperr
        call clrscn
        call curs
jumperr:ret
errm    endp
;----------------------------------------------------
clsef   proc
        mov ah,10h
        lea dx,fcbrec
        int 21h
        ret
clsef   endp
;------------------------------------------------
cseg    ends
        end begin


