INCLUDE Irvine32.inc

.data
String BYTE "The picture is:"

.code
main PROC
	DrawOne PROTO xx1:BYTE,yy1:BYTE,cc1:BYTE
	DrawLine PROTO xx2:BYTE,yy2:BYTE,cc2:BYTE,dd2:BYTE
	DrawAll PROTO xx3:BYTE,yy3:BYTE
	ChangeColor PROTO

	mov dh,0
	mov dl,0
	INVOKE ChangeColor
	mov eax,white+(black*16)
	call SetTextColor
	exit
main ENDP

DrawOne PROC USES eax edx,
	x1:BYTE,
	y1:BYTE,
	c1:BYTE ;color

	mov eax,0
	mov al,c1
	shl eax,4
	or al,15
	mov dh,x1
	mov dl,y1
	call Gotoxy
	call SetTextColor
	mov al,' '
	call WriteChar
	ret
DrawOne ENDP

DrawLine PROC USES edx ecx eax,
	x2:BYTE,
	y2:BYTE,
	c2:BYTE,;color1
	d2:BYTE ;color2
	mov dl,y2

	mov ecx,8
	mov dh,c2
	;mov ah,d2
	;mov al,c2
L:	INVOKE DrawOne,x2,dl,dh
	cmp dh,c2
	je L2
	cmp dh,d2
	je L3
L2: mov dh,d2
	jmp L1
L3: mov dh,c2
L1:	inc dl
	loop L
	ret
DrawLine ENDP

DrawAll PROC USES edx ecx eax ebx,
	x3:BYTE,
	y3:BYTE
	mov dh,x3
	
	call Randomize
	mov eax,16
	call RandomRange
	mov ebx,eax
	inc eax
	call Randomize
	call RandomRange
	and  eax,0000000fh
	mov bh,al

	;mov bh,3
	;mov bl,3

	mov ecx,8
L:	INVOKE DrawLine,dh,y3,bh,bl
	mov al,bh
	mov bh,bl
	mov bl,al
	inc dh
	loop L
	ret
DrawAll ENDP

ChangeColor PROC USES eax ecx
	mov eax,500
	mov ecx,16
s:	INVOKE DrawAll,0,0
	mov eax,500
	call Delay
	;call Clrscr
	loop s
	ret
ChangeColor ENDP



END main
