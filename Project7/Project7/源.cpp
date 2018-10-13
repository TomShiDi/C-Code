#include<stdio.h>
#include<stdarg.h>
#include<windows.h>
#include<iostream>
using namespace std;
int text(TCHAR * szformat, ...)
{
	TCHAR szbuffer[1024];//定义缓冲区
	va_list arg;
	//TCHAR * szformat = "hello %s";
	va_start(arg, szformat);
	_vsnprintf_s(szbuffer, sizeof(szbuffer), szformat, arg);
	puts(szbuffer);
	MessageBox(NULL,szbuffer,TEXT("这是个测试"),MB_OKCANCEL);
	va_end(arg);
	return 0;
}
int WINAPI WinMain(HINSTANCE hinstaance,HINSTANCE hPreInstance,PSTR szCmdLine,int iCmdShow)
{
	char word[1024];
	cin >> word;
	text(TEXT("Bless power with %s"),"you");
	//system("pause");
	return 0;

}