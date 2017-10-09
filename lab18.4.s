/*struct X1 {
  int vi;
  float vf;
};

double pack1 (struct X1 *px, int n) {
  double acc = 0;
  int i;
  for (i=0;i<n;i++)
    acc += foo(px[i].vf, px[i].vi);
  return acc;
}*/

.data
.text
.globl pack1 

pack1:

pushq %rbp
movq %rsp, %rbp
subq $16, %rsp

movq $0, -8(%rbp)
movq %rdi, %r12
movl $0, %ebx
movl %esi, %r13d
addl $1, %r13d 

for:
cmpl %r13d, %ebx
je FIM

movl (%r12), %edi
addq $4, %r12

movsd (%r12), %xmm0
cvtss2sd %xmm0, %xmm0
addq $4, %r12

call foo

movsd -8(%rbp), %xmm2
addsd %xmm0, %xmm2
movsd %xmm2, -8(%rbp)
addl $1, %ebx 
jmp for

FIM:
movsd -8(%rbp), %xmm0

movq %rbp, %rsp
popq %rbp
ret
