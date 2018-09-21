section .data
	hello: db "hello, World!",10
	helloLen:  equ $-hello
	
section .bss
	val1 resb 64
	val2 resb 64
	val3 resb 64
	val4 resb 64
	val5 resb 64
	val6 resb 64
	
section .text
	Global palindromeCheck
	
palindromeCheck:
		mov [val1], rdi
		mov [val2], rsi
		mov [val3], rdx
		mov [val4], rcx
		mov [val5], r8
		mov [val6], r9
		
		movzx r11, byte[val1]
		movzx r10, byte[val6]
		cmp r11, r10
		jne end
		
		mov r11, [val2]
		mov r10, [val5]
		cmp r11, r10
		jne end
		
		movzx r11, byte[val1]
		movzx r10, byte[val6]
		cmp r11, r10
		jne end
		
			mov rax, 1
			jmp done
		
		end:
			mov rax, 0
		done:
		
        ret 
