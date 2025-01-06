org 100h

; Definieren der Intervalle
first:  equ 0xC000
last:   equ 0xCFFF

main:
        mov BX, first
        mov AH, 0
        INT 6       ; Lösche Display
        call schalter

schalter:
        in AL,0     ; Schalterstellung in AL
        ret

ausgabe_links:      ; Anzeige Schalterstellung
        push BX     ; Adresse in Stack
        push AX     ; Anzuzeigende Zahl in Stack
        mov AH,4    ; INT Funktion
        mov DL,7    ; INT Displaystelle
        pop BX      ; Anzuzeigende Zahl in BX für INT
        INT 6       ; Anzeige mit Interrupt
        mov AX,BX   ; Zahl zurück in AX
        pop BX      ; Adresse wieder in BX
        ret

ausgabe_rechts:     ; Anzeige Adresse (BX)
        push AX     ; Anzuzeigende Zahl in Stack
        mov AH,3    ; INT Funktion
        mov DL,3    ; INT Displaystelle
        INT 6       ; Anzeige mit Interrupt
        pop AX      ; Adresse wieder in BX
        ret