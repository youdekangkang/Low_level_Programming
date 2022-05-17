section .data
messagef: db 'this is f' , 10
messageg: db 'this is g' , 10

section .text
global _start

f:
	mov rax, 1
	mov rdi, 1
 	mov rsi, messagef 
	mov rdx, 14 
	call g
 	syscall
 	ret
	
g: 
        mov rax, 1
        mov rdi, 1
        mov rsi, messageg
        mov rdx, 14
        syscall
        ret
exit:
	mov rax,60
	xor rdi,rdi
	syscall

_start:
	call f
	call exit
	
