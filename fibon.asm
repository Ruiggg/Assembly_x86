include Irvine32.inc


.data
fib DWORD 0,1,100 dup(0)

.code
main PROC
	mov ecx,23
	mov ebx,offset fib
	call fiber	
	exit
main ENDP

fiber PROC USES eax ebx
	mov eax,0
	mov [ebx],eax
	mov eax,1
	mov [ebx+4],eax
L1:	mov eax,[ebx]
	add eax,[ebx+4]
	mov [ebx+8],eax
	add ebx,4
	loop L1
	ret
fiber ENDP

END main
