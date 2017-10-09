/*double boo (double v) {
  int a1[4] = {1,2,3,4};
  double a2[4];
  int i;

  foo(a1, a2, 4);
  for (i = 0; i < 4; i++)
    v += a2[i];
  return v;
}*/



.data
.text
.globl boo
boo:

push %rbp
movq %rsp, %rbp
subq  $64, %rsp

movq $4,  -4(%rbp)
movq $3,  -8(%rbp)
movq $2,  -12(%rbp)
movq $1,  -16(%rbp)
#a2[0]    -24(%rbp)
#a2[1]    -32(%rbp)
#a2[2]    -40(%rbp)
#a2[3]    -48(%rbp)
movq $0,  -52(%rbp) /* i = 0*/


call foo4
for:
cmpl $4, -28(%rbp)
je FIM
 
addsd %

addl $1, -28(%rbp)
FIM:
movq %rbp, %rsp
pop  %rbp
ret
