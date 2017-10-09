.data
.text

.globl foo

foo:
push %rbp
movq %rsp, %rbp
subq $32, %rsp
movq %rbx, -8(%rbp)
movq %r13, -16(%rbp)
movq %r14, -24(%rbp)

movq $16, %rbx
movq $0, %r13 

tam:
cmp  %esi, %ebx
jge aloc
addl $16, %ebx
jmp tam

aloc:
subq (%rbx), %rsp
movq %rsp, %r14
subq $8, %r14
movq (%rsi), %rbx

for:
cmp  %rbx, %r13
jge FIM
movq %r14, %rdi
call calcula
movl %eax, (%r14)
addq $4, %r14
addl $1, (%r13)
subl (%r13), %esi
jmp for

FIM:
movq %rsp, %rdi
movq %rbx, %rsi
call calcula
movq %rbp, %rsp
leave
ret
