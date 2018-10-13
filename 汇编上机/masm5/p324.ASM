;p324.asm,每10秒响铃并显示提示字符串。
;
;
;
;********************************************************
dseg     segment
count    dw 1
mess     db 'The bell is ring!',0dh,0ah,'$'
dseg     ends
;********************************************************
;
;********************************************************
cseg     segment
         assume cs:cseg,ds:dseg,es:dseg
start:   mov  ax,dseg
	 mov  ds,ax
;
	 mov  al,1ch
	 mov  ah,35h
	 int  21h
	 push es
	 push bx	;保存原中断向量。
	 push ds	
;
	 mov  dx,offset ring
	 mov  ax,seg ring
	 mov  ds,ax
	 mov  ax,251ch
	 int  21h	;设置新中断向量。
;
	 pop  ds
	 in   al,21h
	 and  al,0feh
	 out  21h,al
	 int  21h
	 sti		;设置中断屏蔽位。
;
	 mov  bx,5	;延时。原延时远远不够。
delay0:  mov  di,0ffffh	
delay:   mov  si,0ffffh
delay1:  dec  si
         jnz  delay1
	 dec  di
	 jnz  delay
	 dec  bx
	 jnz  delay0
;
	 pop  dx
	 pop  ds
	 mov  ax,251ch
	 int  21h	;恢复原中断向量。
;
         mov  ah,4ch
         int  21h

ring     proc		;新中断处理子程序。
         push ds
	 push ax
	 push cx
	 push dx
         push bx
;
         mov  ax,dseg
         mov  ds,ax
         sti
;
         dec  count	;从182变回0大约10秒。
         jnz  exit
;
         mov  dx,offset mess
         mov  ah,9
         int  21h	;显示提示字符串。
;
         mov  dx,1000	;响铃次数不够将导致强度不够，原100次。
         in   al,61h
         and  al,0fch
;
sound:   xor  al,2
         out  61h,al
         mov  cx,0ffffh
wait1:   loop wait1
         dec  dx
         jne  sound
;
         mov  count,182
;
exit:    cli
         pop  bx
         pop  dx
	 pop  cx
	 pop  ax
	 pop  ds
	 iret
ring     endp
cseg     ends
         end  start
