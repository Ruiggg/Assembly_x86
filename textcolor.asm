include Irvine32.inc

.data
msg byte "Hello World!",0dh,0ah,0
.code
main PROC
	mov edx,OFFSET msg
	mov eax,yellow+(blue*16)
	mov ecx,4
L1:	call SetTextColor
	call WriteString
	add  eax,10001h
	loop L1
	exit
main ENDP
END main