section .data
	hello: db "hello, World!",10
	helloLen:  equ $-hello
	
section .text
	Global addToFindEvenOrOdd
	
addToFindEvenOrOdd:
		
		add rsi, rdi
		mov rax, rsi
		xor rdx, rdx
		mov r10, 2
		div r10
		mov rax, rdx
        ret 
