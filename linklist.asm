include Irvine32.inc

.data
start = 1
chars byte "HACEBDFG"
links DWORD 0,4,5,6,2,3,7,0

.code
main PROC
	mov eax,0
	mov esi,start
	mov ecx,8
L1:	mov al,chars[esi]
	call WriteChar
	mov esi,links[esi * TYPE links]
	loop L1
	exit
main ENDP
END main