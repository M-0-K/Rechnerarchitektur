org 100h
; Programm
; ------------------------------------------------------------------------------------
start:
; Test Aufgabe 1
mov al, 100
out 90h, ax
call scode
jmp start
; ------------------------------------------------------------------------------------
;
; Aufgabe 1 
; Schreiben Sie ein Unterprogramm „clrdisp“, das die 7-Segment-Anzeige löscht. Es sollen
; nach außen hin keine Register verändert werden.
; ------------------------------------------------------------------------------------
segClear: equ 00000000b ; alles aus
scode:  
setup:
; Display Clearen
push ax
push dx
mov dx, 90h
mov al, segClear 
forallSeg:
out dx, ax
inc dx
cmp dx, 9fh 
jnz forallSeg
pop dx
pop ax
ret 

; ------------------------------------------------------------------------------------
;
; Aufgabe 2
; Schreiben Sie ein Unterprogramm „clrdisp“, das die 7-Segment-Anzeige löscht. Es sollen
; nach außen hin keine Register verändert werden.
; ------------------------------------------------------------------------------------
seg1: equ 00000110b ; Segmente 1 und 2
seg2: equ 01011011b ; Segmente 0, 1, 6, 4, und 3
seg3: equ 01001111b ; Segmente 0, 2, 6, und 3
seg4: equ 01100110b ; Segmente 5, 6, 1, und 2
seg5: equ 01101101b ; Segmente 0, 5, 6, 2, und 3
seg6: equ 01111101b ; Segmente 0, 5, 4, 6, 3, und 2
seg7: equ 01100111b ; Segmente 0, 1, 2, 6
seg8: equ 01111111b ; Segmente 0, 1, 2, 3, 4, 5, 6
seg9: equ 01101111b ; Segmente 0, 1, 2, 3, 5, 6
segA: equ 01110111b ; Segmente 0, 1, 2, 4, 5, 6
segB: equ 01111100b ; Segmente 2, 3, 4, 5, 6
segC: equ 00111001b ; Segmente 0, 3, 4, 5
segD: equ 01011110b ; Segmente 0, 1, 2, 3, 4, 6
segE: equ 01111001b ; Segmente 0, 3, 4, 5, 6
segF: equ 01110001b ; Segmente 0, 4, 5, 6

scode:  push bx
        ; prüfen ob al > F 
        dec 