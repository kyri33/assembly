%include "my_lib.inc"

section	.data
	msg	db	"The Sum is: "
	len	equ	$ - msg
	num1	db	'12345'
	num2	db	'23456'
	sum	db	'     '

section	.text
	global _start
_start:
	mov esi, 4 ; Offset to right most digit
	mov ecx, 5 ; num of digits
	clc ; Clear Carry Flag - Sets to 1 when result of addition is greater than what can be carried in register.
	
	add_loop:
		mov al, [num1 + esi]
		adc al, [num2 + esi] ; Add with carry, set carry flag if bits are carried over
		aaa
		call	ft_dump_regs
		pushf
		or al, 30h
		popf

		mov [sum + esi], al
		dec esi
		loop add_loop

		mov edx, len
		mov ecx, msg
		call	ft_print

		mov ecx, sum
		mov edx, 5
		call	ft_print
		call	ft_newline

		call	ft_exit