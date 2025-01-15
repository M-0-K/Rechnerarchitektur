        org 100h

startadr:   equ 200h
endadr:     equ 2ffh

start:  in al, 0            ; schalter einlesen
        mov cx, endadr    ; counter register auf start setzen
copy:   mov bx, cx          ; cx ist nicht zur Speicheradressierung erlaubt
        mov [bx], al        ; eingelesenen Wert an aktuelle Adresse schreiben
        cmp cx, startadr      ; prüfen ob endaddresse erreicht
        jz start            ; zu start springen wenn endadresse erreicht (cx - endadr == 0)
        loop copy           ; adresse erhöhen, wiederholen