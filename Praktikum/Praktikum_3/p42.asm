org 100h

;
; p42: Löschen Sie zuerst das Display. Zeigen Sie dann den hexadezimalen Wert der 
; Schalter S3-S0 auf einer Stelle an (direkte Displayansteuerung). Hinweis: erstellen Sie 
; eine Tabelle, in der nacheinander alle Codes für die Anzeige der Ziffern 0, 1 – 9, A, b, C, 
; d, E, F aufgelistet sind. Positionieren Sie einen Zeiger auf die richtige Position und lesen 
; Sie den Code ..
; eigentlich ist eine Tabelle mit Logic spaß gewollt mal schauen...
;
; ------------------------------------------------------------------------------------

setup:
; Display Clearen
mov ah, 0 
int 6

loop:
; die Zahlen von Schlater auf Display 
in al, 0
mov ah, 4
mov bl, al
mov dl, 1
int 6

jmp loop
jmp setup

; ------------------------------------------------------------------------------------
