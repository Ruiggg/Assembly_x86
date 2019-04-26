INCLUDE Irvine32.inc

.data
COUNT = 4
BlueTextOnGray = blue + (lightGray*16)
DefaultColor = lightGray +(black*16)
arrayD SDWORD 12345678h,1A4B2000h,3434h,1AB9h
prompt BYTE "Enter a 32-bit signed integer:",0

.code
main PROC
	mov eax,BlueTextOnGray
	call SetTextColor
	call Clrscr

	mov esi,offset arrayD
main ENDP
END main