# parpass (parsePasswd) #

## Deutsch ##
Das Programm liest die Passwortdatei "/etc/passwd" und zeigt ihren Inhalt gut lesbar an.

Als Aufrufparameter kann ein Account-Name oder ein der Anfang eines Account-Namens angegeben werden. Das Programm sucht unter Missachtung des Unterschieds zwischen Groß- und  Kleinschreibung nach passenden Einträgen in der Passwortdatei.

### Beispielaufrufe ###

- Anzeige der Informationen zum Account "root": `parpass root`
- Mit gleicher Wirkung, da unabhängig von Groß- und Kleinschreibung: `parpass RooT`
- Anzeige der Informationen aus der Passwortdatei zu allen Accounts, die mit einem "L" beginnen: `parpass L`

Der Aufruf `parpass --hilf` zeigt die Hileseite des Programms an.

### Abhängigkeiten ###

Das Skript benutzt das Programm "column".

### Kontakt ###

https://www.facebook.com/BStLinux

## English ##
The script reads the password file "/etc/passwd" and displays the contained information in a human-readable format on the screen.

When called, you can provide the script with an account name or the beginning of an account name. The program searches case-insensitively for matching entries in the password file.

### Examples ###

- Displays the information for the "root" account: `parpass root`
- Same effect, because it's case-insensitive: `parpass RooT`
- Displays the information from the password file for all accounts that start with "L": `parpass L`

`parpass --help` displays the help page of the program.

### Dependencies

The script requires the "column" program.

### Contact ###

https://www.facebook.com/BStLinux

