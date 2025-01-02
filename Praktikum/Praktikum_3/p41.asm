; p41: Der Speicherbereich von 200H bis 2FFH soll
; a. mit dem einmal eingelesenen Wert der Schalter beschrieben werden,
; b. fortlaufend mit 00-FF beschrieben werden,
; c. nach 300-3FFH kopiert werden.

ORG 100H

; -----------------------
; a.
in al,0
call write

mov al, 00H

;; b.
;start:
;mov bx, 200H
;call write
;inc al
;jnc start

;call copy

write: mov bx, 200H
startwrite: mov [BX], al
inc bl
jnc startwrite
ret 

;copy: mov bx, 200H
;startcopy: mov dx, 300H
;mov cx, [bx]
;mov [dx], cx
;inc bl
;inc cl
;jnc startcopy
;ret
