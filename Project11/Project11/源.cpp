#include<iostream>
using namespace std;
class Point
{
	int x, y;
public:
	friend bool equal(const Point &p, const Point &q);
	Point(int x, int y) :x(x), y(y) {}
	void show() const
	{
		cout << "(" << x << "," << y << ")";
	}
	void test(Point m) { cout << m.x<<","<<m.y << endl; }
};
bool equal(const Point &p, const Point &q)
{
	return p.x == q.x&&p.y == q.y;
}
int main()
{
	Point p(9, 3), q(9, 5);
	p.show(), q.show();
	//cout << equal(p, q) << endl;
	p.test(q);
	system("pause");
}