create table ksiazki
(ksiazka_id  serial,	 
tytul varchar(32) not null,
nazwisko_autor varchar(32) not null,
rok_wydania int not null,
CONSTRAINT ksiazki_pk PRIMARY KEY(ksiazka_id)
);

insert into ksiazki(tytul, nazwisko_autor, rok_wydania) values ( 'aaaa', 'Adam Malysz', 2002);
insert into ksiazki(tytul, nazwisko_autor, rok_wydania) values ( 'bbb', 'Wojciech Cejerowski', 2003);
insert into ksiazki(tytul, nazwisko_autor, rok_wydania) values ( 'ccc', 'Jan Kowalski', 2004);
insert into ksiazki(tytul, nazwisko_autor, rok_wydania) values ( 'ddd', 'Jan Nowak', 1997);
insert into ksiazki(tytul, nazwisko_autor, rok_wydania) values ( 'eeee', 'Adam Malysz', 2005);
insert into ksiazki(tytul, nazwisko_autor, rok_wydania) values ('ffff', 'Wojciech Cejerowski', 2006);
insert into ksiazki(tytul, nazwisko_autor, rok_wydania) values ( 'ggggg', 'Jan Kowalski', 1998);
insert into ksiazki(tytul, nazwisko_autor, rok_wydania) values ( 'hhhh', 'Jan Nowak', 1990);
insert into ksiazki(tytul, nazwisko_autor, rok_wydania) values ( 'iiiiiii', 'Adam Malysz', 1999);
insert into ksiazki(tytul, nazwisko_autor, rok_wydania) values ('jjjj', 'Wojciech Cejerowski', 2000);
insert into ksiazki(tytul, nazwisko_autor, rok_wydania) values ( 'kkkkkk', 'Jan Kowalski', 1890);
insert into ksiazki(tytul, nazwisko_autor, rok_wydania) values ( 'llll', 'Jan Nowak', 2001);
insert into ksiazki(tytul, nazwisko_autor, rok_wydania) values ( 'mmmmmmm', 'Jan Nowak', 2007);
insert into ksiazki(tytul, nazwisko_autor, rok_wydania) values ('nnnnn', 'Jan Nowak', 2008);
insert into ksiazki(tytul, nazwisko_autor, rok_wydania) values ( 'ooooo', 'Jan Nowak', 1995);


create table czytelnik
(
    czytelnik_id serial,
    imie varchar(32) not null,
    nazwisko varchar(32) not null,
    CONSTRAINT czytelnik_pk PRIMARY KEY(czytelnik_id)
);

insert into czytelnik(imie, nazwisko) values ('Jan', 'Wokulski');
insert into czytelnik(imie, nazwisko) values ('Adam', 'Zabierz');
insert into czytelnik(imie, nazwisko) values ('Bartosz', 'Walczak');
insert into czytelnik(imie, nazwisko) values ('Milena', 'Starowlenska');
insert into czytelnik(imie, nazwisko) values ('Agata', 'Walczakik');
insert into czytelnik(imie, nazwisko) values ('Maciej', 'Wojcik');
insert into czytelnik(imie, nazwisko) values ('Julia', 'Arama');
insert into czytelnik(imie, nazwisko) values ('Maciej', 'Zlodziej');
insert into czytelnik(imie, nazwisko) values ('Jan', 'Zebrzenski');

create table wypozyczenie
(
    wypozyczenie_id serial,
    czytelnik_id int not null,
    data_wypozyczenia date not null,
    data_zwrotu date,
    CONSTRAINT wypozyczenie_pk PRIMARY KEY(wypozyczenie_id),
    CONSTRAINT wypozyczenie_czytelnik_fk FOREIGN KEY(czytelnik_id) REFERENCES czytelnik(czytelnik_id)
);

insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (1, '2019-01-01', '2019-01-10');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (1, '2019-01-04', '2019-01-10');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (5, '2019-01-03', '2019-01-12');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (3, '2019-01-04', '2019-01-9');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (4, '2019-01-05', '2019-01-14');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (5, '2019-01-07', '2019-01-20');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (6, '2019-01-07', '2019-01-18');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (7, '2019-01-08', '2019-01-17');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (8, '2019-01-09', null);
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (9, '2019-01-10', null);
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (1, '2019-01-10', '2019-01-20');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (9, '2019-01-11', '2019-02-01');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (3, '2019-01-20', '2019-02-03');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (1, '2019-01-19', '2019-02-04');


create table wc
(
    wypozyczenie_id int not null,
    ksiazka_id int not null,
    CONSTRAINT wc_pk PRIMARY KEY(wypozyczenie_id, ksiazka_id),
    CONSTRAINT wc_wypozyczenie_fk FOREIGN KEY(wypozyczenie_id) REFERENCES wypozyczenie(wypozyczenie_id),
    CONSTRAINT wc_ksiazka_fk FOREIGN KEY(ksiazka_id) REFERENCES ksiazki(ksiazka_id)
);

insert into wc(wypozyczenie_id, ksiazka_id) values (1, 1);
insert into wc(wypozyczenie_id, ksiazka_id) values (2, 3);
insert into wc(wypozyczenie_id, ksiazka_id) values (3, 2);
insert into wc(wypozyczenie_id, ksiazka_id) values (3, 6);
insert into wc(wypozyczenie_id, ksiazka_id) values (4, 4);
insert into wc(wypozyczenie_id, ksiazka_id) values (5, 5);
insert into wc(wypozyczenie_id, ksiazka_id) values (6, 6);
insert into wc(wypozyczenie_id, ksiazka_id) values (7, 9);
insert into wc(wypozyczenie_id, ksiazka_id) values (8, 10);
insert into wc(wypozyczenie_id, ksiazka_id) values (9, 12);
insert into wc(wypozyczenie_id, ksiazka_id) values (10, 13);
insert into wc(wypozyczenie_id, ksiazka_id) values (11, 6);
insert into wc(wypozyczenie_id, ksiazka_id) values (12, 6);
insert into wc(wypozyczenie_id, ksiazka_id) values (13, 1);
insert into wc(wypozyczenie_id, ksiazka_id) values (14, 7);



create table kara
(
    kara_id serial,
    opoznienie_min int not null,
    opoznienie_max int not null
);

-- w domysle kara zwieksza sie co 7 dni
insert into kara(opoznienie_min, opoznienie_max) values (0, 7);
insert into kara(opoznienie_min, opoznienie_max) values (8, 14);
insert into kara(opoznienie_min, opoznienie_max) values (15, 21);
insert into kara(opoznienie_min, opoznienie_max) values (22, 10000);
 
-- a
SELECT k.tytul, COUNT(wc.wypozyczenie_id) AS ilosc_wypozyczen FROM ksiazki k JOIN wc wc ON k.ksiazka_id = wc.ksiazka_id GROUP BY k.ksiazka_id;
-- b
SELECT c.nazwisko, COUNT(w.wypozyczenie_id) AS ilosc_wypozyczen FROM czytelnik c JOIN wypozyczenie w ON c.czytelnik_id = w.czytelnik_id GROUP BY c.czytelnik_id;
-- c
SELECT AVG(data_zwrotu - data_wypozyczenia) AS sredni_czas_wypozyczenia FROM wypozyczenie WHERE data_zwrotu IS NOT NULL;
-- d
SELECT MAX(ilosc_wypozyczen) - MIN(ilosc_wypozyczen) AS roznica FROM (SELECT c.nazwisko, COUNT(w.wypozyczenie_id) AS ilosc_wypozyczen FROM czytelnik c JOIN wypozyczenie w ON c.czytelnik_id = w.czytelnik_id GROUP BY c.czytelnik_id);
-- e - ?
UPDATE wypozyczenie SET data_zwrotu = COALESCE(data_zwrotu, CURRENT_DATE) WHERE data_zwrotu IS NULL;
SELECT wypozyczenie_id, (data_zwrotu - data_wypozyczenia) AS ilosc_dni, (data_zwrotu - data_wypozyczenia)/7 AS ilosc_przedluzen FROM wypozyczenie WHERE data_zwrotu IS NOT NULL AND (data_zwrotu - data_wypozyczenia) > 7 GROUP BY wypozyczenie_id ORDER BY wypozyczenie_id;
-- f
SELECT k.tytul, COUNT(wc.wypozyczenie_id) AS ilosc_wypozyczen FROM ksiazki k JOIN wc ON k.ksiazka_id = wc.ksiazka_id GROUP BY k.ksiazka_id ORDER BY ilosc_wypozyczen DESC LIMIT 1;
-- g - ?
SELECT c.czytelnik_id, SUM((w.data_zwrotu-w.data_wypozyczenia)/7) AS ilosc_kar_lub_przedluzen FROM czytelnik c JOIN wypozyczenie w ON c.czytelnik_id = w.czytelnik_id WHERE (w.data_zwrotu - w.data_wypozyczenia)>7 GROUP BY c.czytelnik_id ORDER BY c.czytelnik_id;
-- h - ?
SELECT c.czytelnik_id, SUM((w.data_zwrotu-w.data_wypozyczenia)/7) AS ilosc_kar_lub_przedluzen FROM czytelnik c JOIN wypozyczenie w ON c.czytelnik_id = w.czytelnik_id WHERE (w.data_zwrotu - w.data_wypozyczenia)>7 GROUP BY c.czytelnik_id HAVING SUM((w.data_zwrotu-w.data_wypozyczenia)/7)>2 ORDER BY c.czytelnik_id;
-- i
SELECT k.tytul FROM ksiazki k JOIN wc wc1 ON k.ksiazka_id = wc1.ksiazka_id  GROUP BY k.ksiazka_id, k.tytul HAVING COUNT(DISTINCT wc1.wypozyczenie_id) >= 2;
-- j - ?
SELECT k.kara_id, COUNT(w.wypozyczenie_id) AS ilosc_kar FROM kara k JOIN wypozyczenie w ON (w.data_zwrotu - w.data_wypozyczenia) BETWEEN k.opoznienie_min AND k.opoznienie_max GROUP BY k.kara_id ORDER BY k.kara_id;

