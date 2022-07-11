	ORG 1000H
cant     DW ? 	; 1000h --> 1001h
tabla    DB 1,2,3,4,3,2,1,2,3,4,3,2,1	; 1002h --> 100Eh
fintabla DB ?	; 100Fh
dato     DB 2	; 1010h
	ORG 2000H
	   MOV BX, OFFSET tabla
	   MOV CL, OFFSET fintabla - OFFSET tabla
	   MOV CH, 0
lazo:  MOV AL, [BX]
	   CMP AL, dato
	   JNZ sig
	   MOV [BX], CH
sig:   INC BX
	   DEC CL
	   JNZ lazo
	   HLT
END
