//#include<cv.h>
#include<opencv2/opencv.hpp>
//#include<highgui.h>
#include<opencv2/highgui/highgui.hpp>
#include<iostream>

using namespace std;
using namespace cv;

int main()
{
	Mat srcimage = imread("D:\\1.jpg");
	int rows, cols,i,j,s=0;
	namedWindow("testwindow");
	imshow("testwindow",srcimage);
	//srcimage.copyTo(dstimage);
	//waitKey(0);
	//transpose(srcimage,dstimage);
	if (srcimage.rows % 2 == 0&&srcimage.cols%2==0)
	{
		rows = srcimage.rows*0.5;
		cols = srcimage.cols*0.5;
	}
	if (srcimage.rows % 2 == 0 && srcimage.cols % 2 != 0)
	{
		rows = srcimage.rows*0.5;
		cols = (srcimage.cols - 1) * 0.5;
	}
	if (srcimage.rows % 2 != 0 && srcimage.cols % 2 == 0)
	{
		rows = (srcimage.rows-1)*0.5;
		cols = srcimage.cols  * 0.5;
	}
	if (srcimage.rows % 2 != 0 && srcimage.cols % 2 != 0)
	{
		rows = (srcimage.rows-1)*0.5;
		cols = (srcimage.cols - 1) * 0.5;
	}
	Mat dstimage(srcimage.rows*0.5+1,srcimage.cols*0.5,srcimage.type());
	for (i = 0; i < srcimage.rows; i=i+2)
	{
		for (j = 0; j < srcimage.cols; j = j + 2)
		{
			dstimage.at<Vec3b>(i/2, j / 2) = srcimage.at<Vec3b>(i, j);
		}
	}
	/*for (i = 0; i < rows; i++)
	{
		for (j = 0; j < cols; j++)
		{
			if (srcimage.at<uchar>(i, j) == dstimage.at<uchar>(i, j)) s++;
		}
	}*/
	//cvNamedWindow("testwindow2");
	//imshow("testwindow2",dstimage);
	cvNamedWindow("testwindow_1");
	imshow("testwindow_1",dstimage);
	waitKey(0);
	//cout << "ÏàËÆ¶ÈÎª:" << s <<"/"<<rows*cols<< endl;
	//system("pause");
	return 0;
}