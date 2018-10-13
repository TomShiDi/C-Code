char const *message="The planet Earth.\n$";
main()
{
asm	mov ah,9
asm	mov dx,message
asm	int 21h
		
}