# Gliederung
- [Gliederung](#gliederung)
- [1. Einführung](#1-einführung)
  - [1.1 Was ist Rechenarchitektur](#11-was-ist-rechenarchitektur)
  - [1.2 Geschichtliche Entwicklung](#12-geschichtliche-entwicklung)
  - [1.3 Grundprinzip der Datenverarbeitung](#13-grundprinzip-der-datenverarbeitung)
  - [1.4 Rechnersysteme](#14-rechnersysteme)
    - [1.4.1 Grundlegender Aufbau](#141-grundlegender-aufbau)
- [2. Softwarearchitektur](#2-softwarearchitektur)
- [3. Rechner aus Programmierersicht](#3-rechner-aus-programmierersicht)
  - [3.1 Speicher und I/O](#31-speicher-und-io)
  - [3.2 Registersatz und Arithmetisch-logische Einheit (ALU)](#32-registersatz-und-arithmetisch-logische-einheit-alu)
- [4. Befehle und Adressierungsarten](#4-befehle-und-adressierungsarten)
  - [4.1 Befehlssatz im Überblick](#41-befehlssatz-im-überblick)
  - [4.2 Befehlsformate und Adressmodelle](#42-befehlsformate-und-adressmodelle)
  - [4.3 Adressierungsarten](#43-adressierungsarten)
  - [3.3 Abschließende Bemerkungen](#33-abschließende-bemerkungen)
- [4. Steuerung des Programmablaufs](#4-steuerung-des-programmablaufs)
  - [4.1 Sprünge](#41-sprünge)
    - [4.1.1 Unbedingter Sprung (unconditional jump)](#411-unbedingter-sprung-unconditional-jump)
    - [4.1.2 Bedingter Sprung (conditional jump)](#412-bedingter-sprung-conditional-jump)
      - [Sprungbedingung](#sprungbedingung)
        - [wichtige Sprünge](#wichtige-sprünge)
        - [Warum Falgs als Sprungbedingung](#warum-falgs-als-sprungbedingung)
          - [Vorteil](#vorteil)
          - [Nachteil](#nachteil)
    - [4.1.3 Realisierung von Hochsprach - Programmstrukturen](#413-realisierung-von-hochsprach---programmstrukturen)
      - [Ergänzung zu Mehrfachtests ub Hochsprachen](#ergänzung-zu-mehrfachtests-ub-hochsprachen)
        - [Realisierung](#realisierung)
    - [4.2 Unterprogramme](#42-unterprogramme)
      - [Befehlssequenz](#befehlssequenz)
      - [Vorteile](#vorteile)
      - [Nachteil](#nachteil-1)
    - [4.2.1 Stack (Stapel)](#421-stack-stapel)
      - [Allgemeine Datenstruktur](#allgemeine-datenstruktur)
      - [FIFO (First In, First Out)](#fifo-first-in-first-out)
      - [LIFO (Last In, First Out)](#lifo-last-in-first-out)
    - [4.2.2 Stack an Prozessoren](#422-stack-an-prozessoren)
      - [FIFO Struktur in HW durch Prozessor unterstützt](#fifo-struktur-in-hw-durch-prozessor-unterstützt)
      - [Zugriff auf Stackelemente](#zugriff-auf-stackelemente)
      - [Beispiel Blinklicht](#beispiel-blinklicht)
      - [Ablauf von CALL / RET](#ablauf-von-call--ret)
        - [CALL adr](#call-adr)
        - [RET](#ret)
- [5. Architekturen für moderne Workstations](#5-architekturen-für-moderne-workstations)
  - [5.1 Mikroprozessoren](#51-mikroprozessoren)
    - [aktuelle Einsatztrends](#aktuelle-einsatztrends)
      - [Workstation](#workstation)
      - [Embedded Control](#embedded-control)
      - [Digitaler Signalprozessor](#digitaler-signalprozessor)
  - [5.2 Betriebssysteme](#52-betriebssysteme)
    - [5.2.1 Multitasking](#521-multitasking)
    - [5.2.2 erweiterte Aufgaben des Betriebssystems](#522-erweiterte-aufgaben-des-betriebssystems)
    - [5.2.3 Anforderungen aus dem Anwendungsumfeld](#523-anforderungen-aus-dem-anwendungsumfeld)
      - [wesentliche Erhöhung der Verarbeitungsleistung](#wesentliche-erhöhung-der-verarbeitungsleistung)
      - [Isolation der Anwenderprogramme](#isolation-der-anwenderprogramme)
      - [Speicherverwaltung](#speicherverwaltung)
      - [dynamische Addressbindung *(Linking)*](#dynamische-addressbindung-linking)
- [6. Erhöhung der Verarbeitungsleistung](#6-erhöhung-der-verarbeitungsleistung)
  - [6.1 Verarbeitungsleistung](#61-verarbeitungsleistung)
  - [6.2 Leistungsbewertung](#62-leistungsbewertung)
    - [benötigte Programmlaufzeit](#benötigte-programmlaufzeit)
      - [gängige Leistungsmaße](#gängige-leistungsmaße)
    - [6.3.3 Superskalare Prozessoren](#633-superskalare-prozessoren)
      - [6.3.3.1 Pipelining](#6331-pipelining)
        - [6.3.3.1.1 Idealschema:](#63311-idealschema)
        - [6.3.3.1.2 Probleme der Umsetzung](#63312-probleme-der-umsetzung)
      - [6.3.3.1.3 naiver Ansatz](#63313-naiver-ansatz)
      - [6.3.3.1.4 besserer Ansatz](#63314-besserer-ansatz)
- [8. Speichersubsystem](#8-speichersubsystem)
  - [8.1 Einführung](#81-einführung)
  - [8.2 Speicheraufbau und Speicherarten](#82-speicheraufbau-und-speicherarten)
  - [8.3 Cache](#83-cache)

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
- Umsetzung **ausschlißlich** mittels Sprüngen
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

# 5. Architekturen für moderne Workstations
## 5.1 Mikroprozessoren
### aktuelle Einsatztrends
#### Workstation
  - grafische Oberflächen
  - parallel ablaufende Applikationen
  - hohe geforderte Systemleistung
  - großer Speicherraum
  - hohe Systemstabilität
#### Embedded Control
  - Einsatz für Steuerungszwecke
  - breites Einsatzspektrum
  - kompakt
  - stromarm
  - kostenoptimal
  - hohe Zuverlässigkeit
  - kurze Reaktionszeiten
#### Digitaler Signalprozessor
  - numerische Verarbeitung analoger Signale
  - einfache Algorithmen
  - moderater Speicherbedarf
  - sehr kurze Verarbeitungszeiten
  - hohe Rechengenauigkeit (16...48 Bit)

## 5.2 Betriebssysteme
### 5.2.1 Multitasking
  - *quasi* gleichzeitige Bearbeitung mehrerer Tasks auf einem Prozessor
  - mehrere Tasks mit *Code, Daten* und *Stack* gleichzeitig im Speicher
  - Taskwechsel wir durch Betriebssystem vermittelt
  - 
### 5.2.2 erweiterte Aufgaben des Betriebssystems
 - Zuweisung von Speicher zu Task
 - Durchführung Taskwechsel
 - Koordinierung von Zugriffswünschen auf Systemressourcen
 - Vermittlung von Interprozesskommunikation
 - zentrale Verwaltung der grafischen Oberfläche
 - Gewährleistung der Stabilität des Gesamtsystems
 - 
### 5.2.3 Anforderungen aus dem Anwendungsumfeld
#### wesentliche Erhöhung der Verarbeitungsleistung
 - Verwaltungsoverhead Betriebssystem
 - Multitasking
#### Isolation der Anwenderprogramme
 - a) gegeneinander und b) gegenüber dem Betriebssystem
 - Fehlerhafte Programme dürfen nur sich selbst beeinflussen
#### Speicherverwaltung
 - Zuweisung freier Speicherbereiche für Code, Daten und stack
 - Verhinderung von Fragmentation
 - Unterstützung von *virtuellem* Speicher
#### dynamische Addressbindung *(Linking)*
 - Code muss zur Laufzeit an aktuell belegten Addressbereich gebunden werden

# 6. Erhöhung der Verarbeitungsleistung
## 6.1 Verarbeitungsleistung
 - hat zwei Komponenten
   Datendurchsatz * Verarbeitungsgeschwindigkeit
 - Möglichkeiten zur Steigerung
   - schnellere Befehlsbearbeitung - Erhöhung der Taktfrequenz
   - Vergrößerung der Verarbeitungsbreite - 8 ... 16 ... 32 ... 64 Bit
   - Spezialisierung - Abkehr vom Universalprozessor, applikationsspezifische Prozessoren
   - Parallelverarbeitung - Problembearbeitung durch mehrere Prozessoren

## 6.2 Leistungsbewertung
### benötigte Programmlaufzeit
#### gängige Leistungsmaße
 - LinPAC - für Vergleich geeignet
 - MIPS
 - GFLOPS
 - Dhrystone
 - Whetstone
 - SpecInt - für Vergleich geeignet
 - SpecFP - für Vergleich geeignet

**Benchmarks => einzig reale Vergleichsbasis unterschiedlicher Systeme**

Zeit zur Ausführung eines Befehls mit *CPI* Takten pro Befehl bei einer Frequenz von f<sub>Clock</sub>
$$
t_{\text{Befehl}} = \text{CPI} \cdot \tau_{\text{Clock}} = \frac{\text{CPI}}{f_{\text{Clock}}}
$$
Zeit zur Ausführung eines Programms mit n Befehlen:
$$
T_{\text{gesamt}} = \sum_{i=1}^{n} t_{\text{Befehl}_i} = \frac{1}{f_{\text{Clock}}} \sum_{i=1}^{n} \text{CPI}_i
$$
Ist *H* die absolute Häufigkeit von befehlen mit gleichem CPI, so erhält man:
$$
T_{\text{ges}} = \frac{1}{f_{\text{Clock}}} \sum_{j=1}^{m} \text{CPI}_j \cdot H_j \quad \text{mit} \quad n = \sum_{j=1}^{m} H_j
$$
Kennt man nun die relativen Häufigkeiten $h=\frac{H}{n}$, so ergibt sich:
$$
T_{\text{ges}} = \frac{n}{f_{\text{Clock}}} \sum_{j=1}^{m} \text{CPI}_j \cdot h_j
$$
mit $\overline{\text{CPI}}$ als <span style="color: green;">mittlere Anzahl Takte pro Befehl</span>
$$
\overline{\text{CPI}} = \sum_{j=1}^{m} \text{CPI}_j \cdot h_j
$$
ergibt sich schließlich
$$
T_{\text{ges}} = \frac{n}{f_{\text{Clock}}} \cdot \overline{\text{CPI}}
$$

### 6.3.3 Superskalare Prozessoren
#### 6.3.3.1 Pipelining
##### 6.3.3.1.1 Idealschema:
- im Mittel wird 1 Befehl/Takt fertiggestellt (scheinbar $\overline{\text{CPI}}=1$)
- Bearbeitung jedes einzelnen Befehls jedoch <span style="color: red">nicht schneller</span>!
##### 6.3.3.1.2 Probleme der Umsetzung
1. ungleich lange Teiloperationen
2. Strukturengpässe (*Structural Hazards*)
3. Datenabhängigkeiten (*Data Hazards*) aufeinanderfolgender Befehle
4. Änderung des Programmflusses (*Control Hazards*)
notwendige Maßnahmen:
- <span style="color: blue">Pipeline Stall</span> - Einfügen von Leerlauftakten
- <span style="color: blue">Pipeline Flush</span> - Leeren und Neubefüllen der Pipeline
- durch technische und organisatorische Maßnahmen z.T. vermeidbar
  - Änderung Befehlssatz
  - Entflechtung der Abhängigkeiten
  - zusätzliche Hardware

#### 6.3.3.1.3 naiver Ansatz
- 2 Pipelines
- abwechselnd befüllt
- erster Versuch => 1995 Intel <u>80586</u>
- Probleme:
  - großer Bedarf an Speicherbandbreite (Byte/Takt) für mehrere Befehle
  - größerer Einfluss von Datenabhängigkeiten
#### 6.3.3.1.4 besserer Ansatz
- Abkehr vom strikten Pipelineprinzip
- Befehle zentral einlesen
- -> danach Verteilung an **spezi**alisierte Verarbeitungseinheiten/Execution Units
- -> diese entscheiden selbstständig über Reihenfolge der Teilaufträge (Vorverarbeitung muss ok sein)

# 8. Speichersubsystem
## 8.1 Einführung
- Einfluss auf VL -> 7.1
- reale Situationen:
  - CPU-Zugriff 64...192 Bit/Takt
  - Speicherbreite 32...64 Bit
  - HS-Speicher über langsamen Bus mit CPU verbunden 200...800MHz
  - Speicherzugriff HS typisch 10...20ns

## 8.2 Speicheraufbau und Speicherarten
- F. 104ff.
- **SRAM** - schnell, teuer, in CPU Registern verbaut
- **DRAM** - langsamer, günstig, im Hauptspeicher verbaut
- **RAS** - Row Access Shift / Zeile
- **CAS** - Column Access Shift / Spalte

## 8.3 Cache
- F. 110ff.
- **Chacheline** - enthält Kopie einer Folge aufeinanderfolgender Speicherzellen
- **Tag** - Anfangsadresse des kopierten Speicherbereichs