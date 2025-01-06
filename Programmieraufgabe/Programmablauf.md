# Programmablaufplan
## Grobe Aufgabe
- Tastatur und Schalter auslesen
  - 8 Bit Wert speichern
  - Ausgabe beider Werte im Display

- Tastatur auslesen
  - Überprüfen auf `G` oder `E`
    - Schrittweise Suche nach dem eingegebenen Wert
      - Wenn gefunden: Ausgabe der Adresse im Display rechts
      - Wenn nicht gefunden: `----` anzeigen

---
## Hauptroutine
- Start
- Startwert in `BX`
- Main Loop:
  - Einlesen Schalter
    - ... Ausgabe
  - Einlesen Tastatur als Loop
    - ... Suche starten
    - ... Ausgabe
---
### Unterprogramme:
- Einlesen Schalter
  - Schalter auslesen -> `AL`
  - Ausgabe `AL` im Display Links
- Einlesen Tastatur
  - Per Interrupt
  - G/E: Starte Suche von Anfang
  - \+: Suche weiter
- Ausgabe Links
  - Per Interrupt
  - Ausgabe `AH`
- Ausgabe Rechts
  - Per Interrupt
  - Ausgabe `BX`
- Suche
  - Loop
  - `inc BX`
  - Compare `AH` `[BX]`
    - Treffer: Stoppe Loop + Ausgabe Rechts
    - Kein Treffer: Weiterlaufen lassen
    - Falls Limit erreicht: Ausgabe Rechts `----`

### Register Funktionen
- AL - Schalterstellung
- BX - Aktuelle Suchadresse