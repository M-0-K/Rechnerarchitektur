# Praktikum 4

## Vorbereitung
1. - implizit -> Operand durch Befehl eindeutig festgelegt, keine separate Angabe `nop`
   - unmittelbar -> Operand wird unmittelbar nach dem Befehl verwendet `mov BL,187h`
   - direkt -> im Befehl wird direkt die Adresse des Operanden angegeben `mov BL,[0187h]`
   - indirekt -> Befehlscode enthält Information zur Bestimmung der Operandenadresse `mov BL,[cx]`
   - relativ -> Operandenadresse wird relativ zur Adresse des Befehls `jr Z,200h` (kein 8086 Befehl)
   - Zeigeregister und Pointer zeigen auf Adressen (zb Instruction Pointer oder Stack Pointer)
2. implizit, unmittelbare, direkte und indirekte Adressierung
3.  null:       equ 3fh
    stelle1:    equ 92h
                mov  cx, [var16]    ; es wird der Wert der Adresse var16 in cx gespeichert
                mov  bx, var8       ; es wird der Wert von var8 in bx gespeichert
                mov  al, [bx]       ; es wird der Wert der in bx gespeicherten Adresse in al geladen
                mov  [var8], al     ; es wird der Wert in al zu der Adresse var8 geladen
                mov dx, stelle1     ; es wird der Wert 92h in dx gespeichert
                mov al, null        ; es wird der Wert 3fh in dx gespeichert
                out  dx, al         ; gibt den Wert aus Register al an der in dx gespeicherten Adresse aus
                or  byte [0120h], 00000011b     ; byte: Warum? Effekt?
                mov word [0200h], 1 ; word: Warum? Effekt?
    var8:       db  0
    var16:      dw 1

## Beispiel
1. Kommentieren Sie die Befehle im Quelltext ADRART.ASM ...
2. Übersetzen Sie das Programm. Beobachten Sie im Schrittbetrieb die einzelnen Ergebnisse und die Änderungen im Speicher.

## Aufgaben
1. Unterprogramm `clrdisp`, das die 7-Segment-Anzeige löscht