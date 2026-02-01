; 生成される機械語の確認
; nasm -f bin 8080.asm -o 8080.bin
; xxd 8080.bin

%include "8080macro.asm"

MVI A, 0
MVI B, 10   ; 10回ループ

sum_loop:
    ADD B
    DCR B
    JNZ sum_loop

    ; ここでAに合計が入っている (55)
    ; ASCII 55=7 よって7が表示される
    
STA 6000h
MVI A, 4Fh
STA 6001h

