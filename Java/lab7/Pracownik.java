import java.time.LocalDate;

public class Pracownik extends Osoba implements ProfessionalDataFormatter {
    
    LocalDate data_zatrudnienia;

    public Pracownik(String imie, String nazwisko, String nr_telefonu, String e_mail, LocalDate data_urodzenia, Adress adres, LocalDate data_zatrudnienia){
        super(imie, nazwisko, nr_telefonu, e_mail, data_urodzenia, adres);
        this.data_zatrudnienia = LocalDate.of(data_zatrudnienia.getYear(), data_zatrudnienia.getMonth(), data_zatrudnienia.getDayOfMonth());

    }

    public String getFormattedProfessionalData(){
        return this.imie + " " + this.nazwisko + "\n" + this.adres.getFormattedAdress() + "\n" + "Zatrudniony od: " + this.data_zatrudnienia.toString();
    }

    public double getPensja() {return 0.0;}
}
