include Irvine32.inc

.code
main PROC
	mov eax,-21
	mov ebx,49
	call gcd
	call WriteInt
	call Crlf
	mov eax,39
	mov ebx,26
	call gcd
	call WriteInt
	call Crlf
	exit
main ENDP

gcd PROC USES EDX EBX 
	cmp eax,0
	jnl L0
	neg eax
L0:	cmp ebx,0
	jnl L1
	neg ebx
L1:	cdq
	idiv ebx
	mov eax,ebx
	mov ebx,edx
	cmp ebx,0
	jg L1
	ret
gcd ENDP
END main
