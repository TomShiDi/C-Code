#include<cv.h>
#include<highgui.h>
#include<iostream>
using namespace cv;
using namespace std;
int value;
int maxsize = 100;
int rows, cols;
Mat one = imread("D:\\1.jpg");
Mat xmap(one.size(), CV_32FC1);
Mat ymap(one.size(), CV_32FC1);
Mat two(rows,cols,one.type());
int main()
{
	void turnback(int pos);
	//int i, j;
    
	int offset = 20;
	rows = one.rows;
	cols = one.cols;
	
	cvNamedWindow("testWindow");
	
	cvCreateTrackbar("testbar","testWindow",&value,maxsize,turnback);
	//cout << ymap.at<float>(1,1) << endl;
	//cout << xmap << endl;
	//system("pause");
	//remap(one, two, xmap, ymap, CV_INTER_LINEAR, BORDER_CONSTANT, Scalar(0, 0, 0));
	//imshow("testWindow",two);
	turnback(0);
	cvWaitKey(0);
	//system("pause");
	return 0;
}


void turnback(int pos)
{
	int i, j;
	for (i = 0; i < rows; i++)
	{
		for (j = 0; j < cols; j++)
		{
			ymap.at<float>(i, j) = i;
			if (j < pos*10) xmap.at<float>(i, j) = j - pos*10 + cols;
			else xmap.at<float>(i, j) = j - pos*10;
		}
	}
	remap(one, two, xmap, ymap, CV_INTER_LINEAR, BORDER_CONSTANT, Scalar(255, 255, 255));
	imshow("testWindow",two);
}