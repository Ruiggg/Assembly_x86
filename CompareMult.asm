INCLUDE Irvine32.inc

.data
LOOP_COUNT = 0FFFFFFFFh
.data
intval DWORD 5
startTime DWORD ?
.code
main PROC
	call  GetMseconds
	mov   startTime,eax
	mov	  eax,intval
	call  mult_by_shifting
	call  GetMseconds
	sub   eax,startTime
	call  WriteDec
	exit
main ENDP

mult_by_shifting PROC
	mov  ecx,LOOP_COUNT
L1:	push eax
	mov  ebx,36
	mul  ebx
	pop  eax
	loop L1
	ret
mult_by_shifting ENDP

END main