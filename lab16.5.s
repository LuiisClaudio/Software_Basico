/*int add (int x) {
  return x+1;
}
*/

.data
.text
.globl add
add:

push %rbp
movq %rsp, %rbp
sub $16, %rsp

movl %edi, %eax
addl $1, %eax

movq %rbp, %rsp
pop %rbp
ret
