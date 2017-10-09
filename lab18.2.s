/*double foo (double a, int b) {
  return a * (-b);
}*/
.data
.text
.globl foo 

foo:

pushq %rbp
movq %rsp, %rbp
subq $16, %rsp

movl $-1, %r10d
cvtsi2sd %r10d, %xmm2
cvtsi2sd %edi, %xmm1

mulsd %xmm2, %xmm1
#imull $-1, %edi
#cvtsi2sd %edi, %xmm1
mulsd %xmm1, %xmm0

movq %rbp, %rsp
popq %rbp
ret

