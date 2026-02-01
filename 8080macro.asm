; --- MVI ---
%macro MVI 2
%ifidni %1,A
    db 0x3E, %2
%elifidni %1,B
    db 0x06, %2
%elifidni %1,C
    db 0x0E, %2
%elifidni %1,D
    db 0x16, %2
%elifidni %1,E
    db 0x1E, %2
%elifidni %1,H
    db 0x26, %2
%elifidni %1,L
    db 0x2E, %2
%else
    %error "Unsupported MVI register"
%endif
%endmacro

; --- STA addr ---
%macro STA 1
    db 0x32, (%1 & 0xFF), ((%1 >> 8) & 0xFF) ; 0x6000 -> 00 60に変換する必要がある
%endmacro

; --- JMP addr ---
%macro JMP 1
    db 0xC3
    dw %1 ; x86も8080もリトルエンディアンなので元々リトルエンディアン。上位と下位を入れ替える必要は無い
%endmacro



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; --- CPI マクロ ---
%macro CPI 1
    db 0xFE, %1     ; CPI value (A - value)
%endmacro

; --- JNZ addr ---
%macro JNZ 1
    db 0xC2
    dw %1
%endmacro

; --- ADD マクロ ---
%macro ADD 1
%ifidni %1,A
    db 0x87
%elifidni %1,B
    db 0x80
%elifidni %1,C
    db 0x81
%elifidni %1,D
    db 0x82
%elifidni %1,E
    db 0x83
%elifidni %1,H
    db 0x84
%elifidni %1,L
    db 0x85
%endif
%endmacro

; --- INR マクロ ---
%macro INR 1
%ifidni %1,A
    db 0x3C
%elifidni %1,B
    db 0x04
%elifidni %1,C
    db 0x0C
%elifidni %1,D
    db 0x14
%elifidni %1,E
    db 0x1C
%elifidni %1,H
    db 0x24
%elifidni %1,L
    db 0x2C
%endif
%endmacro

; --- DCR マクロ ---
%macro DCR 1
%ifidni %1,A
    db 0x3D
%elifidni %1,B
    db 0x05
%elifidni %1,C
    db 0x0D
%elifidni %1,D
    db 0x15
%elifidni %1,E
    db 0x1D
%elifidni %1,H
    db 0x25
%elifidni %1,L
    db 0x2D
%endif
%endmacro

; 0x0F, 0xFFの直後へ返る。RETEMの後ろが8086の命令として誤解されて実行されることはない
%macro RETEM 0
    db 0xED, 0xFD
%endmacro

%macro RET 0
    db 0C9h
%endmacro

%macro ADI 1
    db 0C6h, %1
%endmacro




