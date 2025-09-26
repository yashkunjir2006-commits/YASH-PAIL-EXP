global _start

section .data
  msg db "Enter number1: "
  msglen equ $-msg
  msg1 db "Enter number2: "
  msglen1 equ $-msg1
  msg2 db "Result is: "
  msglen2 equ $-msg2
  new1 db " ",10
  
section .bss
  num1 resb 2
  num2 resb 2
  result resb 1
  
section .text
  %macro print 2
    mov eax,4
    mov ebx,1
    mov ecx,%1
    mov edx,%2
    int 0x80
  %endmacro
  
  %macro scan 2
    mov eax,3
    mov ebx,0
    mov ecx,%1
    mov edx,%2
    int 0x80
  %endmacro  
  
_start:
  print msg,msglen
  scan num1,2
  print msg1,msglen1
  scan num2,2
  mov al,[num1]
  sub al,'0'
  mov ah,0
  mov bl,[num2]
  sub bl,'0'
  div bl              
  add al,'0'
  mov [result],al
  print msg2,msglen2
  print result,1
  print new1,2
  mov eax,1
  mov ebx,0
  int 0x80
