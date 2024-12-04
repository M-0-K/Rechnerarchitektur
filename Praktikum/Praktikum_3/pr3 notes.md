## Addressierungsarten
Was versteht man unter Adressierungsarten? Was sind Zeigerregister / Pointer?

1. Registeradressierung (Register Addressing):
    - Der Operand ist direkt in einem Prozessorregister angegeben.
    - Beispiel: mov al, bl — Der Inhalt von BL wird in AL kopiert.

2. implizite Adressierung (Implicit Addressing):
    - Der Operand ist implizit im Maschinenbefehl enthalten.
    - Beispiel: inc cx — Der Inhalt von CX wird um 1 erhöht.

3. Immediative Adressierung (Immediate Addressing):
    - Der Operand ist direkt im Maschinenbefehl enthalten.
    - Beispiel: mov al, 5 — Die Zahl 5 wird direkt in das Register AL geladen.

4. Direkte Adressierung (Direct Addressing):
    - Die Adresse des Operanden ist direkt im Maschinenbefehl angegeben.
    - Beispiel: mov al, [1234h] — Die Daten an Speicheradresse 1234h werden in AL geladen

5. Indirekte Adressierung (Indirect Addressing):
    - Die Adresse des Operanden befindet sich in einem Register oder in einem anderen Speicherbereich.
    - Beispiel: mov al, [bx] — Das Register BX enthält die Speicheradresse, aus der Daten in AL geladen werden.

> **Pointer**:
> - Ein Pointer ist eine Variable, die die Adresse eines anderen Objekts im Speicher enthält.

## Operanden Addressierung

Welche Möglichkeiten, Operanden zu adressieren, bietet der 8086?

- direkte Adressierung
- indirekte Adressierung

???