
# 1. Einführung
## 1.1 Was ist Rechenarchitektur
- Siehe Folien F7,8

## 1.2 Geschichtliche Entwicklung

## 1.3 Grundprinzip der Datenverarbeitung
- Siehe Folien F11,12

## 1.4 Rechnersysteme
### 1.4.1 Grundlegender Aufbau
- Siehe Folien F15 ff.
- Universalrechner: kann beliebige Problemstellungen lösen.
- Konsequenzen aus Folie 18:
    - Im System passiert nichts ohne Beteiligung der CPU.
        a. Erhöhte CPU-Belastung:
            - Wunsch: Sensor -> Speicher
            - Realität: Sensor -> CPU -> Speicher
        b. Änderungen im Umfeld müssen aktiv abgefragt werden.

- **Ergänzungen des von-Neumann-Systems zur Beschleunigung**:
    - Siehe Folie F19

---

# 2. Softwarearchitektur
- **ISA** besteht aus:
    - Organisation von Speicher und Peripherie
    - Registersatz
    - Unterstützte Datendarstellung:
        - Ganze Zahlen
        - Bits
        - Floating Point
        - Strings
    - Befehlssatz / Befehlsformat
    - Addressierungsart
    - Ausnahmebehandlung / Ausnahmen
    - Interruptsystem

---

# 3. Rechner aus Programmierersicht
- Siehe Bild in Google Fotos (01.10. 16:04)
## 3.1 Speicher und I/O
- Siehe Folien F24 ff.
- Speicherzelle:
    - Siehe Bild in Google Fotos (01.10. 16:10)
- **Typische Datenbreiten**:
    - n: 4, 8, 16, 32 Bit (Standard: 8 Bit, da häufig Buchstaben gespeichert werden)
- **Typische Adressbreiten**:
    - n: 16, 24, 32, 64 Bit (Standard: 64 Bit -> daher der Name "64 Bit Betriebssystem")
- **Adressraum**: 0 ... 2^m - 1
- **Speicherarten**:
    - Random Access Memory (RAM) – Les- und beschreibbar
    - Read Only Memory (ROM) – nur lesbar
- **Speicheralignment**:
    - Hintergrund: Die CPU kann größere Dateneinheiten (>8 Bit) oft nicht von einer beliebigen Adresse lesen.
    - Siehe Bild in Google Fotos (01.10.2024 16:37)

## 3.2 Registersatz und Arithmetisch-logische Einheit (ALU)
- **Flags**:
    - Technisch einfach zu bilden.
    - Nützlich für Entscheidungen.
        - Flags am Zahlenkreis:
            - Siehe Bild in Google Fotos (08.10.2024 14:16)



# 4. Befehle und Adressierungsarten
## 4.1 Befehlssatz im Überblick
- Typische Befehlsgruppen:
    - Siehe Folie F53

## 4.2 Befehlsformate und Adressmodelle
- Siehe Folie F36
```
_7_6_5_4_3_2_1_0  _7_6_5_4_3_2_1
|Opcode    |D |W| |MOD |REG  |R/M|
|_ _ _ _ _ _ _ _| |_ _ _ _ _ _ _| 
```
- Siehe Bild in Google Fotos (08.10.2024 14:18)

## 4.3 Adressierungsarten
- Siehe Folien F37 ff.
- Anmerkung zur Schreibweise:
    - **Direkte Adressierung**:
        - `MOV DX, [1000H]`  
          `^` -> Adresse der Speicherzelle
    - **Indirekte Adressierung**:
        - `MOV DX, [BX]`  
          `^` -> Register enthält die Adresse
    - **Typische Form komplexer Adressierung**:
        - Maximal 3 Komponenten:
            1. Basisregister
            2. Indexregister (mit Skalierung)
            3. Konstanter Offset/Displacement

        ```text
        Gesamteradresse = <Basisreg> + <Indexreg * 2> + <Displacement>
        ```

        (Beispiel: 8086 hat nur `*1`)
        - EA = effective address (effektive Adresse)

    - **Relative Adressierung**:
        - Befehlscode enthält die Adressdistanz zwischen PC (zum Zeitpunkt der Befehlsausführung) und dem Zielpunkt als 8-Bit-Zahl.

        - Siehe Bild in Google Fotos (08.10.2024 15:27)


## 3.3 Abschließende Bemerkungen
- Teilweise werden weitere Adressierungsarten unterstützt (nicht beim 8086).
- Doppelt indirekte Adressierung.
- Indirekte Adressierung mit Postinkrement/Prädekrement:
  - Zusätzlich zu einem Speicherzugriff wird das Adressregister vorher dekrementiert oder danach inkrementiert.
- Komplexe Adressierungsarten lassen sich durch einfache nachbilden:
  - Beispiel: `MOV AL[BX - 17] => SUB BX, 17; MOV AL, [BX]`
  - **Vorteil**: Gut für den Programmierer.
  - **Nachteil**: CPU wird komplizierter und langsamer.
- Vorausberechnung der effektiven Adresse mittels `LEA` (Load Effective Address):
  - Beispiel: `LEA Zielregister, [Adressausdruck]`

# 4. Steuerung des Programmablaufs
- Bisher: Linearer Programmablauf.
- Ein nicht-linearer Ablauf ist wünschenswert für:
  - Reservierung von Datenbereichen.
  - Kurze zyklische Programme.
  - Bearbeitung ausgewählter Programmabschnitte.
  - Wiederverwendung von Programmsequenzen.

**Technische Mittel**:
- Sprünge.
- Unterprogramme.

## 4.1 Sprünge
- Anweisung zur Programmfortsetzung ab angegebener Adresse.

### 4.1.1 Unbedingter Sprung (unconditional jump)
- Syntax: `JMP adr;` (Programmfortsetzung ab Adresse `adr` oder `[BX]`).
- Beispiel: 
  ```asm
      ORG 100H
  Start:
      IN  AL, Schalter
      OUT LED, AL
      JMP Start ; oder JMP 100H
  ```
- Technische Ausführung: `PC := adr` oder `BX`.

### 4.1.2 Bedingter Sprung (conditional jump)
- Sprungausführung nur bei erfüllter Bedingung.
    - Bedingung ab       -> Sprung 
    - Bedingung nicht ab -> nächster Befehl 

_Hier nochmal Überarbeiten_
- Beispiel: 
    ```asm
    100H CMP AL, BL; compare
    102H JE 110H;
    104H MOV CX,
    _Hier nochmal Überarbeiten_
    ```#
_Hier nochmal Überarbeiten_

#### Sprungbedingung
- Zusand eines oder mehrer Flags
_siehe Befehlsliste S.13_
##### wichtige Sprünge 
    JZ / JNZ //JZ === JE
    JE / JNE //JNZ === JNE
    JC / JNC / JB / JAE

##### Warum Falgs als Sprungbedingung
###### Vorteil
- Zeitersparnis da im VOrfeld schon entschieden 
- Abfallprodukt 
###### Nachteil
- behindern Parallelisierung Befehlsbearbeitung 

### 4.1.3 Realisierung von Hochsprach - Programmstrukturen 
- Umsetzung **auschlißlich** mittels Sprüngen
- Vorgehen am Beispiel einer Entscheidung 
   
    1. Umformung in eine Ablaufstruktur 
    ```C 
    if(A == B){
        C++;
    }
    
    --> 
            if( A != B) goto Marke
            C++;
    Marke:    

            --> 
                CMP A,B > Flags.... > Marke
    ```
    2. Trennung von Test und Auswertung  
        a. Test setzt Flags
        b. bedingter Sprung wertet Flafs aus 
    
    #### Beipiel
    ![Beispiel Foto 15.10.24 15:31]()

#### Ergänzung zu Mehrfachtests ub Hochsprachen 

```cpp
if((a == b) && (c < 7)){ //Kurzschlussverfahren > Falls a != b dann wird c nicht getestet 
    d++;
}

```
##### Realisierung 
```cpp
if (a==b){
    if (c < 7){
        d++;
    }
}
    --->
            if(a != b) goto ende 
                if(c <= 7) goto ende
                    d++
            ende  
```

### 4.2 Unterprogramme

#### Befehlssequenz
- Wiederholt nutzbar.
- Stellt eine abgeschlossene Funktionalität dar.
- Kann von verschiedenen Stellen im Programm aufgerufen werden.
- Nach dem Aufruf kehrt der Programmzähler (PC) zum Befehl nach dem Aufruf zurück.

#### Vorteile
- Geringere Programmgröße.
- Bessere Lesbarkeit.

#### Nachteil
- Kleiner zusätzlicher Aufwand (Verwaltung des Rücksprungs).

### 4.2.1 Stack (Stapel)

#### Allgemeine Datenstruktur
- Enthält 0 bis ∞ Datenelemente gleicher Größe.
- Zwei grundlegende Zugriffsoperationen:
  - **Push**: Fügt ein Element zum Stapel hinzu.
  - **Pop (Pull)**: Entnimmt das oberste Element vom Stapel.
- Die Organisation bestimmt den Ablageort der Elemente im Stapel.

#### FIFO (First In, First Out)
- Elemente werden in der Reihenfolge ihres Eintreffens entnommen. Das zuerst hinzugefügte Element wird zuerst entnommen.

```cpp

  ->  |   |
      |   |
      |___| ->
```

#### LIFO (Last In, First Out)
- Das zuletzt hinzugefügte Element wird als erstes entnommen.
```cpp

  ->  |   | ->
      |   |
      |___| 
```

### 4.2.2 Stack an Prozessoren
#### FIFO Struktur in HW durch Prozessor unterstützt
- reserviert viel Speicherbereich
- Zeiger auf Staplespitze
- Operationen für Push/Pop

- ! Stacks werden von höheren in Richtung niederer Adressen gefällt
- ! Stack muss schriebbar sein -> RAM
- Größe Datenelemt entspricht i.d.h Größe Adressregister (8086 2 Byte -> 16 bit)


#### Zugriff auf Stackelemente
- a. Befehl zum lesen/schreiben von 16 Bit Registern
    PUSH Reg16 / POP Reg16
- b. Kopiern SP in Adressregister unter indirekte Adressierung 
    MOV BK, SP 

    Siehe Foto 15.10.2024 16:34




#### Beispiel Blinklicht 

```asm
Start:
        MOV AL, OFFH
        OUT LED, AL     ;alles ein
        CALL Pause
        MOV AL, 00
        OUT LED, AL     ;alles aus
        CALL Pause
        JMP Start 
Pause: 
        PUCH CX         ;kopie voll
        MOV CX,6000
again:  SUB CX, 1       ;60 000
        JMP again       ; 1 Abziehen
        POP CX,         ; Originalwert zurückholen
        RET
```

#### Ablauf von CALL / RET

##### CALL adr
```C
    SP := SP - size(PC)
    [SP]:= PC
    PC:= adr
```

##### RET
```C
    PC := [SP]
    SP := SP + size(PC)
```