        org 100h

startadr:   equ 200h
endadr:     equ 2ffh

start:  mov cx, endadr      ; counter register auf start setzen
copy:   mov bx, cx          ; cx ist nicht zur Speicheradressierung erlaubt
        mov [bx], bl        ; Wert an aktuelle Adresse schreiben
        cmp cx, startadr    ; prüfen ob endaddresse erreicht
        jz start            ; zu start springen wenn endadresse erreicht (cx - endadr == 0)
        loop copy           ; adresse erhöhen, wiederholen