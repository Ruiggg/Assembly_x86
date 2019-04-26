include Irvine32.inc
.data
OUTER_LOOP_COUNT = 3
startTime DWORD ?
msg1 byte "Please wait...",0dh,0ah,0
msg2 byte "Elapsed milliseconds:",0

.code

main PROC
	mov edx,OFFSET msg1
	call WriteString

	call GetMSeconds
	mov startTime,eax

	mov ecx,OUTER_LOOP_COUNT
L1:	call innerLoop
	loop L1

	call GetMSeconds
	sub eax,startTime

	mov edx,OFFSET msg2
	call WriteString
	call WriteDec
	call WaitMsg
	call Crlf
	exit
main ENDP

innerLoop PROC
	push ecx
	mov ecx,0FFFFFFFh
L1:	mul eax
	mul eax
	mul eax
	loop L1

	pop ecx
	ret
innerLoop ENDP
END main