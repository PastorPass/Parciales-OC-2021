	ORG 1000H		; memoria de datos
num1   DB 150
num2   DB 10
result DW ?
	ORG 3000H	; subrutina2
sub2:  MOV DX, 0
	   MOV BX, AX
	   CMP BYTE PTR [BX], 0
	   JZ  fin
	   MOV BX, CX
	   CMP BYTE PTR [BX], 0
	   JZ fin
lazo:  MOV BX,AX
	   ADD DL, [BX]
	   ADC DH, 0
	   PUSH DX
	   MOV BX, CX
	   MOV DL, [BX]
	   DEC DL
	   MOV [BX], DL
	   POP DX
	   JNZ lazo
fin:   RET
	ORG 2000H		; programa principal
	MOV AX, OFFSET num1
	MOV CX, OFFSET num2
	CALL sub2
	MOV result, DX
	HLT
END
