;p361.asm,����Ļ�п���9*20���ڣ���ʾ�����ַ���
;��ʾʱ���Զ��Ͼ�
;
;
prog    segment
        assume  cs:prog
        push    ds
        sub     ax,ax
        push    ax
;
        mov     ah,6	;��Ļ��ʼ�����Ͼ�
        mov     al,0	;�Ͼ�����
        mov     ch,0	;
        mov     cl,0	;���Ͻ����кš�
        mov     dh,24	;
        mov     dl,79	;���½����кš�
        mov     bh,7	;�ڵװ��֣�������ʾ��
        int     10h
;
pos_cu: mov     ah,2	;���ù��λ�á�
        mov     dh,16
        mov     dl,30	;16,30
        mov     bh,0	;ҳ�ţ�0��
        int     10h
;
        mov     cx,20	;����20���ַ�
get_ch: mov     ah,1
        int     21h
        cmp     al,1bh	;���롰ESC��
        jz      exit
        loop    get_ch
;
        mov     ah,6	;�Ͼ�
        mov     al,1	;�Ͼ�1�С�
        mov     ch,8
        mov     cl,30	;�������Ͻǡ�
        mov     dh,16
        mov     dl,50	;�������½�
        mov     bh,7	;�ڵװ��֡�
        int     10h
        jmp     pos_cu
;
exit:   ret		;���غ��ڴ����С�^C�������ء�
prog    ends
        end

