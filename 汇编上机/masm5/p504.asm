;利用FCB顺序写磁盘文件。
stack   segment para stack 'stack'
        dw 80 dup(?)

stack   ends
;------------------------------------------------------
dseg    segment para 'data'
abcdef  dw 'a'
reclen  equ 32
namepar label byte
maxlen  db reclen	;输入缓冲区。
namelen db ?
namedta db reclen dup(' ')	;DTA
;
fcbrec  label byte		;FCB
fcbdriv db 0
febname db 'NAMEFILE'
fcbext  db 'DAT'
fcbblk  dw 0
fcbrcsz dw ?
fcbflsz dd ?
        dw ?
        dt ?
fcbsqrc db 0
        dd ?
crlf    db 13,10,'$'
errcde  db 0
prompt  db 'name?$'
row     db 1
opnmsg  db '**** open error ****$'
wrtmsg  db '**** write error ****$'
dseg    ends

;------------------------------------
cseg    segment para 'code'
        assume cs:cseg,ds:dseg,ss:stack,es:dseg
begin:   mov ax,dseg
        mov ds,ax
        mov es,ax
        mov ah,6
        mov al,0
        call scro	;清屏
        call curs	;设置光标
        call openf	;打开指定文件。
        cmp al,0ffh
        jnz jump
        call createf	;创建文件
jump:   cmp errcde,0
        jnz exit
contin: call inputf	;提示、输入并写入文件
        cmp namelen,0
        jnz contin
        call clsef	;关闭文件
;
exit:   mov ah,4ch
        int 21h

;---------------------------------
openf   proc
        mov ah,0fh
        lea dx,fcbrec
        int 21h
        push ax
        cmp al,0ffh
        jz exit0
        mov fcbrcsz,reclen
        lea dx,namedta
        mov ah,1ah
        int 21h

exit0:  pop ax
        ret
openf   endp
;---------------------------------------        

createf proc
        mov ah,16h
        lea dx,fcbrec
        int 21h
        cmp al,0
        jnz err1
        mov fcbrcsz,reclen
        lea dx,namedta
        mov ah,1ah
        int 21h
        ret
err1:   lea dx,opnmsg
        call errm
        ret
createf  endp

;-----------------------------------------
inputf  proc
        mov ah,9
        lea dx,prompt
        int 21h
        mov ah,0ah
        lea dx,namepar
        int 21h
        call disp
        cmp namelen,0
        jnz blank
        ret
blank:  mov bh,0
        mov bl,namelen
        mov namedta[bx],' '
        call writef
        cld
        lea di,namedta
        mov cx,reclen/2
        mov ax,2020h
        rep stosw
        ret
inputf  endp
;-------------------------------------
disp    proc
        mov ah,9
        lea dx,crlf
        int 21h
        cmp row,18h
        jnz pass
        inc row
        ret
pass:   mov ax,0601h
        call  scro
        call curs
        ret
disp    endp
;-----------------------------------------------
writef  proc
        mov ah,15h
        lea dx,fcbrec
        int 21h
        cmp al,0
        jz valid
        lea dx,wrtmsg
        call errm
        mov namelen,0
valid:  ret
writef  endp
;----------------------------------------------------
clsef   proc
        mov namedta,1ah
        call writef
        mov ah,10h
        lea dx,fcbrec
        int 21h
        ret
clsef   endp
;-------------------------------------------------------
scro    proc
        mov bh,1eh
        mov cx,0
        mov dx,184fh
        int 10h
        ret
scro    endp
;--------------------------------------------------
curs    proc
        mov ah,2
        mov bh,0
        mov dl,0
        mov dh,row
        int 10h
        ret
curs    endp
;--------------------------------------------------
errm    proc
        mov ah,9
        int 21h
        mov errcde,1
        ret
errm    endp
;----------------------------------------------------
cseg    ends
        end begin


