;p209,例6.5
;
;
;
;                  source module 1
;
extrn		var2:word,lab2:far
public		var1,lab1
;
data1		segment
		var1	db ?
		var3	dw ?
		var4	dw ?
data1		ends
;
code1		segment
		assume	cs:code1,ds:data1
main		proc 	far
start:		mov	ax,data1
		mov	ds,ax
		.
		.
		.
lab1:		.
		.
		mov	ax,4c00h
		int	21h
main		endp
;
code1		ends
;
		end 	start
;******************************************************
;
;          	source module 2
;
extrn		var1:byte,var4:word	;var4是未用public定义的，连接将报错。
public		var2
;
data2		segment
		var2	dw 0
		var3	db 5 dup(?)
data2		ends
;
;
code2		segment 
		assume	cs:code2,ds:data2
		.
		.
code2		ends
;
		end
;*********************************************************
;		source module 3
;
extrn		lab1:far
public		lab2,lab3		;lab3是定义了，但其他模块没有使用，不报错。
;
code3		segment
		assume	cs:code3
		.
		.
lab2:		.
		.
lab3:		.
		.
code3		ends
;	
		end