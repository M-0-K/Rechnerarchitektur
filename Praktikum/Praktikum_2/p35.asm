    ORG 100H
;----------------------------------------
; mit leds soll blinklicht eines autos imitiert werden, schalter7 links blinken, schalter1 rechts blinken, beide warnblinkanlage
start: in al,0 ; einlesen der aktuellen schalterstellung
mov ah,al

mov cx, -1
l1: loop l1

mov al,00000000b
out 0,al

mov cx, -1
l2: loop l2

test ah,00000001b
jz skip1 ; falls s0 aus
mov al,00001111b
out 0,al

skip1: test ah,10000000b
jz skip2 ; falls s7 aus
or al,11110000b
out 0,al

skip2: jmp start