
org 100h
; ------------------------------------------------------------------------------------
;Eine einzelne leuchtende LED soll in der LED-Reihe fortlaufend sichtbar von links nach rechts „wandern“. 


start:  ;0101 0101 -> 0x55
mov al, 0x80 
unterwegs:
out 0,al ; und auf die LED-Zeile ausgeben
mov cx,-1 ; Zaehler für Zeitschleife laden
schl1: loop schl1 ; loop: zwei Befehle in einem
shr al, 1
cmp al, 0x00
jne unterwegs
jmp start ; Endlosschleife
; ------------------------------------------------------------------------------------
