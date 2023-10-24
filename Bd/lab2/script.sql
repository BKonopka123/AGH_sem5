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
insert into czytelnik(imie, nazwisko) values ('Agata', 'Walczak');
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
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (2, '2019-01-03', '2019-01-12');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (3, '2019-01-04', '2019-01-9');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (4, '2019-01-05', '2019-01-14');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (5, '2019-01-07', '2019-01-20');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (6, '2019-01-07', '2019-01-18');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (7, '2019-01-08', '2019-01-17');
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (8, '2019-01-09', null);
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (9, '2019-01-10', null);

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



create table kara
(
    kara_id serial,
    opoznienie_min int not null,
    opoznienie_max int not null
);

insert into kara(opoznienie_min, opoznienie_max) values (0, 7);
insert into kara(opoznienie_min, opoznienie_max) values (8, 10);
insert into kara(opoznienie_min, opoznienie_max) values (11, 16);
insert into kara(opoznienie_min, opoznienie_max) values (17, 10000);


SELECT c.nazwisko, w.wypozyczenie_id FROM czytelnik c JOIN wypozyczenie w ON c.czytelnik_id = w.czytelnik_id ORDER BY c.nazwisko;
SELECT k.tytul FROM (ksiazki k JOIN wc wc ON k.ksiazka_id = wc.ksiazka_id) JOIN wypozyczenie w ON w.wypozyczenie_id = wc.wypozyczenie_id WHERE wc.wypozyczenie_id = 3;
SELECT w.wypozyczenie_id, c.nazwisko, ka.kara_id FROM kara ka, czytelnik c JOIN wypozyczenie w ON c.czytelnik_id = w.czytelnik_id WHERE (w.data_zwrotu - w.data_wypozyczenia >= ka.opoznienie_min AND w.data_zwrotu - w.data_wypozyczenia <= ka.opoznienie_max) OR (w.data_zwrotu IS NULL AND cast(now() as date) - w.data_wypozyczenia >= ka.opoznienie_min AND cast(now() as date) - w.data_wypozyczenia <= ka.opoznienie_max);
SELECT w.wypozyczenie_id, w.data_wypozyczenia, w.data_zwrotu, ka.kara_id FROM wypozyczenie w, kara ka WHERE (w.data_zwrotu IS NULL AND cast(now() as date) - w.data_wypozyczenia >= ka.opoznienie_min AND cast(now() as date) - w.data_wypozyczenia <= ka.opoznienie_max);
