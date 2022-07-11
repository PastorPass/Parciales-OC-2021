	  ORG 1000H
num1   DB 150
num2   DB 10
	  ORG 2000H
		MOV AL, num1
		CMP AL, 0
		JZ fin
		MOV AH, 0
		MOV DX, 0
		MOV CL, num2
loop :  CMP CL, 0
		JZ fin
		ADD DX, AX
		DEC CL
		JMP loop
fin:    HLT
END
