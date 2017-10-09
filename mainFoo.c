#include <stdio.h>

struct X {
  int vi;
  double vd;
  struct X *next;
};

struct X1 {
  int vi;
  float vf;
};


double foo (double a, int b);
double pack (struct X *px);
double pack1 (struct X1 *px, int n);

int main(void)
{
	struct X x[3] = {{1.0, 2, &x[1]}, {3.0, 4, &x[2]}, {5.0, 6, NULL}};
	struct X1 x1[3] = {{1, 2.0}, {3, 4.0}, {5, 6.0}};
	//double a = pack(x);
	double c = pack1(x1, 3);
	printf("\nFoo: %f\n", c);
	return 0;
} 
