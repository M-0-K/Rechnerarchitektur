org 100h
; ------------------------------------------------------------------------------------
start:mov al,00000001b

links: out 0,al ; LEDs aus in AL
shl al,1
cmp al,10000000b

mov cx, -1
l1: loop l1

jne links ; Endlosschleife

rechts: out 0,al ; LEDs aus in AL
shr al,1
cmp al,00000001b

mov cx, -1
l2: loop l2

jne rechts ; Endlosschleife

jmp start ; Endlosschleife
; ------------------------------------------------------------------------------------