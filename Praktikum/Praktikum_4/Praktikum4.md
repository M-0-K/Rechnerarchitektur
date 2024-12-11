# Praktikum 3

## Vorbereitung
1. Unterprogramme sind Befehlssequenzen, die einmal im Speicher stehen und mehrmals aufgerufen werden können.
2. Der Stack ist ein reservierter Speicherbereich für Daten und Adressen und der Stackpointer zeigt auf den Top of Stack bzw. das zuletzt eingefügte Element
3. Befehle:
   - `CALL <label>`: schreibt die Adresse des Befehls im Instruction Pointer in den Stack und springt zu label
   - `RET`: schreibt die oberste Adresse im Stack in den Instruction Pointer und springt dorthin
   - `PUSH <source>`: schreibt den Inhalt von source in den Stack SP++
   - `POP <dest>`: schreibt das oberste Wort im Stack nach dest SP--

## Beispiel
1. Befehle kommentieren
2. Unterschied zwischen `Trace Into` und `Step Over`

## Aufgaben
1. Unterprogramm `clrdisp`, das die 7-Segment-Anzeige löscht