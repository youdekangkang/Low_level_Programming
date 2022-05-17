%define O_RDONLY 0 
%define PROT_READ 0x1
%define MAP_PRIVATE 0x2
%define SYS_OPEN 2
%define SYS_MMAP 9
%define PROT_NONE 0x0
section .daita
; This is the file name. You are free to change it.
fname: db 'hello.txt', 0
section .text
global _start
exit:
 mov rax, 60 ; use exit system call to shut down correctly
 xor rdi, rdi
 syscall
; These functions are used to print a null terminated string
print_string:
 push rdi
 call string_length
 pop rsi
 mov rdx, rax 
 mov rax, 1
 mov rdi, 1 
 syscall
 ret
string_length:
 xor rax, rax
.loop:
 cmp byte [rdi+rax], 0
 je .end 
 inc rax
 jmp .loop 
.end:
 ret
_start:
; Call open and open fname for read only.
mov rax, SYS_OPEN
mov rdi, fname
mov rsi, O_RDONLY ; Open file read only
mov rdx, 0 ; We are not creating a file
 ; so this argument has no meaning
syscall
; Call mmap with correct arguments
; Call mmap with correct arguments
mov r8,rax;choose mapped file
mov rdi,0;OS choosing virtual address
mov rsi,page_size; length
mov rdx,PROT_READ; PROT_NONE for forbidden 
mov r10,MAP_PRIVATE; only for this process
mov r9,0; no shift
mov rax,SYS_MMAP
syscall
;now rax hold the pointer to the mapped area
cmp rax,-1
je mapWrong
; Let the operating system choose where to display the file
; Set the size of the area equals to page size
; The area should not be shared with multiple processes
; and should be allocated for read-only.
; using print_string from your assignment you can output the file content
call exit
