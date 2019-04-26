include Irvine32.inc
.code
main PROC
	mov eax,-5
	call abs
	call WriteInt 
	call Crlf
main ENDP
abs PROC 
	xor eax,-1
	add eax,1
	ret
abs ENDP
END main
