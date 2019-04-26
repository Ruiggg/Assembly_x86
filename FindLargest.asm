include Irvine32.inc
Find PROTO STDCALL,
	ar:PTR SDWORD,lengthe:DWORD
.data
array SDWORD 1,2,-3,4,-5,6
lengthe DWORD 6

.code
main PROC
	;mov eax,OFFSET array
	;Find PROTO,ar:PTR SDWORD,lengthe:DWORD
	INVOKE	Find,ADDR array,LENGTHOF array
	call WriteDec
	exit
main ENDP

Find PROC STDCALL USES EBX ECX,
arrayr:PTR SDWORD,
lengthee:DWORD
;变量名字不能相同！！！
	mov esi,arrayr
	mov eax,[esi]
	mov	ecx,lengthee
L:	cmp eax,[esi]
	jge L2
	mov eax,[esi]
L2:	add	esi,4
	loop L
	ret
Find ENDP

END main