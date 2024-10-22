# Praktikum 1 

## Vorbereitung 

### 1. Wie ist ein Assemblerbefehl aufgebaut? Erläutern Sie die Begriffe: Maschinenbefehl, Op-Code, Daten, Konstante, Variable, Quelloperand (Source), Zieloperand (Destination).

- **Maschinenbefehl**: 
  Ein Maschinenbefehl ist die kleinste ausführbare Einheit eines Programms auf einem Prozessor. Er besteht aus einem **Op-Code** und optionalen Operanden. Maschinenbefehle werden direkt von der CPU interpretiert und ausgeführt.
  
- **Op-Code**: 
  Der Op-Code (Operation Code) gibt an, welche Operation der Prozessor ausführen soll, z.B. eine arithmetische oder logische Operation. Es ist der Teil des Maschinenbefehls, der den Typ der Anweisung definiert.

- **Daten**: 
  Daten sind die Werte, die durch den Befehl verarbeitet werden, entweder als konstante Werte oder als Inhalte von Variablen. Sie können direkt im Befehl angegeben werden (Immediate-Operand) oder über Speicheradressen referenziert werden.

- **Konstante**: 
  Eine Konstante ist ein fester Wert, der sich während der Programmausführung nicht ändert. Sie wird oft als Operand verwendet, z.B. eine Zahl oder ein spezifischer Speicherwert.

- **Variable**: 
  Eine Variable ist ein Speicherplatz, der Werte speichert, die sich während der Programmausführung ändern können. Sie kann als Quell- oder Zieloperand verwendet werden.

- **Quelloperand (Source)**: 
  Der Quelloperand ist der Operand, von dem Daten gelesen werden, um eine Operation durchzuführen. Er gibt den Speicherort oder das Register an, aus dem die Daten stammen.

- **Zieloperand (Destination)**: 
  Der Zieloperand ist der Operand, in dem das Ergebnis einer Operation gespeichert wird. Es kann sich um ein Register oder eine Speicheradresse handeln.


### 2. Wie funktionieren folgende Befehle prinzipiell:

#### a. **MOV / IN / OUT** (Transport- / Eingabe- / Ausgabebefehle)
- **MOV**: 
  Kopiert Daten von einem Quell- zu einem Zieloperand. Beispiel: `MOV AX, BX` kopiert den Inhalt von Register BX in Register AX.
  
- **IN**: 
  Liest Daten von einer Eingabequelle, z.B. einem I/O-Port, in ein Register. Beispiel: `IN AX, DX` liest Daten von dem I/O-Port, der durch DX adressiert wird, und speichert diese in AX.
  
- **OUT**: 
  Schreibt Daten von einem Register in eine Ausgabeschnittstelle, z.B. einen I/O-Port. Beispiel: `OUT DX, AX` schreibt den Inhalt von AX in den I/O-Port, der durch DX adressiert wird.

#### b. **ADD, SUB, INC, DEC, CMP** (Arithmetische Befehle, Vergleich)
- **ADD**: 
  Addiert zwei Operanden und speichert das Ergebnis im Zieloperand. Beispiel: `ADD AX, BX` addiert den Inhalt von BX zu AX.
  
- **SUB**: 
  Subtrahiert den Quell- vom Zieloperand. Beispiel: `SUB AX, BX` subtrahiert den Inhalt von BX von AX.
  
- **INC**: 
  Erhöht den Wert eines Operanden um 1. Beispiel: `INC AX` erhöht den Wert von AX um 1.
  
- **DEC**: 
  Verringert den Wert eines Operanden um 1. Beispiel: `DEC AX` verringert den Wert von AX um 1.
  
- **CMP**: 
  Vergleicht zwei Operanden, indem der Quelloperand vom Zieloperand subtrahiert wird, ohne das Ergebnis zu speichern. Die Statusflags werden entsprechend gesetzt. Beispiel: `CMP AX, BX`.

#### c. **NOT, AND, OR, XOR** (Logische Befehle)
- **NOT**: 
  Negiert alle Bits eines Operanden. Beispiel: `NOT AX` invertiert die Bits von AX.
  
- **AND**: 
  Führt eine logische UND-Operation auf zwei Operanden durch. Beispiel: `AND AX, BX` führt eine bitweise UND-Operation zwischen AX und BX durch.
  
- **OR**: 
  Führt eine logische ODER-Operation auf zwei Operanden durch. Beispiel: `OR AX, BX` führt eine bitweise ODER-Operation zwischen AX und BX durch.
  
- **XOR**: 
  Führt eine logische EXKLUSIV-ODER-Operation auf zwei Operanden durch. Beispiel: `XOR AX, BX` führt eine bitweise XOR-Operation zwischen AX und BX durch.

#### d. **SHL, SHR, ROL, ROR, RCL, RCR** (Rotations- und Schiebebefehle)
- **SHL (Shift Left)**: 
  Verschiebt die Bits eines Operanden nach links. Beispiel: `SHL AX, 1` verschiebt alle Bits in AX um 1 Stelle nach links.
  
- **SHR (Shift Right)**: 
  Verschiebt die Bits eines Operanden nach rechts. Beispiel: `SHR AX, 1` verschiebt alle Bits in AX um 1 Stelle nach rechts.
  
- **ROL (Rotate Left)**: 
  Rotiert die Bits eines Operanden nach links, wobei das Bit, das hinausgeschoben wird, an die rechte Seite verschoben wird. Beispiel: `ROL AX, 1`.
  
- **ROR (Rotate Right)**: 
  Rotiert die Bits eines Operanden nach rechts, wobei das Bit, das hinausgeschoben wird, an die linke Seite verschoben wird. Beispiel: `ROR AX, 1`.
  
- **RCL (Rotate through Carry Left)**: 
  Rotiert die Bits eines Operanden zusammen mit dem Carry-Flag nach links. Beispiel: `RCL AX, 1` rotiert die Bits von AX nach links und verwendet das Carry-Flag.
  
- **RCR (Rotate through Carry Right)**: 
  Rotiert die Bits eines Operanden zusammen mit dem Carry-Flag nach rechts. Beispiel: `RCR AX, 1` rotiert die Bits von AX nach rechts und verwendet das Carry-Flag.

1. Informieren Sie sich, wie diese Baugruppen des SBC86 verwendet werden:
a. Abfrage der Schalterstellung, direkte Ansteuerung der LED-Reihe
b. Direkte Ansteuerung der 7-Segment-Anzeige


## Einfühurng in den Emulator
- OP-Code des Befehls OUT 0, AL 
  - E600 