	  ORG 1000h
NUM1  DB 10
NUM2  DB 12
RES   DB ?

	  ORG 2000h
	  MOV AL, NUM1	;2000 --> 2003
	  MOV BL, NUM2	;2004 --> 2007
	  ADD AL, BL	;2008 --> 2009
	  MOV RES, AL	; 200A --> 200D
      HLT		; 200E
END
 
