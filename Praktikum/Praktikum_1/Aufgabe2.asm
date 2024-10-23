
org 100h
; ------------------------------------------------------------------------------------
;p22: Auf der LED-Reihe soll abwechselnd sichtbar zwischen den LEDs 6-4-2-0 und 7-5-3-1 

start:  mov al, 0x55  ;0101 0101 -> 0x55
out 0,al ; und auf die LED-Zeile ausgeben
mov cx,-1 ; Zaehler für Zeitschleife laden
schl1: loop schl1 ; loop: zwei Befehle in einem
                  ; Schritt1: Dekrementiere <CX>
                  ; Schritt2: Sprung, wenn <CX> ungleich 0
mov al,0
out 00,al ; alle LED „ausschalten“
mov cx,-1
schl2: loop schl2

mov al, 0xAA  ;  | 1010 1010 -> 0xAA
out 0,al ; und auf die LED-Zeile ausgeben
mov cx,-1 ; Zaehler für Zeitschleife laden
schl3: loop schl3 ; loop: zwei Befehle in einem
                  ; Schritt1: Dekrementiere <CX>
                  ; Schritt2: Sprung, wenn <CX> ungleich 0
mov al,0
out 00,al ; alle LED „ausschalten“
mov cx,-1
schl4: loop schl4


jmp start ; Endlosschleife
; ------------------------------------------------------------------------------------
