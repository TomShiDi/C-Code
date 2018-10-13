#include<iostream>
#include<vector>
using namespace std;

/************      vector的使用方法      ******************/
class exa
{
public:
	exa()
	{
		x = n;
		n++;
	}
	int getx()
	{
		return x;
	}
private:
	int x;
	static int n;
};
int exa::n = 0;

int main()
{
	int i;
	exa *p = NULL;
	exa temp;
	vector<exa*> Team;
	for (i = 0 ; i < 10; i++)
	{
		p = new exa;
		
		Team.push_back(p);
	}
	//cout << Team.size() << endl;
	for (i = 0; i < Team.size(); i++)
	{
		p =  Team.at(i);
		cout << p->getx()<<endl;
	}
	system("pause");
	return 0;
}