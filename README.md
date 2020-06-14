# parpass (parsePasswd) #

## Deutsch ## 
Das Programm liest die Passwortdatei "/etc/passwd" und zeigt ihren Inhalt gut lesbar an.

Als Aufrufparameter kann ein Account-Name oder ein der Anfang eines Account-Namens angegeben werden. Das Programm sucht unter Missachtung des Unterschieds zwischen Groß- und  Kleinschreibung nach passenden Einträgen in der Passwortdatei.

### Beispielaufrufe ###

- Anzeige der Informationen zum Account "root": `parpass root`
- Mit gleicher Wirkung, da case-insensitiv: `parpass RooT`
- Anzeige der Informationen aus der Passwortdatei zu allen Accounts, die mit einem L beginnen: `parpass L`

### Abhängigkeiten ###

Das Skript benutzt das Programm "column".

### Kontakt ###

https://www.facebook.com/BStLinux

## English ## 
The script reads the password file "/etc/passwd" and shows the contained information humand readable at the screen.

At call you can give the script an account name or the beginning of an account name. The program searchs case-insensitiv for matching entries in the password file.

### Examples ###

- Shows the information according to the account "root": `parpass root`
- Same effect, because case-insensitiv: `parpass RooT`
- Displays the information from password file according to all accounts, which do start with a L: `parpass L`

### Dependencies

The Script needs the program "column".

### Contakt ###

https://www.facebook.com/BStLinux

