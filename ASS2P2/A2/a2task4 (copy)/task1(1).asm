section .data
	t1 db "Please input the first number: " ;31 characters
	end db "",10
	t2 db "Please input the second number: " ;32 ch

section .bss
	;letter resb 1
	val resb 8
	val2 resb 8


section .text
		global _start
_start:

		mov rax, 1
		mov rdi, 1
		mov rsi, t1
		mov rdx, 31 ;how much bits to allocate
		syscall

		mov rax, 0 ;to get user input
		mov rdi, 0
		mov rsi, val ;where data going to be stored
		mov rdx, 2 ; latter change to 5
		syscall

		mov rax, 1
		mov rdi, 1
		mov rsi, t2
		mov rdx, 32 ;how much bits to allocate
		syscall

		mov rax, 0 ;to get user input
		mov rdi, 0
		mov rsi, val2 ;where data going to be stored
		mov rdx, 2 ; latter change to 5
		syscall

		mov rax, [val]
		mov rbx, [val2]
		sub rax, '0'
		sub rbx, '0'
		add rax, rbx
		mov rsi , 10
		mov rdx, 0
		div rsi

		add rax, '0'
		add rdx, '0'

		mov [val], rax
		mov [val2], rdx
		syscall


		mov rax, 1
		mov rdi, 1
		mov rsi, val
		mov rdx, 1; hello its jason you had 2 its supposed to be 1
		syscall

		mov rax, 1
		mov rdi, 1
		mov rsi, val2
		mov rdx, 1
		syscall

		mov rax, 1
		mov rdi, 1
		mov rsi, end
		mov rdx, 1
		syscall



		mov rax, 60
		mov rdi, 0
		syscall
