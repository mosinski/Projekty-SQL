create table pacjenci
(
    nr                          serial                    ,
    imie                        varchar(16)       NOT NULL,
    nazwisko                    varchar(32)       NOT NULL,
    plec                        varchar(1)        NOT NULL,
    pesel                       char(11)          NOT NULL,
    miasto                      varchar(32)               ,
    ulica_dom                   varchar(64)               ,
    CONSTRAINT                  pacjenci_pk PRIMARY KEY(pesel),
    CONSTRAINT                  pacjenci_pesel_un UNIQUE(pesel)
);
create table lekarze
(
    nr                          serial                    ,
    imie                        varchar(16)       NOT NULL,
    nazwisko                    varchar(32)       NOT NULL,
    specjalizacja               varchar                   ,
    CONSTRAINT                  lekarze_pk PRIMARY KEY(nr)
);
create table pielegniarki
(
    nr                          serial                    ,
    imie                        varchar(16)       NOT NULL,
    nazwisko                    varchar(32)       NOT NULL,
    CONSTRAINT                  pielegniarki_pk PRIMARY KEY(nr)
);
create table gabinety_zabiegowe
(
    nr                          serial                    ,
    numer_gabinetu              char(3)           NOT NULL, 
    nazwa                       varchar(64)       NOT NULL,
    CONSTRAINT                  gabinety_zabiegowe_pk PRIMARY KEY(numer_gabinetu),
    CONSTRAINT                  gabinety_zabiegowe_un UNIQUE(numer_gabinetu)
);
create table operacje
(
    nr                          serial                    ,
    pesel_operowanego           char(11)          NOT NULL,
    rodzaj_operacji             varchar           NOT NULL,
    lekarz_operujący            integer           NOT NULL,
    pieleg_asystujące           integer           NOT NULL,
    data                        date              NOT NULL,
    nr_gabinetu                 char(3)           NOT NULL,
    CONSTRAINT                  operacje_pk PRIMARY KEY(nr)
);
-- drop table pacjenci;
-- drop table lekarze;
-- drop table pielegniarki;
-- drop table gabinety_zabiegowe;
-- drop table operacje;
