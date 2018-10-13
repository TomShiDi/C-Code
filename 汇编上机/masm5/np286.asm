;p309.asm，扬声器发声程序。
;使端口61h的第1位交替为0/1，控制扬声器发声。
;
;
pseg     segment
         assume  cs:pseg,ds:pseg
         org 100h
start:   mov  dx,1000
         in   al,61h
         and  al,0fch
sound:   xor  al,2	;61h的第1位求反
         out  61h,al
;
         mov  bx,1000
wait1:   mov  cx,1fffh	;延时
wait0:   loop wait0
         dec  bx
         jne  wait1
         dec  dx
         jne  sound
;
         mov  ah,4ch
         int 21h
pseg     ends
         end start
