
        ORG 100H
;----------------------------------------

;Das erste Praktikum

start:	
        in al,0		;Schalterstellung einlesen
        out 0,al        ;  und auf LED-Zeile ausgeben

        mov cx,-1    	;Zaehler f�r Zeitschleife laden
schl1:  loop schl1      ;	Schritt1: Dekrementiere <CX>
                        ;	Schritt2: Sprung, wenn <CX> ungleich 0
        mov al,0
        out 0,al        ;alle LEDs ausschalten

        mov cx,-1
schl2:  loop schl2

		jmp start        	; Endlosschleife

;----------------------------------------
