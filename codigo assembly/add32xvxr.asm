        ORG 1000h
N1L     DW      1234h
N1H     DW      0ABCDh
N2L     DW      5678h
N2H     DW      0CDEFh
RESL    DW      ?
RESH    DW      ?
 
        ORG 3000h
suma32c: MOV BX, SP
        ADD BX, 2    ;  salteo el registro IP que apila el CALL
        MOV AX, [BX] ;  N1L -> AX
        ADD BX, 2
        MOV CX, [BX] ;  N2L -> CX
        ADD BX, 2
        MOV DX, [BX] ;  N1H -> DX
        ADD BX, 2
        MOV BX, [BX] ;  N2H -> BX
        ADD CX, AX   ;  N1L + N2L
        ADC DX, BX   ;  N2H + N1H + carry
        MOV BX, SP
        ADD BX, 10   ;  salteo hasta offset RESL
        MOV AX, [BX] ;  OFFSET RESL -> AX
        ADD BX, 2
        MOV BX, [BX] ;  OFFSET RESH -> BX
        MOV [BX], DX ;  N2H + N1H + carry -> RESH
        MOV BX, AX
        MOV [BX], CX ;  N1L + N2L -> RESL
        RET
 
 
        ORG 2000h
        MOV AX, OFFSET RESH
        PUSH AX
        MOV AX, OFFSET RESL
        PUSH AX
        MOV AX, N2H
        PUSH AX
        MOV AX, N1H
        PUSH AX
        MOV AX, N2L
        PUSH AX
        MOV AX, N1L
        PUSH AX
        CALL suma32c
        HLT
END