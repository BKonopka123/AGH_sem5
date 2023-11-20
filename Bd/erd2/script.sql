--Tworzenie schematu i tabel

CREATE SCHEMA Drzewo_Genealogiczne;

--Tabela Osoba, opisuje informacje o poszczególnych osobach - tworzy pojedeyńcze elementy Osoba
CREATE TABLE Drzewo_Genealogiczne.Osoba(
                osoba_id SERIAL,
                imie VARCHAR NOT NULL,
                nazwisko VARCHAR NOT NULL,
                data_urodzenia DATE NOT NULL,
                miejsce_urodzenia VARCHAR NOT NULL,
                data_zgonu DATE DEFAULT NULL,
                CONSTRAINT Osoba_pk PRIMARY KEY (osoba_id)
);

--Tabela Komórka Rodziny odpowiada za złączenie elementów osoby w poczególne grupy drzewa genealogicznego. Komórka
--składa się z dwóch pokoleń osób - dzieci i rodziców (może skłądać się tylko z rodziców gdy para nie ma dzieci).
--Do takiej komórki zapisywane są za pomocą tablicy asocjacyjnej Pokrewieństwo osoby i nadawany im jest typ pokrewieństwa -
--czy w poszczególnej komórce są rodzicem czy dzieckiem. Całe dzrewo genealogiczne składa się z wielu takich komórek.
--Jedna osoba może należeć do wielu komórek - w jednej może być dzieckiem, a w kolejnej rodzicem. W ten sposób buduję
--się hierarchia drzewa genealogicznego. Tabela ta ma relację N:M z tabelą osoba, więc powstała tabela asocjacyjna Pokrewieństwo,
--łącząca te dwie tabele
CREATE TABLE Drzewo_Genealogiczne.Komorka_rodziny(
                komorka_rodziny_id SERIAL,
                nazwisko_komorki VARCHAR NOT NULL,
                CONSTRAINT Komorka_rodziny_pk PRIMARY KEY (komorka_rodziny_id)
);

--Tabela Pokrewieństwo łącząca tabelę Osoba, oraz komórka rodziny. W tabeli tej również określony jest typ pokrewieństwa (rodzic lub dziecko),
--dla akżdej osoby w danej komórce rodziny
CREATE TABLE Drzewo_Genealogiczne.Pokrewienstwo(
                pokrewienstwo_id SERIAL,
                osoba_id INTEGER NOT NULL,
                komorka_rodziny_id INTEGER NOT NULL,
                typ_pokrewienstwa VARCHAR DEFAULT 'rodzic' NOT NULL,
                CONSTRAINT Pokrewienstwo_pk PRIMARY KEY (pokrewienstwo_id)
);

--Tabela Małżeństwo określa zawarcie małżeństwa między Osobami. Z relacji tabeli wynika że
--każda osoba może być w wielu małżeństwach, jednak zakładamy że w aktualnym momencie,
--może być tylko w jednym małżeństwie. Tabela ta jest niezależna od komórki rodziny, w ten sposób pary bez małżeństwa
--mogą posiadać dzieci.
CREATE TABLE Drzewo_Genealogiczne.Malzenstwo(
                malzenstwo_id SERIAL,
                osoba_1_id INTEGER NOT NULL,
                osoba_2_id INTEGER NOT NULL,
                data_zawarcia DATE NOT NULL,
                liczba_potomstwa INTEGER DEFAULT NULL,
                CONSTRAINT Malzenstwo_pk PRIMARY KEY (malzenstwo_id)
);

ALTER TABLE Drzewo_Genealogiczne.Malzenstwo ADD CONSTRAINT Osoba_Malzenstwo_fk1
FOREIGN KEY (osoba_2_id)
REFERENCES Drzewo_Genealogiczne.Osoba(osoba_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Drzewo_Genealogiczne.Malzenstwo ADD CONSTRAINT Osoba_Malzenstwo_fk2
FOREIGN KEY (osoba_1_id)
REFERENCES Drzewo_Genealogiczne.Osoba(osoba_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Drzewo_Genealogiczne.Pokrewienstwo ADD CONSTRAINT Komorka_rodziny_Pokrewienstwo_fk
FOREIGN KEY (komorka_rodziny_id)
REFERENCES Drzewo_Genealogiczne.Komorka_rodziny(komorka_rodziny_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Drzewo_Genealogiczne.Pokrewienstwo ADD CONSTRAINT Osoba_Pokrewienstwo_fk
FOREIGN KEY (osoba_id)
REFERENCES Drzewo_Genealogiczne.Osoba(osoba_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


--Wypelnienie tabel

INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu) VALUES ('Piotr', 'Kowalski', '1923-10-9','Kraków', '2002-11-3');
INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu) VALUES ('Anna', 'Kowalska', '1932-03-12','Kraków', '2000-04-15');
INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu) VALUES ('Marta', 'Kowalska', '1952-06-24','Kraków', '2010-05-26');
INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia) VALUES ('Michał', 'Kowalski', '1964-07-23','Kraków');
INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia) VALUES ('Łukasz', 'Kowalski', '1959-08-12','Kraków');
INSERT INTO Drzewo_Genealogiczne.Komorka_rodziny(nazwisko_komorki) VALUES ('Kowalski');
INSERT INTO Drzewo_Genealogiczne.Malzenstwo(osoba_1_id, osoba_2_id, data_zawarcia, liczba_potomstwa) VALUES (1, 2, '1958-01-01', 3);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (1, 1);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (2, 1);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id, typ_pokrewienstwa) VALUES (3, 1, 'dziecko');
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id, typ_pokrewienstwa) VALUES (4, 1, 'dziecko');
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id, typ_pokrewienstwa) VALUES (5, 1, 'dziecko');

INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu) VALUES ('Tomasz', 'Adamczyk', '1935-01-09', 'Warszawa', '2015-03-09');
INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia) VALUES ('Katarzyna', 'Adamczyk', '1939-03-20', 'Poznań');
INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia) VALUES ('Agnieszka', 'Adamczyk', '1960-04-19', 'Warszawa');
INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu) VALUES ('Robert', 'Adamczyk', '1961-05-27', 'Warszawa', '2020-02-25');
INSERT INTO Drzewo_Genealogiczne.Komorka_rodziny(nazwisko_komorki) VALUES ('Adamczyk');
INSERT INTO Drzewo_Genealogiczne.Malzenstwo(osoba_1_id, osoba_2_id, data_zawarcia, liczba_potomstwa) VALUES (6, 7, '1959-02-01', 2);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (6, 2);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (7, 2);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id, typ_pokrewienstwa) VALUES (8, 2, 'dziecko');
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id, typ_pokrewienstwa) VALUES (9, 2, 'dziecko');

INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu) VALUES ('Krzysztof', 'Nowicki', '1925-11-08','Kraków', '1992-06-15');
INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu) VALUES ('Dorota', 'Nowicka', '1929-05-15','Kraków', '1997-07-19');
INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia) VALUES ('Aleksandra', 'Nowicka', '1964-08-13','Kraków');
INSERT INTO Drzewo_Genealogiczne.Komorka_rodziny(nazwisko_komorki) VALUES ('Nowicki');
INSERT INTO Drzewo_Genealogiczne.Malzenstwo(osoba_1_id, osoba_2_id, data_zawarcia, liczba_potomstwa) VALUES (10, 11, '1950-09-11', 1);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (10, 3);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (11, 3);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id, typ_pokrewienstwa) VALUES (12, 3, 'dziecko');

INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia) VALUES ('Marcin', 'Olszewski', '1962-11-25','Kraków');
INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia) VALUES ('Ewa', 'Olszewska', '1961-08-19','Kraków');
INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia) VALUES ('Adrian', 'Olszewski', '1993-11-19','Kraków');
INSERT INTO Drzewo_Genealogiczne.Komorka_rodziny(nazwisko_komorki) VALUES ('Olszewski');
INSERT INTO Drzewo_Genealogiczne.Malzenstwo(osoba_1_id, osoba_2_id, data_zawarcia, liczba_potomstwa) VALUES (13, 14, '1987-11-05', 1);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (13, 4);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (14, 4);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id, typ_pokrewienstwa) VALUES (15, 4, 'dziecko');

INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia) VALUES ('Aleksandra', 'Kowalska', '1990-09-28','Warszawa');
INSERT INTO Drzewo_Genealogiczne.Komorka_rodziny(nazwisko_komorki) VALUES ('Kowalski');
INSERT INTO Drzewo_Genealogiczne.Malzenstwo(osoba_1_id, osoba_2_id, data_zawarcia, liczba_potomstwa) VALUES (5, 8, '1988-04-15', 1);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (5, 5);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (8, 5);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id, typ_pokrewienstwa) VALUES (16, 5, 'dziecko');

INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia) VALUES ('Grzegorz', 'Adamczyk', '1989-01-11','Warszawa');
INSERT INTO Drzewo_Genealogiczne.Komorka_rodziny(nazwisko_komorki) VALUES ('Adamczyk');
INSERT INTO Drzewo_Genealogiczne.Malzenstwo(osoba_1_id, osoba_2_id, data_zawarcia, liczba_potomstwa) VALUES (9, 12, '1988-06-12', 1);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (9, 6);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (12, 6);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id, typ_pokrewienstwa) VALUES (17, 6, 'dziecko');

INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia) VALUES ('Rafał', 'Wójcik', '1968-05-29','Gdynia');
INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia) VALUES ('Magdalena', 'Wójcik', '1970-10-13','Gdańsk');
INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia) VALUES ('Andrzej ', 'Wójcik', '1993-12-03','Warszawa');
INSERT INTO Drzewo_Genealogiczne.Komorka_rodziny(nazwisko_komorki) VALUES ('Wójcik');
INSERT INTO Drzewo_Genealogiczne.Malzenstwo(osoba_1_id, osoba_2_id, data_zawarcia, liczba_potomstwa) VALUES (18, 19, '1988-06-12', 1);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (18, 7);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (19, 7);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id, typ_pokrewienstwa) VALUES (20, 7, 'dziecko');

INSERT INTO Drzewo_Genealogiczne.Osoba(imie, nazwisko, data_urodzenia, miejsce_urodzenia) VALUES ('Jakub', 'Olszewski', '2016-07-03','Kraków');
INSERT INTO Drzewo_Genealogiczne.Komorka_rodziny(nazwisko_komorki) VALUES ('Olszewski-Kowalska');
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (15, 8);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (16, 8);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id, typ_pokrewienstwa) VALUES (21, 8, 'dziecko');

INSERT INTO Drzewo_Genealogiczne.Komorka_rodziny(nazwisko_komorki) VALUES ('Adamczyk-Wójcik');
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (17, 9);
INSERT INTO Drzewo_Genealogiczne.Pokrewienstwo(osoba_id, komorka_rodziny_id) VALUES (20, 9);

--Zapytania SELECT

--a - nalezy zmienic id osoby
SELECT o.* FROM Drzewo_Genealogiczne.Osoba o WHERE o.osoba_id = 1;

--b - nalezy zmienic id osoby
SELECT o.* 
FROM Drzewo_Genealogiczne.Osoba o 
JOIN Drzewo_Genealogiczne.Pokrewienstwo p USING(osoba_id)
JOIN Drzewo_Genealogiczne.Komorka_rodziny k USING(komorka_rodziny_id)
WHERE k.komorka_rodziny_id IN(
    SELECT k.komorka_rodziny_id 
    FROM Drzewo_Genealogiczne.Osoba o 
    JOIN Drzewo_Genealogiczne.Pokrewienstwo p USING(osoba_id)
    JOIN Drzewo_Genealogiczne.Komorka_rodziny k USING(komorka_rodziny_id)
    WHERE o.osoba_id=16 
    AND p.typ_pokrewienstwa='dziecko')
AND p.typ_pokrewienstwa='rodzic';

--c - nalezy zmienic id osoby
SELECT o.imie
FROM Drzewo_Genealogiczne.Osoba o 
JOIN Drzewo_Genealogiczne.Pokrewienstwo p USING(osoba_id)
JOIN Drzewo_Genealogiczne.Komorka_rodziny k USING(komorka_rodziny_id)
WHERE k.komorka_rodziny_id IN(
    SELECT k.komorka_rodziny_id 
    FROM Drzewo_Genealogiczne.Osoba o 
    JOIN Drzewo_Genealogiczne.Pokrewienstwo p USING(osoba_id)
    JOIN Drzewo_Genealogiczne.Komorka_rodziny k USING(komorka_rodziny_id)
    WHERE o.osoba_id=2 
    AND p.typ_pokrewienstwa='rodzic'
)
AND p.typ_pokrewienstwa='dziecko';


--Usuniecie tabel i schematu

DROP TABLE Drzewo_Genealogiczne.Osoba CASCADE;
DROP TABLE Drzewo_Genealogiczne.Komorka_rodziny CASCADE;
DROP TABLE Drzewo_Genealogiczne.Pokrewienstwo CASCADE;
DROP TABLE Drzewo_Genealogiczne.Malzenstwo CASCADE;
DROP SCHEMA Drzewo_Genealogiczne;