
ORG 100H

; --------------------

start: mov ah,0
int 6

in al,0
and al,00001111b
mov bx,0
mov bl,al
mov ah,100b
mov dl,00000110b 
int 6

mov cx,-1
schl1: loop schl1

jmp start
