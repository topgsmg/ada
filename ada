
6......
#include<stdio.h>
int w[10],p[10],n;
int max(int a,int b)
{
return a>b?a:b;
}
int knap(int i,int m)
{
if(i==n) return w[i]>m?0:p[i];
if(w[i]>m) return knap(i+1,m);
return max(knap(i+1,m),knap(i+1,m-w[i])+p[i]);
}
int main()
{
int m,i,max_profit;
printf("\nEnter the no. of objects:");
scanf("%d",&n);
printf("\nEnter the knapsack capacity:");
scanf("%d",&m);
printf("\nEnter profit followed by weight:\n");
for(i=1;i<=n;i++)
scanf("%d %d",&p[i],&w[i]);
max_profit=knap(1,m);
printf("\nMax profit=%d",max_profit);
return 0;
}


7.....
#include <stdio.h>
#define MAX 50
int p[MAX], w[MAX], x[MAX];
double maxprofit;
int n, m, i;
void greedyKnapsack(int n, int w[], int p[], int m) {
 double ratio[MAX];

 // Calculate the ratio of profit to weight for each item
 for (i = 0; i < n; i++) {
 ratio[i] = (double)p[i] / w[i];
 }
 // Sort items based on the ratio in non-increasing order
 for (i = 0; i < n - 1; i++) {
 for (int j = i + 1; j < n; j++) {
 if (ratio[i] < ratio[j]) {
 double temp = ratio[i];
 ratio[i] = ratio[j];
 ratio[j] = temp;

 int temp2 = w[i];
 w[i] = w[j];
 w[j] = temp2;

 temp2 = p[i];
 p[i] = p[j];
 p[j] = temp2;
 }
 }
 }
 int currentWeight = 0;
 maxprofit = 0.0;
 for (i = 0; i < n; i++) {
 if (currentWeight + w[i] <= m) {
 x[i] = 1; // Item i is selected
 currentWeight += w[i];
 maxprofit += p[i];
 } else {
 // Fractional part of item i is selected
 x[i] = (m - currentWeight) / (double)w[i];
 maxprofit += x[i] * p[i];
 break;
 }
 }
 printf("Optimal solution for greedy method: %.1f\n", maxprofit);
 printf("Solution vector for greedy method: ");
 for (i = 0; i < n; i++)
 printf("%d\t", x[i]);
}
int main() {
 printf("Enter the number of objects: ");
 scanf("%d", &n);
 printf("Enter the objects' weights: ");
 for (i = 0; i < n; i++)
 scanf("%d", &w[i]);
 printf("Enter the objects' profits: ");
 for (i = 0; i < n; i++)
 scanf("%d", &p[i]);
 printf("Enter the maximum capacity: ");
 scanf("%d", &m);
 greedyKnapsack(n, w, p, m);
 return 0;
}



8......
#include<stdio.h>
// #include<conio.h>
#define MAX 10
int s[MAX],x[MAX],d;
void sumofsub(int p,int k,int r)
{
int i;
x[k]=1;
if((p+s[k])==d)
{
for(i=1;i<=k;i++)
if(x[i]==1)
printf("%d ",s[i]);
printf("\n");
}
else
if(p+s[k]+s[k+1]<=d)
sumofsub(p+s[k],k+1,r-s[k]);
if((p+r-s[k]>=d) && (p+s[k+1]<=d))
{
x[k]=0;
sumofsub(p,k+1,r-s[k]);
}
}
int main()
{
int i,n,sum=0;
printf("\nEnter the n value:");
scanf("%d",&n);
printf("\nEnter the set in increasing order:");
for(i=1;i<=n;i++)
scanf("%d",&s[i]);
printf("\nEnter the max subset value:");
scanf("%d",&d);
for(i=1;i<=n;i++)
sum=sum+s[i];
if(sum<d || s[1]>d)
printf("\nNo subset possible");
else
sumofsub(0,1,sum);
return 0;
}



12......
#include<stdio.h>
#include<stdlib.h>
int board[20], count;
void print(int n)
{
int i, j;
printf("\n\nSolution %d:\n\n",++count);
for(i=1;i<=n;i++)
printf("\t%d",i);
for(i=1;i<=n;i++)
{
printf("\n\n%d",i);
for(j=1;j<=n;j++)
{
if(board[i]==j)
printf("\tQ");
else
printf("\t-");
}
}
}
int place(int row,int column)
{
int i;
for(i=1;i<=row-1;i++)
{
if(board[i]==column)
return 0;
else if(abs(board[i]-column)==abs(i-row))
return 0;
}
return 1;
}
void queen(int row,int n)
{
int column;
for(column=1;column<=n;column++)
{
if(place(row,column))
{
board[row]=column;
if(row==n)
print(n);
else
queen(row+1,n);
}
}
}
int main()
{
int n;
printf("Enter number of Queens:");
scanf("%d",&n);
queen(1,n);
}

