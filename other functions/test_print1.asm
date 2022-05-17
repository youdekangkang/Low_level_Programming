section .data
message : db 'helloWorld!',0

section .text
global _start
; rdi = string address
string_length:
     mov rax, rdi
     .counter:
         cmp byte [rdi], 0
         je .end
         inc rdi
         jmp .counter
     .end:
         sub rdi, rax
         mov rax, rdi
         ret

; rdi = string address
print_string:
    call string_length
    mov rdx,rax
    mov rax, 1
    mov rsi, rdi
    mov rdi, 1
    syscall ; call write
    ret

_start:
    mov rdi,message
    call print_string
