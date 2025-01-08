null:       equ 3fh
stelle1:    equ 92h
            mov  cx, [var16]            ; Kopiere [var16](Speicherzelle mit Adr. var16)  in cx Register
            mov  bx, var8               ; Kopiere var8 in bx Register
            mov  al, [bx]               ; Kopiere die ersten 4 stellen 
            mov  [var8], al
            mov dx, stelle1
            mov al, null
            out  dx, al
            or  byte [0120h], 00000011b ; byte: Warum? Effekt?
            mov word [0200h], 1024      ; word: Warum? Effekt?
var8:       db 2
var16:      dw -1
