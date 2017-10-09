/*
  float foo (double a, float b) {
  return (a+b)*(a-b);
}
*/

.data
.text 

.globl foo

foo:
push %rbp
movq %rsp, %rbp
sub  $16, %rsp


cvtss2sd %xmm1, %xmm1 /* */

movsd %xmm0, %xmm2  /*xmm2 = a */

addsd %xmm1, %xmm0 /* a = a + b */

subsd %xmm1, %xmm2 /* xmm2 = a - b */

mulsd %xmm2, %xmm0 /* a+b * a-b */

cvtsd2ss %xmm0, %xmm0

movq %rbp, %rsp
pop  %rbp
ret 
