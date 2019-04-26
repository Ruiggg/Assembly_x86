INCLUDE Irvine32.inc

FillArray PROTO,
	pArray:PTR BYTE
ShowArray PROTO,
	pArray:PTR BYTE
FindLine PROTO,
	pArray:PTR BYTE

.data
AlphaArray  BYTE 4 DUP(0)
			BYTE 4 DUP(0)
			BYTE 4 DUP(0)
			BYTE 4 DUP(0)
TestArray	BYTE "AEHJ"
			BYTE "BFAA"
			BYTE "BMAA"
			BYTE "AEHJ"
CharArray BYTE "AIOEUBCDFGHJKLMNPQRSTVWXYZ"
.code
main PROC
	INVOKE FillArray,ADDR AlphaArray
	INVOKE ShowArray,ADDR AlphaArray
	call Crlf
	INVOKE FindLine,ADDR AlphaArray
	exit
main ENDP

FillArray PROC USES esi eax ebx,
	pArray:PTR BYTE
	mov ebx,pArray
	mov esi,0

L9:	mov eax,100
	call Delay
	call Randomize
	mov eax,10
	call RandomRange
	cmp eax,4
	jg L0
	mov al,CharArray[eax]
	mov [esi+ebx],al
	inc esi
	jmp L1
L0:	;eax=5,6,7,8,9
	call Randomize
	mov eax,21
	call RandomRange
	add eax,5
	mov al,CharArray[eax]
	mov [ebx+esi],al
	inc esi
L1:	cmp esi,16
	jge L3
	jmp L9

L3:	ret
FillArray ENDP

ShowArray PROC USES esi eax ecx ebx,
	pArray:PTR BYTE
	mov ebx,pArray
	mov ecx,4
	mov esi,0
L0:	push ecx
	mov ecx,4

L1:	mov al,[esi+ebx]
	call WriteChar
	inc esi
	loop L1

	call Crlf
	pop ecx
	loop L0
	ret
ShowArray ENDP

IsAEIOU PROC
	push ecx
	cmp eax,'A'
	je L1
	cmp eax,'E'
	je L1
	cmp eax,'I'
	je L1
	cmp eax,'O'
	je L1
	cmp eax,'U'
	je L1
	mov eax,0
	jmp L2
L1:	mov eax,1

L2: pop ecx
	ret
IsAEIOU ENDP

Diagonal PROC
	push ebx
	push esi
	push edx

	mov edx,0
	mov esi,0
	mov ecx,4
X0:	mov eax,0
	mov al,[ebx+esi]
	call IsAEIOU
	cmp eax,1
	jne X1
	inc edx
X1:	add esi,5
	loop X0
	
	cmp edx,2
	jne Y3
	mov ecx,4
	mov esi,0
X3:	mov al,[ebx+esi]
	call WriteChar
	add esi,5
	loop X3
	call Crlf

Y3:	mov edx,0
	mov esi,3
	mov ecx,4
Y0:	mov eax,0
	mov al,[ebx+esi]
	call IsAEIOU
	cmp eax,1
	jne Y1
	inc edx
Y1:	add esi,3
	loop Y0

	cmp edx,2
	jne Y5
	mov esi,3
	mov ecx,4
Y4:	mov al,[ebx+esi]
	call WriteChar
	add esi,3
	loop Y4
	call Crlf

Y5:
	pop edx
	pop esi
	pop ebx
	ret
Diagonal ENDP



FindLine PROC USES esi edi eax ebx edx,
	pArray:PTR BYTE
	mov ebx,pArray
	call Diagonal
	mov edx,0
	mov esi,0
	
	;colomns:
	mov edi,ebx
	mov ecx,4
C0:	push ecx
	mov ecx,4
C1:	mov eax,0
	mov al,[edi+esi]
	call IsAEIOU
	cmp eax,1
	jne C2
	inc edx
C2:	add esi,4
	loop C1
	cmp edx,2
	jne C3
	mov esi,0
	mov ecx,4
C4:	mov al,[edi+esi]
	call WriteChar
	add esi,4
	loop C4
	call Crlf
C3:
	mov esi,0
	mov edx,0
	add edi,1
	pop ecx
	loop C0

	;end colomn
	mov esi,0
	mov edx,0
L3:	mov ecx,4
;rows:
L0:	mov eax,0
	mov al,[ebx+esi]
	call IsAEIOU
	cmp eax,1
	jne L1
	inc edx
L1:	inc esi
	loop L0

	cmp edx,2
	jne L2

	mov ecx,4 
	sub esi,4
S0:	mov al,[ebx+esi]
	call WriteChar
	inc esi
	loop S0
	call Crlf
L2: cmp esi,16
	jge L8
	mov edx,0
	jmp L3
L8:	ret
FindLine ENDP
END main