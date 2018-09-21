section .data
	
section .bss
	val1 resb 64
	val2 resb 64
	val3 resb 64
	val4 resb 64
	val5 resb 64
	val6 resb 64
	
	det1 resb 64
	det2 resb 64
	det3 resb 64
	
	fin1 resb 64
	fin2 resb 64
	fin3 resb 64
	fin4 resb 64
	
section .text
	Global matrixDeterminant
	
matrixDeterminant:
	;epilogue
	push rbp		;this is be our base stack pointer
	mov rbp, rsp		;rsp: this will move up and down depending on our our posh and pops
	;rsp must point back to return address before calling ret
	
	;dono if i need to put all this shit onto the stack again since it should already be there even the first 6 arent anyway
	push rdi;1-
	push rsi;2-
	push rdx;3-
	push rcx;4-
	push r8;5-
	push r9;6-
	push qword[rbp+16];7-
	push qword[rbp+24];8-
	push qword[rbp+32];9-
	push qword[rbp+40];10-
	push qword[rbp+48];11-
	push qword[rbp+56];12-
	push qword[rbp+64];13-
	push qword[rbp+72];14-
	push qword[rbp+80];15-
	push qword[rbp+88];16-
	;----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	mov rdi, qword[rbp-48]
	mov rsi, qword[rbp-56]
	mov rdx, qword[rbp-64]
	mov rcx, qword[rbp-80]
	mov r8, qword[rbp-88]
	mov r9, qword[rbp-96]
	push qword[rbp-128]
	push qword[rbp-120]
	push qword[rbp-112]
	call threeDeterminant
	mov r11, qword[rbp-8]
	imul r11
	mov [fin1], rax
	;---------------------------------
	mov rdi, qword[rbp-40]
	mov rsi, qword[rbp-56]
	mov rdx, qword[rbp-64]
	mov rcx, qword[rbp-72]
	mov r8, qword[rbp-88]
	mov r9, qword[rbp-96]
	push qword[rbp-128]
	push qword[rbp-120]
	push qword[rbp-104]
	call threeDeterminant
	mov r11, qword[rbp-16]
	neg r11
	imul r11
	mov [fin2], rax
	;---------------------------------
	mov rdi, qword[rbp-40]
	mov rsi, qword[rbp-48]
	mov rdx, qword[rbp-64]
	mov rcx, qword[rbp-72]
	mov r8, qword[rbp-80]
	mov r9, qword[rbp-96]
	push qword[rbp-128]
	push qword[rbp-112]
	push qword[rbp-104]
	call threeDeterminant
	mov r11, qword[rbp-24]
	imul r11
	mov [fin3], rax
	;---------------------------------
	mov rdi, qword[rbp-40]
	mov rsi, qword[rbp-48]
	mov rdx, qword[rbp-56]
	mov rcx, qword[rbp-72]
	mov r8, qword[rbp-80]
	mov r9, qword[rbp-88]
	push qword[rbp-120]
	push qword[rbp-112]
	push qword[rbp-104]
	call threeDeterminant
	mov r11, qword[rbp-32]
	neg r11
	imul r11
	mov [fin4], rax
	;---------------------------------
	mov rax, qword[fin1]
	add rax, qword[fin2]
	add rax, qword[fin3]
	add rax, qword[fin4]
	
	;prologue
	mov rsp, rbp;makes sure rsp point back return address before calling ret
	pop rbp
        ret 
	
threeDeterminant:
	push rbp
	mov rbp, rsp
	;-------------------------------------
	;[rdi, rsi]
	;[rdx,rcx]
	push rdi;1 8
	push rsi;2 16
	push rdx;3 24
	
	push rcx;4 32
	push r8;5 40
	push r9;6 48
	
	push qword[rbp+16];7 56
	push qword[rbp+24];8 64
	push qword[rbp+32];9 72
	
	;----------------------------
	mov rdi, qword[rbp-40]
	mov rsi, qword[rbp-48]
	mov rdx, qword[rbp-64]
	mov rcx, qword[rbp-72]
	call twoDeterminant
	mov r11, qword[rbp-8]
	imul r11
	mov [det1], rax
	;-------------------------------------
	mov rdi, qword[rbp-32]
	mov rsi, qword[rbp-48]
	mov rdx, qword[rbp-56]
	mov rcx, qword[rbp-72]
	call twoDeterminant
	mov r11, qword[rbp-16]
	neg r11
	imul r11
	mov [det2], rax
	;-------------------------------------
	mov rdi, qword[rbp-32]
	mov rsi, qword[rbp-40]
	mov rdx, qword[rbp-56]
	mov rcx, qword[rbp-64]
	call twoDeterminant
	mov r11, qword[rbp-24]
	imul r11
	mov [det3], rax
	;-------------------------------------
	
	mov rax, qword[det1]
	add rax, qword[det2]
	add rax, qword[det3]
	
	mov rsp, rbp
	pop rbp
	ret
	
twoDeterminant:
	push rbp
	mov rbp, rsp
	;-------------------------------------
	;[rdi, rsi]
	;[rdx,rcx]
	mov [val1], rdi
	mov [val2], rsi
	mov [val3], rdx
	mov [val4], rcx
	
	mov rax, qword[val1]
	mov r11, qword[val4]
	imul r11
	mov [val1], rax
	
	mov rax, qword[val2]
	mov r11, qword[val3]
	imul r11
	mov [val2], rax
	
	mov rax, qword[val1]
	mov r11, qword[val2]
	sub rax, r11
	
	;-------------------------------------
	mov rsp, rbp
	pop rbp
	ret
