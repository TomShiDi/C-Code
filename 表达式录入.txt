#include<iostream>
#include<string>
//#include<stdio.h>
#include<windows.h>

using namespace std;
struct zhan
{
	char data[20];
	struct zhan *next;
};
struct zhan *creat()
{
	struct zhan *p;
	p = new struct zhan;
	return p;
}
struct zhan *ruzhan(struct zhan *base1)
{
	char str[20];
	struct zhan *p1, *p1_1;
	p1 = base1;
	p1->next = NULL;
	cout << "Please input words" << endl;
	while (1)
	{
		memset(str, 0, 20);
		cin >> str;
		//cout<<str<<endl;
		if (strcmp(str, "$") != 0)
		{
			if (strcmp(str, "+") == 0 || strcmp(str, "-") == 0 || strcmp(str, "*") == 0 || strcmp(str, "/") == 0)
			{
				strcpy_s(p1->data ,str);
				//cout << p1->data << endl;
				p1_1 = new struct zhan;
				p1_1->next = p1;
				p1 = p1_1;
				//memset(str,0,20);
			}
			/*else
			{
			p1->data=str;
			p1_1=new struct zhan;
			p1_1->next=p1;
			p1=p1_1;
			}*/
		}
		else
			break;
	}
	return p1;
}
struct zhan *ruzhan1(struct zhan *base1)
{
	char str[20];
	struct zhan *p1, *p1_1;
	p1 = base1;
	p1->next = NULL;
	cout << "Please input words" << endl;
	while (1)
	{
		memset(str, 0, 20);
		cin >> str;
		if (strcmp(str, "$") != 0)
		{
			if (strcmp(str, "+") != 0 && strcmp(str, "-") != 0 && strcmp(str, "*") != 0 && strcmp(str, "/") != 0)
			{
				strcpy_s(p1->data , str);
				//cout << p1->data << endl;
				p1_1 = new struct zhan;
				p1_1->next = p1;
				p1 = p1_1;
			}
		}
		else
			break;
	}
	return p1;
}
void print(struct zhan *top)
{
	struct zhan *p;
	p = top;
	for (p = top->next; p != NULL; p = p->next)
	{
		cout << p->data << endl;
	}
}



int main()
{
	struct zhan *base1, *base2, *top1, *top2;
	base1 = creat();
	base2 = creat();
	top1 = ruzhan(base1);
	top2 = ruzhan1(base2);
	print(top1);
	cout << endl;
	print(top2);
	system("pause");


	return 0;
}
