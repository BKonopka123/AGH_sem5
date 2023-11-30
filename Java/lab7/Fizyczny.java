import java.time.LocalDate;

public class Fizyczny extends Pracownik{

    double pensja_bazowa;

    public Fizyczny(String imie, String nazwisko, String nr_telefonu, String e_mail, LocalDate data_urodzenia, Adress adres, LocalDate data_zatrudnienia, double pensja_bazowa){
        super(imie, nazwisko, nr_telefonu, e_mail, data_urodzenia, adres, data_zatrudnienia);
        this.pensja_bazowa = pensja_bazowa;
    }

    public double getPensja(){
        return this.pensja_bazowa + (2023-this.data_zatrudnienia.getYear()) * 500;
    }
    
    public String toString(){
        return this.getFormattedProfessionalData() + "\n" + "Wynagrodzenie: " + this.getPensja() + "\n";
    }
}
