pseg     segment
         assume  cs:pseg,ds:pseg
         org 100h
start:   mov  dx,100
         in   al,61h
         and  al,0fch
sound:   xor  al,2
         out  61h,al
         mov  bx,1000
wait1:   mov  cx,0ffffh
wait0:   loop wait0
         dec  bx
         jne  wait1
         dec  dx
         jne  sound
         mov  ah,4ch
         int 21h
pseg     ends
         end start
