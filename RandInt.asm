include Irvine32.inc

TAB = 9
.code
main PROC
	call Randomize
	call Rand1
	call Rand2
	exit
main ENDP

Rand1 PROC
	mov ecx,10
L1:	call Random32
	call WriteDec
	mov al,TAB
	call WriteChar
	loop L1

	call Crlf
	ret
Rand1 ENDP

Rand2 PROC
	mov ecx,10
L1:	mov eax,100
	call RandomRange
	sub eax,50
	call WriteInt
	mov al,TAB
	call WriteChar
	loop L1

	call Crlf
	ret
Rand2 ENDP
END main