include Irvine32.inc
myProc PROTO, x:DWORD,y:DWORD
.code
main PROC
	mov	eax,0EAEAEAEAh
	mov ebx,0EBEBEBEBh
	INVOKE myProc,1111h,2222h
	exit
main ENDP

myProc PROC USES eax ebx,
	x:DWORD,y:DWORD
	LOCAL a:DWORD,b:DWORD

	PARAMS = 2
	LOCALS = 2
	SAVED_REGS = 2
	mov a,0AAAAh
	mov b,0BBBBh
	INVOKE WriteStackFrame, PARAMS,LOCALS,SAVED_REGS
	ret
myProc ENDP
END main