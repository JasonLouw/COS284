segment .data
  text1 db "Please input the first number: "
  text2 db "Please input the second number: "
  end db 0xa

segment .bss
  i1 resb 1
  i2 resb 1
;resb stand for reserve bytes

segment .text
  global _start

_start:

	mov rax, 1
	mov rdi, 1
	mov rsi, text1
	mov rdx, 31
	syscall
	
	mov rax, 0
	mov rdi, 0
	mov rsi, i1
	mov rdx, 2
	syscall
	
	mov rax, 1
	mov rdi, 1
	mov rsi, text2
	mov rdx, 32
	syscall
	
	mov rax, 0
	mov rdi, 0
	mov rsi, i2
	mov rdx, 2
	syscall
	
	;math
	mov rsi, [i1]
	sub rsi, '0'
	mov rdi, [i2]
	sub rdi, '0'
	
	add rsi, rdi
	add rsi, '0'
	mov [i1], rsi
	
	mov rax, 1
	mov rdi, 1
	mov rsi, i1
	mov rdx, 1
	syscall
	
	mov rax, 1
	mov rdi, 1
	mov rsi, end
	mov rdx, 1
	syscall
	
	mov eax, 60
	xor edi, edi
	syscall

	
	
	
