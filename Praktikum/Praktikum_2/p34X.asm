org 100h;
;-------------------
start:
in al, 0; Schalterstellung einlesen
mov bl, 0; bl auf 0 (bl für Segmentanzeige) 0 wird angezeigt
test al, 00000100b;
jz skip1; skip, wenn 3 aus
mov bl, 1; 01 in Segmentanzeige

skip1:
test al, 00001000b;
jz skip2; skip, wenn 4 aus
or bl, 00010000b; 1 wird in bl geladen -> 10 oder 11

skip2:
mov ah, 4; Siehe Verlinkungen
mov dl, 3;
int 6;
jmp start;