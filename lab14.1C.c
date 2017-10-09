#include <stdio.h>
#include <math.h>

float foo (double a, float b);
float foo1 (float a, float b);
double foo2 (float a, float b);
double foo3 (double *a, int n);
void foo4 (int a[], double b[], int n);
/*
  float foo (double a, float b) {
  return (a+b)*(a-b);
}
*/

int main(void)
{	
	int n = 6, i = 0;
	int a[] = {1, 2, 3, 4, 5, 6};
	double b[] = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0};

	foo4(a, b, n);
	for(i = 0; i < 6; i++)
	{
		printf("Double[%d] = %.2lf\n", i, b[i]);	
	}
	//double r[] = {M_PI_2, M_PI_2, M_PI_2, M_PI_2, M_PI_2, M_PI_2, M_PI_2};
	//printf("Valor: %.2lf\n", foo3(r, 7));
	//printf("Valor: %.2lf\n", foo2( (M_PI_2), M_PI) );
	//printf("Valor: %.2f\n", foo1((M_PI_2), 0.5));
	//printf("Valor: %.2f\n", foo(7, 5));
	return 0;

}

