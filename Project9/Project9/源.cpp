#include<iostream>
#include<string>
#include<string.h>
using namespace std;

int main()
{
	int m, n;
	while (cin >> m)//�����һ�� 
	{
		for (int i = 0; i<m; i++)
		{
			string s;
			cin >> s;//���������S 
			cin >> n;//������е�Ԫ�ظ��� 
			string yuan;
			int j;
			cin >> yuan;//�������Ԫ�� 
			int r = 0, t = 0;//�����ҵ�������ѭ��λ 

			while (r != s.length())
			{
				if (s[r] == 'R')
				{
					string yuan1;
					for (j = 0; j<yuan.length(); j++)//[1,2,3,4]������Ԫ�صĸ��� 
					{
						yuan1[j] = yuan[yuan.length() - j - 1];
					}
					for (j = 0; j<yuan.length(); j++)
					{
						yuan[j] = yuan1[j];
					}
				}
				//ȥ��Ԫ�ص�"[","]" 
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