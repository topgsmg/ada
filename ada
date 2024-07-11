4.......
#include<stdio.h>
int main ()
{
int n,a[20][20],i,j,min,u,v,s[10],d[10],k;
printf ("Enter the number of vertices\n");
scanf("%d",&n);
printf ("Enter adjacency matrix\n");
for(i=1;i<=n;i++)
{
for(j=1;j<=n;j++)
{
scanf("%d",&a[i][j]);
}
}
printf("Enter source vertex\n");
scanf("%d",&v);
for(i=1;i<=n;i++)
{
s[i]=0;
d[i]=a[v][i];
}
d[v]=0;
s[v]=1;
for(k=2;k<=n;k++)
{
min=999;
for(i=1;i<=n;i++)
{
if(d[i]<min && s[i]==0)
{
min=d[i];
u=i;
}
}
s[u]=1;
for(i=1;i<=n;i++)
{
if(s[i]==0)
{
if(d[i]>d[u]+a[u][i])
{
d[i]=d[u]+a[u][i];
}
}
}
}
for(i=1;i<=n;i++)
{
printf("%d---->%d=%d\n",v,i,d[i]);
}
}


5.........
#include<stdio.h>
void ts(int a[20][20], int n)
{
int t[10],vis[10],stack[10],i,j,indeg[10],top=0,ele,k=1;
for(i=1;i<=n;i++)
{
t[i]=0;
vis[i]=0;
indeg[i]=0;
}
for(i=1;i<=n;i++)
{
for(j=1;j<=n;j++)
{
if(a[i][j]==1)
{
indeg[j]=indeg[j]+1;
}
}
}
printf("Indegree Array:");
for(i=1;i<=n;i++)
printf("%d ",indeg[i]);
for(i=1;i<=n;i++)
{
if(indeg[i]==0)
{
stack[++top]=i;
vis[i]=1;
}
}
while(top>0)
{
ele=stack[top--];
t[k++]=ele;
for(j=1;j<=n;j++)
{
if(a[ele][j]==1 && vis[j]==0)
{
indeg[j]=indeg[j]-1;
if(indeg[j]==0)
{
stack[++top]=j;
vis[j]=1;
}
}
}
}
printf("\nTopological Ordering is:");
for(i=1;i<=n;i++)
printf("%d",t[i]);
}
int main()
{
int n,a[20][20],i,j;
printf("Enter the number of nodes\n");
scanf("%d",&n);
printf("Enter Adjacency matric\n");
for(i=1;i<=n;i++)
{
for(j=1;j<=n;j++)
{
scanf("%d",&a[i][j]);
}
}
ts(a,n);
}



10.......

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

11.........
#include<stdlib.h>
#include<stdio.h>
#include<time.h>
void merge(int arr[], int l, int m, int r)
{
int i, j, k;
int n1 = m - l + 1;
int n2 = r - m;
// Create temp arrays
int L[n1], R[n2];
// Copy data to temp array
for (i = 0; i < n1; i++)
L[i] = arr[l + i];
for (j = 0; j < n2; j++)
R[j] = arr[m + 1+ j];
// Merge the temp arrays
i = 0;
j = 0;
k = l;
while (i < n1 && j < n2)
{
if (L[i] <= R[j])
{
arr[k] = L[i];
i++;
}
else
{
arr[k] = R[j];
j++;
}
k++;
}
// Copy the remaining elements of L[]
while (i < n1)
{
arr[k] = L[i];
i++;
k++;
}
// Copy the remaining elements of R[]
while (j < n2)
{
arr[k] = R[j];
j++;
k++;
}
}
void mergeSort(int arr[], int l, int r)
{
if (l < r)
{
// Finding mid element
int m = l+(r-l)/2;
// Recursively sorting both the halves
mergeSort(arr, l, m);
mergeSort(arr, m+1, r);
merge(arr, l, m, r);
}
}
void main()
{
srand(time(NULL));
int arr[100000],n=100000,i,size;
int elements[n];
for(i=0;i<n;i++)
elements[i]=rand()%1000;
for(size=5000;size<n;size+=5000)
{
arr[size];
for(i=0;i<n;i++)
{
arr[i]=elements[i];
}
clock_t start=clock();
mergeSort(arr, 0,size);
clock_t end=clock();
printf("Total time taken to sort %d elements is %lf\n",size,((double)(endstart)/CLOCKS_PER_SEC));
}
}
