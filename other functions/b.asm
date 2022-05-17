section .text

global f

f:
	mov rax,1
	mov rdi,1
	mov rdx,14
	syscall
	ret

g:
	mov rax,1


