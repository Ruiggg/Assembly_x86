include Irvine32.inc
.data
.code
main PROC
	mov eax,0
	mov ecx,9
	call recur
	exit
main ENDP

recur PROC
	inc eax
	loop recur
	ret
recur ENDP

END main
