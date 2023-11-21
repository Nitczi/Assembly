section .data
  message: db "Hello friend!", 0xa

section .text
global _start
_start:
  mov rax, 1
  mov rdi, 1
  mov rsi, message
  mov rdx, 14
  syscall

  mov rax, 0x3c
  xor rdi, rdi
  syscall
