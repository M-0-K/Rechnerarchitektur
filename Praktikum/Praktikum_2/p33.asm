
ORG 100H
;----------------------------------------

start:
        mov al, 0
        in al, 0
        test al, 01h
        jz start
        mov ah, al
blink:  
        mov al, 11111111b
        out 0, al
        mov cx,-1
        schl1: loop schl1
        test ah, 80h
        jz kurz1
            mov cx,-1
            schl2: loop schl2
        kurz1:
        mov al, 00000000b
        out 0, al
        mov cx,-1
        schl3: loop schl3
        test ah, 80h
        jz kurz2
            mov cx,-1
            schl4: loop schl4
        kurz2:
        jmp blink


;----------------------------------------
