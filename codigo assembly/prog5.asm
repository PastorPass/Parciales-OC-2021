	ORG 1000H
tabla DB 2,4,6,8,10,12,14,16,18,20	; 1000H --> 1009H
fin   DB ?							; 100AH 
total DB ?							; 100BH
max   DB 13							; 100CH
	ORG 2000H
	   MOV AL, 0					; 2000H --> 2001H
	   MOV CL, OFFSET fin - OFFSET tabla	;2002H -->2003H
	   MOV BX, OFFSET tabla		; 2004H --> 2006H
suma:  ADD AL, [BX]			; 2007h --> 2008H
	   INC BX			; 2009h --> 200AH
	   DEC CL		; 200BH --> 200CH
	   JNZ suma		; 200DH --> SALTO A 2007H (si el dec cl no es cero)
	   MOV total, AL
	   HLT			; 200FH (fin)
END
	