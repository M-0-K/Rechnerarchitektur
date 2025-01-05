        org 100H

schalt: equ 0

start:  in al,schalt
        mov bl,al           ; Schalterstellung in bl speichern
        mov al,11111111b
        test bl,00000001b   ; setzt zero flag wenn Schalter 0 gesetzt
        jnz blink
        jmp start

blink:  out 0,al
        not al
        test bl,10000000b   ; setzt zero flag wenn Schalter 7 gesetzt
schl1:  loop schl1
schl2:  loop schl2
        jmp start
