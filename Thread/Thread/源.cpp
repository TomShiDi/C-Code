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



int fun_1(string str)//线程一执行的方法
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
		a = 0;//标志置0表示该线程已经执行过
		cout << str;
		i--;
		Sleep(60);

	}
	//thread t([](){int i = 0; while (i < 50){ cout << "新建的线程一 :"<<i++ << endl; } });
	//t.join();
	//t.detach();
	return 0;
}

int fun_2(string str)//线程二执行的方法
{
	int i = 10;
	
	while (i > 0)
	{
		
        while (1)//当有优先度高的线程在等待时该线程让步
	    {
		    if (a == 0 && c == 1) break;
			else
			{
				Sleep(20);
			}
	    }
        b = 0;//标志置0表示该线程已经执行过
		cout << str;
		i--;
		Sleep(60);

	}
	//thread t([](){int i = 0; while (i < 50){ cout << "新建的线程一 :"<<i++ << endl; } });
	//t.join();
	//t.detach();
	return 0;
}

int fun_3(string str)//线程三执行的方法
{
	
	int i = 10;
	
	while (i > 0)
	{
		
		while (1)//当有优先度高的线程在等待时该线程让步
		{
			if (a == 0 && b == 0) break;
			else
			{
				Sleep(20);
			}
		}
		c = 0;//标志置0表示该线程已经执行过(可以省略)
		cout << str;
		i--;
		a = 1;//优先级最低的线程负责
		b = 1;//重置标志位
		c = 1;//
		Sleep(60);

	}
	//thread t([](){int i = 0; while (i < 50){ cout << "新建的线程一 :"<<i++ << endl; } });
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
	//cout << "main线程 :" << endl;
	//t.detach();
    
	return 0;
}