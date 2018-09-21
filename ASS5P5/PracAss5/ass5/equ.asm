extern malloc
segment .data
	
segment .bss
	arr resb 400
	index resb 8
	cols resb 8
	fcols resb 8
	x resb 8
	y resb 8
	
segment .text
	global solve_linear_eq

solve_linear_eq:
	push rbp
	mov rbp, rsp
;-------------------------------------creating the damn array	
	push rdi
	movq xmm0, [rsp+24+4*0]
	mov [cols], rsi
	mov rdi, rsi
	inc rdi
	mov [fcols], rdi
	mov rax, rdi
	mul rsi
	mov [index], rax
	mov r8, 4
	mul r8
	mov rdi, rax
	call malloc
	mov [arr], rax
	
	mov rcx, 0
	mov r9, [index]
	dec r9
_moveArr:
	movq xmm0, [rsp+24+4*rcx]
	movq [arr+4*rcx], xmm0
	inc rcx
	cmp rcx, r9
	je _endMove
	jmp _moveArr
_endMove:
;-------------------------------------damn array created = [arr]		
	
	mov rax, [cols]
	dec rax
	mov [x], rax
	
	cvtsi2ss xmm0, rax;2
	mov r15, [fcols]
	
	cvtsi2ss xmm0, r15;4
	
	mov rax, 0
	mov [y], rax
	cvtsi2ss xmm0, rax;0
_bigLoop:
	_smallLoop:
		;-----	position in array
		mov rax, r15
		movzx r9, byte[x]
		mul r9
		add rax, [y]
		;-----	position in array
		movq xmm0, [arr+4*rax]

		

	_endSmallLoop:
_endBigLoop:
	

	
	mov rsp, rbp
	pop rbp
	ret
	
	
	
	