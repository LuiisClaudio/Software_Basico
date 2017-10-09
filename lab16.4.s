/*(int foo (int x) {
  return add(x);
}*/

.data
.text
.globl foo
foo:

push %rbp
movq %rsp, %rbp
sub $16, %rsp

movl %edi, %eax
call add

movq %rbp, %rsp
pop %rbp
ret
