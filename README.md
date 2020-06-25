# Książak telefoniczna

Aplikacja ma obsługiwać aptekę w części magazynowej oraz rejestracji zamówień i recept.

![Demonstracja menu dostawców](Img/suppliers.gif)

## Geneza

Aplikacja powstała jako jeden z projektów wykonywanych za zakończenie modułu w szkole programistycznej. Ma na celu pokazanie opanowania materiału :).

- leki,
- dostawcy leków,
- recepty,
- zamówienia,
- szczegóły zamówień (pozycje zamówienia).

Co jest w środku:

- CRUD
- Partial Views,
- podłączony prosty bootstrap,
- paginacja własnego pomysłu,
- walidacja wprowadzanych danych po stronie serwera i od frontu,
- 

Aplikacja ma poprawnie obsługiwać logikę, w tym możliwe błędy i poprawnie informować użytkownika o zdarzeniach. Na przykład: próba usunięcia leku, na który są zamówienia skończy się niepowodzeniem i odpowiednim komunikatem.

## Technologia

- ASP .NET Core MVC aplikacja webowa.
- MSSQL Express.

## Uruchomienie demo

Aplikacja wymaga serwera SQL. Aby uruchomić aplikację, wykonaj kroki:

- Sklonuj projekt na komputrer lokalny.
- Utwórz bazę danych.
  - Otwórz dołączony do projektu plik DbSchema.sql w edytorze Management Studio i wykonaj skrypt. Zostanie utworzona baza z przykładowymi danymi. Czasem skrypt przy pierwszym uruchomieniu daje komunikat o rollbacku. Dla pewności można skrypt uruchomić ponownie.
  - Alternatywnie załączam także plik `Phonebook.bak` wykonany w wersji SSMS 18.4.
- Skompiluj i uruchom solucję.

## To jest część pracy

Dane przykładowe obejmują leki, dostawców i zamówienia.  
Aplikacja obsługuje wydawanie leków z pomniejszewniem stanu magazynowogo.  
Niedługo nastąpi rozszerzenie o obsługę recept, tzn. niektóre leki recepturowe mogą być dodane do zamówienia tylko po wprowadzeniu danych recepty.
