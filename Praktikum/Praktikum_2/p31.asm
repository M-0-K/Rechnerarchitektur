org 100h
; ------------------------------------------------------------------------------------
start:
mov al, 0
out 0, al  
ledan:
in al, 0  ;Einlesen der Schalter nach Register AL 
test al, 11111111b 
jz start
test al, 11111110b 
jnz start
mov al, 11111111b
out 0, al  ;Ausgabe Inhalt AL nach den LED 
jmp ledan  ;ständig wiederholen
; ------------------------------------------------------------------------------------


