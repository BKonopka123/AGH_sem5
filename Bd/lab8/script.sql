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

CREATE TABLE tablica_1(
    tablica_1_id SERIAL,
    ilosc_czytelnikow INT NOT NULL,
    ksiazka_id INT NOT NULL,
    CONSTRAINT tablica_1_pk PRIMARY KEY(tablica_1_id),
    CONSTRAINT ksiazka_id_fk FOREIGN KEY(ksiazka_id) REFERENCES ksiazki(ksiazka_id)
);

CREATE OR REPLACE FUNCTION update_tablica_1() RETURNS TRIGGER AS 
$$
    BEGIN
        INSERT INTO tablica_1(ilosc_czytelnikow, ksiazka_id)
        SELECT COUNT(DISTINCT w.czytelnik_id), NEW.ksiazka_id
        FROM wc JOIN wypozyczenie w USING (wypozyczenie_id)
        WHERE wc.ksiazka_id = NEW.ksiazka_id
        AND (SELECT COUNT(*) FROM wc WHERE ksiazka_id = NEW.ksiazka_id) > 2;
        RETURN NEW;
    END;
$$ 
LANGUAGE 'plpgsql';

CREATE TRIGGER insert_tablica_1 AFTER INSERT ON wc
FOR EACH ROW EXECUTE PROCEDURE update_tablica_1();

SELECT * FROM tablica_1;
INSERT INTO wc(wypozyczenie_id, ksiazka_id) VALUES (1,10);
SELECT * FROM tablica_1;
INSERT INTO wc(wypozyczenie_id, ksiazka_id) VALUES (1,6);
SELECT * FROM tablica_1;

DROP FUNCTION update_tablica_1() CASCADE;
DROP TABLE tablica_1 CASCADE;
DROP TRIGGER insert_tablica_1 ON wc; 

--b

ALTER TABLE czytelnik ADD COLUMN mnoznik REAL DEFAULT 0 CHECK (mnoznik BETWEEN 0.0 AND 100.0);

CREATE TABLE tmp(
    tmp_id SERIAL,
    a INT
);

CREATE OR REPLACE FUNCTION increase_penalty_multiplier() RETURNS TRIGGER AS 
$$
    BEGIN
        IF NEW.data_zwrotu IS NULL THEN
            RETURN NEW;
        END IF;

        IF NEW.data_zwrotu - OLD.data_zwrotu = 7 THEN
            INSERT INTO tmp(a) VALUES (1);
            IF (SELECT tmp_id FROM tmp ORDER BY tmp_id DESC LIMIT 1) % 2 = 0 THEN
                UPDATE czytelnik
                SET mnoznik = mnoznik +  0.02
                WHERE czytelnik_id = NEW.czytelnik_id;
            END IF;
        END IF;
        RETURN NEW;
    END;
$$ 
LANGUAGE 'plpgsql';

CREATE TRIGGER increase_penalty_trigger BEFORE INSERT OR UPDATE ON wypozyczenie
FOR EACH ROW EXECUTE PROCEDURE increase_penalty_multiplier();

SELECT * FROM czytelnik WHERE czytelnik_id = 1;
UPDATE wypozyczenie SET data_zwrotu = '2019-01-17' WHERE wypozyczenie_id = 1;
SELECT * FROM czytelnik WHERE czytelnik_id = 1;
UPDATE wypozyczenie SET data_zwrotu = '2019-01-24' WHERE wypozyczenie_id = 1;
SELECT * FROM czytelnik WHERE czytelnik_id = 1;

DROP FUNCTION increase_penalty_multiplier() CASCADE;
DROP TABLE tmp CASCADE;
DROP TRIGGER increase_penalty_trigger ON wypozyczenie; 

--c

CREATE OR REPLACE FUNCTION check_reader_deletion() RETURNS TRIGGER AS 
$$
BEGIN
    IF EXISTS (SELECT 1 FROM wypozyczenie WHERE czytelnik_id = OLD.czytelnik_id AND data_zwrotu IS NULL) THEN
        RAISE EXCEPTION 'Cannot delete reader with ongoing rentals';
    ELSE
        DELETE FROM wc WHERE wypozyczenie_id IN (
            SELECT w.wypozyczenie_id 
            FROM wypozyczenie w JOIN czytelnik c USING (czytelnik_id) 
            WHERE c.czytelnik_id = OLD.czytelnik_id);
        DELETE FROM wypozyczenie WHERE czytelnik_id = OLD.czytelnik_id;
    END IF;
    RETURN OLD;
END;
$$ 
LANGUAGE 'plpgsql';

CREATE TRIGGER check_reader_deletion_trigger BEFORE DELETE ON czytelnik
FOR EACH ROW EXECUTE PROCEDURE check_reader_deletion();

DELETE FROM czytelnik WHERE czytelnik_id = 8;
DELETE FROM czytelnik WHERE czytelnik_id = 1;

DROP FUNCTION check_reader_deletion() CASCADE;
DROP TRIGGER check_reader_deletion_trigger ON czytelnik; 