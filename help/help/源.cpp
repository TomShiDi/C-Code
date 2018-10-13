#include<iostream>
#include<math.h>
using namespace std;
class Point
{
public:
	Point()
	{
		x = 0;
		y = 0;
	}
	void setxy(int a, int b);
	void show();
private:
	int x;
	int y;
};

class line
{
public:
    line()
	{
		x1 = 0;
		x2 = 0;
		y1 = 0;
		y2 = 0;
	}
	void setxy1(int a,int b);
	void setxy2(int a, int b);
	void length();
	void show();
	friend void area(line &t1,line &t2);
private:
	int x1;
	int x2;
	int y1;
	int y2;
	static float len;
	
};
float line::len = 0;
void line::show()
{
	cout << "length=" << len << endl;
}
void line::length()
{
	len = 2*sqrt((x1 - x2)*(x1 - x2) + (y1 - y2)*(y1 - y2))+len;
}
void line::setxy1(int a, int b)
{
	x1 = a;
	y1 = b;

}
void line::setxy2(int a, int b)
{
	x2 = a;
	y2 = b;
}
void Point::setxy(int a, int b)
{
	x = a;
	y = b;
}
void Point::show()
{
	cout << "(" << x << "," << y << ")" << endl;
}


void area(line &t1,line &t2)
{
	float s = 0;
	s = sqrt((t1.x1 - t1.x2)*(t1.x1 - t1.x2) + (t1.y1 - t1.y2)*(t1.y1 - t1.y2))*sqrt(((t2.x1 - t2.x2)*(t2.x1 - t2.x2) + (t2.y1 - t2.y2)*(t2.y1 - t2.y2)));
	cout << "area=" << s << endl;
}
int main()
{
	int a, b;
	Point p1;
	line l1, l2;
	cout << "请输入Point的x和y的坐标 用空格隔开，例如1 2" << endl;
	cin >> a >> b;
	p1.setxy(a, b);
	cout << "设置的坐标为: ";
	p1.show();
	cout << "请输入线的一个坐标，输入方法同上" << endl;
	cin >> a >> b;
	l1.setxy1(a, b);
	cout << "请输入线的另外一个坐标"<<endl;
	cin >> a >> b;
	l1.setxy2(a, b);
	cout << "请输入另外一根线的一个坐标，输入方法同上" << endl;
	cin >> a >> b;
	l2.setxy1(a,b);
	cout << "请输入线的另外一个坐标，输入方法同上" << endl;
	cin >> a >> b;
	l2.setxy2(a, b);
	l1.length();
	l2.length();
	l2.show();
	area(l1, l2);
	system("pause");
	return 0;
}