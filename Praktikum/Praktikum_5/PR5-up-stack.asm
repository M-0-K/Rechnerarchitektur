
ORG 100H

; UNTERPROGRAMME UND STACK

; Beschreiben Sie den Verlauf des Stackbereiches !
; Auf welchen Adressen werden welche Werte zu
;   welchem Zweck abgelegt ?
; Beobachten Sie den Stackpointer und den Stack!
; (Fenster Register und Memory)

schalt:	equ 0	; Adresse Schalter

start:	mov ax,1234h
		mov bx,8000h
		call spwr
		mov si,bx
		mov di,ax
		jmp start

buf:	db 0, 0

spwr:	push ax
		push bx
		mov bx,buf
		in al,schalt
		mov [bx],al
		call zeit
		in al,schalt
		mov [bx+1],al
		call zeit
		pop bx
		pop ax
		ret	
	
	
zeit:	push cx
		xor cx,cx
schl:	loop schl
		pop cx
		ret

