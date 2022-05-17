section .data
message : db '356',0
success : db 'Success',0
fail : db 'Failed' , 0

global _start
section .text

_B:
    mov bl,[rdi]
    add rdi, 1
    cmp bl, 0
    je _D
    cmp bl, '0'
    jb _E
    cmp bl, '9'
    ja _E
    
    add rdx,1
    
    mov cl,bl ;parse number from string
    sub cl,48   
    mov ch,0
    
    mov bl,10
    mul bl
    add ax,cx
    
    jmp _B

_D:
    ;check the rax and rdx in gdb
    ret

_E:
    mov rax, 1 
    mov rdi, 1 
    mov rsi, fail
    mov rdx, 8 
    syscall
    ret

_start:
    mov rdi,message
    mov rax,0
    mov rdx,0
    call _B
    
    mov rax,60
    syscall
    
    
