	ORG 1000H		; memoria de datos
n1H  DW 1234H	; 1000h --> 1001h
n1L  DW 0ABCDH	; 1002h --> 1003h
n2H  DW 5678H	; 1004h --> 1005h
n2L  DW 0ABCDH	; 1006h --> 1007h
resh DW ?		; 1008h --> 1009h		en la instruccion de la direc 2013h-- 2016h, en su eventualidad se guarda el dato 68ADh 
resl DW ?		; 100Ah --> 100Bh		en la instruccion de la direc. 2017h -- 201Ah , en su eventualidad se guarda el dato 579Ah
	ORG 3000H		; subrutina
add32 : ADD CX, DX		; 3000h --> 3001h		se suman ABCD + ABCD = 579Ah (z = 0; s = 0 ; over = 1 ; c = 1 ) A,P = 1
		ADC AX, BX		; 3002h --> 3003h		se suman 1234h + 5678h + carry = 68ADh (z, s ,over,c, a, p) todas las banderas vuelven a normalizarse, todas en cero 
		RET			; 3004h	  desapila la instruccion que estaba en la pila y lo pone al registro ip ( 2013h)
	ORG 2000H		; programa principal (memoria de instrucciones)
	MOV AX, n1H		; 2000h --> 2003h
	MOV BX, n2H		; 2004h --> 2007h
	MOV CX, n1L		; 2008h --> 200Bh
	MOV DX, n2L		; 200Ch --> 200Fh
	CALL add32		; 2010h --> 2012h  el call guarda en la pila la dir 2013h ( en 7FFEh) pero luego es sacado de la pila una vex finalizada la rutina con la instruccion RET
	MOV resh, AX	; 2013h  --> 2016h  va a la direc. de la variable resh a guardar el dato, en este caso necesita dos bytes
	MOV resl, CX	; 2017h --> 201Ah  va a la direc. de la variable resl a guardar el dato ( que es lo que esta contenido en el registro CX), en este caso necesita 2 bytes para guardar el dato
	HLT				; 201BH -- fin
END
