create table ksiazki(   
    ksiazka_id  serial,	 
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


create table czytelnik(
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

create table wypozyczenie(
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
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (8, '2019-01-09', null);
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (8, '2019-01-09', null);
insert into wypozyczenie(czytelnik_id, data_wypozyczenia, data_zwrotu) values (9, '2019-01-10', null);


create table wc(
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



create table kara(
    kara_id serial,
    opoznienie_min int not null,
    kwota int not null,
    opoznienie_max int not null
);

insert into kara(opoznienie_min, kwota, opoznienie_max) values (0, 0, 7);
insert into kara(opoznienie_min, kwota, opoznienie_max) values (8, 10, 14);
insert into kara(opoznienie_min, kwota, opoznienie_max) values (15, 20, 21);
insert into kara(opoznienie_min, kwota, opoznienie_max) values (22, 30, 10000);


--a
create table tablica_1(
    ksiazka_id integer,
    czytelnicy integer not null,
    CONSTRAINT tablica_1_pk PRIMARY KEY(ksiazka_id)
);

CREATE OR REPLACE FUNCTION fun_a(integer) RETURNS INTEGER AS
$$
    DECLARE
        id_k ALIAS FOR $1;
        record_count INTEGER := 0;
    BEGIN
        DELETE FROM tablica_1;

        INSERT INTO tablica_1 (ksiazka_id, czytelnicy)
        SELECT k.ksiazka_id, COUNT(DISTINCT w.wypozyczenie_id) AS czytelnicy
        FROM ksiazki k
        JOIN wc ON k.ksiazka_id = wc.ksiazka_id
        JOIN wypozyczenie w ON w.wypozyczenie_id = wc.wypozyczenie_id
        GROUP BY k.ksiazka_id
        HAVING COUNT(DISTINCT w.wypozyczenie_id) > id_k;

        GET DIAGNOSTICS record_count = ROW_COUNT;

        RETURN record_count;
    END;
$$
LANGUAGE plpgsql;

SELECT * FROM fun_a(3);
SELECT * FROM tablica_1;
SELECT * FROM fun_a(2);
SELECT * FROM tablica_1;
SELECT * FROM fun_a(1);
SELECT * FROM tablica_1;

DROP FUNCTION fun_a (integer);

--b
create table tablica_2(
    czytelnik_id integer,
    ilosc integer,
    dataa date,
    wiadomosc text,
    CONSTRAINT nagrody_pk PRIMARY KEY(czytelnik_id)
);

CREATE OR REPLACE FUNCTION fun_b() RETURNS INTEGER AS
$$
    DECLARE
        record_count INTEGER := 0;
    BEGIN
        DELETE FROM tablica_2;
        
        INSERT INTO tablica_2 (czytelnik_id, ilosc, dataa, wiadomosc)
        SELECT w.czytelnik_id, COUNT(*) AS ilosc, CURRENT_DATE AS dataa,
        CASE
            WHEN COUNT(*) = 2 THEN 'Pierwsze ostrzezenie'
            WHEN COUNT(*) > 2 THEN 'Zakaz pozyczania'
        END AS wiadomosc
        FROM wypozyczenie w
        WHERE w.data_zwrotu IS NULL
        GROUP BY w.czytelnik_id
        HAVING COUNT(*) >= 2;
        
        GET DIAGNOSTICS record_count = ROW_COUNT;
        
        RETURN record_count;
    END;
$$
LANGUAGE plpgsql;

SELECT * FROM fun_b();
SELECT * FROM tablica_2;

--c - brak zespolonych
CREATE OR REPLACE FUNCTION fun_c(A numeric, B numeric, C numeric) RETURNS TABLE (x1 numeric, x2 numeric) AS
$$
    DECLARE
        delta numeric;
    BEGIN
        delta := B*B - 4*A*C;
        RAISE INFO 'DELTA = %', delta;
        IF delta > 0 THEN
            RAISE INFO 'Rozwiazanie posiada dwa rzeczywiste pierwiastki';
            x1 := (-B + sqrt(delta)) / (2*A);
            x2 := (-B - sqrt(delta)) / (2*A);
            RAISE INFO 'x1 = %', x1;
            RAISE INFO 'x2 = %', x2;
            RETURN NEXT;
        ELSIF delta = 0 THEN
            RAISE INFO 'Rozwiazanie posiada jeden rzeczywisty pierwiastek';
            x1 := -B / (2*A);
            x2 := NULL;
            RAISE INFO 'x1 = %', x1;
            RETURN NEXT;
        ELSE
            RAISE INFO 'Rozwiazanie nie posiada rzeczywistych pierwiastkow';
            x1 := NULL;
            x2 := NULL;
            RETURN NEXT;
        END IF;
    END;
$$
LANGUAGE plpgsql;

SELECT * FROM fun_c(1, 10, 1);
SELECT * FROM fun_c(10, 5, 1);
SELECT * FROM fun_c(1, -2, 1);

DROP FUNCTION fun_c(A numeric, B numeric, C numeric);
