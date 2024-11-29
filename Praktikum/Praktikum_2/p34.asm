    ORG 100H
;----------------------------------------
; auf den stellen 3 und 4 der 7 segment anzeige soll der zustand der schlter s3 und s4 angezeigt werden (0 oder 1)
start: in al,0 ; einlesen der aktuellen schalterstellung
mov ah,al
int 6

test ah,00011000b ; testen ob s3 und s4 gedrückt sind
jz n
je b

test ah,00001000b ; testen ob s3 gedrückt ist
je d

test ah,00010000b ; testen ob s4 gedrückt ist
je v

jmp start

n: mov al,00111111b ; 7 segment anzeige auf 0 setzen
out 94h,al
out 96h,al
jmp start

b: mov al,110b
out 94h,al
out 96h,al
jmp start

d: mov al,110b
out 94h,al
mov al,00111111b
out 96h,al
jmp start

v: mov al,110b
out 96h,al
mov al,00111111b
out 94h,al
jmp start
;----------------------------------------