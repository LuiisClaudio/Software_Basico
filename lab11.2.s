/*int bemboba (int num) {
  int local[4];
  int *a;
  int i;

  for (i=0,a=local;i<4;i++) {
    *a = num;
    a++;
  }
  return addl (local, 4);
}*/

.data
.text

.globl bemboba

bemboba:

push %rbp
movq %rsp, %rbp
subq $32,  %rsp
movq %rbx, -8(%rbp)
movq %r12, -16(%rbp)

movl $0,     %ebx
leaq -32(%rbp), %r12 

for:
cmp $4, %ebx 
je FIM

movl (%rdi), (%r12) 
subq $4,  %r12
addl $1,  %ebx
jmp for

FIM:
leaq -32(%rbp), %rdi
movl %ebx, %esi
call addl

movq -8(%rbp), %rbx
movq -16(%rbp), %r12
movq %rbp, %rsp
pop  %rbp
ret
