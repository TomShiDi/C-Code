;BIOS指令读磁盘，
;
cseg    segment para 'code'
        assume cs:cseg,ds:cseg,ss:cseg,es:cseg
        org 100h
begin:  jmp main
;----------------------------
recdin  db 512 dup(' ')
endcde  db 0
curadr  dw 0304h	;开始磁道、扇区
endadr  dw 0501h	;结束磁道、扇区
redmsg  db '**** read error ***$'
side    db 0
user	db 1,1 dup(?)
prompt	db '  New sector:',0dh,0ah,'$'
;-------------------------------------------
main:   mov ax,cseg
        mov ds,ax
        mov es,ax
;
        mov ax,600h
repeat: call scren
        
	call curs
	lea  dx,prompt
	mov  ah,9
	int  21h
	
        call addrs	;计算下一个磁盘扇区地址
        mov cx,curadr
        mov dx,endadr
        cmp cx,dx
        je exit
        call reads	;读磁盘扇区
        cmp endcde,0
        jnz exit
        call disps	;显示
        mov ah,7
        int 21h
        jmp repeat
;
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
wait1:	mov ah,0ah
	lea dx,user
	int 21h
	cmp user+1,0dh
	je  wait1
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
        mov dx,0100h
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


