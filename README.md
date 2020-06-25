# Książka telefoniczna

Aplikacja webowa *Książka telefoniczna* pomaga zarządzać podstawowymi danymi kontaktowymi. Zapisuje datę utworzenia oraz modyfikacji wpisu, aby umożliwić określenie, czy dane są aktualne. Dane nie mieszczące się na jednej stronie są dzielone na stony. Wyszukiwanie obsługuje znak * (zastępuje dowolne ciąg znaków). Dane są zapisane w bezpoiecznej bazie SQL.

![Demo](Img/phonebook.gif)

## Geneza

Aplikacja powstała jako jeden z projektów wykonywanych za zakończenie modułu w szkole programistycznej. Dla mnie to też powtórka i ćwiczenia nowo poznanego MVC.

## Co jest w środku

- CRUD
- partial views
- wyszukiwanie
- podłączony prosty bootstrap
- paginacja własnego pomysłu
- walidacja wprowadzanych danych po stronie serwera i od frontu

### Technologia/języki

- ASP .NET Core MVC aplikacja webowa
- LinQ
- MSSQL Express
- HTML
- CSS

## Uruchomienie demo

Aplikacja wymaga serwera SQL. Aby uruchomić aplikację, wykonaj kroki:

- Sklonuj projekt na komputrer lokalny
- Utwórz bazę danych
  - Otwórz dołączony do projektu plik DbSchema.sql w edytorze Management Studio i wykonaj skrypt. Zostanie utworzona baza z przykładowymi danymi. Czasem skrypt przy pierwszym uruchomieniu daje komunikat o rollbacku. Dla pewności można skrypt uruchomić ponownie
  - Alternatywnie załączam także plik `Phonebook.bak` wykonany w wersji SSMS 18.4
- Skompiluj i uruchom projekt
