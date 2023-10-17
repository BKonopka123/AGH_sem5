create table ksiazki
(ksiazka_id  serial,	
autor varchar(32) not null, 
tytul varchar(32) not null,
cena numeric(7,2) not null,
rok_wydania int not null,
ilosc_egzemplarzy int check (ilosc_egzemplarzy >0),
dzial varchar(32)
);
insert into ksiazki(autor, tytul, cena, rok_wydania, ilosc_egzemplarzy, dzial) values ('Adam Malysz', 'aaaa', 100, 2002, 1000, 'fantastyka');
insert into ksiazki(autor, tytul, cena, rok_wydania, ilosc_egzemplarzy, dzial) values ('Wojciech Cejerowski', 'bbb', 120, 1997, 2000, 'fantastyka');
insert into ksiazki(autor, tytul, cena, rok_wydania, ilosc_egzemplarzy, dzial) values ('Jan Kowalski', 'ccc', 150, 2013, 2000, 'fantastyka');
insert into ksiazki(autor, tytul, cena, rok_wydania, ilosc_egzemplarzy, dzial) values ('Jan Nowak', 'ddd', 80, 1985, 4000, 'fantastyka');
insert into ksiazki(autor, tytul, cena, rok_wydania, ilosc_egzemplarzy, dzial) values ('Adam Malysz', 'eeee', 120, 1811, 300, 'horror');
insert into ksiazki(autor, tytul, cena, rok_wydania, ilosc_egzemplarzy, dzial) values ('Wojciech Cejerowski', 'ffff', 110, 2007, 2500, 'horror');
insert into ksiazki(autor, tytul, cena, rok_wydania, ilosc_egzemplarzy, dzial) values ('Jan Kowalski', 'ggggg', 115, 2015, 200, 'horror');
insert into ksiazki(autor, tytul, cena, rok_wydania, ilosc_egzemplarzy, dzial) values ('Jan Nowak', 'hhhh', 40, 1986, 100, 'horror');
insert into ksiazki(autor, tytul, cena, rok_wydania, ilosc_egzemplarzy, dzial) values ('Adam Malysz', 'iiiiiii', 25, 1999, 250, 'kryminalne');
insert into ksiazki(autor, tytul, cena, rok_wydania, ilosc_egzemplarzy, dzial) values ('Wojciech Cejerowski', 'jjjj', 48, 1916,400, 'kryminalne');
insert into ksiazki(autor, tytul, cena, rok_wydania, ilosc_egzemplarzy, dzial) values ('Jan Kowalski', 'kkkkkk', 49, 2005, 550, 'kryminalne');
insert into ksiazki(autor, tytul, cena, rok_wydania, ilosc_egzemplarzy, dzial) values ('Jan Nowak', 'llll', 40, 2002, 420, 'kryminalne');
insert into ksiazki(autor, tytul, cena, rok_wydania, ilosc_egzemplarzy) values ('Jan Nowak', 'mmmmmmm', 80, 2002, 900);
insert into ksiazki(autor, tytul, cena, rok_wydania, ilosc_egzemplarzy) values ('Jan Nowak', 'nnnnn', 205, 1920, 250);
insert into ksiazki(autor, tytul, cena, rok_wydania, ilosc_egzemplarzy) values ('Jan Nowak', 'ooooo', 190, 1918, 700);
SELECT dzial, autor, tytul FROM ksiazki ORDER BY dzial, autor, tytul;
SELECT * FROM ksiazki WHERE dzial IS NULL;
SELECT * FROM ksiazki WHERE autor IN ('Adam Malysz');
SELECT autor FROM ksiazki ORDER BY autor;
UPDATE ksiazki SET cena = cena-cena*0.1 WHERE dzial = 'horror';
SELECT tytul, autor FROM ksiazki WHERE rok_wydania IN (2002, 2005);
DELETE FROM ksiazki WHERE (rok_wydania<2000);
