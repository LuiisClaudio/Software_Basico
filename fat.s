.data

.text
.globl fat

fat:

pushq %rbp
movq  %rsp, %rbp

movl  %edi, %eax

else:
cmpl $1, %edi
je fim

subl  $1, %edi
imull %edi, %eax
jmp else

fim:

movq  %rbp, %rsp
popq  %rbp
ret

