%include "my_lib.inc"

section .data
	msg1	db	"String for ft_print test";, 0xA
	len1	equ	$ - msg1

	prompt1 db	"Enter input: "
	promptLen1 equ	$ - prompt1

	newln	db	0xA, 0xD
	newlnlen	equ	$ - newln

section .text
	global _start
_start:
		; ft_print
	mov ecx, msg1
	mov edx, len1
	call	ft_print
		
		; ft_newline
	call	ft_newline
	
		; ft_readline
	mov ecx, prompt1
	mov edx, promptLen1
	call	ft_print
	call	ft_readline

		; exit
	call	ft_exit