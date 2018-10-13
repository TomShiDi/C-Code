#include<iostream>

int resourceInit();
int requestInit();
int allocationInit();
int neednessInit();
int restInit();
int judgement();
int allocationHandle();
int restHandle();


int request_static[4][3] = { 3, 2, 2, 6, 1, 3, 3, 1, 4, 4, 2, 2 };//������������Դ����,Ĭ��ϵͳ������֪������
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

//��Դ������������Ҫ����Դ��
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

//ʣ����Դ��ʼ��
int restInit()
{
	
	for (int i = 0; i < 3; i++)
	{
		rest[i] = resource[i];
	}
	return 0;
}


//�ж�ϵͳ�Ƿ��ܰ�ȫ����
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
			std::cout << "��Դ��ʼ���䲻������Ҫ��" << std::endl;
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
				std::cout << "����" << i + 1 << "���н���,�ͷ���Դ" << std::endl;
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
			std::cout << "����" << i + 1 << "����������Ҫ��" << std::endl;
			std::cout << "\n" << "ϵͳ���ڲ���ȫ״̬���������Ŀ�����" << std::endl;
			restInit();
			//exit(1);
			return 1;
		}
	}
	std::cout << "��Դ�����ϵͳ���ڰ�ȫ״̬" << std::endl;
	return 0;

}


//�ֶ�������Դ
int allocationHandle()
{
	for (int i = 0; i < 4; i++)
	{
		std::cout << "�������" << i + 1 << "�ų������Դ����(����֮��ո����)" << std::endl;
		for (int j = 0; j < 3; j++)
		{
			std::cin>>allocation[i][j];
		}
	}
	return 0;
}


//�����ֶ�������Դ��ʣ�����Դ
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

