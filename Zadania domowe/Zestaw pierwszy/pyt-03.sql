SET client_encoding='utf-8';
-- obliczenia na podstawie atrybutów, nazwy dla wyświetlanych atrybutów:
-- wyświetl dane o zysku dla towarów
SELECT *,cena-koszt AS zysk FROM towar
;
SELECT *,cena-koszt AS zysk FROM towar ORDER BY zysk DESC
;

-- zad P3: wyświetl dane o procentowym zysku w stosunku do kosztów 
-- wyświetl dane o czasie realizacji zamówień (różnica dat złożenia i wysyłki
-- zamówienia).

