SYS_WRITE	equ 4
SYS_READ	equ 3
SYS_EXIT	equ 1
STDOUT		equ 1
STDIN		equ 0

%define CF_MASK 00000001h
%define PF_MASK 00000004h
%define AF_MASK 00000010h
%define ZF_MASK 00000040h
%define SF_MASK 00000080h
%define DF_MASK 00000400h
%define OF_MASK 00000800h

extern	printf

section .data
	newln		db	0xA, 0XD ; Line Feed, Line Carriage = New Line
	newlnLen	equ	$ - newln
	reg_format	db 	"Register Dump # %d", 0xA, 0XD

	carry_flag	db	"CF", 0
	unset_flag	db	"  ", 0

	buff: TIMES 100 db 0 ; Buffer = 100 bytes

section	.bss
	readLen resd 1
	tempRead resd 1

section .text
	global	ft_print, ft_exit, ft_newline, ft_readline, ft_dump_regs

		;ft_print
ft_print:
	mov eax, SYS_WRITE ; sys_write command
	mov ebx, STDOUT ; STDOUT
	; ecx and edx added by function caller as params
	int 0x80
	ret

		; ft_exit
ft_exit:
	mov eax, SYS_EXIT
	int 0x80
	ret

		; ft_newline
ft_newline:
	mov ecx, newln
	mov edx, newlnLen
	call	ft_print
	ret

ft_readline:
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, buff
	mov edx, 100
	int 80h

	mov [readLen], eax
	cmp eax, edx
	jb read_done
	mov bl, [ecx + eax - 1] ; Last character in buffer eax store length of buffer ecx is pointer to 1st char
	cmp bl, 10 ; newline char
	je read_done ; newline found

	read_done:
		mov ecx, [buff] ; Move CONTENTS Of buff to ecx (Can't print)
		sub ecx, '0' ; sub '0' to make decimal
		add ecx, 5 ; add 5 to value
		add ecx, '0' ; add '0' to convert back to char
		mov [buff], ecx ; move ecx to CONTENTS of buff
		mov ecx, buff ; Move POINTER to buff to ecx (FOR PRINT)
		mov edx, [readLen]
		call	ft_print
	ret

ft_dump_regs:
	pusha
	pushf
	mov eax, [esp] ; stack pointer, points to stack
	mov [ebp-4], eax ; save flags?

	test eax, CF_MASK
	jz cf_off
	mov eax, carry_flag
	jmp short push_cf
	cf_off:
		mov eax, unset_flag
	push_cf:
		push eax

	push dword [ebp - 4]
	mov eax, [ebp + 4]
	sub eax, 10 ; EIP on stack is 10 bytes ahead of orig?
	push eax
	lea eax, [ebp + 12]
	push eax
	push dword [ebp]
	push edi
	push esi
	push edi
	push ecx
	push ebx
	push dword [ebp - 8]
	push dword [ebp + 8]
	push dword reg_format
	call	printf
	ret
	