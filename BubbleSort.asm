include Irvine32.inc
BubbleSort	PROTO,
	pArray:PTR DWORD,
	Count :DWORD
BinarySearch PROTO,
	pArray:PTR DWORD,
	Count :DWORD,
	SearchVal:DWORD
BSreg PROTO,
	pArray:PTR DWORD,
	Count :DWORD,
	SearchVal:DWORD
.data
ArrayToBeSort DWORD -1,3,-2,4,-5,6,-7,8,0
ArraySize DWORD LENGTHOF ArrayToBeSort

.code
main PROC
	INVOKE BubbleSort,ADDR ArrayToBeSort,ArraySize
	mov eax,4
	INVOKE BSreg,ADDR ArrayToBeSort,ArraySize,eax
	exit
main ENDP

BubbleSort	PROC USES eax ecx esi ebx,
	pArray:PTR DWORD,
	Count :DWORD

	mov ecx,Count
	dec ecx
L1:	push ecx
	mov esi,pArray
	mov ebx,0

L2:	
	mov eax,[esi]
	cmp [esi+4],eax
	jg L3
	xchg [esi+4],eax
	inc ebx
	mov [esi],eax

L3:	add esi,4
	loop L2

	pop ecx
	cmp ebx,0
	je LRT
	loop L1

LRT:	ret
BubbleSort	ENDP

BinarySearch PROC USES ecx ebx edx esi edi,
	pArray:PTR DWORD,
	Count :DWORD,
	SearchVal:DWORD
	LOCAL	first:DWORD,
			last :DWORD,
			mid  :DWORD
	mov	first,0
	mov eax,Count
	dec	eax
	mov	last,eax
	mov edi,SearchVal
	mov ebx,pArray

L1: mov eax,first
	cmp eax,last
	jg	L5

	add eax,last
	shr	eax,1
	mov mid,eax

	mov esi,mid
	shl esi,2
	mov edx,[ebx+esi]	;edx=arr[mid]

	cmp edx,edi
	jge L2
	;if(arr[mid]<SearchVal) then:
	mov eax,mid
	inc eax
	mov first,eax
	jmp L1
	
	;if(SearchVal<=arr[mid]) then:
L2: cmp edx,edi
	je L3
	;if(SearchVal<arr[mid]) then:
	mov eax,mid
	dec eax
	mov last,eax
	jmp L1

L3:	mov eax,mid
	jmp L9
L5:	mov eax,-1
L9:	ret
BinarySearch ENDP

BSreg PROC USES ebx edx esi edi,
	pArray:PTR DWORD,
	Count :DWORD,
	SearchVal:DWORD
	;eax=mid
	;ebx=first
	;ecx=last

;initialize	
	mov esi,pArray
	mov edi,SearchVal
	mov ebx,0
	mov ecx,Count
	dec ecx

L1:	cmp ebx,ecx
	jg	finish

	;if(first<=last)
L2:	mov eax,ebx
	add eax,ecx
	shr eax,1	;(first+last)/2*4
	shl eax,2
	mov eax,[esi+eax]
	cmp eax,edi
	jg L3

	;if([mid]<=SearchVal):
L4:	cmp eax,edi
	je L8
	;if [mid]<SearchVal:
	mov eax,ebx
	add eax,ecx
	shr eax,1		;eax=mid
	mov ebx,eax
	inc ebx
	jmp L1

	;if([mid]>Sval):
L3:	mov eax,ebx
	add eax,ecx
	shr eax,1		;eax=mid
	mov ecx,eax
	dec ecx
	jmp L1


finish:
	mov eax,-1
	jmp L9
L8:
	mov eax,ebx
	add eax,ecx
	shr eax,1		;eax=mid
L9:	ret
BSreg	ENDP

END main

