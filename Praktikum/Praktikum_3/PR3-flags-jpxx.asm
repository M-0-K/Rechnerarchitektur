
	  ORG 100H
;----------------------------------------

; PRAKTIKUM 3:
; Flags und bedingte Spruenge

start:
; Sagen Sie voraus, welche Flags (CF-ZF-PF-SF) und wie durch die
; entsprechenden Befehle beeinflusst werden, Ueberpruefen Sie
                        ; CF ZF PF SF
          mov  ax,0281h ; -  -  -  -
          cmp  al,0c0h  ; 0  0  1  0
          test al,7eh   ; 0  1  1  0
          or   al,18h   ; 0  0  1  1
          and  al,0fh   ; 0  0  1  0
          rol  ah,1     ; 0  -  -  -
          rol  ah,1     ; 0  -  -  -

eingc:    in   al,0     ; Schalter abfragen
          cmp  al,9
          jc  eingc     ; bei welchen Eingabewerten wird gesprungen ?
                        ; bei allen Werten kleiner 9

eingt:    in   al,0     ; Schalter abfragen
          test al,81h
          jnz  eingt    ; bei welchen Eingabewerten wird gesprungen ?
                        ; wenn mindestens MSB oder LSB gesetzt ist

          nop
          jmp start

;----------------------------------------