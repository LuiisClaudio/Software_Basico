/*
int novonum(void) {
  int minhalocal;
  printf("numero: ");
  scanf("%d",&minhalocal);
  return minhalocal;
}
*/

.data
.text

.globl novonum

Sf:  .string "%d"
Sf2: .string "numero: " 

novonum:

push %rbp
movq %rsp, %rbp
subq $16,  %rsp

movq $Sf2, %rdi
call printf

movq $Sf, %rdi
leaq -4(%rbp), %rsi
call scanf

movl -4(%rbp), %eax


movq %rbp, %rsp
pop %rbp
ret




