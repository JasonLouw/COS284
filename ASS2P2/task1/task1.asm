segment .data
  text1 db "Please input a 5 digit number: "
  text2 db "This is the number you are looking for: "
  end db "",10

segment .bss
  name resb 5
;resb stand for reserve bytes

segment .text
  global _start

_start:
  call _printText1
  call _getName
  call _printText2
  call _printName
  call _printEnd

  mov rax, 60
  mov rdi, 0
  syscall


_getName:
  mov rax, 0
  mov rdi, 0
  mov rsi, name
  mov rdx, 5
  syscall
  ret

_printText1:
  mov rax, 1
  mov rdi, 1
  mov rsi, text1
  mov rdx, 31
  syscall
  ret

_printEnd:
  mov rax, 1
  mov rdi, 1
  mov rsi, end
  mov rdx, 1
  syscall
  ret

_printText2:
  mov rax, 1
  mov rdi, 1
  mov rsi, text2
  mov rdx, 40
  syscall
  ret

_printName:
  mov rax, 1
  mov rdi, 1
  mov rsi, name
  mov rdx, 5
  syscall
  ret
