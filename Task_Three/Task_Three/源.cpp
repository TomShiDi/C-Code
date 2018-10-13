#include<iostream>

int resourceInit();
int requestInit();
int allocationInit();
int neednessInit();
int restInit();
int judgement();
int allocationHandle();
int restHandle();


int request_static[4][3] = { 3, 2, 2, 6, 1, 3, 3, 1, 4, 4, 2, 2 };//各程序的最大资源需求,默认系统事先已知此条件
int allocation_static[4][3] = { 1, 0, 0, 6, 1, 2, 2, 1, 1, 0, 0, 2 };

int request[4][3] = { 0 }, allocation[4][3] = { 0 }, resource[3] = { 0 }, rest[3] = { 0 }, needness[4][4] = {0};

int main()
{
	while (1)
	{
		resourceInit();
		requestInit();
		restInit();
		allocationHandle();
		neednessInit();
		restHandle();
		judgement();
	}
	return 0;
	
}


int resourceInit()
{
	resource[0] = 9;
	resource[1] = 3;
	resource[2] = 6;


	return 0;
}


int requestInit()
{
	
	for (int i = 0; i < 4; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			request[i][j] = request_static[i][j];
		}
	}

	return 0;
}



//int allocationInit()
//{
//	for (int i = 0; i < 4; i++)
//	{
//		for (int j = 0; j < 3; j++)
//		{
//			allocation[i][j] = allocation_static[i][j];
//		}
//	}
//	return 0;
//}

//资源分配后各程序还需要的资源数
int neednessInit()
{
	for (int i = 0; i < 4; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			needness[i][j] = request[i][j] - allocation[i][j];
		}
	}
	return 0;
}

//剩余资源初始化
int restInit()
{
	
	for (int i = 0; i < 3; i++)
	{
		rest[i] = resource[i];
	}
	return 0;
}


//判断系统是否能安全运行
int judgement()
{
	//int resourceRequired[3] = {0};
	for (int i = 0; i < 3; i++)
	{
		int sum = 0;
		for (int j = 0; j < 4; j++)
		{
			sum = sum + allocation[j][i];
		}
		if (resource[i] < sum)
		{
			std::cout << "资源初始分配不能满足要求" << std::endl;
			//exit(1);
			return 1;
		}
	}

	for (int j = 0; j < 4; j++)
	{
		for (int i = 0; i < 4; i++)
		{
			if (needness[i][3] == 0 && needness[i][0] <= rest[0] && needness[i][1] <= rest[1] && needness[i][2] <= rest[2])
			{
				needness[i][3] = 1;
				std::cout << "进程" << i + 1 << "运行结束,释放资源" << std::endl;
				rest[0] = rest[0] + allocation[i][0];
				rest[1] = rest[1] + allocation[i][1];
				rest[2] = rest[2] + allocation[i][2];
				break;
			}
			else
			{

			}
		}
	}


	for (int i = 0; i < 4; i++)
	{
		if (needness[i][3] == 0)
		{
			std::cout << "进程" << i + 1 << "需求不能满足要求" << std::endl;
			std::cout << "\n" << "系统处于不安全状态，有死锁的可能性" << std::endl;
			restInit();
			//exit(1);
			return 1;
		}
	}
	std::cout << "资源分配后系统处于安全状态" << std::endl;
	return 0;

}


//手动分配资源
int allocationHandle()
{
	for (int i = 0; i < 4; i++)
	{
		std::cout << "请输入第" << i + 1 << "号程序的资源分配(数字之间空格隔开)" << std::endl;
		for (int j = 0; j < 3; j++)
		{
			std::cin>>allocation[i][j];
		}
	}
	return 0;
}


//计算手动分配资源后剩余的资源
int restHandle()
{
	for (int i = 0; i < 3; i++)
	{
		int sum = 0;
		for (int j = 0; j < 4; j++)
		{
			sum = sum + allocation[j][i];
		}
		rest[i] = resource[i] - sum;
	}
	return 0;
}

