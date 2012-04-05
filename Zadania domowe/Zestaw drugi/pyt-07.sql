SET client_encoding='utf-8';
-- zapytania zagnieżdżone (zagnieżdżenia nieskorelowane)
-- vs. złączenia:

-- sprawdź jacy klienci cokolwiek zamówili
SELECT imie, nazwisko
   FROM klient, zamowienie, pozycja
   WHERE klient.nr=zamowienie.klient_nr AND pozycja.zamowienie_nr=zamowienie.nr
   GROUP BY imie, nazwisko
;
SELECT imie, nazwisko FROM klient 
  WHERE nr IN (
    SELECT klient_nr
      FROM zamowienie INNER JOIN pozycja ON zamowienie_nr=zamowienie.nr
    )
      ORDER BY nazwisko
;
-- znajdź klientów którzy nie zamówili żadnych towarów
SELECT imie, nazwisko FROM klient 
  WHERE nr NOT IN (
    SELECT klient_nr
      FROM zamowienie INNER JOIN pozycja ON zamowienie_nr=zamowienie.nr
    )
      ORDER BY nazwisko
;

-- zad P7: wypisz 
-- daty złożenia zamówień nie mających żadnych pozycji, 
-- opisy towarów niezamawianych, 
-- opisy towarów z nieokreślonym kodem kreskowym
-- (uwaga: to zapytanie może dawać nieoczekiwany wynik, należy zachować
-- ostrożność)

