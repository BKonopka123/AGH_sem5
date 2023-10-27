import java.time.LocalDate;

public class Czlowiek implements Cloneable{
    String imie;
    String nazwisko;
    LocalDate dataUrodzenia;
    public Czlowiek(String imie, String nazwisko, LocalDate dataUrodzenia){
        this.imie = imie;
        this.nazwisko = nazwisko;
        this.dataUrodzenia = dataUrodzenia;
    }

    @Override
    public Czlowiek clone() throws CloneNotSupportedException{
        return (Czlowiek) super.clone();
    }

    public boolean equals(Czlowiek cloned){
        if(cloned == null)
            return false;
        if(!this.imie.equals(cloned.imie)) 
            return false;
        if(!this.nazwisko.equals(cloned.nazwisko)) 
            return false;
        if(!this.dataUrodzenia.equals(cloned.dataUrodzenia)) 
            return false;
        return true;
    }
}