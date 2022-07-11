	ORG 1000H		; memoria de datos
num1 DB 150
num2 DB 10
result DW ?
	ORG 3000H		; subrutina sub1
sub1:  MOV DX, 0
	   CMP AL, 0
	   JZ fin
	   CMP CL, 0
	   JZ fin
	   MOV AH, 0
lazo:  ADD DX, AX
	   DEC CX
	   JNZ lazo
fin:   RET
	ORG 2000H		; programa principal
	MOV AL, num1
	MOV CL, num2
	CALL sub1
	MOV result, DX
	HLT
END
