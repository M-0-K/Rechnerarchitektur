        ORG 100H

schalt: equ 0

start:  in al,schalt
        shr al,1
        jc on
        jnc off

on:     mov al,0
        not al
        out 0,al
        jmp start

off:    mov al,0
        out 0,al
        jmp start