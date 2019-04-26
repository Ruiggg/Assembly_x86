INCLUDE Irvine32.inc

.data
String BYTE "The picture is:"

.code
main PROC
	DrawOne PROTO xx1:BYTE,yy1:BYTE,cc1:BYTE
	DrawLine PROTO xx2:BYTE,yy2:BYTE,zz2:BYTE
	DrawAll PROTO xx3:BYTE,yy3:BYTE
	
	mov dh,0
	mov dl,0
	INVOKE DrawAll,dh,dl
	mov eax,white+(black*16)
	call SetTextColor
	exit
main ENDP

DrawOne PROC USES eax edx,
	x1:BYTE,
	y1:BYTE,
	c1:BYTE
	cmp c1,0	;0:gray
	jne L1
	mov eax,white+(gray*16)
	jmp L2
L1: mov eax,white+(white*16)
L2:	mov dh,x1
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
	z2:BYTE
	mov dl,y2
	mov dh,x2
	call Gotoxy
	mov ecx,8
	mov dh,z2
L:	INVOKE DrawOne,x2,dl,dh
	not dh
	inc dl
	loop L
	ret
DrawLine ENDP

DrawAll PROC USES edx ecx eax,
	x3:BYTE,
	y3:BYTE
	mov dh,x3
	mov ecx,8
	mov bl,0
L:	INVOKE DrawLine,dh,y3,bl
	not bl
	inc dh
	loop L
	ret
DrawAll ENDP

END main
