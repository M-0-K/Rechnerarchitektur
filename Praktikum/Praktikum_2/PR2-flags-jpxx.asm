
	  ORG 100H
;----------------------------------------

; PRAKTIKUM 3:
; Flags und bedingte Spruenge

start:
; Sagen Sie voraus, welche Flags (CF-ZF-PF-SF) und wie durch die
; entsprechenden Befehle beeinflusst werden, Ueberpruefen Sie

          mov  ax,0281h
          cmp  al,0c0h ; 81h cmp 0h -> CF=0, PF=0, ZF=0, SF=0
          test al,7eh  ; 81h test 7eh -> CF=0, PF=1, ZF=1, SF=0
          or   al,18h  ; 81h or 18h -> CF=0, PF=1, ZF=0, SF=1
          and  al,0fh  ; 81h and 0fh -> CF=0, PF=1, ZF=0, SF=0
          rol  ah,1    ; 81h rol 1 -> CF=0, PF=1, ZF=0, SF=0
          rol  ah,1    ; 81h rol 1 -> CF=0, PF=1, ZF=0, SF=0

eingc:    in   al,0    ; Schalter abfragen
          cmp  al,9
          jc  eingc    ; bei welchen Eingabewerten wird gesprungen ?

eingt:    in   al,0    ; Schalter abfragen
          test al,81h
          jnz  eingt   ; bei welchen Eingabewerten wird gesprungen ?

          nop
          jmp start

;----------------------------------------
