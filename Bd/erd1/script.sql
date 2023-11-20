-- creating tables

CREATE SCHEMA Tramwaje;

CREATE TABLE Tramwaje.Przystanek (
                Przystanek_id SERIAL,
                nazwa_przystanku VARCHAR NOT NULL,
                CONSTRAINT Przystanek_id PRIMARY KEY (Przystanek_id)
);


CREATE TABLE Tramwaje.Linia (
                Linia_id SERIAL,
                kierunek_1 VARCHAR NOT NULL,
                kierunek_2 VARCHAR NOT NULL,
                CONSTRAINT linia_id PRIMARY KEY (Linia_id)
);


CREATE TABLE Tramwaje.Pojazd (
                Pojazd_id SERIAL,
                Linia_id INTEGER NOT NULL,
                CONSTRAINT Pojazd_id PRIMARY KEY (Pojazd_id)
);


CREATE TABLE Tramwaje.Odjazd (
                Odjazd_id SERIAL,
                Pojazd_id INTEGER NOT NULL,
                Przystanek_id INTEGER NOT NULL,
                godzina_odjazdu TIME NOT NULL,
                opoznienie TIME,
                dzien_tygodnia VARCHAR DEFAULT 'pon-sob' NOT NULL,
                CONSTRAINT Odjazd_id PRIMARY KEY (Odjazd_id)
);


ALTER TABLE Tramwaje.Odjazd ADD CONSTRAINT Przystanek_Odjazd_fk
FOREIGN KEY (Przystanek_id)
REFERENCES Tramwaje.Przystanek (Przystanek_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tramwaje.Pojazd ADD CONSTRAINT Linia_Pojazd_fk
FOREIGN KEY (Linia_id)
REFERENCES Tramwaje.Linia (Linia_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tramwaje.Odjazd ADD CONSTRAINT Pojazd_Odjazd_fk
FOREIGN KEY (Pojazd_id)
REFERENCES Tramwaje.Pojazd (Pojazd_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- filling out the tables

INSERT INTO Tramwaje.Przystanek(nazwa_przystanku) VALUES ('Bronowice Małe');
INSERT INTO Tramwaje.Przystanek(nazwa_przystanku) VALUES ('Czerwone Maki P+R');
INSERT INTO Tramwaje.Przystanek(nazwa_przystanku) VALUES ('Bronowice SKA');
INSERT INTO Tramwaje.Przystanek(nazwa_przystanku) VALUES ('Biprostal');
INSERT INTO Tramwaje.Przystanek(nazwa_przystanku) VALUES ('Krowodrza Górka P+R');
INSERT INTO Tramwaje.Przystanek(nazwa_przystanku) VALUES ('Nowy Kleparz');
INSERT INTO Tramwaje.Przystanek(nazwa_przystanku) VALUES ('Lipińskiego');
INSERT INTO Tramwaje.Przystanek(nazwa_przystanku) VALUES ('Rondo Grunwaldzkie');
INSERT INTO Tramwaje.Przystanek(nazwa_przystanku) VALUES ('Kawiory');
INSERT INTO Tramwaje.Przystanek(nazwa_przystanku) VALUES ('Chopina');

INSERT INTO Tramwaje.Linia(kierunek_1, kierunek_2) VALUES ('Bronowice Małe', 'Krowodrza Górka P+R');
INSERT INTO Tramwaje.Linia(kierunek_1, kierunek_2) VALUES ('Bronowice Małe', 'Nowy Kleparz');
INSERT INTO Tramwaje.Linia(kierunek_1, kierunek_2) VALUES ('Krowodrza Górka P+R', 'Czerwone Maki P+R');
INSERT INTO Tramwaje.Linia(kierunek_1, kierunek_2) VALUES ('Nowy Kleparz', 'Czerwone Maki P+R');

INSERT INTO Tramwaje.Pojazd(Linia_id) VALUES (1);
INSERT INTO Tramwaje.Pojazd(Linia_id) VALUES (1);
INSERT INTO Tramwaje.Pojazd(Linia_id) VALUES (1);
INSERT INTO Tramwaje.Pojazd(Linia_id) VALUES (1);
INSERT INTO Tramwaje.Pojazd(Linia_id) VALUES (2);
INSERT INTO Tramwaje.Pojazd(Linia_id) VALUES (2);
INSERT INTO Tramwaje.Pojazd(Linia_id) VALUES (2);
INSERT INTO Tramwaje.Pojazd(Linia_id) VALUES (2);
INSERT INTO Tramwaje.Pojazd(Linia_id) VALUES (3);
INSERT INTO Tramwaje.Pojazd(Linia_id) VALUES (3);
INSERT INTO Tramwaje.Pojazd(Linia_id) VALUES (3);
INSERT INTO Tramwaje.Pojazd(Linia_id) VALUES (3);
INSERT INTO Tramwaje.Pojazd(Linia_id) VALUES (4);
INSERT INTO Tramwaje.Pojazd(Linia_id) VALUES (4);

INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu) VALUES (1, 1, '07:00');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, opoznienie) VALUES (2, 1, '10:30', '00:00:03');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, dzien_tygodnia) VALUES (5, 1, '11:00', 'niedz-sw');

INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu) VALUES (9, 2, '08:20');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, opoznienie) VALUES (13, 2, '17:00', '00:00:02');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, dzien_tygodnia) VALUES (10, 2, '13:00', 'niedz-sw');

INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu) VALUES (3, 3, '09:00');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, opoznienie) VALUES (4, 3, '11:40', '00:00:03');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, dzien_tygodnia) VALUES (6, 3, '15:55', 'niedz-sw');

INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu) VALUES (7, 4, '10:25');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, opoznienie) VALUES (8, 4, '19:10', '00:00:01');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, dzien_tygodnia) VALUES (11, 4, '09:00', 'niedz-sw');

INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu) VALUES (12, 5, '11:00');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, opoznienie) VALUES (14, 5, '20:10', '00:00:01');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, dzien_tygodnia) VALUES (1, 5, '10:00', 'niedz-sw');

INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu) VALUES (6, 6, '12:00');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, opoznienie) VALUES (13, 6, '19:15', '00:00:05');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, dzien_tygodnia) VALUES (4, 6, '11:00', 'niedz-sw');

INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu) VALUES (5, 7, '13:00');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, opoznienie) VALUES (6, 7, '22:00', '00:00:15');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, dzien_tygodnia) VALUES (7, 7, '12:00', 'niedz-sw');

INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu) VALUES (8, 8, '14:00');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, opoznienie) VALUES (9, 8, '23:00', '00:00:02');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, dzien_tygodnia) VALUES (10, 8, '13:00', 'niedz-sw');

INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu) VALUES (11, 9, '15:00');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, opoznienie) VALUES (12, 9, '00:00', '00:00:07');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, dzien_tygodnia) VALUES (13, 9, '14:00', 'niedz-sw');

INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu) VALUES (14, 10, '16:00');
INSERT INTO Tramwaje.Odjazd(Pojazd_id, Przystanek_id, godzina_odjazdu, dzien_tygodnia) VALUES (1, 10, '15:00', 'niedz-sw');

-- Selects

SELECT m.linia_id FROM (Tramwaje.Przystanek p JOIN Tramwaje.Odjazd o ON p.Przystanek_id = o.Przystanek_id) JOIN Tramwaje.Pojazd m ON o.Pojazd_id = m.Pojazd_id WHERE p.nazwa_przystanku = 'Czerwone Maki P+R' GROUP BY m.linia_id;
SELECT o.godzina_odjazdu FROM (Tramwaje.Przystanek p JOIN Tramwaje.Odjazd o ON p.Przystanek_id = o.Przystanek_id) JOIN Tramwaje.Pojazd m ON o.Pojazd_id = m.Pojazd_id WHERE p.nazwa_przystanku = 'Czerwone Maki P+R' AND m.Linia_id = 3;
SELECT o.Przystanek_id, o.godzina_odjazdu FROM (Tramwaje.Linia l JOIN Tramwaje.Pojazd m ON l.linia_id = m.linia_id) JOIN Tramwaje.Odjazd o ON m.Pojazd_id = o.Pojazd_id WHERE l.linia_id = 2 ORDER BY o.Przystanek_id;
