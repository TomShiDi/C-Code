;p309.asm����������������
;ʹ�˿�61h�ĵ�1λ����Ϊ0/1������������������
;
;
pseg     segment
         assume  cs:pseg,ds:pseg
         org 100h
start:   mov  dx,1000
         in   al,61h
         and  al,0fch
sound:   xor  al,2	;61h�ĵ�1λ��
         out  61h,al
;
         mov  bx,1000
wait1:   mov  cx,1fffh	;��ʱ
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
