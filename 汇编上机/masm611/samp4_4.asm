.MODEL	TINY			;采用微型模式
    .CODE			;只有一个段,没有数据段和堆栈段
    .STARTUP           		;等效于ORG 100H,汇编程序自动产生
        MOV	DX,OFFSET STRING		;显示信息
        MOV	AH,9
        INT	21H
        MOV	AH,01H				;等待按键
        INT	21H
        MOV	AH,02H    			;响铃
        MOV	DL,07H
        INT		21H
    .EXIT 0
STRING DB 'PRESS ANY KEY TO CONTINUE !$'
  	;数据安排在不与代码冲突的地方
END 
