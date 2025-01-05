org 100h

; ------------------------------------------------------------------------------------

start:
mov ax, 0
mov bx, 200h

; -------- Aufgabe a --------
aufgabea:
;;in al,0
;;mov [bx], al
;;inc bx
;;cmp bx, 300H 
;;jnz aufgabea

;;jmp start

; -------- Aufgabe b --------
;;aufgabeb:
;;mov ax, 00
;;mov [bx], al
;;inc bx
;;cmp bx, 300H 
;;jz start

;;mov ax, 255
;;mov [bx], al
;;inc bx
;;cmp bx, 300H 
;;jnz aufgabeb

;;jmp start

; -------- Aufgabe c --------
aufgabec:
;;;mov ax, 01h
;;;mov [bx], al
mov al, [bx]
mov [bx+100h], al 
inc bx
cmp bx, 300H 
jnz aufgabec

jmp start


; ------------------------------------------------------------------------------------
