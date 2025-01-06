org 100h

main:
        mov BX, first
        mov AH, 0
        INT 6       ; Lösche Display

input:  call schalter
        call ausgabe_links
        call tastatur
        jmp input

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
        dec BX      ; Dec, weil nach Inc in suche gecalled
        push AX     ; Anzuzeigende Zahl in Stack
        mov AH,3    ; INT Funktion
        mov DL,3    ; INT Displaystelle
        INT 6       ; Anzeige mit Interrupt
        pop AX      ; Adresse wieder in BX
        ret

notFound:
        mov AH,2
        mov DL,3
        mov BX,minus
        INT 6
        ret

tastatur:
        push AX
        mov AH,0    ; INT Funktion
        INT 5       ; Status auslesen
        test AL,0xFF
        jz return     ; Falls keine Taste gedrückt
        
        mov AH,1
        INT 5       ; Lese Tastenwert

        cmp AL,0x10 ; Enter
        jnz go
        mov BX,first                
        jz suche

go:     cmp AL,0x11 ; Go
        jnz plus
        mov BX,first
        jz suche

plus:   cmp AL,0x16 ; Plus
        jz suche

        jmp return

suche:
        pop AX      ; Schalterstellung aus Stack laden
suche2: 
        inc BX
        cmp BX,last
        jns notFound
        cmp byte [BX-1], AL ; Vergleiche Speicherzelle mit AL (Zero = gleich)
        jnz suche2
        call ausgabe_rechts
        ret

return:
        pop AX
        ret

; Definieren der Intervalle
first:  equ 0xC000
last:   equ 0xCFFF
minus:  db '----'