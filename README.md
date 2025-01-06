# Rechnerarchitektur
 
## Empfohlene Extensions:
- mathematic.vscode-pdf
- yzhang.markdown-all-in-one

## Emulator in Windows mit WSL und VS Code
### Vorbereitung
```bash
#wsl installieren
wsl --install

# Rechner neu starten
# Ubuntu starten (Shell öffnet sich)
sudo apt update && sudo apt upgrade
sudo apt install nasm
# ggf muss noch diese lib installiert werden
sudo apt install libgtk2.0-0
```
### WSL Task in VS Code hinzufügen (`.vscode/tasks.json`)
```json
{
    "version": "1.8.7",
    "tasks": [
        {
            "label": "Run WSL Assembly",
            "type": "shell",
            "command": "bash",
            "args": [
                "-c",
                "nasm ${file} -o ${fileDirname}/${fileBasenameNoExtension}.com -l ${fileDirname}/${fileBasenameNoExtension}.lst"
            ], 
            "group": {
                "kind": "build",
                "isDefault": true
            }
        },

        {
            "label": "Run WSL Emulator",
            "type": "shell",
            "command": "bash",
            "args": [
                "-c",
                "./bin/i8086gui ${fileDirname}/${fileBasenameNoExtension}.com"
            ], 
            "group": {
                "kind": "build",
                "isDefault": true
            }
        },


        {
            "label": "Run All WSL Tasks",
            "dependsOn": [
                "Run WSL Assembly",
                "Run WSL Emulator"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "problemMatcher": [],
            "detail": "Führt alle Aufgaben der Kette aus."
        }
    ]
}
```
### Projekt öffnen
- In VS-Code unten links das blaue Symbol ("Open a Remote Window") anklicken und `Connect to WSL` auswählen.
- dann über die Suchzeile den Projektpfad öffnen: `/mnt/c/Users/[hier Pfad einfügen]`
- wenn unten Links neben dem blauen Symbol immer noch `"WSL: Ubuntu"` steht, sollte die .asm File dann mit `ctrl + shift + b` kompiliert und mit dem Emulator gestartet werden können.
