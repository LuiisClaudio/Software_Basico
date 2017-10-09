/*
void foo (int a[], double b[], int n) {
  int *pint;
  double *pdouble;

  for (pint = a, pdouble = b; n-- ; pint++, pdouble++) {
    *pdouble = (double)*pint * 2.0;
  }
}
*/

.data
.text
.globl foo4
foo4:

push %rbp
movq %rsp, %rbp
subq  $32, %rsp

movq %rdi, %r12
movq %rsi, %r13
movl %edx, %r14d
movl $2, %ebx
cvtsi2sd %ebx, %xmm0

for:
cmpl $1, %r14d
je FIM

cvtsi2sd (%r13), %xmm1
mulsd %xmm0, %xmm1
movsd %xmm1, (%r12)

addq $8, %r12
addq $4, %r13
subl $1, %r14d
jmp for

FIM:
movq %rbp, %rsp
pop  %rbp
ret
