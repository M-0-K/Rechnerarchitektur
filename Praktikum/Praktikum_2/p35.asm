
ORG 100H
;----------------------------------------
setup:  
    mov ah, 0
    int 6

start:
    in al, 0
    mov bh, al
    mov al, 0
    out 0, al
        mov cx,-1
        schl1: loop schl1
    
    test bh, 10000000b
    jz links
    add al, 10000000b
    links:

    test bh, 1b
    jz rechts
    add al, 1b
    rechts:
    out 0, al
    
        mov cx,-1
        schl2: loop schl2

jmp start

;----------------------------------------
