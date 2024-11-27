# Praktikum 1

## Vorbereitung

### 1. Assemblerbefehl:
- Maschinenbefehl:
- Op-Code:
- Daten:
- Konstante:
- Variable:
- Quelloperand:
- Zieloperand:

### 2. Wie funktionieren folgende Befehle prinzipiell:
- MOV dest,source - Kopiert den Inhalt von source nach dest
- IN dest,source - Vom Datenport source wird ein Operand gelesen und nach dest geschrieben
- OUT dest,source - Der Inhalt von source wird an dest ausgegeben
- ADD dest,source - Der Inhalt von dest und source wird addiert und in dest geschrieben
- SUB dest,source - Der Inhalt von source wird von dest subtrahiert
- INC dest - Der Inhalt von dest wird um 1 erhöht
- DEC dest - Der Inhalt von dest wird um 1 verringert
- CMP dest,source - Wie SUB, aber dest wird nicht mit dem Ergebnis überschrieben, es werden lediglich die flags beeinflusst
- NOT dest - der Inhalt von dest wird bitweise komplementiert
- AND dest,source - die Inhalte von dest und source werden bitweise UND verknüpft und in dest geschrieben
- OR dest,source - Die Inhalte von dest und source werden bitweise ODER verknüpft und in dest geschrieben
- XOR dest,source - siehe And, or nur halt mit xor
- SHL source,count - Der Inhalt von source wird count mal nach links geschoben
- SHR source,count - Der Inhalt von source wird count mal nach rechts geschoben
- ROL source,count - wie SHL, nur wird das MSB nach LSB Kopiert
- ROR source,count - wie SHR, nur wird das LSB nach MSB Kopiert
- RCL source,count - wie ROL, nur wird das MSB erst in die Carry Flag und dann in LSB kopiert
- RCR source,count - wie ROR, nur wird das LSB erst in die Carry Flag und dann in MSB kopiert

### 3. Wie werden diese Baugruppen des SBC86 verwendet:
- Abfrage der Schalterstellung, direkte Ansteuerung der LED-Reihe:
  - 
- Direkte Ansteuerung der 7-Segment-Anzeige:
  - Adressen 90h-9eh