; Un simple programme input en ASM
; sys_input en 64 bits
BITS 64

%define BUFFER 256

global _main


section .bss
	entry resb BUFFER ; char entry[256]

section .text

_main:
	mov rax, 0 
	mov rdi, 1 ; Sortie terminal
	mov rsi, entry ; Pointeur variable buffer
	mov rdx, BUFFER 
	syscall
	mov rax, 0x1
	mov rdi, 0x1
	mov rsi, entry
	mov rdx, BUFFER
	syscall
	jmp _exit

_exit:
	mov rax, 60
	mov rdi, 0 
	syscall
