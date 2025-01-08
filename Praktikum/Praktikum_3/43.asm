org 100h

;
; p43: Entwickeln Sie einen „elektronischen Würfel“: Auf der 7-Segment-Anzeige (direkte 
; Displayansteuerung) soll auf einer Stelle, wenn der Schalter S0 eingeschaltet ist, fort-
; laufend zwischen 1 und 6 gezählt werden (sichtbar, aber die Ziffern nicht erkennbar). 
; Wird der Schalter ausgeschaltet, soll im Display der „gewürfelte Zufallswert“ stehen. 
;
;
; 1 -> 1 & 2 
; 2 -> 0 & 1 & 6 & 4 & 3
; 3 -> 0 & 2 & 6 & 2 & 3
; 4 -> 5 & 6 & 1 & 2 
; 5 -> 0 & 5 & 6 & 2 & 3
; 6 -> 0 & 5 & 4 & 6 & 3 & 2
; ------------------------------------------------------------------------------------

segClear: equ 00000000b ; alles aus
seg1: equ 00000110b ; Segmente 1 und 2
seg2: equ 01011011b ; Segmente 0, 1, 6, 4, und 3
seg3: equ 01001111b ; Segmente 0, 2, 6, und 3
seg4: equ 01100110b ; Segmente 5, 6, 1, und 2
seg5: equ 01101101b ; Segmente 0, 5, 6, 2, und 3
seg6: equ 01111101b ; Segmente 0, 5, 4, 6, 3, und 2


setup:
; Display Clearen
mov al, segClear 
out 90h, ax
mov dh, 1
mov dl, 1

loop:
; Schalter prüfen
in al, 0
cmp al, 01b
jz wurf

mov dl, dh
call number
out 90h, ax
inc dh
cmp dh, 7
jnz loop
mov dh, 0
jmp loop

wurf:
in al, 0
cmp al, 10b
jz loop
jmp wurf


number:
dec dl
mov al, seg1
jz numberend
dec dl
mov al, seg2
jz numberend
dec dl
mov al, seg3
jz numberend
dec dl
mov al, seg4
jz numberend
dec dl
mov al, seg5
jz numberend
dec dl
mov al, seg6
numberend:
ret


jmp setup

; ------------------------------------------------------------------------------------
