SET client_encoding='utf-8';
-- wyświetl listy różnych atrybutów z tabel
SELECT imie, nazwisko FROM klient
;
SELECT opis, koszt FROM towar
;
SELECT data_wysylki, koszt_wysylki FROM zamowienie
;

-- polecenie \d klient wyświetla dane o tablicy klientów, m.in.
-- nazwy atrybutów, może to być pożyteczne;
-- zad P2: wyświetl nazwiska i pełne adresy klientów;
-- wyświetl numery i daty zamówień, zastosuj jakieś uporządkowanie.

