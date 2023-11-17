import java.io.*;
import java.util.ArrayList;

public class Czytelnik{
    public int czytelnik_id;
    public String imie;
    public String nazwisko;
    public String nr_telefonu;
    public String e_mail;
    public ArrayList<Ksiazka> wypozyczone_ksiazki = new ArrayList<Ksiazka>();
    public String ulica;
    public String dom;
    public String miekszanie;
    public String miasto;

    public Czytelnik(int czytelnik_id, String imie, String nazwisko, String nr_telefonu, String e_mail, String ulica, String dom, String miekszanie, String miasto){
        this.czytelnik_id = czytelnik_id;
        this.imie = imie;
        this.nazwisko = nazwisko;
        this.nr_telefonu = nr_telefonu;
        this.e_mail = e_mail;
        this.ulica = ulica;
        this.dom = dom;
        this.miekszanie = miekszanie;
        this.miasto = miasto;
    }


    public void zapisz(String sciezka){
        try {
            Writer f = new BufferedWriter(new FileWriter(sciezka, true));
            f.append("Czytelnik: " + this.imie + " " + this.nazwisko + "\n");
            f.append("Adres: " + this.ulica + " " + this.dom + "/" + this.miekszanie + " " + this.miasto + "\n");
            f.append("Kontakt: " + this.nr_telefonu + " " + this.e_mail + "\n");
            f.append("Wypozyczone ksiazki: " + "\n");
            for(int i=0; i<this.wypozyczone_ksiazki.size(); i++){
                f.append(this.wypozyczone_ksiazki.get(i).tytul() + " " + this.wypozyczone_ksiazki.get(i).autor() + "\n");
            }
            f.append("\n");
            f.close();
        }
        catch(Throwable e){
            System.out.println("Blad odczytu pliku!");
        }
    }



}
