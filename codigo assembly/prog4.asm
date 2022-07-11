		 ORG 2000H
		MOV AX, 1
		MOV BX, 1000H
carga:  MOV [BX], AX
		ADD BX, 2
		ADD AX, AX
		CMP AX, 200
		JS carga
		HLT
END
