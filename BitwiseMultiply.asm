include Irvine32.inc
.code
main PROC
	mov		eax,6a9ch
	mov		ebx,0010h
	call	Multiply
	exit
main ENDP

Multiply	PROC
	mov		edx,eax
	mov		eax,0
	shr		ebx,1
	mov		ecx,16
	jc	S1
M:	dec		ecx
L:	shr		ebx,1
	jc	S2
S:	loop	L	
	ret
S2: push ecx
	push ebx	
	push	edx
	mov	ebx,16
	sub	ebx,ecx
	mov	cl,bl
	shl	edx,cl
	add	eax,edx
	pop edx 
	pop	ebx
	pop	ecx
	jmp S
S1: add eax,edx
	jmp M
Multiply	ENDP
END main