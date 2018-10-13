code_1    segment
          assume cs:code_1
   proc1  proc far
          mov ah,2
	  int 21h
	  ret
   proc1  endp
          mov dl,31h
	  call  proc1
	  jmp far ptr label_1
code_1    ends

code_2    segment
          assume cs:code_2
  label_1:mov dl,32h
	  call  proc1
	  mov ah,4ch
	  int 21h
code_2    ends
          end proc1
	  
	  
	  