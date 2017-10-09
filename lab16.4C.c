#include <stdio.h>

/*
0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 10          	sub    $0x10,%rsp
   8:	89 f8                	mov    %edi,%eax
   a:	83 c0 01             	add    $0x1,%eax
   d:	48 89 ec             	mov    %rbp,%rsp
  10:	5d                   	pop    %rbp
  11:	c3                   	retq   
*/

unsigned char codigo[] = {0x55, 0x48, 0x89, 0xe5, 0x48, 0x83, 0xec, 0x10, 0x89, 0xf8, 0xe8, 0x00, 0x00, 0x00, 0x00, 0x48, 0x89, 0xec, 0x5d, 0xc3};

typedef int (*funcp) (int x);


int add (int x) {
  return x+1;
}


int main(void)
{
	int i, n = 10;
	long addCall =   (long)&add - (long)(&codigo[n+5]);	
	
	codigo[14] = ((0xff000000 & addCall) >> 24); 
	codigo[13] = ((0xff0000 & addCall) >> 16);
	codigo[12] = ((0xff00 & addCall) >> 8);
	codigo[11] = (0xff & addCall);
	
	funcp f = (funcp)codigo;
	i = (*f)(10);
	printf("\ni = %d\n", i);
	//printf("%d", foo(10));
	return 0;
}
