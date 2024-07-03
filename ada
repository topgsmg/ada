1........
 #include<stdio.h>
#include<time.h>
int i,j,k,a,b,u,v,n,ne=1;
int min,mincost=0,cost[9][9],parent[9];
int find(int);
int uni(int,int);
void main()
{
printf("\n\tImplementation of Kruskal's algorithm\n");
printf("\nEnter the no. of vertices:");
scanf("%d",&n);
printf("\nEnter the cost adjacency matrix:\n");
for(i=1;i<=n;i++)
{
for(j=1;j<=n;j++)
{
scanf("%d",&cost[i][j]);
if(cost[i][j]==0)
cost[i][j]=999;
}
}
printf("The edges of Minimum Cost Spanning Tree are\n"); clock_t start=clock();
while(ne < n)
{
for(i=1,min=999;i<=n;i++)
{
for(j=1;j <= n;j++)
{
if(cost[i][j] < min)
{
min=cost[i][j];
a=u=i;
b=v=j;
}
}
}
u=find(u);
v=find(v);
if(uni(u,v))
 {
printf("%d edge (%d,%d) =%d\n",ne++,a,b,min);
mincost +=min;
}
cost[a][b]=cost[b][a]=999;
}
printf("\n\tMinimum cost = %d\n",mincost);
clock_t end=clock();
printf("Start time is %lf\n",(double)start);
printf("End time is %lf\n",(double)end);
printf("Total time is %lf\n",(double)(end-start));
}
int find(int i)
{
while(parent[i])
i=parent[i];
return i;
}
int uni(int i,int j)
{
if(i!=j)
{
parent[j]=i;
return 1;
}
return 0;
}

2.......
 #include<stdio.h>
#include<time.h>
int visited[10]={0}, cost[10][10], min, mincost=0;
int i,j,ne=1, a, b, u, v;;
int main()
{
int num;
printf("\n\t\t\tPrim's Algorithm");
printf("\n\nEnter the number of nodes= ");
scanf("%d", &num);
printf("\nEnter the adjacency matrix\n\n");
for(i=1; i<=num; i++)
{
for(j=1; j<=num; j++)
{
scanf("%d", &cost[i][j]);
 if(cost[i][j]==0)
cost[i][j]=999;
}
}
clock_t start=clock();
visited[1]=1;
while(ne < num)
{
for(i=1,min=999;i<=num;i++)
for(j=1;j<=num;j++)
if(cost[i][j]< min)
if(visited[i]!=0)
{
min=cost[i][j];
a=u=i;
b=v=j;
}
printf("\n Edge %d:(%d - %d) cost:%d",ne++,a,b,min);
mincost=mincost+min;
visited[b]=1;
cost[a][b]=cost[b][a]=999;
}
printf("\n\n\n Minimun cost=%d",mincost);
 clock_t end=clock();
printf("\nStart time is %lf\n",(double)start);
printf("End time is %lf\n",(double)end);
printf("Total time is %lf\n",(double)(end-start));
return 0;
}


3a..........
 #include<stdio.h>
int min(int,int);
void floyds(int p[10][10],int n)
{
int i,j,k;
for(k=1;k<=n;k++)
{
for(i=1;i<=n;i++)
{
for(j=1;j<=n;j++)
{
if(i==j)
p[i][j]=0;
else
 p[i][j]=min(p[i][j],p[i][k]+p[k][j]);
}
}
}
}
int min(int a,int b)
{
if(a<b)
 return(a);
else
return(b);
}
void main()
{
int p[10][10],w,n,u,v,i,j;;
printf("\n Enter the number of vertices:");
scanf("%d",&n);
printf("\n Matrix of input data:\n");
for(i=1;i<=n;i++)
{
for(j=1;j<=n;j++)
 scanf("%d",&p[i][j]);
 if(p[i][j]==0)
 p[i][j]=999;
 }
floyds(p,n);
printf("\n The shortest paths are:\n");
for(i=1;i<=n;i++)
for(j=1;j<=n;j++)
 {
 if(i!=j)
 printf("\n <%d,%d>=%d",i,j,p[i][j]);
 }
}

3b.......
#include<stdio.h>
 int max(int, int);
 void warshal(int p[10][10], int n) 
{
 int i, j, k;
 for (k = 1; k <= n; k++)
 for (i = 1; i <= n; i++)
 for (j = 1; j <= n; j++)
 p[i][j] = max(p[i][j], p[i][k] && p[k][j]);
 }
 int max(int a, int b) 
{
 if (a > b)
 return (a);
 else
 return (b);
 }
 void main() 
{
 int p[10][10] = { 0 }, n, e, u, v, i, j;
 printf("\n Enter the number of vertices:");
 scanf("%d", &n);
 printf("\n Enter the Matrix of input data: \n");
 for (i = 1; i <= n; i++) 
{
 for (j = 1; j <= n; j++)
 scanf("%d", &p[i][j]);
}
 warshal(p, n);
 printf("\n Transitive closure: \n");
 for (i = 1; i <= n; i++)
{
 for (j = 1; j <= n; j++)
 printf("%d\t", p[i][j]);
 printf("\n");
 }
}

9........
 #include<stdio.h>
#include<stdlib.h>
#include<time.h>
void selectionsort(int A[],int n)
{
int i,j,min;
for(i=0;i<n-1;i++)
{
min=i;
for(j=i+1;j<n;j++)
{
if(A[j]<A[min])
{
min=j;
}
}
if(min!=i)
{
int temp=A[j];
A[j]=A[min];
A[min]=A[j];
}
}
}
int main()
{
srandom(time(NULL));
int n=30000,i;
int elements[n];
for(int i=0;i<n;i++)
{
elements[i]=rand()%1000;
}
for(int size=5000;size<=n;size+=2000)
{
int arr[size];
for(int i=0;i<size;i++)
{
arr[i]=elements[i];
}
clock_t start=clock();
selectionsort(arr,size);
clock_t stop=clock();
double time_taken=((double)(stop-start)/CLOCKS_PER_SEC);
printf("Timen taken to sort %d elements is %f seconds\n",size,time_taken);
}
return 0;
}

10.........

#include<stdio.h>
#include<time.h>
#include<stdlib.h>
void quicksort(int a[],int low,int high);
int partition(int a[],int low,int high);
void swap(int*,int*);
void quicksort(int a[],int low,int high)
{
if(low<high)
{
int pi = partition(a,low,high);
quicksort(a,low,pi-1);
quicksort(a,pi+1,high);
}
}
void swap(int *a,int *b)
{
int c=*a;
*a=*b;
*b=c;
}
int partition(int a[],int low,int high)
{
int pivot=a[high];
int i=low-1;
for(int j=low;j<=high-1;j++)
{
if(a[j]<=pivot)
{
i++;
swap(&a[i],&a[j]);
}
}
swap(&a[i+1],&a[high]); return (i+1);
}
 void main()
{
srand(time(NULL));
int a[100000],n=100000;
int elements[n];
for(int i=0;i<n;i++)
 {
 elements[i]=rand()%1000;
 }
 for(int size=5000;size<=n;size+=2000)
{
int arr[size];
for(int i=0;i<size;i++)
{
arr[i]=elements[i];
}
clock_t start=clock();
quicksort(a,0,size);
clock_t end=clock();
printf("Total time taken to sort %d elements is %lf\n",size,((double)(end-start)/CLOCKS_PER_SEC));
}
}
