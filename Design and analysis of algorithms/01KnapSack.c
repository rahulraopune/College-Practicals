// A Dynamic Programming based solution for 0-1 Knapsack problem
#include<stdio.h>

// A utility function that returns maximum of two integers
int max(int a, int b) { return (a > b)? a : b; }

//int table[5][6];

// Returns the maximum value that can be put in a knapsack of capacity W
int knapSack(int W, int wt[], int val[], int n)
{
   int i, w,j,k;
   int table[n+1][W+1];

   // Build table K[][] in bottom up manner
   for (i = 0; i <= n; i++)
   {
       for (j = 0; j <= W; j++)
       {
           if (i==0 || j==0)
           {
               table[i][j] = 0;
           }
           else if (wt[i-1] <= j)
           {
                 table[i][j] = max(val[i-1] + table[i-1][j-wt[i-1]],  table[i-1][j]);
           }
           else
           {
                 table[i][j] = table[i-1][j];
           }
       }
   }
   
   for(i=0;i<=n;i++)
   {
   	for(j=0;j<=W;j++)
   	{
   		printf("%d ",table[i][j]);
	}
	printf("\n");
   }


	printf("\nFor the Knapsack...");
	i=n;
	k=W;

  	while(i>0 && k>0)

  	{

		if(table[i][k]!=table[i-1][k])

		{

	 		printf("\nItem %d is selected",i);

	 		i=i-1;

	 		k=k-wt[i];

		}

		else
		{
	

			i=i-1;

		}	
	}


   return table[n][W];
}


int main()
{
    int val[] = {60,100,120};
    int wt[] = {10,20,30};
    int  W = 50;
    int n = sizeof(val)/sizeof(val[0]);
    printf("\n%d\n", knapSack(W, wt, val, n));
    return 0;
}
