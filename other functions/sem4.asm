global _start

section .data
success: db 'This is a number', 10
failure: db 'Not', 10



test_string: db '23', 0


section .text

exit:
	mov rax, 60
	syscall


get_symbol:
	mov al, [rbx+rcx]
	inc rcx
	ret

get_number:
	sub al, '0'
	mov r8, 10
	mul r8
	mov r10b, al
	add r9b, r10b
	ret



_A:
	call get_symbol
;	cmp al, '+'
;	je _B
;	cmp al, '-'
;	je _B
	cmp al, '0'
	jb _E
	cmp al, '9'
	ja _E
	sub al, '0'
	mov r9b, al
	jmp _C

_B:
	call get_symbol
	cmp al, '0'
	jb _E
	cmp al, '9'
	ja _E
	jmp _C

_C:
	call get_symbol
	test al,al
	jz _D
	cmp al, '0'
	jb _E
	cmp al , '9'
	ja _E
	call get_number
	jmp _C

_D:
	mov rax, 1
	mov rdi, 1
	mov rsi, success
	mov rdx, 17
	syscall
	ret

_E:
	mov rax, 1
	mov rdi, 1
	mov rsi, failure
	mov rdx, 4
	syscall

ret


_start:
	mov rbx, test_string
	xor rcx,rcx

	call _A
	call exit