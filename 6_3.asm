include Irvine32.inc

.code
main PROC
	mov ecx,10
L:	mov eax,101
	call RandomRange
	call CalGrade
	and  eax,0000000ffh
	call WriteChar
	call Crlf
	loop L
main ENDP

CalGrade PROC 
	cmp al,100
	ja ER
	cmp al,90
	jnl A
	cmp al,80
	jnl B
	cmp al,70
	jnl C1
	cmp al,60
	jnl D
	cmp al,50
	jnl E
	cmp al,0
	jnl F
ER:	mov al,-1
	ret
A:	mov al,'A'
	ret
B:	mov al,'B'
	ret
C1:	mov al,'C'
	RET
D:	MOV AL,'D'
	RET
E:  MOV AL,'E'
	RET
F:  MOV AL,'F'
	RET
CalGrade ENDP
END main
