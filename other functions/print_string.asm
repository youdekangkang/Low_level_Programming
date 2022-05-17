section .data
newline_char : db 10
message : db 'Selling England by the Pound',0

section .text
global _start


print_line:
mov rax, 1 ; 'write' syscall identifier
 mov rdi, 1 ; stdout file descriptor
 mov rsi, newline_char ; where do we take data from
 mov rdx, 1 ; the amount of bytes to write
 syscall
 ret
print_string:
	mov rax,1
	mov rdi,1
	mov rdx,28
	syscall
	ret

exit:
	mov rax,60
	xor rdi,rdi
	syscall
	
_start:
	mov rsi,message
	call print_string
	call print_line
	call exit
