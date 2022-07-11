 ORG 1000h
N1      DW      1234h
        DW      0ABCDh
N2      DW      5678h
        DW      0CDEFh
RESL    DW      ?
RESH    DW      ?
 
        ORG 3000h
suma32b: MOV CX, [BX] ;  N2L -> CX
        ADD BX, 2
        MOV DX, [BX] ;  N2H -> DX
        MOV BX, AX
        MOV AX, [BX] ;  N1L -> AX
        ADD BX, 2
        MOV BX, [BX] ;  N1H -> BX
        ADD AX, CX
        ADC BX, DX
        MOV CX, BX
        RET
 
        ORG 2000h
        MOV AX, OFFSET N1
        MOV BX, OFFSET N2
        CALL suma32b
        MOV RESL, AX
        MOV RESH, CX
        HLT
END