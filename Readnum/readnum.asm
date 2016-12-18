section	.data
	userMsg db 'Please enter a number: '
	lenUserMsg equ $ - userMsg
	dispMsg db 'You have entered: '
	lenDispMsg equ $ - dispMsg

section	.bss	; Uninitialized data
	num resb 5 ; Resb = reserve bytes?

section	.text
	global _start

_start: ; Prompt
	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h

	; Read
	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 5
	int 80h

	; Print
	mov eax, 4
	mov ebx, 1
	mov ecx, dispMsg
	mov edx, lenDispMsg
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h
