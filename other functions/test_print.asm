section .data
message : db 'hello world',10

section .text
global _start
; rdi = string address
string_length:
    xor rax, rax
    .counter:
        cmp byte [rdi+rax], 0
        je .end
        inc rax
        jmp .counter
    .end:
        ret

; rdi = string address
print_string:
    call string_length
    mov rdx, rax
    mov rax, 1
    mov rsi, rdi
    mov rdi, 1
    syscall ; call write
    ret

_start:
    mov rdi,message
    call print_string
