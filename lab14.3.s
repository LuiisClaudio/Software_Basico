/*double foo2 (float a, float b) {
  return sin(a) + cos(b);
}*/

.data
.text 

.globl foo2

foo2:
push %rbp
movq %rsp, %rbp
sub  $16, %rsp
movss %xmm0, -4(%rbp)
movss %xmm1, -8(%rbp)

cvtss2sd %xmm0, %xmm0
call sin
cvtsd2ss %xmm0, %xmm0
movss %xmm0, -12(%rbp) /*sin(a)*/

movss -8(%rbp), %xmm0 /*b = xmm1*/
cvtss2sd %xmm0, %xmm0
call cos
cvtsd2ss %xmm0, %xmm0	/*cos(b)*/

addss -12(%rbp), %xmm0 /*sin(a) + cos(b)*/
cvtss2sd %xmm0, %xmm0

movq %rbp, %rsp
pop  %rbp
ret
