SYS_WRITE	equ 4
SYS_READ	equ 3
STDOUT		equ 1
STDIN		equ 0
SYS_EXIT	equ 1 

section	.data
	msg1 db "Enter a digit ", 0xA, 0xD
	len1 equ $ - msg1

	msg2 db "Enter a second digit ", 0xA, 0xD
	len2 equ $ - msg2

	msg3 db "The sum is: "
	len3 equ $ - msg3

section	.bss
	num1	resb 2
	num2	resb 2
	sum	resb 1

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

	mov eax, [num1] ; Move first number into eax register
	sub eax, '0' ; Subtract by '0' to convert it into a decimal

	mov ebx, [num2]
	sub ebx, '0'

	add eax, ebx ; Add eax and ebx together
	add eax, '0' ; Add '0' to convert to ascii

	mov [sum], eax ; Store result in memory location

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, sum
	mov edx, 1
	int 0x80

	;EXIT
	mov eax, SYS_EXIT
	xor ebx, ebx
	int 0x80
