
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
