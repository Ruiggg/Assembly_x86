include Irvine32.inc

.data
msg1 BYTE "Please input 2 integers:",0dh,0ah,0
msg2 BYTE "The sum = ",0dh,0ah,0

.code
main PROC
	call Crlf
	mov dh,12
	mov dl,39
	call Gotoxy
	mov edx,OFFSET msg1
	call WriteString
	call ReadInt
	mov ebx,eax
	call ReadInt
	add eax,ebx
	mov edx,OFFSET msg2
	mov dh,15
	mov dl,39
	call Gotoxy
	call WriteString
	call WriteInt
	exit
main ENDP
END main
