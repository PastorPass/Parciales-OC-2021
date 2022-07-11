	ORG 1000h
varbyte  DB  20h
varword  DW  ?

	ORG 2000h
MOV  AX, 1000h
MOV  BX, AX
MOV  BL, varbyte
MOV  varword, BX
END
