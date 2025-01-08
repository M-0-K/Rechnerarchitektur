org 100h

;
; p44: Entwickeln Sie einen weiteren „elektronischen Würfel“: Verwenden Sie jetzt die im 
; SBC86 bereitgestellten Systemaufrufe INT5 und INT6 (siehe Lehrunterlagen „Anleitung 
; Programmierung mit dem 8086“ S. 10 und in diesem Praktikum verlinkte PDF „Hinweise 
; zur Ansteuerung von Tastatur und Display“).
; Löschen Sie zuerst das Display. Dann soll „gewürfelt“ werden, solange auf der Tastatur 
; eine beliebige Taste gedrückt wird. Der Wert soll auf der Displaystelle 3 (und nur auf 
; dieser) angezeigt werden.
;
; ------------------------------------------------------------------------------------


setup:
; Display Clearen
mov ah, 0 
mov bl, 1
mov dl, 3
int 6

loop:
; Schalter prüfen
in al, 0
test al, 11111111b
jnz wurf

; Zeige Nummer
mov ah, 1
mov al, bl
int 6

; Inc Zahl
inc bl,
cmp bl, 6
jnz loop
mov bl, 1
jmp loop

wurf:
in al, 0
test al, 11111111b
jz loop
jmp wurf



jmp setup

; ------------------------------------------------------------------------------------
