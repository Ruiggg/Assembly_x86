include Irvine32.inc

.code
main PROC
	mov		eax,7c4bh
	mov		ecx,32
	mov		edx,0
L0:	shr		eax,1
	jc		L1
L2:	loop	L0
	jmp		L3
L1:	xor		edx,0001h
	jmp		L2
L3:	exit
main ENDP
END main