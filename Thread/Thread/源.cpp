#include<iostream>
#include<windows.h>
#include<conio.h>
#include<vector>
#include<thread>
#include<string>
using namespace std;


int a = 1;
int b = 1;
int c = 1;



int fun_1(string str)//�߳�һִ�еķ���
{
	int i = 10;
	
	while (i > 0)
	{
		
		while (1)
		{
			if (b == 1 && c == 1) break;
			else
			{
				Sleep(20);
			}
		}
		a = 0;//��־��0��ʾ���߳��Ѿ�ִ�й�
		cout << str;
		i--;
		Sleep(60);

	}
	//thread t([](){int i = 0; while (i < 50){ cout << "�½����߳�һ :"<<i++ << endl; } });
	//t.join();
	//t.detach();
	return 0;
}

int fun_2(string str)//�̶߳�ִ�еķ���
{
	int i = 10;
	
	while (i > 0)
	{
		
        while (1)//�������ȶȸߵ��߳��ڵȴ�ʱ���߳��ò�
	    {
		    if (a == 0 && c == 1) break;
			else
			{
				Sleep(20);
			}
	    }
        b = 0;//��־��0��ʾ���߳��Ѿ�ִ�й�
		cout << str;
		i--;
		Sleep(60);

	}
	//thread t([](){int i = 0; while (i < 50){ cout << "�½����߳�һ :"<<i++ << endl; } });
	//t.join();
	//t.detach();
	return 0;
}

int fun_3(string str)//�߳���ִ�еķ���
{
	
	int i = 10;
	
	while (i > 0)
	{
		
		while (1)//�������ȶȸߵ��߳��ڵȴ�ʱ���߳��ò�
		{
			if (a == 0 && b == 0) break;
			else
			{
				Sleep(20);
			}
		}
		c = 0;//��־��0��ʾ���߳��Ѿ�ִ�й�(����ʡ��)
		cout << str;
		i--;
		a = 1;//���ȼ���͵��̸߳���
		b = 1;//���ñ�־λ
		c = 1;//
		Sleep(60);

	}
	//thread t([](){int i = 0; while (i < 50){ cout << "�½����߳�һ :"<<i++ << endl; } });
	//t.join();
	//t.detach();
	return 0;
}


int main()
{
	thread t_1 = thread(fun_1,"A");
	thread t_2 = thread(fun_2,"B");
	thread t_3 = thread(fun_3,"C");
	t_1.join();
	t_2.join();
	t_3.join();
	cout << endl;
	//cout << "main�߳� :" << endl;
	//t.detach();
    
	return 0;
}