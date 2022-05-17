global _start

section .data
msg : db 'Hello,Wolrd',10
extern f
_start:
	mov rsi,msg
	call f

