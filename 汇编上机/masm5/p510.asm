;利用FCB顺序读磁盘文件
；
stack   segment para stack 'stack'
        dw 80 dup(?)
stack   ends
;------------------------------------------------------
dseg    segment para 'data'
fcbrec  label byte	;FCB
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
;
reclen  equ 32
namefld db reclen dup(' '), 13,10,'$'	;DTA
endcde  db 0
row     db 0
opnmsg  db '**** open error ****$'
redmsg  db '**** write error ****$'
press   db 'press anykey continue......$'
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
        call openf	;打开文件
        cmp endcde,0	;
        jnz exit
loop1:  call readf	;读文件记录到DTA
        cmp endcde,0
        jnz exit
        call disp	;显示读出记录
        jmp loop1
;
exit:   mov ah,4ch
        int 21h

;---------------------------------
;打开文件，设置记录大小为32，初始化DTA
;
openf   proc
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
error:  mov endcde,1
        lea dx,opnmsg
        call errm
        ret
openf   endp
;---------------------------------------        
;顺序读磁盘记录，且使FCB当前记录号递增。
;
readf   proc
        mov ah,14h
        lea dx,fcbrec
        int 21h
        cmp namefld,1ah
        jne tests
        mov endcde,1
        jmp rend
tests:  cmp al,0
        jz rend
        mov endcde,1
        cmp al,1
        jz rend
        lea dx,redmsg
        call errm
rend:   ret
readf   endp

;-------------------------------------
;显示读出信息
;
disp    proc
        mov ah,9
        lea dx,namefld
        int 21h
        cmp row,17h
        jae pass
        inc row
        ret
pass:   lea dx,press
        mov ah,9
        int 21h
        mov ah,7
        int 21h
        mov row,0
        mov ax,0600h
        call  scro
        call curs
        ret
disp    endp
;---------------------------------
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
        mov endcde,1
        ret
errm    endp
;----------------------------------------------------
cseg    ends
        end begin


