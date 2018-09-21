section .data
	text db "Hello, World!",10



;----------------------------------------------------------------------------------
;		ABOVE LINE EXPLAINED
;		db"define bytes":
;			means we a going define raw data to insert into code
;		,10: is the newline character
;		text: is name assigned to the address in memory

;	this is for x86_64
; 	64 bit unsigned between (0;18 446 744 073 709 709 551 616)
; 	64 bit signed between (-9 223 372 036 854 775 808; "same but positive")
;		also show as 1111111111111111111111111111111111111111111111111111111111111111
;		that is 64 ones in binary

;more  info on x85_64
;		x86_64 has 16 registers
;		8bit, 16bit, 32bit are only pieces of a much larger 64bit register
; 	eg al = 8biy; ax = 16bit; eax = 32bit; rax = 64bit

;syscall"system call": when program requests service from kernel
;all syscalls have a ID asscociated with them(number)
;syscalls aslo take arguements, meaning, a list of inputs
;	continuing with syscalls
;		rax has ID,  then load arguements in registers 1-6
; 	328 syscalls
;????doesnt seem to matter one bit which register you place what into aslong as it fits??

;sections
; .data: where data is defined before compilation
; .bss where data is allocated for future use; did some one say pointers??
;	.text where the code goes

;JUMPS
; jmp label eg: jmp _start. IS THIS A LOOP ;)

;Comparisons: allow programs to take different paths based on certain conditions
; layout: cmp register, register/value eg: cmp rax, 23 or rbx
;once comparions is made certain flags will be set. sheeeeeet make sensi bois

;theres a whole bunch of jump flags like je which means =
; so if cmp rax, 23
				;je _doThis

;CALLS: kinda like jumps but more like functions
;call _label
;return to call using
;ret
;----------------------------------------------------------------------------------


section .text
	global _start

_start: ;this like the main. will throw error without start label
	mov rax, 1
	mov rdi, 1
	mov rsi, text
	mov rdx, 14
	syscall

	mov rax, 60
	mov rdi, 0 ;zero means all is good; anything else is a error
	syscall
