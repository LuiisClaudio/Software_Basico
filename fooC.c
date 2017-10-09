#include <stdio.h>

void foo (int a[], int n);

int main(void)
{
	int i;
	int a[5] = {1,2,3,4,0};
	foo(a, 5);
	
	printf("\n");
	for(i = 0; i < 5; i++)
	{
		printf("Indice:%d - %d\n", i, a[i]);
	}
}
