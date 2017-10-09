/*
int foo (int x) {
	  return x+1;
}

*/

.data
.text
.globl foo
foo:

push %rbp
movq %rsp, %rbp
sub $16, %rsp

movl %edi, %eax
addl $1, %eax

movq %rbp, %rsp
pop %rbp
ret
