
# Praktikum 2: 8086 - Flags und Bedingte Sprünge

## Vorbereitung 

### 1. Flags
Flags sind speichern besondere Ergebniszustände zur späteren Auswertung.

* __CF Carry-Flag__ Übertragungsflag
  * wird auf 1 gesetzt, wenn bei einer arithmetischen Operation ein Übertrag erfolgt, andernfalls 0
  * dient bei Schiebe- und Rotationsbefehlen als 1-Bit-Zwischenspeicher und wird in Abhängigkeit von der verschiebenden Bitkombination beeinflusst
* __ZF Zero-Flag__ Nulflag
  * wird auf 1 gesetzt, wenn das Ergebnis einer Operation Null ergibt, andernfalls 0
* __PF Parity-Flag__ Paritätsflag
  * wird 1, wenn im Ergbenis eine Operation die Anzahl der Einsen gerade ist, anderfalls 0 (Bsp: 0111 -> 0 | 1010 -> 1) 
  * __Achtung der Schaut nur auf LOW Site Bit -> AH nur AL ist wichtig__
* __SF Sign-Flag__ Vorzeichenflag
  * wird 1 wenn das höchsterwertige Bit (MSB) des Ergebnisses gleich eins ist andernfalls auf 0

### 2. Befehle CMP - TEST

* __CMP Compare__ Vergleiche 
  * __CMP dest, source__
    * Wie SUB, aber \<dest> wird __nicht__ mit dem Ergebnis überschrieben, sondern es werden lediglich die Flags beeinflusst.
* __TEST Logical Compare__ logischer Vergleich 
  * __TEST dest, source__
    * Wie AND, aber \<dest> wird __nicht__ mit dem Ergebnis überschrieben, sondern es werden lediglich die Flags beeinflusst.

### 3. Bedingte Sprünge 

Bedingte Sprünge, sind Sprungbefehle, welche nach Erfüllung einer Bedingung durchgeführt werden. Diese Bediungungen beziehen sich auf Flags, bzw. auf das Ergebnis von Compare befehlen.

--> Siehe Befehlsliste Seite 13 <--

### 4. welche Zahlenwerte Erfüllen die Sprungbedingung

```asm 
in al, port  
test al, 1fh //port && 0001 1111
jz m1  //Jump if Zero -> ZF=1
```
* port <<< 0000 0000, 1000 0000, 0100 0000, 1100 0000, 0010 0000, 0110 0000, 1110 0000

```asm
in ax, 0ah // 0001 1010
rol ax, 1  // 0001 1010 << 1 ==>  CF= 0 0011 0100
jc m1 //Jump if Carry -> If(CF=1)
```
* CF <<< Wird nicht 1 in AX müsste eine Zahl stehen mit 1XXX XXXX

```asm
in al, sensor 
cmp al, 64 //sensor - 0100 000
jnc m1 // Jump if not Carry -> If(CF=0)
```
* alle sensor > 64 

### 5. Vorbereitung auf Testat!! 

```asm

```

## Beispiel

@import "PR3-flags-jpxx.asm"

## Programmier Aufgaben 

### p31
Alle LEDs sollen nur dann leuchten, wenn der Schalter S0 eingeschaltet ist.
@import "p31.asm"

### p32
Auf der LED-Reihe soll eine einzelne LED fortlaufend hin und her „wandern“.
### p33
Alle LEDs sollen sichtbar blinken, wenn der Schalter S0 eingeschaltet ist und der 
Schalter S7 soll zusätzlich die Blinkfrequenz steuern (schnell und langsam):
ofür die Auswertung beider Schalter soll nur einmal eingelesen werden
odas Programm soll unabhängig von der Stellung der anderen Schalter funktionieren
oentwerfen Sie zu Beginn einen Programmablaufplan und setzen diesen um.
## p34
Auf den Stellen 3 und 4 der 7-Segment-Anzeige soll der Zustand der Schalter S3 und 
S4 (jeweils „0“ oder „I“) angezeigt werden.
### p35
Mit der LED-Zeile soll das Blinklicht eines Autos (alle Möglichkeiten) nachgestellt 
werden. Vermeiden Sie durch eine entsprechende Planung des Programmablaufs 
Spaghetti-Code!
