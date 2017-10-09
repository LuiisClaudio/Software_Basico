/*
struct X {
  int val;
  struct X *next;
};

int add (struct X *x) {
  int a = 0;
  for (; x != NULL; x = x->next)
    a += x->val;
  return a;
}
}*/

.data
.text

.globl addLab10

addLab10:

push %rbp
movq %rsp, %rbp
subq $16,  %rsp
movq %rbx, -8(%rbp)
/*movl -16(%rbp), %r10d*/
/*movq -32(%rbp),  %r12*/



movq    %rdi,  %rbx  /*ebx = val*/
movl    $0, %eax

main:
addl  (%rbx), %eax /*a =+ val*/

cmp $0, 8(%rbx) /*if x != null*/
je fim
/*else*/


movq 8(%rbx), %rbx
jmp main


fim:
movq -8(%rbp), %rbx 
movq  %rbp,    %rsp
popq  %rbp
ret 

