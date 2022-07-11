	ORG 1000H
tab1  DW 1,2,3,4,5,6		; 1000h --> 100Bh	
tab2  DW 6,5,4,3,2,1		; 100Ch --> 1017h
tab3  DW ?					; 1018h --> 1019h
	ORG 2000H
		 MOV CX, 0			; 2000h --> 2001h
		 MOV BX, OFFSET tab1	; 2002h
		 MOV DL, OFFSET tab3 - OFFSET tab1	; 2003h --> 2004h
bucle :  MOV AX, [BX]			; 2005h -> 2006h
		 ADD CX, AX			; 2007h --> 2008h 
		 ADD BX, 2			; 2009h --> 200Ch
		 CMP BX, OFFSET tab3	; 200Dh --> 2010h
		 JNZ bucle		; 2011h --> 20
		 MOV tab3, CX
		 HLT
END
