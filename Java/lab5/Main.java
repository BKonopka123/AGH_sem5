public class Main {
    public static void main(String[] args) {

        Biblioteka biblio1 = new Biblioteka("Biblioteka1");
        biblio1.laduj_ksiazke("baza_ksiazek.txt");

        biblio1.wypisz_ksiazki();

        Czytelnik czytelnik1 = new Czytelnik(1, "Jan", "Kowalski", "123456789", "123@gmail.com", "ul. Kowalska", "1", "1", "Krakow");
        Czytelnik czytelnik2 = new Czytelnik(2, "Adam", "Nowak", "987654321", "345@gmail.com", "ul. Nowaka", "2", "2", "Warszawa");
        Czytelnik czytelnik3 = new Czytelnik(3, "Anna", "Kowalska", "123123123", "567@gmail.com", "ul. Kowalska", "3", "3", "Krakow");
        Czytelnik czytelnik4 = new Czytelnik(4, "Katarzyna", "Nowak", "321321321", "89@gmail.com", "ul. Nowaka", "4", "4", "Warszawa");

        biblio1.wypozycz(biblio1.ksiazki.get(0), czytelnik1);
        biblio1.wypozycz(biblio1.ksiazki.get(1), czytelnik1);
        biblio1.wypozycz(biblio1.ksiazki.get(2), czytelnik1);
        biblio1.wypozycz(biblio1.ksiazki.get(3), czytelnik2);
        biblio1.wypozycz(biblio1.ksiazki.get(4), czytelnik2);
        biblio1.wypozycz(biblio1.ksiazki.get(5), czytelnik3);
        biblio1.wypozycz(biblio1.ksiazki.get(6), czytelnik3);
        biblio1.wypozycz(biblio1.ksiazki.get(7), czytelnik4);
        biblio1.wypozycz(biblio1.ksiazki.get(8), czytelnik4);
        biblio1.wypozycz(biblio1.ksiazki.get(9), czytelnik4);

        czytelnik1.zapisz("raport.txt");
        czytelnik2.zapisz("raport.txt");
        czytelnik3.zapisz("raport.txt");
        czytelnik4.zapisz("raport.txt");
    }
}