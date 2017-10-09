/*int myotherwrite (int fd, char *s);*/

.data
.text
.globl myotherwrite
fs: .string "\0"
myotherwrite:

push %rbp
movq %rsp, %rbp
movq %rdi, -8(%rbp)
movq %rsi, -16(%rbp)
sub $16, %rsp

/*
#tenho que ler o *s
movq $0, %rax
syscall
*/
movl $0, %r12d
movq %rsi, %rbx
while:
cmpb $0, (%rbx)
je ler

addl $1, %r12d
addq $1, %rbx
jmp while


ler:
#escrevendo no arquivo
#movq -8(%rbp), %rdi
#movq -16(%rbp), %rsi
movl %r12d, %edx
movq $1, %rax
syscall 

/*
#fechando o arquivo
movq -8(%rbp), %rdi
movq $3, %rax
syscall 
*/


movq %rbp, %rsp
pop %rbp
ret

