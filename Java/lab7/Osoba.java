import java.time.LocalDate;

public class Osoba {
    
    String imie;
    String nazwisko;
    String nr_telefonu;
    String e_mail;
    LocalDate data_urodzenia;
    Adress adres;

    public Osoba(String imie, String nazwisko, String nr_telefonu, String e_mail, LocalDate data_urodzenia, Adress adres){
        this.imie = new String(imie);
        this.nazwisko = new String(nazwisko);
        this.nr_telefonu = new String(nr_telefonu);
        this.e_mail = new String(e_mail);
        this.data_urodzenia = LocalDate.of(data_urodzenia.getYear(), data_urodzenia.getMonth(), data_urodzenia.getDayOfMonth());
        this.adres = adres;
    }

}
