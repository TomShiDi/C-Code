;���ļ����Ž����ļ���
;
stack   segment para stack 'stack'
        dw 80 dup(?)
stack   ends
;--------------------------------------
dseg    segment para 'data'
namepar label 	byte
maxlen  db 	30		;���뻺����
namelen db 	?
namerec db 	30 dup(?),13,10
;
errcde  db 	0
handle  dw 	?		;�ļ�����
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
;��������creath
;���ܣ�����3ch���ܵ��ý����ļ������ļ����Ŵ�handle��
;��ڲ������ļ���ASCIZ����ַ��handle��Ԫ
;����ֵ���ɹ����ļ����Ŵ�handle��������ʾ������ʾ��
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
;��������proch
;���ܣ������ַ���������30���ո񲹳䣩����ת��д���ļ���
;��ڲ�������ʾ��Ϣ�׵�ַprompt����������ַnamepar��
;����ֵ���ַ�����
;
;
proch   proc
        mov 	ah,40h
        mov 	bx,01       ;�ļ����ţ���׼����豸
        mov 	cx,6
        lea 	dx,prompt   ;�����ʾ��Ϣ�յ�ַ��
        int 	21h
        mov 	ah,0ah
        lea 	dx,namepar
        int 	21h         ;����һ��������������
        cmp 	namelen,0
        jz 	exit2
contin2:mov 	al,20h	    ;���������ַ������඼�ÿո�
        sub 	ch,ch
        mov 	cl,namelen
        lea 	di,namerec
        add 	di,cx	    ;��ʱdiָ�����һ��Ԫ�ء�
        neg 	cx
        add 	cx,30	    ;cx=30-cx=30-namelen
        cld
        rep 	stosb
        call 	writh
        call 	scrl
exit2:  ret
proch   endp
;--------------------------------------------------------
;��������scr1
;���ܣ���һ����ʱ��ת��scren,cursʵ�ֹ�����
;��ڲ�������ǰ����row��Ԫ��
;����ֵ���ޡ��޸�row��Ԫ��
;
;
scrl    proc
        cmp 	row,18h
        jae 	cont3
        inc 	row	    ;���뻺�������Ѽӻس����С�ʡ����ָ�
cont3:  mov 	ax,0601h
        call 	scren
        call 	curs
        ret
scrl    endp
;--------------------------------------------------------
;��������writh
;���ܣ�д�����ļ�
;��ڲ������ļ�������handle�У�д��¼��ַnamerec��
;����ֵ���ɹ��򷵻ء�������ʾ������Ϣ��
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
;��������clseh
;���ܣ���handle��ָ�ļ��رա�
;��ڲ������ļ����ŵ�Ԫhandle��
;����ֵ���ޡ�
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
;��������scren
;���ܣ�������ʾ��ʽ��
;��ڲ�����ax��Ϊ��ʾ��ʽ��
;����ֵ���ޡ��������µ���ʾ��ʽ��
;
;
scren   proc
        mov 	bh,1eh		;�������������׻��֡�
        mov 	cx,0		;���Ͻ�
        mov 	dx,184fh	;���½�
        int 	10h
        ret
scren   endp
;---------------------------------------------
;��������curs
;���ܣ�����BIOS���ܵ������ù��λ�á�
;��ڲ������кŵ�Ԫrow��
;����ֵ���ޡ�����궨λ��ָ��λ�á�
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
;��������errm
;���ܣ�д�豸������errcde��Ԫ��1�������
;��ڲ�����ASCIZ����ַ����ds:dx��
;����ֵ��ʹerrcde��Ԫ��1��
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

