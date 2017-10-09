  .data
  nums: .int 3, -5, 7, 8, -2
  s1:   .string "%d\n"

  .text
  .globl main
  main:
  /* prologo */
     pushq %rbp
     movq  %rsp, %rbp
     subq  $16, %rsp
     movq  %rbx, -8(%rbp)
     movq  %r12, -16(%rbp)

  /* coloque seu codigo aqui */
     movq    $nums, %r12  /* r12 = &nums */
     /*movl    $s1, %ebx*/
     movl    $0, %ebx
L1:
     cmpl    $4, %ebx
     je      FIM

     movsbl  (%r12), %eax
     addq $4, %r12
     addl $1, %ebx
     
     cmpl $1, %eax
     jg       Imprime 
     jmp L1
     /*movl $0, %eax*/

 Imprime:
     movq $s1, %rdi
     movl %eax, %esi
     movl $0, %eax 
     call  printf       /* chama a funcao da biblioteca */
     jmp L1
     
FIM:
  /* finalizacao */
     movq -8(%rbp), %rbx
     movq -16(%rbp), %r12
     leave
     ret
