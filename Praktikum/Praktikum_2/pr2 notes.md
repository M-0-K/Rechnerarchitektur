## Was sind Flags? wann und nach welchen Regeln werden sie gesetzt?

| **Flag** | **Bedeutung** | **Wann wird es gesetzt** | **Beispiel** |
|----------|---------------|--------------------------|--------------|
| **CF**   | Carry Flag    | Wenn ein Übertrag von der MSB (Most Significant Bit) in das Carry Flag stattfindet.                        | `255 + 1 = 0, CF = 1`   |
| **ZF**   | Zero Flag                                                                    | Wenn das Ergebnis einer Operation `0` ist.                                                                | `255 + 1 = 0, ZF = 1`   |
| **PF**   | Parity Flag                                                                  | Wenn das Ergebnis einer Operation eine gerade Anzahl an Einsen hat.                                        | `255 + 1 = 0, PF = 1`   |
| **SF**   | Sign Flag                                                                    | Wenn das Ergebnis einer Operation negativ ist (höchstwertiges Bit ist `1`).                                | `255 + 1 = 0, SF = 0`   |


## Wie funktionieren die Befehle `cmp` und `test`?

**cmp** führt eine Subtraktion durch, ohne das Ergebnis zu speichern. Es setzt die Flags (CF, ZF, SF, PF, OF) entsprechend des Ergebnisses.
wird verwendet um zwei Werte zu vergleichen.

**test** führt eine logische AND-Operation durch, ohne das Ergebnis zu speichern. Es setzt die Flags (CF, ZF, SF, PF, OF) entsprechend des Ergebnisses.
wird verwendet um bestimmte Bits zu testen.

## Was sind bedingte Sprünge, und wie funktionieren sie?

Bedingte Sprünge sind Sprünge, die nur ausgeführt werden, wenn eine bestimmte Bedingung erfüllt ist. Die Bedingung wird durch die Flags (CF, ZF, SF, PF, OF) bestimmt.

## Welche eingelesenen Zahlenwerte erfüllen die Sprungbedingung?

```asm
in al, port
test al, 1fh
jz m1                
```

port sollte Werte sodass die unteren 5 Bits 0 sind. Also xxx00000 (x ist egal).

```asm
in ax, 0ah
rol ax, 1
jc m1
```

0a = 00001010, nach dem ROL-Befehl: 00010100. Der Carry-Bit wird gesetzt, also wird der Sprung ausgeführt.

```asm
in al, sensor
cmp al, 64
jnc m1
```

Alle Werte die größer oder gleich 64 sind.