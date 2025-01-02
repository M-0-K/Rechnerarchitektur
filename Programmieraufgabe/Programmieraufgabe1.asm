ORG 100H

; -------------

start_adr: EQU 0c000h
end_adr: EQU 0cfffh
start_key: EQU 00110011b  ; G
start_key2: EQU 00111011b ; E
plus_key: EQU 00001011b   ; +
input_value DB 0 ; Wert der Eingabe/Suche
end_string DB "----", 0

main:

read_switches:
    ; Schalter einlesen und in input_value speichern
    IN AL, 0
    MOV [input_value], AL

check_start:
    ; Prüfen ob Taste gedrückt wurde
    MOV AH, 0
    INT 5
    CMP AL, 0
    JE check_start; Wenn keine Taste gedrückt wurde, dann wiederholen

    ; auf Tastenbestätigung warten
    MOV AH, 1
    INT 5

    ; Prüfen ob G oder E gedrückt wurde und ggf. Suche starten
    CMP AL, start_key
    JZ search_init
    CMP AL, start_key2
    JZ search_init

    ;JMP check_start ; Wenn keine Taste gedrückt wurde, dann wiederholen

search_init:
    MOV SI, start_adr ; Startadresse der Suche in SI
    MOV CX, end_adr ; Endadresse der Suche in CX
    MOV BX, SI ; Startadresse speichern zum iterieren in BX

search_loop:
    ; Inhalt der Adresse laden und mit Suchwert vergleichen
    MOV DL, [BX]
    CMP DL, [input_value]
    JZ search_found

    ; nächste Adresse laden und prüfen ob Ende erreicht
    INC BX
    CMP BX, CX
    JG search_not_found

    ; andernfalls nächste Adresse prüfen
    JMP search_loop

search_found:
    MOV DX, BX
    MOV AH, 3
    MOV DL, 0
    INT 6

search_not_found:
    MOV BX, end_string
    MOV DL, 0
    MOV AH, 2
    INT 6
    JMP check_start

JMP main
