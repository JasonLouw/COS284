segment .data
	a dd "poop"
	b dd 3.12
segment .bss
	u resb 8;
	sum resb 8;
	
segment .text
	global stdev

stdev:
	push rbp
	mov rbp, rsp
	
;------------------------------------------------------mean
	mov rcx, 0
	movq xmm0, [rdi]
_mean:
	inc rcx
	cmp rcx, rsi
	je _endMean
	movq xmm1, [rdi+4*rcx]
	addss xmm0, xmm1
	jmp _mean
_endMean:
	cvtsi2ss xmm1, rsi
	divss xmm0, xmm1
	movss [u], xmm0;saved in u
;------------------------------------------------------meanEnd
;----------------------------------------------pow(no-u, 2)
	mov rcx, 0
	mov r11, rsi
	dec r11
	mov r9, 0
	cvtsi2ss xmm1, r9
	movq xmm2, xmm1
_math:
	movss xmm0, [rdi+4*rcx]
	subss xmm0, [u]
	mulss xmm0, xmm0
	movss [rdi+rcx], xmm0
	addss xmm2, xmm0
	cmp rcx, r11
	je _endMath
	inc rcx
	jmp _math
_endMath:
;--------------------------------------------------------end pow

movss xmm0, xmm2
	mov r9, 1
	cvtsi2ss xmm1, r9	
	
	cvtsi2ss xmm2, rsi
	
	subss xmm2, xmm1	;rsi-1
	
	divss xmm1, xmm2 ;1/rsi-1

	
	;----------------------
	mulss xmm0, xmm1

	
	
	
	



	
	mov rsp, rbp
	pop rbp
	ret
	
	
	
	