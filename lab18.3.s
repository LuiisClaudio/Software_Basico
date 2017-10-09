/*struct X {
  int vi;
  double vd;
  struct X *next;
};

double pack (struct X *px) {
  double acc = 0;
  while (px != NULL) {
    acc += foo(px->vd, px->vi);
    px = px->next;
  }
  return acc;
}*/

.data
.text
.globl pack 

pack:

pushq %rbp
movq %rsp, %rbp
subq $16, %rsp

movq $0, -8(%rbp)
movq %rdi, %r12

while:
cmpq $0, %r12
je FIM

movl (%r12), %edi
addq $8, %r12

movsd (%r12), %xmm0
addq $8, %r12

call foo
movsd -8(%rbp), %xmm1
addsd %xmm0, %xmm1
movsd %xmm1, -8(%rbp)
movq (%r12), %r12 
jmp while

FIM:
movsd -8(%rbp), %xmm0

movq %rbp, %rsp
popq %rbp
ret
