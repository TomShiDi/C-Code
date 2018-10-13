#include<iostream>
#include<string>
#include<io.h>
#include<windows.h>
#include<fstream>
using namespace std;
int getfile(string path,string filename)
{
	long hand;
	int s = 0;
	string p=path+("\\*");
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
		if (strcmp(fileinfo.name, "..") == 0||strcmp(fileinfo.name,".")==0)
			continue;
		if (fileinfo.attrib==_A_SUBDIR)
		{
			p = path + "\\" + fileinfo.name;
			getfile(p.c_str(),filename);
			
		}
		//Sleep(100);
		temp.assign(fileinfo.name);
		if (temp.find(filename)!=temp.npos)
		{
			fstream files;
			files.open("E:\\TEXT.txt", ios::out | ios::app);
			cout << "查找成功 请在E盘下的TEXT.txt文件查看路径" << endl;
			cout << p << endl;
			files << p + "\\" + fileinfo.name << endl;
			files.close();
		}
		else
			continue;
	} while (_findnext(hand, &fileinfo) == 0);
	return 0;
}
int main()
{
	string filepath ;
	string filename;
	int type;
	cout << "请输入路径:" << endl;
	cin >> filepath;
	cout << "请输入待查找的文件名:" << endl;
	cin >> filename;
	//cout << "请选择文件类型: 1 txt    2 doc    3 mp3    4 mp4"<<endl;
	//cin >> type;
	/*switch (type)
	{
	case 1:filename = filename + ".txt"; break;
	case 2:filename = filename + ".doc"; break;
	case 3:filename = filename + ".mp3"; break;
	case 4:filename = filename + ".mp4"; break;
	}*/
	cout << filepath << endl;
	getfile(filepath,filename);
	system("pause");
	return 0;
}