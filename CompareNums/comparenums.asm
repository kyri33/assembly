SYS_WRITE	equ 4
SYS_READ	equ 3
SYS_EXIT	equ 1
STDOUT		equ 1
STDIN		equ 0

section	.data
	msg1 db "Enter the 1st digit: ", 0xA, 0xD
	len1 equ $ - msg1

	msg2 db "Enter the 2nd digit: ", 0xA, 0xD
	len2 equ $ - msg2

	msg3 db "Enter the 3rd digit: ", 0xA, 0xD
	len3 equ $ - msg3

	msg4 db "The largest is: "
	len4 equ $ - msg2

section	.bss
	largest	resb 2
	num1	resb 2
	num2	resb 2
	num3	resb 2

section	.text
	global _start
_start:
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg1
	mov edx, len1
	int 0x80

	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num1
	mov edx, 2
	int 0x80

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg2
	mov edx, len2
	int 0x80

	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num2
	mov edx, 2
	int 0x80

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg3
	mov edx, len3
	int 0x80

	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num3
	mov edx, 2
	int 0x80

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
	mov ecx, msg4
	mov edx, len4
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
