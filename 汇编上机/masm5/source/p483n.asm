;用文件代号建立文件。
;
stack   segment para stack 'stack'
        dw 80 dup(?)
stack   ends
;--------------------------------------
dseg    segment para 'data'
namepar label 	byte
maxlen  db 	30		;输入缓冲区
namelen db 	?
namerec db 	30 dup(?),13,10
;
errcde  db 	0
handle  dw 	?		;文件代号
pathnam db 	'd:/name0.dat',0
prompt  db 	'name ?'
row     db 	01
opnmsg  db 	'**** open error ****',13,10
wrtmsg  db 	'**** write error ****',13,10
dseg    ends
;-----------------------------------------
cseg    segment para 'code'
        assume 	cs:cseg,ds:dseg,ss:stack,es:dseg
begin:  mov 	ax,dseg
        mov 	ds,ax
        mov 	es,ax
;
        mov 	ax,0600h
        call 	scren
        call 	curs
        call 	creath
        cmp 	errcde,0
        jnz 	exit
contin: call 	proch
        cmp 	namelen,0
        jnz 	contin
        call 	clseh
exit:   mov 	ah,4ch
        int 	21h
;-----------------------------------------------
;过程名：creath
;功能：利用3ch功能调用建立文件，将文件代号存handle。
;入口参数：文件名ASCIZ串地址，handle单元
;返回值：成功将文件代号存handle；否则显示出错提示。
;
;
creath  proc
        mov 	ah,3ch
        mov 	cx,0
        lea 	dx,pathnam
        int 	21h
        jc 	err1
        mov 	handle,ax
        ret
err1:   lea 	dx,opnmsg
        call 	errm
        ret
creath  endp
;----------------------------------------------------
;过程名：proch
;功能：输入字符串（不足30个空格补充），并转子写入文件。
;入口参数：提示信息首地址prompt，缓冲区首址namepar。
;返回值：字符串。
;
;
proch   proc
        mov 	ah,40h
        mov 	bx,01       ;文件代号，标准输出设备
        mov 	cx,6
        lea 	dx,prompt   ;输出提示信息收地址。
        int 	21h
        mov 	ah,0ah
        lea 	dx,namepar
        int 	21h         ;输入一个串到缓冲区。
        cmp 	namelen,0
        jz 	exit2
contin2:mov 	al,20h	    ;除开输入字符外其余都置空格。
        sub 	ch,ch
        mov 	cl,namelen
        lea 	di,namerec
        add 	di,cx	    ;此时di指向最后一个元素。
        neg 	cx
        add 	cx,30	    ;cx=30-cx=30-namelen
        cld
        rep 	stosb
        call 	writh
        call 	scrl
exit2:  ret
proch   endp
;--------------------------------------------------------
;过程名：scr1
;功能：当一屏满时，转子scren,curs实现滚屏。
;入口参数：当前行数row单元。
;返回值：无。修改row单元。
;
;
scrl    proc
        cmp 	row,18h
        jae 	cont3
        inc 	row	    ;输入缓冲区后已加回车换行。省几条指令。
cont3:  mov 	ax,0601h
        call 	scren
        call 	curs
        ret
scrl    endp
;--------------------------------------------------------
;过程名：writh
;功能：写磁盘文件
;入口参数：文件代号在handle中，写记录首址namerec。
;返回值：成功则返回。否则显示出错信息。
;
;
writh   proc
        mov 	ah,40h
        mov 	bx,handle
        mov 	cx,32
        lea 	dx,namerec
        int 	21h
        jnc 	exit4
        lea 	dx,wrtmsg
        call 	errm
        mov 	namelen,0
exit4:  ret
writh   endp
;-----------------------------------------------
;过程名：clseh
;功能：将handle所指文件关闭。
;入口参数：文件代号单元handle。
;返回值：无。
;
;
clseh   proc
        mov 	namerec,1ah
;       call 	writh
        mov 	ah,3eh
        mov 	bx,handle
        int 	21h
        ret
clseh   endp
;-------------------------------------------------
;过程名：scren
;功能：设置显示方式。
;入口参数：ax中为显示方式。
;返回值：无。设置了新的显示方式。
;
;
scren   proc
        mov 	bh,1eh		;卷入行属性蓝底黄字。
        mov 	cx,0		;左上角
        mov 	dx,184fh	;右下角
        int 	10h
        ret
scren   endp
;---------------------------------------------
;过程名：curs
;功能：调用BIOS功能调用设置光标位置。
;入口参数：行号单元row。
;返回值：无。但光标定位在指定位置。
;
;
curs    proc
        mov 	ah,2
        mov 	bh,0
        mov 	dh,row
        mov 	dl,0
        int 	10h
        ret
curs    endp
;---------------------------------------------
;过程名：errm
;功能：写设备。并将errcde单元置1（表出错）
;入口参数：ASCIZ串首址已在ds:dx。
;返回值：使errcde单元置1。
;
;
errm    proc
        mov 	ah,40h
        mov 	bx,1
        mov 	cx,21h
        int 	21h
        mov 	errcde,1
        ret
errm    endp
;-------------------------------------------------
cseg    ends
        end 	begin

