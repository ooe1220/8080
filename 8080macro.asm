; JMP、MOV等は命令名が8086と重複する為、8080命令は必ず大文字で書く。
; 小文字→8086, 大文字→8080とする

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


%macro MOV 2
%assign _dest 0
%assign _src 0

%ifidn %1, A
  %assign _dest 7
%elifidn %1, B
  %assign _dest 0
%elifidn %1, C
  %assign _dest 1
%elifidn %1, D
  %assign _dest 2
%elifidn %1, E
  %assign _dest 3
%elifidn %1, H
  %assign _dest 4
%elifidn %1, L
  %assign _dest 5
%elifidn %1, M
  %assign _dest 6
%endif

%ifidn %2, A
  %assign _src 7
%elifidn %2, B
  %assign _src 0
%elifidn %2, C
  %assign _src 1
%elifidn %2, D
  %assign _src 2
%elifidn %2, E
  %assign _src 3
%elifidn %2, H
  %assign _src 4
%elifidn %2, L
  %assign _src 5
%elifidn %2, M
  %assign _src 6
%endif

    db 0x40 | (_dest << 3) | _src
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

%macro CALL 1
    db 0xCD
    dw %1
%endmacro

%macro RRC 0
    db 0x0F
%endmacro

%macro ANI 1
    db 0xE6, %1
%endmacro

%macro JC 1
    db 0xDA
    dw %1
%endmacro

