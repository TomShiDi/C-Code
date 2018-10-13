#include<iostream>
#include<vector>
#include<string>
#include<vector>
using namespace std;


class imform
{
public:
	imform()
	{
		name = ".";
		number = 0;
		sell = 0;
		//income = 0;
		i++;
	}
	int & getnumber();
	float & getsell();
	float & getincome();
	string & getname();
	int geti()
	{
		return i;
	}
private:
	string name;
	int number;
	float sell;
	//float income;
	static int i;
};
int imform::i = 0;
int & imform::getnumber()
{
	return number;
}
/*float & imform::getincome()
{
	return income;
}*/
float & imform::getsell()
{
	return sell;
}
string & imform::getname()
{
	return name;
}

class member :public imform
{
public:
	member()
	{
		getnumber() = 10001 + geti();
		income = 0;
	}
	friend class manager;
	void show()
	{
		cout << getnumber() << "  " << getname() << "  " << income << endl;
	}
	void caculation();
private:
	float income;
};
void member::caculation()
{
	income = getsell()*0.04;
}



class manager:public imform
{
public:
	manager()
	{
		getnumber() = 10001 + geti();
		income = 10000;
	}
	void show()
	{
		cout << getnumber()<<"  " << getname()<<"  "<<income<<endl;
	}
	void caculation();
	vector<member *> &getmember();
	int memberM;
private:
	float income;
	//vector<member *> teammate;
protected:
	vector<member *> teammate;
};

vector<member *> & manager::getmember()
{
	return teammate;
}


void manager::caculation()
{
	int i;
	member *p;
	float sum=0;
	for (i = 0; i < teammate.size(); i++)
	{
		p = teammate.at(i);
		sum = p->getsell() + sum;
	}
	income=sum*0.05+5000;
}







class inspector:public imform 
{
public:
	inspector()
	{
		getnumber() = 10001 + geti();
		income = 10000;
	}
	void show()
	{
		cout << getnumber() << "  " << getname() << "  " << income<<endl;
	}
private:
	float income;
};
int main()
{
	inspector one;
	//manager Mana;
	vector<manager *> M;
	member *p;
	manager *p1;
	int i,n,k=1;//k为组数
	string name = ".";
	int number=0;
	float sellnum = 0;
	cout << "请输入销售总监的姓名" << endl;
	cin >> name;
	one.getname() = name;
	for (; k > 0; k--)
	{
		p1 = new manager;
		cout << "请输入第"<<k<<"组经理的姓名" << endl;
		cin >> name;
		p1->getname() = name;
		cout << "请输入组员数" << endl;
		cin >> i;
		n = i;
		p1->memberM = i;
		for (; i > 0; i--)
		{
			p = new member;
			cout << "请输入" << i << "号组员姓名" << endl;
			cin >> name;
			p->getname() = name;
			cout << "请输入" << i << "号组员的销售额" << endl;
			cin >> sellnum;
			p->getsell() = sellnum;
			p->caculation();
			p1->caculation();
			p1->getmember().push_back(p);

		}
		M.push_back(p1);
	}
	one.show();
	for (i = 0; i <M.size(); i++)
	{   
		M.at(i)->show();
		for (n=0; n <M.at(i)->getmember().size(); n++)
		{
			
			M.at(i)->getmember().at(n)->show();
		}
		
	}
	system("pause");
	return 0;
}
