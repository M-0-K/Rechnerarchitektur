org 100h
; ------------------------------------------------------------------------------------
start: mov al,0b10000000 ; linke LED einschalten
out 0,al ; und auf die LED-Zeile ausgeben

mov cx,-1 ; Zaehler für Zeitschleife laden
schl1: loop schl1 ; loop: Pause

bitloop: shr al,1 ; bit nach rechts schieben
out 00,al ; alle LEDs umschalten

mov cx,-1 ; Zaehler für Zeitschleife laden
schl2: loop schl2 ; loop: Pause

cmp al,1 ; al mit 1 vergleichen
jne bitloop ;  falls rechte LED nicht eingeschaltet, dann weiter
jmp start ; Endlosschleife falls rechte LED eingeschaltet
; ------------------------------------------------------------------------------------