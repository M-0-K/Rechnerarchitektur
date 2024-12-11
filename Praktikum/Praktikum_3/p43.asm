ORG 100H

; -----------------------

eins: equ 110b
zwei: equ 1011011b
drei: equ 101111b
vier: equ 1100110b
fuenf: equ 1101101b
sechs: equ 111101b

; -----------------------

start:

in al,0
xor al, 1b
jz wuerfeln
jmp start

wuerfeln:
mov al, 110b
out 90h, al
call test
jz start
mov al, 1011011b
out 90h, al
call test
jz start
mov al, 1011011b
out 90h, al
call test
jz start
mov al, 1011011b
out 90h, al
call test
jz start
mov al, 1011011b
out 90h, al
call test
jz start
mov al, 1011011b
out 90h, al
jmp start

; -----------------------

test: in al,0
xor al, 1b