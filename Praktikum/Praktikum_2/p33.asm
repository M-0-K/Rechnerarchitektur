    ORG 100H
;----------------------------------------
start: in al,0
mov ah,al

mov al,00000000b 
out 0,al

test ah,00000001b

je start
jmp leds

leds: mov al,11111111b

mov cx, -1
l3: loop l3

out 0,al

test ah,10000001b

mov cx, -1
l1: loop l1

je start

mov cx, 12000
l2: loop l2

jmp start
;----------------------------------------