/*int add2 (struct X *x) {
  if (x == NULL) return 0;
  else return x->val + add2(x->next);
}*/

.data
.text

.globl add2

add2:

push %rbp
movq %rsp, %rbp
subq $16,  %rsp 

cmp $0, 8(%rdi)
je fim

addl (%rdi), %eax
movq 8(%rdi), %rdi
/*else*/
call add2

fim:
movq  %rbp,    %rsp
popq  %rbp
ret 
