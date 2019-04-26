;Walk.asm
;start (25,25)
INCLUDE Irvine32.inc
WalkMax = 50
StartX = 25
StartY = 25

DrunkardWalk STRUCT
	path COORD WalkMax DUP(<0,0>)
	pathsUsed WORD 0
DrunkardWalk ENDS

DisplayPosition PROTO currX:WORD, currY:WORD

.data
aWalk DrunkardWalk <>

.code
main PROC
	mov esi,OFFSET aWalk
	call TakeDrunkenWalk
	exit
main ENDP

;----------------------------------------------------------------------------------
TakeDrunkenWalk PROC
	LOCAL currX:WORD,currY:WORD,lastDirect:DWORD
;receive esi:the address of the DrunkenWalk
;
;----------------------------------------------------------------------------------
	pushad
	mov edi,esi
	add edi,OFFSET DrunkardWalk.path	;the address of path from the beginning of the struct???
	mov ecx,WalkMax
	mov currX,StartX	;currX is a local var
	mov currY,StartY	;currY is a local var
	mov lastDirect,1

	
Again:
	mov ax,currX
	mov (COORD PTR [edi]).X,ax
	mov ax,currY
	mov (COORD PTR [edi]).Y,ax
	
	INVOKE DisplayPosition, currX, currY

	call Randomize
	mov eax,100
	call RandomRange
	.IF eax >= 50
		mov eax,lastDirect
	.ELSEIF eax >= 40 
		.IF lastDirect == 0
			mov eax,1
		.ELSEIF lastDirect == 1
			mov eax,0
		.ELSEIF lastDirect == 2
			mov eax,3
		.ELSE
			mov eax,2
		.ENDIF
	.ELSEIF eax >=20 ;left
		.IF lastDirect == 0
			mov eax,2
		.ELSEIF lastDirect == 1
			mov eax,3
		.ELSEIF lastDirect == 2
			mov eax,1
		.ELSE
			mov eax,0
		.ENDIF
	.ELSE
		.IF lastDirect == 0
			mov eax,3
		.ELSEIF lastDirect == 1
			mov eax,2
		.ELSEIF lastDirect == 2
			mov eax,0
		.ELSE
			mov eax,1
		.ENDIF	
	.ENDIF

	;mov eax,0 ;0:up 1:down :2 left 3 right
	.IF eax == 0
		inc currY
	.ELSEIF eax == 1
		dec currY
	.ELSEIF eax == 2
		dec currX
	.ELSE
		inc currX
	.ENDIF

	

	add edi,TYPE COORD
	dec ecx
	cmp ecx,0
	jnz Again

Finish:
	mov (DrunkardWalk PTR [esi]).pathsUsed,WalkMax
	popad
	ret
TakeDrunkenWalk ENDP


DisplayPosition PROC currX:WORD, currY:WORD

.data
commaStr BYTE ",",0
.code
	pushad
	movzx eax,currX
	call WriteDec
	mov edx,OFFSET commaStr
	call WriteString
	movzx eax,currY
	call WriteDec
	call Crlf
	popad
	ret
DisplayPosition ENDP
END main




