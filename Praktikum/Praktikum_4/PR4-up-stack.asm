
ORG 100H

; UNTERPROGRAMME UND STACK

; Beschreiben Sie den Verlauf des Stackbereiches !
; Auf welchen Adressen werden welche Werte zu
;   welchem Zweck abgelegt ?
; Beobachten Sie den Stackpointer und den Stack!
; (Fenster Register und Memory)

schalt:	equ 0	; Adresse Schalter

start:	mov ax,1234h		// 1234h in ax schreiben
		mov bx,8000h		// 8000h in bx schreiben
		call spwr			// spwr aufrufen, Rückkehraddresse in Stack schreiben, SP-2
		mov si,bx			// bx in si schreiben
		mov di,ax			// ax in di schreiben
		jmp start

buf:	db 0, 0

spwr:	push ax				// ax in Stack schreiben, SP-2
		push bx				// bx in Stack schreiben, SP-2
		mov bx,buf			// buf in bx schreiben
		in al,schalt		// schalter einlesen, in al schreiben
		mov [bx],al			// al in die in bx gespeicherte Adresse schreiben
		call zeit			// UP zeit aufrufen, SP-2
		in al,schalt		// schalter einlesen, in al schreiben
		mov [bx+1],al		// al hinter die in bx gespeicherte Adresse schreiben
		call zeit			// UP zeit aufrufen, SP-2
		pop bx				// obersten Wert im Stack in bx schreiben, SP+2
		pop ax				// obersten Wert im Stack in ax schreiben, SP+2
		ret					// kehre zur Anweisung zurück, die oben im Stack gespeichert ist, SP+2
	
	
zeit:	push cx				// cx in den Stack schreiben, SP-2
		xor cx,cx			// cx mit sich selbst verxodern -> 0000 0000
schl:	loop schl			// cx-1 -> ffff ffff, Springe zu schl wenn cx!=0 -> cx wird runtergezählt
		pop cx				// schreibe die oberste Anweisung im Stack nach cx -> 0000 0000, SP+2
		ret					// kehre zur Anweisung zurück, die oben im Stack gespeichert ist, SP+2

