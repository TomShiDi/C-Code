;p361.asm,在屏幕中开辟9*20窗口，显示键入字符。
;显示时能自动上卷。
;
;
prog    segment
        assume  cs:prog
        push    ds
        sub     ax,ax
        push    ax
;
        mov     ah,6	;屏幕初始化或上卷
        mov     al,0	;上卷行数
        mov     ch,0	;
        mov     cl,0	;左上角行列号。
        mov     dh,24	;
        mov     dl,79	;右下角行列号。
        mov     bh,7	;黑底白字，正常显示。
        int     10h
;
pos_cu: mov     ah,2	;设置光标位置。
        mov     dh,16
        mov     dl,30	;16,30
        mov     bh,0	;页号，0。
        int     10h
;
        mov     cx,20	;输入20个字符
get_ch: mov     ah,1
        int     21h
        cmp     al,1bh	;输入“ESC”
        jz      exit
        loop    get_ch
;
        mov     ah,6	;上卷
        mov     al,1	;上卷1行。
        mov     ch,8
        mov     cl,30	;窗口左上角。
        mov     dh,16
        mov     dl,50	;窗口右下角
        mov     bh,7	;黑底白字。
        int     10h
        jmp     pos_cu
;
exit:   ret		;返回后还在窗口中。^C真正返回。
prog    ends
        end

