org 100h

;-------------------------------
leds: equ  0x00 
start:   mov al, 0x90

clear:
out 0x90, 0
out leds, 0
add al, 0x02

cmp al, 0x9e
jne clear


jmp start 

;-------------------------------------