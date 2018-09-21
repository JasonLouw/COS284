section .data
	hello: db "hello, World!",10
	helloLen:  equ $-hello
	
section .bss
	val1 resb 64
	val2 resb 64
	val3 resb 64
	val4 resb 64
	
section .text
	Global dotProduct
	
dotProduct:
		mov [val1], rdi
		mov [val3], rsi
		mov [val2], rdx
		mov [val4], rcx
		
		mov rax, [val1]
		mul qword[val2]
		mov [val1], rax
		
		mov rax, [val3]
		mul qword[val4]
		
		add rax, qword[val1]
		;mov rax, 1
		
        ret 
