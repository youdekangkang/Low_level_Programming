section .data
message: db 'hello, world!', 10
section .text
global _start
exit:
 mov rax, 60 ; This is a function
 xor rdi, rdi ; This is a function
 syscall ; This is a function
print_string:
 mov rax, 1
 mov rdi, 1
 mov rsi, message 
 mov rdx, 14 
 syscall
 ret
_start:
 call print_string
 call print_string
 call exit ; This is a call of exit function
