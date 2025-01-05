# Praktikum 3

## Vorbereitung
1. Was sind Flags. Wann und nach welchen Regeln werden CF, ZF, PF und SF beeinflusst?
    - **CF:** Carry-Flag, wird auf 1 gesetzt, wenn bei einer arithmetischen Operation ein Übertrtag bzw. ein Borgen erfolgt, andernfalls auf 0
    - **PF:** Parity-Flag, wird auf 1 gesetzt, wenn im Ergebnis einer Operation die Anzahl der Einsen gerade ist, andenfalls auf 0
    - **ZF:** Zero-Flag, wird auf 1 gesetzt, wenn das Ergebnis einer Operation Null ist, andernfalls auf 0
    - **SF:** Sign-Flag, wird auf 1 gesetzt, wenn das höchstwertige Bit (MSB) des Ergebnisses gleich eins ist, andernfalls auf 0
    - **OF:** Overflow-Flag, wird auf 1 gesetzt, wenn das Ergebnis einer (vorzeichenbehafteten) arithmetischen Operation den gültigen Zahlenbereicht überschreitet, andernfalls auf 0
2. Wie funktionieren folgende Befehle prinzipiell: CMP, TEST.
   - **CMP dest, source:** compare, wie SUB, aber das Ergebnis wird nicht in dest geschrieben, sondern es werden lediglich die flags beeinflusst
   - **TEST dest, source:** logical compare, wie AND, aber das Ergebnis wird nicht in dest geschrieben, sondern es werden lediglich die flags beeinflusst
3. Was sind bedingte Sprünge, wie funktionieren sie?
   - Bei bedingten Sprüngen wird der Instruction Pointer verändert, wenn eine bestimmte Bedingung erfüllt ist (z.B. eine gewisse Flag gesetzt ist)
4. Welche eingelesenen Zahlenwerte erfüllen die Sprungbedingung?
   1. erfüllt für XXX0 0000
   2. wird nicht erfüllt
   3. erfüllt für X100 0000
5. Erläutern Sie die Varianten und den Wert von Schalter 0 bei erfüllter Sprungbedingung:
   1. Die Sprungbedingung wird nur erfüllt, wenn Schalter 0 


AL 0000 0000
AL 0000 0000