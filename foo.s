.data
.text

.globl foo

foo:

pushq %rbp
movq  %rsp, %rbp
subq $16, %rsp
movq %rbx, -8(%rbp)

movl  $0, %ebx
movl  $0, %eax

L1:
cmpl  %ebx, %esi /*if(i < n)*/
jl fim

addl  (%rdi), %eax /*s =+ a[i] */

cmpl  $0,     (%rdi) /*if(a[i] == 0*/
je soma

addq  $4, %rdi /*a++*/
addl  $1, %ebx /*i++*/
jmp L1 

soma: /*Else*/
addl  %eax, (%rdi) /*a[i] = s*/
movl  $0, %eax  /* s = 0*/
addq  $4, %rdi  /* a++ */
addl  $1, %ebx  /* i++*/
jmp L1


fim:
movq  -8(%rbp), %rbx
movq  %rbp, %rsp
popq  %rbp
ret
