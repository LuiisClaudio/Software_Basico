.data
 
.text
.globl  add

add:

pushq %rbp
movq  %rsp, %rbp

addl  %edx, %edi
addl  %esi, %edi


movl  %edi, %eax

movq  %rbp, %rsp
popq  %rbp
ret
