.MODEL	TINY			;����΢��ģʽ
    .CODE			;ֻ��һ����,û�����ݶκͶ�ջ��
    .STARTUP           		;��Ч��ORG 100H,�������Զ�����
        MOV	DX,OFFSET STRING		;��ʾ��Ϣ
        MOV	AH,9
        INT	21H
        MOV	AH,01H				;�ȴ�����
        INT	21H
        MOV	AH,02H    			;����
        MOV	DL,07H
        INT		21H
    .EXIT 0
STRING DB 'PRESS ANY KEY TO CONTINUE !$'
  	;���ݰ����ڲ�������ͻ�ĵط�
END 
