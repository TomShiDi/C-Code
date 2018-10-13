#include<opencv2/nonfree/nonfree.hpp>
#include<opencv2/core/core.hpp>
#include<opencv2/features2d/features2d.hpp>
#include<opencv2/opencv.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/legacy/legacy.hpp>
#include<iostream>
using namespace std;
using namespace cv;

int main()
{
	Mat srcimage1 = imread("D:\\1.jpg");
	resize(srcimage1,srcimage1,Size(800,700));
	Mat srcimage2 = imread("D:\\1_1.jpg");
	cout << srcimage2.type() <<srcimage1.type()<< endl;
	//Mat roi = srcimage2(Rect(0,0,500,500));
	Mat roi;
	resize(srcimage2, roi, Size(500, 400));
	Mat descriputors1, descriputors2;
	vector<KeyPoint> Keypoint1,Keypoint2;
	int min = 400;
	SurfFeatureDetector detector = SurfFeatureDetector(min);
	SurfDescriptorExtractor Descriputor;
	detector.detect(srcimage1,Keypoint1);
	detector.detect(roi, Keypoint2);
	Descriputor.compute(srcimage1,Keypoint1,descriputors1);
	Descriputor.compute(roi,Keypoint2,descriputors2);
	drawKeypoints(srcimage1,Keypoint1,srcimage1,Scalar(0,0,255));
	BruteForceMatcher <L2<float>> matcher;
	vector<DMatch> matches;
	matcher.match(descriputors1,descriputors2,matches);
	std::nth_element(matches.begin(), matches.begin() + 24, matches.end());
	matches.erase(matches.begin()+25,matches.end());
	Mat dstimage;
	drawMatches(srcimage1,Keypoint1,roi,Keypoint2,matches,dstimage,Scalar(0,0,255));
	imshow("ÌØÕ÷µã",dstimage);
	waitKey(0);
	return 0;
}