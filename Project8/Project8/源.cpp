#include<iostream>
#include<TCHAR.H>
#include<stdlib.h>
#include<stdio.h>
using namespace std;
int main()
{
	TCHAR szbuffer[1024];
	sprintf_s(szbuffer, "%s", "hello world");
	puts(szbuffer);
	snprintf_s(szbuffer,sizeof(szbuffer),"hello");
	getchar();
	return 0;

}