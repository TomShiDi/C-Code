#include<iostream>
#include<string>
#include<string.h>
using namespace std;

int main()
{
	int m, n;
	while (cin >> m)//输入第一行 
	{
		for (int i = 0; i<m; i++)
		{
			string s;
			cin >> s;//输入操作串S 
			cin >> n;//输入表中的元素个数 
			string yuan;
			int j;
			cin >> yuan;//输入操作元素 
			int r = 0, t = 0;//用于找到操作的循环位 

			while (r != s.length())
			{
				if (s[r] == 'R')
				{
					string yuan1;
					for (j = 0; j<yuan.length(); j++)//[1,2,3,4]长度是元素的个数 
					{
						yuan1[j] = yuan[yuan.length() - j - 1];
					}
					for (j = 0; j<yuan.length(); j++)
					{
						yuan[j] = yuan1[j];
					}
				}
				//去掉元素的"[","]" 
				if (t == 0)
				{
					yuan.erase(0, 1);
					int yu_l = yuan.length() - 1;
					yuan.erase(yu_l, 1);
					//cout<<yuan<<"uhuehuhefuheufhuefh"<<endl;
					t = 1;
				}

				if (s[r] == 'D')
				{
					for (j = 0; j<yuan.length(); j++)
					{
						if (yuan[j] == ',')
						{
							yuan.erase(0, 1);
							break;
						}
						if (yuan == "")
						{
							break;
						}
						if (yuan[j] != ',')
						{
							yuan.erase(0, 1);
							j = j - 1;
						}
					}
				}
				if (yuan == "")
				{
					break;
				}
				r++;
			}
			if (yuan == "")
			{
				cout << "error" << endl;
			}
			else
			{
				cout << "[" << yuan << "]" << endl;
			}
		}
	}
	system("pause");
	return 0;
}