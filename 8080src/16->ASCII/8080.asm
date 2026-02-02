; 生成される機械語の確認
; nasm -f bin 8080.asm -o 8080.bin
; xxd 8080.bin

%include "8080macro.asm"

MVI A, 3EH
CALL HEX2ASCII

STA 6000h
MVI A, 4Fh
STA 6001h

MOV A, B
STA 6002h
MVI A, 4Fh
STA 6003h

RETEM

HEX2ASCII:
    MOV B, A
    RRC
    RRC
    RRC
    RRC
    ANI 0FH
    CALL CONVERT
    MOV C, A

    MOV A, B
    ANI 0FH
    CALL CONVERT
    MOV B, A
    MOV A, C
    RET

CONVERT:
    CPI 0AH
    JC LESS10
    ADI 07H
LESS10:
    ADI 30H
    RET
