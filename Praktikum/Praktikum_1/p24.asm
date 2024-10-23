org 100h
; ------------------------------------------------------------------------------------
start: mov AH,0 ; LEDs aus in AL
int 6

mov cx,-1
schl2: loop schl2
mov al,1
out 0x90,al ; LEDs 0,1,2 einschalten

mov cx,-1
schl1: loop schl1
jmp start ; Endlosschleife
; ------------------------------------------------------------------------------------