main()
{
	int temp=0,i=0;
	char ch;
	while(i<4)
	{printf("\nPlease enter a hexadecimal_bit:");
	 scanf(" %c",&ch);
	 if(ch>='0'&&ch<='9'){ch-=48;temp<<=4;temp+=ch;i++;}
	 if(ch>='a'&&ch<='f'){ch-=87;temp<<=4;temp+=ch;i++;}
	 if(ch>='A'&&ch<='F'){ch-=55;temp<<=4;temp+=ch;i++;}
	}
	printf("%xH=",temp);
	for(i=0;i<16;i++)
	 { if(temp<0) printf("%d",1);
	   else printf("%d",0);
	   temp<<=1;
	 }
	printf("B\n");
}
