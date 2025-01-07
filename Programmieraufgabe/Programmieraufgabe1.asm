ORG 100H

; -------------

start_adr: EQU 0xc000
end_adr: EQU 0xcfff
start_key: EQU 0x11  ; G
start_key2: EQU 0x10 ; E
plus_key: EQU 0x16   ; +

call clear_display

main:
    JMP check_start

clear_display:
    MOV AH, 0
    INT 6
    RET

display_input:
    ; Wert von input_value auf Display ausgeben
    MOV AH, 4
    MOV BL, [input_value]
    MOV DL, 7
    INT 6
    RET

read_switches:
    ; Schalter einlesen und in input_value speichern
    IN AL, 0
    MOV [input_value], AL
    RET

check_start:
    ; Prüfen ob Taste gedrückt wurde und gedrückte Taste in AL speichern
    MOV AH, 1
    INT 5

    ; Prüfen ob G oder E gedrückt wurde und ggf. Suche starten
    CMP AL, start_key
    JZ search_init
    CMP AL, start_key2
    JZ search_init

    JMP main

search_init:
    call read_switches
    call display_input
    MOV SI, start_adr ; Startadresse der Suche in SI
    JMP search_loop

search_loop:
    ; Prüfen ob Endadresse erreicht wurde
    CMP SI, end_adr
    JZ search_not_found

    ; Inhalt der Adresse laden und mit Suchwert vergleichen
    MOV AL, [SI]
    CMP AL, [input_value]
    JZ search_found

    ; nächste Adresse laden
    INC SI

    ; andernfalls nächste Adresse prüfen
    JMP search_loop

search_found:
    ; Adresse des gefundenen Wertes auf Display ausgeben
    MOV BX, SI
    MOV AH, 3
    MOV DL, 3
    INT 6

wait_for_plus:
    ; Warten auf Eingabe der Taste '+'
    MOV AH, 1
    INT 5
    CMP AL, plus_key
    JZ continue_search   ; Fortfahren bei '+'
    CMP AL, start_key
    JZ search_init       ; Neustart bei 'G'
    CMP AL, start_key2
    JZ search_init       ; Neustart bei 'E'
    JMP wait_for_plus    ; Ansonsten weiter warten

continue_search:
    ; Nächsten Wert suchen
    INC SI
    JMP search_loop

search_not_found:
    ; "----" auf Display ausgeben
    MOV BX, end_string
    MOV AH, 2
    MOV DL, 3
    INT 6
    JMP main

input_value DB 0 ; Wert der Eingabe/Suche
end_string DB "----", 0
