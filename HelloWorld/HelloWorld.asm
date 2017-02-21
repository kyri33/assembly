section .data ; data segment
	msg	db	"Hello World!", 0x0a
	len	equ	$ - msg

section .text
	global hello
hello:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, 14
	int 0x80
	ret
