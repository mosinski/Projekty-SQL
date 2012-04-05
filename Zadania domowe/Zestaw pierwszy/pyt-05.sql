SET client_encoding='utf-8';
-- złączenia:
-- sprawdź numery zamówień klientów
SELECT imie, nazwisko, zamowienie.nr AS zamowienie_nr 
   FROM klient, zamowienie
   WHERE klient.nr=zamowienie.klient_nr
   ORDER BY nazwisko
;
-- zmień dalsze zapytania używając INNER JOIN
SELECT imie, nazwisko, zamowienie.nr AS zamowienie_nr
   FROM klient INNER JOIN zamowienie 
   ON klient.nr=zamowienie.klient_nr
   ORDER BY nazwisko
;
-- sprawdź jacy klienci w ogóle złożyli zamówienia
SELECT imie, nazwisko
   FROM klient, zamowienie
   WHERE klient.nr=zamowienie.klient_nr
   ORDER BY nazwisko
;

-- zad P6: zmień to zapytanie używając INNER JOIN
-- spowoduj, by nie wyświetlały się podwójnie nazwiska.

