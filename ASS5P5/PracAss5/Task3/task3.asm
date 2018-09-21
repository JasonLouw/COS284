segment .data

segment .bss
	x resb 8;
	cf resb 8;
	c resb 8
	
	top resb 64
	bot resb 64
	
segment .text
	global taylor_ex

taylor_ex:
	push rbp
	mov rbp, rsp

	cvtsi2ss xmm1, rdi;convert rdi to float
	mov [c], rdi
	movss [x], xmm0
	movss [cf], xmm1
	
	mov rax, 0
	cvtsi2ss xmm9, rax

_top:

;------------------------------------------------------little god power function
	mov rdi, [c]
	cmp rdi, 0
	jne _powStart
	mov r9, 1
	cvtsi2ss xmm0, r9
	jmp _powEnd
_powStart:
	movq xmm0, [x]
	mov rcx, [c]
_pow:
	cmp rcx, 1
	je _powEnd
	mulss xmm0, [x]
	dec rcx
	jmp _pow
_powEnd:
	movss [top], xmm0
;------------------------------------------------------end of little god power function	




;------------------------------------------------------fact function
	mov rax, [c]
	cmp rax, 0
	jne _s
	mov rax, 1
	jmp _finFact
	_s
	mov rcx, [c]
_fact:
	dec rcx
	cmp rcx, 0
	je _finFact
	mul rcx	
	jmp _fact
_finFact:
	cvtsi2ss xmm0, rax
	movss [bot], xmm0
;------------------------------------------------------end fact function
	movss xmm0, [top]
	divss xmm0, [bot]
	
	addss xmm9, xmm0
	
	mov rax, [c]
	cmp rax, 0
	je _done
	dec rax
	mov [c], rax
	
	jmp _top
_done:
	movss xmm0, xmm9
	
	
	
	
	
	
	
	
	
	
	mov rsp, rbp
	pop rbp
	ret
	