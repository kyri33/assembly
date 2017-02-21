%include "HelloWorld.inc"

segment .text
	global _start
_start:
	call	hello

	mov eax, 1
	int 0x80