	ORG 1000H
ini DB  0
fin DB  15
	ORG 2000H
	   MOV AL, ini
	   MOV AH, fin
suma:  INC AL
	   CMP AL, AH
	   JNZ suma
	   HLT
END
