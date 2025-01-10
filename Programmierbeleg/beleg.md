# Flow Chart Beleg

- [Flow Chart Beleg](#flow-chart-beleg)
  - [Projektbeschreibung](#projektbeschreibung)
  - [Funktionsweise](#funktionsweise)
  - [Ablaufdiagramm](#ablaufdiagramm)
  - [Code-Struktur](#code-struktur)
    - [Initialisierung](#initialisierung)
    - [Hauptroutine](#hauptroutine)
    - [Suchroutine](#suchroutine)
    - [Anzeige](#anzeige)
  - [Speicherzuweisungen](#speicherzuweisungen)
  - [Beispielablauf](#beispielablauf)


## Projektbeschreibung

Dieses Assembler-Programm implementiert eine Suchroutine, die einen 8-Bit-Wert in einem Speicherbereich sucht. Es verwendet Tastatureingaben, um die Suche zu starten, fortzusetzen oder neu zu beginnen. Das Ergebnis wird auf einem 4-stelligen Display ausgegeben. Wenn der Wert nicht gefunden wird, wird ein Trennstrich angezeigt.

---

## Funktionsweise

1. **Initialisierung**:
   - Das Display wird gelöscht.
   - Ein Trennstrich (`"----"`) wird angezeigt, um den Startstatus zu signalisieren.

2. **Warten auf Benutzeraktion**:
   - Das Programm wartet auf das Drücken der Taste `"G"` (`KeyGo`), um die Suche zu starten.

3. **Suchwert eingeben**:
   - Nach Drücken von `"G"` wird ein 8-Bit-Wert eingelesen und im Speicher unter `SearchValue` abgelegt.

4. **Suche durchführen**:
   - Der Suchindex (`bx`) wird auf `0000h` gesetzt.
   - Die Speicherwerte werden ab der Adresse `0000h` gelesen und mit dem eingegebenen Suchwert (`SearchValue`) verglichen.
   - Wenn eine Übereinstimmung gefunden wird:
     - Die Adresse wird auf den ersten vier Stellen des Displays ausgegeben.
     - Das Programm wartet auf weitere Eingaben:
       - `"+"` (`KeyPlus`): Die Suche wird ab der nächsten Adresse fortgesetzt.
       - `"G"`: Eine neue Suche wird gestartet.
   - Wenn keine Übereinstimmung gefunden wird und der Index `1000h` überschreitet:
     - Ein Trennstrich (`"----"`) wird angezeigt, um "nicht gefunden" zu signalisieren.

---

## Ablaufdiagramm

```flow
st=>start: Programmstart
setup=>operation: Initialisierung und Anzeige eines Trennstrichs
waitGo=>condition: Taste "G" gedrückt?
readValue=>operation: 8-Bit-Wert einlesen und in `SearchValue` speichern
resetIndex=>operation: Index (bx) auf `0000h` setzen
readMemory=>operation: Speicherwert an Adresse `bx` lesen
compare=>condition: Suchwert == Speicherwert?
incrementIndex=>operation: Index um 1 erhöhen
checkEnd=>condition: Index >= `1000h`?
showAddress=>operation: Adresse des gefundenen Wertes anzeigen
ReadTastertur=>operation: Tastertur Lesen!
showDash=>operation: Trennstrich anzeigen ("Nicht gefunden")
checkInputPlus=>condition: Eingabe "+"?
checkInputG=>condition: Eingabe "G"?
continueSearch=>operation: Suche ab aktuellem Index fortsetzen
restartSearch=>operation: Neue Suche starten

st->setup->waitGo
waitGo(no)->waitGo
waitGo(yes)->readValue->resetIndex->readMemory
readMemory->compare
compare(no)->incrementIndex->checkEnd
checkEnd(no)->readMemory
checkEnd(yes)->showDash->waitGo
compare(yes)->showAddress->ReadTastertur
ReadTastertur->checkInputPlus
checkInputPlus(yes)->incrementIndex
checkInputPlus(no)->checkInputG
checkInputG(yes)->restartSearch->readValue
checkInputG(no)->ReadTastertur

```

---

## Code-Struktur

### Initialisierung

- **setup**:
  - Löscht das Display.
  - Zeigt einen Trennstrich (`"----"`) an.

### Hauptroutine

- **start**:
  - Wartet auf Eingabe von `"G"` (`KeyGo`).
  - Leitet die Suche ein.

- **startSearch**:
  - Liest den 8-Bit-Suchwert ein.
  - Initialisiert den Suchindex (`bx`).

### Suchroutine

- **search**:
  - Vergleicht den Wert an der aktuellen Indexadresse (`[bx]`) mit dem Suchwert (`SearchValue`).
  - Falls keine Übereinstimmung: Erhöht den Index (`bx`) und wiederholt die Suche.
  - Falls Übereinstimmung: Zeigt die Adresse an.

- **increment**:
  - Erhöht den Suchindex um 1 und setzt die Suche fort.

- **notFound**:
  - Zeigt einen Trennstrich an, wenn der gesamte Speicher durchsucht wurde, ohne eine Übereinstimmung zu finden.

### Anzeige

- **showAddress**:
  - Gibt die Adresse des gefundenen Wertes auf den ersten vier Stellen des Displays aus.

- **showDash**:
  - Zeigt `"----"` an, um einen nicht gefundenen Suchwert zu signalisieren.

---

## Speicherzuweisungen

- **Dash**: `"----"` (Trennstrich für das Display)
- **KeyGo**: `11h` (Code für die "Go"-Taste)
- **KeyPlus**: `16h` (Code für die "Plus"-Taste)
- **SearchValue**: `00h` (Speicherplatz für den Suchwert)

---

## Beispielablauf

1. Das Programm zeigt `"----"` auf dem Display.
2. Der Benutzer drückt `"G"`, um die Suche zu starten.
3. Ein 8-Bit-Wert (`A5h`) wird eingegeben.
4. Das Programm durchsucht den Speicher:
   - Wenn `A5h` gefunden wird, wird die Adresse angezeigt.
   - Wenn der Suchbereich überschritten wird, zeigt das Programm `"----"`.
5. Der Benutzer kann die Suche mit `"+"` fortsetzen oder mit `"G"` neu starten.

---
