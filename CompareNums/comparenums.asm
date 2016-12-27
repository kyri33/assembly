SYS_WRITE	equ 4
SYS_READ	equ 3
SYS_EXIT	equ 1
STDOUT		equ 1
STDIN		equ 0

section	.data
	msg db "The largest digit is: ", 0xA, 0xD
	len		equ $- msg
	num1	dd '22'
	num2	dd '31'
	num3	dd '47'

section	.bss
	largest	resb 2

section	.text
	global _start
_start:
	mov ecx, [num1]
	cmp ecx, [num2]
	jg  check_third
	mov ecx, [num2]

		check_third:
	cmp ecx, [num3]
	jg _exit
	mov ecx, [num3]

		_exit:
	mov [largest], ecx
	mov ecx, msg
	mov edx, len
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, largest
	mov edx, 2
	int 0x80

	mov eax, SYS_EXIT
	int 80h
