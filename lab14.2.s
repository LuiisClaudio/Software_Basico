/*float foo1 (float a, float b) {
  return sin(a) + b;
}*/

.data
.text 

.globl foo1

foo1:
push %rbp
movq %rsp, %rbp
sub  $16, %rsp
movss %xmm0, -4(%rbp)
movss %xmm1, -8(%rbp)


/*cvttss2siq %xmm0, %rdi */
cvtss2sd %xmm0, %xmm0
call sin
cvtsd2ss %xmm0, %xmm0

movss -8(%rbp), %xmm1
addss %xmm1, %xmm0



movq %rbp, %rsp
pop  %rbp
ret
