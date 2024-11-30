org 100h
; ------------------------------------------------------------------------------------
start:
mov al, 1

l00pright:
out 0, al 
rol al, 1
mov cx,-1
schl1: loop schl1
jnc l00pright

ror al, 1ss
l00pleft:
out 0, al 
ror al, 1
mov cx,-1
schl2: loop schl2
jnc l00pleft

jmp start

; ------------------------------------------------------------------------------------
