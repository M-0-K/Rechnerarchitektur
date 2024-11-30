
ORG 100H
;----------------------------------------
setup:  
        mov ah, 0
        int 6

start:
        in al, 0
        mov bh, al

        mov al, 0b00111111
        mov ah, 0b00111111
        
        test bh, 01000b
        jz drei
        mov al, 0x06
        drei:
        
        test bh, 10000b
        jz vier
        mov ah, 0x06
        vier:

        out 0x96, al
        mov al, ah
        out 0x98, al

        jmp start

;----------------------------------------
