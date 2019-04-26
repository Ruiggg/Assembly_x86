include Irvine32.inc


BUFMAX = 128
.data
Key			BYTE  "ABXmv7#",0
sPrompt		BYTE  "Enter the plain text:",0
sEncrypt	BYTE  "Cipher text:	",0
sDecrypt	BYTE  "Decrypted:	",0
buffer		BYTE   BUFMAX+1 DUP(0)
bufSize		DWORD  ?

.code
main PROC
	call	InputTheString
	call	TranslateBuffer
	mov		edx,OFFSET sEncrypt
	call	DisplayMessage
	call	TranslateBuffer
	mov		edx,OFFSET sDecrypt 
	call	DisplayMessage
	exit
main ENDP

InputTheString	PROC
	pushad
	mov		edx,OFFSET sPrompt
	call	WriteString
	mov		ecx,BUFMAX
	mov		edx,OFFSET buffer
	call	ReadString
	mov		bufSize,eax
	call Crlf
	popad
	ret
InputTheString	ENDP

DisplayMessage	PROC
	pushad
	call	WriteString
	mov		edx,OFFSET buffer
	call	WriteString
	call	Crlf
	call	Crlf
	popad
	ret
DisplayMessage	ENDP

TranslateBuffer	PROC
	pushad
	mov		ecx,bufSize
	mov		esi,0
	mov		edi,0
L0:	
	mov		al,Key[edi]
	xor		buffer[esi],al
	inc		esi
	inc		edi
	cmp		Key[edi],0
	je		L1
	loop	L0
	jmp     R
L1:	mov		edi,0
	jmp		L0
R:	popad
	ret
TranslateBuffer	ENDP

END main