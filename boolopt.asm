include Irvine32.inc

.data
CaseTable BYTE '1'
		  DWORD PROC_A
EntrySize = ($ - CaseTable)
		  BYTE '2'
		  DWORD PROC_B
		  BYTE '3'
		  DWORD PROC_C
		  BYTE '4'
		  DWORD PROC_D
		  BYTE '5'
		  DWORD PROC_RET
NumberOfEntries = ($ - CaseTable)/EntrySize
prompt BYTE "Press 1,2,3,4 or 5",0

msg1 BYTE "1:x AND y",0
msg2 BYTE "2:x OR y",0
msg3 BYTE "3:NOT x",0
msg4 BYTE "4:x XOR y",0
msg5 BYTE "5:Exit program",0

.code 
main PROC
	mov edx,OFFSET msg1
	call WriteString
	call Crlf
	mov edx,OFFSET msg2
	call WriteString
	call Crlf
	mov edx,OFFSET msg3
	call WriteString
	call Crlf
	mov edx,OFFSET msg4
	call WriteString
	call Crlf
	mov edx,OFFSET msg5
	call WriteString
	call Crlf
	mov edx,OFFSET prompt
	call WriteString
	call Crlf
	mov eax,0
	call ReadChar
	call boolcal
	call WriteHex
	exit
main ENDP

boolcal PROC
	mov ebx,OFFSET CaseTable
	mov ecx,NumberOfEntries
L1:
	cmp al,[ebx]
	jne L2
	call NEAR PTR [ebx + 1]
	jmp L3
L2:
	add ebx,EntrySize
	loop L1
L3:	ret
boolcal ENDP

PROC_A PROC USES EBX
	mov	ebx,00001111h
	mov eax,0000ffffh
	and eax,ebx
	ret
PROC_A ENDP
PROC_B PROC USES EBX
	mov	ebx,00001111h
	mov eax,0000ffffh
	or eax,ebx
	ret
PROC_B ENDP
PROC_C PROC USES EBX
	mov eax,0000ffffh
	not eax
	ret
PROC_C ENDP
PROC_D PROC USES EBX
	mov	ebx,00001111h
	mov eax,0000ffffh
	xor eax,ebx
	ret
PROC_D ENDP
PROC_RET PROC 
	ret
PROC_RET ENDP
END main


