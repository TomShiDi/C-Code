#include <cv.h>
#include <highgui.h>
using namespace cv;
using namespace std;
Mat src;
Mat dst;
bool P=false;
Point previousPoint;
void On_mouse(int event,int x,int y,int flag,void *);
const int num = 2;
int value;
int maxsize=100;
IplImage *exa_1, *exa_2;
int main()
{
	void turnback(int pos);
	exa_1 = cvLoadImage("D:\\1.jpg");
	//exa_2=cvCreateImage(cvGetSize(exa_1),exa_1->depth,1);
	//cvThreshold(exa_1, exa_2, 100, 255, CV_THRESH_TRUNC);
	cvNamedWindow("²âÊÔ´°¿Ú");
	cvCreateTrackbar("testbar", "²âÊÔ´°¿Ú", &value, maxsize, turnback);
	turnback(0);
	waitKey(0);
	return 0;
}

void turnback(int pos)
{
	cvThreshold(exa_1,exa_2,2*(100-pos),255,CV_THRESH_TRUNC);
	cvShowImage("²âÊÔ´°¿Ú",exa_2);
}



void On_mouse(int event, int x, int y, int flags, void *)
{
	//src.copyTo(dst);
	switch (event)
	{
	case EVENT_LBUTTONUP:
	{
							P = false;
	}
		break;
	case EVENT_LBUTTONDOWN:
	{

							  previousPoint = Point(x, y);

							  P = true;
	}
		break;

	case EVENT_MOUSEMOVE:
	{
							if (P)
							{
								Point pt(x, y);
								line(dst, previousPoint, pt, Scalar(0, 0, 255), 2, 0, 0);
								previousPoint = pt;
								imshow("²âÊÔ´°¿Ú", dst);
							}
	}
		break;
	}
}