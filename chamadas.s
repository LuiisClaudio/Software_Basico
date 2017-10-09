/*
int myopen (const char *pathname, int flags, int buffersize) {
  tamBufferAberto = buffersize;
  return open(pathname, flags);
}

ssize_t myread(int fd, void *buf) {
  return read(fd, buf, tamBufferAberto);
}
ssize_t mywrite(int fd, const void *buf, size_t count) {
  return write(fd, buf, count);
}

int myclose(int fd) {
  return close(fd);
}
*/

.data
.text
.globl myopen
.globl myread
.globl mywrite
.globl myclose


myopen:
push %rbp
movq %rsp, %rbp
sub $16, %rsp

movl %edx, tamBufferAberto

movq $2, %rax 
syscall

movq %rbp, %rsp
pop %rbp
ret


myread:
push %rbp
movq %rsp, %rbp
sub $16, %rsp

movl tamBufferAberto, %edx
movq $0, %rax 
syscall

movq %rbp, %rsp
pop %rbp
ret

mywrite:
push %rbp
movq %rsp, %rbp
sub $16, %rsp


movq $1, %rax 
syscall

movq %rbp, %rsp
pop %rbp
ret

myclose:
push %rbp
movq %rsp, %rbp
sub $16, %rsp

movq $3, %rax 
syscall

movq %rbp, %rsp
pop %rbp
ret


