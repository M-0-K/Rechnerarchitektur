ORG 100H

; -----------------------

start:

mov bx, 0 ; Zaehler fuer die Zahlen
in al,0 ; Schalter abfragen
xor al, 1b ; xor mit schalter 1
jz wuerfeln ; wenn schalter 1 gedrueckt, dann wuerfeln
jmp start

wuerfeln:

mov si, bx
mov al, [zahlen + si]
out 90H, al
inc bx
in al,0
xor al, 1b
jz wuerfeln
jmp start

; -----------------------

zahlen: db 110b, 1011011b, 101111b, 1100110b, 1101101b, 111101b
