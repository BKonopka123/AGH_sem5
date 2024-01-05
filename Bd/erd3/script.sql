--Tworzenie schematu i tabel
CREATE SCHEMA Pilka_nozna;

CREATE TABLE Pilka_nozna.Druzyna(
                druzyna_id SERIAL,
                nazwa VARCHAR NOT NULL,
                data_zalozenia DATE NOT NULL,
                miasto VARCHAR NOT NULL,
                punkty INTEGER DEFAULT 0,
                CONSTRAINT druzyna_pk PRIMARY KEY (druzyna_id)
);

CREATE TABLE Pilka_nozna.Mecz(
                mecz_id SERIAL,
                druzyna_gospodarze INTEGER NOT NULL,
                druzyna_przyjezdni INTEGER NOT NULL,
                data_meczu DATE NOT NULL,
                czerwone_ilosc INTEGER DEFAULT 0,
                bramki_gospodarzy INTEGER DEFAULT 0,
                bramki_przyjezdnych INTEGER DEFAULT 0,
                wynik VARCHAR DEFAULT NULL,
                CONSTRAINT mecz_pk PRIMARY KEY (mecz_id)
);

CREATE TABLE Pilka_nozna.Zawodnik(
                zawodnik_id SERIAL,
                druzyna_id INTEGER NOT NULL,
                imie VARCHAR NOT NULL,
                nazwisko VARCHAR NOT NULL,
                numer INTEGER NOT NULL,
                pozycja VARCHAR NOT NULL,
                strzelone_bramki INTEGER DEFAULT 0,
                czy_czerwona BOOLEAN DEFAULT FALSE NOT NULL,
                CONSTRAINT zawodnik_pk PRIMARY KEY (zawodnik_id)
);

CREATE TABLE Pilka_nozna.Czerwona_kartka(
                czerwona_kartka_id SERIAL,
                zawodnik_id INTEGER NOT NULL,
                mecz_id INTEGER NOT NULL,
                CONSTRAINT czerwona_kartka_pk PRIMARY KEY (czerwona_kartka_id)
);

CREATE TABLE Pilka_nozna.Bramka(
                bramka_id SERIAL,
                zawodnik_id INTEGER NOT NULL,
                mecz_id INTEGER NOT NULL,
                CONSTRAINT bramka_pk PRIMARY KEY (bramka_id)
);

ALTER TABLE Pilka_nozna.Zawodnik ADD CONSTRAINT Druzyna_Zawodnik_fk
FOREIGN KEY (druzyna_id)
REFERENCES Pilka_nozna.Druzyna (druzyna_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Pilka_nozna.Mecz ADD CONSTRAINT Druzyna_Mecz_fk
FOREIGN KEY (druzyna_gospodarze)
REFERENCES Pilka_nozna.Druzyna (druzyna_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Pilka_nozna.Mecz ADD CONSTRAINT Druzyna_Mecz_fk1
FOREIGN KEY (druzyna_przyjezdni)
REFERENCES Pilka_nozna.Druzyna (druzyna_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Pilka_nozna.Bramka ADD CONSTRAINT Mecz_Bramka_fk
FOREIGN KEY (mecz_id)
REFERENCES Pilka_nozna.Mecz (mecz_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Pilka_nozna.Czerwona_kartka ADD CONSTRAINT Mecz_Czerwona_kartka_fk
FOREIGN KEY (mecz_id)
REFERENCES Pilka_nozna.Mecz (mecz_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Pilka_nozna.Bramka ADD CONSTRAINT Zawodnik_Bramka_fk
FOREIGN KEY (zawodnik_id)
REFERENCES Pilka_nozna.Zawodnik (zawodnik_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Pilka_nozna.Czerwona_kartka ADD CONSTRAINT Zawodnik_Czerwona_kartka_fk
FOREIGN KEY (zawodnik_id)
REFERENCES Pilka_nozna.Zawodnik (zawodnik_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Tworzenie funkcji i tryggerow
CREATE OR REPLACE FUNCTION Pilka_nozna.add_wynik_function() RETURNS TRIGGER AS 
$$
BEGIN
    IF NEW.wynik = 'wygrana gospodarzy' THEN
        UPDATE Pilka_nozna.Druzyna
        SET punkty = punkty + 3
        WHERE druzyna_id = NEW.druzyna_gospodarze;
    ELSIF NEW.wynik = 'wygrana przyjezdnych' THEN
        UPDATE Pilka_nozna.Druzyna
        SET punkty = punkty + 3
        WHERE druzyna_id = NEW.druzyna_przyjezdni;
    ELSEIF NEW.wynik = 'remis' THEN
        UPDATE Pilka_nozna.Druzyna
        SET punkty = punkty + 1
        WHERE druzyna_id = NEW.druzyna_gospodarze;
        UPDATE Pilka_nozna.Druzyna
        SET punkty = punkty + 1
        WHERE druzyna_id = NEW.druzyna_przyjezdni;
    END IF;
    RETURN NEW;
END;
$$ 
LANGUAGE 'plpgsql';

CREATE TRIGGER add_wynik_trigger BEFORE UPDATE ON Pilka_nozna.Mecz
FOR EACH ROW EXECUTE PROCEDURE Pilka_nozna.add_wynik_function();

CREATE OR REPLACE FUNCTION Pilka_nozna.add_gol_function() RETURNS TRIGGER AS 
$$
BEGIN
    IF (SELECT druzyna_id FROM Pilka_nozna.Zawodnik WHERE zawodnik_id = NEW.zawodnik_id) = (SELECT druzyna_gospodarze FROM Pilka_nozna.Mecz WHERE mecz_id=NEW.mecz_id) THEN
        UPDATE Pilka_nozna.Mecz
        SET bramki_gospodarzy = bramki_gospodarzy + 1
        WHERE mecz_id = NEW.mecz_id;
        UPDATE Pilka_nozna.Zawodnik
        SET strzelone_bramki = strzelone_bramki + 1
        WHERE zawodnik_id = NEW.zawodnik_id;
    ELSE
        UPDATE Pilka_nozna.Mecz
        SET bramki_przyjezdnych = bramki_przyjezdnych + 1
        WHERE mecz_id = NEW.mecz_id;
        UPDATE Pilka_nozna.Zawodnik
        SET strzelone_bramki = strzelone_bramki + 1
        WHERE zawodnik_id = NEW.zawodnik_id;
    END IF;
    RETURN NEW;
END;
$$ 
LANGUAGE 'plpgsql';

CREATE TRIGGER add_gol_trigger BEFORE INSERT OR UPDATE ON Pilka_nozna.Bramka
FOR EACH ROW EXECUTE PROCEDURE Pilka_nozna.add_gol_function();

CREATE OR REPLACE FUNCTION Pilka_nozna.add_kartka_function() RETURNS TRIGGER AS 
$$
BEGIN
    UPDATE Pilka_nozna.Mecz
    SET czerwone_ilosc = czerwone_ilosc + 1
    WHERE mecz_id = NEW.mecz_id;
    UPDATE Pilka_nozna.Zawodnik
    SET czy_czerwona = TRUE
    WHERE zawodnik_id = NEW.zawodnik_id;
    RETURN NEW;
END;
$$ 
LANGUAGE 'plpgsql';

CREATE TRIGGER add_kartka_trigger BEFORE INSERT OR UPDATE ON Pilka_nozna.Czerwona_kartka
FOR EACH ROW EXECUTE PROCEDURE Pilka_nozna.add_kartka_function();

--Wypelnienie tabel

INSERT INTO Pilka_nozna.Druzyna (nazwa, data_zalozenia, miasto) VALUES ('Legia Warszawa', '1916-03-01', 'Warszawa');
INSERT INTO Pilka_nozna.Druzyna (nazwa, data_zalozenia, miasto) VALUES ('Lech Poznan', '1922-03-01', 'Poznan');
INSERT INTO Pilka_nozna.Druzyna (nazwa, data_zalozenia, miasto) VALUES ('Wisla Krakow', '1906-03-01', 'Krakow');
INSERT INTO Pilka_nozna.Druzyna (nazwa, data_zalozenia, miasto) VALUES ('Cracovia', '1906-03-01', 'Krakow');

INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (1, 'Artur', 'Boruc', 1, 'bramkarz');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (1, 'Michal', 'Karbownik', 2, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (1, 'Mateusz', 'Wieteska', 3, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (1, 'Artur', 'Jedrzejczyk', 4, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (1, 'Igor', 'Lewczuk', 5, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (1, 'Domagoj', 'Antolic', 6, 'pomocnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (1, 'Andre', 'Martins', 7, 'pomocnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (1, 'Bartosz', 'Slisz', 8, 'pomocnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (1, 'Dominik', 'Nagya', 9, 'napastnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (1, 'Carlitos', 'Lopez', 10, 'napastnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (1, 'Luquinhas', 'Luquinhas', 11, 'napastnik');

INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (2, 'Mickey', 'van der Hart', 1, 'bramkarz');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (2, 'Tomasz', 'Dejewski', 2, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (2, 'Lukasz', 'Tralka', 3, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (2, 'Thomas', 'Rogne', 4, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (2, 'Tomasz', 'Kedziora', 5, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (2, 'Pedro', 'Tiba', 6, 'pomocnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (2, 'Michal', 'Skoras', 7, 'pomocnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (2, 'Filip', 'Marchwinski', 8, 'pomocnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (2, 'Christian', 'Gytkjaer', 9, 'napastnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (2, 'Jakub', 'Kubicki', 10, 'napastnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (2, 'Mikael', 'Ishak', 11, 'napastnik');

INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (3, 'Michal', 'Buchalik', 1, 'bramkarz');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (3, 'Bartosz', 'Bialek', 2, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (3, 'Maciej', 'Sadlok', 3, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (3, 'Maciej', 'Damski', 4, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (3, 'Michal', 'Koj', 5, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (3, 'Mateusz', 'Szwoch', 6, 'pomocnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (3, 'Michal', 'Mak', 7, 'pomocnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (3, 'Patryk', 'Klimala', 8, 'pomocnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (3, 'Jakub', 'Blaszczykowski', 9, 'napastnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (3, 'Vamara', 'Sanogo', 10, 'napastnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (3, 'Rafal', 'Boguski', 11, 'napastnik');

INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (4, 'Michal', 'Peskovic', 1, 'bramkarz');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (4, 'Michal', 'Helik', 2, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (4, 'Michal', 'Siplak', 3, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (4, 'Michal', 'Rafal', 4, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (4, 'Michal', 'Pietrzak', 5, 'obronca');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (4, 'Michal', 'Dimun', 6, 'pomocnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (4, 'Michal', 'Rakoczy', 7, 'pomocnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (4, 'Michal', 'Kazior', 8, 'pomocnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (4, 'Michal', 'Kobylanski', 9, 'napastnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (4, 'Michal', 'Peszko', 10, 'napastnik');
INSERT INTO Pilka_nozna.Zawodnik (druzyna_id, imie, nazwisko, numer, pozycja) VALUES (4, 'Michal', 'Zyro', 11, 'napastnik');

INSERT INTO Pilka_nozna.Mecz (druzyna_gospodarze, druzyna_przyjezdni, data_meczu) VALUES (1, 2, '2020-03-01');
INSERT INTO Pilka_nozna.Mecz (druzyna_gospodarze, druzyna_przyjezdni, data_meczu) VALUES (3, 4, '2020-03-02');
INSERT INTO Pilka_nozna.Mecz (druzyna_gospodarze, druzyna_przyjezdni, data_meczu) VALUES (1, 4, '2020-03-03');
INSERT INTO Pilka_nozna.Mecz (druzyna_gospodarze, druzyna_przyjezdni, data_meczu) VALUES (2, 3, '2020-03-04');
INSERT INTO Pilka_nozna.Mecz (druzyna_gospodarze, druzyna_przyjezdni, data_meczu) VALUES (1, 3, '2020-03-05');

INSERT INTO Pilka_nozna.Bramka (zawodnik_id, mecz_id) VALUES (9, 1);
INSERT INTO Pilka_nozna.Bramka (zawodnik_id, mecz_id) VALUES (10, 1);
INSERT INTO Pilka_nozna.Bramka (zawodnik_id, mecz_id) VALUES (19, 1);
INSERT INTO Pilka_nozna.Czerwona_kartka (zawodnik_id, mecz_id) VALUES (7, 1);
UPDATE Pilka_nozna.Mecz SET wynik = 'wygrana gospodarzy' WHERE mecz_id = 1;

INSERT INTO Pilka_nozna.Bramka (zawodnik_id, mecz_id) VALUES (44, 2);
UPDATE Pilka_nozna.Mecz SET wynik = 'wygrana przyjezdnych' WHERE mecz_id = 2;

INSERT INTO Pilka_nozna.Bramka (zawodnik_id, mecz_id) VALUES (43, 3);
INSERT INTO Pilka_nozna.Bramka (zawodnik_id, mecz_id) VALUES (10, 3);
INSERT INTO Pilka_nozna.Czerwona_kartka (zawodnik_id, mecz_id) VALUES (40, 3);
UPDATE Pilka_nozna.Mecz SET wynik = 'remis' WHERE mecz_id = 3;

INSERT INTO Pilka_nozna.Bramka (zawodnik_id, mecz_id) VALUES (19, 4);
INSERT INTO Pilka_nozna.Bramka (zawodnik_id, mecz_id) VALUES (30, 4);
INSERT INTO Pilka_nozna.Bramka (zawodnik_id, mecz_id) VALUES (27, 4);
INSERT INTO Pilka_nozna.Bramka (zawodnik_id, mecz_id) VALUES (31, 4);
INSERT INTO Pilka_nozna.Czerwona_kartka (zawodnik_id, mecz_id) VALUES (31, 4);
INSERT INTO Pilka_nozna.Czerwona_kartka (zawodnik_id, mecz_id) VALUES (18, 4);
UPDATE Pilka_nozna.Mecz SET wynik = 'wygrana przyjezdnych' WHERE mecz_id = 4;

UPDATE Pilka_nozna.Mecz SET wynik = 'remis' WHERE mecz_id = 5;

--Zapytania SELECT
SELECT mecz_id, data_meczu, wynik, druzyna_gospodarze, druzyna_przyjezdni, bramki_gospodarzy, bramki_przyjezdnych, czerwone_ilosc 
FROM Pilka_nozna.Mecz
ORDER BY mecz_id;

SELECT zawodnik_id, imie, nazwisko, numer, pozycja, strzelone_bramki, czy_czerwona
FROM Pilka_nozna.Zawodnik
ORDER BY zawodnik_id;

SELECT druzyna_id, nazwa, punkty
FROM Pilka_nozna.Druzyna
ORDER BY punkty DESC;

--Usuniecie danych
DROP SCHEMA Pilka_nozna CASCADE;



