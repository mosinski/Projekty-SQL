-- Zadanie 5;
SELECT cena FROM towar 
   WHERE cena IN (
      SELECT cena FROM towar 
      GROUP BY cena HAVING count (cena) > 1
      )
;
SELECT opis, cena FROM towar 
   WHERE cena IN (
      SELECT cena FROM towar 
      GROUP BY cena HAVING count (cena) > 1
      )
;
SELECT opis, koszt FROM towar 
   WHERE koszt IN (	
      SELECT koszt FROM towar 
      GROUP BY koszt HAVING count (koszt) > 1
      )
;

-- Zadanie 7;
SELECT data_zlozenia FROM zamowienie 
  WHERE nr NOT IN (
    SELECT zamowienie_nr
      FROM zamowienie INNER JOIN pozycja ON zamowienie_nr=zamowienie.nr
    )
      ORDER BY data_zlozenia
;

SELECT nr, opis FROM towar
  WHERE nr NOT IN (
    SELECT towar_nr
      FROM zamowienie INNER JOIN pozycja ON zamowienie_nr=zamowienie.nr
    )
      ORDER BY nr
;

SELECT nr, opis FROM towar
  WHERE nr NOT IN (
    SELECT towar_nr
      FROM towar INNER JOIN kod_kreskowy ON towar_nr=towar.nr
)
      ORDER BY nr
;

-- Zadanie 8;
SELECT imie, nazwisko FROM klient
   WHERE EXISTS (
   SELECT *
     FROM zamowienie INNER JOIN pozycja 
     ON  klient.nr=zamowienie.klient_nr
     AND pozycja.zamowienie_nr=zamowienie.nr 
)
;

SELECT imie, nazwisko FROM klient
   WHERE NOT EXISTS (
   SELECT *
     FROM zamowienie INNER JOIN pozycja 
     ON  klient.nr=zamowienie.klient_nr
     AND pozycja.zamowienie_nr=zamowienie.nr 
)
;

-- Zadanie 9;
SELECT imie, nazwisko, opis, SUM(ilosc),
       SUM(ilosc * (cena - koszt)) AS zysk
   FROM  (( klient 
             INNER JOIN zamowienie 
                ON klient.nr = zamowienie.klient_nr
          ) INNER JOIN pozycja
              ON zamowienie.nr = pozycja.zamowienie_nr
         ) INNER JOIN towar 
           ON pozycja.towar_nr = towar.nr
group by imie, nazwisko, opis order by opis
;

SELECT imie, nazwisko, opis, SUM(ilosc),
       SUM(ilosc * (cena - koszt)) AS zysk
   FROM  (( klient 
             INNER JOIN zamowienie 
                ON klient.nr = zamowienie.klient_nr
          ) INNER JOIN pozycja
              ON zamowienie.nr = pozycja.zamowienie_nr
         ) INNER JOIN towar 
           ON pozycja.towar_nr = towar.nr 
           where cena is not null
group by imie, nazwisko, opis order by opis
;

SELECT imie, nazwisko, opis, ilosc,
       ilosc * (cena - koszt) AS zysk
   FROM  (( klient 
             INNER JOIN zamowienie 
                ON klient.nr = zamowienie.klient_nr
          ) INNER JOIN pozycja
              ON zamowienie.nr = pozycja.zamowienie_nr
         ) INNER JOIN towar 
           ON pozycja.towar_nr = towar.nr where koszt is not null
order by opis
;

-- Zadanie 10;
SELECT k.imie, k.nazwisko, z.klient_nr, 
MIN(data_wysylki - data_zlozenia) as minimalny_czas_oczekiwania,    
AVG(data_wysylki - data_zlozenia) as sredni_czas_oczekiwania,
MAX(data_wysylki - data_zlozenia) as maksymalny_czas_oczekiwania 
     FROM zamowienie z, klient k 
       WHERE z.klient_nr = k.nr 
       AND z.data_wysylki is not null 
       GROUP BY z.klient_nr, k.imie, k.nazwisko
; 

-- Zadanie 11;
SELECT z.klient_nr, k.imie, k.nazwisko, COUNT(z.nr) as ile_zamowien, 
AVG(z.data_wysylki-z.data_zlozenia) as sredni_czas 
    FROM pozycja p, towar t, zamowienie z, klient k 
       WHERE p.zamowienie_nr = z.nr 
       AND p.towar_nr = t.nr 
       AND z.klient_nr = k.nr 
       AND t.opis LIKE '%chusteczki%' 
       GROUP BY z.klient_nr, k.imie, k.nazwisko
; 

-- Zadanie 12;
SELECT imie, nazwisko, count(DISTINCT(towar_nr)) AS towarow, 
       sum(ilosc * cena) AS suma, 
       sum(ilosc * (cena - koszt)) AS zysk 
FROM (  (  ( klient 
             INNER JOIN zamowienie 
                ON klient.nr = zamowienie.klient_nr 
           ) 
           INNER JOIN pozycja 
              ON zamowienie.nr = pozycja.zamowienie_nr 
        ) 
        INNER JOIN towar 
           ON pozycja.towar_nr = towar.nr 
     ) 
GROUP BY klient.nr, imie, nazwisko 
ORDER BY nazwisko 
; 

-- Zadanie 13;
SELECT k1.imie AS imie1, k1.nazwisko AS nazwisko1, k1.miasto as miasto1, k2.imie AS imie2, k2.nazwisko AS nazwisko2, k2.miasto as miasto2 
      FROM klient k1, klient k2 
         WHERE k1.miasto=k2.miasto 
         AND k1.nr<k2.nr
; 

SELECT t1.opis as opis1, t2.opis as opis2, t1.koszt as koszt, t2.cena as cena 
      FROM towar t1, towar t2 
         WHERE t1.cena=t2.cena      
         AND t1.nr<t2.nr; 

SELECT t1.opis as opis1, t2.opis as opis2, t1.koszt as koszt, t2.cena as cena 
      FROM towar t1, towar t2 
         WHERE t1.koszt=t2.koszt  
         AND t1.nr<t2.nr; 

SELECT t1.opis as opis1, t2.opis as opis2, t1.koszt as koszt, t2.cena as cena 
      FROM towar t1, towar t2 
         WHERE t1.cena=t2.cena AND t1.koszt = t2.koszt 
         AND t1.nr<t2.nr;

-- Zadanie 14; 
UPDATE towar SET opis = opis||'; brak kodu'
  WHERE nr NOT IN (
    SELECT towar_nr
      FROM towar INNER JOIN kod_kreskowy ON towar_nr=towar.nr
)
;

UPDATE towar SET opis = opis||'; KOD'
  WHERE nr IN (
    SELECT towar_nr
      FROM kod_kreskowy ON towar_nr= is not null
)
;

UPDATE towar SET cena =( Select AVG(cena) from towar)
  WHERE cena IS NOT NULL
;

-- Zadanie 15;
DELETE FROM klient
  WHERE miasto LIKE 'Sopot'
;

DELETE FROM klient
  WHERE telefon IS NULL
;

DELETE FROM kod_kreskowy
  WHERE towar_nr IS NULL
;

DELETE FROM klient 
  WHERE nr NOT IN (
    SELECT klient_nr
      FROM zamowienie INNER JOIN pozycja ON zamowienie_nr=zamowienie.nr
    )
;

DELETE FROM zamowienie 
  WHERE nr NOT IN (
    SELECT zamowienie_nr
      FROM zamowienie INNER JOIN pozycja ON zamowienie_nr=zamowienie.nr
    )
;

DELETE FROM towar
  WHERE nr NOT IN (
    SELECT towar_nr
      FROM towar INNER JOIN kod_kreskowy ON towar_nr=towar.nr
)
;

-- Zadanie 16;
INSERT INTO kod_kreskowy(kod, towar_nr) 
VALUES('1234567891011', 8); 

INSERT INTO kod_kreskowy(kod, towar_nr) 
VALUES('1213141516171', NULL); 

INSERT INTO kod_kreskowy(kod, towar_nr) 
VALUES('1819202122232', NULL); 

INSERT INTO klient(tytul, nazwisko, imie, kod_pocztowy, miasto, ulica_dom, telefon) 
VALUES('Pan','O\'Hara','Jahim','81-123','Gdynia','Bema 45a/1','058 1234567');

INSERT INTO zamowienie(klient_nr, data_zlozenia, data_wysylki, koszt_wysylki) 
VALUES(5,'2009-02-27',NULL, 7.49);
