include Irvine32.inc

.data
number1 BYTE 12h,34h,56h,78h
number2 BYTE 23h,45h,56h,12h
sum BYTE 4 DUP(?)

.code
main PROC
	mov	esi,OFFSET number1
	mov edi,OFFSET number2
	mov edx,OFFSET sum
	mov ecx,4
	call AddPacked
	exit
main ENDP

AddPacked PROC	USES EAX EDX ECX ESI EDI
	add esi,ecx
	add edi,ecx
	add edx,ecx
	clc
L:	dec esi
	dec edi
	dec edx
	mov al,[esi]
	adc al,[edi]
	daa
	mov	[edx],al
	loop L
	ret
AddPacked ENDP

END main
