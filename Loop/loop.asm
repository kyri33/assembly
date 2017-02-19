section .bss
    num resb 1

section .text
    global _start

_start:
    mov ecx, 10 ; loop counter
    mov eax, '1'

l1:
    mov [num], eax
    mov eax, 4
    mov ebx, 1
    push ecx ; push ecx value to the stack
    mov ecx, num
    mov edx, 1
    int 0x80

    mov eax, [num]
    sub eax, '0'
    inc eax
    add eax, '0'
    pop ecx
    loop l1 ; loop automatically checks val in ecx

    ; exit
    mov eax, 1
    int 0x80
