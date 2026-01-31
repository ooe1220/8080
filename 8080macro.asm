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

