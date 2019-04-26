INCLUDE Irvine32.inc

DECIMAL_OFFSET = 5
.data
decimal_one BYTE "100123456789765"
decimal_two BYTE "900402076502015"
sum BYTE (SIZEOF decimal_one + 1) DUP(0),0

.code
main PROC
	mov	esi,SIZEOF decimal_one - 1
	mov edi,SIZEOF decimal_one
	mov	ecx,SIZEOF decimal_one
	mov bh,0
L:	mov	ah,0
	mov al,decimal_one[esi]
	add al,bh
	aaa
	mov bh,ah
	or	bh,30h
	;or	al,30h
	add al,decimal_two[esi]
	aaa
	or	bh,ah
	or	al,30h
	mov sum[edi],al
	dec esi
	dec edi
	loop L
	mov sum[edi],bh
;show
	mov	edx,OFFSET sum
	call WriteString
	call Crlf
	exit
main ENDP
END main