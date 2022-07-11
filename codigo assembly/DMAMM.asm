PIC     EQU     20h
 
DMA     EQU     50h
RFL     EQU     50h
RFH     EQU     51h
CONTL   EQU     52h
CONTH   EQU     53h
RDL     EQU     54h
RDH     EQU     55h
CTRL    EQU     56h
ARRQ    EQU     57h
 
N_DMA   EQU     20
 
        ORG 80
        DW      RUT_DMA
 
        ORG 1000h
MSJ     DB      "FACULTAD DE"
        DB      " INFORMATICA"
FIN     DB      ?
NCHAR   DB      ?
 
        ORG 1500h
COPIA   DB      ?
 
        ORG 3000h
RUT_DMA:MOV AL, 0FFh
        OUT PIC+1, AL
        MOV BX, OFFSET COPIA
        MOV AL, NCHAR
        INT 7
        MOV AL, 20h
        OUT PIC, AL
        IRET
 
        ORG 2000h
        CLI
        MOV AL, N_DMA
        OUT PIC+7, AL           ; 20 --> PIC(INT3)
        MOV AX, OFFSET MSJ
        OUT RFL, AL
        MOV AL, AH
        OUT RFH, AL
        MOV AX, OFFSET FIN - OFFSET MSJ
        OUT CONTL, AL
        MOV AL, AH
        OUT CONTH, AL
        MOV AX, OFFSET COPIA
        OUT RDL, AL
        MOV AL, AH
        OUT RDH, AL
        MOV AL, 0Ah             ; MEM-MEM por bloque
        OUT CTRL, AL
        MOV AL, 0F7h
        OUT PIC+1, AL           ; DESENMASCARA INT3
        STI
        MOV BX, OFFSET MSJ
        MOV AL, OFFSET FIN - OFFSET MSJ
        INT 7
        MOV AL, 7
        INT 3
        OUT ARRQ, AL
        HLT
END