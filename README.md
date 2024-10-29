# parpass (parsePasswd)

## Inhalt

* [Deutsche Programmbeschreibung](#deutsch)
* [English program description](#english)

## Deutsch

**`parpass` ist ein Bash-Script, das die Passwortdatei `/etc/passwd` liest und ihren Inhalt für Menschen gut lesbar und übersichtlich anzeigt.**

### Aufruf

Das Programm kann ohne Argumente aufgerufen werden, um alle Datensätze der Passwortdatei anzuzeigen. Alternativ kann ein Account-Name als Parameter angegeben werden, wobei auch der Anfang des Namens ausreicht und Groß- und Kleinschreibung keine Rolle spielen.

Genauer ausgedrückt: parpass zeigt die Datensätze aus der Passwortdatei an, deren Account-Namensfeld einen Wert enthält, der mit der Zeichenkette beginnt, die `parpass` als Parameter übergeben wurde.

Das Skript kann helfen, den Aufbau der Datei `/etc/passwd` besser zu verstehen:

- Mit dem Parameter `-I` kann eine kurze Beschreibung der Felder jeder Zeile in der Datei `/etc/passwd` abgerufen werden.
- Mit dem Parameter `-i` und einem Feldnamen oder einer Feldnummer (1-7) ruft man die Kurzbeschreibung eines einzelnen Datenfelds ab.

#### Beispielaufrufe

- Alle Datensätze aus der Datei `/etc/passwd` im Pager `less` anzeigen: `parpass | less -r`
- Anzeige der Informationen zum Account "root": `parpass root`
- Mit gleicher Wirkung, da unabhängig von Groß- und Kleinschreibung: `parpass RooT`
- Anzeige der Informationen aus der Passwortdatei zu allen Accounts, die mit einem "L" beginnen: `parpass L`
- Anzeige einer kurzen Beschreibung alle Datenfelder, aus der jede Zeile der `/etc/passwd` besteht: `parpass -I
- Anzeige der Kurzbeschreibung des siebten Datenfelds jeder Zeile der '/etc/passwd`: `parpass -i 7`
- Anzeige der Kurzbeschreibung des GECOS-Datenfeldes: `parpass -i gecos`

Der Aufruf `parpass --hilf` zeigt die Hilfeseite des Programms an.

### Abhängigkeiten

Das Skript benutzt das Programm "column", daher empfehle ich, `column` zu installieren!

### Kontakt

Bei Fragen oder Anregungen kann der Kontakt zur [BStLinux-Community](https://www.facebook.com/groups/164934964047448) über deren Facebook-Seite aufgenommen werden.

https://www.facebook.com/groups/164934964047448

---

## Lizenz

Dieses Programm ist freie Software: Sie können es unter den Bedingungen der GNU General Public License, wie von der Free Software Foundation veröffentlicht, weiterverbreiten und/oder modifizieren, entweder gemäß Version 3 der Lizenz oder (nach Ihrer Wahl) jeder späteren Version.

Dieses Programm wird in der Hoffnung verteilt, dass es nützlich sein wird, aber **ohne jede Gewährleistung**; auch ohne die implizite Gewährleistung der Marktgängigkeit oder Eignung für einen bestimmten Zweck. Weitere Einzelheiten finden Sie in der GNU General Public License.

Sie finden die GNU General Public License unter <http://www.gnu.org/licenses/>.


## English

**`parpass` is a Bash script that reads the password file `/etc/passwd` and displays its content in a human-readable and clear format.**

### Usage

The program can be called without arguments to display all records in the password file. Alternatively, an account name can be specified as a parameter, where the beginning of the name is sufficient and case sensitivity does not matter.

In other words, parpass displays the records from the password file whose account name field contains a value that begins with the string passed as a parameter to `parpass`.

The script can help to better understand the structure of the `/etc/passwd` file:

- Using the `-I` parameter, you can retrieve a brief description of the fields of each line in the `/etc/passwd` file.
- Using the `-i` parameter and a field name or field number (1-7), you can retrieve the brief description of an individual data field.


#### Example Calls

- Display all records from the file `/etc/passwd` in the pager `less`: `parpass | less -r`
- Display information for the "root" account: `parpass root`
- Same effect, as it is case-insensitive: `parpass RooT`
- Display information from the password file for all accounts that start with "L": `parpass L`
- Display a brief description of all data fields in each line of the `/etc/passwd` file: `parpass -I`
- Display the brief description of the seventh data field of each line in the `/etc/passwd` file: `parpass -i 7`
- Display the brief description of the GECOS data field: `parpass -i gecos`

The command `parpass --help` displays the program's help page.

### Dependencies

The script uses the "column" program, so I recommend installing `column`!

### Contact

For questions or suggestions, contact the [BStLinux Community](https://www.facebook.com/groups/164934964047448) through their Facebook page.

https://www.facebook.com/groups/164934964047448

---

### License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but **without any warranty**; without even the implied warranty of merchantability or fitness for a particular purpose. See the GNU General Public License for more details.

You will find the GNU General Public License at <http://www.gnu.org/licenses/>.