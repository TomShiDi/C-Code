;利用代号读取一个文件。
;
stack   segment para stack 'stack'
        dw 80 dup(?)
stack   ends
;--------------------------------------
dseg    segment para 'data'
ioarea   db 32 dup(?)
endcde  db 0
handle  dw ?
pathnam db 'd:\name.dat',0
row     db 0
opnmsg  db '**** open  error ****',13,10
redmsg  db '**** write error ****',13,10
dseg    ends
;-----------------------------------------
cseg    segment para 'code'
        assume cs:cseg,ds:dseg,ss:stack,es:dseg
begin:  mov ax,dseg
        mov ds,ax
        mov es,ax
;
        mov ax,0600h
        call scren
        call curs
        call openh
        cmp endcde,0
        jnz exit
contin: call readh
        cmp endcde,0
        jnz exit
        call disph
        jmp contin
;
exit:   mov ah,4ch
        int 21h
;-----------------------------------------------
;打开指定文件
;
openh   proc
        mov ah,3dh
        mov al,0
        lea dx,pathnam
        int 21h
        jc err1
        mov handle,ax
        ret
err1:   lea dx,opnmsg
        mov endcde,1
        call errm
        ret
openh   endp
;----------------------------------------------------
;读文件，不成功则显示出错信息。
;
readh   proc
        mov ah,3fh
        mov bx,handle
        mov cx,32
        lea dx,ioarea
        int 21h
        jc err2
        cmp ax,0
        je exit2
        cmp ioarea,1ah
        je exit2
        ret
err2:   lea dx,redmsg
        call errm
exit2:  mov endcde,1
        ret
readh   endp
;---------------------------------------
;显示记录并卷屏
;
disph   proc
        call curs
	mov ah,40h
        mov bx,1
	mov cx,30
	lea dx,ioarea
        int 21h
        cmp row,24
        jae err4
        inc row
err4:   mov ax,601h
        call scren
        call curs
        ret
disph   endp

;-----------------------------------------------
;设置屏幕。
;
scren   proc
        mov bh,1eh
        mov cx,0
        mov dx,184fh
        int 10h
        ret
scren   endp
;---------------------------------------------
;设置光标位置。
;
curs    proc
        mov ah,2
        mov bh,0
        mov dh,row
        mov dl,0
        int 10h
        ret
curs    endp
;---------------------------------------------
;显示出错信息。
;
errm    proc
        mov ah,40h
        mov bx,1
        mov cx,23
        int 21h
        ret
errm    endp
;-------------------------------------------------
cseg    ends
        end begin

