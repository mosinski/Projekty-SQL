SET client_encoding='utf-8';
-- użycie różnych warunków, IS NOT NULL, dopasowanie wzorców tekstowych, warunki dotyczące dat:
-- wyświetl klientów z Sopotu,
SELECT * FROM klient WHERE miasto='Sopot'
;
-- towary z podaną ceną, 
SELECT * FROM towar WHERE cena IS NOT NULL
;
-- dane o donicach, które mają podaną cenę, 
SELECT * FROM towar WHERE opis LIKE '%donica%' AND cena IS NOT NULL
;
-- zamówienia złożone w marcu 2010
SELECT * FROM zamowienie WHERE data_zlozenia BETWEEN '2010/03/01' AND '2010/03/31'
;
-- wyświetl dane o zysku dla towarów, ale tylko wtedy, gdy zysk da się określić
SELECT *,cena-koszt AS zysk FROM towar WHERE cena is NOT NULL
;

-- zad P4: wyświetl w kolejnych zapytaniach:
-- dane klientów spoza Gdańska,
-- klientów bez telefonu,
-- klientów spoza Gdańska i bez telefonu,
-- dane o układankach,
-- zamówienia niezrealizowane (bez daty wysyłki),
-- zrealizowane w kwietniu 2010,
-- wyświetl dane o czasie realizacji zamówień już zrealizowanych

