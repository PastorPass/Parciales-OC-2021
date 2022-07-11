	ORG 1000H		; memoria de datos
n1H  DW 1234H	; 1000h --> 1001h
n1L  DW 0ABCDH	; 1002h --> 1003h
n2H  DW 5678H	; 1004h --> 1005h
n2L  DW 0ABCDH	; 1006h --> 1007h
resh DW ?		; 1008h --> 1009h		en la instruccion de la direc 2013h-- 2016h, en su eventualidad se guarda el dato 68ADh 
resl DW ?		; 100Ah --> 100Bh		en la instruccion de la direc. 2017h -- 201Ah , en su eventualidad se guarda el dato 579Ah
sip  DB ?		; 100Ch
no   DB ?		; 100Dh
	ORG 2000H		; programa principal (memoria de instrucciones)		(sin subrutina)
	   MOV AX, n1H		; 2000h --> 2003h
	   MOV BX, n2H		; 2004h --> 2007h
	   MOV CX, n1L		; 2008h --> 200Bh
	   MOV DX, n2L		; 200Ch --> 200Fh
   	   ADD CX, DX
	   ADC AX, BX		; como el adc suma el carry los flags vuelven a la normalidad, vuelven a cero todos
	   JC mal			; si por alguna razon el flag de carry se activa es porque la cuenta esta mal
	   MOV sip, 0FFH
	   MOV resh, AX	; 2013h  --> 2016h  va a la direc. de la variable resh a guardar el dato, en este caso necesita dos bytes
	   MOV resl, CX	; 2017h --> 201Ah  va a la direc. de la variable resl a guardar el dato ( que es lo que esta contenido en el registro CX), en este caso necesita 2 bytes para guardar el dato
	   JMP fin
mal :  MOV no, 0FFH	
fin :  HLT				; 201BH -- fin
END
