;p364.asm,����Ļ���Ժ��������ʾ��world��
;Ȼ��ֱ��Ժ�����ֺͺ������������ʾ��scenery����
;
;
	.model small
;
	.data
string1	db	'world '
string2	db	's',42h,'c',41h,'e',42h,'n',41h
	db	'e',42h,'r',41h,'y',42h		;ǰ��2�����֡�
lenstr2	equ	($-string2)/2		;�����ֽڲ����봮����
;
	.code
start:	mov	ax,@data
	mov	ds,ax
;
	mov	al,3
	mov	ah,0
	int 	10h
;
	mov	bp,seg string1
	mov	es,bp
	mov	bp,offset string1	;����ʼ��ַ��es:bp
	mov	cx,string2-string1	;������
	mov	dx,0
	mov	bl,41h	;����0400����ײ���˸��ǰ��1�����֡�
	mov	al,1
	mov	ah,13h
	int	10h
;
	mov	ah,3
	int	10h	;����굱ǰλ�ã�������ܸ���ǰ�������
;
	mov	bp,offset string2
	mov	cx,lenstr2
	mov	al,3
	mov	ah,13h
	int	10h
;
	mov	ax,4c00h
	int	21h
;
	end	start