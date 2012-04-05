-- Zadanie 1;
select * from klient order by miasto;
select * from towar order by opis; 
select * from zamowienie order by koszt_wysylki;
select * from kod_kreskowy order by kod;
-- Zadanie 2;
select nazwisko, kod_pocztowy, miasto, ulica_dom from klient
select nr, data_zlozenia from zamowienie order by nr;
-- Zadanie 3;
select *,((cena-koszt)/koszt)*100 as procent_zysku from towar;
select *, data_wysylki-data_zlozenia as realizacja from zamowienie;
-- Zadanie 4;
select * from klient where miasto <> 'Gdańsk';
select * from klient where telefon is null;
select * from klient where miasto <> 'Gdańsk' and telefon is null;
select * from zamowienie where data_wysylki is null;
select * from zamowienie where data_wysylki between '2010-04-01' AND '2010-04-30';
select *,data_wysylki-data_zlozenia AS czas_realizacji from zamowienie where data_wysylki is not null;
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
-- Zadanie 6;
SELECT distinct imie, nazwisko
   FROM klient INNER JOIN zamowienie
   ON klient.nr=zamowienie.klient_nr
   ORDER BY nazwisko
;



