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
    wc_id serial,
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
insert into wc(wypozyczenie_id, ksiazka_id) values (11, 7);
insert into wc(wypozyczenie_id, ksiazka_id) values (12, 6);
insert into wc(wypozyczenie_id, ksiazka_id) values (13, 1);
insert into wc(wypozyczenie_id, ksiazka_id) values (14, 7);



create table kara
(
    kara_id serial,
    opoznienie_min int not null,
    kwota int not null,
    opoznienie_max int not null
);

insert into kara(opoznienie_min, kwota, opoznienie_max) values (0, 0, 7);
insert into kara(opoznienie_min, kwota, opoznienie_max) values (8, 10, 14);
insert into kara(opoznienie_min, kwota, opoznienie_max) values (15, 20, 21);
insert into kara(opoznienie_min, kwota, opoznienie_max) values (22, 30, 10000);

CREATE TABLE staff ( empno INT, empname VARCHAR(20), mgrno INT ) ;
    
INSERT INTO staff VALUES ( 100, 'Kowalski',    null),
                       ( 101, 'Jasny',      100),
                       ( 102, 'Ciemny',     101),
                       ( 103, 'Szary',     102),
                       ( 104, 'Bury',    101),
                       ( 105, 'Cienki',    104),
                       ( 106, 'Dlugi', 100),
                       ( 107, 'Stary',       106),
                       ( 108, 'Mlody',   106),
                       ( 109, 'Bialy',    107),
                       ( 110, 'Sztuka',      109),
                       ( 111, 'Czarny',       110),
                       ( 112, 'Nowy',     110),
                       ( 113, 'Sredni', 110),
                       ( 114, 'Jeden',      100),
                       ( 115, 'Drugi',    114),
                       ( 116, 'Ostatni',       115),
                       ( 117, 'Lewy',   115)  ; 

--a
SELECT c.czytelnik_id,
SUM(CASE WHEN k.tytul = 'aaaa' THEN 1 ELSE 0 END) AS "aaaa",
SUM(CASE WHEN k.tytul = 'bbb' THEN 1 ELSE 0 END) AS "bbb",
SUM(CASE WHEN k.tytul = 'ccc' THEN 1 ELSE 0 END) AS "ccc",
SUM(CASE WHEN k.tytul = 'ggggg' THEN 1 ELSE 0 END) AS "ggggg"
FROM czytelnik c JOIN wypozyczenie w USING(czytelnik_id) 
JOIN wc USING(wypozyczenie_id)
JOIN ksiazki k USING(ksiazka_id)
GROUP BY c.czytelnik_id
ORDER BY c.czytelnik_id
LIMIT 4;

--b
WITH ilosc_wypozyczen AS(
    SELECT c.nazwisko AS "nazwisko_czytelnika", k.tytul AS "tytul_ksiazki",
    SUM(CASE WHEN (wc.wypozyczenie_id=w.wypozyczenie_id) THEN 1 ELSE 0 END) AS "ilosc_wypozyczen"
    FROM czytelnik c LEFT JOIN wypozyczenie w USING (czytelnik_id),
    ksiazki k LEFT JOIN wc USING(ksiazka_id)
    WHERE c.czytelnik_id<=4 AND k.ksiazka_id<=4
    GROUP BY c.czytelnik_id, k.ksiazka_id
    ORDER BY c.czytelnik_id, k.ksiazka_id
) SELECT * FROM ilosc_wypozyczen;

--c
SELECT e.empno AS "emp_no" , e.empname AS "emp_name", m.empno AS "mgr_no", m.empname AS "mgr_name"
FROM staff e JOIN staff m ON e.mgrno = m.empno;

--d
WITH RECURSIVE hierarchia AS(
    SELECT empno, empname, mgrno, 1 AS lvl, CAST(NULL AS VARCHAR(20)) AS mgr_name
    FROM staff
    WHERE mgrno IS NULL
    UNION ALL
    SELECT s.empno, s.empname, s.mgrno, h.lvl + 1, h.empname AS mgr_name
    FROM staff s JOIN hierarchia h ON s.mgrno=h.empno
) SELECT empname AS "emp_name", mgr_name AS "mgr_name", lvl AS "lvl"
FROM hierarchia;

--e
WITH RECURSIVE hierarchia AS(
    SELECT empno, empname, mgrno, 1 AS lvl, CAST(NULL AS VARCHAR) AS pathh
    FROM staff
    WHERE mgrno IS NULL
    UNION ALL
    SELECT s.empno, s.empname, s.mgrno, h.lvl+1, CONCAT(h.pathh, CONCAT(CAST('->' AS VARCHAR),h.empname)) 
    FROM staff s JOIN hierarchia h ON s.mgrno=h.empno
) SELECT empname AS "emp_name", lvl AS "lvl", pathh AS "path"
FROM hierarchia;