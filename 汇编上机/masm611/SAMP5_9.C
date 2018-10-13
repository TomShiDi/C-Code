#include "math.h"
main()
{int m,k,i,n=0;
 for(m=101;m<=200;m=m+2)
    {if (n%10==0) printf("\n");
     k=sqrt(m);
     for(i=2;i<=k;i++)
	if (m%i==0) break;
     if(i>=k+1) {printf("%4d",m);n++;}   }   }