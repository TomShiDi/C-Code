prog    segment
        assume  cs:prog
        push    ds
        sub     ax,ax
        push    ax
        mov     ah,6
        mov     al,0
        mov     ch,0
        mov     cl,5
        mov     dh,24
        mov     dl,79
        mov     bh,7
        int     10h
pos_cu: mov     ah,2
        mov     dh,16
        mov     dl,30
        mov     bh,0
        int     10h
        mov     cx,20
get_ch: mov     ah,1
        int     21h
        cmp     al,3
        jz      exit
        loop    get_ch
        mov     ah,6
        mov     al,1
        mov     ch,8
        mov     cl,30
        mov     dh,16
        mov     dl,50
        mov     bh,7
        int     10h
        jmp     pos_cu
exit:   ret
prog    ends
        end

