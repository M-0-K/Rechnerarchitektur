# Praktikum 3: 8086 - Adressierungsarten
- [Praktikum 3: 8086 - Adressierungsarten](#praktikum-3-8086---adressierungsarten)
  - [Vorbereitung](#vorbereitung)
    - [1. Aufgabe](#1-aufgabe)
    - [2. Aufgabe](#2-aufgabe)
      - [implizite Adressierung](#implizite-adressierung)
      - [unmittelbare Adressierung](#unmittelbare-adressierung)
      - [direkte Adressierung](#direkte-adressierung)
      - [indirekte Adressierung](#indirekte-adressierung)
      - [relative Adressierung-\> JR Z, 200H](#relative-adressierung--jr-z-200h)
    - [3. Aufgabe](#3-aufgabe)

## Vorbereitung 
### 1. Aufgabe
Was versteht man unter Adressierungsarten? Was sind Zeigerregister / Pointer?

- Algorithmus zur Bestimmung der Ablageorte von Informationen welche in Registern, Speicherzellen oder Ports stehen

- Adreßregister — Pointer Register, Index Register
    - Adreßinformationen für Zugriffe auf Speicher und E/A
    - ermöglichen die Berechnung von Operandenadressen
    - eingeschränkt zur Datenablage geeignet

### 2. Aufgabe 
Welche Möglichkeiten, Operanden zu adressieren, bietet der 8086?
#### implizite Adressierung
 - Operand durch Befehl eindeutig festgelegt, keine separate Angabe
    - SCF -> Set Carry Flag
    - NOP -> No operation
#### unmittelbare Adressierung
 - Befehle enthält unmittelbar einer konstanten Operanden
    - MOV CX 1234H ->  Lade CX mit 1234H
    - MOV BH 99H -> Lade BH mit 99H

#### direkte Adressierung
 - Befehlscode enthält direkt die Adresse eines Speicher- bzw. I/O- Operanden
    - MOV DX,[1000H]  -> Lade DX mit Inhalt der Speicherzelle 1000H
    - OUT 20H,AL  -> Ausgabe AL auf I/O-Port 20H 

#### indirekte Adressierung
 - Befehlscode enthält Information zur Bestimmung der Operanden-adresse
    - Basisvariante 
        - Befehl benennt ein Adressregister (BX, SI, DI, BP)
        - Adresse steht in diesem Registerpaar
            - MOV CL,[BX] -> Lade CL mit Inhalt der Speicherzelle, deren Adresse in BX steht
    - Komplexe Varianten
        - Adresse ist Summe aus Inhalt 16-Bit Adressregister (BX od. BP), einem 16-Bit Indexregister (SI od. DI) und einem konstanten Displa- cement/Offset
            - MOV BX,1000H
            - MOV [BX+2], 32H Schreib 32H in Speicherzelle 1002H

#### relative Adressierung-> JR Z, 200H

### 3. Aufgabe
Erklären Sie die Funktion folgender Anweisungen und Befehle:
```asm 
null:       equ 3fh
stelle1:    equ 92h
            mov  cx, [var16]            ; Kopiere [var16](Speicherzelle mit Adr. var16)  in cx Register
            mov  bx, var8               ; Kopiere var8 in bx Register
            mov  al, [bx]               ; Kopiere die ersten 4 stellen 
            mov  [var8], al
            mov dx, stelle1
            mov al, null
            out  dx, al
            or  byte [0120h], 00000011b ; byte: Warum? Effekt?
            mov word [0200h], 1         ; word: Warum? Effekt?
var8:       db  0
var16:      dw 1


```