	ORG 1000h
dato1  DW  10
dato2  DW  20
resultado  DW  ?

	ORG 2000h
MOV  AX, dato1
ADD  AX, dato2
MOV  resultado, AX
END
