extern malloc
segment .data
	u dd "up "
	d dd "down "
segment .bss
	arr resb 400
	arr3 resb 400
	index resb 64
	cols resb 64
	fcols resb 64
	x resb 64
	y resb 64
	tempX resb 64
	tempY resb 64
	tempX1 resb 64
	tempY1 resb 64
	up resb 64
	
segment .text
	global solve_linear_eq

solve_linear_eq:
	push rbp
	mov rbp, rsp
;-------------------------------------creating the damn array	
	mov rax, 1
	mov [up], rax

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
	
;---------------------------above ensures that you start at the bottom left of the array
_topLoopStart:
	call _compXY;start the process
	
	mov rax, [y]
	mov rcx, [x]
	cmp rcx, rax
	je _equal
	
	mov rax, [x]
	dec rax
	mov [x], rax
	jmp _topLoopStart
	
	_equal:
	mov rax, [y]
	mov rcx, [cols]
	dec rcx
	cmp rax, rcx
	je _topLoopEnd
	
	mov rax, [cols]
	dec rax
	mov [x], rax
	
	mov rax, [y]
	inc rax
	mov [y], rax
	jmp _topLoopStart
_topLoopEnd:
	
	mov rax, 0
	mov [up], rax
	
	mov rax, 0
	mov [x], rax
	mov rax, [cols]
	dec rax
	mov [y], rax
;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------keep safe down
_topLoopStart1:
	call _compXY;start the process
	mov rax, [y]
	mov rcx, [x]
	cmp rcx, rax
	je _equal1
	
	mov rax, [x]
	inc rax
	mov [x], rax
	jmp _topLoopStart1
	
	_equal1:
	mov rax, [y]
	mov rcx, 0
	cmp rax, rcx
	je _topLoopEnd1
	
	mov rax, 0
	mov [x], rax
	
	mov rax, [y]
	dec rax
	mov [y], rax
	jmp _topLoopStart1
	
_topLoopEnd1:
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------keep safe up	

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------test sect
	;----------------checker
	mov rax, 2
	mov [tempX], rax
	mov rax, 3
	mov [tempY], rax
	call _TempArrayPos
	call _TempArrayValue
	movss xmm0, xmm1
	;-----------------------checker
	
;---------------------------------------create return array
	pop r11
	mov rax, [cols]
	mov r8, 4
	mul r8
	mov rdi, rax
	call malloc
	
	movss xmm0, [arr+4*3]
	movss dword [rax], xmm0
	pop rax

	;lea rax,rdx; copy into return value register

;------------------------------------------------------------------

	mov rsp, rbp
	pop rbp
	ret

	
_arrayPos:;position in array
	push rbp
	mov rbp, rsp
	
	mov rax, [fcols]
	movzx r9, byte[x]
	mul r9
	add rax, [y]
	
	leave
	ret
	

	
_arrayValue:;position in array
	push rbp
	mov rbp, rsp
	
	
	movq xmm0, [arr+4*rax]
	;cvtsi2ss xmm0, rax
	leave
	ret
	
_TempArrayValue:;position in array
	push rbp
	mov rbp, rsp
	
	
	movq xmm1, [arr+4*rax]
	;cvtsi2ss xmm0, rax
	leave
	ret
	
_replaceArrayValue:;position in array
	push rbp
	mov rbp, rsp
	
	movq [arr+4*rax], xmm1
	;cvtsi2ss xmm0, rax
	leave
	ret
	
_TempArrayPos:;position in array
	push rbp
	mov rbp, rsp
	
	mov rax, [fcols]
	movzx r9, byte[tempX]
	mul r9
	add rax, [tempY]
	
	leave
	ret
;------------------------------------------------------
_Temp1ArrayValue:;position in array
	push rbp
	mov rbp, rsp
	
	
	movq xmm2, [arr+4*rax]
	;cvtsi2ss xmm0, rax
	leave
	ret
	

	
_Temp1ArrayPos:;position in array
	push rbp
	mov rbp, rsp
	
	mov rax, [fcols]
	movzx r9, byte[tempX1]
	mul r9
	add rax, [tempY1]
	
	leave
	ret
;------------------------------------------------------	
	
_compXY:;compares x an dy to see if the pos should be make 1 or 0
	push rbp
	mov rbp, rsp
	
	mov rax, [x]
	mov rbx, [y]
	cmp rax, rbx
	je _makeO
	call _makeZero
	jmp _endCmp
	_makeO:
	call _makeOne
	_endCmp:

	leave
	ret
	
	
_makeOne:
	push rbp
	mov rbp, rsp
	
	call _divideAllByXY
		
	leave
	ret
	
	
_makeZero:
	push rbp
	mov rbp, rsp
	
	call _divideAllByXY
	call _mulXByRax
	call _subtractRow
	leave
	ret
	
_divideAllByXY:
	push rbp
	mov rbp, rsp
	
	call _arrayPos
	call _arrayValue;if called together value will be returned in xmm0
	;cvtsi2ss xmm0, rax
	
	mov rax, [x]
	mov [tempX], rax
	mov rax, 0
	mov [tempY], rax
	call _arrayPos
	call _arrayValue
	movss xmm2, xmm0
	
_divStart:
	call _TempArrayPos
	call _TempArrayValue
	divss xmm1, xmm2
	
	;movss xmm0, xmm1
	call _replaceArrayValue
	
	mov rax, [tempY]
	inc rax
	mov [tempY], rax
	
	cmp rax, [fcols]
	je _divEnd
	jmp _divStart

_divEnd:
;----------------checker
	mov rax, 1
	mov [tempX], rax
	mov rax, 2
	mov [tempY], rax
	call _TempArrayPos
	call _TempArrayValue
	movss xmm0, xmm1
;-----------------------checker
	
	leave
	ret
	
	
_mulXByRax:
	push rbp
	mov rbp, rsp
	
	mov rax, [up]
	cmp rax, 0
	jne _up
	jmp _down
	
	
_up:
	mov rax, [x]
	dec rax
	mov [tempX], rax
	mov rax, [y]
	mov [tempY], rax
	jmp _startMul
	;call _TempArrayPos
	;call _TempArrayValue
	;movss xmm0, xmm1
_down:
	mov rax, [x]
	inc rax
	mov [tempX], rax
	mov rax, [y]
	mov [tempY], rax
	
_startMul:
	call _TempArrayPos
	call _TempArrayValue
	movss xmm2, xmm1
	movss xmm0, xmm2
	
	mov rax, [x]
	mov [tempX], rax
	
	_mulStart:
		call _TempArrayPos
		call _TempArrayValue
		mulss xmm1, xmm2
		
		call _replaceArrayValue
		
		mov rax, [tempY]
		inc rax
		mov [tempY], rax
		
		cmp rax, [fcols]
		je _mulEnd
		jmp _mulStart
	
	_mulEnd:
	
		;----------------checker
			mov rax, 2
			mov [tempX], rax
			mov rax, 0
			mov [tempY], rax
			call _TempArrayPos
			call _TempArrayValue
			movss xmm0, xmm1
			
		;-----------------------checker

	
	
	
	leave
	ret
	
	
	_subtractRow:
		push rbp
		mov rbp, rsp
		
		mov rax, [up]
		cmp rax, 0
		jne _up1
		jmp _down1
	
	
		_up1:
		mov rax, [x]
		mov [tempX], rax
		mov rax, 0
		mov [tempY], rax
		
		mov rax, [x]
		dec rax
		mov [tempX1], rax
		mov rax, 0
		mov [tempY1], rax
		
		; mov rax, 1
		; mov rdi, 1
		; mov rsi, u
		; mov rdx, 3
		; syscall
		
		jmp _startSub

	_down1:
		mov rax, [x]
		mov [tempX], rax
		mov rax, 0
		mov [tempY], rax
		
		mov rax, [x]
		inc rax
		mov [tempX1], rax
		mov rax, 0
		mov [tempY1], rax
		
		; mov rax, 1
		; mov rdi, 1
		; mov rsi, d
		; mov rdx, 5
		; syscall
		
		
	_startSub:
	
	_subStart:
		call _Temp1ArrayPos
		call _Temp1ArrayValue
		
		movss xmm0, xmm2
		
		call _TempArrayPos
		call _TempArrayValue
		
		movss xmm0, xmm1
		
		subss xmm1, xmm2
		
		call _TempArrayPos
		call _replaceArrayValue
		
		mov rax, [tempY]
		inc rax
		mov [tempY], rax
		
		mov rax, [tempY1]
		inc rax
		mov [tempY1], rax
		
		cmp rax, [fcols]
		;cmp rax, 2;-----------------------------remove this when done checking
		je _subEnd
		jmp _subStart		
		
	_subEnd:
	
		;----------------checker
		mov rax, 2
		mov [tempX], rax
		mov rax, 0
		mov [tempY], rax
		call _TempArrayPos
		call _TempArrayValue
		movss xmm0, xmm1
			
		;-----------------------checker
	
	leave
	ret
	




	