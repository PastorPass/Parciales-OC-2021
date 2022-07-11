ORG 1000h
dato1a  DW 0FFFFh
dato1b  DW 0015h
dato2a  DW 0011h
dato2b  DW 0002h
ORG 2000h
MOV AX, dato1a
ADD AX, dato2a
MOV BX, dato1b
ADC BX, dato2b
END
