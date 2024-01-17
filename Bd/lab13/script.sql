CREATE TABLE IF NOT EXISTS dzial (
    dzial_nr INT PRIMARY KEY,
    nazwa VARCHAR(32) NOT NULL,
    lokal VARCHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS pracownik (
    pracownik_id INT PRIMARY KEY,
    wynagordzenie INT NOT NULL,
    stanowisko VARCHAR(32) NOT NULL,
    nazwisko VARCHAR(32) NOT NULL,
    prowizja INT NOT NULL,
    staz INT NOT NULL,
    manager_id INT ,
    dzial_nr INT NOT NULL REFERENCES dzial(dzial_nr)
);

CREATE TABLE IF NOT EXISTS projekt (
    projekt_id INT PRIMARY KEY,
    nazwa VARCHAR(32) NOT NULL,
    poczatek DATE NOT NULL,
    koniec DATE
);

CREATE TABLE IF NOT EXISTS pracownik_projekt (
    projekt_id INTEGER NOT NULL,
    pracownik_id INTEGER NOT NULL,
    CONSTRAINT spis_pk PRIMARY KEY(projekt_id, pracownik_id),
    CONSTRAINT spis_projektow_projekt_id_fk FOREIGN KEY(projekt_id) REFERENCES projekt(projekt_id),
    CONSTRAINT spis_projektow_pracownik_id_fk FOREIGN KEY(pracownik_id) REFERENCES pracownik(pracownik_id)
);

CREATE TABLE IF NOT EXISTS stopien(
    stopien_id INT PRIMARY KEY,
    min_wynagrodzenie INT NOT NULL,
    max_wynagrodzenie INT NOT NULL
);

INSERT INTO dzial(dzial_nr,nazwa,lokal) VALUES (1,'zarzad', 'Warszawa');
INSERT INTO dzial(dzial_nr,nazwa,lokal) VALUES (2,'dev', 'Krakow');
INSERT INTO dzial(dzial_nr,nazwa,lokal) VALUES (3,'graficy', 'Gdansk');

INSERT INTO pracownik(pracownik_id,wynagordzenie, stanowisko, nazwisko,prowizja,staz, manager_id, dzial_nr) VALUES(1,10000,'szef', 'Takie', 5,20,NULL, 1);
INSERT INTO pracownik(pracownik_id,wynagordzenie, stanowisko, nazwisko,prowizja,staz, manager_id, dzial_nr) VALUES(2,9000,'v_szef', 'Janowski', 2,15,1, 1);
INSERT INTO pracownik(pracownik_id,wynagordzenie, stanowisko, nazwisko,prowizja,staz, manager_id, dzial_nr) VALUES(3,8000,'dev', 'Babowski', 4,10,2, 2);
INSERT INTO pracownik(pracownik_id,wynagordzenie, stanowisko, nazwisko,prowizja,staz, manager_id, dzial_nr) VALUES(4,7000,'dev', 'Sabowski', 4,8,3, 2);
INSERT INTO pracownik(pracownik_id,wynagordzenie, stanowisko, nazwisko,prowizja,staz, manager_id, dzial_nr) VALUES(5,6000,'dev', 'Dabowski', 4,10,3, 2);
INSERT INTO pracownik(pracownik_id,wynagordzenie, stanowisko, nazwisko,prowizja,staz, manager_id, dzial_nr) VALUES(6,8000,'grafik', 'Koziolowicz', 4,20,2, 3);
INSERT INTO pracownik(pracownik_id,wynagordzenie, stanowisko, nazwisko,prowizja,staz, manager_id, dzial_nr) VALUES(7,7000,'grafik', 'Tadziolowicz', 4,10,6, 3);
INSERT INTO pracownik(pracownik_id,wynagordzenie, stanowisko, nazwisko,prowizja,staz, manager_id, dzial_nr) VALUES(8,6000,'grafik', 'Janolowicz', 4,10,6, 3);
INSERT INTO pracownik(pracownik_id,wynagordzenie, stanowisko, nazwisko,prowizja,staz, manager_id, dzial_nr) VALUES(9,6000,'grafik', 'Nijakie', 4,10,6, 3);

INSERT INTO projekt(projekt_id, nazwa,poczatek,koniec) VALUES (7,'projekt_1','2022-02-02', '2022-03-04');
INSERT INTO projekt(projekt_id,nazwa, poczatek,koniec) VALUES (8,'projekt_2','2020-04-05', '2022-01-01');
INSERT INTO projekt(projekt_id,nazwa, poczatek) VALUES (9,'projekt_3','2024-01-08');
INSERT INTO projekt(projekt_id,nazwa, poczatek) VALUES (10,'projekt_4','2023-12-23');

INSERT INTO pracownik_projekt(projekt_id, pracownik_id) VALUES(7,1);
INSERT INTO pracownik_projekt(projekt_id, pracownik_id) VALUES(8,3);
INSERT INTO pracownik_projekt(projekt_id, pracownik_id) VALUES(8,5);
INSERT INTO pracownik_projekt(projekt_id, pracownik_id) VALUES(8,8);
INSERT INTO pracownik_projekt(projekt_id, pracownik_id) VALUES(9,3);
INSERT INTO pracownik_projekt(projekt_id, pracownik_id) VALUES(9,4);
INSERT INTO pracownik_projekt(projekt_id, pracownik_id) VALUES(9,7);
INSERT INTO pracownik_projekt(projekt_id, pracownik_id) VALUES(10,1);
INSERT INTO pracownik_projekt(projekt_id, pracownik_id) VALUES(10,4);
INSERT INTO pracownik_projekt(projekt_id, pracownik_id) VALUES(7,3);
INSERT INTO pracownik_projekt(projekt_id, pracownik_id) VALUES(7,5);
INSERT INTO pracownik_projekt(projekt_id, pracownik_id) VALUES(8,4);
INSERT INTO pracownik_projekt(projekt_id, pracownik_id) VALUES(9,2);
INSERT INTO pracownik_projekt(projekt_id, pracownik_id) VALUES(9,5);
INSERT INTO pracownik_projekt(projekt_id, pracownik_id) VALUES(9,6);

INSERT INTO stopien(stopien_id,min_wynagrodzenie, max_wynagrodzenie) VALUES (1,5999, 7998);
INSERT INTO stopien(stopien_id,min_wynagrodzenie, max_wynagrodzenie) VALUES (2,7999, 8998);
INSERT INTO stopien(stopien_id,min_wynagrodzenie, max_wynagrodzenie) VALUES (3,8999, 10998);

--1
SELECT COUNT(*) AS ilość_osób, s.stopien_id AS stopien_zaszeregowania
FROM pracownik p
JOIN stopien s ON p.wynagordzenie BETWEEN s.min_wynagrodzenie AND s.max_wynagrodzenie
GROUP BY stopien_id;

--2
SELECT p.pracownik_id, p.nazwisko,
    COUNT(CASE WHEN pr.koniec IS NOT NULL THEN 1 END) AS ilość_projektow_ukonczonych,
    COUNT(CASE WHEN pr.koniec IS NULL THEN 1 END) AS ilość_projektow_nieukonczonych
FROM pracownik p
LEFT JOIN pracownik_projekt pp ON p.pracownik_id = pp.pracownik_id
LEFT JOIN projekt pr ON pp.projekt_id = pr.projekt_id
GROUP BY p.pracownik_id, p.nazwisko
ORDER BY p.pracownik_id;

--3 - brak

--4
SELECT p.pracownik_id, p.nazwisko
FROM pracownik p
JOIN pracownik_projekt pp ON p.pracownik_id = pp.pracownik_id
JOIN (
    SELECT projekt_id
    FROM pracownik_projekt
    GROUP BY projekt_id
    HAVING COUNT(DISTINCT pracownik_id) >= 2
) proj ON pp.projekt_id = proj.projekt_id
GROUP BY p.pracownik_id, p.nazwisko
HAVING COUNT(DISTINCT pp.projekt_id) >= 2;

--5 - brak

--6
SELECT p.pracownik_id, p.nazwisko, AVG(pr.koniec - pr.poczatek) AS średnia_ilość_dni
FROM pracownik p
JOIN pracownik_projekt pp ON p.pracownik_id = pp.pracownik_id
JOIN projekt pr ON pp.projekt_id = pr.projekt_id
WHERE pr.koniec IS NOT NULL
GROUP BY p.pracownik_id, p.nazwisko
ORDER BY p.pracownik_id;

--7
SELECT pr.nazwa AS nazwa_projektu, SUM(p.wynagordzenie) AS budzet
FROM projekt pr
JOIN pracownik_projekt pp ON pr.projekt_id = pp.projekt_id
JOIN pracownik p ON pp.pracownik_id = p.pracownik_id
GROUP BY pr.projekt_id, pr.nazwa
ORDER BY budzet DESC;

--8
SELECT COUNT(*) AS count
FROM projekt
WHERE koniec IS NULL AND CURRENT_DATE - poczatek > 15;

--9
SELECT s.stopien_id AS stopien_zaszeregowania, COUNT(DISTINCT pp.projekt_id) AS ilosc_projektow
FROM pracownik p
JOIN stopien s ON p.wynagordzenie BETWEEN s.min_wynagrodzenie AND s.max_wynagrodzenie
JOIN pracownik_projekt pp ON p.pracownik_id = pp.pracownik_id
JOIN projekt pr ON pp.projekt_id = pr.projekt_id
WHERE pr.koniec IS NOT NULL
GROUP BY s.stopien_id;

--10 - brak


DROP TABLE IF EXISTS dzial CASCADE;
DROP TABLE IF EXISTS pracownik CASCADE;
DROP TABLE IF EXISTS projekt CASCADE;
DROP TABLE IF EXISTS pracownik_projekt CASCADE;
DROP TABLE IF EXISTS stopien CASCADE;
