import java.util.Date;

public class Czlowiek implements Cloneable{
    String imie;
    String nazwisko;
    final Date dataUrodzenia;

    public Czlowiek(String imie, String nazwisko, Date dataUrodzenia){
        this(imie, nazwisko, dataUrodzenia, false);
    }

    private Czlowiek(String imie, String nazwisko, Date dataUrodzenia, boolean extra_variable){
        this.imie = imie;
        this.nazwisko = nazwisko;
        this.dataUrodzenia = new Date(dataUrodzenia.getTime());
    }

    public void changedU(Date newdate){
        this.dataUrodzenia.setTime(newdate.getTime());
    }

    public Czlowiek clone() throws CloneNotSupportedException{
        Czlowiek to_return = new Czlowiek(this.imie, this.nazwisko, this.dataUrodzenia, false);
        return to_return;
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

    public void printCzlowiek(){
        System.out.println(this.imie + " " + this.nazwisko + " " + this.dataUrodzenia);
    }
}