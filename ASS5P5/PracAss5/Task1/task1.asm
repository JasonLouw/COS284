extern powf
segment .data
	p: dd 3.1415926536
	e: dd 2.7182818285
	x: dd 12.35
	two: dd 2.0000
	
	msg:	db "Hello world", 0 ; Zero is Null terminator 
	fmt:    db "%s", 10, 0 ; print
	
segment .bss
	num resb 8;
	num1 resb 8;
	num2 resb 8;
	
	
segment .text	
	global st_gamma
	
	
st_gamma:
	push rbp
	mov rbp, rsp


	movsd [num], xmm0

	movsd xmm0, [num]
	movsd xmm1, [two]
	mulss xmm0, xmm1;(n*2)
	movsd xmm1, [p]
	mulss xmm0, xmm1;(n*2*pi)
	
	movsd xmm1, [two]
	sqrtss xmm0, xmm0;sqrt(N*2*pi)
	movsd [num1], xmm0
	
	
	
	movsd xmm0, [num]
	movsd xmm1, [e]
	divss xmm0, xmm1
	movsd xmm1, [num]
	call powf
	
	movsd xmm1, [num1]
	mulss xmm0, xmm1

	
	
	mov rsp, rbp
	pop rbp
	ret 

