org 100h

;-------------------------------
leds: equ  0x00 
start:   
mov ah, 0
int 6

//0 Speichern und Anzeigen
mov al, 0b00111111
out 0x90, al 
//delay s
mov cx,-1
schl1: loop schl1

//1 Speichern und Anzeigen
mov al, 0x06
out 0x90, al 

//delay 
mov cx,-1
schl2: loop schl2


jmp start 

;-------------------------------------