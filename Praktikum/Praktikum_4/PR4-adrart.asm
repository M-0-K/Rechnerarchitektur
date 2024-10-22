
        ORG 100H
;----------------------------------------

; PRAKTIKUM 4:
; Adressierungsarten

; Kommentieren (Beschreiben) Sie folgende Befehle bzw.
; Programmablaeufe!
; Welche konkreten Zahlenwerte werden gelesen bzw.
; geschrieben?
; Was ist der Unterschied zwischen EQU und DB?
; Wie zeigen sich die so definierten Werte im fertigen
; Maschinencode ?


scha:	equ 0		;Adresse Schalter
leds:	equ 0		;Adresse LEDs
anz0:	equ 90h		;Adresse rechte 7-Segm-Anzeige
anz1:   equ 92h

start:
		;Durch welchen Zahlenwert wird beim Uebersetzen der 
		;Variablenname ersetzt?
		mov al,[vari8a]
		not al
		mov [vari8a],al

		;Warum muss dem Uebersetzer in den folgenden Befehlen die
		;Groesse des Operanden extra mitgeteilt werden?
		mov byte [vari8b],88h
		inc word [vari16]
	
		mov bx,textanf
		mov cl,[bx]
		mov ch,[bx+3]
		mov dl,[textend]

        mov al,01000000b
        mov dx,anz0
        out dx,al        ; im Display anzeigen
        inc dx
        inc dx
		out dx,al        ; naechste Stelle
		inc dx
        inc dx
		out dx,al        ; ...

		mov cx,4
		mov si,0
schl:	mov bx,codetab
		mov al,[bx+si]
		out anz1,al
		inc si
		loop schl
		
		nop

		jmp start

		dd 0
 
vari8a:	db 55h
vari8b:	db 0
vari16:	dw 1234h

textanf: db "ABCabc"
textend: db 0ffh

codetab: 
		db 00000110b	;1
		db 01011011b	;2
		db 01001111b	;3
		db 01100110b	;4

;----------------------------------------

