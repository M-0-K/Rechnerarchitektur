;----------------------------------------
; Vorlage / Programm-Rahmen:
; "Funktion" mit Zeitgeber-Interrupt
;----------------------------------------

        ORG 100H

;Initialisierungen
;-----------------
start:  cli          	;Init
        call IVTABinit 	; der Vektortabelle
        call PICinit   	; des Interruptcontrollers
        call PITinit   	; des Zeitgeberschaltkreises
        sti
		
		; ev. weitere Initialisierungen
         
;Hauptprogramm
;-------------
hintergrund:
		; Programm
        jmp hintergrund


; moegliche Variablen definieren (je nach Funktion des Programmes)
husk: db 0    ; z.B. hundertstel Sekunden
seku: db 0    ; z.B. Sekunden
stat: db 0    ; z.B. eine Statusvariable


;Interruptserviceroutine
;-----------------------
isr8:   push ax
		; ev. weitere Register retten

		; Programm ISR (die gewuenschte Funktion)

isrret: mov al,20h
        out 0c0h,al      ;PIC wieder freigeben
		; ev. gerettete Register zurueckholen
        pop ax
        iret


;Interruptcontroller initialisieren
;----------------------------------
PICinit:
		in al,0c2h      ;Lesen des Int.-Maskenregisters des PIC
        and al,11111110b
        out 0c2h,al 	;neuen Wert zurückschreiben
        ret

;Zeitgeber initialisieren: Interrupt alle 10 ms
;----------------------------------------------

ZK:    equ 18432    ;Zeitkonstante fuer 10-ms-Interrupt
STWT1: equ ***		;Steuerwort: Binärzähler, Mode3, Low+Hi, Timer1

PITinit:
        mov al,STWT1
        out 0a6h,al 	;Timer programmieren
        mov ax,ZK
        out 0a2h,al 	;Low-Teil der Zeitkonstante laden
        mov al,ah
        out 0a2h,al 	;Hi-Teil der Zeitkonstante laden
        ret

;Vektortabelle initialisieren (Interrupt 8)
;------------------------------------------
IVTABinit:
		mov ax,isr8		
		mov [***],ax	;Adresse ISR in Vektortabelle eintragen
		mov ax,0		;auch möglich: "mov ax,cs"
		mov [***],ax	;Segmentadresse eintragen
        ret



