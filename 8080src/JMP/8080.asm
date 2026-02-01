XXX:
    MVI A, 'X'
    STA 6000h
    MVI A, 4Fh
    STA 6001h
    
JMP ZZZ

YYY: ; JMPによりこの部分が飛ばされる
    MVI A, 'Y'
    STA 6002h
    MVI A, 4Fh
    STA 6003h
    
ZZZ:
    MVI A, 'Z'
    STA 6004h
    MVI A, 4Fh
    STA 6005h

