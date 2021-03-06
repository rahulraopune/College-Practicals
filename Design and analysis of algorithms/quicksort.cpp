#include<iostream>
#include<omp.h>

using namespace std;

//Function for partitioning array
int part(int low,int high,int *a)
{
     int i,h=high,l=low,p,t;  //p==pivot
     p=a[low];
     while(low<high)
     {
                    while(a[l]<p)
                    {
                                   l++;
                    }
                    while(a[h]>p)
                    {
                                   h--;
                    }
                    if(l<h)
                    {
                                t=a[l];
                                a[l]=a[h];
                                a[h]=t;
                    }
                    else
                    {
                        t=p;
                        p=a[l];
                        a[l]=t;
                        break;
                    }
     }
     return h;
}

void quick(int l,int h,int *a)
{
  int index,i;
  if(l<h)
  {
          index=part(l,h,a);
          #pragma omp parallel sections num_threads(2)
          {
          	#pragma omp section
          	quick(l,index-1,a);
          	#pragma omp section
          	quick(index+1,h,a);
          }
  }
}

int main()
{
      int a[100],n,l,h,i;
      cout<<"Enter number of elements:";
      cin>>n;
      cout<<"Enter the elements ";
      for(i=0;i<n;i++)
      cin>>a[i];
      cout<<"\nInitial Array:\n";
      for(i=0;i<n;i++)
      {
                      cout<<a[i]<<"\t";
      }
      h=n-1;
      l=0;
      quick(l,h,a);
      cout<<"\nAfter Sorting:\n";
      for(i=0;i<n;i++)
      {
                cout<<a[i]<<"\t";
      }
     
      return 0;
}

/* OUTPUT:
Enter number of elements:4 
Enter the elements :3 8 1 4 
Initial Array: 3 8 1 4 
After Sorting: 1 3 4 8 
*/ 

