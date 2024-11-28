org 100h
; ------------------------------------------------------------------------------------
start: mov al,0
out 0,al ; LEDs aus in AL

led:
in al,0 ; Schalter abfragen

test al,00000001b ; Schalter 0 abfragen
je start 

mov al,11111111b ; LEDs einschalten
out 0,al ; LEDs einschalten

jmp led ; Endlosschleife
; ------------------------------------------------------------------------------------