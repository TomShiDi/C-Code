#include<iostream>
#include<string>
#include<io.h>
#include<windows.h>
#include<fstream>
#include<conio.h>
#include<stdlib.h>
using namespace std;
char filename[255];
int i=0;
int getfile(string path,int n)
{
	long hand;
	int s = 0;
	string p = path + "\\*";
	string temp;
	struct _finddata_t fileinfo;
	hand = _findfirst(p.c_str(), &fileinfo);
	if (hand == -1)
	{
		//cout<<"File cannot be found"<<endl;
		return 0;
	}
	do
	{
		if (strcmp(fileinfo.name, "..") == 0 || strcmp(fileinfo.name, ".") == 0)
			continue;
		if (fileinfo.attrib == _A_SUBDIR)
		{
			p = path + "\\" + fileinfo.name;
			getfile(p.c_str(),n+1);

		}
		//Sleep(100);
		else
		{
			temp = fileinfo.name;
			if (temp.find(filename) != temp.npos)
			{
				i++;
				fstream files;
				files.open("E:\\TEXT.txt", ios::out | ios::app);
				cout << fileinfo.name << endl;
				//temp = p;
				//if (temp.find('*') != temp.npos) temp.erase(temp.find('*') - 1, 2);
				files << path + "\\" + fileinfo.name << endl;
				files.close();
			}
		}
	} while (_findnext(hand, &fileinfo) == 0);
	return 0;
}
int main()
{
	string filepath;
	char flag;
	//string filename;
	cout << "请输入路径:" << endl;
	cin >> filepath;
	cout << "请输入待查找的文件名:" << endl;
	cin >> filename;
	getfile(filepath,0);
	if (i == 0) cout << "File cannot be found" << endl;
	fflush(stdin);
	cout << "删除TEXT文件按d"<<endl;
	flag = getchar();
	if (flag == 'd') 
	if (remove("E:\\TEXT.txt") == 0) cout << "mission success" << endl;
	system("pause");
	return 0;
}