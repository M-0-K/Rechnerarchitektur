org 100h

setup:              ; Initialisierung
    mov ah, 0       ; Display löschen vorbereiten
    int 6           ; Display löschen
    call showDash   ; Trennstrich auf dem Display anzeigen

start: 
    mov ah, 1       ; Tastatur-Interrupt vorbereiten
    int 5           ; Warten auf Tastatureingabe
    cmp al, [KeyGo] ; Prüfen, ob die "Go"-Taste (11h) gedrückt wurde
    jnz start       ; Falls nicht, zurück zum Start
startSearch:         ; Vorbereitung für die Suche starten
    in ax, 0        ; 8-Bit-Suchwert einlesen
    mov [SearchValue], ax ; Suchwert im Speicher ablegen
    call showSearchValue
    mov bx, 0h      ; Index für die Suche auf 0 setzen
search:              ; Suche ausführen (ohne erneute Vorbereitung)
    mov dl, [bx]    ; Wert aus Speicher lesen
    cmp dl, [SearchValue] ; Vergleich: Suchwert == [Index]
    jz found        ; Wenn Werte übereinstimmen, zu "found" springen
increment:          ; Einstiegspunkt fürs weitersuchen nach "+"
    inc bx          ; Index um 1 erhöhen
    cmp bx, 1000h   ; Prüfen, ob der Index 1000h erreicht hat
    jnc notFound     ; Falls ja, zu "notFound" springen
    jmp search      ; Weiter mit der Suche
jmp start

found:
    call showAddress ; Adresse des gefundenen Werts anzeigen
    mov ah, 1       ; Tastatur-Interrupt vorbereiten
    int 5           ; Warten auf Tastatureingabe
    cmp al, [KeyGo] ; Prüfen, ob "Go" erneut gedrückt wurde
    jz startSearch  ; Falls ja, neue Suche starten
    cmp al, [KeyPlus] ; Prüfen, ob "Plus"-Taste (16h) gedrückt wurde
    cmp al, [KeyPlus] ; Prüfen, ob "Plus"-Taste (16h) gedrückt wurde
    jz increment    ; Falls ja, Suche mit erhöhtem Index fortsetzen
    jmp found       ; Zurück zu "found"

notFound:
    call showDash   ; Trennstrich anzeigen, um "nicht gefunden" zu signalisieren
    jmp start       ; Zurück zum Start

showAddress:
    push ax         ; Register sichern
    push dx
    mov ah, 3       ; Ausgabe vorbereiten
    mov dl, 3       ; rechte Start Stellen setzen
    int 6           ; Adresse anzeigen
    pop dx          ; Register wiederherstellen
    pop ax
    ret             ; Rückkehr aus Unterprogramm

showDash:
    push ax         ; Register sichern
    push bx
    push dx
    mov ah, 2       ; Ausgabe vorbereiten
    mov bx, Dash    ; Adresse des Trennstrichs setzen
    mov dl, 3       ; rechte Start Stellen setzen
    int 6           ; Trennstrich anzeigen
    pop dx          ; Register wiederherstellen
    pop bx
    pop ax
    ret             ; Rückkehr aus Unterprogramm

showSearchValue:
    push ax         ; Register sichern
    push bx
    push dx
    mov bx, [SearchValue]
    mov ah, 3       ; Ausgabe vorbereiten
    mov dl, 7       ; rechte Start Stellen setzen
    int 6           ; Adresse anzeigen
    pop dx          ; Register wiederherstellen
        pop bx
    pop ax
    ret             ; Rückkehr aus Unterprogramm

Dash: db "----"     ; Trennstrich
StringEnd: db 00    ; String-Ende
KeyGo: db 11h       ; Code für die "Go"-Taste
KeyPlus: db 16h     ; Code für die "Plus"-Taste
SearchValue: db 00b ; Speicherplatz für den Suchwert
