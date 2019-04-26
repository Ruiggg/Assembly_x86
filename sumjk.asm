include Irvine32.inc

.data
array SDWORD 1,-2,3,-4,5,-6,7,-8

.code
main PROC
mov eax,3
mov ebx,5
call sum
call WriteInt
call Crlf
call WriteInt
exit
main ENDP

sum PROC USES ESI EBX ECX
	mov esi,eax
	mov ecx,ebx
	sub ecx,eax
	inc ecx
	mov eax,0
L1:	add eax,array[esi*TYPE array]
	inc esi
	loop L1
	ret
sum ENDP
END main