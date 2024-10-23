org 100h
; ------------------------------------------------------------------------------------
start: mov al,0 ; LEDs aus in AL
out 0,al ; LED-Zeile clearen
mov cx,-1 ; Zaehler für Zeitschleife laden
schl1: loop schl1 ; loop: zwei Befehle in einem
; Schritt1: Dekrementiere <CX>
; Schritt2: Sprung, wenn <CX> ungleich 0
mov al,7
out 00,al ; LEDs 0,1,2 einschalten
mov cx,-1
schl2: loop schl2
jmp start ; Endlosschleife
; ------------------------------------------------------------------------------------