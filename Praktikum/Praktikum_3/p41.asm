org 100h


; p41: Der Speicherbereich von 200H bis 2FFH soll
; a. mit dem einmal eingelesenen Wert der Schalter beschrieben werden,
; b. fortlaufend mit 00-FF beschrieben werden,
; c. nach 300-3FFH kopiert werden.
; ------------------------------------------------------------------------------------

;start:
;mov ax, 0
;mov bx, 200h

; -------- Aufgabe a --------
;aufgabea:
;in al,0
;mov [bx], al
;inc bx
;cmp bx, 300H 
;jnz aufgabea

;jmp start

; -------- Aufgabe b --------
;aufgabeb:
;mov ax, 00
;mov word [bx] 00 ;-> [299] -> 00 
;inc bx ; -> 300
;cmp bx, 300H 
;jz start
;mov word [bx], FF ; [300] -> FF 
;inc bx
;cmp bx, 300H 
;jz start
;jnz aufgabeb

;jmp start

start:
; [300] - [3FF] <-Kopiere-  [200] - [2FF]
mov bx, 200h
;mov bx, 300h
schleife: ; do {
mov cl, [bx]
mov [bx+100h], cl
inc bx
;inc bx
cmp bx, 300h ; } while (bx != 3ffh)
jnz schleife
jmp start 





















; -------- Aufgabe c --------
;aufgabec:
;;;mov ax, 01h
;;;mov [bx], al
;mov al, [bx]
;mov [bx+100h], al 
;inc bx
;cmp bx, 300H 
;jnz aufgabec

;jmp start


; ------------------------------------------------------------------------------------
