PIC     EQU     20h
 
HAND    EQU     40h
 
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
FLAG    DB      0
 
        ORG 3000h
RUT_DMA:MOV AL, 0
        OUT HAND+1, AL
        MOV FLAG, 1
        MOV AL, 0FFh
        OUT PIC+1, AL
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
        MOV AL, 04h             ; MEM-PER bajo demanda
        OUT CTRL, AL
        MOV AL, 0F7h
        OUT PIC+1, AL           ; DESENMASCARA INT3
        MOV AL, 7
        OUT ARRQ, AL
        MOV AL, 80h
        INT 3
        OUT HAND+1, AL
        STI
LAZO:   CMP FLAG, 1
        JNZ LAZO
        HLT
END