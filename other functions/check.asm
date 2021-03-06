global _start

section .data
Success : db 'Success input!',10
Fail : db 'Fail input...',10

section .text
; getsymbol is a routine to
; read a symbol (e.g. from stdin)
; into al
getsymbol:
 mov ah,1
 int 21h
 ret
 
_A:
 call getsymbol     
 cmp al, '+'
 je _B
 cmp al, '-'
 je _B
; The indices of the digit characters in ASCII
; tables fill a range from '0' = 0x30 to '9' = 0x39
; This logic implements the transitions to labels
; _E and _C
 cmp al, '0'
 jb _E
 cmp al, '9'
 ja _E
 jmp _C
 
_B:
 call getsymbol
 cmp al, '0'
 jb _E
 cmp al, '9'
 ja _E
 jmp _C
 
_C:
 call getsymbol
 cmp al, '0'
 jb _E
 cmp al, '9'
 ja _E
 test al, al
 jz _D
 jmp _C
 
_D:
; code to notify about success

 ret
 
_E:
; code to notify about failure

 re
 
_start:
 call _A
 syscall
    
