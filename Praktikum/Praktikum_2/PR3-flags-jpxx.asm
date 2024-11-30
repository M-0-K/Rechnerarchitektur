
ORG 100H
;----------------------------------------

; PRAKTIKUM 3:
; Flags und bedingte Spruenge

start:
; Sagen Sie voraus, welche Flags (CF-ZF-PF-SF) und wie durch die
; entsprechenden Befehle beeinflusst werden, Ueberpruefen Sie

          mov  ax,0281h ;0000 0010 1000 0001b       ; CF=0, ZF=0, PF=0, SF=0  
          cmp  al,0c0h  ;1000 0001 - 0000 1100 0000 ; CF=1, ZF=0, PF=0, SF=1
          test al,7eh   ;1000 0001 & 0111 1110      ; CF=0, ZF=0, PF=1, SF=?1?
          or   al,18h   ;1000 0001 | 0001 1000      ; CF=0, ZF=0, PF=1, SF=1
          and  al,0fh   ;1001 1001 & 0000 1111      ; CF=0, ZF=0, PF=1, SF=0 
          rol  ah,1     ;0000 1001 << 1 -> 0001 0010; CF=0, ZF=0, PF=1, SF=0
          rol  ah,1     ;0001 0010 << 1 -> 0010 0100; CF=0, ZF=0, PF=1, SF=0

eingc:    in   al,0     ; Schalter abfragen
          cmp  al,9     ; Schalter(0000 0000) - 0000 1001 = 
          jc  eingc     ; bei welchen Eingabewerten wird gesprungen ?
                        ;jc -> Jump if Carry -> Carry Flag = 1
                        ;  -> Wenn ein Übertrag bei arithmetischer Operation entsteht

eingt:    in   al,0    ; Schalter abfragen
          test al,81h  ; Schalter(0000 0000) & 1000 0001
          jnz  eingt   ; bei welchen Eingabewerten wird gesprungen ?
                        ;jnz -> Jump if not Zero -> Zero Flag = 0
                        ; -> Wenn das Vorhergehende Ergebnis nicht 0 ist

          nop
          jmp start

;----------------------------------------
