segment .data
  text1 db "Please input a lowercase character: "
  text2 db "In uppercase: "
  end db "",10

segment .bss
  name resb 17
;resb stand for reserve bytes

segment .text
  global _start

_start:
  call _printText1
  call _getLetter
  
  mov rsi, 32
  sub [name], rsi
  
  call _printText2
  call _printName
  call _printEnd

  mov eax, 60
  xor edi, edi
  syscall


_getLetter:
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
  mov rdx, 36
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
  mov rdx, 14
  syscall
  ret

_printName:
  mov rax, 1
  mov rdi, 1
  mov rsi, name
  mov rdx, 1
  syscall
  ret
