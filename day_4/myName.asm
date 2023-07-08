section .data
  name db 'Hawari Muflih Munte', 0

section .text
  global _start

_start:
  ; Write the string to stdout
  mov eax, 4          ; sys_write system call
  mov ebx, 1          ; file descriptor (stdout)
  mov ecx, name      ; pointer to the string
  mov edx, 19         ; string length
  int 0x80            ; call the kernel

  ; Exit the program
  mov eax, 1          ; sys_exit system call
  xor ebx, ebx        ; exit code 0
  int 0x80            ; call the kernel
