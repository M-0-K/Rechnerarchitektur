# Praktikum 2: 8086 - Flags und Bedingte Sprünge
## Vorbereitung
### 1.Was sind Flags. Wann und nach welchen Regeln werden CF, ZF, PF und SF beeinflusst?
### 2.Wie funktionieren folgende Befehle prinzipiell: CMP, TEST.
### 3.Was sind bedingte Sprünge, wie funktionieren Sie?
### 4.Welche eingelesenen Zahlenwerte erfüllen die Sprungbedingung?
in  al, port in  ax, 0ah in  al, sensor
test  al,1fh rol  ax,1 cmp  al, 64
jz  m1 jc  m1 jnc  m1
5.Erläutern Sie die Varianten und den Wert von Schalter 0 bei erfüllter Sprungbedingung:
in al,0 in al, 0 in al, 0 in al, 0
and al,1 test al,1 shr al,1 ror al,1
jnz EINS jnz EINS jc EINS jc EINS ; Sprung wenn Schalter 0 =?
Beispiel
Kopieren Sie den Quelltext PR2-flags-jpxx.asm in Ihr Arbeitsverzeichnis ... 
1.Beantworten Sie die Fragen (Kommentare) im Quelltext.
2.Übersetzen und laden Sie anschließend das Programm im SBC86-Emulator.
3.Beobachten Sie im Schrittbetrieb die Ergebnisse der einzelnen Befehle:
oÄnderungen der Flags (Darstellung Rot: Flag=„1“, Schwarz: Flag=„0“)
oAusführung der bedingten Sprünge.
Aufgaben
Schreiben Sie folgende Programme:
1.p31: Alle LEDs sollen nur dann leuchten, wenn der Schalter S0 eingeschaltet ist. 
2.p32: Auf der LED-Reihe soll eine einzelne LED fortlaufend hin und her „wandern“.
3.p33: Alle LEDs sollen sichtbar blinken, wenn der Schalter S0 eingeschaltet ist und der 
Schalter S7 soll zusätzlich die Blinkfrequenz steuern (schnell und langsam):
ofür die Auswertung beider Schalter soll nur einmal eingelesen werden
odas Programm soll unabhängig von der Stellung der anderen Schalter funktionieren
oentwerfen Sie zu Beginn einen Programmablaufplan und setzen diesen um.
4.p34: Auf den Stellen 3 und 4 der 7-Segment-Anzeige soll der Zustand der Schalter S3 und 
S4 (jeweils „0“ oder „I“) angezeigt werden.
5.p35: Mit der LED-Zeile soll das Blinklicht eines Autos (alle Möglichkeiten) nachgestellt 
werden. Vermeiden Sie durch eine entsprechende Planung des Programmablaufs 
Spaghetti-Code!
Schalter 7 S6-S1 Schalter 0 LED 7 - 4 LED 3 - 0
aus g aus aus aus Blinker aus
aus g ein aus blinken rechts abbiegen
ein g aus blinken aus links abbiegen
ein g ein blinken blinken Warnblinklicht
Führen Sie funktionsfähige Programme vor.
Hinweis:
Nehmen Sie an, m1 bzw. 
EINS wurde zuvor im Code 
als Label festgelegt.