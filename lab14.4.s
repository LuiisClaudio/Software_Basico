/*
double foo3 (double *a, int n) {
  int i;
  double r = 0.0;
  for (i=0; i<n; i++) {
    r += sin(*a);
    a++;
  }
  return r;
}
*/

.data
.text
.globl foo3
foo3:
push %rbp
movq %rsp, %rbp
sub  $32, %rsp
movq $0, -16(%rbp) /*double r*/
movl $0,  -4(%rbp) /*int i*/
movq %r12, -24(%rbp)
movq $0,   -32(%rbp)

movq %rdi, %r12
movsd -32(%rbp), %xmm4

movl %esi, %ebx /*int n*/
for:
cmpl %ebx, -4(%rbp)
je FIM

movsd (%r12), %xmm0
call sin
movsd -16(%rbp), %xmm4
addsd %xmm0, %xmm4
movsd %xmm4, -16(%rbp) 

addq $8, %r12
addl $1, -4(%rbp)
jmp for

FIM:

movsd -16(%rbp), %xmm0
	#cvtsd2siq %xmm0, %eax
movq  -24(%rbp), %r12
movq %rbp, %rsp
pop  %rbp
ret

