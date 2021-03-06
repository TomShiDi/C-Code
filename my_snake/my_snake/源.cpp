#include<iostream>
#include<windows.h>
#include<stdlib.h>
#include<conio.h>
#include<cstdio>
using namespace std;
const char BODY = '*';
const char FOOD = '!';
const char BORD = '#';
const char BLANK = ' ';
const int M = 23;
const int N = 70;
/*class map
{
public:
int flag;
int length;
};*/
char exa[M][N] = { 'h' };

typedef struct snake
{
	int x;
	int y;
	char step;
	int length;
	struct snake *next;
}*SNAKE;
/*void printmap()
{
int i, j;
for (i = 0; i < M; i++)
{
for (j = 0; j < N; j++)
{
switch (exa[i][j])
{
case BORD:cout << "#"; break;
case BLANK:cout << " "; break;
case BODY:cout << "*";
}
//cout << exa[i][j].flag;
}
cout << endl;
}

}*/

void printmap()
{
	int i, j;
	for (i = 0; i < M; i++)
	{
		for (j = 0; j < N; j++)
		{
			putchar(exa[i][j]);
		}
		cout << endl;
		//cout << endl;
	}
}
void move(SNAKE &temp)
{
	int i = 0;
	struct snake *p = NULL, *p1 = temp;
	char step;
	Sleep(300);
	if (_kbhit())
	{
		//system("cls");
		step = _getch();
		fflush(stdin);
		switch (step)
		{
		case 'w':p = new struct snake; p->next = temp; p->x = temp->x - 1; p->y = temp->y; p->step = step;  p->length = temp->length; temp = p; break;
		case 'a':p = new struct snake; p->next = temp; p->y = temp->y - 1; p->x = temp->x; p->step = step;  p->length = temp->length; temp = p; break;
		case 's':p = new struct snake; p->next = temp; p->x = temp->x + 1; p->y = temp->y; p->step = step;  p->length = temp->length; temp = p; break;
		case 'd':p = new struct snake; p->next = temp; p->y = temp->y + 1; p->x = temp->x; p->step = step;  p->length = temp->length; temp = p; break;
		}
		for (; p->next->next != NULL; p = p->next);
		p1 = p;
		p = p->next;
		exa[p->x][p->y] = ' ';
		p1->next = NULL;
		//p->next = NULL;
		delete(p);
	}
	else
	{
		switch (temp->step)
		{
		case 'w':p = new struct snake; p->next = temp; p->x = temp->x - 1; p->y = temp->y; p->step = temp->step; p->length = temp->length; temp = p; break;
		case 'a':p = new struct snake; p->next = temp; p->y = temp->y - 1; p->x = temp->x; p->step = temp->step; p->length = temp->length; temp = p; break;
		case 's':p = new struct snake; p->next = temp; p->x = temp->x + 1; p->y = temp->y; p->step = temp->step; p->length = temp->length; temp = p; break;
		case 'd':p = new struct snake; p->next = temp; p->y = temp->y + 1; p->x = temp->x; p->step = temp->step; p->length = temp->length; temp = p; break;
		}
		for (; p->next->next != NULL; p = p->next);
		p1 = p;
		p = p->next;
		exa[p->x][p->y] = ' ';
		p1->next = NULL;
		//p->next = NULL;
		delete(p);
	}
}
void creatsnake(SNAKE &head)
{
	int i = 2;
	struct snake *temp1, *temp2;
	head = new struct snake;
	head->x = 1;
	head->y = 1;
	head->length = 1;
	head->step = 'd';
	head->next = NULL;
	temp1 = head;
	for (; i > 0; i--)
	{
		temp2 = new struct snake;
		temp2->y = temp1->y;
		temp2->x = temp1->x + 1;
		temp2->length = temp1->length + 1;
		temp2->step = temp1->step;
		temp2->next = NULL;
		temp1->next = temp2;
		temp1 = temp2;
	}

}
void printsnake(struct snake * temp)
{
	for (; temp != NULL;)
	{
		exa[temp->x][temp->y] = BODY;
		temp = temp->next;
	}
}
int main()
{
	struct snake *head;
	int i, j;
	for (i = 0; i < M; i++)
	for (j = 0; j < N; j++)
	{
		if (j == 0 || j == N - 1 || i == 0 || i == M - 1)
		{
			exa[i][j] = BORD;
		}
		else
		{
			exa[i][j] = BLANK;
		}
	}
	creatsnake(head);
	while (1)
	{
		move(head);
		printsnake(head);
		printmap();
		system("cls");
	}
	system("pause");
	return 0;
}