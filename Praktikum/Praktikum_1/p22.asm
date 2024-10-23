org 100h
; ------------------------------------------------------------------------------------
start: mov al,0x55 ; 6,4,2,0 LEDs einschalten
out 0,al ; und auf die LED-Zeile ausgeben
mov cx,-1 ; Zaehler für Zeitschleife laden
schl1: loop schl1 ; loop: zwei Befehle in einem
; Schritt1: Dekrementiere <CX>
; Schritt2: Sprung, wenn <CX> ungleich 0
mov al,0xaa ; 7,5,3,1 LEDs einschalten
out 00,al ; alle LED „ausschalten“
mov cx,-1
schl2: loop schl2
jmp start ; Endlosschleife
; ------------------------------------------------------------------------------------