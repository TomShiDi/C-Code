#include<stdio.h>
#include<stdarg.h>
#include<windows.h>

int box(TCHAR * szcaption, size_t iStyle, TCHAR * szFormat, ...)
{
	TCHAR szbuffer[1024];
	va_list arg;
	va_start(arg,szFormat);
	_vsnprintf_s(szbuffer,sizeof(szbuffer),szFormat,arg);
	va_end(arg);
	return MessageBox(NULL,szbuffer,szcaption,iStyle);
}
int WINAPI WinMain(HINSTANCE hinstance,HINSTANCE hprevInstance,PSTR szCmdLine,int iCmdShow)
{
	int x, y;
	x = GetSystemMetrics(SM_CXSCREEN);
	y = GetSystemMetrics(SM_CYSCREEN);
	box(TEXT("��ʾ���ֱ���"),MB_OKCANCEL,TEXT("��ʾ����ǰ�ֱ���Ϊ��%dx%d"),TEXT(x),TEXT(y));
	getchar();
	return 0;
}